.class public Lcom/stv/signalcommon/ChannelManager;
.super Ljava/lang/Object;
.source "ChannelManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/stv/signalcommon/ChannelManager$EnumDTVAudioType;,
        Lcom/stv/signalcommon/ChannelManager$EnumDTVAudioChannel;,
        Lcom/stv/signalcommon/ChannelManager$ColorSystem;,
        Lcom/stv/signalcommon/ChannelManager$SoundSystem;,
        Lcom/stv/signalcommon/ChannelManager$ScanInfo;,
        Lcom/stv/signalcommon/ChannelManager$MyHandler;,
        Lcom/stv/signalcommon/ChannelManager$AudioTrack;,
        Lcom/stv/signalcommon/ChannelManager$Subtitle;
    }
.end annotation


# static fields
.field private static ATV_EVENTINTERVAL:I = 0x0

.field private static ATV_MAX_FREQ:I = 0x0

.field private static ATV_MIN_FREQ:I = 0x0

.field private static final TAG:Ljava/lang/String; = "ChannelManager"

.field public static final UHF_MAX:I

.field public static final UHF_MIN:I = 0x730d2

.field public static final VHF_H_MAX:I = 0x730d2

.field public static final VHF_H_MIN:I = 0x271fa

.field public static final VHF_L_MAX:I = 0x271fa

.field public static final VHF_L_MIN:I


# instance fields
.field private colorSystemTypeList:[Lcom/stv/signalcommon/ChannelManager$ColorSystem;

.field private currentChannelProgress:I

.field private mAppObj:Landroid/content/Context;

.field private myHandler:Lcom/stv/signalcommon/ChannelManager$MyHandler;

.field private scanHandler:Landroid/os/Handler;

.field private serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

.field private soundSystemTypeList:[Lcom/stv/signalcommon/ChannelManager$SoundSystem;


# direct methods
.method static synthetic -get0()I
    .registers 1

    sget v0, Lcom/stv/signalcommon/ChannelManager;->ATV_MAX_FREQ:I

    return v0
.end method

.method static synthetic -get1(Lcom/stv/signalcommon/ChannelManager;)Landroid/os/Handler;
    .registers 2

    iget-object v0, p0, Lcom/stv/signalcommon/ChannelManager;->scanHandler:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic -get2(Lcom/stv/signalcommon/ChannelManager;)Lcom/mstar/tvsettingservice/TvDeskProvider;
    .registers 2

    iget-object v0, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 51
    const v0, 0xbc7a

    sput v0, Lcom/stv/signalcommon/ChannelManager;->ATV_MIN_FREQ:I

    .line 52
    const v0, 0xd2c12

    sput v0, Lcom/stv/signalcommon/ChannelManager;->ATV_MAX_FREQ:I

    .line 54
    sget v0, Lcom/stv/signalcommon/ChannelManager;->ATV_MIN_FREQ:I

    sput v0, Lcom/stv/signalcommon/ChannelManager;->VHF_L_MIN:I

    .line 59
    sget v0, Lcom/stv/signalcommon/ChannelManager;->ATV_MAX_FREQ:I

    sput v0, Lcom/stv/signalcommon/ChannelManager;->UHF_MAX:I

    .line 61
    const v0, 0x7a120

    sput v0, Lcom/stv/signalcommon/ChannelManager;->ATV_EVENTINTERVAL:I

    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/stv/signalcommon/DeskProvider;)V
    .registers 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "provider"    # Lcom/stv/signalcommon/DeskProvider;

    .prologue
    const/4 v1, 0x0

    const/4 v9, 0x3

    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 204
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    iput-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    .line 63
    iput-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->myHandler:Lcom/stv/signalcommon/ChannelManager$MyHandler;

    .line 64
    iput-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->scanHandler:Landroid/os/Handler;

    .line 65
    iput-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    .line 123
    const/16 v1, 0x8

    new-array v1, v1, [Lcom/stv/signalcommon/ChannelManager$ColorSystem;

    .line 124
    new-instance v2, Lcom/stv/signalcommon/ChannelManager$ColorSystem;

    sget-object v3, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->PAL_BGHI:Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    const-string/jumbo v4, "PAL"

    invoke-direct {v2, p0, v6, v3, v4}, Lcom/stv/signalcommon/ChannelManager$ColorSystem;-><init>(Lcom/stv/signalcommon/ChannelManager;ILcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;Ljava/lang/String;)V

    aput-object v2, v1, v6

    .line 125
    new-instance v2, Lcom/stv/signalcommon/ChannelManager$ColorSystem;

    sget-object v3, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->NTSC_M:Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    const-string/jumbo v4, "NTSC"

    invoke-direct {v2, p0, v7, v3, v4}, Lcom/stv/signalcommon/ChannelManager$ColorSystem;-><init>(Lcom/stv/signalcommon/ChannelManager;ILcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;Ljava/lang/String;)V

    aput-object v2, v1, v7

    .line 126
    new-instance v2, Lcom/stv/signalcommon/ChannelManager$ColorSystem;

    sget-object v3, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->NTSC_44:Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    const-string/jumbo v4, "NTSC_44"

    invoke-direct {v2, p0, v8, v3, v4}, Lcom/stv/signalcommon/ChannelManager$ColorSystem;-><init>(Lcom/stv/signalcommon/ChannelManager;ILcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;Ljava/lang/String;)V

    aput-object v2, v1, v8

    .line 127
    new-instance v2, Lcom/stv/signalcommon/ChannelManager$ColorSystem;

    sget-object v3, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->PAL_M:Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    const-string/jumbo v4, "PAL_M"

    invoke-direct {v2, p0, v9, v3, v4}, Lcom/stv/signalcommon/ChannelManager$ColorSystem;-><init>(Lcom/stv/signalcommon/ChannelManager;ILcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;Ljava/lang/String;)V

    aput-object v2, v1, v9

    .line 128
    new-instance v2, Lcom/stv/signalcommon/ChannelManager$ColorSystem;

    sget-object v3, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->PAL_N:Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    const-string/jumbo v4, "PAL_N"

    const/4 v5, 0x4

    invoke-direct {v2, p0, v5, v3, v4}, Lcom/stv/signalcommon/ChannelManager$ColorSystem;-><init>(Lcom/stv/signalcommon/ChannelManager;ILcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;Ljava/lang/String;)V

    const/4 v3, 0x4

    aput-object v2, v1, v3

    .line 129
    new-instance v2, Lcom/stv/signalcommon/ChannelManager$ColorSystem;

    sget-object v3, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->PAL_60:Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    const-string/jumbo v4, "PAL_60"

    const/4 v5, 0x5

    invoke-direct {v2, p0, v5, v3, v4}, Lcom/stv/signalcommon/ChannelManager$ColorSystem;-><init>(Lcom/stv/signalcommon/ChannelManager;ILcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;Ljava/lang/String;)V

    const/4 v3, 0x5

    aput-object v2, v1, v3

    .line 130
    new-instance v2, Lcom/stv/signalcommon/ChannelManager$ColorSystem;

    sget-object v3, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->SECAM:Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    const-string/jumbo v4, "SECAM"

    const/4 v5, 0x6

    invoke-direct {v2, p0, v5, v3, v4}, Lcom/stv/signalcommon/ChannelManager$ColorSystem;-><init>(Lcom/stv/signalcommon/ChannelManager;ILcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;Ljava/lang/String;)V

    const/4 v3, 0x6

    aput-object v2, v1, v3

    .line 131
    new-instance v2, Lcom/stv/signalcommon/ChannelManager$ColorSystem;

    sget-object v3, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->AUTO:Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    const-string/jumbo v4, "AUTO"

    const/4 v5, 0x7

    invoke-direct {v2, p0, v5, v3, v4}, Lcom/stv/signalcommon/ChannelManager$ColorSystem;-><init>(Lcom/stv/signalcommon/ChannelManager;ILcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;Ljava/lang/String;)V

    const/4 v3, 0x7

    aput-object v2, v1, v3

    .line 123
    iput-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->colorSystemTypeList:[Lcom/stv/signalcommon/ChannelManager$ColorSystem;

    .line 146
    const/4 v1, 0x4

    new-array v1, v1, [Lcom/stv/signalcommon/ChannelManager$SoundSystem;

    .line 147
    new-instance v2, Lcom/stv/signalcommon/ChannelManager$SoundSystem;

    sget-object v3, Lcom/mstar/android/tvapi/common/vo/AtvSystemStandard$EnumAtvSystemStandard;->E_BG:Lcom/mstar/android/tvapi/common/vo/AtvSystemStandard$EnumAtvSystemStandard;

    const-string/jumbo v4, "BG"

    invoke-direct {v2, p0, v6, v3, v4}, Lcom/stv/signalcommon/ChannelManager$SoundSystem;-><init>(Lcom/stv/signalcommon/ChannelManager;ILcom/mstar/android/tvapi/common/vo/AtvSystemStandard$EnumAtvSystemStandard;Ljava/lang/String;)V

    aput-object v2, v1, v6

    .line 148
    new-instance v2, Lcom/stv/signalcommon/ChannelManager$SoundSystem;

    sget-object v3, Lcom/mstar/android/tvapi/common/vo/AtvSystemStandard$EnumAtvSystemStandard;->E_DK:Lcom/mstar/android/tvapi/common/vo/AtvSystemStandard$EnumAtvSystemStandard;

    const-string/jumbo v4, "DK"

    invoke-direct {v2, p0, v7, v3, v4}, Lcom/stv/signalcommon/ChannelManager$SoundSystem;-><init>(Lcom/stv/signalcommon/ChannelManager;ILcom/mstar/android/tvapi/common/vo/AtvSystemStandard$EnumAtvSystemStandard;Ljava/lang/String;)V

    aput-object v2, v1, v7

    .line 149
    new-instance v2, Lcom/stv/signalcommon/ChannelManager$SoundSystem;

    sget-object v3, Lcom/mstar/android/tvapi/common/vo/AtvSystemStandard$EnumAtvSystemStandard;->E_I:Lcom/mstar/android/tvapi/common/vo/AtvSystemStandard$EnumAtvSystemStandard;

    const-string/jumbo v4, "I"

    invoke-direct {v2, p0, v8, v3, v4}, Lcom/stv/signalcommon/ChannelManager$SoundSystem;-><init>(Lcom/stv/signalcommon/ChannelManager;ILcom/mstar/android/tvapi/common/vo/AtvSystemStandard$EnumAtvSystemStandard;Ljava/lang/String;)V

    aput-object v2, v1, v8

    .line 150
    new-instance v2, Lcom/stv/signalcommon/ChannelManager$SoundSystem;

    sget-object v3, Lcom/mstar/android/tvapi/common/vo/AtvSystemStandard$EnumAtvSystemStandard;->E_M:Lcom/mstar/android/tvapi/common/vo/AtvSystemStandard$EnumAtvSystemStandard;

    const-string/jumbo v4, "M"

    invoke-direct {v2, p0, v9, v3, v4}, Lcom/stv/signalcommon/ChannelManager$SoundSystem;-><init>(Lcom/stv/signalcommon/ChannelManager;ILcom/mstar/android/tvapi/common/vo/AtvSystemStandard$EnumAtvSystemStandard;Ljava/lang/String;)V

    aput-object v2, v1, v9

    .line 146
    iput-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->soundSystemTypeList:[Lcom/stv/signalcommon/ChannelManager$SoundSystem;

    .line 205
    iput-object p1, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    .line 206
    iput-object p2, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    .line 207
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v1}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v0

    .line 208
    .local v0, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    invoke-interface {v0, p1}, Lcom/mstar/tvsettingservice/ChannelDesk;->setContext(Landroid/content/Context;)V

    .line 204
    return-void
.end method

.method private setDtmbFreq(I)V
    .registers 7
    .param p1, "frequency"    # I

    .prologue
    .line 416
    const-string/jumbo v2, "ChannelManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "setDtmbFreq ---> frequency:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 417
    iget-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v2}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v1

    .line 418
    .local v1, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    invoke-interface {v1, p1}, Lcom/mstar/tvsettingservice/ChannelDesk;->dtvManualScanFreq(I)Z

    move-result v0

    .line 419
    .local v0, "isSuccess":Z
    const-string/jumbo v2, "ChannelManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "setDtmbFreq ---> isSuccess:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 415
    return-void
.end method


# virtual methods
.method public autoScanStart(Landroid/os/Handler;)V
    .registers 7
    .param p1, "handler"    # Landroid/os/Handler;

    .prologue
    .line 309
    iput-object p1, p0, Lcom/stv/signalcommon/ChannelManager;->scanHandler:Landroid/os/Handler;

    .line 310
    new-instance v2, Lcom/stv/signalcommon/ChannelManager$MyHandler;

    invoke-direct {v2, p0}, Lcom/stv/signalcommon/ChannelManager$MyHandler;-><init>(Lcom/stv/signalcommon/ChannelManager;)V

    iput-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->myHandler:Lcom/stv/signalcommon/ChannelManager$MyHandler;

    .line 311
    iget-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v2}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getCommonManagerInstance()Lcom/mstar/tvsettingservice/CommonDesk;

    move-result-object v2

    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->myHandler:Lcom/stv/signalcommon/ChannelManager$MyHandler;

    const/4 v4, 0x1

    invoke-interface {v2, v3, v4}, Lcom/mstar/tvsettingservice/CommonDesk;->setHandler(Landroid/os/Handler;I)Z

    .line 312
    iget-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v2}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getDataBaseManagerInstance()Lcom/mstar/tvsettingservice/DataBaseDesk;

    move-result-object v2

    invoke-interface {v2}, Lcom/mstar/tvsettingservice/DataBaseDesk;->openDB()V

    .line 314
    iget-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v2}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v1

    .line 315
    .local v1, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    iget-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v2}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v2

    if-eqz v2, :cond_47

    .line 320
    sget-object v0, Lcom/mstar/tvsettingservice/DtvInterface$EN_ANTENNA_TYPE;->E_ROUTE_DTMB:Lcom/mstar/tvsettingservice/DtvInterface$EN_ANTENNA_TYPE;

    .line 321
    .local v0, "antennaType":Lcom/mstar/tvsettingservice/DtvInterface$EN_ANTENNA_TYPE;
    invoke-interface {v1, v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->dtvSetAntennaType(Lcom/mstar/tvsettingservice/DtvInterface$EN_ANTENNA_TYPE;)V

    .line 322
    sget-object v2, Lcom/mstar/tvsettingservice/DtvInterface$EN_ANTENNA_TYPE;->E_ROUTE_DTMB:Lcom/mstar/tvsettingservice/DtvInterface$EN_ANTENNA_TYPE;

    invoke-virtual {v2}, Lcom/mstar/tvsettingservice/DtvInterface$EN_ANTENNA_TYPE;->ordinal()I

    move-result v2

    int-to-short v2, v2

    invoke-interface {v1, v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->switchMSrvDtvRouteCmd(S)Z

    .line 323
    invoke-interface {v1}, Lcom/mstar/tvsettingservice/ChannelDesk;->dtvAutoScan()Z

    .line 308
    .end local v0    # "antennaType":Lcom/mstar/tvsettingservice/DtvInterface$EN_ANTENNA_TYPE;
    :goto_46
    return-void

    .line 326
    :cond_47
    sget v2, Lcom/stv/signalcommon/ChannelManager;->ATV_EVENTINTERVAL:I

    sget v3, Lcom/stv/signalcommon/ChannelManager;->ATV_MIN_FREQ:I

    sget v4, Lcom/stv/signalcommon/ChannelManager;->ATV_MAX_FREQ:I

    invoke-interface {v1, v2, v3, v4}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetAutoTuningStart(III)Z

    goto :goto_46
.end method

.method public autoScanStop()V
    .registers 5

    .prologue
    const/4 v3, 0x1

    .line 331
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->scanHandler:Landroid/os/Handler;

    .line 332
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v1}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v0

    .line 333
    .local v0, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Lcom/mstar/tvsettingservice/ChannelDesk;->setChannelChangeFreezeMode(Z)V

    .line 334
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->GetTsStatus()Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    move-result-object v1

    sget-object v2, Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;->E_TS_NONE:Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    if-eq v1, v2, :cond_3c

    .line 335
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v1}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v1

    if-eqz v1, :cond_40

    .line 336
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->DtvStopScan()Z

    .line 337
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->makeSourceDtv()V

    .line 338
    sget-object v1, Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceInputType;->E_FIRST_SERVICE_DTV:Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceInputType;

    sget-object v2, Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceType;->E_DEFAULT:Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceType;

    invoke-interface {v0, v1, v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->changeToFirstService(Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceInputType;Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceType;)Z

    .line 342
    :goto_33
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v1}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getCommonManagerInstance()Lcom/mstar/tvsettingservice/CommonDesk;

    move-result-object v1

    invoke-interface {v1, v3}, Lcom/mstar/tvsettingservice/CommonDesk;->releaseHandler(I)V

    .line 344
    :cond_3c
    invoke-interface {v0, v3}, Lcom/mstar/tvsettingservice/ChannelDesk;->setChannelChangeFreezeMode(Z)V

    .line 330
    return-void

    .line 340
    :cond_40
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetAutoTuningEnd()Z

    goto :goto_33
