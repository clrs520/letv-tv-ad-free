.class public Lcom/stv/signalcommon/PortManager;
.super Ljava/lang/Object;
.source "PortManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/stv/signalcommon/PortManager$PortInfo;
    }
.end annotation


# static fields
.field private static synthetic -com_mstar_android_tvapi_common_vo_EnumAvdVideoStandardTypeSwitchesValues:[I = null

.field private static final TAG:Ljava/lang/String; = "PortManager"


# instance fields
.field private mAppObj:Landroid/content/Context;

.field private mCurrentInputSource:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

.field private portInfoList:[Lcom/stv/signalcommon/PortManager$PortInfo;

.field private serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;


# direct methods
.method private static synthetic -getcom_mstar_android_tvapi_common_vo_EnumAvdVideoStandardTypeSwitchesValues()[I
    .registers 3

    sget-object v0, Lcom/stv/signalcommon/PortManager;->-com_mstar_android_tvapi_common_vo_EnumAvdVideoStandardTypeSwitchesValues:[I

    if-eqz v0, :cond_7

    sget-object v0, Lcom/stv/signalcommon/PortManager;->-com_mstar_android_tvapi_common_vo_EnumAvdVideoStandardTypeSwitchesValues:[I

    return-object v0

    :cond_7
    invoke-static {}, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->values()[Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_e
    sget-object v1, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->AUTO:Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    invoke-virtual {v1}, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_17
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_17} :catch_80

    :goto_17
    :try_start_17
    sget-object v1, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->MAX:Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    invoke-virtual {v1}, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_21
    .catch Ljava/lang/NoSuchFieldError; {:try_start_17 .. :try_end_21} :catch_7e

    :goto_21
    :try_start_21
    sget-object v1, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->NOTSTANDARD:Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    invoke-virtual {v1}, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_2b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_21 .. :try_end_2b} :catch_7c

    :goto_2b
    :try_start_2b
    sget-object v1, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->NTSC_44:Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    invoke-virtual {v1}, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_34
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2b .. :try_end_34} :catch_7a

    :goto_34
    :try_start_34
    sget-object v1, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->NTSC_M:Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    invoke-virtual {v1}, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_3d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_34 .. :try_end_3d} :catch_78

    :goto_3d
    :try_start_3d
    sget-object v1, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->PAL_60:Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    invoke-virtual {v1}, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_46
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3d .. :try_end_46} :catch_76

    :goto_46
    :try_start_46
    sget-object v1, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->PAL_BGHI:Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    invoke-virtual {v1}, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_46 .. :try_end_4f} :catch_74

    :goto_4f
    :try_start_4f
    sget-object v1, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->PAL_M:Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    invoke-virtual {v1}, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_58
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4f .. :try_end_58} :catch_72

    :goto_58
    :try_start_58
    sget-object v1, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->PAL_N:Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    invoke-virtual {v1}, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_61
    .catch Ljava/lang/NoSuchFieldError; {:try_start_58 .. :try_end_61} :catch_70

    :goto_61
    :try_start_61
    sget-object v1, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->SECAM:Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    invoke-virtual {v1}, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_6b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_61 .. :try_end_6b} :catch_6e

    :goto_6b
    sput-object v0, Lcom/stv/signalcommon/PortManager;->-com_mstar_android_tvapi_common_vo_EnumAvdVideoStandardTypeSwitchesValues:[I

    return-object v0

    :catch_6e
    move-exception v1

    goto :goto_6b

    :catch_70
    move-exception v1

    goto :goto_61

    :catch_72
    move-exception v1

    goto :goto_58

    :catch_74
    move-exception v1

    goto :goto_4f

    :catch_76
    move-exception v1

    goto :goto_46

    :catch_78
    move-exception v1

    goto :goto_3d

    :catch_7a
    move-exception v1

    goto :goto_34

    :catch_7c
    move-exception v1

    goto :goto_2b

    :catch_7e
    move-exception v1

    goto :goto_21

    :catch_80
    move-exception v1

    goto :goto_17
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/stv/signalcommon/DeskProvider;)V
    .registers 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "provider"    # Lcom/stv/signalcommon/DeskProvider;

    .prologue
    const/4 v0, 0x0

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object v0, p0, Lcom/stv/signalcommon/PortManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    .line 36
    iput-object v0, p0, Lcom/stv/signalcommon/PortManager;->mAppObj:Landroid/content/Context;

    .line 37
    iput-object v0, p0, Lcom/stv/signalcommon/PortManager;->mCurrentInputSource:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    .line 49
    const/16 v0, 0x8

    new-array v0, v0, [Lcom/stv/signalcommon/PortManager$PortInfo;

    .line 50
    new-instance v1, Lcom/stv/signalcommon/PortManager$PortInfo;

    sget-object v2, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_ATV:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    invoke-virtual {v2}, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->ordinal()I

    move-result v2

    const-string/jumbo v3, "Analog TV"

    invoke-direct {v1, p0, v2, v3}, Lcom/stv/signalcommon/PortManager$PortInfo;-><init>(Lcom/stv/signalcommon/PortManager;ILjava/lang/String;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    .line 51
    new-instance v1, Lcom/stv/signalcommon/PortManager$PortInfo;

    sget-object v2, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_DTV:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    invoke-virtual {v2}, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->ordinal()I

    move-result v2

    const-string/jumbo v3, "Digital TV"

    invoke-direct {v1, p0, v2, v3}, Lcom/stv/signalcommon/PortManager$PortInfo;-><init>(Lcom/stv/signalcommon/PortManager;ILjava/lang/String;)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    .line 52
    new-instance v1, Lcom/stv/signalcommon/PortManager$PortInfo;

    sget-object v2, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_CVBS:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    invoke-virtual {v2}, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->ordinal()I

    move-result v2

    const-string/jumbo v3, "Composite"

    invoke-direct {v1, p0, v2, v3}, Lcom/stv/signalcommon/PortManager$PortInfo;-><init>(Lcom/stv/signalcommon/PortManager;ILjava/lang/String;)V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    .line 53
    new-instance v1, Lcom/stv/signalcommon/PortManager$PortInfo;

    sget-object v2, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_VGA:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    invoke-virtual {v2}, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->ordinal()I

    move-result v2

    const-string/jumbo v3, "VGA"

    invoke-direct {v1, p0, v2, v3}, Lcom/stv/signalcommon/PortManager$PortInfo;-><init>(Lcom/stv/signalcommon/PortManager;ILjava/lang/String;)V

    const/4 v2, 0x3

    aput-object v1, v0, v2

    .line 54
    new-instance v1, Lcom/stv/signalcommon/PortManager$PortInfo;

    sget-object v2, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_YPBPR:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    invoke-virtual {v2}, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->ordinal()I

    move-result v2

    const-string/jumbo v3, "YPBPR"

    invoke-direct {v1, p0, v2, v3}, Lcom/stv/signalcommon/PortManager$PortInfo;-><init>(Lcom/stv/signalcommon/PortManager;ILjava/lang/String;)V

    const/4 v2, 0x4

    aput-object v1, v0, v2

    .line 55
    new-instance v1, Lcom/stv/signalcommon/PortManager$PortInfo;

    sget-object v2, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_HDMI:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    invoke-virtual {v2}, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->ordinal()I

    move-result v2

    const-string/jumbo v3, "HDMI 1"

    invoke-direct {v1, p0, v2, v3}, Lcom/stv/signalcommon/PortManager$PortInfo;-><init>(Lcom/stv/signalcommon/PortManager;ILjava/lang/String;)V

    const/4 v2, 0x5

    aput-object v1, v0, v2

    .line 56
    new-instance v1, Lcom/stv/signalcommon/PortManager$PortInfo;

    sget-object v2, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_HDMI2:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    invoke-virtual {v2}, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->ordinal()I

    move-result v2

    const-string/jumbo v3, "HDMI 2"

    invoke-direct {v1, p0, v2, v3}, Lcom/stv/signalcommon/PortManager$PortInfo;-><init>(Lcom/stv/signalcommon/PortManager;ILjava/lang/String;)V

    const/4 v2, 0x6

    aput-object v1, v0, v2

    .line 57
    new-instance v1, Lcom/stv/signalcommon/PortManager$PortInfo;

    sget-object v2, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_HDMI3:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    invoke-virtual {v2}, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->ordinal()I

    move-result v2

    const-string/jumbo v3, "HDMI 3"

    invoke-direct {v1, p0, v2, v3}, Lcom/stv/signalcommon/PortManager$PortInfo;-><init>(Lcom/stv/signalcommon/PortManager;ILjava/lang/String;)V

    const/4 v2, 0x7

    aput-object v1, v0, v2

    .line 49
    iput-object v0, p0, Lcom/stv/signalcommon/PortManager;->portInfoList:[Lcom/stv/signalcommon/PortManager$PortInfo;

    .line 61
    iput-object p1, p0, Lcom/stv/signalcommon/PortManager;->mAppObj:Landroid/content/Context;

    .line 62
    iput-object p2, p0, Lcom/stv/signalcommon/PortManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    .line 60
    return-void
.end method

.method private printProperty(Ljava/lang/String;)V
    .registers 8
    .param p1, "portName"    # Ljava/lang/String;

    .prologue
    .line 434
    if-eqz p1, :cond_f

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_19

    .line 435
    :cond_f
    const-string/jumbo v3, "PortManager"

    const-string/jumbo v4, "portName is empty, so return"

    invoke-static {v3, v4}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 436
    return-void

    .line 439
    :cond_19
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "HDMI 1"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_40

    .line 440
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "HDMI 2"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 439
    if-nez v3, :cond_40

    .line 441
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "HDMI 3"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 439
    if-eqz v3, :cond_83

    .line 443
    :cond_40
    :try_start_40
    iget-object v3, p0, Lcom/stv/signalcommon/PortManager;->mAppObj:Landroid/content/Context;

    invoke-static {v3}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/stv/signalcommon/SignalManager;->getDisplayManager()Lcom/stv/signalcommon/DisplayManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/stv/signalcommon/DisplayManager;->getHdmiEdidVersion()Ljava/lang/String;

    move-result-object v2

    .line 444
    .local v2, "edid":Ljava/lang/String;
    iget-object v3, p0, Lcom/stv/signalcommon/PortManager;->mAppObj:Landroid/content/Context;

    invoke-static {v3}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/stv/signalcommon/SignalManager;->getDisplayManager()Lcom/stv/signalcommon/DisplayManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/stv/signalcommon/DisplayManager;->getCurrentDisplayMode()Lcom/stv/signalcommon/DisplayManager$DisplayModeInfo;

    move-result-object v3

    iget v0, v3, Lcom/stv/signalcommon/DisplayManager$DisplayModeInfo;->displayModeIndex:I

    .line 445
    .local v0, "aspectRatioIndex":I
    const-string/jumbo v3, "PortManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "print HDMI property, edid "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ", aspectRatioIndex "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_83
    .catch Ljava/lang/Exception; {:try_start_40 .. :try_end_83} :catch_84

    .line 433
    .end local v0    # "aspectRatioIndex":I
    .end local v2    # "edid":Ljava/lang/String;
    :cond_83
    :goto_83
    return-void

    .line 447
    :catch_84
    move-exception v1

    .line 448
    .local v1, "e":Ljava/lang/Exception;
    const-string/jumbo v3, "PortManager"

    const-string/jumbo v4, "printProperty err"

    invoke-static {v3, v4, v1}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_83
.end method


# virtual methods
.method public disableMute()V
    .registers 4

    .prologue
    .line 334
    :try_start_0
    invoke-static {}, Lcom/mstar/android/tvapi/common/TvManager;->getInstance()Lcom/mstar/android/tvapi/common/TvManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mstar/android/tvapi/common/TvManager;->getAudioManager()Lcom/mstar/android/tvapi/common/AudioManager;

    move-result-object v1

    sget-object v2, Lcom/mstar/android/tvapi/common/vo/MuteType$EnumMuteType;->E_MUTE_SETINPUTSOURCE:Lcom/mstar/android/tvapi/common/vo/MuteType$EnumMuteType;

    invoke-virtual {v1, v2}, Lcom/mstar/android/tvapi/common/AudioManager;->disableMute(Lcom/mstar/android/tvapi/common/vo/MuteType$EnumMuteType;)Lcom/mstar/android/tvapi/common/vo/EnumAudioReturn;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_d} :catch_e

    .line 332
    :goto_d
    return-void

    .line 335
    :catch_e
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    goto :goto_d
.end method

.method public doPortInit(I)Z
    .registers 3
    .param p1, "portIndex"    # I

    .prologue
    .line 76
    const/4 v0, 0x0

    return v0
.end method

.method public doPortSwitch(Ljava/lang/String;)V
    .registers 8
    .param p1, "portName"    # Ljava/lang/String;

    .prologue
    .line 297
    const-string/jumbo v3, "PortManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "doPortSwitch ---> portName:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 298
    invoke-direct {p0, p1}, Lcom/stv/signalcommon/PortManager;->printProperty(Ljava/lang/String;)V

    .line 299
    if-eqz p1, :cond_2c

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_36

    .line 300
    :cond_2c
    const-string/jumbo v3, "PortManager"

    const-string/jumbo v4, "portName is empty, so return"

    invoke-static {v3, v4}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    return-void

    .line 304
    :cond_36
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "Analog TV"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_9e

    .line 305
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "Digital TV"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 304
    if-nez v3, :cond_9e

    .line 306
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "HDMI 1"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 304
    if-nez v3, :cond_9e

    .line 307
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "HDMI 2"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 304
    if-nez v3, :cond_9e

    .line 308
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "HDMI 3"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 304
    if-nez v3, :cond_9e

    .line 309
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "Composite"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 304
    if-nez v3, :cond_9e

    .line 310
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "VGA"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 304
    if-nez v3, :cond_9e

    .line 311
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "YPBPR"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 304
    if-eqz v3, :cond_f5

    .line 312
    :cond_9e
    const/4 v1, -0x1

    .line 313
    .local v1, "index":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_a0
    iget-object v3, p0, Lcom/stv/signalcommon/PortManager;->portInfoList:[Lcom/stv/signalcommon/PortManager$PortInfo;

    array-length v3, v3

    if-ge v0, v3, :cond_b2

    .line 314
    iget-object v3, p0, Lcom/stv/signalcommon/PortManager;->portInfoList:[Lcom/stv/signalcommon/PortManager$PortInfo;

    aget-object v3, v3, v0

    iget-object v3, v3, Lcom/stv/signalcommon/PortManager$PortInfo;->portName:Ljava/lang/String;

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b6

    .line 315
    move v1, v0

    .line 319
    :cond_b2
    const/4 v3, -0x1

    if-ne v1, v3, :cond_b9

    .line 320
    return-void

    .line 313
    :cond_b6
    add-int/lit8 v0, v0, 0x1

    goto :goto_a0

    .line 322
    :cond_b9
    iget-object v3, p0, Lcom/stv/signalcommon/PortManager;->portInfoList:[Lcom/stv/signalcommon/PortManager$PortInfo;

    aget-object v3, v3, v1

    iget v2, v3, Lcom/stv/signalcommon/PortManager$PortInfo;->portId:I

    .line 325
    .local v2, "portId":I
    const-string/jumbo v3, "PortManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "store current port "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " to database"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 326
    invoke-virtual {p0, v2}, Lcom/stv/signalcommon/PortManager;->updateCurrentPortToDB(I)V

    .line 327
    const-string/jumbo v3, "PortManager"

    const-string/jumbo v4, "Switch port immediately"

    invoke-static {v3, v4}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 328
    invoke-static {}, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->values()[Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    move-result-object v3

    aget-object v3, v3, v2

    invoke-virtual {p0, v3}, Lcom/stv/signalcommon/PortManager;->performPortSwitching(Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;)V

    .line 296
    .end local v0    # "i":I
    .end local v1    # "index":I
    .end local v2    # "portId":I
    :cond_f5
    return-void
.end method

.method public enableMute()V
    .registers 4

    .prologue
    .line 341
    :try_start_0
    invoke-static {}, Lcom/mstar/android/tvapi/common/TvManager;->getInstance()Lcom/mstar/android/tvapi/common/TvManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/mstar/android/tvapi/common/TvManager;->getAudioManager()Lcom/mstar/android/tvapi/common/AudioManager;

    move-result-object v1

    sget-object v2, Lcom/mstar/android/tvapi/common/vo/MuteType$EnumMuteType;->E_MUTE_SETINPUTSOURCE:Lcom/mstar/android/tvapi/common/vo/MuteType$EnumMuteType;

    invoke-virtual {v1, v2}, Lcom/mstar/android/tvapi/common/AudioManager;->enableMute(Lcom/mstar/android/tvapi/common/vo/MuteType$EnumMuteType;)Lcom/mstar/android/tvapi/common/vo/EnumAudioReturn;
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_d} :catch_e

    .line 339
    :goto_d
    return-void

    .line 342
    :catch_e
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    goto :goto_d
.end method

.method public finalize()V
    .registers 1

    .prologue
    .line 68
    return-void
.end method

.method public getCurrentPortFromDB()Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;
    .registers 5

    .prologue
    .line 80
    const-string/jumbo v2, "PortManager"

    const-string/jumbo v3, "getCurrentPortFromDB ---> In"

    invoke-static {v2, v3}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    invoke-static {}, Lcom/mstar/tvsrvfunc/DataBaseDeskImpl;->getDataBaseMgrInstance()Lcom/mstar/tvsrvfunc/DataBaseDeskImpl;

    move-result-object v1

    .line 82
    .local v1, "db":Lcom/mstar/tvsrvfunc/DataBaseDeskImpl;
    invoke-static {}, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->values()[Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    move-result-object v2

    invoke-virtual {v1}, Lcom/mstar/tvsrvfunc/DataBaseDeskImpl;->queryCurInputSrc()I

    move-result v3

    aget-object v0, v2, v3

    .line 83
    .local v0, "currentInputSource":Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;
    invoke-static {}, Lcom/stv/signalcommon/Utils;->isS40Products()Z

    move-result v2

    if-eqz v2, :cond_2e

    if-eqz v0, :cond_2e

    sget-object v2, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_HDMI3:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    if-ne v0, v2, :cond_2e

    .line 84
    sget-object v0, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_HDMI2:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    .line 85
    const-string/jumbo v2, "PortManager"

    const-string/jumbo v3, "getCurrentPortFromDB ---> convert from HDMI3 to HDMI2"

    invoke-static {v2, v3}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    :cond_2e
    const-string/jumbo v2, "PortManager"

    const-string/jumbo v3, "getCurrentPortFromDB ---> end"

    invoke-static {v2, v3}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    return-object v0
.end method

.method public getCurrentPortIndex()I
    .registers 8

    .prologue
    .line 103
    const-string/jumbo v4, "PortManager"

    const-string/jumbo v5, "getCurrentPortIndex ---> In"

    invoke-static {v4, v5}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    iget-object v4, p0, Lcom/stv/signalcommon/PortManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v4}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getCommonManagerInstance()Lcom/mstar/tvsettingservice/CommonDesk;

    move-result-object v3

    .line 105
    .local v3, "ts":Lcom/mstar/tvsettingservice/CommonDesk;
    invoke-interface {v3}, Lcom/mstar/tvsettingservice/CommonDesk;->GetCurrentInputSource()Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    move-result-object v4

    invoke-virtual {v4}, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->ordinal()I

    move-result v2

    .line 106
    .local v2, "portId":I
    invoke-static {}, Lcom/stv/signalcommon/Utils;->isS40Products()Z

    move-result v4

    if-eqz v4, :cond_34

    sget-object v4, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_HDMI3:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    invoke-virtual {v4}, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->ordinal()I

    move-result v4

    if-ne v2, v4, :cond_34

    .line 107
    sget-object v4, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_HDMI2:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    invoke-virtual {v4}, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->ordinal()I

    move-result v2

    .line 108
    const-string/jumbo v4, "PortManager"

    const-string/jumbo v5, "getCurrentPortIndex ---> convert from HDMI3 to HDMI2"

    invoke-static {v4, v5}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    :cond_34
    const/4 v1, -0x1

    .line 112
    .local v1, "index":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_36
    iget-object v4, p0, Lcom/stv/signalcommon/PortManager;->portInfoList:[Lcom/stv/signalcommon/PortManager$PortInfo;

    array-length v4, v4

    if-ge v0, v4, :cond_44

    .line 113
    iget-object v4, p0, Lcom/stv/signalcommon/PortManager;->portInfoList:[Lcom/stv/signalcommon/PortManager$PortInfo;

    aget-object v4, v4, v0

    iget v4, v4, Lcom/stv/signalcommon/PortManager$PortInfo;->portId:I

    if-ne v4, v2, :cond_79

    .line 114
    move v1, v0

    .line 118
    :cond_44
    const-string/jumbo v4, "PortManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "current port id:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    const-string/jumbo v4, "PortManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "current port index:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    return v1

    .line 112
    :cond_79
    add-int/lit8 v0, v0, 0x1

    goto :goto_36
.end method

.method public getCurrentPortInfo()Lcom/stv/signalcommon/PortManager$PortInfo;
    .registers 3

    .prologue
    .line 173
    invoke-virtual {p0}, Lcom/stv/signalcommon/PortManager;->getCurrentPortIndex()I

    move-result v0

    .line 174
    .local v0, "index":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_9

    .line 175
    const/4 v1, 0x0

    return-object v1

    .line 177
    :cond_9
    iget-object v1, p0, Lcom/stv/signalcommon/PortManager;->portInfoList:[Lcom/stv/signalcommon/PortManager$PortInfo;

    aget-object v1, v1, v0

    return-object v1
.end method

.method public getCurrentPortName()Ljava/lang/String;
    .registers 6

    .prologue
    .line 149
    const-string/jumbo v2, "PortManager"

    const-string/jumbo v3, "getCurrentPortName ---> In"

    invoke-static {v2, v3}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    const-string/jumbo v1, ""

    .line 161
    .local v1, "portName":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/stv/signalcommon/PortManager;->getCurrentPortIndex()I

    move-result v0

    .line 162
    .local v0, "index":I
    const-string/jumbo v2, "PortManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "index:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 163
    const/4 v2, -0x1

    if-ne v0, v2, :cond_31

    .line 164
    const-string/jumbo v2, ""

    return-object v2

    .line 166
    :cond_31
    iget-object v2, p0, Lcom/stv/signalcommon/PortManager;->portInfoList:[Lcom/stv/signalcommon/PortManager$PortInfo;

    aget-object v2, v2, v0

    iget-object v1, v2, Lcom/stv/signalcommon/PortManager$PortInfo;->portName:Ljava/lang/String;

    .line 168
    const-string/jumbo v2, "PortManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "getCurrentPortName ---> portName is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/stv/signalcommon/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    return-object v1
.end method

.method public getPortInfo(Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;)Lcom/stv/signalcommon/PortManager$PortInfo;
    .registers 6
    .param p1, "enumInputSource"    # Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    .prologue
    const/4 v3, 0x0

    .line 181
    if-eqz p1, :cond_1d

    .line 182
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_4
    iget-object v1, p0, Lcom/stv/signalcommon/PortManager;->portInfoList:[Lcom/stv/signalcommon/PortManager$PortInfo;

    array-length v1, v1

    if-ge v0, v1, :cond_1d

    .line 183
    iget-object v1, p0, Lcom/stv/signalcommon/PortManager;->portInfoList:[Lcom/stv/signalcommon/PortManager$PortInfo;

    aget-object v1, v1, v0

    iget v1, v1, Lcom/stv/signalcommon/PortManager$PortInfo;->portId:I

    invoke-virtual {p1}, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->ordinal()I

    move-result v2

    if-ne v1, v2, :cond_1a

    .line 184
    iget-object v1, p0, Lcom/stv/signalcommon/PortManager;->portInfoList:[Lcom/stv/signalcommon/PortManager$PortInfo;

    aget-object v1, v1, v0

    return-object v1

    .line 182
    :cond_1a
    add-int/lit8 v0, v0, 0x1

    goto :goto_4

    .line 188
    .end local v0    # "i":I
    :cond_1d
    return-object v3
.end method

.method public getPortList()[Lcom/stv/signalcommon/PortManager$PortInfo;
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/stv/signalcommon/PortManager;->portInfoList:[Lcom/stv/signalcommon/PortManager$PortInfo;

    return-object v0
.end method

.method public getPortType(Ljava/lang/String;)Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;
    .registers 5
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 124
    const-string/jumbo v0, "PortManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "getPortType ---> In str:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_23

    .line 126
    sget-object v0, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_NONE:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    return-object v0

    .line 128
    :cond_23
    const-string/jumbo v0, "Analog TV"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 129
    sget-object v0, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_ATV:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    return-object v0

    .line 130
    :cond_2f
    const-string/jumbo v0, "Digital TV"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3b

    .line 131
    sget-object v0, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_DTV:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    return-object v0

    .line 132
    :cond_3b
    const-string/jumbo v0, "VGA"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_47

    .line 133
    sget-object v0, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_VGA:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    return-object v0

    .line 134
    :cond_47
    const-string/jumbo v0, "Composite"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_53

    .line 135
    sget-object v0, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_CVBS:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    return-object v0

    .line 136
    :cond_53
    const-string/jumbo v0, "YPBPR"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5f

    .line 137
    sget-object v0, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_YPBPR:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    return-object v0

    .line 138
    :cond_5f
    const-string/jumbo v0, "HDMI 1"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6b

    .line 139
    sget-object v0, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_HDMI:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    return-object v0

    .line 140
    :cond_6b
    const-string/jumbo v0, "HDMI 2"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_77

    .line 141
    sget-object v0, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_HDMI2:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    return-object v0

    .line 142
    :cond_77
    const-string/jumbo v0, "HDMI 3"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_83

    .line 143
    sget-object v0, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_HDMI3:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    return-object v0

    .line 145
    :cond_83
    sget-object v0, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_NONE:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    return-object v0
.end method

.method public getVideoFrameRate()I
    .registers 8

    .prologue
    .line 224
    const/4 v2, 0x0

    .line 226
    .local v2, "info":Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;
    :try_start_1
    iget-object v4, p0, Lcom/stv/signalcommon/PortManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v4}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getCommonManagerInstance()Lcom/mstar/tvsettingservice/CommonDesk;

    move-result-object v3

    .line 227
    .local v3, "ts":Lcom/mstar/tvsettingservice/CommonDesk;
    invoke-interface {v3}, Lcom/mstar/tvsettingservice/CommonDesk;->getVideoInfo()Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_a} :catch_18

    move-result-object v2

    .line 232
    .end local v2    # "info":Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;
    .end local v3    # "ts":Lcom/mstar/tvsettingservice/CommonDesk;
    :goto_b
    if-nez v2, :cond_1d

    .line 233
    const-string/jumbo v4, "PortManager"

    const-string/jumbo v5, "getVideoFrameRate ---> info == null"

    invoke-static {v4, v5}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    const/4 v4, -0x1

    return v4

    .line 228
    .restart local v2    # "info":Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;
    :catch_18
    move-exception v0

    .line 229
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_b

    .line 236
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "info":Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;
    :cond_1d
    const-string/jumbo v4, "PortManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "info.s16FrameRate = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-short v6, v2, Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;->s16FrameRate:S

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 237
    iget-short v4, v2, Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;->s16FrameRate:S

    add-int/lit8 v4, v4, 0x5

    div-int/lit8 v1, v4, 0xa

    .line 238
    .local v1, "frameRate":I
    return v1
.end method

.method public getVideoHeight()I
    .registers 6

    .prologue
    .line 208
    const/4 v1, 0x0

    .line 210
    .local v1, "info":Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;
    :try_start_1
    iget-object v3, p0, Lcom/stv/signalcommon/PortManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v3}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getCommonManagerInstance()Lcom/mstar/tvsettingservice/CommonDesk;

    move-result-object v2

    .line 211
    .local v2, "ts":Lcom/mstar/tvsettingservice/CommonDesk;
    invoke-interface {v2}, Lcom/mstar/tvsettingservice/CommonDesk;->getVideoInfo()Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_a} :catch_18

    move-result-object v1

    .line 215
    .end local v1    # "info":Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;
    .end local v2    # "ts":Lcom/mstar/tvsettingservice/CommonDesk;
    :goto_b
    if-nez v1, :cond_1d

    .line 216
    const-string/jumbo v3, "PortManager"

    const-string/jumbo v4, "getVideoHeight ---> info == null"

    invoke-static {v3, v4}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 217
    const/4 v3, -0x1

    return v3

    .line 212
    .restart local v1    # "info":Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;
    :catch_18
    move-exception v0

    .line 213
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_b

    .line 219
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "info":Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;
    :cond_1d
    iget-short v3, v1, Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;->s16VResolution:S

    return v3
.end method

.method public getVideoStandard()Ljava/lang/String;
    .registers 7

    .prologue
    .line 376
    const-string/jumbo v3, "PortManager"

    const-string/jumbo v4, "getVideoStandard ---> In"

    invoke-static {v3, v4}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 377
    iget-object v3, p0, Lcom/stv/signalcommon/PortManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v3}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getChannelManagerInstance()Lcom/mstar/tvsettingservice/ChannelDesk;

    move-result-object v0

    .line 378
    .local v0, "channelDeskInstance":Lcom/mstar/tvsettingservice/ChannelDesk;
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/ChannelDesk;->getVideoStandard()Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;

    move-result-object v2

    .line 379
    .local v2, "videoStandard":Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;
    const-string/jumbo v3, "PortManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "videoStandard:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 380
    const-string/jumbo v1, ""

    .line 381
    .local v1, "strVideoStandard":Ljava/lang/String;
    invoke-static {}, Lcom/stv/signalcommon/PortManager;->-getcom_mstar_android_tvapi_common_vo_EnumAvdVideoStandardTypeSwitchesValues()[I

    move-result-object v3

    invoke-virtual {v2}, Lcom/mstar/android/tvapi/common/vo/EnumAvdVideoStandardType;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_5e

    .line 410
    :goto_3d
    return-object v1

    .line 383
    :pswitch_3e
    const-string/jumbo v1, "PAL"

    goto :goto_3d

    .line 386
    :pswitch_42
    const-string/jumbo v1, "PAL M"

    goto :goto_3d

    .line 389
    :pswitch_46
    const-string/jumbo v1, "PAL N"

    goto :goto_3d

    .line 392
    :pswitch_4a
    const-string/jumbo v1, "PAL 60"

    goto :goto_3d

    .line 395
    :pswitch_4e
    const-string/jumbo v1, "NTSC"

    goto :goto_3d

    .line 398
    :pswitch_52
    const-string/jumbo v1, "NTSC 44"

    goto :goto_3d

    .line 401
    :pswitch_56
    const-string/jumbo v1, "SECAM"

    goto :goto_3d

    .line 404
    :pswitch_5a
    const-string/jumbo v1, "AUTO"

    goto :goto_3d

    .line 381
    :pswitch_data_5e
    .packed-switch 0x1
        :pswitch_5a
        :pswitch_52
        :pswitch_4e
        :pswitch_4a
        :pswitch_3e
        :pswitch_42
        :pswitch_46
        :pswitch_56
    .end packed-switch
.end method

.method public getVideoWidth()I
    .registers 6

    .prologue
    .line 192
    const/4 v1, 0x0

    .line 194
    .local v1, "info":Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;
    :try_start_1
    iget-object v3, p0, Lcom/stv/signalcommon/PortManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v3}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getCommonManagerInstance()Lcom/mstar/tvsettingservice/CommonDesk;

    move-result-object v2

    .line 195
    .local v2, "ts":Lcom/mstar/tvsettingservice/CommonDesk;
    invoke-interface {v2}, Lcom/mstar/tvsettingservice/CommonDesk;->getVideoInfo()Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_a} :catch_18

    move-result-object v1

    .line 199
    .end local v1    # "info":Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;
    .end local v2    # "ts":Lcom/mstar/tvsettingservice/CommonDesk;
    :goto_b
    if-nez v1, :cond_1d

    .line 200
    const-string/jumbo v3, "PortManager"

    const-string/jumbo v4, "getVideoWidth ---> info == null"

    invoke-static {v3, v4}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    const/4 v3, -0x1

    return v3

    .line 196
    .restart local v1    # "info":Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;
    :catch_18
    move-exception v0

    .line 197
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_b

    .line 203
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "info":Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;
    :cond_1d
    iget-short v3, v1, Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;->s16HResolution:S

    return v3
.end method

.method public initialize()V
    .registers 1

    .prologue
    .line 65
    return-void
.end method

.method public isDetechSource(Ljava/lang/String;)Z
    .registers 8
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 418
    const-string/jumbo v3, "PortManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "isDetechSource source:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 419
    const/4 v2, 0x0

    .line 421
    .local v2, "result":Z
    :try_start_1b
    invoke-static {}, Lcom/mstar/android/tvapi/common/TvManager;->getInstance()Lcom/mstar/android/tvapi/common/TvManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/mstar/android/tvapi/common/TvManager;->getPlayerManager()Lcom/mstar/android/tvapi/common/TvPlayer;

    move-result-object v3

    invoke-virtual {p0, p1}, Lcom/stv/signalcommon/PortManager;->getPortType(Ljava/lang/String;)Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/mstar/android/tvapi/common/TvPlayer;->detectInputSource(Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;)Z
    :try_end_2a
    .catch Lcom/mstar/android/tvapi/common/exception/TvCommonException; {:try_start_1b .. :try_end_2a} :catch_4b
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_2a} :catch_46

    move-result v2

    .line 427
    .end local v2    # "result":Z
    :goto_2b
    const-string/jumbo v3, "PortManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "isDetechSource result:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 428
    return v2

    .line 424
    .restart local v2    # "result":Z
    :catch_46
    move-exception v1

    .line 425
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2b

    .line 422
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_4b
    move-exception v0

    .line 423
    .local v0, "e":Lcom/mstar/android/tvapi/common/exception/TvCommonException;
    invoke-virtual {v0}, Lcom/mstar/android/tvapi/common/exception/TvCommonException;->printStackTrace()V

    goto :goto_2b
.end method

.method public isDtv()Z
    .registers 4

    .prologue
    .line 285
    iget-object v1, p0, Lcom/stv/signalcommon/PortManager;->mCurrentInputSource:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    if-eqz v1, :cond_a

    iget-object v1, p0, Lcom/stv/signalcommon/PortManager;->mCurrentInputSource:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    sget-object v2, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_STORAGE:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    if-ne v1, v2, :cond_1f

    .line 286
    :cond_a
    iget-object v1, p0, Lcom/stv/signalcommon/PortManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v1}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getCommonManagerInstance()Lcom/mstar/tvsettingservice/CommonDesk;

    move-result-object v0

    .line 287
    .local v0, "ts":Lcom/mstar/tvsettingservice/CommonDesk;
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/CommonDesk;->GetCurrentInputSource()Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    move-result-object v1

    iput-object v1, p0, Lcom/stv/signalcommon/PortManager;->mCurrentInputSource:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    .line 288
    const-string/jumbo v1, "PortManager"

    const-string/jumbo v2, "mCurrentInputSource is null,get again!"

    invoke-static {v1, v2}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    .end local v0    # "ts":Lcom/mstar/tvsettingservice/CommonDesk;
    :cond_1f
    iget-object v1, p0, Lcom/stv/signalcommon/PortManager;->mCurrentInputSource:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    sget-object v2, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_DTV:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    if-ne v1, v2, :cond_27

    .line 291
    const/4 v1, 0x1

    return v1

    .line 293
    :cond_27
    const/4 v1, 0x0

    return v1
.end method

.method public isHdmiSignalMode()Z
    .registers 2

    .prologue
    .line 414
    iget-object v0, p0, Lcom/stv/signalcommon/PortManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v0}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getCommonManagerInstance()Lcom/mstar/tvsettingservice/CommonDesk;

    move-result-object v0

    invoke-interface {v0}, Lcom/mstar/tvsettingservice/CommonDesk;->isHdmiSignalMode()Z

    move-result v0

    return v0
.end method

.method public isTv()Z
    .registers 4

    .prologue
    .line 272
    iget-object v1, p0, Lcom/stv/signalcommon/PortManager;->mCurrentInputSource:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    if-eqz v1, :cond_a

    iget-object v1, p0, Lcom/stv/signalcommon/PortManager;->mCurrentInputSource:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    sget-object v2, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_STORAGE:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    if-ne v1, v2, :cond_1f

    .line 273
    :cond_a
    iget-object v1, p0, Lcom/stv/signalcommon/PortManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v1}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getCommonManagerInstance()Lcom/mstar/tvsettingservice/CommonDesk;

    move-result-object v0

    .line 274
    .local v0, "ts":Lcom/mstar/tvsettingservice/CommonDesk;
    invoke-interface {v0}, Lcom/mstar/tvsettingservice/CommonDesk;->GetCurrentInputSource()Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    move-result-object v1

    iput-object v1, p0, Lcom/stv/signalcommon/PortManager;->mCurrentInputSource:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    .line 275
    const-string/jumbo v1, "PortManager"

    const-string/jumbo v2, "mCurrentInputSource is null,get again!"

    invoke-static {v1, v2}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 277
    .end local v0    # "ts":Lcom/mstar/tvsettingservice/CommonDesk;
    :cond_1f
    iget-object v1, p0, Lcom/stv/signalcommon/PortManager;->mCurrentInputSource:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    sget-object v2, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_ATV:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    if-eq v1, v2, :cond_2b

    .line 278
    iget-object v1, p0, Lcom/stv/signalcommon/PortManager;->mCurrentInputSource:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    sget-object v2, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_DTV:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    if-ne v1, v2, :cond_2d

    .line 279
    :cond_2b
    const/4 v1, 0x1

    return v1

    .line 281
    :cond_2d
    const/4 v1, 0x0

    return v1
.end method

.method public isVideoProgressive()Z
    .registers 7

    .prologue
    .line 243
    const/4 v2, 0x0

    .line 244
    .local v2, "ret":Z
    const/4 v1, 0x0

    .line 246
    .local v1, "info":Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;
    :try_start_2
    iget-object v4, p0, Lcom/stv/signalcommon/PortManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v4}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getCommonManagerInstance()Lcom/mstar/tvsettingservice/CommonDesk;

    move-result-object v3

    .line 247
    .local v3, "ts":Lcom/mstar/tvsettingservice/CommonDesk;
    invoke-interface {v3}, Lcom/mstar/tvsettingservice/CommonDesk;->getVideoInfo()Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_b} :catch_f

    move-result-object v1

    .line 251
    .end local v1    # "info":Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;
    .end local v3    # "ts":Lcom/mstar/tvsettingservice/CommonDesk;
    :goto_c
    if-nez v1, :cond_14

    .line 252
    return v2

    .line 248
    .restart local v1    # "info":Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;
    :catch_f
    move-exception v0

    .line 249
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_c

    .line 255
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v1    # "info":Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;
    :cond_14
    iget-object v4, v1, Lcom/mstar/tvsettingservice/CommonDesk$ST_VIDEO_INFO;->enScanType:Lcom/mstar/tvsettingservice/CommonDesk$EN_SCAN_TYPE;

    sget-object v5, Lcom/mstar/tvsettingservice/CommonDesk$EN_SCAN_TYPE;->E_PROGRESSIVE:Lcom/mstar/tvsettingservice/CommonDesk$EN_SCAN_TYPE;

    if-ne v4, v5, :cond_1c

    .line 256
    const/4 v2, 0x1

    .line 261
    :goto_1b
    return v2

    .line 258
    :cond_1c
    const/4 v2, 0x0

    goto :goto_1b
.end method

.method public isVideoStable()Z
    .registers 6

    .prologue
    .line 265
    iget-object v2, p0, Lcom/stv/signalcommon/PortManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v2}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getCommonManagerInstance()Lcom/mstar/tvsettingservice/CommonDesk;

    move-result-object v1

    .line 266
    .local v1, "ts":Lcom/mstar/tvsettingservice/CommonDesk;
    invoke-interface {v1}, Lcom/mstar/tvsettingservice/CommonDesk;->isSignalStable()Z

    move-result v0

    .line 267
    .local v0, "isStable":Z
    const-string/jumbo v2, "PortManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "isVideoStable:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 268
    return v0
.end method

.method public performPortSwitching(Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;)V
    .registers 8
    .param p1, "enumInputSource"    # Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    .prologue
    .line 347
    const-string/jumbo v3, "PortManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "performPortSwitching ---> In, enumInputSource:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 348
    if-nez p1, :cond_1d

    .line 349
    return-void

    .line 352
    :cond_1d
    iget-object v3, p0, Lcom/stv/signalcommon/PortManager;->serviceProvider:Lcom/mstar/tvsettingservice/TvDeskProvider;

    invoke-interface {v3}, Lcom/mstar/tvsettingservice/TvDeskProvider;->getCommonManagerInstance()Lcom/mstar/tvsettingservice/CommonDesk;

    move-result-object v2

    .line 353
    .local v2, "ts":Lcom/mstar/tvsettingservice/CommonDesk;
    const-string/jumbo v3, "PortManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "SetInputSource ---> enumInputSource:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 354
    invoke-static {}, Lcom/stv/signalcommon/Utils;->isS40Products()Z

    move-result v3

    if-eqz v3, :cond_52

    sget-object v3, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_HDMI2:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    if-ne v3, p1, :cond_52

    .line 355
    const-string/jumbo v3, "PortManager"

    const-string/jumbo v4, "performPortSwitching ---> convert from HDMI2 to HDMI3"

    invoke-static {v3, v4}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 356
    sget-object p1, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_HDMI3:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    .line 358
    :cond_52
    move-object v1, p1

    .line 359
    .local v1, "enumIs":Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;
    monitor-enter p0

    .line 360
    :try_start_54
    invoke-interface {v2, v1}, Lcom/mstar/tvsettingservice/CommonDesk;->SetInputSource(Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;)V

    .line 361
    iput-object p1, p0, Lcom/stv/signalcommon/PortManager;->mCurrentInputSource:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    .line 364
    sget-object v3, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_ATV:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    if-eq v3, p1, :cond_61

    .line 365
    sget-object v3, Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;->E_INPUT_SOURCE_DTV:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    if-ne v3, p1, :cond_71

    .line 366
    :cond_61
    invoke-interface {v2}, Lcom/mstar/tvsettingservice/CommonDesk;->startMsrv()Z

    .line 367
    iget-object v3, p0, Lcom/stv/signalcommon/PortManager;->mAppObj:Landroid/content/Context;

    invoke-static {v3}, Lcom/stv/signalcommon/SignalManager;->getInstance(Landroid/content/Context;)Lcom/stv/signalcommon/SignalManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/stv/signalcommon/SignalManager;->getChannelManager()Lcom/stv/signalcommon/ChannelManager;

    move-result-object v0

    .line 368
    .local v0, "channelManager":Lcom/stv/signalcommon/ChannelManager;
    invoke-virtual {v0}, Lcom/stv/signalcommon/ChannelManager;->skipHiddenChannels()V
    :try_end_71
    .catchall {:try_start_54 .. :try_end_71} :catchall_8f

    .end local v0    # "channelManager":Lcom/stv/signalcommon/ChannelManager;
    :cond_71
    monitor-exit p0

    .line 372
    const-string/jumbo v3, "PortManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "performPortSwitching --->end, mCurrentInputSource is "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/stv/signalcommon/PortManager;->mCurrentInputSource:Lcom/mstar/android/tvapi/common/vo/TvOsType$EnumInputSource;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/stv/signalcommon/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 346
    return-void

    .line 359
    :catchall_8f
    move-exception v3

    monitor-exit p0

    throw v3
.end method

.method public updateCurrentPortToDB(I)V
    .registers 4
    return-void

.end method
