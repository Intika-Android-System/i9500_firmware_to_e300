.class public final Lcom/movial/ipphone/IPCallTracker;
.super Lcom/android/internal/telephony/CallTracker;
.source "IPCallTracker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/movial/ipphone/IPCallTracker$2;,
        Lcom/movial/ipphone/IPCallTracker$pendingConnection;
    }
.end annotation


# static fields
.field private static final EVENT_KEEP_RINGING:I = 0x2a

.field private static final EVENT_REMOVE_CONNECTION:I = 0x29

.field static final MAX_CONNECTIONS:I = 0x7

.field static final MAX_CONNECTIONS_PER_CALL:I = 0x5

.field static final TAG:Ljava/lang/String; = "IPCallTracker"


# instance fields
.field private DELAYED_KEEP_RINGING:I

.field private DELAYED_REMOVE_CONNECTION:I

.field backgroundCall:Lcom/movial/ipphone/IPCall;

.field connections:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/movial/ipphone/IPConnection;",
            ">;"
        }
    .end annotation
.end field

.field desiredMute:Z

.field foregroundCall:Lcom/movial/ipphone/IPCall;

.field mHandler:Landroid/os/Handler;

.field mIPService:Lcom/movial/ipphone/IIPService;

.field mMsnger:Landroid/os/Messenger;

.field private mPartialWakeLock:Landroid/os/PowerManager$WakeLock;

.field private mSwapCall:I

.field mWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

.field makeCall:Z

.field pendingConf:Z

.field pendingMOConn:Lcom/movial/ipphone/IPCallTracker$pendingConnection;

.field pendingMOIndex:I

.field phone:Lcom/movial/ipphone/IPPhone;

.field ringingCall:Lcom/movial/ipphone/IPCall;

.field ringingIndex:I

.field state:Lcom/android/internal/telephony/PhoneConstants$State;

.field voiceCallEndedRegistrants:Landroid/os/RegistrantList;

.field voiceCallStartedRegistrants:Landroid/os/RegistrantList;


# direct methods
.method constructor <init>(Lcom/movial/ipphone/IPPhone;)V
    .registers 7
    .parameter "phone"

    .prologue
    const/4 v4, 0x0

    const/4 v3, -0x1

    .line 153
    invoke-direct {p0}, Lcom/android/internal/telephony/CallTracker;-><init>()V

    .line 86
    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x7

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    .line 87
    new-instance v1, Landroid/os/RegistrantList;

    invoke-direct {v1}, Landroid/os/RegistrantList;-><init>()V

    iput-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->voiceCallEndedRegistrants:Landroid/os/RegistrantList;

    .line 88
    new-instance v1, Landroid/os/RegistrantList;

    invoke-direct {v1}, Landroid/os/RegistrantList;-><init>()V

    iput-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->voiceCallStartedRegistrants:Landroid/os/RegistrantList;

    .line 95
    iput v3, p0, Lcom/movial/ipphone/IPCallTracker;->pendingMOIndex:I

    .line 96
    iput-boolean v4, p0, Lcom/movial/ipphone/IPCallTracker;->pendingConf:Z

    .line 97
    new-instance v1, Lcom/movial/ipphone/IPCallTracker$pendingConnection;

    invoke-direct {v1, p0}, Lcom/movial/ipphone/IPCallTracker$pendingConnection;-><init>(Lcom/movial/ipphone/IPCallTracker;)V

    iput-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->pendingMOConn:Lcom/movial/ipphone/IPCallTracker$pendingConnection;

    .line 99
    iput v3, p0, Lcom/movial/ipphone/IPCallTracker;->mSwapCall:I

    .line 102
    new-instance v1, Lcom/movial/ipphone/IPCall;

    invoke-direct {v1, p0}, Lcom/movial/ipphone/IPCall;-><init>(Lcom/movial/ipphone/IPCallTracker;)V

    iput-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->ringingCall:Lcom/movial/ipphone/IPCall;

    .line 103
    new-instance v1, Lcom/movial/ipphone/IPCall;

    invoke-direct {v1, p0}, Lcom/movial/ipphone/IPCall;-><init>(Lcom/movial/ipphone/IPCallTracker;)V

    iput-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->foregroundCall:Lcom/movial/ipphone/IPCall;

    .line 104
    new-instance v1, Lcom/movial/ipphone/IPCall;

    invoke-direct {v1, p0}, Lcom/movial/ipphone/IPCall;-><init>(Lcom/movial/ipphone/IPCallTracker;)V

    iput-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->backgroundCall:Lcom/movial/ipphone/IPCall;

    .line 106
    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    iput-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->state:Lcom/android/internal/telephony/PhoneConstants$State;

    .line 114
    iput v3, p0, Lcom/movial/ipphone/IPCallTracker;->ringingIndex:I

    .line 115
    iput-boolean v4, p0, Lcom/movial/ipphone/IPCallTracker;->makeCall:Z

    .line 117
    const/16 v1, 0x7d0

    iput v1, p0, Lcom/movial/ipphone/IPCallTracker;->DELAYED_REMOVE_CONNECTION:I

    .line 118
    const/16 v1, 0xbb8

    iput v1, p0, Lcom/movial/ipphone/IPCallTracker;->DELAYED_KEEP_RINGING:I

    .line 121
    new-instance v1, Lcom/movial/ipphone/IPCallTracker$1;

    invoke-direct {v1, p0}, Lcom/movial/ipphone/IPCallTracker$1;-><init>(Lcom/movial/ipphone/IPCallTracker;)V

    iput-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mHandler:Landroid/os/Handler;

    .line 154
    iput-object p1, p0, Lcom/movial/ipphone/IPCallTracker;->phone:Lcom/movial/ipphone/IPPhone;

    .line 155
    new-instance v1, Landroid/os/Messenger;

    iget-object v2, p0, Lcom/movial/ipphone/IPCallTracker;->mHandler:Landroid/os/Handler;

    invoke-direct {v1, v2}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mMsnger:Landroid/os/Messenger;

    .line 157
    invoke-virtual {p1}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "wifi"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    .line 158
    .local v0, wifiManager:Landroid/net/wifi/WifiManager;
    const/4 v1, 0x3

    const-string v2, "WifiCalling"

    invoke-virtual {v0, v1, v2}, Landroid/net/wifi/WifiManager;->createWifiLock(ILjava/lang/String;)Landroid/net/wifi/WifiManager$WifiLock;

    move-result-object v1

    iput-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    .line 159
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v1, v4}, Landroid/net/wifi/WifiManager$WifiLock;->setReferenceCounted(Z)V

    .line 161
    invoke-virtual {p1}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->createWakeLock(Landroid/content/Context;)V

    .line 163
    return-void
.end method

.method private acceptAfterHoldingDisconnected(Lcom/movial/ipphone/SessionCall;)Z
    .registers 6
    .parameter "sessioncall"

    .prologue
    const/4 v1, 0x0

    .line 499
    sget-object v2, Lcom/android/internal/telephony/Call$State;->WAITING:Lcom/android/internal/telephony/Call$State;

    iget-object v3, p0, Lcom/movial/ipphone/IPCallTracker;->ringingCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    if-ne v2, v3, :cond_18

    .line 500
    sget-object v2, Lcom/movial/ipphone/IPCallTracker$2;->$SwitchMap$com$movial$ipphone$SessionCall$State:[I

    iget-object v3, p1, Lcom/movial/ipphone/SessionCall;->state:Lcom/movial/ipphone/SessionCall$State;

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_3c

    .line 514
    :cond_18
    :goto_18
    return v1

    .line 504
    :pswitch_19
    :try_start_19
    iget-object v2, p0, Lcom/movial/ipphone/IPCallTracker;->mIPService:Lcom/movial/ipphone/IIPService;

    invoke-interface {v2}, Lcom/movial/ipphone/IIPService;->accept()V
    :try_end_1e
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_1e} :catch_20

    .line 505
    const/4 v1, 0x1

    goto :goto_18

    .line 506
    :catch_20
    move-exception v0

    .line 507
    .local v0, e:Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "acceptCall FAILED: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/movial/ipphone/IPCallTracker;->loge(Ljava/lang/String;)V

    goto :goto_18

    .line 500
    :pswitch_data_3c
    .packed-switch 0x1
        :pswitch_19
        :pswitch_19
    .end packed-switch
.end method