.end method

.method public decreaseDtvManualScanFreq(I)[I
    .registers 9
    .param p1, "number"    # I

    .prologue
    const/4 v6, 0x1

    .line 445
    const-string/jumbo v3, "ChannelManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "decreaseDtvManualScanFreq ---> in number:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 446
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v3}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v2

    .line 447
    .local v2, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    sget-object v3, Lcom/mstar/android/tvapi/dtv/vo/RfInfo$EnumInfoType;->E_PREV_RF:Lcom/mstar/android/tvapi/dtv/vo/RfInfo$EnumInfoType;

    invoke-interface {v2, v3, p1}, Lcom/mstar/tvsettingservice/ChannelDesk;->dtvGetRFInfo(Lcom/mstar/android/tvapi/dtv/vo/RfInfo$EnumInfoType;I)Lcom/mstar/android/tvapi/dtv/vo/RfInfo;

    move-result-object v1

    .line 448
    .local v1, "rfInfo":Lcom/mstar/android/tvapi/dtv/vo/RfInfo;
    const/4 v3, 0x2

    new-array v0, v3, [I

    .line 449
    .local v0, "relt":[I
    iget-short v3, v1, Lcom/mstar/android/tvapi/dtv/vo/RfInfo;->rfPhyNum:S

    const/4 v4, 0x0

    aput v3, v0, v4

    .line 450
    iget v3, v1, Lcom/mstar/android/tvapi/dtv/vo/RfInfo;->frequency:I

    aput v3, v0, v6

    .line 451
    const-string/jumbo v3, "ChannelManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "decreaseDtvManualScanFreq ---> in frequency:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget v5, v0, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 452
    return-object v0
.end method

.method public doAtvChannelMove(II)Z
    .registers 9
    .param p1, "sourceChannelNum"    # I
    .param p2, "targetChannelNum"    # I

    .prologue
    const/4 v5, 0x1

    .line 1186
    const-string/jumbo v1, "ChannelManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "doAtvChannelMove ---> sourceChannelNum:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1187
    const-string/jumbo v1, "ChannelManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "doAtvChannelMove ---> targetChannelNum:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1188
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v1}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v0

    .line 1189
    .local v0, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v1}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v1

    if-nez v1, :cond_5c

    .line 1190
    sget-object v1, Lcom/mstar/android/tvapi/atv/vo/EnumSetProgramCtrl;->E_MOVE_PROGRAM:Lcom/mstar/android/tvapi/atv/vo/EnumSetProgramCtrl;

    add-int/lit8 v2, p1, -0x1

    .line 1191
    add-int/lit8 v3, p2, -0x1

    const/4 v4, 0x0

    .line 1190
    invoke-interface {v0, v1, v2, v3, v4}, Lcom/mstar/tvsettingservice/ChannelDesk;->setProgramCtrl(Lcom/mstar/android/tvapi/atv/vo/EnumSetProgramCtrl;IILjava/lang/String;)I

    .line 1192
    add-int/lit8 v1, p2, -0x1

    int-to-short v1, v1

    invoke-interface {v0, v1, v5}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetChannel(SZ)I

    .line 1193
    return v5

    .line 1195
    :cond_5c
    const/4 v1, 0x0

    return v1
.end method

.method public doChannelDelete(I)Z
    .registers 9
    .param p1, "channelNum"    # I

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 1148
    const-string/jumbo v2, "ChannelManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "doChannelDelete ---> In, channelNum:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1149
    invoke-virtual {p0}, Lcom/stv/signalcommon/ChannelManager;->getTotalChannelCount()I

    move-result v0

    .line 1150
    .local v0, "channelCount":I
    if-lt p1, v6, :cond_24

    if-le p1, v0, :cond_25

    .line 1151
    :cond_24
    return v5

    .line 1153
    :cond_25
    iget-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v2}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v1

    .line 1154
    .local v1, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    sget-object v2, Lcom/mstar/android/tvapi/atv/vo/EnumSetProgramCtrl;->E_DELETE_PROGRAM:Lcom/mstar/android/tvapi/atv/vo/EnumSetProgramCtrl;

    add-int/lit8 v3, p1, -0x1

    const/4 v4, 0x0

    invoke-interface {v1, v2, v3, v5, v4}, Lcom/mstar/tvsettingservice/ChannelDesk;->setProgramCtrl(Lcom/mstar/android/tvapi/atv/vo/EnumSetProgramCtrl;IILjava/lang/String;)I

    .line 1155
    invoke-virtual {p0}, Lcom/stv/signalcommon/ChannelManager;->skipHiddenChannels()V

    .line 1157
    return v6
.end method

.method public doChannelDown()V
    .registers 6

    .prologue
    const/4 v4, 0x1

    .line 264
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v3}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v2

    .line 265
    .local v2, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    invoke-interface {v2, v4}, Lcom/mstar/tvsettingservice/ChannelDesk;->setChannelChangeFreezeMode(Z)V

    .line 266
    invoke-virtual {p0}, Lcom/stv/signalcommon/ChannelManager;->getTotalChannelCount()I

    move-result v0

    .line 267
    .local v0, "channelCount":I
    invoke-virtual {p0}, Lcom/stv/signalcommon/ChannelManager;->getCurrentChannelNum()I

    move-result v1

    .line 268
    .local v1, "currentChannelNum":I
    if-ne v0, v4, :cond_36

    invoke-virtual {p0, v1}, Lcom/stv/signalcommon/ChannelManager;->isChannelSkipped(I)Z

    move-result v3

    if-eqz v3, :cond_36

    .line 270
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v3}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v3

    if-eqz v3, :cond_31

    .line 271
    int-to-short v3, v0

    sget-object v4, Lcom/mstar/tvsettingservice/DtvInterface$MEMBER_SERVICETYPE;->E_SERVICETYPE_DTV:Lcom/mstar/tvsettingservice/DtvInterface$MEMBER_SERVICETYPE;

    invoke-interface {v2, v3, v4}, Lcom/mstar/tvsettingservice/ChannelDesk;->programSel(ILcom/mstar/tvsettingservice/DtvInterface$MEMBER_SERVICETYPE;)Z

    .line 263
    :goto_30
    return-void

    .line 273
    :cond_31
    int-to-short v3, v0

    invoke-interface {v2, v3, v4}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetChannel(SZ)I

    goto :goto_30

    .line 276
    :cond_36
    invoke-interface {v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->programDown()Z

    goto :goto_30
.end method

.method public doChannelSwap(II)Z
    .registers 14
    .param p1, "sourceChannelNum"    # I
    .param p2, "targetChannelNum"    # I

    .prologue
    const/4 v10, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x1

    .line 1161
    iget-object v6, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v6}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v5

    .line 1162
    .local v5, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    iget-object v6, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v6}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v6

    if-eqz v6, :cond_6b

    .line 1163
    invoke-virtual {p0, v7}, Lcom/stv/signalcommon/ChannelManager;->getChannelList(Z)Ljava/util/ArrayList;

    move-result-object v0

    .line 1164
    .local v0, "channelList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mstar/android/tvapi/common/vo/ProgramInfo;>;"
    if-eqz v0, :cond_25

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-gtz v6, :cond_26

    .line 1166
    :cond_25
    return v7

    .line 1164
    :cond_26
    if-lt p1, v9, :cond_25

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-gt p1, v6, :cond_25

    .line 1165
    if-lt p2, v9, :cond_25

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-gt p2, v6, :cond_25

    .line 1168
    add-int/lit8 v6, p1, -0x1

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;

    iget v2, v6, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->queryIndex:I

    .line 1169
    .local v2, "sourcePosition":I
    add-int/lit8 v6, p2, -0x1

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;

    iget v4, v6, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->queryIndex:I

    .line 1170
    .local v4, "targetPosition":I
    add-int/lit8 v6, p2, -0x1

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;

    iget v3, v6, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->number:I

    .line 1172
    .local v3, "targetNumber":I
    :try_start_54
    invoke-static {}, Lcom/mstar/android/tvapi/common/TvManager;->getInstance()Lcom/mstar/android/tvapi/common/TvManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/mstar/android/tvapi/common/TvManager;->getChannelManager()Lcom/mstar/android/tvapi/common/ChannelManager;

    move-result-object v6

    invoke-virtual {v6, v2, v4}, Lcom/mstar/android/tvapi/common/ChannelManager;->switchPrograms(II)V
    :try_end_5f
    .catch Lcom/mstar/android/tvapi/common/exception/TvCommonException; {:try_start_54 .. :try_end_5f} :catch_66

    .line 1176
    :goto_5f
    int-to-short v6, v3

    sget-object v7, Lcom/mstar/tvsettingservice/DtvInterface$MEMBER_SERVICETYPE;->E_SERVICETYPE_DTV:Lcom/mstar/tvsettingservice/DtvInterface$MEMBER_SERVICETYPE;

    invoke-interface {v5, v6, v7}, Lcom/mstar/tvsettingservice/ChannelDesk;->programSel(ILcom/mstar/tvsettingservice/DtvInterface$MEMBER_SERVICETYPE;)Z

    .line 1182
    .end local v0    # "channelList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mstar/android/tvapi/common/vo/ProgramInfo;>;"
    .end local v2    # "sourcePosition":I
    .end local v3    # "targetNumber":I
    .end local v4    # "targetPosition":I
    :goto_65
    return v9

    .line 1173
    .restart local v0    # "channelList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mstar/android/tvapi/common/vo/ProgramInfo;>;"
    .restart local v2    # "sourcePosition":I
    .restart local v3    # "targetNumber":I
    .restart local v4    # "targetPosition":I
    :catch_66
    move-exception v1

    .line 1174
    .local v1, "e":Lcom/mstar/android/tvapi/common/exception/TvCommonException;
    invoke-virtual {v1}, Lcom/mstar/android/tvapi/common/exception/TvCommonException;->printStackTrace()V

    goto :goto_5f

    .line 1178
    .end local v0    # "channelList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mstar/android/tvapi/common/vo/ProgramInfo;>;"
    .end local v1    # "e":Lcom/mstar/android/tvapi/common/exception/TvCommonException;
    .end local v2    # "sourcePosition":I
    .end local v3    # "targetNumber":I
    .end local v4    # "targetPosition":I
    :cond_6b
    sget-object v6, Lcom/mstar/android/tvapi/atv/vo/EnumSetProgramCtrl;->E_SWAP_PROGRAM:Lcom/mstar/android/tvapi/atv/vo/EnumSetProgramCtrl;

    add-int/lit8 v7, p1, -0x1

    .line 1179
    add-int/lit8 v8, p2, -0x1

    .line 1178
    invoke-interface {v5, v6, v7, v8, v10}, Lcom/mstar/tvsettingservice/ChannelDesk;->setProgramCtrl(Lcom/mstar/android/tvapi/atv/vo/EnumSetProgramCtrl;IILjava/lang/String;)I

    .line 1180
    add-int/lit8 v6, p2, -0x1

    int-to-short v6, v6

    invoke-interface {v5, v6, v9}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetChannel(SZ)I

    goto :goto_65
.end method

.method public doChannelUp()V
    .registers 6

    .prologue
    const/4 v4, 0x1

    .line 247
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v3}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v2

    .line 248
    .local v2, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    invoke-interface {v2, v4}, Lcom/mstar/tvsettingservice/ChannelDesk;->setChannelChangeFreezeMode(Z)V

    .line 249
    invoke-virtual {p0}, Lcom/stv/signalcommon/ChannelManager;->getTotalChannelCount()I

    move-result v0

    .line 250
    .local v0, "channelCount":I
    invoke-virtual {p0}, Lcom/stv/signalcommon/ChannelManager;->getCurrentChannelNum()I

    move-result v1

    .line 251
    .local v1, "currentChannelNum":I
    if-ne v0, v4, :cond_36

    invoke-virtual {p0, v1}, Lcom/stv/signalcommon/ChannelManager;->isChannelSkipped(I)Z

    move-result v3

    if-eqz v3, :cond_36

    .line 253
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v3}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v3

    if-eqz v3, :cond_31

    .line 254
    int-to-short v3, v0

    sget-object v4, Lcom/mstar/tvsettingservice/DtvInterface$MEMBER_SERVICETYPE;->E_SERVICETYPE_DTV:Lcom/mstar/tvsettingservice/DtvInterface$MEMBER_SERVICETYPE;

    invoke-interface {v2, v3, v4}, Lcom/mstar/tvsettingservice/ChannelDesk;->programSel(ILcom/mstar/tvsettingservice/DtvInterface$MEMBER_SERVICETYPE;)Z

    .line 246
    :goto_30
    return-void

    .line 256
    :cond_31
    int-to-short v3, v0

    invoke-interface {v2, v3, v4}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetChannel(SZ)I

    goto :goto_30

    .line 259
    :cond_36
    invoke-interface {v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->programUp()Z

    goto :goto_30
.end method

.method public doDtvChannelMove(Lcom/mstar/android/tvapi/common/vo/ProgramInfo;Lcom/mstar/android/tvapi/common/vo/ProgramInfo;)Z
    .registers 9
    .param p1, "sourceInfo"    # Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    .param p2, "targetInfo"    # Lcom/mstar/android/tvapi/common/vo/ProgramInfo;

    .prologue
    const/4 v4, 0x0

    .line 1199
    if-eqz p1, :cond_5

    if-nez p2, :cond_6

    .line 1200
    :cond_5
    return v4

    .line 1202
    :cond_6
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v3}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v2

    .line 1203
    .local v2, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v3}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v3

    if-eqz v3, :cond_61

    .line 1204
    iget v0, p1, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->queryIndex:I

    .line 1205
    .local v0, "sourceChannelIndex":I
    iget v1, p2, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->queryIndex:I

    .line 1206
    .local v1, "targetChannelIndex":I
    const-string/jumbo v3, "ChannelManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "doDtvChannelMove ---> sourceChannelIndex:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1207
    const-string/jumbo v3, "ChannelManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "doDtvChannelMove ---> targetChannelIndex:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1208
    invoke-interface {v2, v0, v1}, Lcom/mstar/tvsettingservice/ChannelDesk;->moveProgram(II)V

    .line 1209
    iget v3, p2, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->number:I

    int-to-short v3, v3

    sget-object v4, Lcom/mstar/tvsettingservice/DtvInterface$MEMBER_SERVICETYPE;->E_SERVICETYPE_DTV:Lcom/mstar/tvsettingservice/DtvInterface$MEMBER_SERVICETYPE;

    invoke-interface {v2, v3, v4}, Lcom/mstar/tvsettingservice/ChannelDesk;->programSel(ILcom/mstar/tvsettingservice/DtvInterface$MEMBER_SERVICETYPE;)Z

    .line 1210
    const/4 v3, 0x1

    return v3

    .line 1212
    .end local v0    # "sourceChannelIndex":I
    .end local v1    # "targetChannelIndex":I
    :cond_61
    return v4
.end method

.method public doDtvChannelMoveByChannel(II)Z
    .registers 6
    .param p1, "source"    # I
    .param p2, "target"    # I

    .prologue
    .line 1216
    invoke-virtual {p0, p1}, Lcom/stv/signalcommon/ChannelManager;->getProgramInfoByNum(I)Lcom/mstar/android/tvapi/common/vo/ProgramInfo;

    move-result-object v0

    .line 1217
    .local v0, "sourceInfo":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    invoke-virtual {p0, p2}, Lcom/stv/signalcommon/ChannelManager;->getProgramInfoByNum(I)Lcom/mstar/android/tvapi/common/vo/ProgramInfo;

    move-result-object v1

    .line 1218
    .local v1, "targetInfo":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    invoke-virtual {p0, v0, v1}, Lcom/stv/signalcommon/ChannelManager;->doDtvChannelMove(Lcom/mstar/android/tvapi/common/vo/ProgramInfo;Lcom/mstar/android/tvapi/common/vo/ProgramInfo;)Z

    move-result v2

    return v2
.end method

