.class public Lcom/android/internal/telephony/ims/ImsPhone;
.super Lcom/android/internal/telephony/PhoneBase;
.source "ImsPhone.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/ims/ImsPhone$FormatChangeObserver;
    }
.end annotation


# static fields
.field public static final CANCEL_ECM_TIMER:I = 0x1

.field private static final DEBUG:Z = true

.field protected static final EVENT_IMS_STATE_CHANGED:I = 0x24

.field protected static final EVENT_SMS_FORMAT:I = 0x1

.field protected static final EVENT_WFC_SS_COMPLETE:I = 0x26

.field private static final IMS_PS_DOMAIN:Ljava/lang/String; = "persist.radio.domain.ps"

.field private static final LOG_TAG:Ljava/lang/String; = "IMSPhone"

.field static final MAX_CONNECTIONS:I = 0x7

.field static final MAX_CONNECTIONS_PER_CALL:I = 0x5

.field private static final PROPERTY_IMS_REGISTERED:Ljava/lang/String; = "persist.radio.ims.reg"

.field public static final RESTART_ECM_TIMER:I = 0x0

.field private static final RIL_IMS_STATUS_LIMITED_MODE_REG:I = 0x2

.field private static final RIL_IMS_STATUS_NOT_REGISTERED:I = 0x0

.field private static final RIL_IMS_STATUS_NOT_REGISTERED_E911:I = 0x3

.field private static final RIL_IMS_STATUS_REGISTERED:I = 0x1

.field private static final RIL_IMS_STATUS_REGISTERED_E911:I = 0x4

.field private static final RIL_SMS_OVER_IP_FORMAT_3GPP:I = 0x1

.field private static final RIL_SMS_OVER_IP_FORMAT_3GPP2:I = 0x2

.field private static final RIL_SMS_OVER_IP_FORMAT_UNKNOWN:I

.field public static final mFormatUri:Landroid/net/Uri;


# instance fields
.field private mFeature:I

.field protected mFormatObserver:Lcom/android/internal/telephony/ims/ImsPhone$FormatChangeObserver;

.field private mIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mNetworkType:I

.field public mPostDialHandler:Landroid/os/Registrant;

.field private mRegState:I

.field protected mResolver:Landroid/content/ContentResolver;

.field private mServiceState:Landroid/telephony/ServiceState;

.field private mSmsFormat:Ljava/lang/String;

.field private sPhoneNotifier:Lcom/android/internal/telephony/PhoneNotifier;