.method static synthetic access$000(Lcom/movial/ipphone/IPCallTracker;ILcom/android/internal/telephony/Connection$DisconnectCause;)Z
    .registers 4
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 79
    invoke-direct {p0, p1, p2}, Lcom/movial/ipphone/IPCallTracker;->removeConnection(ILcom/android/internal/telephony/Connection$DisconnectCause;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/movial/ipphone/IPCallTracker;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/movial/ipphone/IPCallTracker;->updatePhoneState()V

    return-void
.end method

.method static synthetic access$200(Lcom/movial/ipphone/IPCallTracker;)I
    .registers 2
    .parameter "x0"

    .prologue
    .line 79
    iget v0, p0, Lcom/movial/ipphone/IPCallTracker;->DELAYED_KEEP_RINGING:I

    return v0
.end method

.method static synthetic access$300(Lcom/movial/ipphone/IPCallTracker;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 79
    invoke-direct {p0}, Lcom/movial/ipphone/IPCallTracker;->clearConnections()V

    return-void
.end method

.method static synthetic access$400(Lcom/movial/ipphone/IPCallTracker;Landroid/os/Message;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lcom/movial/ipphone/IPCallTracker;->updateConnection(Landroid/os/Message;)V

    return-void
.end method

.method private addConnection(Lcom/movial/ipphone/IPConnection;)V
    .registers 3
    .parameter "conn"

    .prologue
    .line 358
    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 359
    invoke-direct {p0}, Lcom/movial/ipphone/IPCallTracker;->updateWifiLock()V

    .line 360
    invoke-direct {p0}, Lcom/movial/ipphone/IPCallTracker;->updateWakeLock()V

    .line 362
    return-void
.end method

.method private canDial()Z
    .registers 4

    .prologue
    .line 832
    const-string v1, "ro.telephony.disable-call"

    const-string v2, "false"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 833
    .local v0, disableCall:Ljava/lang/String;
    iget v1, p0, Lcom/movial/ipphone/IPCallTracker;->pendingMOIndex:I

    const/4 v2, -0x1

    if-ne v1, v2, :cond_3b

    iget-boolean v1, p0, Lcom/movial/ipphone/IPCallTracker;->pendingConf:Z

    if-nez v1, :cond_3b

    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->ringingCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->isRinging()Z

    move-result v1

    if-nez v1, :cond_3b

    const-string v1, "true"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3b

    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->foregroundCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_39

    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->backgroundCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v1

    if-nez v1, :cond_3b

    :cond_39
    const/4 v1, 0x1

    :goto_3a
    return v1

    :cond_3b
    const/4 v1, 0x0

    goto :goto_3a
.end method

.method private clear()V
    .registers 2

    .prologue
    .line 864
    const/4 v0, -0x1

    iput v0, p0, Lcom/movial/ipphone/IPCallTracker;->pendingMOIndex:I

    .line 865
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/movial/ipphone/IPCallTracker;->pendingConf:Z

    .line 866
    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->pendingMOConn:Lcom/movial/ipphone/IPCallTracker$pendingConnection;

    invoke-virtual {v0}, Lcom/movial/ipphone/IPCallTracker$pendingConnection;->clear()V

    .line 867
    return-void
.end method

.method private clearConnections()V
    .registers 6

    .prologue
    .line 364
    const-string v3, "IPCallTracker"

    const-string v4, "clearConnections"

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 365
    iget-object v3, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v2, v3, -0x1

    .line 366
    .local v2, size:I
    move v1, v2

    .local v1, i:I
    :goto_10
    const/4 v3, -0x1

    if-le v1, v3, :cond_29

    .line 367
    iget-object v3, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/movial/ipphone/IPConnection;

    .line 368
    .local v0, conn:Lcom/movial/ipphone/IPConnection;
    iget-object v3, v0, Lcom/movial/ipphone/IPConnection;->cause:Lcom/android/internal/telephony/Connection$DisconnectCause;

    sget-object v4, Lcom/android/internal/telephony/Connection$DisconnectCause;->LOCAL:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v3, v4, :cond_26

    .line 369
    sget-object v3, Lcom/android/internal/telephony/Connection$DisconnectCause;->ERROR_UNSPECIFIED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    invoke-direct {p0, v1, v3}, Lcom/movial/ipphone/IPCallTracker;->removeConnection(ILcom/android/internal/telephony/Connection$DisconnectCause;)Z

    .line 366
    :cond_26
    add-int/lit8 v1, v1, -0x1

    goto :goto_10

    .line 371
    .end local v0           #conn:Lcom/movial/ipphone/IPConnection;
    :cond_29
    invoke-direct {p0}, Lcom/movial/ipphone/IPCallTracker;->updatePhoneState()V

    .line 372
    iget-object v3, p0, Lcom/movial/ipphone/IPCallTracker;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v3}, Lcom/movial/ipphone/IPPhone;->notifyPreciseCallStateChanged()V

    .line 373
    return-void
.end method

.method private createWakeLock(Landroid/content/Context;)V
    .registers 5
    .parameter "context"

    .prologue
    .line 173
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mPartialWakeLock:Landroid/os/PowerManager$WakeLock;

    if-nez v1, :cond_15

    .line 174
    const-string v1, "power"

    invoke-virtual {p1, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 175
    .local v0, pm:Landroid/os/PowerManager;
    const/4 v1, 0x1

    const-string v2, "IPCallTracker"

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    iput-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mPartialWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 177
    .end local v0           #pm:Landroid/os/PowerManager;
    :cond_15
    return-void
.end method

.method private dial(Lcom/movial/ipphone/IPConnection;I)V
    .registers 9
    .parameter "conn"
    .parameter "clirMode"

    .prologue
    .line 440
    const/4 v1, -0x1

    .line 442
    .local v1, result:I
    :try_start_1
    invoke-virtual {p1}, Lcom/movial/ipphone/IPConnection;->getDialString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/telephony/PhoneNumberUtils;->isEmergencyNumber(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_38

    .line 443
    iget-object v2, p0, Lcom/movial/ipphone/IPCallTracker;->mIPService:Lcom/movial/ipphone/IIPService;

    invoke-virtual {p1}, Lcom/movial/ipphone/IPConnection;->getAddress()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/movial/ipphone/IIPService;->dialEmergencyCall(Ljava/lang/String;)I
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_14} :catch_43

    move-result v1

    .line 452
    :goto_15
    const/4 v2, -0x1

    if-ne v1, v2, :cond_4c

    .line 453
    iget-object v2, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/movial/ipphone/IPCallTracker;->pendingMOIndex:I

    .line 454
    iget-object v2, p0, Lcom/movial/ipphone/IPCallTracker;->mHandler:Landroid/os/Handler;

    const/16 v3, 0x29

    iget v4, p0, Lcom/movial/ipphone/IPCallTracker;->DELAYED_REMOVE_CONNECTION:I

    int-to-long v4, v4

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 459
    :goto_2c
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/movial/ipphone/IPCallTracker;->makeCall:Z

    .line 461
    invoke-direct {p0}, Lcom/movial/ipphone/IPCallTracker;->updatePhoneState()V

    .line 462
    iget-object v2, p0, Lcom/movial/ipphone/IPCallTracker;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v2}, Lcom/movial/ipphone/IPPhone;->notifyPreciseCallStateChanged()V

    .line 463
    return-void

    .line 446
    :cond_38
    :try_start_38
    iget-object v2, p0, Lcom/movial/ipphone/IPCallTracker;->mIPService:Lcom/movial/ipphone/IIPService;

    invoke-virtual {p1}, Lcom/movial/ipphone/IPConnection;->getAddress()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, p2}, Lcom/movial/ipphone/IIPService;->dial(Ljava/lang/String;I)I
    :try_end_41
    .catch Ljava/lang/Exception; {:try_start_38 .. :try_end_41} :catch_43

    move-result v1

    goto :goto_15

    .line 448
    :catch_43
    move-exception v0

    .line 449
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/movial/ipphone/IPCallTracker;->loge(Ljava/lang/String;)V

    goto :goto_15

    .line 456
    .end local v0           #e:Ljava/lang/Exception;
    :cond_4c
    iput v1, p1, Lcom/movial/ipphone/IPConnection;->index:I

    goto :goto_2c
.end method

.method private fakeHoldForegroundBeforeDial()V
    .registers 6

    .prologue
    .line 841
    iget-object v4, p0, Lcom/movial/ipphone/IPCallTracker;->foregroundCall:Lcom/movial/ipphone/IPCall;

    iget-object v4, v4, Lcom/movial/ipphone/IPCall;->connections:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 842
    .local v1, connCopy:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Connection;>;"
    const/4 v2, 0x0

    .local v2, i:I
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    .local v3, s:I
    :goto_f
    if-ge v2, v3, :cond_1d

    .line 843
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/movial/ipphone/IPConnection;

    .line 844
    .local v0, conn:Lcom/movial/ipphone/IPConnection;
    invoke-virtual {v0}, Lcom/movial/ipphone/IPConnection;->fakeHoldBeforeDial()V

    .line 842
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    .line 846
    .end local v0           #conn:Lcom/movial/ipphone/IPConnection;
    :cond_1d
    return-void
.end method

.method private findConnection(Lcom/movial/ipphone/SessionCall;)I
    .registers 7
    .parameter "sessioncall"

    .prologue
    const/4 v2, -0x1

    .line 377
    const/4 v1, 0x0

    .local v1, i:I
    :goto_2
    iget-object v3, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_57

    .line 378
    iget-object v3, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/movial/ipphone/IPConnection;

    .line 381
    .local v0, conn:Lcom/movial/ipphone/IPConnection;
    invoke-virtual {v0}, Lcom/movial/ipphone/IPConnection;->getIndex()I

    move-result v3

    iget v4, p1, Lcom/android/internal/telephony/DriverCall;->index:I

    if-ne v3, v4, :cond_22

    .line 382
    iget-boolean v2, p1, Lcom/movial/ipphone/SessionCall;->inConf:Z

    if-eqz v2, :cond_21

    .line 383
    const/4 v2, 0x1

    iput-boolean v2, v0, Lcom/movial/ipphone/IPConnection;->inConf:Z

    .line 396
    .end local v0           #conn:Lcom/movial/ipphone/IPConnection;
    .end local v1           #i:I
    :cond_21
    :goto_21
    return v1

    .line 387
    .restart local v0       #conn:Lcom/movial/ipphone/IPConnection;
    .restart local v1       #i:I
    :cond_22
    const-string v3, "E911"

    iget-object v4, p1, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3c

    invoke-virtual {v0}, Lcom/movial/ipphone/IPConnection;->getAddress()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/telephony/PhoneNumberUtils;->isEmergencyNumber(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3c

    .line 388
    iget v2, p1, Lcom/android/internal/telephony/DriverCall;->index:I

    invoke-virtual {v0, v2}, Lcom/movial/ipphone/IPConnection;->setIndex(I)V

    goto :goto_21

    .line 391
    :cond_3c
    invoke-virtual {v0}, Lcom/movial/ipphone/IPConnection;->getAddress()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p1, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_54

    invoke-virtual {v0}, Lcom/movial/ipphone/IPConnection;->getIndex()I

    move-result v3

    if-ne v3, v2, :cond_54

    .line 392
    iget v2, p1, Lcom/android/internal/telephony/DriverCall;->index:I

    invoke-virtual {v0, v2}, Lcom/movial/ipphone/IPConnection;->setIndex(I)V

    goto :goto_21

    .line 377
    :cond_54
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .end local v0           #conn:Lcom/movial/ipphone/IPConnection;
    :cond_57
    move v1, v2

    .line 396
    goto :goto_21
.end method

.method private isNewCall(Lcom/movial/ipphone/SessionCall;)I
    .registers 5
    .parameter "sessioncall"

    .prologue
    const/4 v0, -0x1

    .line 849
    iget-boolean v1, p1, Lcom/movial/ipphone/SessionCall;->inConf:Z

    if-eqz v1, :cond_6

    .line 859
    :goto_5
    return v0

    .line 852
    :cond_6
    sget-object v1, Lcom/movial/ipphone/IPCallTracker$2;->$SwitchMap$com$movial$ipphone$SessionCall$State:[I

    iget-object v2, p1, Lcom/movial/ipphone/SessionCall;->state:Lcom/movial/ipphone/SessionCall$State;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_18

    goto :goto_5

    .line 855
    :pswitch_14
    const/4 v0, 0x1

    goto :goto_5

    .line 857
    :pswitch_16
    const/4 v0, 0x0

    goto :goto_5

    .line 852
    :pswitch_data_18
    .packed-switch 0x3
        :pswitch_14
        :pswitch_14
        :pswitch_16
    .end packed-switch
.end method

.method private loge(Ljava/lang/String;)V
    .registers 3
    .parameter "content"

    .prologue
    .line 904
    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->phone:Lcom/movial/ipphone/IPPhone;

    .line 905
    const-string v0, "IPCallTracker"

    invoke-static {v0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 906
    return-void
.end method

.method private removeConnection(ILcom/android/internal/telephony/Connection$DisconnectCause;)Z
    .registers 12
    .parameter "i"
    .parameter "failedcause"

    .prologue
    .line 324
    const/4 v3, 0x0

    .line 327
    .local v3, result:Z
    iget-object v5, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-nez v5, :cond_b

    move v4, v3

    .line 354
    .end local v3           #result:Z
    .local v4, result:I
    :goto_a
    return v4

    .line 330
    .end local v4           #result:I
    .restart local v3       #result:Z
    :cond_b
    :try_start_b
    iget-object v5, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/movial/ipphone/IPConnection;
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_13} :catch_5d

    .line 336
    .local v1, conn:Lcom/movial/ipphone/IPConnection;
    move-object v0, p2

    .line 337
    .local v0, cause:Lcom/android/internal/telephony/Connection$DisconnectCause;
    invoke-virtual {v1}, Lcom/movial/ipphone/IPConnection;->isIncoming()Z

    move-result v5

    if-eqz v5, :cond_6a

    invoke-virtual {v1}, Lcom/movial/ipphone/IPConnection;->getConnectTime()J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v5, v5, v7

    if-nez v5, :cond_6a

    .line 339
    iget-object v5, v1, Lcom/movial/ipphone/IPConnection;->cause:Lcom/android/internal/telephony/Connection$DisconnectCause;

    sget-object v6, Lcom/android/internal/telephony/Connection$DisconnectCause;->LOCAL:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v5, v6, :cond_67

    .line 340
    sget-object v0, Lcom/android/internal/telephony/Connection$DisconnectCause;->INCOMING_REJECTED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    .line 348
    :cond_2c
    :goto_2c
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "removeConnection. i: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " cause: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/movial/ipphone/IPCallTracker;->log(Ljava/lang/String;)V

    .line 349
    invoke-virtual {v1, v0}, Lcom/movial/ipphone/IPConnection;->onDisconnect(Lcom/android/internal/telephony/Connection$DisconnectCause;)Z

    move-result v3

    .line 350
    iget-object v5, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 351
    invoke-direct {p0}, Lcom/movial/ipphone/IPCallTracker;->updateWifiLock()V

    .line 352
    invoke-direct {p0}, Lcom/movial/ipphone/IPCallTracker;->updateWakeLock()V

    move v4, v3

    .line 354
    .restart local v4       #result:I
    goto :goto_a

    .line 331
    .end local v0           #cause:Lcom/android/internal/telephony/Connection$DisconnectCause;
    .end local v1           #conn:Lcom/movial/ipphone/IPConnection;
    .end local v4           #result:I
    :catch_5d
    move-exception v2

    .line 332
    .local v2, e:Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/movial/ipphone/IPCallTracker;->loge(Ljava/lang/String;)V

    move v4, v3

    .line 333
    .restart local v4       #result:I
    goto :goto_a

    .line 342
    .end local v2           #e:Ljava/lang/Exception;
    .end local v4           #result:I
    .restart local v0       #cause:Lcom/android/internal/telephony/Connection$DisconnectCause;
    .restart local v1       #conn:Lcom/movial/ipphone/IPConnection;
    :cond_67
    sget-object v0, Lcom/android/internal/telephony/Connection$DisconnectCause;->INCOMING_MISSED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    goto :goto_2c

    .line 344
    :cond_6a
    iget-object v5, v1, Lcom/movial/ipphone/IPConnection;->cause:Lcom/android/internal/telephony/Connection$DisconnectCause;

    sget-object v6, Lcom/android/internal/telephony/Connection$DisconnectCause;->LOCAL:Lcom/android/internal/telephony/Connection$DisconnectCause;

    if-ne v5, v6, :cond_2c

    .line 346
    sget-object v0, Lcom/android/internal/telephony/Connection$DisconnectCause;->LOCAL:Lcom/android/internal/telephony/Connection$DisconnectCause;

    goto :goto_2c
.end method

.method private swapCallUiUpdate(Lcom/movial/ipphone/SessionCall;)Z
    .registers 8
    .parameter "sessioncall"

    .prologue
    const/4 v5, -0x1

    .line 870
    const/4 v2, 0x0

    .line 871
    .local v2, result:Z
    iget-object v3, p1, Lcom/movial/ipphone/SessionCall;->state:Lcom/movial/ipphone/SessionCall$State;

    sget-object v4, Lcom/movial/ipphone/SessionCall$State;->DISCONNECTED:Lcom/movial/ipphone/SessionCall$State;

    if-ne v3, v4, :cond_a

    .line 872
    iput v5, p0, Lcom/movial/ipphone/IPCallTracker;->mSwapCall:I

    .line 874
    :cond_a
    iget v3, p0, Lcom/movial/ipphone/IPCallTracker;->mSwapCall:I

    if-lez v3, :cond_75

    .line 875
    iget-boolean v3, p1, Lcom/movial/ipphone/SessionCall;->inConf:Z

    if-eqz v3, :cond_49

    .line 876
    iget v3, p0, Lcom/movial/ipphone/IPCallTracker;->mSwapCall:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lcom/movial/ipphone/IPCallTracker;->mSwapCall:I

    .line 887
    :cond_18
    :goto_18
    iget v3, p0, Lcom/movial/ipphone/IPCallTracker;->mSwapCall:I

    if-nez v3, :cond_24

    .line 888
    iput v5, p0, Lcom/movial/ipphone/IPCallTracker;->mSwapCall:I

    .line 889
    const/4 v2, 0x1

    .line 890
    iget-object v3, p0, Lcom/movial/ipphone/IPCallTracker;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v3}, Lcom/movial/ipphone/IPPhone;->notifyPreciseCallStateChanged()V

    .line 893
    :cond_24
    const-string v3, "IPCallTracker"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "swapCallUiUpdate. "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", swapCall: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/movial/ipphone/IPCallTracker;->mSwapCall:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 895
    return v2

    .line 878
    :cond_49
    const/4 v1, 0x0

    .local v1, i:I
    :goto_4a
    iget-object v3, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v1, v3, :cond_18

    .line 879
    iget-object v3, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/movial/ipphone/IPConnection;

    .line 880
    .local v0, conn:Lcom/movial/ipphone/IPConnection;
    iget v3, v0, Lcom/movial/ipphone/IPConnection;->index:I

    iget v4, p1, Lcom/android/internal/telephony/DriverCall;->index:I

    if-ne v3, v4, :cond_72

    invoke-virtual {v0}, Lcom/movial/ipphone/IPConnection;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    iget-object v4, p1, Lcom/movial/ipphone/SessionCall;->state:Lcom/movial/ipphone/SessionCall$State;

    invoke-virtual {v0, v4}, Lcom/movial/ipphone/IPConnection;->parseSessionState(Lcom/movial/ipphone/SessionCall$State;)Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    if-eq v3, v4, :cond_72

    .line 881
    iget v3, p0, Lcom/movial/ipphone/IPCallTracker;->mSwapCall:I

    add-int/lit8 v3, v3, -0x1

    iput v3, p0, Lcom/movial/ipphone/IPCallTracker;->mSwapCall:I

    .line 878
    :cond_72
    add-int/lit8 v1, v1, 0x1

    goto :goto_4a

    .line 884
    .end local v0           #conn:Lcom/movial/ipphone/IPConnection;
    .end local v1           #i:I
    :cond_75
    iget v3, p0, Lcom/movial/ipphone/IPCallTracker;->mSwapCall:I

    if-ne v5, v3, :cond_18

    .line 885
    const/4 v2, 0x1

    goto :goto_18
.end method

.method private updateConfConnections(Lcom/movial/ipphone/SessionCall;Z)V
    .registers 10
    .parameter "sessioncall"
    .parameter "swap"

    .prologue
    .line 304
    const-string v4, "IPCallTracker"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "updateConfConnections. "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 305
    const/4 v2, 0x0

    .line 306
    .local v2, notified:Z
    iget-object v4, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    add-int/lit8 v3, v4, -0x1

    .line 307
    .local v3, size:I
    iget-object v4, p1, Lcom/movial/ipphone/SessionCall;->state:Lcom/movial/ipphone/SessionCall$State;

    sget-object v5, Lcom/movial/ipphone/SessionCall$State;->UNKNOWN:Lcom/movial/ipphone/SessionCall$State;

    if-ne v4, v5, :cond_52

    sget-object v4, Lcom/movial/ipphone/SessionCall$State;->ACTIVE:Lcom/movial/ipphone/SessionCall$State;

    :goto_2f
    iput-object v4, p1, Lcom/movial/ipphone/SessionCall;->state:Lcom/movial/ipphone/SessionCall$State;

    .line 308
    move v1, v3

    .local v1, i:I
    :goto_32
    const/4 v4, -0x1

    if-le v1, v4, :cond_63

    .line 309
    iget-object v4, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/movial/ipphone/IPConnection;

    .line 310
    .local v0, conn:Lcom/movial/ipphone/IPConnection;
    iget-boolean v4, v0, Lcom/movial/ipphone/IPConnection;->inConf:Z

    if-eqz v4, :cond_4f

    .line 311
    iget-object v4, p1, Lcom/movial/ipphone/SessionCall;->state:Lcom/movial/ipphone/SessionCall$State;

    sget-object v5, Lcom/movial/ipphone/SessionCall$State;->DISCONNECTED:Lcom/movial/ipphone/SessionCall$State;

    if-ne v4, v5, :cond_55

    .line 312
    if-nez v2, :cond_4f

    iget-object v4, p1, Lcom/movial/ipphone/SessionCall;->cause:Lcom/android/internal/telephony/Connection$DisconnectCause;

    invoke-direct {p0, v1, v4}, Lcom/movial/ipphone/IPCallTracker;->removeConnection(ILcom/android/internal/telephony/Connection$DisconnectCause;)Z

    move-result v2

    .line 308
    :cond_4f
    :goto_4f
    add-int/lit8 v1, v1, -0x1

    goto :goto_32

    .line 307
    .end local v0           #conn:Lcom/movial/ipphone/IPConnection;
    .end local v1           #i:I
    :cond_52
    iget-object v4, p1, Lcom/movial/ipphone/SessionCall;->state:Lcom/movial/ipphone/SessionCall$State;

    goto :goto_2f

    .line 313
    .restart local v0       #conn:Lcom/movial/ipphone/IPConnection;
    .restart local v1       #i:I
    :cond_55
    iget-object v4, p1, Lcom/movial/ipphone/SessionCall;->state:Lcom/movial/ipphone/SessionCall$State;

    invoke-virtual {v0, v4}, Lcom/movial/ipphone/IPConnection;->update(Lcom/movial/ipphone/SessionCall$State;)Z

    move-result v4

    if-eqz v4, :cond_4f

    .line 314
    if-eqz p2, :cond_61

    const/4 v2, 0x1

    :goto_60
    goto :goto_4f

    :cond_61
    const/4 v2, 0x0

    goto :goto_60

    .line 318
    .end local v0           #conn:Lcom/movial/ipphone/IPConnection;
    :cond_63
    invoke-direct {p0}, Lcom/movial/ipphone/IPCallTracker;->updatePhoneState()V

    .line 319
    if-eqz v2, :cond_6d

    .line 320
    iget-object v4, p0, Lcom/movial/ipphone/IPCallTracker;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v4}, Lcom/movial/ipphone/IPPhone;->notifyPreciseCallStateChanged()V

    .line 321
    :cond_6d
    return-void
.end method

.method private updateConnection(Landroid/os/Message;)V
    .registers 16
    .parameter "msg"

    .prologue
    const/16 v13, 0x2a

    const/4 v10, 0x0

    const/4 v9, 0x1

    const/4 v12, -0x1

    .line 216
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v1

    .line 217
    .local v1, bundle:Landroid/os/Bundle;
    const-class v8, Lcom/movial/ipphone/IPCallTracker;

    invoke-virtual {v8}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v8

    invoke-virtual {v1, v8}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 218
    const-string v8, "call"

    invoke-virtual {v1, v8}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v6

    check-cast v6, Lcom/movial/ipphone/SessionCall;

    .line 221
    .local v6, sessioncall:Lcom/movial/ipphone/SessionCall;
    invoke-direct {p0, v6}, Lcom/movial/ipphone/IPCallTracker;->findConnection(Lcom/movial/ipphone/SessionCall;)I

    move-result v3

    .line 223
    .local v3, i:I
    iget v8, p1, Landroid/os/Message;->what:I

    if-ne v8, v9, :cond_64

    .line 224
    const-string v8, "IPCallTracker"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "SessionCall.MSG_CALL_RINGING. "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lcom/movial/ipphone/IPCallTracker;->ringingIndex:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    if-eq v3, v12, :cond_63

    .line 228
    iget-object v8, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/movial/ipphone/IPConnection;

    invoke-virtual {v8}, Lcom/movial/ipphone/IPConnection;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v8

    sget-object v9, Lcom/android/internal/telephony/Call$State;->INCOMING:Lcom/android/internal/telephony/Call$State;

    if-ne v8, v9, :cond_63

    iget v8, p0, Lcom/movial/ipphone/IPCallTracker;->ringingIndex:I

    if-ne v8, v12, :cond_63

    .line 229
    iput v3, p0, Lcom/movial/ipphone/IPCallTracker;->ringingIndex:I

    .line 230
    iget-object v8, p0, Lcom/movial/ipphone/IPCallTracker;->mHandler:Landroid/os/Handler;

    invoke-virtual {v8, v13}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 301
    :cond_63
    :goto_63
    return-void

    .line 236
    :cond_64
    const/4 v4, 0x0

    .line 237
    .local v4, isCNAM:Z
    iget v8, p1, Landroid/os/Message;->what:I

    const/4 v11, 0x5

    if-ne v8, v11, :cond_aa

    .line 238
    const-string v8, "IPCallTracker"

    const-string v11, "updateConnection: update CNAM"

    invoke-static {v8, v11}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 239
    iget-object v8, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/movial/ipphone/IPConnection;

    iget-object v11, v6, Lcom/android/internal/telephony/DriverCall;->name:Ljava/lang/String;

    iput-object v11, v8, Lcom/movial/ipphone/IPConnection;->cnapName:Ljava/lang/String;

    .line 240
    const/4 v4, 0x1

    .line 249
    :cond_7e
    :goto_7e
    iget v8, p1, Landroid/os/Message;->what:I

    const/4 v11, 0x6

    if-ne v8, v11, :cond_8d

    .line 250
    iget-object v11, p0, Lcom/movial/ipphone/IPCallTracker;->phone:Lcom/movial/ipphone/IPPhone;

    iget v8, p1, Landroid/os/Message;->arg1:I

    if-ne v8, v9, :cond_c3

    move v8, v9

    :goto_8a
    invoke-virtual {v11, v8}, Lcom/movial/ipphone/IPPhone;->notifyRingbackTone(Z)V

    .line 255
    :cond_8d
    invoke-virtual {p0, v6}, Lcom/movial/ipphone/IPCallTracker;->dialAfterHolding(Lcom/movial/ipphone/SessionCall;)V

    .line 259
    invoke-direct {p0, v6}, Lcom/movial/ipphone/IPCallTracker;->acceptAfterHoldingDisconnected(Lcom/movial/ipphone/SessionCall;)Z

    move-result v0

    .line 262
    .local v0, accept:Z
    invoke-direct {p0, v6}, Lcom/movial/ipphone/IPCallTracker;->swapCallUiUpdate(Lcom/movial/ipphone/SessionCall;)Z

    move-result v7

    .line 264
    .local v7, swap:Z
    const/4 v5, 0x0

    .line 265
    .local v5, notified:Z
    if-ne v3, v12, :cond_109

    .line 266
    invoke-direct {p0, v6}, Lcom/movial/ipphone/IPCallTracker;->isNewCall(Lcom/movial/ipphone/SessionCall;)I

    move-result v8

    packed-switch v8, :pswitch_data_132

    .line 284
    iget-boolean v8, v6, Lcom/movial/ipphone/SessionCall;->inConf:Z

    if-eqz v8, :cond_e8

    .line 285
    invoke-direct {p0, v6, v7}, Lcom/movial/ipphone/IPCallTracker;->updateConfConnections(Lcom/movial/ipphone/SessionCall;Z)V

    goto :goto_63

    .line 241
    .end local v0           #accept:Z
    .end local v5           #notified:Z
    .end local v7           #swap:Z
    :cond_aa
    iget v8, p0, Lcom/movial/ipphone/IPCallTracker;->ringingIndex:I

    if-ne v8, v3, :cond_7e

    iget-object v8, v6, Lcom/movial/ipphone/SessionCall;->state:Lcom/movial/ipphone/SessionCall$State;

    sget-object v11, Lcom/movial/ipphone/SessionCall$State;->ALERTING:Lcom/movial/ipphone/SessionCall$State;

    if-eq v8, v11, :cond_7e

    .line 243
    const-string v8, "IPCallTracker"

    const-string v11, "removeMessages"

    invoke-static {v8, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    iget-object v8, p0, Lcom/movial/ipphone/IPCallTracker;->mHandler:Landroid/os/Handler;

    invoke-virtual {v8, v13}, Landroid/os/Handler;->removeMessages(I)V

    .line 245
    iput v12, p0, Lcom/movial/ipphone/IPCallTracker;->ringingIndex:I

    goto :goto_7e

    :cond_c3
    move v8, v10

    .line 250
    goto :goto_8a

    .line 268
    .restart local v0       #accept:Z
    .restart local v5       #notified:Z
    .restart local v7       #swap:Z
    :pswitch_c5
    new-instance v2, Lcom/movial/ipphone/IPConnection;

    iget-object v8, p0, Lcom/movial/ipphone/IPCallTracker;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v8}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v2, v8, p0, v6}, Lcom/movial/ipphone/IPConnection;-><init>(Landroid/content/Context;Lcom/movial/ipphone/IPCallTracker;Lcom/movial/ipphone/SessionCall;)V

    .line 269
    .local v2, c:Lcom/movial/ipphone/IPConnection;
    invoke-direct {p0, v2}, Lcom/movial/ipphone/IPCallTracker;->addConnection(Lcom/movial/ipphone/IPConnection;)V

    .line 270
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    iput-wide v8, v2, Lcom/movial/ipphone/IPConnection;->connectTime:J

    .line 271
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v8

    iput-wide v8, v2, Lcom/movial/ipphone/IPConnection;->connectTimeReal:J

    .line 272
    const-wide/16 v8, 0x0

    iput-wide v8, v2, Lcom/movial/ipphone/IPConnection;->duration:J

    .line 273
    iget-object v8, p0, Lcom/movial/ipphone/IPCallTracker;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v8, v2}, Lcom/movial/ipphone/IPPhone;->notifyUnknownConnection(Lcom/android/internal/telephony/Connection;)V

    .line 290
    .end local v2           #c:Lcom/movial/ipphone/IPConnection;
    :cond_e8
    :goto_e8
    const/4 v5, 0x1

    .line 298
    :cond_e9
    :goto_e9
    invoke-direct {p0}, Lcom/movial/ipphone/IPCallTracker;->updatePhoneState()V

    .line 299
    if-eqz v5, :cond_63

    .line 300
    iget-object v8, p0, Lcom/movial/ipphone/IPCallTracker;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v8}, Lcom/movial/ipphone/IPPhone;->notifyPreciseCallStateChanged()V

    goto/16 :goto_63

    .line 278
    :pswitch_f5
    new-instance v2, Lcom/movial/ipphone/IPConnection;

    iget-object v8, p0, Lcom/movial/ipphone/IPCallTracker;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v8}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-direct {v2, v8, p0, v6}, Lcom/movial/ipphone/IPConnection;-><init>(Landroid/content/Context;Lcom/movial/ipphone/IPCallTracker;Lcom/movial/ipphone/SessionCall;)V

    .line 279
    .restart local v2       #c:Lcom/movial/ipphone/IPConnection;
    invoke-direct {p0, v2}, Lcom/movial/ipphone/IPCallTracker;->addConnection(Lcom/movial/ipphone/IPConnection;)V

    .line 280
    iget-object v8, p0, Lcom/movial/ipphone/IPCallTracker;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v8, v2}, Lcom/movial/ipphone/IPPhone;->notifyNewRingingConnection(Lcom/android/internal/telephony/Connection;)V

    goto :goto_e8

    .line 291
    .end local v2           #c:Lcom/movial/ipphone/IPConnection;
    :cond_109
    iget-object v8, v6, Lcom/movial/ipphone/SessionCall;->state:Lcom/movial/ipphone/SessionCall$State;

    sget-object v11, Lcom/movial/ipphone/SessionCall$State;->DISCONNECTED:Lcom/movial/ipphone/SessionCall$State;

    if-ne v8, v11, :cond_116

    .line 292
    iget-object v8, v6, Lcom/movial/ipphone/SessionCall;->cause:Lcom/android/internal/telephony/Connection$DisconnectCause;

    invoke-direct {p0, v3, v8}, Lcom/movial/ipphone/IPCallTracker;->removeConnection(ILcom/android/internal/telephony/Connection$DisconnectCause;)Z

    move-result v5

    goto :goto_e9

    .line 293
    :cond_116
    if-eqz v4, :cond_11a

    .line 294
    const/4 v5, 0x1

    goto :goto_e9

    .line 295
    :cond_11a
    iget-object v8, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/movial/ipphone/IPConnection;

    iget-object v11, v6, Lcom/movial/ipphone/SessionCall;->state:Lcom/movial/ipphone/SessionCall$State;

    invoke-virtual {v8, v11}, Lcom/movial/ipphone/IPConnection;->update(Lcom/movial/ipphone/SessionCall$State;)Z

    move-result v8

    if-eqz v8, :cond_e9

    .line 296
    if-eqz v7, :cond_130

    if-nez v0, :cond_130

    move v5, v9

    :goto_12f
    goto :goto_e9

    :cond_130
    move v5, v10

    goto :goto_12f

    .line 266
    :pswitch_data_132
    .packed-switch 0x0
        :pswitch_c5
        :pswitch_f5
    .end packed-switch