.method public doFineTuneDown()V
    .registers 7

    .prologue
    .line 295
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v3}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v2

    .line 296
    .local v2, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    invoke-interface {v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvGetCurrentFrequency()I

    move-result v1

    .line 297
    .local v1, "curFrequency":I
    invoke-interface {v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->getCurrentChannelNumber()I

    move-result v0

    .line 298
    .local v0, "curChannelNumber":I
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v3}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v3

    if-eqz v3, :cond_3f

    .line 299
    invoke-interface {v2, v1}, Lcom/mstar/tvsettingservice/ChannelDesk;->dtvManualScanFreq(I)Z

    .line 300
    const-string/jumbo v3, "ChannelManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "doFineTuneDown() curFrequency:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 301
    invoke-interface {v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->dtvStartManualScan()Z

    .line 294
    :goto_3e
    return-void

    .line 303
    :cond_3f
    sget-object v3, Lcom/mstar/android/tvapi/atv/vo/EnumAtvManualTuneMode;->E_MANUAL_TUNE_MODE_FINE_TUNE_DOWN:Lcom/mstar/android/tvapi/atv/vo/EnumAtvManualTuneMode;

    const/16 v4, 0xbb8

    invoke-interface {v2, v4, v1, v3}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetManualTuningStart(IILcom/mstar/android/tvapi/atv/vo/EnumAtvManualTuneMode;)Z

    .line 304
    invoke-interface {v2, v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->saveAtvProgram(I)Z

    goto :goto_3e
.end method

.method public doFineTuneUp()V
    .registers 7

    .prologue
    .line 281
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v3}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v2

    .line 282
    .local v2, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    invoke-interface {v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvGetCurrentFrequency()I

    move-result v1

    .line 283
    .local v1, "curFrequency":I
    invoke-interface {v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->getCurrentChannelNumber()I

    move-result v0

    .line 284
    .local v0, "curChannelNumber":I
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v3}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v3

    if-eqz v3, :cond_3f

    .line 285
    invoke-interface {v2, v1}, Lcom/mstar/tvsettingservice/ChannelDesk;->dtvManualScanFreq(I)Z

    .line 286
    const-string/jumbo v3, "ChannelManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "doFineTuneUp() curFrequency:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 287
    invoke-interface {v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->dtvStartManualScan()Z

    .line 280
    :goto_3e
    return-void

    .line 289
    :cond_3f
    sget-object v3, Lcom/mstar/android/tvapi/atv/vo/EnumAtvManualTuneMode;->E_MANUAL_TUNE_MODE_FINE_TUNE_UP:Lcom/mstar/android/tvapi/atv/vo/EnumAtvManualTuneMode;

    const/16 v4, 0xbb8

    invoke-interface {v2, v4, v1, v3}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetManualTuningStart(IILcom/mstar/android/tvapi/atv/vo/EnumAtvManualTuneMode;)Z

    .line 290
    invoke-interface {v2, v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->saveAtvProgram(I)Z

    goto :goto_3e
.end method

.method public dtvManualScanStart(I)V
    .registers 6
    .param p1, "freq"    # I

    .prologue
    .line 489
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v1}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v0

    .line 490
    .local v0, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v1}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v1

    if-eqz v1, :cond_36

    .line 492
    invoke-direct {p0, p1}, Lcom/stv/signalcommon/ChannelManager;->setDtmbFreq(I)V

    .line 493
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->dtvStartManualScan()Z

    .line 494
    const-string/jumbo v1, "ChannelManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Dtv Manual scan start successfully:freq="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 488
    :cond_36
    return-void
.end method

.method public dtvManualScanStart(II)V
    .registers 7
    .param p1, "freq"    # I
    .param p2, "channelNum"    # I

    .prologue
    .line 473
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v1}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v0

    .line 474
    .local v0, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v1}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v1

    if-eqz v1, :cond_3c

    .line 476
    invoke-direct {p0, p1}, Lcom/stv/signalcommon/ChannelManager;->setDtmbFreq(I)V

    .line 477
    if-lez p2, :cond_3d

    .line 478
    int-to-short v1, p2

    invoke-interface {v0, v1}, Lcom/mstar/tvsettingservice/ChannelDesk;->dtvManualScanRF(S)Z

    .line 479
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->dtvStartManualScan()Z

    .line 480
    const-string/jumbo v1, "ChannelManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Dtv Manual scan start successfully:channelNum="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 472
    :cond_3c
    :goto_3c
    return-void

    .line 482
    :cond_3d
    const-string/jumbo v1, "ChannelManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Dtv Manual scan start failed:channelNum="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3c
.end method

.method public finalize()V
    .registers 1

    .prologue
    .line 214
    return-void
.end method

.method public getAtvChannelCount()I
    .registers 6

    .prologue
    .line 943
    iget-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v2}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v1

    .line 944
    .local v1, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    sget-object v2, Lcom/mstar/android/tvapi/common/vo/EnumProgramCountType;->E_COUNT_ATV:Lcom/mstar/android/tvapi/common/vo/EnumProgramCountType;

    invoke-interface {v1, v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->getProgramCount(Lcom/mstar/android/tvapi/common/vo/EnumProgramCountType;)I

    move-result v0

    .line 945
    .local v0, "count":I
    const-string/jumbo v2, "ChannelManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Get ATV total channel count:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 946
    return v0
.end method

.method public getAudioTrack()Lcom/stv/signalcommon/ChannelManager$AudioTrack;
    .registers 9

    .prologue
    .line 1302
    const-string/jumbo v5, "ChannelManager"

    const-string/jumbo v6, "getAudioTrack() ---> In"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1303
    iget-object v5, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v5}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v2

    .line 1304
    .local v2, "channelDeskInstance":Lcom/mstar/tvsettingservice/ChannelDesk;
    invoke-interface {v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->getAudioInfo()Lcom/mstar/android/tvapi/dtv/vo/DtvAudioInfo;

    move-result-object v0

    .line 1305
    .local v0, "audioInfo":Lcom/mstar/android/tvapi/dtv/vo/DtvAudioInfo;
    const/4 v1, 0x0

    .line 1306
    .local v1, "audioTrack":Lcom/stv/signalcommon/ChannelManager$AudioTrack;
    if-eqz v0, :cond_91

    iget-object v5, v0, Lcom/mstar/android/tvapi/dtv/vo/DtvAudioInfo;->audioInfos:[Lcom/mstar/android/tvapi/dtv/vo/AudioInfo;

    if-eqz v5, :cond_91

    iget-short v5, v0, Lcom/mstar/android/tvapi/dtv/vo/DtvAudioInfo;->audioLangNum:S

    if-lez v5, :cond_91

    .line 1307
    iget-short v3, v0, Lcom/mstar/android/tvapi/dtv/vo/DtvAudioInfo;->currentAudioIndex:S

    .line 1308
    .local v3, "currentAudioIndex":I
    const-string/jumbo v5, "ChannelManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "audioCount:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v0, Lcom/mstar/android/tvapi/dtv/vo/DtvAudioInfo;->audioInfos:[Lcom/mstar/android/tvapi/dtv/vo/AudioInfo;

    array-length v7, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1309
    const-string/jumbo v5, "ChannelManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "currentAudioIndex:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1310
    const-string/jumbo v5, "ChannelManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "audioLangNum:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-short v7, v0, Lcom/mstar/android/tvapi/dtv/vo/DtvAudioInfo;->audioLangNum:S

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1312
    if-ltz v3, :cond_79

    iget-short v5, v0, Lcom/mstar/android/tvapi/dtv/vo/DtvAudioInfo;->audioLangNum:S

    if-lt v3, v5, :cond_7a

    .line 1313
    :cond_79
    const/4 v3, 0x0

    .line 1315
    :cond_7a
    new-instance v1, Lcom/stv/signalcommon/ChannelManager$AudioTrack;

    .end local v1    # "audioTrack":Lcom/stv/signalcommon/ChannelManager$AudioTrack;
    invoke-direct {v1, p0}, Lcom/stv/signalcommon/ChannelManager$AudioTrack;-><init>(Lcom/stv/signalcommon/ChannelManager;)V

    .line 1316
    .local v1, "audioTrack":Lcom/stv/signalcommon/ChannelManager$AudioTrack;
    invoke-virtual {v1, v3}, Lcom/stv/signalcommon/ChannelManager$AudioTrack;->setCurrentAudioTrackIndex(I)V

    .line 1317
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_83
    iget-short v5, v0, Lcom/mstar/android/tvapi/dtv/vo/DtvAudioInfo;->audioLangNum:S

    if-ge v4, v5, :cond_91

    .line 1318
    iget-object v5, v0, Lcom/mstar/android/tvapi/dtv/vo/DtvAudioInfo;->audioInfos:[Lcom/mstar/android/tvapi/dtv/vo/AudioInfo;

    aget-object v5, v5, v4

    invoke-virtual {v1, v5}, Lcom/stv/signalcommon/ChannelManager$AudioTrack;->addToAudioTrackList(Lcom/mstar/android/tvapi/dtv/vo/AudioInfo;)V

    .line 1317
    add-int/lit8 v4, v4, 0x1

    goto :goto_83

    .line 1321
    .end local v1    # "audioTrack":Lcom/stv/signalcommon/ChannelManager$AudioTrack;
    .end local v3    # "currentAudioIndex":I
    .end local v4    # "i":I
    :cond_91
    return-object v1
.end method

.method public getBandMinFrequency(Ljava/lang/String;)I
    .registers 3
    .param p1, "band"    # Ljava/lang/String;

    .prologue
    .line 1107
    invoke-static {p1}, Lcom/stv/signalcommon/MstarUtils;->getMinFrequency(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getChannelFreq(I)I
    .registers 8
    .param p1, "channelNum"    # I

    .prologue
    .line 668
    iget-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v2}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v1

    .line 669
    .local v1, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    sget-object v2, Lcom/mstar/android/tvapi/atv/vo/EnumGetProgramInfo;->E_GET_FINE_TUNE:Lcom/mstar/android/tvapi/atv/vo/EnumGetProgramInfo;

    add-int/lit8 v3, p1, -0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-interface {v1, v2, v3, v4, v5}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvGetProgramInfo(Lcom/mstar/android/tvapi/atv/vo/EnumGetProgramInfo;IILjava/lang/StringBuffer;)I

    move-result v0

    .line 670
    .local v0, "freq":I
    const-string/jumbo v2, "ChannelManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Channel num:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ", check freq is:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 671
    return v0
.end method

.method public getChannelList(Z)Ljava/util/ArrayList;
    .registers 10
    .param p1, "isFilter"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mstar/android/tvapi/common/vo/ProgramInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 999
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1000
    .local v2, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mstar/android/tvapi/common/vo/ProgramInfo;>;"
    iget-object v5, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v5}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v4

    .line 1001
    .local v4, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    const/4 v3, 0x0

    .line 1003
    .local v3, "pgi":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    iget-object v5, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v5}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v5

    if-eqz v5, :cond_58

    .line 1004
    invoke-virtual {p0}, Lcom/stv/signalcommon/ChannelManager;->getTotalChannelCount()I

    move-result v0

    .line 1005
    .local v0, "channelCount":I
    const-string/jumbo v5, "ChannelManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "getChannelList() -- > in dtv channelCount: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1006
    const/4 v1, 0x0

    .end local v3    # "pgi":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    .local v1, "i":I
    :goto_3b
    if-ge v1, v0, :cond_58

    .line 1007
    invoke-interface {v4, v1}, Lcom/mstar/tvsettingservice/ChannelDesk;->getProgramInfoByIndex(I)Lcom/mstar/android/tvapi/common/vo/ProgramInfo;

    move-result-object v3

    .line 1008
    .local v3, "pgi":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    if-eqz v3, :cond_51

    .line 1009
    if-eqz p1, :cond_54

    .line 1010
    iget-boolean v5, v3, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->isDelete:Z

    if-nez v5, :cond_51

    iget-boolean v5, v3, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->isSkip:Z

    if-nez v5, :cond_51

    iget-boolean v5, v3, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->isHide:Z

    if-eqz v5, :cond_54

    .line 1006
    :cond_51
    :goto_51
    add-int/lit8 v1, v1, 0x1

    goto :goto_3b

    .line 1014
    :cond_54
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_51

    .line 1019
    .end local v0    # "channelCount":I
    .end local v1    # "i":I
    .end local v3    # "pgi":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    :cond_58
    return-object v2
.end method

.method public getChannelListEx(Z)Ljava/util/ArrayList;
    .registers 11
    .param p1, "isFilter"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/stv/signalcommon/SignalManager$ProgramInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1022
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1023
    .local v2, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/stv/signalcommon/SignalManager$ProgramInfo;>;"
    iget-object v6, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v6}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v5

    .line 1024
    .local v5, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    const/4 v3, 0x0

    .line 1026
    .local v3, "pgi":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    iget-object v6, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v6}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v6

    if-eqz v6, :cond_6d

    .line 1027
    invoke-virtual {p0}, Lcom/stv/signalcommon/ChannelManager;->getTotalChannelCount()I

    move-result v0

    .line 1028
    .local v0, "channelCount":I
    const-string/jumbo v6, "ChannelManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "getChannelList() -- > in dtv channelCount: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1029
    const/4 v1, 0x0

    .end local v3    # "pgi":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    .local v1, "i":I
    :goto_3b
    if-ge v1, v0, :cond_6d

    .line 1030
    invoke-interface {v5, v1}, Lcom/mstar/tvsettingservice/ChannelDesk;->getProgramInfoByIndex(I)Lcom/mstar/android/tvapi/common/vo/ProgramInfo;

    move-result-object v3

    .line 1031
    .local v3, "pgi":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    if-eqz v3, :cond_51

    .line 1032
    if-eqz p1, :cond_54

    .line 1033
    iget-boolean v6, v3, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->isDelete:Z

    if-nez v6, :cond_51

    iget-boolean v6, v3, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->isSkip:Z

    if-nez v6, :cond_51

    iget-boolean v6, v3, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->isHide:Z

    if-eqz v6, :cond_54

    .line 1029
    :cond_51
    :goto_51
    add-int/lit8 v1, v1, 0x1

    goto :goto_3b

    .line 1037
    :cond_54
    new-instance v4, Lcom/stv/signalcommon/SignalManager$ProgramInfo;

    invoke-direct {v4}, Lcom/stv/signalcommon/SignalManager$ProgramInfo;-><init>()V

    .line 1038
    .local v4, "pi":Lcom/stv/signalcommon/SignalManager$ProgramInfo;
    iget v6, v3, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->frequency:I

    iput v6, v4, Lcom/stv/signalcommon/SignalManager$ProgramInfo;->frequency:I

    .line 1039
    iget v6, v3, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->number:I

    iput v6, v4, Lcom/stv/signalcommon/SignalManager$ProgramInfo;->number:I

    .line 1040
    iget v6, v3, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->queryIndex:I

    iput v6, v4, Lcom/stv/signalcommon/SignalManager$ProgramInfo;->queryIndex:I

    .line 1041
    iget-object v6, v3, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->serviceName:Ljava/lang/String;

    iput-object v6, v4, Lcom/stv/signalcommon/SignalManager$ProgramInfo;->serviceName:Ljava/lang/String;

    .line 1042
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_51

    .line 1047
    .end local v0    # "channelCount":I
    .end local v1    # "i":I
    .end local v3    # "pgi":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    .end local v4    # "pi":Lcom/stv/signalcommon/SignalManager$ProgramInfo;
    :cond_6d
    return-object v2
.end method

.method public getChannelNumberList(Z)Ljava/util/ArrayList;
    .registers 10
    .param p1, "isFilter"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1051
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1052
    .local v2, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    iget-object v5, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v5}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v4

    .line 1053
    .local v4, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    const/4 v3, 0x0

    .line 1054
    .local v3, "pgi":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    iget-object v5, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v5}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v5

    if-eqz v5, :cond_5e

    .line 1055
    invoke-virtual {p0}, Lcom/stv/signalcommon/ChannelManager;->getTotalChannelCount()I

    move-result v0

    .line 1056
    .local v0, "channelCount":I
    const-string/jumbo v5, "ChannelManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "getChannelList() -- > in dtv channelCount: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1057
    const/4 v1, 0x0

    .end local v3    # "pgi":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    .local v1, "i":I
    :goto_3b
    if-ge v1, v0, :cond_5e

    .line 1058
    invoke-interface {v4, v1}, Lcom/mstar/tvsettingservice/ChannelDesk;->getProgramInfoByIndex(I)Lcom/mstar/android/tvapi/common/vo/ProgramInfo;

    move-result-object v3

    .line 1059
    .local v3, "pgi":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    if-eqz v3, :cond_51

    .line 1060
    if-eqz p1, :cond_54

    .line 1061
    iget-boolean v5, v3, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->isDelete:Z

    if-nez v5, :cond_51

    iget-boolean v5, v3, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->isSkip:Z

    if-nez v5, :cond_51

    iget-boolean v5, v3, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->isHide:Z

    if-eqz v5, :cond_54

    .line 1057
    :cond_51
    :goto_51
    add-int/lit8 v1, v1, 0x1

    goto :goto_3b

    .line 1065
    :cond_54
    iget v5, v3, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->number:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_51

    .line 1070
    .end local v0    # "channelCount":I
    .end local v1    # "i":I
    .end local v3    # "pgi":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    :cond_5e
    return-object v2
.end method

