.class final Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker;
.super Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;
.source "MultiSimGsmServiceStateTracker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker$RadioPowerTimer;,
        Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker$Lock;
    }
.end annotation


# static fields
.field static final DBG:Z = true

.field private static final EVENT_FORWARDING_GET_COMPLETED:I = 0x407

.field private static final EVENT_GET_CFIS_DONE:I = 0x406

.field static final INTENT_ACTION_CANCEL_POWER_ON_DELAY:Ljava/lang/String; = "android.intent.action.CANCEL_POWER_ON_DELAY"

.field static final INTENT_ACTION_CANCEL_POWER_ON_TIMER:Ljava/lang/String; = "android.intent.action.CANCEL_POWER_ON_TIMER"

.field static final LOG_TAG:Ljava/lang/String; = "GsmSST"

.field private static final MCCMNC_CODES_CFIS_SIMERROR:[Ljava/lang/String;


# instance fields
.field private final BCM_EVENT_SIM_ABSENT:I

.field private final BCM_EVENT_SIM_LOCK:I

.field private final BCM_EVENT_SIM_NETWORKLOCK:I

.field private StartQueryCallForwardStatus:Z

.field private mHasPostedRadioPowerOnTimer:Z

.field private mLastRadioPowerOnTimer:Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker$RadioPowerTimer;

.field private mLocaleChanged:Z

.field private final mLock:Ljava/lang/Object;

.field private mMasterSimMode:Z

.field private mPhoneOnMode:Z

.field private mPhoneStateListener:Landroid/telephony/PhoneStateListener;

.field private mPreviousAirplanemode:Z

.field private mTelephonyManager:Landroid/telephony/TelephonyManager;

.field private mTempIntent:Landroid/content/Intent;

.field mccmnc_final:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 147
    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "46000"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "46001"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "46002"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "46003"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "46005"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "46006"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "46007"

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker;->MCCMNC_CODES_CFIS_SIMERROR:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/android/internal/telephony/gsm/GSMPhone;)V
    .registers 5
    .parameter "phone"

    .prologue
    const/4 v0, 0x1

    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 199
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;-><init>(Lcom/android/internal/telephony/gsm/GSMPhone;)V

    .line 123
    iput-boolean v1, p0, Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker;->mPreviousAirplanemode:Z

    .line 135
    iput-boolean v0, p0, Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker;->mPhoneOnMode:Z

    .line 136
    iput v1, p0, Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker;->BCM_EVENT_SIM_ABSENT:I

    .line 137
    iput v0, p0, Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker;->BCM_EVENT_SIM_NETWORKLOCK:I

    .line 138
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker;->BCM_EVENT_SIM_LOCK:I

    .line 139
    new-instance v0, Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker$Lock;

    invoke-direct {v0, v2}, Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker$Lock;-><init>(Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker$1;)V

    iput-object v0, p0, Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker;->mLock:Ljava/lang/Object;

    .line 140
    iput-boolean v1, p0, Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker;->mLocaleChanged:Z

    .line 142
    iput-boolean v1, p0, Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker;->mMasterSimMode:Z

    .line 145
    iput-object v2, p0, Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker;->mccmnc_final:Ljava/lang/String;

    .line 150
    iput-boolean v1, p0, Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker;->StartQueryCallForwardStatus:Z

    .line 158
    iput-boolean v1, p0, Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker;->mHasPostedRadioPowerOnTimer:Z

    .line 159
    iput-object v2, p0, Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker;->mTelephonyManager:Landroid/telephony/TelephonyManager;

    .line 167
    new-instance v0, Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker$1;

    invoke-direct {v0, p0}, Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker$1;-><init>(Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker;)V

    iput-object v0, p0, Lcom/android/internal/telephony/gsm/MultiSimGsmServiceStateTracker;->mPhoneStateListener:Landroid/telephony/PhoneStateListener;

    .line 318
    return-void
.end method

.method private clearPowerOnTimer()V
    .registers 1

    .prologue
    .line 1140
    return-void
.end method


# virtual methods
.method public dispose()V
    .registers 1

    .prologue
    .line 321
    invoke-super {p0}, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;->dispose()V

    .line 327
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .registers 2
    .parameter "msg"

    .prologue
    .line 331
    invoke-super {p0, p1}, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;->handleMessage(Landroid/os/Message;)V

    .line 410
    return-void
.end method

.method protected handlePollStateResult(ILandroid/os/AsyncResult;)V
    .registers 3
    .parameter "what"
    .parameter "ar"

    .prologue
    .line 897
    invoke-super {p0, p1, p2}, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;->handlePollStateResult(ILandroid/os/AsyncResult;)V

    .line 1128
    return-void
.end method

.method protected isRoamingBetweenOperators(ZLandroid/telephony/ServiceState;)Z
    .registers 4
    .parameter "gsmRoaming"
    .parameter "s"

    .prologue
    .line 1161
    invoke-super {p0, p1, p2}, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;->isRoamingBetweenOperators(ZLandroid/telephony/ServiceState;)Z

    move-result v0

    return v0
.end method

.method protected setPowerStateToDesired()V
    .registers 1

    .prologue
    .line 414
    invoke-super {p0}, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;->setPowerStateToDesired()V

    .line 583
    return-void
.end method

.method public setRadioPowerOnNow()V
    .registers 1

    .prologue
    .line 1148
    return-void
.end method

.method protected updateChinaSpnDisplay(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .parameter "plmnValue"

    .prologue
    .line 1214
    invoke-super {p0, p1}, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;->updateChinaSpnDisplay(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected updateSpnDisplay()V
    .registers 1

    .prologue
    .line 605
    invoke-super {p0}, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;->updateSpnDisplay()V

    .line 890
    return-void
.end method