.end method

.method private updatePhoneState()V
    .registers 5

    .prologue
    const/4 v3, 0x0

    .line 789
    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->state:Lcom/android/internal/telephony/PhoneConstants$State;

    .line 791
    .local v0, oldState:Lcom/android/internal/telephony/PhoneConstants$State;
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->ringingCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->isRinging()Z

    move-result v1

    if-eqz v1, :cond_4f

    .line 792
    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->RINGING:Lcom/android/internal/telephony/PhoneConstants$State;

    iput-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->state:Lcom/android/internal/telephony/PhoneConstants$State;

    .line 804
    :goto_f
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->state:Lcom/android/internal/telephony/PhoneConstants$State;

    sget-object v2, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v1, v2, :cond_78

    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->state:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v0, v1, :cond_78

    .line 805
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->voiceCallEndedRegistrants:Landroid/os/RegistrantList;

    new-instance v2, Landroid/os/AsyncResult;

    invoke-direct {v2, v3, v3, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v1, v2}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    .line 810
    :cond_23
    :goto_23
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "updatePhoneState. original: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", current: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/movial/ipphone/IPCallTracker;->state:Lcom/android/internal/telephony/PhoneConstants$State;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->log(Ljava/lang/String;)V

    .line 812
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->state:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v1, v0, :cond_4e

    .line 813
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v1}, Lcom/movial/ipphone/IPPhone;->notifyPhoneStateChanged()V

    .line 815
    :cond_4e
    return-void

    .line 793
    :cond_4f
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->foregroundCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v1

    if-eqz v1, :cond_5f

    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->backgroundCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v1

    if-nez v1, :cond_64

    .line 794
    :cond_5f
    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    iput-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->state:Lcom/android/internal/telephony/PhoneConstants$State;

    goto :goto_f

    .line 796
    :cond_64
    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    iput-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->state:Lcom/android/internal/telephony/PhoneConstants$State;

    .line 798
    const/4 v1, -0x1

    iput v1, p0, Lcom/movial/ipphone/IPCallTracker;->mSwapCall:I

    .line 799
    iget-boolean v1, p0, Lcom/movial/ipphone/IPCallTracker;->makeCall:Z

    if-eqz v1, :cond_74

    .line 800
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v1}, Lcom/movial/ipphone/IPPhone;->notifyToShowDialog()V

    .line 801
    :cond_74
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/movial/ipphone/IPCallTracker;->makeCall:Z

    goto :goto_f

    .line 806
    :cond_78
    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v0, v1, :cond_23

    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->state:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v0, v1, :cond_23

    .line 807
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->voiceCallStartedRegistrants:Landroid/os/RegistrantList;

    new-instance v2, Landroid/os/AsyncResult;

    invoke-direct {v2, v3, v3, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v1, v2}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto :goto_23