.method public getCurrentChannelColorSystem()Lcom/stv/signalcommon/ChannelManager$ColorSystem;
    .registers 7

    .prologue
    .line 614
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v3}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v2

    .line 615
    .local v2, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    invoke-interface {v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvGetVideoSystem()Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    move-result-object v0

    .line 616
    .local v0, "currentColorSystem":Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;
    const-string/jumbo v3, "ChannelManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "getCurrentChannelColorSystem ---> currentColorSystem:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 617
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_25
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->colorSystemTypeList:[Lcom/stv/signalcommon/ChannelManager$ColorSystem;

    array-length v3, v3

    if-ge v1, v3, :cond_3a

    .line 618
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->colorSystemTypeList:[Lcom/stv/signalcommon/ChannelManager$ColorSystem;

    aget-object v3, v3, v1

    iget-object v3, v3, Lcom/stv/signalcommon/ChannelManager$ColorSystem;->colorSystemType:Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    if-ne v3, v0, :cond_37

    .line 619
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->colorSystemTypeList:[Lcom/stv/signalcommon/ChannelManager$ColorSystem;

    aget-object v3, v3, v1

    return-object v3

    .line 617
    :cond_37
    add-int/lit8 v1, v1, 0x1

    goto :goto_25

    .line 623
    :cond_3a
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->colorSystemTypeList:[Lcom/stv/signalcommon/ChannelManager$ColorSystem;

    const/4 v4, 0x0

    aget-object v3, v3, v4

    return-object v3
.end method

.method public getCurrentChannelEPG()Ljava/lang/String;
    .registers 19

    .prologue
    .line 699
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v13}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v12

    .line 700
    .local v12, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    const-string/jumbo v7, ""

    .line 701
    .local v7, "epg":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v13}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getEpgManagerInstance()Lcom/mstar/tvsettingservice/EpgDesk;

    move-result-object v6

    .line 702
    .local v6, "ed":Lcom/mstar/tvsettingservice/EpgDesk;
    invoke-interface {v12}, Lcom/mstar/tvsettingservice/ChannelDesk;->getCurrProgramInfo()Lcom/mstar/android/tvapi/common/vo/ProgramInfo;

    move-result-object v3

    .line 703
    .local v3, "currProg_Info":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    const-string/jumbo v13, "ChannelManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "getCurrentChannelEPG() --> in currProg_Info.number:"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    iget v15, v3, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->number:I

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 704
    const-string/jumbo v13, "ChannelManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "getCurrentChannelEPG() --> in currProg_Info.serviceName:"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    iget-object v15, v3, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->serviceName:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 705
    const-string/jumbo v13, "ChannelManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "getCurrentChannelEPG() --> in currProg_Info.serviceType:"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    iget-short v15, v3, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->serviceType:S

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 706
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v13}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v13

    invoke-virtual {v13}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v13

    invoke-virtual {v13}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v13

    if-eqz v13, :cond_101

    .line 708
    :try_start_7d
    iget-short v13, v3, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->serviceType:S

    iget v14, v3, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->number:I

    .line 709
    sget-object v15, Lcom/mstar/android/tvapi/dtv/vo/DtvType$EnumEpgDescriptionType;->E_DETAIL_DESCRIPTION:Lcom/mstar/android/tvapi/dtv/vo/DtvType$EnumEpgDescriptionType;

    .line 708
    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-interface {v6, v13, v14, v0, v15}, Lcom/mstar/tvsettingservice/EpgDesk;->getPresentFollowingEventInfo(SIZLcom/mstar/android/tvapi/dtv/vo/DtvType$EnumEpgDescriptionType;)Lcom/mstar/android/tvapi/common/vo/PresentFollowingEventInfo;

    move-result-object v10

    .line 710
    .local v10, "pfEvtInfo":Lcom/mstar/android/tvapi/common/vo/PresentFollowingEventInfo;
    const-string/jumbo v13, "ChannelManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "getCurrentChannelEPG() --> pfEvtInfo:"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 711
    if-eqz v10, :cond_101

    .line 712
    const-wide/16 v8, 0x0

    .line 714
    .local v8, "offsetTimeInMs":J
    new-instance v2, Landroid/text/format/Time;

    invoke-direct {v2}, Landroid/text/format/Time;-><init>()V

    .line 715
    .local v2, "curTime":Landroid/text/format/Time;
    invoke-virtual {v2}, Landroid/text/format/Time;->setToNow()V

    .line 716
    const/4 v13, 0x1

    invoke-virtual {v2, v13}, Landroid/text/format/Time;->toMillis(Z)J
    :try_end_b5
    .catch Ljava/lang/Exception; {:try_start_7d .. :try_end_b5} :catch_121

    .line 718
    const/4 v13, 0x1

    :try_start_b6
    invoke-interface {v6, v2, v13}, Lcom/mstar/tvsettingservice/EpgDesk;->getEpgEventOffsetTime(Landroid/text/format/Time;Z)I

    move-result v13

    mul-int/lit16 v13, v13, 0x3e8

    int-to-long v8, v13

    .line 719
    const/4 v13, 0x1

    invoke-virtual {v2, v13}, Landroid/text/format/Time;->toMillis(Z)J

    move-result-wide v14

    const-wide/16 v16, 0x3e8

    div-long v16, v8, v16

    sub-long v14, v14, v16

    long-to-int v13, v14

    .line 720
    iget-object v14, v10, Lcom/mstar/android/tvapi/common/vo/PresentFollowingEventInfo;->eventInfo:Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;

    iget v14, v14, Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;->endTime:I

    iget-object v15, v10, Lcom/mstar/android/tvapi/common/vo/PresentFollowingEventInfo;->eventInfo:Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;

    iget v15, v15, Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;->startTime:I

    sub-int/2addr v14, v15

    .line 719
    div-int/2addr v13, v14

    mul-int/lit8 v13, v13, 0x64

    move-object/from16 v0, p0

    iput v13, v0, Lcom/stv/signalcommon/ChannelManager;->currentChannelProgress:I
    :try_end_d9
    .catch Lcom/mstar/android/tvapi/common/exception/TvCommonException; {:try_start_b6 .. :try_end_d9} :catch_11c
    .catch Ljava/lang/Exception; {:try_start_b6 .. :try_end_d9} :catch_121

    .line 724
    :goto_d9
    :try_start_d9
    iget-object v13, v10, Lcom/mstar/android/tvapi/common/vo/PresentFollowingEventInfo;->eventInfo:Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;

    iget v13, v13, Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;->startTime:I

    iget-object v14, v10, Lcom/mstar/android/tvapi/common/vo/PresentFollowingEventInfo;->eventInfo:Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;

    iget v14, v14, Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;->endTime:I

    invoke-static {v13, v14, v8, v9}, Lcom/stv/signalcommon/Utils;->getTimeString(IIJ)Ljava/lang/String;

    move-result-object v11

    .line 725
    .local v11, "time":Ljava/lang/String;
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v14, v10, Lcom/mstar/android/tvapi/common/vo/PresentFollowingEventInfo;->eventInfo:Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;

    iget-object v14, v14, Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;->name:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string/jumbo v14, " "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_100
    .catch Ljava/lang/Exception; {:try_start_d9 .. :try_end_100} :catch_121

    move-result-object v7

    .line 733
    .end local v2    # "curTime":Landroid/text/format/Time;
    .end local v8    # "offsetTimeInMs":J
    .end local v10    # "pfEvtInfo":Lcom/mstar/android/tvapi/common/vo/PresentFollowingEventInfo;
    .end local v11    # "time":Ljava/lang/String;
    :cond_101
    :goto_101
    const-string/jumbo v13, "ChannelManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v15, "getCurrentChannelEPG() --> epg:"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 734
    return-object v7

    .line 721
    .restart local v2    # "curTime":Landroid/text/format/Time;
    .restart local v8    # "offsetTimeInMs":J
    .restart local v10    # "pfEvtInfo":Lcom/mstar/android/tvapi/common/vo/PresentFollowingEventInfo;
    :catch_11c
    move-exception v5

    .line 722
    .local v5, "e1":Lcom/mstar/android/tvapi/common/exception/TvCommonException;
    :try_start_11d
    invoke-virtual {v5}, Lcom/mstar/android/tvapi/common/exception/TvCommonException;->printStackTrace()V
    :try_end_120
    .catch Ljava/lang/Exception; {:try_start_11d .. :try_end_120} :catch_121

    goto :goto_d9

    .line 727
    .end local v2    # "curTime":Landroid/text/format/Time;
    .end local v5    # "e1":Lcom/mstar/android/tvapi/common/exception/TvCommonException;
    .end local v8    # "offsetTimeInMs":J
    .end local v10    # "pfEvtInfo":Lcom/mstar/android/tvapi/common/vo/PresentFollowingEventInfo;
    :catch_121
    move-exception v4

    .line 728
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_101
.end method

.method public getCurrentChannelFreq()I
    .registers 6

    .prologue
    .line 675
    iget-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v2}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v1

    .line 677
    .local v1, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    const/4 v0, 0x0

    .line 678
    .local v0, "freq":I
    iget-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v2}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v2

    if-eqz v2, :cond_18

    .line 684
    :goto_17
    return v0

    .line 681
    :cond_18
    invoke-interface {v1}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvGetCurrentFrequency()I

    move-result v0

    .line 682
    const-string/jumbo v2, "ChannelManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Get current channel freq is:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_17
.end method

.method public getCurrentChannelName()Ljava/lang/String;
    .registers 6

    .prologue
    const/4 v4, 0x0

    .line 688
    iget-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v2}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v1

    .line 690
    .local v1, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    iget-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v2}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v2

    if-eqz v2, :cond_22

    .line 691
    invoke-interface {v1}, Lcom/mstar/tvsettingservice/ChannelDesk;->getCurrentChannelNumber()I

    move-result v2

    sget-object v3, Lcom/mstar/tvsettingservice/DtvInterface$MEMBER_SERVICETYPE;->E_SERVICETYPE_DTV:Lcom/mstar/tvsettingservice/DtvInterface$MEMBER_SERVICETYPE;

    invoke-interface {v1, v2, v3, v4}, Lcom/mstar/tvsettingservice/ChannelDesk;->getProgramName(ILcom/mstar/tvsettingservice/DtvInterface$MEMBER_SERVICETYPE;S)Ljava/lang/String;

    move-result-object v0

    .line 695
    .local v0, "name":Ljava/lang/String;
    :goto_21
    return-object v0

    .line 693
    .end local v0    # "name":Ljava/lang/String;
    :cond_22
    invoke-interface {v1}, Lcom/mstar/tvsettingservice/ChannelDesk;->getCurrentChannelNumber()I

    move-result v2

    sget-object v3, Lcom/mstar/tvsettingservice/DtvInterface$MEMBER_SERVICETYPE;->E_SERVICETYPE_ATV:Lcom/mstar/tvsettingservice/DtvInterface$MEMBER_SERVICETYPE;

    invoke-interface {v1, v2, v3, v4}, Lcom/mstar/tvsettingservice/ChannelDesk;->getProgramName(ILcom/mstar/tvsettingservice/DtvInterface$MEMBER_SERVICETYPE;S)Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "name":Ljava/lang/String;
    goto :goto_21
.end method

.method public getCurrentChannelNum()I
    .registers 4

    .prologue
    const/4 v2, 0x0

    .line 228
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v1}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v0

    .line 229
    .local v0, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v1}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 230
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->getCurrentChannelNumber()I

    move-result v1

    return v1

    .line 232
    :cond_1c
    sget-object v1, Lcom/mstar/android/tvapi/common/vo/EnumProgramCountType;->E_COUNT_ATV:Lcom/mstar/android/tvapi/common/vo/EnumProgramCountType;

    invoke-interface {v0, v1}, Lcom/mstar/tvsettingservice/ChannelDesk;->getProgramCount(Lcom/mstar/android/tvapi/common/vo/EnumProgramCountType;)I

    move-result v1

    if-lez v1, :cond_2b

    .line 233
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->getCurrentChannelNumber()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    return v1

    .line 235
    :cond_2b
    return v2
.end method

.method public getCurrentChannelProgress()I
    .registers 2

    .prologue
    .line 738
    iget v0, p0, Lcom/stv/signalcommon/ChannelManager;->currentChannelProgress:I

    return v0
.end method