.field private state:Lcom/android/internal/telephony/PhoneConstants$State;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 129
    const-string v0, "content://com.example.HiddenMenuContentProvider/IMSSETTINGSData"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/internal/telephony/ims/ImsPhone;->mFormatUri:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;Lcom/android/internal/telephony/PhoneNotifier;)V
    .registers 9
    .parameter "context"
    .parameter "cm"
    .parameter "notifier"

    .prologue
    .line 150
    const-string v1, "IMS"

    invoke-direct {p0, v1, p1}, Lcom/android/internal/telephony/PhoneBase;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    .line 114
    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    iput-object v1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->state:Lcom/android/internal/telephony/PhoneConstants$State;

    .line 116
    const/4 v1, -0x1

    iput v1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mNetworkType:I

    .line 118
    const/4 v1, 0x0

    iput v1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mRegState:I

    .line 126
    const-string v1, "unknown"

    iput-object v1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mSmsFormat:Ljava/lang/String;

    .line 183
    new-instance v1, Lcom/android/internal/telephony/ims/ImsPhone$1;

    invoke-direct {v1, p0}, Lcom/android/internal/telephony/ims/ImsPhone$1;-><init>(Lcom/android/internal/telephony/ims/ImsPhone;)V

    iput-object v1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 152
    iput-object p3, p0, Lcom/android/internal/telephony/PhoneBase;->mNotifier:Lcom/android/internal/telephony/PhoneNotifier;

    .line 153
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/telephony/PhoneBase;->mLooper:Landroid/os/Looper;

    .line 154
    iput-object p2, p0, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    .line 156
    new-instance v1, Landroid/telephony/ServiceState;

    invoke-direct {v1}, Landroid/telephony/ServiceState;-><init>()V

    iput-object v1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mServiceState:Landroid/telephony/ServiceState;

    .line 157
    iget-object v1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mServiceState:Landroid/telephony/ServiceState;

    invoke-virtual {v1}, Landroid/telephony/ServiceState;->setStateOutOfService()V

    .line 159
    new-instance v1, Lcom/android/internal/telephony/ims/ImsPhone$FormatChangeObserver;

    invoke-direct {v1, p0, p0}, Lcom/android/internal/telephony/ims/ImsPhone$FormatChangeObserver;-><init>(Lcom/android/internal/telephony/ims/ImsPhone;Landroid/os/Handler;)V

    iput-object v1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mFormatObserver:Lcom/android/internal/telephony/ims/ImsPhone$FormatChangeObserver;

    .line 160
    iget-object v1, p0, Lcom/android/internal/telephony/PhoneBase;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/android/internal/telephony/ims/ImsPhone;->mFormatUri:Landroid/net/Uri;

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mFormatObserver:Lcom/android/internal/telephony/ims/ImsPhone$FormatChangeObserver;

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 163
    iget-object v1, p0, Lcom/android/internal/telephony/PhoneBase;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mResolver:Landroid/content/ContentResolver;

    .line 164
    const/16 v1, 0x24

    const/4 v2, 0x0

    invoke-interface {p2, p0, v1, v2}, Lcom/android/internal/telephony/CommandsInterface;->registerForImsRegistrationStateChanged(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 171
    const-string v1, "KOR"

    const-string v2, "HKTW"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6e

    .line 172
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 173
    .local v0, filter:Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 174
    iget-object v1, p0, Lcom/android/internal/telephony/PhoneBase;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 177
    .end local v0           #filter:Landroid/content/IntentFilter;
    :cond_6e
    return-void
.end method

.method static synthetic access$000(Lcom/android/internal/telephony/ims/ImsPhone;)I
    .registers 2
    .parameter "x0"

    .prologue
    .line 94
    iget v0, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mRegState:I

    return v0
.end method

.method static synthetic access$100(Lcom/android/internal/telephony/ims/ImsPhone;)Landroid/telephony/ServiceState;
    .registers 2
    .parameter "x0"

    .prologue
    .line 94
    iget-object v0, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mServiceState:Landroid/telephony/ServiceState;

    return-object v0
.end method

.method private static getPhone()Lcom/android/internal/telephony/Phone;
    .registers 2

    .prologue
    .line 142
    invoke-static {}, Lcom/android/internal/telephony/CallManager;->getInstance()Lcom/android/internal/telephony/CallManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/CallManager;->getDefaultPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    .line 143
    .local v0, phone:Lcom/android/internal/telephony/Phone;
    instance-of v1, v0, Lcom/android/internal/telephony/PhoneProxy;

    if-eqz v1, :cond_14

    .line 144
    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    .line 146
    .end local v0           #phone:Lcom/android/internal/telephony/Phone;
    :cond_14
    return-object v0
.end method

.method private isAirplaneModeOn()Z
    .registers 5

    .prologue
    .line 1178
    const/4 v0, 0x0

    .line 1180
    .local v0, isAirplaneMode:Z
    iget-object v1, p0, Lcom/android/internal/telephony/PhoneBase;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string v2, "airplane_mode_on"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-eqz v1, :cond_11

    .line 1181
    const/4 v0, 0x1

    .line 1184
    :cond_11
    return v0
.end method

.method private isPSDomain()Z
    .registers 3

    .prologue
    .line 657
    const-string v0, "persist.radio.domain.ps"

    const/4 v1, 0x1

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method

.method private logUnexpectedMethodCall(Ljava/lang/String;)V
    .registers 5
    .parameter "name"

    .prologue
    .line 1169
    const-string v0, "IMSPhone"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error! "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "() is not supported by "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhoneName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1171
    return-void
.end method

.method private setSmsFormat(I)V
    .registers 7
    .parameter "smsFormat"

    .prologue
    const/4 v4, 0x1

    .line 199
    const-string v1, "IMSPhone"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setSmsFormat: mRegState "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mRegState:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " smsFormat "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mSmsFormat:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 203
    .local v0, oldSmsFormat:Ljava/lang/String;
    iget v1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mRegState:I

    if-eqz v1, :cond_35

    iget v1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mRegState:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_55

    .line 205
    :cond_35
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v1

    instance-of v1, v1, Lcom/android/internal/telephony/cdma/CDMALTEPhone;

    if-eqz v1, :cond_48

    .line 206
    const-string v1, "3gpp2"

    iput-object v1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mSmsFormat:Ljava/lang/String;

    .line 215
    :cond_41
    :goto_41
    if-ne p1, v4, :cond_60

    .line 216
    const-string v1, "3gpp"

    iput-object v1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mSmsFormat:Ljava/lang/String;

    .line 224
    :cond_47
    :goto_47
    return-void

    .line 207
    :cond_48
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v1

    instance-of v1, v1, Lcom/android/internal/telephony/gsm/GSMPhone;

    if-eqz v1, :cond_41

    .line 208
    const-string v1, "3gpp"

    iput-object v1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mSmsFormat:Ljava/lang/String;

    goto :goto_41

    .line 210
    :cond_55
    iget v1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mRegState:I

    if-ne v1, v4, :cond_41

    .line 211
    invoke-virtual {p0}, Lcom/android/internal/telephony/ims/ImsPhone;->getSmsOverImsFormat()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mSmsFormat:Ljava/lang/String;

    goto :goto_41

    .line 217
    :cond_60
    const/4 v1, 0x2

    if-ne p1, v1, :cond_47

    .line 218
    const-string v1, "3gpp2"

    iput-object v1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mSmsFormat:Ljava/lang/String;

    goto :goto_47
.end method


# virtual methods
.method public SimSlotOnOff(I)V
    .registers 3
    .parameter "on"

    .prologue
    .line 1288
    const-string v0, "SimSlotOnOff"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1289
    return-void
.end method

.method public acceptCall()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 342
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->acceptCall()V

    .line 343
    return-void
.end method

.method public acceptCall(I)V
    .registers 3
    .parameter "callType"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 338
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/internal/telephony/Phone;->acceptCall(I)V

    .line 339
    return-void
.end method

.method public acceptConnectionTypeChange(Lcom/android/internal/telephony/Connection;Ljava/util/Map;)V
    .registers 5
    .parameter "conn"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/internal/telephony/Connection;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 613
    .local p2, newExtras:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p1, :cond_2a

    .line 614
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_13

    .line 615
    check-cast p1, Lcom/android/internal/telephony/gsm/GsmConnection;

    .end local p1
    invoke-virtual {p1, p2}, Lcom/android/internal/telephony/Connection;->acceptConnectionTypeChange(Ljava/util/Map;)V

    .line 624
    :goto_12
    return-void

    .line 616
    .restart local p1
    :cond_13
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_24

    .line 617
    check-cast p1, Lcom/android/internal/telephony/cdma/CdmaConnection;

    .end local p1
    invoke-virtual {p1, p2}, Lcom/android/internal/telephony/Connection;->acceptConnectionTypeChange(Ljava/util/Map;)V

    goto :goto_12

    .line 619
    .restart local p1
    :cond_24
    const-string v0, "acceptConnectionTypeChange"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    goto :goto_12

    .line 622
    :cond_2a
    const-string v0, "IMSPhone"

    const-string v1, "connection is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_12
.end method

.method public activateCellBroadcastSms(ILandroid/os/Message;)V
    .registers 4
    .parameter "activate"
    .parameter "response"

    .prologue
    .line 1111
    const-string v0, "activateCellBroadcastSms"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1112
    return-void
.end method

.method public akaAuthenticate([B[BLandroid/os/Message;)V
    .registers 4
    .parameter "rand"
    .parameter "autn"
    .parameter "onComplete"

    .prologue
    .line 1264
    if-eqz p3, :cond_5

    invoke-virtual {p3}, Landroid/os/Message;->sendToTarget()V

    .line 1265
    :cond_5
    return-void
.end method

.method public canConference()Z
    .registers 2

    .prologue
    .line 460
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->canConference()Z

    move-result v0

    return v0
.end method

.method public canDial()Z
    .registers 6

    .prologue
    const/4 v1, 0x0

    .line 354
    const-string v2, "ro.telephony.disable-call"

    const-string v3, "false"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 356
    .local v0, disableCall:Ljava/lang/String;
    const-string v2, "IMSPhone"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "canDial(): disableCall = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 357
    const-string v2, "true"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2a

    .line 365
    :cond_29
    :goto_29
    return v1

    .line 360
    :cond_2a
    const-string v2, "IMSPhone"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "canDial(): ringingCall: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/internal/telephony/ims/ImsPhone;->getRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 361
    const-string v2, "IMSPhone"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "canDial(): foregndCall: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/internal/telephony/ims/ImsPhone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 363
    const-string v2, "IMSPhone"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "canDial(): backgndCall: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Lcom/android/internal/telephony/ims/ImsPhone;->getBackgroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 365
    invoke-virtual {p0}, Lcom/android/internal/telephony/ims/ImsPhone;->getRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->isRinging()Z

    move-result v2

    if-nez v2, :cond_29

    invoke-virtual {p0}, Lcom/android/internal/telephony/ims/ImsPhone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v2

    if-eqz v2, :cond_b0

    invoke-virtual {p0}, Lcom/android/internal/telephony/ims/ImsPhone;->getBackgroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v2

    if-nez v2, :cond_29

    :cond_b0
    const/4 v1, 0x1

    goto/16 :goto_29
.end method

.method public canTransfer()Z
    .registers 2

    .prologue
    .line 464
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->canTransfer()Z

    move-result v0

    return v0
.end method

.method public changeBarringPassword(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)Z
    .registers 6
    .parameter "facility"
    .parameter "oldPwd"
    .parameter "newPwd"
    .parameter "onComplete"

    .prologue
    .line 1009
    const-string v0, "changeBarringPassword"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1010
    const/4 v0, 0x0

    return v0
.end method

.method public changeBarringPassword(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)Z
    .registers 7
    .parameter "facility"
    .parameter "oldPwd"
    .parameter "newPwd"
    .parameter "newPwdAgain"
    .parameter "onComplete"

    .prologue
    .line 1017
    const-string v0, "changeBarringPassword"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1018
    const/4 v0, 0x0

    return v0
.end method

.method public changeConnectionType(Landroid/os/Message;Lcom/android/internal/telephony/Connection;ILjava/util/Map;)V
    .registers 7
    .parameter "msg"
    .parameter "conn"
    .parameter "newCallType"
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Message;",
            "Lcom/android/internal/telephony/Connection;",
            "I",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 598
    .local p4, newExtras:Ljava/util/Map;,"Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p2, :cond_2a

    .line 599
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_13

    .line 600
    check-cast p2, Lcom/android/internal/telephony/gsm/GsmConnection;

    .end local p2
    invoke-virtual {p2, p1, p3, p4}, Lcom/android/internal/telephony/Connection;->changeConnectionType(Landroid/os/Message;ILjava/util/Map;)V

    .line 609
    :goto_12
    return-void

    .line 601
    .restart local p2
    :cond_13
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_24

    .line 602
    check-cast p2, Lcom/android/internal/telephony/cdma/CdmaConnection;

    .end local p2
    invoke-virtual {p2, p1, p3, p4}, Lcom/android/internal/telephony/Connection;->changeConnectionType(Landroid/os/Message;ILjava/util/Map;)V

    goto :goto_12

    .line 604
    .restart local p2
    :cond_24
    const-string v0, "changeConnectionType"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    goto :goto_12

    .line 607
    :cond_2a
    const-string v0, "IMSPhone"

    const-string v1, "connection is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_12
.end method

.method public clearDisconnected()V
    .registers 2

    .prologue
    .line 510
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->clearDisconnected()V

    .line 511
    return-void
.end method

.method public conference()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 456
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->conference()V

    .line 457
    return-void
.end method

.method public dial(Ljava/lang/String;)Lcom/android/internal/telephony/Connection;
    .registers 4
    .parameter "dialString"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 371
    new-instance v0, Lcom/android/internal/telephony/CallStateException;

    const-string v1, "Dial with dialstring not supported for ImsPhone"

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/CallStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public dial(Ljava/lang/String;II[Ljava/lang/String;)Lcom/android/internal/telephony/Connection;
    .registers 6
    .parameter "dialString"
    .parameter "callType"
    .parameter "domain"
    .parameter "extras"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 408
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0, p1, p2, p3, p4}, Lcom/android/internal/telephony/Phone;->dial(Ljava/lang/String;II[Ljava/lang/String;)Lcom/android/internal/telephony/Connection;

    move-result-object v0

    return-object v0
.end method

.method public dial(Ljava/lang/String;I[Ljava/lang/String;)Lcom/android/internal/telephony/Connection;
    .registers 8
    .parameter "dialString"
    .parameter "callType"
    .parameter "extras"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 414
    const/4 v1, 0x3

    .line 416
    .local v1, domain:I
    invoke-virtual {p0}, Lcom/android/internal/telephony/ims/ImsPhone;->canDial()Z

    move-result v2

    if-nez v2, :cond_f

    .line 417
    new-instance v2, Lcom/android/internal/telephony/CallStateException;

    const-string v3, "Cannot dial IMS call in current state"

    invoke-direct {v2, v3}, Lcom/android/internal/telephony/CallStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 420
    :cond_f
    invoke-direct {p0}, Lcom/android/internal/telephony/ims/ImsPhone;->isPSDomain()Z

    move-result v2

    if-eqz v2, :cond_16

    .line 421
    const/4 v1, 0x2

    .line 424
    :cond_16
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    invoke-interface {v2, p1, p2, v1, p3}, Lcom/android/internal/telephony/Phone;->dial(Ljava/lang/String;II[Ljava/lang/String;)Lcom/android/internal/telephony/Connection;

    move-result-object v0

    .line 425
    .local v0, c:Lcom/android/internal/telephony/Connection;
    return-object v0
.end method

.method public dial(Ljava/lang/String;Lcom/android/internal/telephony/UUSInfo;)Lcom/android/internal/telephony/Connection;
    .registers 5
    .parameter "dialString"
    .parameter "uusInfo"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 377
    new-instance v0, Lcom/android/internal/telephony/CallStateException;

    const-string v1, "Dial with uusinfo not supported for ImsPhone"

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/CallStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public disableDataConnectivity()Z
    .registers 3

    .prologue
    .line 1201
    const-string v0, "IMSPhone"

    const-string v1, "not needed for IMS phone disableDataConnectivity"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1202
    const/4 v0, 0x0

    return v0
.end method

.method public disableLocationUpdates()V
    .registers 2

    .prologue
    .line 1047
    const-string v0, "disableLocationUpdates"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1048
    return-void
.end method

.method public disconnectCauseFromCode(I)Lcom/android/internal/telephony/Connection$DisconnectCause;
    .registers 4
    .parameter "causeCode"

    .prologue
    .line 708
    sparse-switch p1, :sswitch_data_36

    .line 729
    invoke-virtual {p0}, Lcom/android/internal/telephony/ims/ImsPhone;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v1

    invoke-virtual {v1}, Landroid/telephony/ServiceState;->getState()I

    move-result v0

    .line 730
    .local v0, serviceState:I
    const/4 v1, 0x3

    if-ne v0, v1, :cond_23

    .line 731
    sget-object v1, Lcom/android/internal/telephony/Connection$DisconnectCause;->POWER_OFF:Lcom/android/internal/telephony/Connection$DisconnectCause;

    .line 738
    .end local v0           #serviceState:I
    :goto_10
    return-object v1

    .line 715
    :sswitch_11
    sget-object v1, Lcom/android/internal/telephony/Connection$DisconnectCause;->CONGESTION:Lcom/android/internal/telephony/Connection$DisconnectCause;

    goto :goto_10

    .line 717
    :sswitch_14
    sget-object v1, Lcom/android/internal/telephony/Connection$DisconnectCause;->LIMIT_EXCEEDED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    goto :goto_10

    .line 719
    :sswitch_17
    sget-object v1, Lcom/android/internal/telephony/Connection$DisconnectCause;->CALL_BARRED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    goto :goto_10

    .line 721
    :sswitch_1a
    sget-object v1, Lcom/android/internal/telephony/Connection$DisconnectCause;->FDN_BLOCKED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    goto :goto_10

    .line 723
    :sswitch_1d
    sget-object v1, Lcom/android/internal/telephony/Connection$DisconnectCause;->UNOBTAINABLE_NUMBER:Lcom/android/internal/telephony/Connection$DisconnectCause;

    goto :goto_10

    .line 725
    :sswitch_20
    sget-object v1, Lcom/android/internal/telephony/Connection$DisconnectCause;->BUSY:Lcom/android/internal/telephony/Connection$DisconnectCause;

    goto :goto_10

    .line 732
    .restart local v0       #serviceState:I
    :cond_23
    const/4 v1, 0x1

    if-eq v0, v1, :cond_29

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2c

    .line 734
    :cond_29
    sget-object v1, Lcom/android/internal/telephony/Connection$DisconnectCause;->OUT_OF_SERVICE:Lcom/android/internal/telephony/Connection$DisconnectCause;

    goto :goto_10

    .line 735
    :cond_2c
    const/16 v1, 0x10

    if-ne p1, v1, :cond_33

    .line 736
    sget-object v1, Lcom/android/internal/telephony/Connection$DisconnectCause;->NORMAL:Lcom/android/internal/telephony/Connection$DisconnectCause;

    goto :goto_10

    .line 738
    :cond_33
    sget-object v1, Lcom/android/internal/telephony/Connection$DisconnectCause;->ERROR_UNSPECIFIED:Lcom/android/internal/telephony/Connection$DisconnectCause;

    goto :goto_10

    .line 708
    :sswitch_data_36
    .sparse-switch
        0x1 -> :sswitch_1d
        0x11 -> :sswitch_20
        0x22 -> :sswitch_11
        0x29 -> :sswitch_11
        0x2a -> :sswitch_11
        0x2c -> :sswitch_11
        0x31 -> :sswitch_11
        0x3a -> :sswitch_11
        0x44 -> :sswitch_14
        0xf0 -> :sswitch_17
        0xf1 -> :sswitch_1a
    .end sparse-switch
.end method

.method public dispose()V
    .registers 1

    .prologue
    .line 181
    return-void
.end method

.method public enableDataConnectivity()Z
    .registers 3

    .prologue
    .line 1192
    const-string v0, "IMSPhone"

    const-string v1, "not needed for IMS phone enableDataConnectivity"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1193
    const/4 v0, 0x0

    return v0
.end method

.method public enableLocationUpdates()V
    .registers 2

    .prologue
    .line 1042
    const-string v0, "enableLocationUpdates"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1043
    return-void
.end method

.method public equals(Lcom/android/internal/telephony/Phone;)Z
    .registers 3
    .parameter "phone"

    .prologue
    .line 311
    if-ne p1, p0, :cond_4

    const/4 v0, 0x1

    :goto_3
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3
    .parameter "o"

    .prologue
    .line 301
    if-ne p1, p0, :cond_4

    .line 302
    const/4 v0, 0x1

    .line 303
    :goto_3
    return v0

    :cond_4
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public explicitCallTransfer()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 468
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->explicitCallTransfer()V

    .line 469
    return-void
.end method

.method public gbaAuthenticateBootstrap([B[BLandroid/os/Message;)V
    .registers 4
    .parameter "rand"
    .parameter "autn"
    .parameter "onComplete"

    .prologue
    .line 1268
    if-eqz p3, :cond_5

    invoke-virtual {p3}, Landroid/os/Message;->sendToTarget()V

    .line 1269
    :cond_5
    return-void
.end method

.method public gbaAuthenticateNaf([BLandroid/os/Message;)V
    .registers 3
    .parameter "nafId"
    .parameter "onComplete"

    .prologue
    .line 1272
    if-eqz p2, :cond_5

    invoke-virtual {p2}, Landroid/os/Message;->sendToTarget()V

    .line 1273
    :cond_5
    return-void
.end method

.method public getAvailableNetworks(Landroid/os/Message;)V
    .registers 3
    .parameter "response"

    .prologue
    .line 945
    const-string v0, "getAvailableNetworks"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 946
    return-void
.end method

.method public getBackgroundCall()Lcom/android/internal/telephony/Call;
    .registers 2

    .prologue
    .line 589
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getBackgroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    return-object v0
.end method

.method public getCallBarringOption(Ljava/lang/String;Landroid/os/Message;)V
    .registers 4
    .parameter "commandInterfacecbFlavour"
    .parameter "onComplete"

    .prologue
    .line 984
    const-string v0, "getCallBarringOption"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 985
    return-void
.end method

.method public getCallForwardingOption(ILandroid/os/Message;)V
    .registers 4
    .parameter "commandInterfaceCFReason"
    .parameter "onComplete"

    .prologue
    .line 923
    const-string v0, "getCallForwardingOption"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 924
    return-void
.end method

.method public getCallWaiting(Landroid/os/Message;)V
    .registers 3
    .parameter "onComplete"

    .prologue
    const/4 v0, 0x0

    .line 566
    invoke-static {p1, v0, v0}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 567
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 568
    return-void
.end method

.method public getCellBroadcastSmsConfig(Landroid/os/Message;)V
    .registers 3
    .parameter "response"

    .prologue
    .line 1116
    const-string v0, "getCellBroadcastSmsConfig"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1117
    return-void
.end method

.method public getCellLocation()Landroid/telephony/CellLocation;
    .registers 2

    .prologue
    .line 750
    const-string v0, "getCellLocation"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 751
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDataActivityState()Lcom/android/internal/telephony/Phone$DataActivityState;
    .registers 2

    .prologue
    .line 760
    const-string v0, "getDataActivityState"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 761
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDataCallList(Landroid/os/Message;)V
    .registers 3
    .parameter "response"

    .prologue
    .line 1033
    const-string v0, "getDataCallList"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1034
    return-void
.end method

.method public getDataConnectionState(Ljava/lang/String;)Lcom/android/internal/telephony/PhoneConstants$DataState;
    .registers 3
    .parameter "apnType"

    .prologue
    .line 755
    const-string v0, "getDataConnectionState"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 756
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDataDunEnabled()Z
    .registers 3

    .prologue
    .line 430
    const-string v0, "IMSPhone"

    const-string v1, "Not yet implement getDataOnDunEnabled() in JB 4.3"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 432
    const/4 v0, 0x0

    return v0
.end method

.method public getDataRoamingEnabled()Z
    .registers 2

    .prologue
    .line 1052
    const-string v0, "getDataRoamingEnabled"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1053
    const/4 v0, 0x0

    return v0
.end method

.method public getDataServiceState()I
    .registers 2

    .prologue
    .line 674
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getDataServiceState()I

    move-result v0

    return v0
.end method

.method public getDcnAddress()Ljava/lang/String;
    .registers 11

    .prologue
    const/4 v1, 0x0

    .line 891
    const/4 v7, 0x0

    .line 893
    .local v7, c:Landroid/database/Cursor;
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const-string v0, "mDcnNumber"

    aput-object v0, v2, v1

    .line 896
    .local v2, reqField:[Ljava/lang/String;
    :try_start_9
    iget-object v0, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mResolver:Landroid/content/ContentResolver;

    sget-object v1, Lcom/android/internal/telephony/ims/ImsPhone;->mFormatUri:Landroid/net/Uri;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 897
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v8

    .line 898
    .local v8, count:I
    if-lez v8, :cond_45

    .line 899
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 900
    const-string v0, "IMSPhone"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Domain Change Address : "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v3, 0x0

    invoke-interface {v7, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 901
    const/4 v0, 0x0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;
    :try_end_3e
    .catchall {:try_start_9 .. :try_end_3e} :catchall_57
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_3e} :catch_51

    move-result-object v6

    .line 910
    .local v6, address:Ljava/lang/String;
    if-eqz v7, :cond_44

    .end local v6           #address:Ljava/lang/String;
    .end local v8           #count:I
    :goto_41
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 908
    :cond_44
    return-object v6

    .line 904
    .restart local v8       #count:I
    :cond_45
    :try_start_45
    const-string v0, "IMSPhone"

    const-string v1, "Cursor < 1"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 905
    const-string v6, "4437501000"
    :try_end_4e
    .catchall {:try_start_45 .. :try_end_4e} :catchall_57
    .catch Ljava/lang/Exception; {:try_start_45 .. :try_end_4e} :catch_51

    .line 910
    if-eqz v7, :cond_44

    goto :goto_41

    .line 907
    .end local v8           #count:I
    :catch_51
    move-exception v9

    .line 908
    .local v9, e:Ljava/lang/Exception;
    :try_start_52
    const-string v6, "4437501000"
    :try_end_54
    .catchall {:try_start_52 .. :try_end_54} :catchall_57

    .line 910
    if-eqz v7, :cond_44

    goto :goto_41

    .end local v9           #e:Ljava/lang/Exception;
    :catchall_57
    move-exception v0

    if-eqz v7, :cond_5d

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_5d
    throw v0
.end method

.method public getDeviceId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1063
    const-string v0, "getDeviceId"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1064
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDeviceSvn()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1069
    const-string v0, "getDeviceSvn"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1070
    const/4 v0, 0x0

    return-object v0
.end method

.method public getDualSimSlotActivationState()Z
    .registers 2

    .prologue
    .line 1292
    const-string v0, "getDualSimSlotActivationState"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1293
    const/4 v0, 0x0

    return v0
.end method

.method public getEsn()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1081
    const-string v0, "getEsn"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1082
    const/4 v0, 0x0

    return-object v0
.end method

.method public getForegroundCall()Lcom/android/internal/telephony/Call;
    .registers 2

    .prologue
    .line 585
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    return-object v0
.end method

.method public getFormatPreference()Ljava/lang/String;
    .registers 11

    .prologue
    const/4 v1, 0x0

    .line 1213
    const/4 v6, 0x0

    .line 1215
    .local v6, c:Landroid/database/Cursor;
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const-string v0, "mSmsFormat"

    aput-object v0, v2, v1

    .line 1219
    .local v2, reqField:[Ljava/lang/String;
    :try_start_9
    iget-object v0, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mResolver:Landroid/content/ContentResolver;

    sget-object v1, Lcom/android/internal/telephony/ims/ImsPhone;->mFormatUri:Landroid/net/Uri;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1220
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v7

    .line 1221
    .local v7, count:I
    if-lez v7, :cond_5d

    .line 1222
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 1223
    const-string v0, "IMSPhone"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Changed Sms Format : "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v3, 0x0

    invoke-interface {v6, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1224
    const/4 v0, 0x0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 1226
    .local v9, smsFormat:Ljava/lang/String;
    const-string v0, "3GPP"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4f

    .line 1227
    const-string v9, "3gpp"
    :try_end_49
    .catchall {:try_start_9 .. :try_end_49} :catchall_6f
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_49} :catch_69

    .line 1241
    :goto_49
    if-eqz v6, :cond_4e

    .end local v7           #count:I
    .end local v9           #smsFormat:Ljava/lang/String;
    :goto_4b
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 1239
    :cond_4e
    return-object v9

    .line 1228
    .restart local v7       #count:I
    .restart local v9       #smsFormat:Ljava/lang/String;
    :cond_4f
    :try_start_4f
    const-string v0, "3GPP2"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5a

    .line 1229
    const-string v9, "3gpp2"

    goto :goto_49

    .line 1231
    :cond_5a
    const-string v9, "unknown"

    goto :goto_49

    .line 1235
    .end local v9           #smsFormat:Ljava/lang/String;
    :cond_5d
    const-string v0, "IMSPhone"

    const-string v1, "Cursor < 1"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1236
    const-string v9, "unknown"
    :try_end_66
    .catchall {:try_start_4f .. :try_end_66} :catchall_6f
    .catch Ljava/lang/Exception; {:try_start_4f .. :try_end_66} :catch_69

    .line 1241
    if-eqz v6, :cond_4e

    goto :goto_4b

    .line 1238
    .end local v7           #count:I
    :catch_69
    move-exception v8

    .line 1239
    .local v8, e:Ljava/lang/Exception;
    :try_start_6a
    const-string v9, "unknown"
    :try_end_6c
    .catchall {:try_start_6a .. :try_end_6c} :catchall_6f

    .line 1241
    if-eqz v6, :cond_4e

    goto :goto_4b

    .end local v8           #e:Ljava/lang/Exception;
    :catchall_6f
    move-exception v0

    if-eqz v6, :cond_75

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_75
    throw v0
.end method

.method public getGroupIdLevel1()Ljava/lang/String;
    .registers 3

    .prologue
    .line 1208
    const-string v0, "IMSPhone"

    const-string v1, "not needed for IMS phone getGroupIdLevel1"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1209
    const/4 v0, 0x0

    return-object v0
.end method

.method public getHandsetInfo(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .parameter "ID"

    .prologue
    .line 807
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/internal/telephony/Phone;->getHandsetInfo(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getIccPhoneBookInterfaceManager()Lcom/android/internal/telephony/IccPhoneBookInterfaceManager;
    .registers 2

    .prologue
    .line 1105
    const-string v0, "getIccPhoneBookInterfaceManager"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1106
    const/4 v0, 0x0

    return-object v0
.end method

.method public getImei()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1093
    const-string v0, "getImei"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1094
    const/4 v0, 0x0

    return-object v0
.end method

.method public getImeiInCDMAGSMPhone()Ljava/lang/String;
    .registers 2

    .prologue
    .line 801
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getImeiInCDMAGSMPhone()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getImsRegisteredFeature()I
    .registers 2

    .prologue
    .line 670
    iget v0, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mFeature:I

    return v0
.end method

.method public getImsRegisteredNetworkType()I
    .registers 2

    .prologue
    .line 666
    iget v0, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mNetworkType:I

    return v0
.end method

.method public getLine1AlphaTag()Ljava/lang/String;
    .registers 2

    .prologue
    .line 868
    const-string v0, "getLine1AlphaTag"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 869
    const/4 v0, 0x0

    return-object v0
.end method

.method public getLine1Number()Ljava/lang/String;
    .registers 2

    .prologue
    .line 862
    const-string v0, "getLine1Number"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 863
    const/4 v0, 0x0

    return-object v0
.end method

.method public getLine1NumberType(I)Ljava/lang/String;
    .registers 3
    .parameter "SimType"

    .prologue
    .line 1278
    const-string v0, "getLine1NumberType"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1279
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMdnavailable()Z
    .registers 2

    .prologue
    .line 775
    const-string v0, "getMdnavailable"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 776
    const/4 v0, 0x0

    return v0
.end method

.method public getMeid()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1087
    const-string v0, "getMeid"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1088
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMsisdnavailable()Z
    .registers 2

    .prologue
    .line 780
    const-string v0, "getMsisdnavailable"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 781
    const/4 v0, 0x0

    return v0
.end method

.method public getMute()Z
    .registers 2

    .prologue
    .line 581
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getMute()Z

    move-result v0

    return v0
.end method

.method public getNeighboringCids(Landroid/os/Message;)V
    .registers 3
    .parameter "response"

    .prologue
    .line 1023
    const-string v0, "getNeighboringCids"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1024
    return-void
.end method

.method public getOCSGLAvailable()Z
    .registers 2

    .prologue
    .line 787
    const-string v0, "getOCSGLAvailable"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 788
    const/4 v0, 0x0

    return v0
.end method

.method public getOutgoingCallerIdDisplay(Landroid/os/Message;)V
    .registers 3
    .parameter "onComplete"

    .prologue
    const/4 v0, 0x0

    .line 555
    invoke-static {p1, v0, v0}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 556
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 557
    return-void
.end method

.method public getPSISMSCavailable()Z
    .registers 2

    .prologue
    .line 823
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getPSISMSCavailable()Z

    move-result v0

    return v0
.end method

.method public getPendingMmiCodes()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<+",
            "Lcom/android/internal/telephony/MmiCode;",
            ">;"
        }
    .end annotation

    .prologue
    .line 770
    const-string v0, "getPendingMmiCodes"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 771
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPhoneName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 307
    const-string v0, "IMS"

    return-object v0
.end method

.method public getPhoneSubInfo()Lcom/android/internal/telephony/PhoneSubInfo;
    .registers 2

    .prologue
    .line 1099
    const-string v0, "getPhoneSubInfo"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1100
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPhoneType()I
    .registers 2

    .prologue
    .line 687
    const/4 v0, 0x5

    return v0
.end method

.method public getPostDialHandler()Landroid/os/Registrant;
    .registers 2

    .prologue
    .line 1126
    const-string v0, "getPostDialHandler"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1127
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPreferredNetworkList(Landroid/os/Message;)V
    .registers 3
    .parameter "response"

    .prologue
    .line 970
    const-string v0, "getPreferredNetworkList"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 971
    return-void
.end method

.method public getProposedConnectionType(Lcom/android/internal/telephony/Connection;)I
    .registers 5
    .parameter "conn"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 641
    if-eqz p1, :cond_2d

    .line 642
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_15

    .line 643
    check-cast p1, Lcom/android/internal/telephony/gsm/GsmConnection;

    .end local p1
    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->getProposedConnectionType()I

    move-result v0

    .line 652
    :goto_14
    return v0

    .line 644
    .restart local p1
    :cond_15
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_27

    .line 645
    check-cast p1, Lcom/android/internal/telephony/cdma/CdmaConnection;

    .end local p1
    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->getProposedConnectionType()I

    move-result v0

    goto :goto_14

    .line 647
    .restart local p1
    :cond_27
    const-string v1, "rejectConnectionTypeChange"

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    goto :goto_14

    .line 651
    :cond_2d
    const-string v1, "IMSPhone"

    const-string v2, "connection is null"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_14
.end method

.method public getPsismsc()[B
    .registers 2

    .prologue
    .line 1161
    const-string v0, "getPsismsc"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1162
    const/4 v0, 0x0

    return-object v0
.end method

.method public getRingingCall()Lcom/android/internal/telephony/Call;
    .registers 2

    .prologue
    .line 593
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    return-object v0
.end method

.method public getSMSPavailable()Z
    .registers 2

    .prologue
    .line 818
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getSMSPavailable()Z

    move-result v0

    return v0
.end method

.method public getSMSavailable()Z
    .registers 2

    .prologue
    .line 813
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getSMSavailable()Z

    move-result v0

    return v0
.end method

.method public getServiceState()Landroid/telephony/ServiceState;
    .registers 2

    .prologue
    .line 661
    invoke-direct {p0}, Lcom/android/internal/telephony/ims/ImsPhone;->isAirplaneModeOn()Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mServiceState:Landroid/telephony/ServiceState;

    invoke-virtual {v0}, Landroid/telephony/ServiceState;->setStateOff()V

    .line 662
    :cond_b
    iget-object v0, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mServiceState:Landroid/telephony/ServiceState;

    return-object v0
.end method

.method public getSignalStrength()Landroid/telephony/SignalStrength;
    .registers 2

    .prologue
    .line 765
    const-string v0, "getSignalStrength"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 766
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSktImsiM()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1149
    const-string v0, "getSktImsiM"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1150
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSktIrm()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1144
    const-string v0, "getSktIrm"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1145
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSmsOverImsFormat()Ljava/lang/String;
    .registers 4

    .prologue
    .line 315
    const-string v0, "default"

    .line 317
    .local v0, format:Ljava/lang/String;
    const-string v1, "3gpp"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    .line 318
    const-string v1, "3gpp"

    .line 331
    :goto_c
    return-object v1

    .line 319
    :cond_d
    const-string v1, "3gpp2"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_18

    .line 320
    const-string v1, "3gpp2"

    goto :goto_c

    .line 321
    :cond_18
    const-string v1, "vzw"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_25

    .line 322
    invoke-virtual {p0}, Lcom/android/internal/telephony/ims/ImsPhone;->getFormatPreference()Ljava/lang/String;

    move-result-object v1

    goto :goto_c

    .line 325
    :cond_25
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v1

    instance-of v1, v1, Lcom/android/internal/telephony/cdma/CDMALTEPhone;

    if-eqz v1, :cond_30

    .line 326
    const-string v1, "3gpp2"

    goto :goto_c

    .line 327
    :cond_30
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v1

    instance-of v1, v1, Lcom/android/internal/telephony/gsm/GSMPhone;

    if-eqz v1, :cond_3b

    .line 328
    const-string v1, "3gpp"

    goto :goto_c

    .line 330
    :cond_3b
    const-string v1, "IMSPhone"

    const-string v2, "getSmsOverImsFormat(): No LTE-capable phone should access this."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 331
    const-string v1, "unknown"

    goto :goto_c
.end method

.method public getSponImsi()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 795
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getSponImsi()[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getState()Lcom/android/internal/telephony/PhoneConstants$State;
    .registers 2

    .prologue
    .line 678
    iget-object v0, p0, Lcom/android/internal/telephony/ims/ImsPhone;->state:Lcom/android/internal/telephony/PhoneConstants$State;

    return-object v0
.end method

.method public getSubscriberId()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1075
    const-string v0, "getSubscriberId"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1076
    const/4 v0, 0x0

    return-object v0
.end method

.method public getSubscriberIdType(I)Ljava/lang/String;
    .registers 3
    .parameter "SimType"

    .prologue
    .line 1283
    const-string v0, "getSubscriberIdType"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1284
    const/4 v0, 0x0

    return-object v0
.end method

.method public getVoiceMailAlphaTag()Ljava/lang/String;
    .registers 2

    .prologue
    .line 886
    const-string v0, "getVoiceMailAlphaTag"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 887
    const/4 v0, 0x0

    return-object v0
.end method

.method public getVoiceMailNumber()Ljava/lang/String;
    .registers 2

    .prologue
    .line 880
    const-string v0, "getVoiceMailNumber"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 881
    const/4 v0, 0x0

    return-object v0
.end method

.method public handleInCallMmiCommands(Ljava/lang/String;)Z
    .registers 3
    .parameter "command"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 851
    const-string v0, "handleInCallMmiCommands"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 852
    const/4 v0, 0x0

    return v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .registers 15
    .parameter "msg"

    .prologue
    .line 227
    const-string v10, "IMSPhone"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Received event:"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget v12, p1, Landroid/os/Message;->what:I

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 231
    iget v10, p1, Landroid/os/Message;->what:I

    sparse-switch v10, :sswitch_data_138

    .line 295
    invoke-super {p0, p1}, Lcom/android/internal/telephony/PhoneBase;->handleMessage(Landroid/os/Message;)V

    .line 297
    :goto_22
    return-void

    .line 233
    :sswitch_23
    const/4 v10, 0x0

    invoke-direct {p0, v10}, Lcom/android/internal/telephony/ims/ImsPhone;->setSmsFormat(I)V

    goto :goto_22

    .line 236
    :sswitch_28
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 237
    .local v0, ar:Landroid/os/AsyncResult;
    iget-object v10, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v10, :cond_db

    iget-object v10, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    if-eqz v10, :cond_db

    iget-object v10, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v10, [I

    check-cast v10, [I

    array-length v10, v10

    const/4 v11, 0x1

    if-lt v10, v11, :cond_db

    .line 239
    iget-object v10, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v10, [I

    move-object v8, v10

    check-cast v8, [I

    .line 243
    .local v8, responseArray:[I
    const/4 v10, 0x0

    aget v7, v8, v10

    .line 244
    .local v7, regState:I
    const/4 v10, 0x1

    aget v3, v8, v10

    .line 245
    .local v3, feature:I
    const/4 v10, 0x2

    aget v6, v8, v10

    .line 246
    .local v6, networkType:I
    const/4 v10, 0x3

    aget v2, v8, v10

    .line 247
    .local v2, ecmp:I
    const/4 v10, 0x4

    aget v9, v8, v10

    .line 249
    .local v9, smsFormat:I
    const-string v10, "IMSPhone"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "IMS reg state: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " feature: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " networkType: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " ecmp: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " smsFormat: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 252
    iput v7, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mRegState:I

    .line 253
    iput v3, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mFeature:I

    .line 260
    if-nez v7, :cond_c2

    .line 261
    iget-object v10, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mServiceState:Landroid/telephony/ServiceState;

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Landroid/telephony/ServiceState;->setState(I)V

    .line 262
    const/4 v10, -0x1

    iput v10, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mNetworkType:I

    .line 271
    :cond_a7
    :goto_a7
    new-instance v4, Landroid/content/Intent;

    const-string v10, "android.intent.action.ECMP_STATE_CHANGED"

    invoke-direct {v4, v10}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 272
    .local v4, intent:Landroid/content/Intent;
    const/high16 v10, 0x2000

    invoke-virtual {v4, v10}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 273
    const-string v10, "ECMP_STATE"

    const/4 v11, 0x3

    aget v11, v8, v11

    invoke-virtual {v4, v10, v11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 274
    iget-object v10, p0, Lcom/android/internal/telephony/PhoneBase;->mContext:Landroid/content/Context;

    invoke-virtual {v10, v4}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_22

    .line 263
    .end local v4           #intent:Landroid/content/Intent;
    :cond_c2
    const/4 v10, 0x1

    if-ne v7, v10, :cond_ce

    .line 264
    iget-object v10, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mServiceState:Landroid/telephony/ServiceState;

    const/4 v11, 0x0

    invoke-virtual {v10, v11}, Landroid/telephony/ServiceState;->setState(I)V

    .line 265
    iput v6, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mNetworkType:I

    goto :goto_a7

    .line 266
    :cond_ce
    const/4 v10, 0x3

    if-ne v7, v10, :cond_a7

    .line 267
    iget-object v10, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mServiceState:Landroid/telephony/ServiceState;

    const/4 v11, 0x1

    invoke-virtual {v10, v11}, Landroid/telephony/ServiceState;->setState(I)V

    .line 268
    const/4 v10, -0x1

    iput v10, p0, Lcom/android/internal/telephony/ims/ImsPhone;->mNetworkType:I

    goto :goto_a7

    .line 276
    .end local v2           #ecmp:I
    .end local v3           #feature:I
    .end local v6           #networkType:I
    .end local v7           #regState:I
    .end local v8           #responseArray:[I
    .end local v9           #smsFormat:I
    :cond_db
    const-string v10, "IMSPhone"

    const-string v11, "IMS State query failed!"

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_22

    .line 281
    .end local v0           #ar:Landroid/os/AsyncResult;
    :sswitch_e4
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 282
    .restart local v0       #ar:Landroid/os/AsyncResult;
    iget-object v5, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v5, Lcom/android/internal/telephony/gsm/GsmMmiCode;

    .line 283
    .local v5, mmi:Lcom/android/internal/telephony/gsm/GsmMmiCode;
    iget-object v10, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v10, :cond_10a

    .line 284
    const-string v10, "IMSPhone"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "WFC_SS failed. "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-object v12, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    :cond_10a
    invoke-virtual {v5}, Lcom/android/internal/telephony/gsm/GsmMmiCode;->isCfIconUpdateRequired()Z

    move-result v10

    if-eqz v10, :cond_133

    iget-object v10, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v10, :cond_133

    .line 287
    invoke-virtual {v5}, Lcom/android/internal/telephony/gsm/GsmMmiCode;->getCfIconStatus()Z

    move-result v1

    .line 288
    .local v1, cffEnabled:Z
    const-string v10, "IMSPhone"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Cf Set with cffEnabled :"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    invoke-virtual {v5, v1}, Lcom/android/internal/telephony/gsm/GsmMmiCode;->setVoiceCallForwardingFlag(Z)V

    .line 291
    .end local v1           #cffEnabled:Z
    :cond_133
    invoke-virtual {v5, p1, v0}, Lcom/android/internal/telephony/gsm/GsmMmiCode;->onSetComplete(Landroid/os/Message;Landroid/os/AsyncResult;)V

    goto/16 :goto_22

    .line 231
    :sswitch_data_138
    .sparse-switch
        0x1 -> :sswitch_23
        0x24 -> :sswitch_28
        0x26 -> :sswitch_e4
    .end sparse-switch
.end method

.method public handlePinMmi(Ljava/lang/String;)Z
    .registers 3
    .parameter "dialString"

    .prologue
    .line 844
    const-string v0, "handlePinMmi"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 845
    const/4 v0, 0x0

    return v0
.end method

.method public handleTimerInEmergencyCallbackMode(I)V
    .registers 4
    .parameter "action"

    .prologue
    .line 744
    const-string v0, "IMSPhone"

    const-string v1, "handleTimerInEmergencyCallbackMode, unsupported for this phone"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 747
    return-void
.end method

.method public hasIsim()Z
    .registers 2

    .prologue
    .line 1156
    const-string v0, "hasIsim"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1157
    const/4 v0, 0x0

    return v0
.end method

.method public holdCall()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 449
    const-string v0, "IMSPhone"

    const-string v1, " ~~~~~~  switch fg and bg"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 450
    const-class v1, Lcom/android/internal/telephony/ims/ImsPhone;

    monitor-enter v1

    .line 451
    :try_start_a
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->switchHoldingAndActive()V

    .line 452
    monitor-exit v1

    .line 453
    return-void

    .line 452
    :catchall_13
    move-exception v0

    monitor-exit v1
    :try_end_15
    .catchall {:try_start_a .. :try_end_15} :catchall_13

    throw v0
.end method

.method public notifyDisconnect(Lcom/android/internal/telephony/Connection;)V
    .registers 3
    .parameter "cn"

    .prologue
    .line 691
    iget-object v0, p0, Lcom/android/internal/telephony/PhoneBase;->mDisconnectRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v0, p1}, Landroid/os/RegistrantList;->notifyResult(Ljava/lang/Object;)V

    .line 692
    return-void
.end method

.method notifyNewRingingConnection(Lcom/android/internal/telephony/Connection;)V
    .registers 2
    .parameter "c"

    .prologue
    .line 700
    invoke-super {p0, p1}, Lcom/android/internal/telephony/PhoneBase;->notifyNewRingingConnectionP(Lcom/android/internal/telephony/Connection;)V

    .line 701
    return-void
.end method

.method public notifyPhoneStateChanged()V
    .registers 2

    .prologue
    .line 475
    iget-object v0, p0, Lcom/android/internal/telephony/PhoneBase;->mNotifier:Lcom/android/internal/telephony/PhoneNotifier;

    invoke-interface {v0, p0}, Lcom/android/internal/telephony/PhoneNotifier;->notifyPhoneState(Lcom/android/internal/telephony/Phone;)V

    .line 476
    return-void
.end method

.method public notifyPreciseCallStateChanged()V
    .registers 1

    .prologue
    .line 506
    invoke-super {p0}, Lcom/android/internal/telephony/PhoneBase;->notifyPreciseCallStateChangedP()V

    .line 507
    return-void
.end method

.method public notifySuppServiceFailed(Lcom/android/internal/telephony/Phone$SuppService;)V
    .registers 3
    .parameter "code"

    .prologue
    .line 479
    iget-object v0, p0, Lcom/android/internal/telephony/PhoneBase;->mSuppServiceFailedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v0, p1}, Landroid/os/RegistrantList;->notifyResult(Ljava/lang/Object;)V

    .line 480
    return-void
.end method

.method public notifyUnknownConnection()V
    .registers 2

    .prologue
    .line 695
    iget-object v0, p0, Lcom/android/internal/telephony/PhoneBase;->mUnknownConnectionRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v0, p0}, Landroid/os/RegistrantList;->notifyResult(Ljava/lang/Object;)V

    .line 696
    return-void
.end method

.method protected onUpdateIccAvailability()V
    .registers 2

    .prologue
    .line 1132
    const-string v0, "onUpdateIccAvailability"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1133
    return-void
.end method

.method public registerForSuppServiceNotification(Landroid/os/Handler;ILjava/lang/Object;)V
    .registers 5
    .parameter "h"
    .parameter "what"
    .parameter "obj"

    .prologue
    .line 834
    const-string v0, "registerForSuppServiceNotification"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 835
    return-void
.end method

.method public rejectCall()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 346
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->rejectCall()V

    .line 347
    return-void
.end method

.method public rejectConnectionTypeChange(Lcom/android/internal/telephony/Connection;)V
    .registers 4
    .parameter "conn"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 627
    if-eqz p1, :cond_2a

    .line 628
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_13

    .line 629
    check-cast p1, Lcom/android/internal/telephony/gsm/GsmConnection;

    .end local p1
    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->rejectConnectionTypeChange()V

    .line 638
    :goto_12
    return-void

    .line 630
    .restart local p1
    :cond_13
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getPhoneType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_24

    .line 631
    check-cast p1, Lcom/android/internal/telephony/cdma/CdmaConnection;

    .end local p1
    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->rejectConnectionTypeChange()V

    goto :goto_12

    .line 633
    .restart local p1
    :cond_24
    const-string v0, "rejectConnectionTypeChange"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    goto :goto_12

    .line 636
    :cond_2a
    const-string v0, "IMSPhone"

    const-string v1, "connection is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_12
.end method

.method public selectCsg(Landroid/os/Message;)V
    .registers 3
    .parameter "response"

    .prologue
    .line 965
    const-string v0, "selectCsg"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 966
    return-void
.end method

.method public selectNetworkManually(Lcom/android/internal/telephony/OperatorInfo;Landroid/os/Message;)V
    .registers 4
    .parameter "network"
    .parameter "response"

    .prologue
    .line 955
    const-string v0, "selectNetworkManually"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 956
    return-void
.end method

.method public selectNetworkManually(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .registers 5
    .parameter "operatorNumeric"
    .parameter "operatorAlphaLong"
    .parameter "response"

    .prologue
    .line 960
    const-string v0, "selectNetworkManually"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 961
    return-void
.end method

.method public sendBurstDtmf(Ljava/lang/String;IILandroid/os/Message;)V
    .registers 10
    .parameter "dtmfString"
    .parameter "on"
    .parameter "off"
    .parameter "onComplete"

    .prologue
    .line 538
    const/4 v0, 0x1

    .line 539
    .local v0, check:Z
    const/4 v1, 0x0

    .local v1, itr:I
    :goto_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_35

    .line 540
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Landroid/telephony/PhoneNumberUtils;->is12Key(C)Z

    move-result v2

    if-nez v2, :cond_4b

    .line 541
    const-string v2, "IMSPhone"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "BurstDtmf invalid character \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 544
    const/4 v0, 0x0

    .line 548
    :cond_35
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v2

    sget-object v3, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v2, v3, :cond_4a

    if-eqz v0, :cond_4a

    .line 549
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    invoke-interface {v2, p1, p2, p3, p4}, Lcom/android/internal/telephony/Phone;->sendBurstDtmf(Ljava/lang/String;IILandroid/os/Message;)V

    .line 551
    :cond_4a
    return-void

    .line 539
    :cond_4b
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method public sendDtmf(C)V
    .registers 5
    .parameter "c"

    .prologue
    .line 514
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->is12Key(C)Z

    move-result v0

    if-nez v0, :cond_25

    .line 515
    const-string v0, "IMSPhone"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sendDtmf called with invalid character \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 521
    :cond_24
    :goto_24
    return-void

    .line 517
    :cond_25
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v0

    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    if-ne v0, v1, :cond_24

    .line 518
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/internal/telephony/Phone;->sendDtmf(C)V

    goto :goto_24
.end method

.method public sendUssdResponse(Ljava/lang/String;)V
    .registers 3
    .parameter "ussdMessge"

    .prologue
    .line 828
    const-string v0, "sendUssdResponse"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 829
    return-void
.end method

.method public setCallBarringOption(ZLjava/lang/String;Ljava/lang/String;ILandroid/os/Message;)Z
    .registers 7
    .parameter "cbAction"
    .parameter "commandInterfacecbFlavour"
    .parameter "password"
    .parameter "serviceClass"
    .parameter "onComplete"

    .prologue
    .line 1001
    const-string v0, "setCallBarringOption"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1002
    const/4 v0, 0x0

    return v0
.end method

.method public setCallBarringOption(ZLjava/lang/String;Ljava/lang/String;Landroid/os/Message;)Z
    .registers 6
    .parameter "cbAction"
    .parameter "commandInterfacecbFlavour"
    .parameter "password"
    .parameter "onComplete"

    .prologue
    .line 992
    const-string v0, "setCallBarringOption"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 993
    const/4 v0, 0x0

    return v0
.end method

.method public setCallForwardingOption(IILjava/lang/String;IILandroid/os/Message;)V
    .registers 8
    .parameter "commandInterfaceCFAction"
    .parameter "commandInterfaceCFReason"
    .parameter "dialingNumber"
    .parameter "timerSeconds"
    .parameter "serviceClass"
    .parameter "onComplete"

    .prologue
    .line 940
    const-string v0, "setCallForwardingOption"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 941
    return-void
.end method

.method public setCallForwardingOption(IILjava/lang/String;ILandroid/os/Message;)V
    .registers 7
    .parameter "commandInterfaceCFReason"
    .parameter "commandInterfaceCFAction"
    .parameter "dialingNumber"
    .parameter "timerSeconds"
    .parameter "onComplete"

    .prologue
    .line 930
    const-string v0, "setCallForwardingOption"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 931
    return-void
.end method

.method public setCallWaiting(ZLandroid/os/Message;)V
    .registers 4
    .parameter "enable"
    .parameter "onComplete"

    .prologue
    .line 571
    const-string v0, "setCallWaiting"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 572
    return-void
.end method

.method public setCellBroadcastSmsConfig([ILandroid/os/Message;)V
    .registers 4
    .parameter "configValuesArray"
    .parameter "response"

    .prologue
    .line 1122
    const-string v0, "setCellBroadcastSmsConfig"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1123
    return-void
.end method

.method public setDataDunEnabled(Z)V
    .registers 2
    .parameter "enable"

    .prologue
    .line 436
    return-void
.end method

.method public setDataRoamingEnabled(Z)V
    .registers 3
    .parameter "enable"

    .prologue
    .line 1058
    const-string v0, "setDataRoamingEnabled"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1059
    return-void
.end method

.method public setGbaBootstrappingParams([BLjava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .registers 5
    .parameter "rand"
    .parameter "btid"
    .parameter "keyLifetime"
    .parameter "onComplete"

    .prologue
    .line 1138
    if-eqz p4, :cond_5

    invoke-virtual {p4}, Landroid/os/Message;->sendToTarget()V

    .line 1139
    :cond_5
    return-void
.end method

.method public setLine1Number(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .registers 5
    .parameter "alphaTag"
    .parameter "number"
    .parameter "onComplete"

    .prologue
    .line 875
    const-string v0, "setLine1Number"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 876
    return-void
.end method

.method public setMute(Z)V
    .registers 4
    .parameter "muted"

    .prologue
    .line 575
    const-class v1, Lcom/android/internal/telephony/ims/ImsPhone;

    monitor-enter v1

    .line 576
    :try_start_3
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/internal/telephony/Phone;->setMute(Z)V

    .line 577
    monitor-exit v1

    .line 578
    return-void

    .line 577
    :catchall_c
    move-exception v0

    monitor-exit v1
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_c

    throw v0
.end method

.method public setNetworkSelectionModeAutomatic(Landroid/os/Message;)V
    .registers 3
    .parameter "response"

    .prologue
    .line 950
    const-string v0, "setNetworkSelectionModeAutomatic"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 951
    return-void
.end method

.method public setOnPostDialCharacter(Landroid/os/Handler;ILjava/lang/Object;)V
    .registers 5
    .parameter "h"
    .parameter "what"
    .parameter "obj"

    .prologue
    .line 1028
    const-string v0, "setOnPostDialCharacter"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1029
    return-void
.end method

.method public setOutgoingCallerIdDisplay(ILandroid/os/Message;)V
    .registers 4
    .parameter "commandInterfaceCLIRMode"
    .parameter "onComplete"

    .prologue
    const/4 v0, 0x0

    .line 561
    invoke-static {p2, v0, v0}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 562
    invoke-virtual {p2}, Landroid/os/Message;->sendToTarget()V

    .line 563
    return-void
.end method

.method public setPreferredNetworkList(ILjava/lang/String;Ljava/lang/String;IIIILandroid/os/Message;)V
    .registers 10
    .parameter "index"
    .parameter "operator"
    .parameter "plmn"
    .parameter "gsmAct"
    .parameter "gsmCompactAct"
    .parameter "utranAct"
    .parameter "mode"
    .parameter "response"

    .prologue
    .line 977
    const-string v0, "setPreferredNetworkList"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 978
    return-void
.end method

.method public setRadioPower(Z)V
    .registers 3
    .parameter "power"

    .prologue
    .line 857
    const-string v0, "setRadioPower"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 858
    return-void
.end method

.method public setRadioPowerOnNow()V
    .registers 1

    .prologue
    .line 1174
    return-void
.end method

.method public setState(Lcom/android/internal/telephony/PhoneConstants$State;)V
    .registers 2
    .parameter "newState"

    .prologue
    .line 682
    iput-object p1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->state:Lcom/android/internal/telephony/PhoneConstants$State;

    .line 683
    return-void
.end method

.method public setVoiceMailNumber(Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .registers 5
    .parameter "alphaTag"
    .parameter "voiceMailNumber"
    .parameter "onComplete"

    .prologue
    .line 917
    const-string v0, "setVoiceMailNumber"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 918
    return-void
.end method

.method public startDtmf(C)V
    .registers 5
    .parameter "c"

    .prologue
    .line 524
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->is12Key(C)Z

    move-result v0

    if-nez v0, :cond_25

    .line 525
    const-string v0, "IMSPhone"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "startDtmf called with invalid character \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 530
    :goto_24
    return-void

    .line 528
    :cond_25
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/android/internal/telephony/Phone;->startDtmf(C)V

    goto :goto_24
.end method

.method public stopDtmf()V
    .registers 2

    .prologue
    .line 533
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->stopDtmf()V

    .line 534
    return-void
.end method

.method public switchHoldingAndActive()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 441
    const-string v0, "IMSPhone"

    const-string v1, " ~~~~~~  switch fg and bg"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 442
    const-class v1, Lcom/android/internal/telephony/ims/ImsPhone;

    monitor-enter v1

    .line 443
    :try_start_a
    invoke-static {}, Lcom/android/internal/telephony/ims/ImsPhone;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    invoke-interface {v0}, Lcom/android/internal/telephony/Phone;->switchHoldingAndActive()V

    .line 444
    monitor-exit v1

    .line 445
    return-void

    .line 444
    :catchall_13
    move-exception v0

    monitor-exit v1
    :try_end_15
    .catchall {:try_start_a .. :try_end_15} :catchall_13

    throw v0
.end method

.method public unregisterForSuppServiceNotification(Landroid/os/Handler;)V
    .registers 3
    .parameter "h"

    .prologue
    .line 839
    const-string v0, "unregisterForSuppServiceNotification"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 840
    return-void
.end method

.method updatePhoneState()V
    .registers 5

    .prologue
    .line 483
    iget-object v0, p0, Lcom/android/internal/telephony/ims/ImsPhone;->state:Lcom/android/internal/telephony/PhoneConstants$State;

    .line 485
    .local v0, oldState:Lcom/android/internal/telephony/PhoneConstants$State;
    invoke-virtual {p0}, Lcom/android/internal/telephony/ims/ImsPhone;->getRingingCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->isRinging()Z

    move-result v1

    if-eqz v1, :cond_32

    .line 486
    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->RINGING:Lcom/android/internal/telephony/PhoneConstants$State;

    iput-object v1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->state:Lcom/android/internal/telephony/PhoneConstants$State;

    .line 493
    :goto_10
    iget-object v1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->state:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v1, v0, :cond_31

    .line 494
    const-string v1, "IMSPhone"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " ^^^ new phone state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/telephony/ims/ImsPhone;->state:Lcom/android/internal/telephony/PhoneConstants$State;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 495
    invoke-virtual {p0}, Lcom/android/internal/telephony/ims/ImsPhone;->notifyPhoneStateChanged()V

    .line 497
    :cond_31
    return-void

    .line 487
    :cond_32
    invoke-virtual {p0}, Lcom/android/internal/telephony/ims/ImsPhone;->getForegroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v1

    if-eqz v1, :cond_4b

    invoke-virtual {p0}, Lcom/android/internal/telephony/ims/ImsPhone;->getBackgroundCall()Lcom/android/internal/telephony/Call;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call;->isIdle()Z

    move-result v1

    if-eqz v1, :cond_4b

    .line 488
    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    iput-object v1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->state:Lcom/android/internal/telephony/PhoneConstants$State;

    goto :goto_10

    .line 490
    :cond_4b
    sget-object v1, Lcom/android/internal/telephony/PhoneConstants$State;->OFFHOOK:Lcom/android/internal/telephony/PhoneConstants$State;

    iput-object v1, p0, Lcom/android/internal/telephony/ims/ImsPhone;->state:Lcom/android/internal/telephony/PhoneConstants$State;

    goto :goto_10
.end method

.method public updateServiceLocation()V
    .registers 2

    .prologue
    .line 1038
    const-string v0, "updateServiceLocation"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/ims/ImsPhone;->logUnexpectedMethodCall(Ljava/lang/String;)V

    .line 1039
    return-void
.end method