.end method

.method private updateWakeLock()V
    .registers 4

    .prologue
    .line 180
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mPartialWakeLock:Landroid/os/PowerManager$WakeLock;

    monitor-enter v1

    .line 181
    :try_start_3
    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1f

    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->mPartialWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-nez v0, :cond_1f

    .line 182
    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->mPartialWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 183
    const-string v0, "acquire mPartialWakeLock"

    invoke-virtual {p0, v0}, Lcom/movial/ipphone/IPCallTracker;->log(Ljava/lang/String;)V

    .line 192
    :goto_1d
    monitor-exit v1

    .line 193
    return-void

    .line 185
    :cond_1f
    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_3d

    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->mPartialWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_3d

    .line 186
    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->mPartialWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 187
    const-string v0, "release mPartialWakeLock"

    invoke-virtual {p0, v0}, Lcom/movial/ipphone/IPCallTracker;->log(Ljava/lang/String;)V

    goto :goto_1d

    .line 192
    :catchall_3a
    move-exception v0

    monitor-exit v1
    :try_end_3c
    .catchall {:try_start_3 .. :try_end_3c} :catchall_3a

    throw v0

    .line 190
    :cond_3d
    :try_start_3d
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "is wake lock held: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/movial/ipphone/IPCallTracker;->mPartialWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/movial/ipphone/IPCallTracker;->log(Ljava/lang/String;)V
    :try_end_59
    .catchall {:try_start_3d .. :try_end_59} :catchall_3a

    goto :goto_1d