.method public getCurrentChannelSoundSystem()Lcom/stv/signalcommon/ChannelManager$SoundSystem;
    .registers 7

    .prologue
    .line 641
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v3}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v2

    .line 642
    .local v2, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    invoke-interface {v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvGetSoundSystem()Lcom/mstar/android/tvapi/common/vo/AtvSystemStandard$EnumAtvSystemStandard;

    move-result-object v0

    .line 643
    .local v0, "currentSoundSystem":Lcom/mstar/android/tvapi/common/vo/AtvSystemStandard$EnumAtvSystemStandard;
    const-string/jumbo v3, "ChannelManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "getCurrentChannelSoundSystem ---> currentSoundSystem:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 644
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_25
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->soundSystemTypeList:[Lcom/stv/signalcommon/ChannelManager$SoundSystem;

    array-length v3, v3

    if-ge v1, v3, :cond_3a

    .line 645
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->soundSystemTypeList:[Lcom/stv/signalcommon/ChannelManager$SoundSystem;

    aget-object v3, v3, v1

    iget-object v3, v3, Lcom/stv/signalcommon/ChannelManager$SoundSystem;->soundSystemType:Lcom/mstar/android/tvapi/common/vo/AtvSystemStandard$EnumAtvSystemStandard;

    if-ne v3, v0, :cond_37

    .line 646
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->soundSystemTypeList:[Lcom/stv/signalcommon/ChannelManager$SoundSystem;

    aget-object v3, v3, v1

    return-object v3

    .line 644
    :cond_37
    add-int/lit8 v1, v1, 0x1

    goto :goto_25

    .line 650
    :cond_3a
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->soundSystemTypeList:[Lcom/stv/signalcommon/ChannelManager$SoundSystem;

    const/4 v4, 0x2

    aget-object v3, v3, v4

    return-object v3
.end method

.method public getCurrentPlayingProgram()Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;
    .registers 10

    .prologue
    const/4 v8, 0x0

    .line 1073
    new-instance v5, Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;

    invoke-direct {v5}, Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;-><init>()V

    .line 1075
    .local v5, "info":Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;
    invoke-virtual {p0, v8}, Lcom/stv/signalcommon/ChannelManager;->getChannelList(Z)Ljava/util/ArrayList;

    move-result-object v0

    .line 1076
    .local v0, "channelList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mstar/android/tvapi/common/vo/ProgramInfo;>;"
    const/4 v1, 0x0

    .line 1077
    .local v1, "currentChannelIndex":I
    invoke-virtual {p0}, Lcom/stv/signalcommon/ChannelManager;->getCurrentChannelNum()I

    move-result v2

    .line 1078
    .local v2, "currentChannelNumer":I
    if-eqz v0, :cond_2c

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_2c

    .line 1079
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_18
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v4, v7, :cond_2c

    .line 1080
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;

    iget v7, v7, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->number:I

    if-ne v7, v2, :cond_29

    .line 1081
    move v1, v4

    .line 1079
    :cond_29
    add-int/lit8 v4, v4, 0x1

    goto :goto_18

    .line 1086
    .end local v4    # "i":I
    :cond_2c
    if-eqz v0, :cond_4c

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_4c

    .line 1087
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;

    iget v6, v7, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->queryIndex:I

    .line 1088
    .local v6, "queryIndex":I
    invoke-virtual {p0, v6}, Lcom/stv/signalcommon/ChannelManager;->getEpgEventListByChannelIndex(I)Ljava/util/ArrayList;

    move-result-object v3

    .line 1090
    .local v3, "epgEventList":Ljava/util/List;, "Ljava/util/List<Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v7

    if-lez v7, :cond_4c

    .line 1091
    invoke-interface {v3, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "info":Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;
    check-cast v5, Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;

    .line 1095
    .end local v3    # "epgEventList":Ljava/util/List;, "Ljava/util/List<Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;>;"
    .end local v6    # "queryIndex":I
    .restart local v5    # "info":Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;
    :cond_4c
    return-object v5
.end method

.method public getDefaultDtvManualScanFreq()[I
    .registers 8

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 423
    const-string/jumbo v3, "ChannelManager"

    const-string/jumbo v4, "getDefaultDtvManualScanFreq ---> in"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 424
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v3}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v2

    .line 425
    .local v2, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    sget-object v3, Lcom/mstar/android/tvapi/dtv/vo/RfInfo$EnumInfoType;->E_FIRST_TO_SHOW_RF:Lcom/mstar/android/tvapi/dtv/vo/RfInfo$EnumInfoType;

    invoke-interface {v2, v3, v5}, Lcom/mstar/tvsettingservice/ChannelDesk;->dtvGetRFInfo(Lcom/mstar/android/tvapi/dtv/vo/RfInfo$EnumInfoType;I)Lcom/mstar/android/tvapi/dtv/vo/RfInfo;

    move-result-object v1

    .line 426
    .local v1, "rfInfo":Lcom/mstar/android/tvapi/dtv/vo/RfInfo;
    const/4 v3, 0x2

    new-array v0, v3, [I

    .line 427
    .local v0, "relt":[I
    iget-short v3, v1, Lcom/mstar/android/tvapi/dtv/vo/RfInfo;->rfPhyNum:S

    aput v3, v0, v5

    .line 428
    iget v3, v1, Lcom/mstar/android/tvapi/dtv/vo/RfInfo;->frequency:I

    aput v3, v0, v6

    .line 429
    const-string/jumbo v3, "ChannelManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "getDefaultDtvManualScanFreq ---> in frequency:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget v5, v0, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 430
    return-object v0
.end method

.method public getDtmbChannelCount()I
    .registers 6

    .prologue
    .line 950
    iget-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v2}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v1

    .line 951
    .local v1, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    sget-object v2, Lcom/mstar/android/tvapi/common/vo/EnumProgramCountType;->E_COUNT_DTV_TV:Lcom/mstar/android/tvapi/common/vo/EnumProgramCountType;

    invoke-interface {v1, v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->getProgramCount(Lcom/mstar/android/tvapi/common/vo/EnumProgramCountType;)I

    move-result v0

    .line 952
    .local v0, "count":I
    const-string/jumbo v2, "ChannelManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Get DTV total channel count:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 953
    return v0
.end method

.method public getDtvChannelAudioInfo()Lcom/stv/signalcommon/SignalManager$DTVChannelAudioInfo;
    .registers 9

    .prologue
    .line 912
    iget-object v5, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v5}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v4

    .line 913
    .local v4, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    invoke-interface {v4}, Lcom/mstar/tvsettingservice/ChannelDesk;->getAudioInfo()Lcom/mstar/android/tvapi/dtv/vo/DtvAudioInfo;

    move-result-object v1

    .line 915
    .local v1, "audioInfo":Lcom/mstar/android/tvapi/dtv/vo/DtvAudioInfo;
    if-eqz v1, :cond_55

    iget-object v5, v1, Lcom/mstar/android/tvapi/dtv/vo/DtvAudioInfo;->audioInfos:[Lcom/mstar/android/tvapi/dtv/vo/AudioInfo;

    if-eqz v5, :cond_55

    iget-object v5, v1, Lcom/mstar/android/tvapi/dtv/vo/DtvAudioInfo;->audioInfos:[Lcom/mstar/android/tvapi/dtv/vo/AudioInfo;

    array-length v5, v5

    if-lez v5, :cond_55

    .line 916
    iget-short v5, v1, Lcom/mstar/android/tvapi/dtv/vo/DtvAudioInfo;->currentAudioIndex:S

    if-ltz v5, :cond_55

    iget-short v5, v1, Lcom/mstar/android/tvapi/dtv/vo/DtvAudioInfo;->currentAudioIndex:S

    iget-object v6, v1, Lcom/mstar/android/tvapi/dtv/vo/DtvAudioInfo;->audioInfos:[Lcom/mstar/android/tvapi/dtv/vo/AudioInfo;

    array-length v6, v6

    if-ge v5, v6, :cond_55

    .line 917
    iget-object v5, v1, Lcom/mstar/android/tvapi/dtv/vo/DtvAudioInfo;->audioInfos:[Lcom/mstar/android/tvapi/dtv/vo/AudioInfo;

    iget-short v6, v1, Lcom/mstar/android/tvapi/dtv/vo/DtvAudioInfo;->currentAudioIndex:S

    aget-object v5, v5, v6

    iget-short v2, v5, Lcom/mstar/android/tvapi/dtv/vo/AudioInfo;->audioType:S

    .line 918
    .local v2, "audioType":I
    iget-short v0, v1, Lcom/mstar/android/tvapi/dtv/vo/DtvAudioInfo;->currentChannelMode:S

    .line 919
    .local v0, "audioChannel":I
    const-string/jumbo v5, "ChannelManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "getDtvChannelAudioInfo ---> audioType:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ", audioChannel:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 920
    new-instance v3, Lcom/stv/signalcommon/SignalManager$DTVChannelAudioInfo;

    invoke-direct {v3, v2, v0}, Lcom/stv/signalcommon/SignalManager$DTVChannelAudioInfo;-><init>(II)V

    .line 921
    .local v3, "dtvChannelAudioInfo":Lcom/stv/signalcommon/SignalManager$DTVChannelAudioInfo;
    return-object v3

    .line 925
    .end local v0    # "audioChannel":I
    .end local v2    # "audioType":I
    .end local v3    # "dtvChannelAudioInfo":Lcom/stv/signalcommon/SignalManager$DTVChannelAudioInfo;
    :cond_55
    const-string/jumbo v5, "ChannelManager"

    const-string/jumbo v6, "getDtvChannelAudioInfo ---> audioInfo is not exist"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 926
    new-instance v5, Lcom/stv/signalcommon/SignalManager$DTVChannelAudioInfo;

    sget-object v6, Lcom/stv/signalcommon/ChannelManager$EnumDTVAudioType;->E_AUDIOTYPE_UNDEFINED:Lcom/stv/signalcommon/ChannelManager$EnumDTVAudioType;

    invoke-virtual {v6}, Lcom/stv/signalcommon/ChannelManager$EnumDTVAudioType;->getValue()I

    move-result v6

    sget-object v7, Lcom/stv/signalcommon/ChannelManager$EnumDTVAudioChannel;->E_AUDIO_CHANNEL_UNDEFINED:Lcom/stv/signalcommon/ChannelManager$EnumDTVAudioChannel;

    invoke-virtual {v7}, Lcom/stv/signalcommon/ChannelManager$EnumDTVAudioChannel;->getValue()I

    move-result v7

    invoke-direct {v5, v6, v7}, Lcom/stv/signalcommon/SignalManager$DTVChannelAudioInfo;-><init>(II)V

    return-object v5
.end method

.method public getDtvChannelSignalState()I
    .registers 8

    .prologue
    .line 894
    iget-object v4, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v4}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v3

    .line 895
    .local v3, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    const/4 v2, 0x0

    .line 896
    .local v2, "state":I
    iget-object v4, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v4}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v4

    if-eqz v4, :cond_55

    .line 898
    :try_start_17
    invoke-interface {v3}, Lcom/mstar/tvsettingservice/ChannelDesk;->getCurrentSignalInformation()Lcom/mstar/android/tvapi/common/vo/DtvProgramSignalInfo;

    move-result-object v1

    .line 899
    .local v1, "signalInfo":Lcom/mstar/android/tvapi/common/vo/DtvProgramSignalInfo;
    const-string/jumbo v4, "ChannelManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "getDtvChannelSignalState() --> in signalInfo.quality:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v1, Lcom/mstar/android/tvapi/common/vo/DtvProgramSignalInfo;->quality:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 900
    const-string/jumbo v4, "ChannelManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "getDtvChannelSignalState() --> in signalInfo.strength:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v1, Lcom/mstar/android/tvapi/common/vo/DtvProgramSignalInfo;->strength:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 902
    iget v2, v1, Lcom/mstar/android/tvapi/common/vo/DtvProgramSignalInfo;->quality:I
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_55} :catch_56

    .line 908
    .end local v1    # "signalInfo":Lcom/mstar/android/tvapi/common/vo/DtvProgramSignalInfo;
    :cond_55
    :goto_55
    return v2

    .line 903
    :catch_56
    move-exception v0

    .line 904
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_55
.end method

.method public getEpgEventDescription(II)Ljava/lang/String;
    .registers 19
    .param p1, "channelIndex"    # I
    .param p2, "time"    # I

    .prologue
    .line 803
    const/4 v3, 0x0

    .line 804
    .local v3, "description":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v12}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v11

    .line 805
    .local v11, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v12}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getEpgManagerInstance()Lcom/mstar/tvsettingservice/EpgDesk;

    move-result-object v6

    .line 806
    .local v6, "ed":Lcom/mstar/tvsettingservice/EpgDesk;
    move/from16 v0, p1

    invoke-interface {v11, v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->getProgramInfoByIndex(I)Lcom/mstar/android/tvapi/common/vo/ProgramInfo;

    move-result-object v7

    .line 807
    .local v7, "program_info":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    const-wide/16 v8, 0x0

    .line 808
    .local v8, "offsetTimeInMs":J
    new-instance v2, Landroid/text/format/Time;

    invoke-direct {v2}, Landroid/text/format/Time;-><init>()V

    .line 809
    .local v2, "CurTime":Landroid/text/format/Time;
    invoke-virtual {v2}, Landroid/text/format/Time;->setToNow()V

    .line 810
    const/4 v12, 0x1

    invoke-virtual {v2, v12}, Landroid/text/format/Time;->toMillis(Z)J

    .line 812
    const/4 v12, 0x1

    :try_start_26
    invoke-interface {v6, v2, v12}, Lcom/mstar/tvsettingservice/EpgDesk;->getEpgEventOffsetTime(Landroid/text/format/Time;Z)I
    :try_end_29
    .catch Lcom/mstar/android/tvapi/common/exception/TvCommonException; {:try_start_26 .. :try_end_29} :catch_47

    move-result v12

    mul-int/lit16 v12, v12, 0x3e8

    int-to-long v8, v12

    .line 816
    :goto_2d
    new-instance v10, Landroid/text/format/Time;

    invoke-direct {v10}, Landroid/text/format/Time;-><init>()V

    .line 817
    .local v10, "startTime":Landroid/text/format/Time;
    move/from16 v0, p2

    int-to-long v12, v0

    const-wide/16 v14, 0x3e8

    mul-long/2addr v12, v14

    sub-long/2addr v12, v8

    invoke-virtual {v10, v12, v13}, Landroid/text/format/Time;->set(J)V

    .line 819
    :try_start_3c
    iget-short v12, v7, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->serviceType:S

    iget v13, v7, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->number:I

    sget-object v14, Lcom/mstar/android/tvapi/dtv/vo/DtvType$EnumEpgDescriptionType;->E_DETAIL_DESCRIPTION:Lcom/mstar/android/tvapi/dtv/vo/DtvType$EnumEpgDescriptionType;

    invoke-interface {v6, v12, v13, v10, v14}, Lcom/mstar/tvsettingservice/EpgDesk;->getEventDescriptor(SILandroid/text/format/Time;Lcom/mstar/android/tvapi/dtv/vo/DtvType$EnumEpgDescriptionType;)Ljava/lang/String;
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_3c .. :try_end_45} :catch_4c

    move-result-object v3

    .line 823
    .end local v3    # "description":Ljava/lang/String;
    :goto_46
    return-object v3

    .line 813
    .end local v10    # "startTime":Landroid/text/format/Time;
    .restart local v3    # "description":Ljava/lang/String;
    :catch_47
    move-exception v5

    .line 814
    .local v5, "e1":Lcom/mstar/android/tvapi/common/exception/TvCommonException;
    invoke-virtual {v5}, Lcom/mstar/android/tvapi/common/exception/TvCommonException;->printStackTrace()V

    goto :goto_2d

    .line 820
    .end local v5    # "e1":Lcom/mstar/android/tvapi/common/exception/TvCommonException;
    .restart local v10    # "startTime":Landroid/text/format/Time;
    :catch_4c
    move-exception v4

    .line 821
    .local v4, "e":Ljava/lang/Exception;
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_46
.end method

.method public getEpgEventList()Ljava/util/ArrayList;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 779
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 780
    .local v4, "epgList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;>;"
    iget-object v6, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v6}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v5

    .line 781
    .local v5, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    iget-object v6, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v6}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getEpgManagerInstance()Lcom/mstar/tvsettingservice/EpgDesk;

    move-result-object v3

    .line 782
    .local v3, "ed":Lcom/mstar/tvsettingservice/EpgDesk;
    invoke-interface {v5}, Lcom/mstar/tvsettingservice/ChannelDesk;->getCurrProgramInfo()Lcom/mstar/android/tvapi/common/vo/ProgramInfo;

    move-result-object v1

    .line 784
    .local v1, "currProg_Info":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    new-instance v0, Landroid/text/format/Time;

    invoke-direct {v0}, Landroid/text/format/Time;-><init>()V

    .line 785
    .local v0, "curTime":Landroid/text/format/Time;
    invoke-virtual {v0}, Landroid/text/format/Time;->setToNow()V

    .line 786
    const/4 v6, 0x1

    invoke-virtual {v0, v6}, Landroid/text/format/Time;->toMillis(Z)J

    .line 789
    iget-object v6, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v6}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v6

    if-eqz v6, :cond_3b

    .line 792
    :try_start_31
    iget-short v6, v1, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->serviceType:S

    iget v7, v1, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->number:I

    const/16 v8, 0x1e

    invoke-interface {v3, v6, v7, v0, v8}, Lcom/mstar/tvsettingservice/EpgDesk;->getEventInfo(SILandroid/text/format/Time;I)Ljava/util/ArrayList;
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_3a} :catch_3c

    move-result-object v4

    .line 799
    :cond_3b
    :goto_3b
    return-object v4

    .line 793
    :catch_3c
    move-exception v2

    .line 794
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3b
.end method

.method public getEpgEventListByChannelIndex(I)Ljava/util/ArrayList;
    .registers 11
    .param p1, "channelIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 840
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 841
    .local v2, "epgList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;>;"
    iget-object v6, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v6}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v5

    .line 842
    .local v5, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    iget-object v6, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v6}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getEpgManagerInstance()Lcom/mstar/tvsettingservice/EpgDesk;

    move-result-object v1

    .line 844
    .local v1, "ed":Lcom/mstar/tvsettingservice/EpgDesk;
    invoke-interface {v5, p1}, Lcom/mstar/tvsettingservice/ChannelDesk;->getProgramInfoByIndex(I)Lcom/mstar/android/tvapi/common/vo/ProgramInfo;

    move-result-object v3

    .line 846
    .local v3, "programInfo":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    new-instance v4, Landroid/text/format/Time;

    invoke-direct {v4}, Landroid/text/format/Time;-><init>()V

    .line 847
    .local v4, "time":Landroid/text/format/Time;
    invoke-virtual {v4}, Landroid/text/format/Time;->setToNow()V

    .line 848
    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Landroid/text/format/Time;->toMillis(Z)J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Landroid/text/format/Time;->set(J)V

    .line 850
    iget-object v6, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v6}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v6

    invoke-virtual {v6}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v6

    if-eqz v6, :cond_3f

    .line 853
    :try_start_35
    iget-short v6, v3, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->serviceType:S

    iget v7, v3, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->number:I

    const/16 v8, 0x3e8

    invoke-interface {v1, v6, v7, v4, v8}, Lcom/mstar/tvsettingservice/EpgDesk;->getEventInfo(SILandroid/text/format/Time;I)Ljava/util/ArrayList;
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_3e} :catch_40

    move-result-object v2

    .line 859
    :cond_3f
    :goto_3f
    return-object v2

    .line 854
    :catch_40
    move-exception v0

    .line 855
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_3f
.end method