.end method

.method private updateWifiLock()V
    .registers 3

    .prologue
    .line 818
    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1b

    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->mWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->isHeld()Z

    move-result v0

    if-nez v0, :cond_1b

    .line 819
    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->mWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->acquire()V

    .line 820
    const-string v0, "acquire wifilock"

    invoke-virtual {p0, v0}, Lcom/movial/ipphone/IPCallTracker;->log(Ljava/lang/String;)V

    .line 829
    :goto_1a
    return-void

    .line 822
    :cond_1b
    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_36

    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->mWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_36

    .line 823
    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->mWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager$WifiLock;->release()V

    .line 824
    const-string v0, "release wifilock"

    invoke-virtual {p0, v0}, Lcom/movial/ipphone/IPCallTracker;->log(Ljava/lang/String;)V

    goto :goto_1a

    .line 827
    :cond_36
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "is lock held: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mWifiLock:Landroid/net/wifi/WifiManager$WifiLock;

    invoke-virtual {v1}, Landroid/net/wifi/WifiManager$WifiLock;->isHeld()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/movial/ipphone/IPCallTracker;->log(Ljava/lang/String;)V

    goto :goto_1a
.end method


# virtual methods
.method acceptCall()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 518
    const-string v1, "removing EVENT_KEEP_RINGING messages!"

    invoke-virtual {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->log(Ljava/lang/String;)V

    .line 519
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mHandler:Landroid/os/Handler;

    const/16 v2, 0x2a

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 520
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "acceptCall. ringingCall state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/movial/ipphone/IPCallTracker;->ringingCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " foregroundCall state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/movial/ipphone/IPCallTracker;->foregroundCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->log(Ljava/lang/String;)V

    .line 523
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->foregroundCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v1

    sget-object v2, Lcom/android/internal/telephony/Call$State;->DISCONNECTING:Lcom/android/internal/telephony/Call$State;

    if-ne v1, v2, :cond_44

    .line 553
    :goto_43
    return-void

    .line 525
    :cond_44
    sget-object v1, Lcom/movial/ipphone/IPCallTracker$2;->$SwitchMap$com$android$internal$telephony$Call$State:[I

    iget-object v2, p0, Lcom/movial/ipphone/IPCallTracker;->ringingCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_be

    .line 555
    :cond_55
    new-instance v1, Lcom/android/internal/telephony/CallStateException;

    const-string v2, "phone not ringing"

    invoke-direct {v1, v2}, Lcom/android/internal/telephony/CallStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 530
    :pswitch_5d
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->foregroundCall:Lcom/movial/ipphone/IPCall;

    if-eqz v1, :cond_74

    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->foregroundCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v1

    sget-object v2, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v1, v2, :cond_74

    .line 531
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->switchWaitingOrHoldingAndActive(Z)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_55

    goto :goto_43

    .line 534
    :cond_74
    invoke-virtual {p0, v3}, Lcom/movial/ipphone/IPCallTracker;->setMute(Z)V

    .line 536
    :try_start_77
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mIPService:Lcom/movial/ipphone/IIPService;

    invoke-interface {v1}, Lcom/movial/ipphone/IIPService;->accept()V
    :try_end_7c
    .catch Ljava/lang/Exception; {:try_start_77 .. :try_end_7c} :catch_7d

    goto :goto_43

    .line 537
    :catch_7d
    move-exception v0

    .line 538
    .local v0, e:Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "acceptCall FAILED: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->loge(Ljava/lang/String;)V

    goto :goto_43

    .line 547
    .end local v0           #e:Ljava/lang/Exception;
    :pswitch_99
    invoke-virtual {p0, v3}, Lcom/movial/ipphone/IPCallTracker;->setMute(Z)V

    .line 549
    :try_start_9c
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mIPService:Lcom/movial/ipphone/IIPService;

    invoke-interface {v1}, Lcom/movial/ipphone/IIPService;->accept()V
    :try_end_a1
    .catch Ljava/lang/Exception; {:try_start_9c .. :try_end_a1} :catch_a2

    goto :goto_43

    .line 550
    :catch_a2
    move-exception v0

    .line 551
    .restart local v0       #e:Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "acceptCall FAILED: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->loge(Ljava/lang/String;)V

    goto :goto_43

    .line 525
    :pswitch_data_be
    .packed-switch 0x1
        :pswitch_5d
        :pswitch_99
    .end packed-switch
.end method

.method canConference()Z
    .registers 3

    .prologue
    .line 736
    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->foregroundCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v0

    sget-object v1, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v0, v1, :cond_2a

    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->backgroundCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v0

    sget-object v1, Lcom/android/internal/telephony/Call$State;->HOLDING:Lcom/android/internal/telephony/Call$State;

    if-ne v0, v1, :cond_2a

    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->backgroundCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v0}, Lcom/movial/ipphone/IPCall;->isFull()Z

    move-result v0

    if-nez v0, :cond_2a

    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->foregroundCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v0}, Lcom/movial/ipphone/IPCall;->isFull()Z

    move-result v0

    if-nez v0, :cond_2a

    iget-boolean v0, p0, Lcom/movial/ipphone/IPCallTracker;->pendingConf:Z

    if-nez v0, :cond_2a

    const/4 v0, 0x1

    :goto_29
    return v0

    :cond_2a
    const/4 v0, 0x0

    goto :goto_29
.end method

.method public clearDisconnected()V
    .registers 4

    .prologue
    .line 770
    const-string v1, "clearDisconnected"

    invoke-virtual {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->log(Ljava/lang/String;)V

    .line 771
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->ringingCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v1}, Lcom/movial/ipphone/IPCall;->clearDisconnected()V

    .line 772
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->foregroundCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v1}, Lcom/movial/ipphone/IPCall;->clearDisconnected()V

    .line 773
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->backgroundCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v1}, Lcom/movial/ipphone/IPCall;->clearDisconnected()V

    .line 775
    invoke-direct {p0}, Lcom/movial/ipphone/IPCallTracker;->updatePhoneState()V

    .line 776
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v1}, Lcom/movial/ipphone/IPPhone;->notifyPreciseCallStateChanged()V

    .line 778
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_2c

    .line 779
    invoke-direct {p0}, Lcom/movial/ipphone/IPCallTracker;->clear()V

    .line 781
    :try_start_27
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mIPService:Lcom/movial/ipphone/IIPService;

    invoke-interface {v1}, Lcom/movial/ipphone/IIPService;->clearDisconnected()V
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_2c} :catch_2d

    .line 786
    :cond_2c
    :goto_2c
    return-void

    .line 782
    :catch_2d
    move-exception v0

    .line 783
    .local v0, e:Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "IPService clear Disconnection FAILED. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->loge(Ljava/lang/String;)V

    goto :goto_2c
.end method

.method conference()V
    .registers 4

    .prologue
    .line 744
    iget-boolean v1, p0, Lcom/movial/ipphone/IPCallTracker;->pendingConf:Z

    if-eqz v1, :cond_5

    .line 754
    :goto_4
    return-void

    .line 746
    :cond_5
    const-string v1, "IPCallTracker"

    const-string v2, "conference"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 747
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/movial/ipphone/IPCallTracker;->pendingConf:Z

    .line 748
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v1}, Lcom/movial/ipphone/IPPhone;->notifyPreciseCallStateChanged()V

    .line 750
    :try_start_14
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mIPService:Lcom/movial/ipphone/IIPService;

    invoke-interface {v1}, Lcom/movial/ipphone/IIPService;->conference()V
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_19} :catch_1a

    goto :goto_4

    .line 751
    :catch_1a
    move-exception v0

    .line 752
    .local v0, e:Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "conference FAILED: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->loge(Ljava/lang/String;)V

    goto :goto_4
.end method

.method dial(Ljava/lang/String;)Lcom/android/internal/telephony/Connection;
    .registers 6
    .parameter "dialString"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 400
    iget-object v2, p0, Lcom/movial/ipphone/IPCallTracker;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 401
    .local v1, sp:Landroid/content/SharedPreferences;
    const-string v2, "clir_key"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 402
    .local v0, clirMode:I
    invoke-virtual {p0, p1, v0}, Lcom/movial/ipphone/IPCallTracker;->dial(Ljava/lang/String;I)Lcom/android/internal/telephony/Connection;

    move-result-object v2

    return-object v2
.end method

.method dial(Ljava/lang/String;I)Lcom/android/internal/telephony/Connection;
    .registers 8
    .parameter "dialString"
    .parameter "clirMode"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 406
    invoke-virtual {p0}, Lcom/movial/ipphone/IPCallTracker;->clearDisconnected()V

    .line 409
    invoke-direct {p0}, Lcom/movial/ipphone/IPCallTracker;->canDial()Z

    move-result v3

    if-nez v3, :cond_12

    .line 410
    new-instance v2, Lcom/android/internal/telephony/CallStateException;

    const-string v3, "cannot dial in current state"

    invoke-direct {v2, v3}, Lcom/android/internal/telephony/CallStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 416
    :cond_12
    iget-object v3, p0, Lcom/movial/ipphone/IPCallTracker;->foregroundCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    sget-object v4, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v3, v4, :cond_46

    const/4 v1, 0x1

    .local v1, hasHold:Z
    :goto_1d
    if-eqz v1, :cond_25

    .line 417
    invoke-virtual {p0}, Lcom/movial/ipphone/IPCallTracker;->switchWaitingOrHoldingAndActive()V

    .line 418
    invoke-direct {p0}, Lcom/movial/ipphone/IPCallTracker;->fakeHoldForegroundBeforeDial()V

    .line 421
    :cond_25
    new-instance v0, Lcom/movial/ipphone/IPConnection;

    iget-object v3, p0, Lcom/movial/ipphone/IPCallTracker;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v3}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lcom/movial/ipphone/IPCallTracker;->foregroundCall:Lcom/movial/ipphone/IPCall;

    invoke-direct {v0, v3, p1, p0, v4}, Lcom/movial/ipphone/IPConnection;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/movial/ipphone/IPCallTracker;Lcom/movial/ipphone/IPCall;)V

    .line 422
    .local v0, conn:Lcom/movial/ipphone/IPConnection;
    invoke-direct {p0, v0}, Lcom/movial/ipphone/IPCallTracker;->addConnection(Lcom/movial/ipphone/IPConnection;)V

    .line 424
    invoke-virtual {p0, v2}, Lcom/movial/ipphone/IPCallTracker;->setMute(Z)V

    .line 426
    if-nez v1, :cond_48

    .line 427
    invoke-direct {p0, v0, p2}, Lcom/movial/ipphone/IPCallTracker;->dial(Lcom/movial/ipphone/IPConnection;I)V

    .line 433
    :goto_3d
    invoke-direct {p0}, Lcom/movial/ipphone/IPCallTracker;->updatePhoneState()V

    .line 434
    iget-object v2, p0, Lcom/movial/ipphone/IPCallTracker;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v2}, Lcom/movial/ipphone/IPPhone;->notifyPreciseCallStateChanged()V

    .line 436
    return-object v0

    .end local v0           #conn:Lcom/movial/ipphone/IPConnection;
    .end local v1           #hasHold:Z
    :cond_46
    move v1, v2

    .line 416
    goto :goto_1d

    .line 430
    .restart local v0       #conn:Lcom/movial/ipphone/IPConnection;
    .restart local v1       #hasHold:Z
    :cond_48
    iget-object v2, p0, Lcom/movial/ipphone/IPCallTracker;->pendingMOConn:Lcom/movial/ipphone/IPCallTracker$pendingConnection;

    iget-object v3, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3, p2}, Lcom/movial/ipphone/IPCallTracker$pendingConnection;->set(II)V

    goto :goto_3d
.end method

.method dialAfterHolding(Lcom/movial/ipphone/SessionCall;)V
    .registers 9
    .parameter "sessioncall"

    .prologue
    .line 466
    iget-object v4, p0, Lcom/movial/ipphone/IPCallTracker;->pendingMOConn:Lcom/movial/ipphone/IPCallTracker$pendingConnection;

    invoke-virtual {v4}, Lcom/movial/ipphone/IPCallTracker$pendingConnection;->isNull()Z

    move-result v4

    if-nez v4, :cond_e

    iget-object v4, p1, Lcom/movial/ipphone/SessionCall;->state:Lcom/movial/ipphone/SessionCall$State;

    sget-object v5, Lcom/movial/ipphone/SessionCall$State;->HOLDING:Lcom/movial/ipphone/SessionCall$State;

    if-eq v4, v5, :cond_f

    .line 495
    :cond_e
    :goto_e
    return-void

    .line 469
    :cond_f
    const/4 v1, 0x0

    .line 472
    .local v1, conn:Lcom/movial/ipphone/IPConnection;
    const/4 v3, 0x0

    .line 473
    .local v3, i:I
    :goto_11
    :try_start_11
    iget-object v4, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_41

    .line 474
    iget-object v4, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/movial/ipphone/IPConnection;

    iget v4, v4, Lcom/movial/ipphone/IPConnection;->index:I

    iget v5, p1, Lcom/android/internal/telephony/DriverCall;->index:I

    if-ne v4, v5, :cond_82

    .line 475
    const-string v4, "IPCallTracker"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "matched index: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p1, Lcom/android/internal/telephony/DriverCall;->index:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 479
    :cond_41
    iget-boolean v4, p1, Lcom/movial/ipphone/SessionCall;->inConf:Z

    if-nez v4, :cond_5f

    iget-object v4, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-ge v3, v4, :cond_5f

    .line 480
    iget-object v4, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Lcom/movial/ipphone/IPConnection;

    move-object v1, v0

    .line 481
    invoke-virtual {v1}, Lcom/movial/ipphone/IPConnection;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    sget-object v5, Lcom/android/internal/telephony/Call$State;->HOLDING:Lcom/android/internal/telephony/Call$State;
    :try_end_5d
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_5d} :catch_85

    if-ne v4, v5, :cond_e

    .line 488
    :cond_5f
    invoke-virtual {p0}, Lcom/movial/ipphone/IPCallTracker;->clearDisconnected()V

    .line 490
    iget-object v4, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    .end local v1           #conn:Lcom/movial/ipphone/IPConnection;
    check-cast v1, Lcom/movial/ipphone/IPConnection;

    .line 491
    .restart local v1       #conn:Lcom/movial/ipphone/IPConnection;
    invoke-virtual {v1}, Lcom/android/internal/telephony/Connection;->toString()Ljava/lang/String;

    .line 493
    iget-object v4, p0, Lcom/movial/ipphone/IPCallTracker;->pendingMOConn:Lcom/movial/ipphone/IPCallTracker$pendingConnection;

    iget v4, v4, Lcom/movial/ipphone/IPCallTracker$pendingConnection;->clirMode:I

    invoke-direct {p0, v1, v4}, Lcom/movial/ipphone/IPCallTracker;->dial(Lcom/movial/ipphone/IPConnection;I)V

    .line 494
    iget-object v4, p0, Lcom/movial/ipphone/IPCallTracker;->pendingMOConn:Lcom/movial/ipphone/IPCallTracker$pendingConnection;

    invoke-virtual {v4}, Lcom/movial/ipphone/IPCallTracker$pendingConnection;->clear()V

    goto :goto_e

    .line 473
    :cond_82
    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    .line 484
    :catch_85
    move-exception v2

    .line 485
    .local v2, e:Ljava/lang/Exception;
    goto :goto_e
.end method

.method public dispose()V
    .registers 1

    .prologue
    .line 169
    return-void
.end method

.method getMute()Z
    .registers 2

    .prologue
    .line 766
    iget-boolean v0, p0, Lcom/movial/ipphone/IPCallTracker;->desiredMute:Z

    return v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .registers 2
    .parameter "msg"

    .prologue
    .line 201
    return-void
.end method

.method protected handlePollCalls(Landroid/os/AsyncResult;)V
    .registers 2
    .parameter "ar"

    .prologue
    .line 197
    return-void
.end method