.method public getEpgEventListByChannelIndexEx(I)Ljava/util/ArrayList;
    .registers 15
    .param p1, "channelIndex"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/stv/signalcommon/SignalManager$EpgEventInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 862
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 863
    .local v7, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/stv/signalcommon/SignalManager$EpgEventInfo;>;"
    iget-object v10, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v10}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v9

    .line 864
    .local v9, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    iget-object v10, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v10}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getEpgManagerInstance()Lcom/mstar/tvsettingservice/EpgDesk;

    move-result-object v2

    .line 866
    .local v2, "ed":Lcom/mstar/tvsettingservice/EpgDesk;
    invoke-interface {v9, p1}, Lcom/mstar/tvsettingservice/ChannelDesk;->getProgramInfoByIndex(I)Lcom/mstar/android/tvapi/common/vo/ProgramInfo;

    move-result-object v6

    .line 868
    .local v6, "programInfo":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    new-instance v8, Landroid/text/format/Time;

    invoke-direct {v8}, Landroid/text/format/Time;-><init>()V

    .line 869
    .local v8, "time":Landroid/text/format/Time;
    invoke-virtual {v8}, Landroid/text/format/Time;->setToNow()V

    .line 870
    const/4 v10, 0x1

    invoke-virtual {v8, v10}, Landroid/text/format/Time;->toMillis(Z)J

    move-result-wide v10

    invoke-virtual {v8, v10, v11}, Landroid/text/format/Time;->set(J)V

    .line 872
    iget-object v10, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v10}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v10

    invoke-virtual {v10}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v10

    invoke-virtual {v10}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v10

    if-eqz v10, :cond_74

    .line 875
    :try_start_35
    iget-short v10, v6, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->serviceType:S

    iget v11, v6, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->number:I

    const/16 v12, 0x3e8

    invoke-interface {v2, v10, v11, v8, v12}, Lcom/mstar/tvsettingservice/EpgDesk;->getEventInfo(SILandroid/text/format/Time;I)Ljava/util/ArrayList;

    move-result-object v5

    .line 876
    .local v5, "epgList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;>;"
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "ei$iterator":Ljava/util/Iterator;
    :goto_43
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_74

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;

    .line 877
    .local v3, "ei":Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;
    new-instance v0, Lcom/stv/signalcommon/SignalManager$EpgEventInfo;

    invoke-direct {v0}, Lcom/stv/signalcommon/SignalManager$EpgEventInfo;-><init>()V

    .line 878
    .local v0, "a":Lcom/stv/signalcommon/SignalManager$EpgEventInfo;
    iget v10, v3, Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;->startTime:I

    iput v10, v0, Lcom/stv/signalcommon/SignalManager$EpgEventInfo;->startTime:I

    .line 879
    iget v10, v3, Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;->endTime:I

    iput v10, v0, Lcom/stv/signalcommon/SignalManager$EpgEventInfo;->endTime:I

    .line 880
    iget v10, v3, Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;->durationTime:I

    iput v10, v0, Lcom/stv/signalcommon/SignalManager$EpgEventInfo;->durationTime:I

    .line 881
    iget-object v10, v3, Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;->name:Ljava/lang/String;

    iput-object v10, v0, Lcom/stv/signalcommon/SignalManager$EpgEventInfo;->name:Ljava/lang/String;

    .line 882
    iget-object v10, v3, Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;->description:Ljava/lang/String;

    iput-object v10, v0, Lcom/stv/signalcommon/SignalManager$EpgEventInfo;->description:Ljava/lang/String;

    .line 883
    iget v10, v3, Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;->originalStartTime:I

    iput v10, v0, Lcom/stv/signalcommon/SignalManager$EpgEventInfo;->originalStartTime:I

    .line 884
    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_6f} :catch_70

    goto :goto_43

    .line 886
    .end local v0    # "a":Lcom/stv/signalcommon/SignalManager$EpgEventInfo;
    .end local v3    # "ei":Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;
    .end local v4    # "ei$iterator":Ljava/util/Iterator;
    .end local v5    # "epgList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;>;"
    :catch_70
    move-exception v1

    .line 887
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 891
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_74
    return-object v7
.end method

.method public getEpgEventOffsetTime()J
    .registers 8

    .prologue
    const/4 v6, 0x1

    .line 827
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v3}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getEpgManagerInstance()Lcom/mstar/tvsettingservice/EpgDesk;

    move-result-object v2

    .line 828
    .local v2, "ed":Lcom/mstar/tvsettingservice/EpgDesk;
    const-wide/16 v4, 0x0

    .line 829
    .local v4, "offsetTimeInMs":J
    new-instance v0, Landroid/text/format/Time;

    invoke-direct {v0}, Landroid/text/format/Time;-><init>()V

    .line 830
    .local v0, "curTime":Landroid/text/format/Time;
    invoke-virtual {v0}, Landroid/text/format/Time;->setToNow()V

    .line 831
    invoke-virtual {v0, v6}, Landroid/text/format/Time;->toMillis(Z)J

    .line 833
    const/4 v3, 0x1

    :try_start_15
    invoke-interface {v2, v0, v3}, Lcom/mstar/tvsettingservice/EpgDesk;->getEpgEventOffsetTime(Landroid/text/format/Time;Z)I
    :try_end_18
    .catch Lcom/mstar/android/tvapi/common/exception/TvCommonException; {:try_start_15 .. :try_end_18} :catch_1d

    move-result v3

    mul-int/lit16 v3, v3, 0x3e8

    int-to-long v4, v3

    .line 837
    :goto_1c
    return-wide v4

    .line 834
    :catch_1d
    move-exception v1

    .line 835
    .local v1, "e1":Lcom/mstar/android/tvapi/common/exception/TvCommonException;
    invoke-virtual {v1}, Lcom/mstar/android/tvapi/common/exception/TvCommonException;->printStackTrace()V

    goto :goto_1c
.end method

.method public getFreqStatus()[I
    .registers 8

    .prologue
    .line 456
    const-string/jumbo v4, "ChannelManager"

    const-string/jumbo v5, "getFreqStatus ---> in"

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 457
    iget-object v4, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v4}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v3

    .line 458
    .local v3, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    const/4 v4, 0x2

    new-array v1, v4, [I

    .line 460
    .local v1, "result":[I
    :try_start_12
    invoke-interface {v3}, Lcom/mstar/tvsettingservice/ChannelDesk;->getCurrentSignalInformation()Lcom/mstar/android/tvapi/common/vo/DtvProgramSignalInfo;

    move-result-object v2

    .line 461
    .local v2, "signalInfo":Lcom/mstar/android/tvapi/common/vo/DtvProgramSignalInfo;
    const-string/jumbo v4, "ChannelManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "getFreqStatus() --> in signalInfo.strength:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v2, Lcom/mstar/android/tvapi/common/vo/DtvProgramSignalInfo;->strength:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 462
    const-string/jumbo v4, "ChannelManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "getFreqStatus() --> in signalInfo.quality:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v2, Lcom/mstar/android/tvapi/common/vo/DtvProgramSignalInfo;->quality:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 463
    iget v4, v2, Lcom/mstar/android/tvapi/common/vo/DtvProgramSignalInfo;->strength:I

    const/4 v5, 0x0

    aput v4, v1, v5

    .line 464
    iget v4, v2, Lcom/mstar/android/tvapi/common/vo/DtvProgramSignalInfo;->quality:I

    const/4 v5, 0x1

    aput v4, v1, v5
    :try_end_58
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_58} :catch_59

    .line 469
    .end local v2    # "signalInfo":Lcom/mstar/android/tvapi/common/vo/DtvProgramSignalInfo;
    :goto_58
    return-object v1

    .line 465
    :catch_59
    move-exception v0

    .line 466
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_58
.end method

.method public getFrequencyBand(I)Ljava/lang/String;
    .registers 3
    .param p1, "freq"    # I

    .prologue
    .line 1099
    invoke-static {p1}, Lcom/stv/signalcommon/MstarUtils;->getFrequencyBand(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNextBand(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "band"    # Ljava/lang/String;

    .prologue
    .line 1103
    invoke-static {p1}, Lcom/stv/signalcommon/Utils;->getNextBand(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNextChannelEPG()Ljava/lang/String;
    .registers 16

    .prologue
    .line 742
    iget-object v11, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v11}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v10

    .line 743
    .local v10, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    const-string/jumbo v5, ""

    .line 744
    .local v5, "epg":Ljava/lang/String;
    iget-object v11, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v11}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getEpgManagerInstance()Lcom/mstar/tvsettingservice/EpgDesk;

    move-result-object v4

    .line 745
    .local v4, "ed":Lcom/mstar/tvsettingservice/EpgDesk;
    invoke-interface {v10}, Lcom/mstar/tvsettingservice/ChannelDesk;->getCurrProgramInfo()Lcom/mstar/android/tvapi/common/vo/ProgramInfo;

    move-result-object v1

    .line 746
    .local v1, "currProg_Info":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    const-string/jumbo v11, "ChannelManager"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "getNextChannelEPG() --> in currProg_Info.number:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget v13, v1, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->number:I

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 747
    const-string/jumbo v11, "ChannelManager"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "getNextChannelEPG() --> in currProg_Info.serviceName:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, v1, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->serviceName:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 748
    const-string/jumbo v11, "ChannelManager"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "getNextChannelEPG() --> in currProg_Info.serviceType:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-short v13, v1, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->serviceType:S

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 749
    iget-object v11, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v11}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v11

    invoke-virtual {v11}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v11

    invoke-virtual {v11}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v11

    if-eqz v11, :cond_dc

    .line 751
    :try_start_77
    iget-short v11, v1, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->serviceType:S

    iget v12, v1, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->number:I

    .line 752
    sget-object v13, Lcom/mstar/android/tvapi/dtv/vo/DtvType$EnumEpgDescriptionType;->E_DETAIL_DESCRIPTION:Lcom/mstar/android/tvapi/dtv/vo/DtvType$EnumEpgDescriptionType;

    .line 751
    const/4 v14, 0x0

    invoke-interface {v4, v11, v12, v14, v13}, Lcom/mstar/tvsettingservice/EpgDesk;->getPresentFollowingEventInfo(SIZLcom/mstar/android/tvapi/dtv/vo/DtvType$EnumEpgDescriptionType;)Lcom/mstar/android/tvapi/common/vo/PresentFollowingEventInfo;

    move-result-object v8

    .line 753
    .local v8, "pfEvtInfo":Lcom/mstar/android/tvapi/common/vo/PresentFollowingEventInfo;
    const-string/jumbo v11, "ChannelManager"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "getNextChannelEPG() --> pfEvtInfo:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 754
    if-eqz v8, :cond_dc

    .line 755
    const-wide/16 v6, 0x0

    .line 757
    .local v6, "offsetTimeInMs":J
    new-instance v0, Landroid/text/format/Time;

    invoke-direct {v0}, Landroid/text/format/Time;-><init>()V

    .line 758
    .local v0, "curTime":Landroid/text/format/Time;
    invoke-virtual {v0}, Landroid/text/format/Time;->setToNow()V

    .line 759
    const/4 v11, 0x1

    invoke-virtual {v0, v11}, Landroid/text/format/Time;->toMillis(Z)J
    :try_end_ac
    .catch Ljava/lang/Exception; {:try_start_77 .. :try_end_ac} :catch_fc

    .line 761
    const/4 v11, 0x1

    :try_start_ad
    invoke-interface {v4, v0, v11}, Lcom/mstar/tvsettingservice/EpgDesk;->getEpgEventOffsetTime(Landroid/text/format/Time;Z)I
    :try_end_b0
    .catch Lcom/mstar/android/tvapi/common/exception/TvCommonException; {:try_start_ad .. :try_end_b0} :catch_f7
    .catch Ljava/lang/Exception; {:try_start_ad .. :try_end_b0} :catch_fc

    move-result v11

    mul-int/lit16 v11, v11, 0x3e8

    int-to-long v6, v11

    .line 765
    :goto_b4
    :try_start_b4
    iget-object v11, v8, Lcom/mstar/android/tvapi/common/vo/PresentFollowingEventInfo;->eventInfo:Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;

    iget v11, v11, Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;->startTime:I

    iget-object v12, v8, Lcom/mstar/android/tvapi/common/vo/PresentFollowingEventInfo;->eventInfo:Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;

    iget v12, v12, Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;->endTime:I

    invoke-static {v11, v12, v6, v7}, Lcom/stv/signalcommon/Utils;->getTimeString(IIJ)Ljava/lang/String;

    move-result-object v9

    .line 766
    .local v9, "time":Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v12, v8, Lcom/mstar/android/tvapi/common/vo/PresentFollowingEventInfo;->eventInfo:Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;

    iget-object v12, v12, Lcom/mstar/android/tvapi/dtv/vo/EpgEventInfo;->name:Ljava/lang/String;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_db
    .catch Ljava/lang/Exception; {:try_start_b4 .. :try_end_db} :catch_fc

    move-result-object v5

    .line 774
    .end local v0    # "curTime":Landroid/text/format/Time;
    .end local v6    # "offsetTimeInMs":J
    .end local v8    # "pfEvtInfo":Lcom/mstar/android/tvapi/common/vo/PresentFollowingEventInfo;
    .end local v9    # "time":Ljava/lang/String;
    :cond_dc
    :goto_dc
    const-string/jumbo v11, "ChannelManager"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v13, "getCurrentChannelEPG() --> epg:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 775
    return-object v5

    .line 762
    .restart local v0    # "curTime":Landroid/text/format/Time;
    .restart local v6    # "offsetTimeInMs":J
    .restart local v8    # "pfEvtInfo":Lcom/mstar/android/tvapi/common/vo/PresentFollowingEventInfo;
    :catch_f7
    move-exception v3

    .line 763
    .local v3, "e1":Lcom/mstar/android/tvapi/common/exception/TvCommonException;
    :try_start_f8
    invoke-virtual {v3}, Lcom/mstar/android/tvapi/common/exception/TvCommonException;->printStackTrace()V
    :try_end_fb
    .catch Ljava/lang/Exception; {:try_start_f8 .. :try_end_fb} :catch_fc

    goto :goto_b4

    .line 768
    .end local v0    # "curTime":Landroid/text/format/Time;
    .end local v3    # "e1":Lcom/mstar/android/tvapi/common/exception/TvCommonException;
    .end local v6    # "offsetTimeInMs":J
    .end local v8    # "pfEvtInfo":Lcom/mstar/android/tvapi/common/vo/PresentFollowingEventInfo;
    :catch_fc
    move-exception v2

    .line 769
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_dc
.end method

.method public getPreBand(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "band"    # Ljava/lang/String;

    .prologue
    .line 1111
    invoke-static {p1}, Lcom/stv/signalcommon/Utils;->getPreBand(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getProgramInfoByNum(I)Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    .registers 7
    .param p1, "channelNum"    # I

    .prologue
    const/4 v4, 0x0

    .line 981
    const/4 v1, 0x0

    .line 982
    .local v1, "programInfo":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v3}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v3

    if-eqz v3, :cond_35

    .line 983
    invoke-virtual {p0, v4}, Lcom/stv/signalcommon/ChannelManager;->getChannelList(Z)Ljava/util/ArrayList;

    move-result-object v2

    .line 984
    .local v2, "progranInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mstar/android/tvapi/common/vo/ProgramInfo;>;"
    if-eqz v2, :cond_35

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_35

    .line 985
    const/4 v0, 0x0

    .end local v1    # "programInfo":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    .local v0, "i":I
    :goto_1f
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_35

    .line 986
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;

    .line 987
    .local v1, "programInfo":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    if-eqz v1, :cond_32

    iget v3, v1, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->number:I

    if-ne v3, p1, :cond_32

    .line 989
    return-object v1

    .line 985
    :cond_32
    add-int/lit8 v0, v0, 0x1

    goto :goto_1f

    .line 995
    .end local v0    # "i":I
    .end local v1    # "programInfo":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    .end local v2    # "progranInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mstar/android/tvapi/common/vo/ProgramInfo;>;"
    :cond_35
    return-object v1
.end method

.method public getSubtitle()Lcom/stv/signalcommon/ChannelManager$Subtitle;
    .registers 9

    .prologue
    const/4 v7, 0x0

    .line 1393
    const-string/jumbo v5, "ChannelManager"

    const-string/jumbo v6, "getSubtitle() ---> In"

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1394
    iget-object v5, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v5}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v0

    .line 1395
    .local v0, "channelDeskInstance":Lcom/mstar/tvsettingservice/ChannelDesk;
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->getSubtitleInfo()Lcom/mstar/android/tvapi/dtv/vo/DtvSubtitleInfo;

    move-result-object v4

    .line 1396
    .local v4, "subtitleInfo":Lcom/mstar/android/tvapi/dtv/vo/DtvSubtitleInfo;
    if-nez v4, :cond_17

    .line 1398
    return-object v7

    .line 1401
    :cond_17
    const-string/jumbo v5, "ChannelManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "subtitleCount:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v4, Lcom/mstar/android/tvapi/dtv/vo/DtvSubtitleInfo;->subtitleServices:[Lcom/mstar/android/tvapi/dtv/vo/MenuSubtitleService;

    array-length v7, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1402
    const-string/jumbo v5, "ChannelManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "currentSubtitleIndex:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-short v7, v4, Lcom/mstar/android/tvapi/dtv/vo/DtvSubtitleInfo;->currentSubtitleIndex:S

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1403
    const-string/jumbo v5, "ChannelManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "subtitleServiceNumber:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-short v7, v4, Lcom/mstar/android/tvapi/dtv/vo/DtvSubtitleInfo;->subtitleServiceNumber:S

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1404
    const/4 v3, 0x0

    .line 1405
    .local v3, "subtitle":Lcom/stv/signalcommon/ChannelManager$Subtitle;
    if-eqz v4, :cond_ea

    iget-object v5, v4, Lcom/mstar/android/tvapi/dtv/vo/DtvSubtitleInfo;->subtitleServices:[Lcom/mstar/android/tvapi/dtv/vo/MenuSubtitleService;

    if-eqz v5, :cond_ea

    iget-short v5, v4, Lcom/mstar/android/tvapi/dtv/vo/DtvSubtitleInfo;->subtitleServiceNumber:S

    if-lez v5, :cond_ea

    .line 1406
    iget-short v1, v4, Lcom/mstar/android/tvapi/dtv/vo/DtvSubtitleInfo;->currentSubtitleIndex:S

    .line 1407
    .local v1, "currentSubtitleIndex":I
    const-string/jumbo v5, "ChannelManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "subtitleCount:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, v4, Lcom/mstar/android/tvapi/dtv/vo/DtvSubtitleInfo;->subtitleServices:[Lcom/mstar/android/tvapi/dtv/vo/MenuSubtitleService;

    array-length v7, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1408
    const-string/jumbo v5, "ChannelManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "currentSubtitleIndex:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1409
    const-string/jumbo v5, "ChannelManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "subtitleServiceNumber:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-short v7, v4, Lcom/mstar/android/tvapi/dtv/vo/DtvSubtitleInfo;->subtitleServiceNumber:S

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1411
    if-ltz v1, :cond_d2

    iget-short v5, v4, Lcom/mstar/android/tvapi/dtv/vo/DtvSubtitleInfo;->subtitleServiceNumber:S

    if-lt v1, v5, :cond_d3

    .line 1412
    :cond_d2
    const/4 v1, -0x1

    .line 1415
    :cond_d3
    new-instance v3, Lcom/stv/signalcommon/ChannelManager$Subtitle;

    .end local v3    # "subtitle":Lcom/stv/signalcommon/ChannelManager$Subtitle;
    invoke-direct {v3, p0}, Lcom/stv/signalcommon/ChannelManager$Subtitle;-><init>(Lcom/stv/signalcommon/ChannelManager;)V

    .line 1416
    .local v3, "subtitle":Lcom/stv/signalcommon/ChannelManager$Subtitle;
    invoke-virtual {v3, v1}, Lcom/stv/signalcommon/ChannelManager$Subtitle;->setCurrentSubtitleIndex(I)V

    .line 1417
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_dc
    iget-short v5, v4, Lcom/mstar/android/tvapi/dtv/vo/DtvSubtitleInfo;->subtitleServiceNumber:S

    if-ge v2, v5, :cond_ea

    .line 1418
    iget-object v5, v4, Lcom/mstar/android/tvapi/dtv/vo/DtvSubtitleInfo;->subtitleServices:[Lcom/mstar/android/tvapi/dtv/vo/MenuSubtitleService;

    aget-object v5, v5, v2

    invoke-virtual {v3, v5}, Lcom/stv/signalcommon/ChannelManager$Subtitle;->addToSubtitleList(Lcom/mstar/android/tvapi/dtv/vo/MenuSubtitleService;)V

    .line 1417
    add-int/lit8 v2, v2, 0x1

    goto :goto_dc

    .line 1421
    .end local v1    # "currentSubtitleIndex":I
    .end local v2    # "i":I
    .end local v3    # "subtitle":Lcom/stv/signalcommon/ChannelManager$Subtitle;
    :cond_ea
    return-object v3
.end method

.method public getTotalChannelCount()I
    .registers 6

    .prologue
    .line 930
    iget-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v2}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v1

    .line 931
    .local v1, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    const/4 v0, 0x0

    .line 932
    .local v0, "count":I
    iget-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v2}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v2

    if-eqz v2, :cond_38

    .line 933
    sget-object v2, Lcom/mstar/android/tvapi/common/vo/EnumProgramCountType;->E_COUNT_DTV_TV:Lcom/mstar/android/tvapi/common/vo/EnumProgramCountType;

    invoke-interface {v1, v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->getProgramCount(Lcom/mstar/android/tvapi/common/vo/EnumProgramCountType;)I

    move-result v0

    .line 934
    const-string/jumbo v2, "ChannelManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Get DTV total channel count:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 939
    :goto_37
    return v0

    .line 936
    :cond_38
    sget-object v2, Lcom/mstar/android/tvapi/common/vo/EnumProgramCountType;->E_COUNT_ATV:Lcom/mstar/android/tvapi/common/vo/EnumProgramCountType;

    invoke-interface {v1, v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->getProgramCount(Lcom/mstar/android/tvapi/common/vo/EnumProgramCountType;)I

    move-result v0

    .line 937
    const-string/jumbo v2, "ChannelManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Get ATV total channel count:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_37
.end method

.method public initialize()V
    .registers 1

    .prologue
    .line 211
    return-void
.end method

.method public isChannelExist(I)Z
    .registers 10
    .param p1, "channelNum"    # I

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 957
    const-string/jumbo v3, "ChannelManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "isChannelExist ---> channelNum:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 958
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v3}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v3

    if-eqz v3, :cond_75

    .line 960
    invoke-virtual {p0, v6}, Lcom/stv/signalcommon/ChannelManager;->getChannelList(Z)Ljava/util/ArrayList;

    move-result-object v2

    .line 961
    .local v2, "progranInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mstar/android/tvapi/common/vo/ProgramInfo;>;"
    if-eqz v2, :cond_7e

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-lez v3, :cond_7e

    .line 962
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_39
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v0, v3, :cond_7e

    .line 963
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;

    .line 964
    .local v1, "programInfo":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    const-string/jumbo v4, "ChannelManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "isChannelExist ---> programInfo:"

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_6b

    const-string/jumbo v3, ""

    :goto_61
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 965
    if-eqz v1, :cond_72

    iget v3, v1, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->number:I

    if-ne v3, p1, :cond_72

    .line 967
    return v7

    .line 964
    :cond_6b
    iget v3, v1, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->number:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_61

    .line 962
    :cond_72
    add-int/lit8 v0, v0, 0x1

    goto :goto_39

    .line 973
    .end local v0    # "i":I
    .end local v1    # "programInfo":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    .end local v2    # "progranInfoList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/mstar/android/tvapi/common/vo/ProgramInfo;>;"
    :cond_75
    if-lt p1, v7, :cond_7e

    invoke-virtual {p0}, Lcom/stv/signalcommon/ChannelManager;->getTotalChannelCount()I

    move-result v3

    if-gt p1, v3, :cond_7e

    .line 974
    return v7

    .line 977
    :cond_7e
    return v6
.end method

.method public isChannelSkipped(I)Z
    .registers 11
    .param p1, "channelNum"    # I

    .prologue
    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 572
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v1}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v0

    .line 573
    .local v0, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    const/4 v8, 0x0

    .line 574
    .local v8, "ret":Z
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v1}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v1

    if-eqz v1, :cond_2c

    .line 575
    invoke-virtual {p0, p1}, Lcom/stv/signalcommon/ChannelManager;->getProgramInfoByNum(I)Lcom/mstar/android/tvapi/common/vo/ProgramInfo;

    move-result-object v7

    .line 576
    .local v7, "programInfo":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    if-nez v7, :cond_20

    .line 577
    return v8

    .line 579
    :cond_20
    sget-object v1, Lcom/mstar/android/tvapi/common/vo/EnumProgramAttribute;->E_SKIP:Lcom/mstar/android/tvapi/common/vo/EnumProgramAttribute;

    iget v2, v7, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->number:I

    iget-short v3, v7, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->serviceType:S

    move v5, v4

    invoke-interface/range {v0 .. v5}, Lcom/mstar/tvsettingservice/ChannelDesk;->getProgramAttribute(Lcom/mstar/android/tvapi/common/vo/EnumProgramAttribute;ISIZ)Z

    move-result v8

    .line 582
    .local v8, "ret":Z
    return v8

    .line 584
    .end local v7    # "programInfo":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    .local v8, "ret":Z
    :cond_2c
    sget-object v1, Lcom/mstar/android/tvapi/atv/vo/EnumGetProgramInfo;->E_IS_PROGRAM_SKIPPED:Lcom/mstar/android/tvapi/atv/vo/EnumGetProgramInfo;

    add-int/lit8 v2, p1, -0x1

    invoke-interface {v0, v1, v2, v4, v3}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvGetProgramInfo(Lcom/mstar/android/tvapi/atv/vo/EnumGetProgramInfo;IILjava/lang/StringBuffer;)I

    move-result v6

    .line 585
    .local v6, "isSkipped":I
    const-string/jumbo v1, "ChannelManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Channel num:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", check skip is:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 586
    if-eqz v6, :cond_5e

    if-eqz p1, :cond_5e

    .line 587
    const/4 v8, 0x1

    .line 590
    :cond_5e
    return v8
.end method

.method public isManualScanForwardDirection()Z
    .registers 4

    .prologue
    .line 408
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v1}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v0

    .line 409
    .local v0, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->GetTsStatus()Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    move-result-object v1

    sget-object v2, Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;->E_TS_ATV_MANU_TUNING_RIGHT:Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    if-ne v1, v2, :cond_10

    .line 410
    const/4 v1, 0x1

    return v1

    .line 412
    :cond_10
    const/4 v1, 0x0

    return v1
.end method

.method public isProgramActive(I)Z
    .registers 9
    .param p1, "channelNum"    # I

    .prologue
    const/4 v6, 0x0

    .line 1425
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v3}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v2

    .line 1426
    .local v2, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    const/4 v1, 0x0

    .line 1427
    .local v1, "ret":Z
    sget-object v3, Lcom/mstar/android/tvapi/atv/vo/EnumGetProgramCtrl;->E_IS_PROGRAM_NUMBER_ACTIVE:Lcom/mstar/android/tvapi/atv/vo/EnumGetProgramCtrl;

    add-int/lit8 v4, p1, -0x1

    const/4 v5, 0x0

    invoke-interface {v2, v3, v4, v6, v5}, Lcom/mstar/tvsettingservice/ChannelDesk;->getProgramCtrl(Lcom/mstar/android/tvapi/atv/vo/EnumGetProgramCtrl;IILjava/lang/String;)I

    move-result v0

    .line 1428
    .local v0, "isActive":I
    const-string/jumbo v3, "ChannelManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Channel num:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", check active is:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1429
    if-eqz v0, :cond_3b

    if-eqz p1, :cond_3b

    .line 1430
    const/4 v1, 0x1

    .line 1432
    :cond_3b
    return v1