.method hangup(Lcom/movial/ipphone/IPCall;)V
    .registers 5
    .parameter "call"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 568
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "hangup call "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/movial/ipphone/IPCallTracker;->log(Ljava/lang/String;)V

    .line 569
    invoke-virtual {p1}, Lcom/movial/ipphone/IPCall;->getConnections()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_28

    .line 570
    new-instance v0, Lcom/android/internal/telephony/CallStateException;

    const-string v1, "no connections in call"

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/CallStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 572
    :cond_28
    iget-boolean v0, p0, Lcom/movial/ipphone/IPCallTracker;->pendingConf:Z

    if-eqz v0, :cond_34

    .line 573
    new-instance v0, Lcom/android/internal/telephony/CallStateException;

    const-string v1, "cannot hangup: conference call is establishing"

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/CallStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 575
    :cond_34
    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->ringingCall:Lcom/movial/ipphone/IPCall;

    if-ne p1, v0, :cond_49

    .line 576
    const-string v0, "(ringing) hangup ringing or waiting call"

    invoke-virtual {p0, v0}, Lcom/movial/ipphone/IPCallTracker;->log(Ljava/lang/String;)V

    .line 577
    invoke-virtual {p0, p1}, Lcom/movial/ipphone/IPCallTracker;->reject(Lcom/movial/ipphone/IPCall;)V

    .line 596
    :goto_40
    invoke-virtual {p1}, Lcom/movial/ipphone/IPCall;->onHangupLocal()V

    .line 597
    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v0}, Lcom/movial/ipphone/IPPhone;->notifyPreciseCallStateChanged()V

    .line 598
    return-void

    .line 578
    :cond_49
    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->foregroundCall:Lcom/movial/ipphone/IPCall;

    if-ne p1, v0, :cond_6d

    .line 579
    invoke-virtual {p1}, Lcom/android/internal/telephony/Call;->isDialingOrAlerting()Z

    move-result v0

    if-eqz v0, :cond_69

    .line 580
    const-string v0, "(foregnd) hangup dialing or alerting..."

    invoke-virtual {p0, v0}, Lcom/movial/ipphone/IPCallTracker;->log(Ljava/lang/String;)V

    .line 581
    invoke-virtual {p1}, Lcom/movial/ipphone/IPCall;->getConnections()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/movial/ipphone/IPConnection;

    check-cast v0, Lcom/movial/ipphone/IPConnection;

    invoke-virtual {p0, v0}, Lcom/movial/ipphone/IPCallTracker;->hangup(Lcom/movial/ipphone/IPConnection;)V

    goto :goto_40

    .line 583
    :cond_69
    invoke-virtual {p0}, Lcom/movial/ipphone/IPCallTracker;->hangupForegroundResumeBackground()V

    goto :goto_40

    .line 585
    :cond_6d
    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->backgroundCall:Lcom/movial/ipphone/IPCall;

    if-ne p1, v0, :cond_8d

    .line 586
    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->ringingCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call;->isRinging()Z

    move-result v0

    if-eqz v0, :cond_84

    .line 587
    const-string v0, "(backgnd) hangup all rining call"

    invoke-virtual {p0, v0}, Lcom/movial/ipphone/IPCallTracker;->log(Ljava/lang/String;)V

    .line 588
    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->ringingCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {p0, v0}, Lcom/movial/ipphone/IPCallTracker;->reject(Lcom/movial/ipphone/IPCall;)V

    goto :goto_40

    .line 590
    :cond_84
    const-string v0, "(backgnd) hangup all conns in background call"

    invoke-virtual {p0, v0}, Lcom/movial/ipphone/IPCallTracker;->log(Ljava/lang/String;)V

    .line 591
    invoke-virtual {p0, p1}, Lcom/movial/ipphone/IPCallTracker;->hangupAll(Lcom/movial/ipphone/IPCall;)V

    goto :goto_40

    .line 594
    :cond_8d
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "IPCall "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "does not belong to IPCallTracker "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method hangup(Lcom/movial/ipphone/IPConnection;)V
    .registers 6
    .parameter "conn"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 655
    iget-object v1, p1, Lcom/movial/ipphone/IPConnection;->owner:Lcom/movial/ipphone/IPCallTracker;

    if-eq v1, p0, :cond_27

    .line 656
    new-instance v1, Lcom/android/internal/telephony/CallStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "IPConnection "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "does not belong to IPCallTracker "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/internal/telephony/CallStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 658
    :cond_27
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->pendingMOConn:Lcom/movial/ipphone/IPCallTracker$pendingConnection;

    invoke-virtual {v1}, Lcom/movial/ipphone/IPCallTracker$pendingConnection;->isNull()Z

    move-result v1

    if-nez v1, :cond_58

    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-ne p1, v1, :cond_58

    .line 659
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->connections:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    sget-object v2, Lcom/android/internal/telephony/Connection$DisconnectCause;->ERROR_UNSPECIFIED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    invoke-direct {p0, v1, v2}, Lcom/movial/ipphone/IPCallTracker;->removeConnection(ILcom/android/internal/telephony/Connection$DisconnectCause;)Z

    .line 660
    invoke-direct {p0}, Lcom/movial/ipphone/IPCallTracker;->updatePhoneState()V

    .line 661
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->pendingMOConn:Lcom/movial/ipphone/IPCallTracker$pendingConnection;

    invoke-virtual {v1}, Lcom/movial/ipphone/IPCallTracker$pendingConnection;->clear()V

    .line 673
    :goto_54
    invoke-virtual {p1}, Lcom/movial/ipphone/IPConnection;->onHangupLocal()V

    .line 674
    return-void

    .line 664
    :cond_58
    :try_start_58
    invoke-virtual {p1}, Lcom/movial/ipphone/IPConnection;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call$State;->isRinging()Z

    move-result v1

    if-eqz v1, :cond_99

    .line 665
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mIPService:Lcom/movial/ipphone/IIPService;

    invoke-virtual {p1}, Lcom/movial/ipphone/IPConnection;->getIndex()I

    move-result v2

    invoke-interface {v1, v2}, Lcom/movial/ipphone/IIPService;->reject(I)V
    :try_end_6b
    .catch Ljava/lang/Exception; {:try_start_58 .. :try_end_6b} :catch_6c

    goto :goto_54

    .line 668
    :catch_6c
    move-exception v0

    .line 669
    .local v0, e:Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "hangup connection: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/movial/ipphone/IPConnection;->getIndex()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " FAILED. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->loge(Ljava/lang/String;)V

    .line 670
    invoke-direct {p0}, Lcom/movial/ipphone/IPCallTracker;->clearConnections()V

    goto :goto_54

    .line 667
    .end local v0           #e:Ljava/lang/Exception;
    :cond_99
    :try_start_99
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mIPService:Lcom/movial/ipphone/IIPService;

    invoke-virtual {p1}, Lcom/movial/ipphone/IPConnection;->getIndex()I

    move-result v2

    invoke-interface {v1, v2}, Lcom/movial/ipphone/IIPService;->hangup(I)V
    :try_end_a2
    .catch Ljava/lang/Exception; {:try_start_99 .. :try_end_a2} :catch_6c

    goto :goto_54
.end method

.method hangupAll(Lcom/movial/ipphone/IPCall;)V
    .registers 6
    .parameter "call"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 677
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    iget-object v2, p1, Lcom/movial/ipphone/IPCall;->connections:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_33

    .line 679
    :try_start_9
    iget-object v2, p1, Lcom/movial/ipphone/IPCall;->connections:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/movial/ipphone/IPConnection;

    invoke-virtual {p0, v2}, Lcom/movial/ipphone/IPCallTracker;->hangup(Lcom/movial/ipphone/IPConnection;)V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_14} :catch_17

    .line 677
    :goto_14
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 680
    :catch_17
    move-exception v0

    .line 681
    .local v0, e:Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "hangupAll FAILED. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/movial/ipphone/IPCallTracker;->loge(Ljava/lang/String;)V

    goto :goto_14

    .line 683
    .end local v0           #e:Ljava/lang/Exception;
    :cond_33
    return-void
.end method

.method hangupForegroundResumeBackground()V
    .registers 4

    .prologue
    .line 687
    :try_start_0
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mIPService:Lcom/movial/ipphone/IIPService;

    invoke-interface {v1}, Lcom/movial/ipphone/IIPService;->hangupForegroundResumeBackground()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_6

    .line 692
    :goto_5
    return-void

    .line 688
    :catch_6
    move-exception v0

    .line 689
    .local v0, e:Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "hangupForegroundResumeBackground FAILED. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->loge(Ljava/lang/String;)V

    .line 690
    invoke-direct {p0}, Lcom/movial/ipphone/IPCallTracker;->clearConnections()V

    goto :goto_5
.end method

.method protected log(Ljava/lang/String;)V
    .registers 3
    .parameter "content"

    .prologue
    .line 899
    iget-object v0, p0, Lcom/movial/ipphone/IPCallTracker;->phone:Lcom/movial/ipphone/IPPhone;

    .line 900
    const-string v0, "IPCallTracker"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 901
    return-void
.end method

.method public registerForVoiceCallEnded(Landroid/os/Handler;ILjava/lang/Object;)V
    .registers 4
    .parameter "h"
    .parameter "what"
    .parameter "obj"

    .prologue
    .line 941
    return-void
.end method

.method public registerForVoiceCallStarted(Landroid/os/Handler;ILjava/lang/Object;)V
    .registers 4
    .parameter "h"
    .parameter "what"
    .parameter "obj"

    .prologue
    .line 933
    return-void
.end method

.method public registerHandler()V
    .registers 4

    .prologue
    .line 204
    const-string v1, "registerHandler"

    invoke-virtual {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->log(Ljava/lang/String;)V

    .line 206
    :try_start_5
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v1}, Lcom/movial/ipphone/IPPhone;->getService()Lcom/movial/ipphone/IIPService;

    move-result-object v1

    iput-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mIPService:Lcom/movial/ipphone/IIPService;

    .line 207
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mIPService:Lcom/movial/ipphone/IIPService;

    iget-object v2, p0, Lcom/movial/ipphone/IPCallTracker;->mMsnger:Landroid/os/Messenger;

    invoke-interface {v1, v2}, Lcom/movial/ipphone/IIPService;->registerForCallStates(Landroid/os/Messenger;)V

    .line 208
    invoke-direct {p0}, Lcom/movial/ipphone/IPCallTracker;->clear()V
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_17} :catch_18

    .line 212
    :goto_17
    return-void

    .line 209
    :catch_18
    move-exception v0

    .line 210
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->loge(Ljava/lang/String;)V

    goto :goto_17
.end method

.method reject(Lcom/movial/ipphone/IPCall;)V
    .registers 7
    .parameter "call"

    .prologue
    .line 695
    iget-object v3, p0, Lcom/movial/ipphone/IPCallTracker;->ringingCall:Lcom/movial/ipphone/IPCall;

    if-eq p1, v3, :cond_9

    .line 696
    const-string v3, "no ringing or waiting call to reject"

    invoke-direct {p0, v3}, Lcom/movial/ipphone/IPCallTracker;->loge(Ljava/lang/String;)V

    .line 698
    :cond_9
    const/4 v2, 0x0

    .local v2, i:I
    :goto_a
    iget-object v3, p1, Lcom/movial/ipphone/IPCall;->connections:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v2, v3, :cond_42

    .line 699
    iget-object v3, p1, Lcom/movial/ipphone/IPCall;->connections:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/movial/ipphone/IPConnection;

    .line 701
    .local v0, conn:Lcom/movial/ipphone/IPConnection;
    :try_start_1a
    iget-object v3, p0, Lcom/movial/ipphone/IPCallTracker;->mIPService:Lcom/movial/ipphone/IIPService;

    invoke-virtual {v0}, Lcom/movial/ipphone/IPConnection;->getIndex()I

    move-result v4

    invoke-interface {v3, v4}, Lcom/movial/ipphone/IIPService;->reject(I)V
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_23} :catch_26

    .line 698
    :goto_23
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    .line 702
    :catch_26
    move-exception v1

    .line 703
    .local v1, e:Ljava/lang/Exception;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "reject ringing or waiting call FAILED. "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/movial/ipphone/IPCallTracker;->loge(Ljava/lang/String;)V

    goto :goto_23

    .line 706
    .end local v0           #conn:Lcom/movial/ipphone/IPConnection;
    .end local v1           #e:Ljava/lang/Exception;
    :cond_42
    return-void
.end method

.method rejectCall()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 559
    const-string v1, "reject call"

    invoke-virtual {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->log(Ljava/lang/String;)V

    .line 561
    :try_start_5
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mIPService:Lcom/movial/ipphone/IIPService;

    const/4 v2, -0x1

    invoke-interface {v1, v2}, Lcom/movial/ipphone/IIPService;->reject(I)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_b} :catch_c

    .line 565
    :goto_b
    return-void

    .line 562
    :catch_c
    move-exception v0

    .line 563
    .local v0, e:Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "reject call FAILED. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->loge(Ljava/lang/String;)V

    goto :goto_b
.end method

.method sendDtmf(C)V
    .registers 5
    .parameter "c"

    .prologue
    .line 601
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->state:Lcom/android/internal/telephony/PhoneConstants$State;

    sget-object v2, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v1, v2, :cond_3f

    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->foregroundCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v1

    sget-object v2, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v1, v2, :cond_3f

    .line 602
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->foregroundCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v1

    check-cast v1, Lcom/movial/ipphone/IPConnection;

    invoke-virtual {v1}, Lcom/movial/ipphone/IPConnection;->getIndex()I

    move-result v0

    .line 603
    .local v0, index:I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sendDtmf. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->log(Ljava/lang/String;)V

    .line 604
    invoke-virtual {p0, v0, p1}, Lcom/movial/ipphone/IPCallTracker;->sendDtmf(IC)V

    .line 606
    .end local v0           #index:I
    :cond_3f
    return-void
.end method

.method sendDtmf(IC)V
    .registers 6
    .parameter "index"
    .parameter "c"

    .prologue
    .line 625
    const/4 v1, -0x1

    if-ne p1, v1, :cond_4

    .line 632
    :goto_3
    return-void

    .line 628
    :cond_4
    :try_start_4
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mIPService:Lcom/movial/ipphone/IIPService;

    invoke-interface {v1, p1, p2}, Lcom/movial/ipphone/IIPService;->sendDtmf(IC)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_9} :catch_a

    goto :goto_3

    .line 629
    :catch_a
    move-exception v0

    .line 630
    .local v0, e:Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sendDtmf FAILED. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->loge(Ljava/lang/String;)V

    goto :goto_3
.end method

.method setMute(Z)V
    .registers 4
    .parameter "mute"

    .prologue
    .line 757
    iput-boolean p1, p0, Lcom/movial/ipphone/IPCallTracker;->desiredMute:Z

    .line 759
    :try_start_2
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mIPService:Lcom/movial/ipphone/IIPService;

    invoke-interface {v1, p1}, Lcom/movial/ipphone/IIPService;->setMute(Z)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_7} :catch_8

    .line 763
    :goto_7
    return-void

    .line 760
    :catch_8
    move-exception v0

    .line 761
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->loge(Ljava/lang/String;)V

    goto :goto_7
.end method

.method startDtmf(C)V
    .registers 5
    .parameter "c"

    .prologue
    .line 609
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->state:Lcom/android/internal/telephony/PhoneConstants$State;

    sget-object v2, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v1, v2, :cond_3f

    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->foregroundCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v1

    sget-object v2, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v1, v2, :cond_3f

    .line 610
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->foregroundCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v1

    check-cast v1, Lcom/movial/ipphone/IPConnection;

    invoke-virtual {v1}, Lcom/movial/ipphone/IPConnection;->getIndex()I

    move-result v0

    .line 611
    .local v0, index:I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startDtmf. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->log(Ljava/lang/String;)V

    .line 612
    invoke-virtual {p0, v0, p1}, Lcom/movial/ipphone/IPCallTracker;->startDtmf(IC)V

    .line 614
    .end local v0           #index:I
    :cond_3f
    return-void
.end method

.method startDtmf(IC)V
    .registers 6
    .parameter "index"
    .parameter "c"

    .prologue
    .line 635
    const/4 v1, -0x1

    if-ne p1, v1, :cond_4

    .line 642
    :goto_3
    return-void

    .line 638
    :cond_4
    :try_start_4
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mIPService:Lcom/movial/ipphone/IIPService;

    invoke-interface {v1, p1, p2}, Lcom/movial/ipphone/IIPService;->startDtmf(IC)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_9} :catch_a

    goto :goto_3

    .line 639
    :catch_a
    move-exception v0

    .line 640
    .local v0, e:Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "stratDtmf FAILED. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->loge(Ljava/lang/String;)V

    goto :goto_3
.end method

.method stopDtmf()V
    .registers 4

    .prologue
    .line 617
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->state:Lcom/android/internal/telephony/PhoneConstants$State;

    sget-object v2, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v1, v2, :cond_35

    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->foregroundCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v1

    sget-object v2, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-ne v1, v2, :cond_35

    .line 618
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->foregroundCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getLatestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v1

    check-cast v1, Lcom/movial/ipphone/IPConnection;

    invoke-virtual {v1}, Lcom/movial/ipphone/IPConnection;->getIndex()I

    move-result v0

    .line 619
    .local v0, index:I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "stopDtmf. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->log(Ljava/lang/String;)V

    .line 620
    invoke-virtual {p0, v0}, Lcom/movial/ipphone/IPCallTracker;->stopDtmf(I)V

    .line 622
    .end local v0           #index:I
    :cond_35
    return-void
.end method

.method stopDtmf(I)V
    .registers 5
    .parameter "index"

    .prologue
    .line 645
    const/4 v1, -0x1

    if-ne p1, v1, :cond_4

    .line 652
    :goto_3
    return-void

    .line 648
    :cond_4
    :try_start_4
    iget-object v1, p0, Lcom/movial/ipphone/IPCallTracker;->mIPService:Lcom/movial/ipphone/IIPService;

    invoke-interface {v1, p1}, Lcom/movial/ipphone/IIPService;->stopDtmf(I)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_9} :catch_a

    goto :goto_3

    .line 649
    :catch_a
    move-exception v0

    .line 650
    .local v0, e:Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "stopDtmf FAILED. "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/movial/ipphone/IPCallTracker;->loge(Ljava/lang/String;)V

    goto :goto_3
.end method

.method switchWaitingOrHoldingAndActive(Z)I
    .registers 7
    .parameter "accept"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    const/4 v2, -0x1

    .line 713
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "switchWaitingOrHoldingAndActive: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", mSwapCall: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/movial/ipphone/IPCallTracker;->mSwapCall:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/movial/ipphone/IPCallTracker;->log(Ljava/lang/String;)V

    .line 714
    iget-object v3, p0, Lcom/movial/ipphone/IPCallTracker;->ringingCall:Lcom/movial/ipphone/IPCall;

    invoke-virtual {v3}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    sget-object v4, Lcom/android/internal/telephony/Call$State;->INCOMING:Lcom/android/internal/telephony/Call$State;

    if-ne v3, v4, :cond_35

    .line 715
    new-instance v2, Lcom/android/internal/telephony/CallStateException;

    const-string v3, "cannot be in the incoming state"

    invoke-direct {v2, v3}, Lcom/android/internal/telephony/CallStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 716
    :cond_35
    iget-boolean v3, p0, Lcom/movial/ipphone/IPCallTracker;->pendingConf:Z

    if-eqz v3, :cond_41

    .line 717
    new-instance v2, Lcom/android/internal/telephony/CallStateException;

    const-string v3, "conference call is establishing"

    invoke-direct {v2, v3}, Lcom/android/internal/telephony/CallStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 720
    :cond_41
    :try_start_41
    iget v3, p0, Lcom/movial/ipphone/IPCallTracker;->mSwapCall:I

    if-eq v2, v3, :cond_47

    move v1, v2

    .line 732
    :goto_46
    return v1

    .line 724
    :cond_47
    iget-object v3, p0, Lcom/movial/ipphone/IPCallTracker;->mIPService:Lcom/movial/ipphone/IIPService;

    invoke-interface {v3, p1}, Lcom/movial/ipphone/IIPService;->hold(Z)I

    move-result v1

    .line 725
    .local v1, result:I
    if-eqz p1, :cond_70

    move v3, v2

    :goto_50
    iput v3, p0, Lcom/movial/ipphone/IPCallTracker;->mSwapCall:I
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_52} :catch_53

    goto :goto_46

    .line 728
    .end local v1           #result:I
    :catch_53
    move-exception v0

    .line 729
    .local v0, e:Ljava/lang/Exception;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "HoldCall FAILED. "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/movial/ipphone/IPCallTracker;->loge(Ljava/lang/String;)V

    move v1, v2

    .line 732
    goto :goto_46

    .end local v0           #e:Ljava/lang/Exception;
    .restart local v1       #result:I
    :cond_70
    move v3, v1

    .line 725
    goto :goto_50
.end method

.method switchWaitingOrHoldingAndActive()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 709
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/movial/ipphone/IPCallTracker;->switchWaitingOrHoldingAndActive(Z)I

    .line 710
    return-void
.end method

.method public unregisterForVoiceCallEnded(Landroid/os/Handler;)V
    .registers 2
    .parameter "h"

    .prologue
    .line 945
    return-void
.end method

.method public unregisterForVoiceCallStarted(Landroid/os/Handler;)V
    .registers 2
    .parameter "h"

    .prologue
    .line 937
    return-void
.end method