.end method

.method public isScanInProgress()Z
    .registers 7

    .prologue
    .line 348
    const/4 v0, 0x0

    .line 349
    .local v0, "ret":Z
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v3}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v1

    .line 350
    .local v1, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    invoke-interface {v1}, Lcom/mstar/tvsettingservice/ChannelDesk;->GetTsStatus()Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    move-result-object v2

    .line 351
    .local v2, "tv_ts_status":Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;
    const-string/jumbo v3, "ChannelManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "isScanInProgress ---> tv_ts_status:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 352
    sget-object v3, Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;->E_TS_NONE:Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    if-eq v2, v3, :cond_2a

    .line 353
    const/4 v0, 0x1

    .line 356
    :cond_2a
    return v0
.end method

.method public manualScanStart(IZ)V
    .registers 8
    .param p1, "freq"    # I
    .param p2, "isForwardDirection"    # Z

    .prologue
    const/16 v4, 0x1388

    .line 498
    iget-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v2}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v1

    .line 499
    .local v1, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    iget-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v2}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v2

    if-nez v2, :cond_37

    .line 500
    const/4 v0, 0x0

    .line 502
    .local v0, "ret":Z
    if-eqz p2, :cond_38

    .line 503
    invoke-interface {v1}, Lcom/mstar/tvsettingservice/ChannelDesk;->GetTsStatus()Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    move-result-object v2

    sget-object v3, Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;->E_TS_ATV_MANU_TUNING_LEFT:Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    if-ne v2, v3, :cond_26

    .line 504
    invoke-interface {v1}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetManualTuningEnd()V

    .line 509
    :cond_26
    sget-object v2, Lcom/mstar/android/tvapi/atv/vo/EnumAtvManualTuneMode;->E_MANUAL_TUNE_MODE_SEARCH_ONE_TO_UP:Lcom/mstar/android/tvapi/atv/vo/EnumAtvManualTuneMode;

    .line 507
    invoke-interface {v1, v4, p1, v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetManualTuningStart(IILcom/mstar/android/tvapi/atv/vo/EnumAtvManualTuneMode;)Z

    move-result v0

    .line 523
    .local v0, "ret":Z
    :goto_2c
    if-eqz v0, :cond_4a

    .line 524
    const-string/jumbo v2, "ChannelManager"

    const-string/jumbo v3, "Atv Manual scan start successfully!"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 497
    .end local v0    # "ret":Z
    :cond_37
    :goto_37
    return-void

    .line 512
    .local v0, "ret":Z
    :cond_38
    invoke-interface {v1}, Lcom/mstar/tvsettingservice/ChannelDesk;->GetTsStatus()Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    move-result-object v2

    sget-object v3, Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;->E_TS_ATV_MANU_TUNING_RIGHT:Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    if-ne v2, v3, :cond_43

    .line 513
    invoke-interface {v1}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetManualTuningEnd()V

    .line 518
    :cond_43
    sget-object v2, Lcom/mstar/android/tvapi/atv/vo/EnumAtvManualTuneMode;->E_MANUAL_TUNE_MODE_SEARCH_ONE_TO_DOWN:Lcom/mstar/android/tvapi/atv/vo/EnumAtvManualTuneMode;

    .line 516
    invoke-interface {v1, v4, p1, v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetManualTuningStart(IILcom/mstar/android/tvapi/atv/vo/EnumAtvManualTuneMode;)Z

    move-result v0

    .local v0, "ret":Z
    goto :goto_2c

    .line 526
    :cond_4a
    const-string/jumbo v2, "ChannelManager"

    const-string/jumbo v3, "Atv Manual scan start failed!"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_37
.end method

.method public manualScanStop()V
    .registers 4

    .prologue
    .line 532
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v1}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v0

    .line 533
    .local v0, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->GetTsStatus()Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    move-result-object v1

    sget-object v2, Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;->E_TS_NONE:Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    if-eq v1, v2, :cond_28

    .line 534
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v1}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v1

    if-eqz v1, :cond_29

    .line 535
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->DtvStopScan()Z

    .line 536
    sget-object v1, Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceInputType;->E_FIRST_SERVICE_DTV:Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceInputType;

    sget-object v2, Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceType;->E_DEFAULT:Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceType;

    invoke-interface {v0, v1, v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->changeToFirstService(Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceInputType;Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceType;)Z

    .line 531
    :cond_28
    :goto_28
    return-void

    .line 538
    :cond_29
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetManualTuningEnd()V

    goto :goto_28
.end method

.method public manualScanStop(Z)V
    .registers 6
    .param p1, "isDtv"    # Z

    .prologue
    .line 543
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v1}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v0

    .line 544
    .local v0, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->GetTsStatus()Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    move-result-object v1

    sget-object v2, Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;->E_TS_NONE:Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    if-eq v1, v2, :cond_34

    .line 545
    if-eqz p1, :cond_35

    .line 546
    const-string/jumbo v1, "ChannelManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "manualScanStop "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 547
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->DtvStopScan()Z

    .line 548
    sget-object v1, Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceInputType;->E_FIRST_SERVICE_DTV:Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceInputType;

    sget-object v2, Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceType;->E_DEFAULT:Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceType;

    invoke-interface {v0, v1, v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->changeToFirstService(Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceInputType;Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceType;)Z

    .line 542
    :cond_34
    :goto_34
    return-void

    .line 550
    :cond_35
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetManualTuningEnd()V

    goto :goto_34
.end method

.method public raiseDtvManualScanFreq(I)[I
    .registers 9
    .param p1, "number"    # I

    .prologue
    const/4 v6, 0x1

    .line 434
    const-string/jumbo v3, "ChannelManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "raiseDtvManualScanFreq ---> in number"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 435
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v3}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v2

    .line 436
    .local v2, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    sget-object v3, Lcom/mstar/android/tvapi/dtv/vo/RfInfo$EnumInfoType;->E_NEXT_RF:Lcom/mstar/android/tvapi/dtv/vo/RfInfo$EnumInfoType;

    invoke-interface {v2, v3, p1}, Lcom/mstar/tvsettingservice/ChannelDesk;->dtvGetRFInfo(Lcom/mstar/android/tvapi/dtv/vo/RfInfo$EnumInfoType;I)Lcom/mstar/android/tvapi/dtv/vo/RfInfo;

    move-result-object v1

    .line 437
    .local v1, "rfInfo":Lcom/mstar/android/tvapi/dtv/vo/RfInfo;
    const/4 v3, 0x2

    new-array v0, v3, [I

    .line 438
    .local v0, "relt":[I
    iget-short v3, v1, Lcom/mstar/android/tvapi/dtv/vo/RfInfo;->rfPhyNum:S

    const/4 v4, 0x0

    aput v3, v0, v4

    .line 439
    iget v3, v1, Lcom/mstar/android/tvapi/dtv/vo/RfInfo;->frequency:I

    aput v3, v0, v6

    .line 440
    const-string/jumbo v3, "ChannelManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "raiseDtvManualScanFreq ---> in frequency:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget v5, v0, v6

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 441
    return-object v0
.end method

.method public releaseScanHandler()V
    .registers 3

    .prologue
    .line 562
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/stv/signalcommon/ChannelManager;->scanHandler:Landroid/os/Handler;

    .line 563
    iget-object v0, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v0}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getCommonManagerInstance()Lcom/mstar/tvsettingservice/CommonDesk;

    move-result-object v0

    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/mstar/tvsettingservice/CommonDesk;->releaseHandler(I)V

    .line 561
    return-void
.end method

.method public revertChannel()V
    .registers 3

    .prologue
    .line 241
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v1}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v0

    .line 242
    .local v0, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    const/4 v1, 0x1

    invoke-interface {v0, v1}, Lcom/mstar/tvsettingservice/ChannelDesk;->setChannelChangeFreezeMode(Z)V

    .line 243
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->programReturn()Z

    .line 240
    return-void
.end method

.method public saveChannel(I)V
    .registers 4
    .param p1, "num"    # I

    .prologue
    .line 567
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v1}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v0

    .line 568
    .local v0, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    add-int/lit8 v1, p1, -0x1

    invoke-interface {v0, v1}, Lcom/mstar/tvsettingservice/ChannelDesk;->saveAtvProgram(I)Z

    .line 566
    return-void
.end method

.method public setChannelSkipped(IZ)I
    .registers 11
    .param p1, "channelNum"    # I
    .param p2, "isSkipped"    # Z

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 594
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v1}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v0

    .line 595
    .local v0, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    const/4 v7, 0x0

    .line 596
    .local v7, "ret":I
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v1}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v1

    if-eqz v1, :cond_2b

    .line 597
    invoke-virtual {p0, p1}, Lcom/stv/signalcommon/ChannelManager;->getProgramInfoByNum(I)Lcom/mstar/android/tvapi/common/vo/ProgramInfo;

    move-result-object v6

    .line 598
    .local v6, "programInfo":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    if-nez v6, :cond_20

    .line 599
    return v7

    .line 601
    :cond_20
    sget-object v1, Lcom/mstar/android/tvapi/common/vo/EnumProgramAttribute;->E_SKIP:Lcom/mstar/android/tvapi/common/vo/EnumProgramAttribute;

    iget v2, v6, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->number:I

    iget-short v3, v6, Lcom/mstar/android/tvapi/common/vo/ProgramInfo;->serviceType:S

    move v5, p2

    invoke-interface/range {v0 .. v5}, Lcom/mstar/tvsettingservice/ChannelDesk;->setProgramAttribute(Lcom/mstar/android/tvapi/common/vo/EnumProgramAttribute;ISIZ)V

    .line 610
    .end local v6    # "programInfo":Lcom/mstar/android/tvapi/common/vo/ProgramInfo;
    :goto_2a
    return v7

    .line 604
    :cond_2b
    if-eqz p2, :cond_36

    .line 605
    sget-object v1, Lcom/mstar/android/tvapi/atv/vo/EnumSetProgramInfo;->E_SKIP_PROGRAM:Lcom/mstar/android/tvapi/atv/vo/EnumSetProgramInfo;

    add-int/lit8 v2, p1, -0x1

    const/4 v3, 0x1

    invoke-interface {v0, v1, v2, v3, v5}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetProgramInfo(Lcom/mstar/android/tvapi/atv/vo/EnumSetProgramInfo;IILjava/lang/String;)I

    goto :goto_2a

    .line 607
    :cond_36
    sget-object v1, Lcom/mstar/android/tvapi/atv/vo/EnumSetProgramInfo;->E_SKIP_PROGRAM:Lcom/mstar/android/tvapi/atv/vo/EnumSetProgramInfo;

    add-int/lit8 v2, p1, -0x1

    invoke-interface {v0, v1, v2, v4, v5}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetProgramInfo(Lcom/mstar/android/tvapi/atv/vo/EnumSetProgramInfo;IILjava/lang/String;)I

    goto :goto_2a
.end method

.method public setColorSystem(Ljava/lang/String;)V
    .registers 4
    .param p1, "colorSystem"    # Ljava/lang/String;

    .prologue
    .line 1221
    invoke-virtual {p0}, Lcom/stv/signalcommon/ChannelManager;->getTotalChannelCount()I

    move-result v1

    if-gtz v1, :cond_7

    .line 1222
    return-void

    .line 1224
    :cond_7
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->colorSystemTypeList:[Lcom/stv/signalcommon/ChannelManager$ColorSystem;

    array-length v1, v1

    if-ge v0, v1, :cond_20

    .line 1225
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->colorSystemTypeList:[Lcom/stv/signalcommon/ChannelManager$ColorSystem;

    aget-object v1, v1, v0

    iget-object v1, v1, Lcom/stv/signalcommon/ChannelManager$ColorSystem;->displayName:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_21

    .line 1226
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->colorSystemTypeList:[Lcom/stv/signalcommon/ChannelManager$ColorSystem;

    aget-object v1, v1, v0

    invoke-virtual {p0, v1}, Lcom/stv/signalcommon/ChannelManager;->setCurrentChannelColorSystem(Lcom/stv/signalcommon/ChannelManager$ColorSystem;)V

    .line 1220
    :cond_20
    return-void

    .line 1224
    :cond_21
    add-int/lit8 v0, v0, 0x1

    goto :goto_8
.end method

.method public setCurrentChannel(I)V
    .registers 6
    .param p1, "channelNum"    # I

    .prologue
    .line 218
    const-string/jumbo v1, "ChannelManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "setCurrentChannel ---> channelNum:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v1}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v0

    .line 220
    .local v0, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v1}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v1

    if-eqz v1, :cond_37

    .line 221
    int-to-short v1, p1

    sget-object v2, Lcom/mstar/tvsettingservice/DtvInterface$MEMBER_SERVICETYPE;->E_SERVICETYPE_DTV:Lcom/mstar/tvsettingservice/DtvInterface$MEMBER_SERVICETYPE;

    invoke-interface {v0, v1, v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->programSel(ILcom/mstar/tvsettingservice/DtvInterface$MEMBER_SERVICETYPE;)Z

    .line 217
    :goto_36
    return-void

    .line 223
    :cond_37
    add-int/lit8 v1, p1, -0x1

    int-to-short v1, v1

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetChannel(SZ)I

    goto :goto_36
.end method

.method public setCurrentChannelColorSystem(Lcom/stv/signalcommon/ChannelManager$ColorSystem;)V
    .registers 8
    .param p1, "colorSystem"    # Lcom/stv/signalcommon/ChannelManager$ColorSystem;

    .prologue
    .line 627
    if-nez p1, :cond_3

    .line 628
    return-void

    .line 630
    :cond_3
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v3}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v2

    .line 631
    .local v2, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    invoke-virtual {p0}, Lcom/stv/signalcommon/ChannelManager;->getCurrentChannelNum()I

    move-result v0

    .line 632
    .local v0, "channelNum":I
    invoke-virtual {p0, v0}, Lcom/stv/signalcommon/ChannelManager;->isChannelSkipped(I)Z

    move-result v1

    .line 633
    .local v1, "isCurrentChannelSkipped":Z
    const-string/jumbo v3, "ChannelManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "atvSetForceVedioSystem ---> colorSystem:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p1, Lcom/stv/signalcommon/ChannelManager$ColorSystem;->colorSystemType:Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 634
    iget-object v3, p1, Lcom/stv/signalcommon/ChannelManager$ColorSystem;->colorSystemType:Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    invoke-interface {v2, v3}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetForceVedioSystem(Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;)V

    .line 635
    if-eqz v1, :cond_38

    .line 636
    const/4 v3, 0x1

    invoke-virtual {p0, v0, v3}, Lcom/stv/signalcommon/ChannelManager;->setChannelSkipped(IZ)I

    .line 626
    :cond_38
    return-void
.end method

.method public setCurrentChannelSoundSystem(Lcom/stv/signalcommon/ChannelManager$SoundSystem;)V
    .registers 8
    .param p1, "soundSystem"    # Lcom/stv/signalcommon/ChannelManager$SoundSystem;

    .prologue
    .line 654
    if-nez p1, :cond_3

    .line 655
    return-void

    .line 657
    :cond_3
    iget-object v3, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v3}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v2

    .line 658
    .local v2, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    invoke-virtual {p0}, Lcom/stv/signalcommon/ChannelManager;->getCurrentChannelNum()I

    move-result v0

    .line 659
    .local v0, "channelNum":I
    invoke-virtual {p0, v0}, Lcom/stv/signalcommon/ChannelManager;->isChannelSkipped(I)Z

    move-result v1

    .line 660
    .local v1, "isCurrentChannelSkipped":Z
    const-string/jumbo v3, "ChannelManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "atvSetForceSoundSystem ---> soundSystem:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p1, Lcom/stv/signalcommon/ChannelManager$SoundSystem;->soundSystemType:Lcom/mstar/android/tvapi/common/vo/AtvSystemStandard$EnumAtvSystemStandard;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 661
    iget-object v3, p1, Lcom/stv/signalcommon/ChannelManager$SoundSystem;->soundSystemType:Lcom/mstar/android/tvapi/common/vo/AtvSystemStandard$EnumAtvSystemStandard;

    invoke-interface {v2, v3}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetForceSoundSystem(Lcom/mstar/android/tvapi/common/vo/AtvSystemStandard$EnumAtvSystemStandard;)Z

    .line 662
    if-eqz v1, :cond_38

    .line 663
    const/4 v3, 0x1

    invoke-virtual {p0, v0, v3}, Lcom/stv/signalcommon/ChannelManager;->setChannelSkipped(IZ)I

    .line 653
    :cond_38
    return-void
.end method

.method public setManualScanHandler(Landroid/os/Handler;)V
    .registers 5
    .param p1, "handler"    # Landroid/os/Handler;

    .prologue
    .line 556
    iput-object p1, p0, Lcom/stv/signalcommon/ChannelManager;->scanHandler:Landroid/os/Handler;

    .line 557
    new-instance v0, Lcom/stv/signalcommon/ChannelManager$MyHandler;

    invoke-direct {v0, p0}, Lcom/stv/signalcommon/ChannelManager$MyHandler;-><init>(Lcom/stv/signalcommon/ChannelManager;)V

    iput-object v0, p0, Lcom/stv/signalcommon/ChannelManager;->myHandler:Lcom/stv/signalcommon/ChannelManager$MyHandler;

    .line 558
    iget-object v0, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v0}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getCommonManagerInstance()Lcom/mstar/tvsettingservice/CommonDesk;

    move-result-object v0

    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->myHandler:Lcom/stv/signalcommon/ChannelManager$MyHandler;

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Lcom/mstar/tvsettingservice/CommonDesk;->setHandler(Landroid/os/Handler;I)Z

    .line 555
    return-void
.end method

.method public setSoundSystem(Ljava/lang/String;)V
    .registers 4
    .param p1, "soundSystem"    # Ljava/lang/String;

    .prologue
    .line 1233
    invoke-virtual {p0}, Lcom/stv/signalcommon/ChannelManager;->getTotalChannelCount()I

    move-result v1

    if-gtz v1, :cond_7

    .line 1234
    return-void

    .line 1236
    :cond_7
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->soundSystemTypeList:[Lcom/stv/signalcommon/ChannelManager$SoundSystem;

    array-length v1, v1

    if-ge v0, v1, :cond_20

    .line 1237
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->soundSystemTypeList:[Lcom/stv/signalcommon/ChannelManager$SoundSystem;

    aget-object v1, v1, v0

    iget-object v1, v1, Lcom/stv/signalcommon/ChannelManager$SoundSystem;->displayName:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_21

    .line 1238
    iget-object v1, p0, Lcom/stv/signalcommon/ChannelManager;->soundSystemTypeList:[Lcom/stv/signalcommon/ChannelManager$SoundSystem;

    aget-object v1, v1, v0

    invoke-virtual {p0, v1}, Lcom/stv/signalcommon/ChannelManager;->setCurrentChannelSoundSystem(Lcom/stv/signalcommon/ChannelManager$SoundSystem;)V

    .line 1232
    :cond_20
    return-void

    .line 1236
    :cond_21
    add-int/lit8 v0, v0, 0x1

    goto :goto_8
.end method

.method public skipHiddenChannels()V
    .registers 1
    return-void
.end method

.method public stopScan()V
    .registers 7

    .prologue
    const/4 v5, 0x1

    .line 360
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->scanHandler:Landroid/os/Handler;

    .line 361
    iget-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v2}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v0

    .line 362
    .local v0, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->setChannelChangeFreezeMode(Z)V

    .line 363
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->GetTsStatus()Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    move-result-object v1

    .line 364
    .local v1, "tv_ts_status":Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;
    const-string/jumbo v2, "ChannelManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "stopScan ---> tv_ts_status:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 365
    iget-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->mAppObj:Landroid/content/Context;

    invoke-static {v2}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/stv/signalcommon/SignalManager;->getPortManager()Lcom/stv/signalcommon/PortManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/stv/signalcommon/PortManager;->isDtv()Z

    move-result v2

    if-eqz v2, :cond_5f

    .line 366
    const-string/jumbo v2, "ChannelManager"

    const-string/jumbo v3, "stopScan ---> in dtv modle "

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 367
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->DtvStopScan()Z

    .line 368
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->makeSourceDtv()V

    .line 369
    sget-object v2, Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceInputType;->E_FIRST_SERVICE_DTV:Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceInputType;

    sget-object v3, Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceType;->E_DEFAULT:Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceType;

    invoke-interface {v0, v2, v3}, Lcom/mstar/tvsettingservice/ChannelDesk;->changeToFirstService(Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceInputType;Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceType;)Z

    .line 379
    :cond_52
    :goto_52
    iget-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v2}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getCommonManagerInstance()Lcom/mstar/tvsettingservice/CommonDesk;

    move-result-object v2

    invoke-interface {v2, v5}, Lcom/mstar/tvsettingservice/CommonDesk;->releaseHandler(I)V

    .line 380
    invoke-interface {v0, v5}, Lcom/mstar/tvsettingservice/ChannelDesk;->setChannelChangeFreezeMode(Z)V

    .line 359
    return-void

    .line 371
    :cond_5f
    sget-object v2, Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;->E_TS_ATV_AUTO_TUNING:Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    if-eq v1, v2, :cond_67

    .line 372
    sget-object v2, Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;->E_TS_ATV_SCAN_PAUSING:Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    if-ne v1, v2, :cond_6b

    .line 373
    :cond_67
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetAutoTuningEnd()Z

    goto :goto_52

    .line 374
    :cond_6b
    sget-object v2, Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;->E_TS_ATV_MANU_TUNING_LEFT:Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    if-eq v1, v2, :cond_73

    .line 375
    sget-object v2, Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;->E_TS_ATV_MANU_TUNING_RIGHT:Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    if-ne v1, v2, :cond_52

    .line 376
    :cond_73
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetManualTuningEnd()V

    goto :goto_52
.end method

.method public stopScan(Z)V
    .registers 7
    .param p1, "isDtv"    # Z

    .prologue
    .line 385
    iget-object v2, p0, Lcom/stv/signalcommon/ChannelManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v2}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v0

    .line 386
    .local v0, "ts":Lcom/mstar/tvsettingservice/ChannelDesk;
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->setChannelChangeFreezeMode(Z)V

    .line 387
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->GetTsStatus()Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    move-result-object v1

    .line 388
    .local v1, "tv_ts_status":Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;
    const-string/jumbo v2, "ChannelManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "stopScan ---> tv_ts_status:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 389
    if-eqz p1, :cond_45

    .line 390
    const-string/jumbo v2, "ChannelManager"

    const-string/jumbo v3, "stopScan ---> in dtv modle and change to first"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 391
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->DtvStopScan()Z

    .line 392
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->makeSourceDtv()V

    .line 393
    sget-object v2, Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceInputType;->E_FIRST_SERVICE_DTV:Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceInputType;

    sget-object v3, Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceType;->E_DEFAULT:Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceType;

    invoke-interface {v0, v2, v3}, Lcom/mstar/tvsettingservice/ChannelDesk;->changeToFirstService(Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceInputType;Lcom/mstar/android/tvapi/common/vo/EnumFirstServiceType;)Z

    .line 404
    :cond_40
    :goto_40
    const/4 v2, 0x1

    invoke-interface {v0, v2}, Lcom/mstar/tvsettingservice/ChannelDesk;->setChannelChangeFreezeMode(Z)V

    .line 383
    return-void

    .line 395
    :cond_45
    sget-object v2, Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;->E_TS_ATV_AUTO_TUNING:Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    if-eq v1, v2, :cond_4d

    .line 396
    sget-object v2, Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;->E_TS_ATV_SCAN_PAUSING:Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    if-ne v1, v2, :cond_51

    .line 397
    :cond_4d
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetAutoTuningEnd()Z

    goto :goto_40

    .line 398
    :cond_51
    sget-object v2, Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;->E_TS_ATV_MANU_TUNING_LEFT:Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    if-eq v1, v2, :cond_59

    .line 399
    sget-object v2, Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;->E_TS_ATV_MANU_TUNING_RIGHT:Lcom/mstar/tvsettingservice/ChannelDesk$TV_TS_STATUS;

    if-ne v1, v2, :cond_40

    .line 400
    :cond_59
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->atvSetManualTuningEnd()V

    goto :goto_40
.end method
