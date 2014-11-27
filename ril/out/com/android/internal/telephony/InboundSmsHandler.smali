.class public abstract Lcom/android/internal/telephony/InboundSmsHandler;
.super Lcom/android/internal/util/StateMachine;
.source "InboundSmsHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/InboundSmsHandler$LmsPartCollector;,
        Lcom/android/internal/telephony/InboundSmsHandler$SmsBroadcastReceiver;,
        Lcom/android/internal/telephony/InboundSmsHandler$WaitingState;,
        Lcom/android/internal/telephony/InboundSmsHandler$DeliveringState;,
        Lcom/android/internal/telephony/InboundSmsHandler$IdleState;,
        Lcom/android/internal/telephony/InboundSmsHandler$StartupState;,
        Lcom/android/internal/telephony/InboundSmsHandler$DefaultState;
    }
.end annotation


# static fields
.field private static final ACTION_AT_CMSS_COMPLETE:Ljava/lang/String; = "android.intent.action.AT_CMSS_COMPLETE"

.field private static final ACTION_BCS_REQUEST:Ljava/lang/String; = "android.intent.action.BCS_REQUEST"

.field private static final ACTION_BCS_RESPONSE:Ljava/lang/String; = "android.intent.action.BCS_RESPONSE"

.field static final ADDRESS_COLUMN:I = 0x6

.field static final COUNT_COLUMN:I = 0x5

#the value of this static final field might be set in the static constructor
.field private static final CSCFEATURE_RIL_LMS_REASSEMBLE_TIMEOUTS_CTC:Z = false

.field static final DATE_COLUMN:I = 0x3

.field protected static final DBG:Z = true

.field private static final DELIMITER:B = 0xbt

.field static final DESTINATION_PORT_COLUMN:I = 0x2

.field static final EVENT_BROADCAST_COMPLETE:I = 0x3

.field static final EVENT_BROADCAST_SMS:I = 0x2

.field public static final EVENT_NEW_SMS:I = 0x1

.field protected static final EVENT_REASSEMBLE_TIMEOUT:I = 0x17

.field static final EVENT_RELEASE_WAKELOCK:I = 0x5

.field static final EVENT_RETURN_TO_IDLE:I = 0x4

.field static final EVENT_START_ACCEPTING_SMS:I = 0x6

.field protected static final EVENT_STOP_REASSEMBLE:I = 0x18

.field static final EVENT_UPDATE_PHONE_OBJECT:I = 0x7

.field public static final EVENT_WRITE_SMS_COMPLETE:I = 0x8

.field static final ID_COLUMN:I = 0x7

.field static final PDU_COLUMN:I = 0x0

.field private static final PDU_PROJECTION:[Ljava/lang/String; = null

.field private static final PDU_SEQUENCE_PORT_PROJECTION:[Ljava/lang/String; = null

.field protected static final RAW_PROJECTION:[Ljava/lang/String; = null

.field private static final REASSEMBLE_TIMEOUT:I = 0x493e0

.field static final REFERENCE_NUMBER_COLUMN:I = 0x4

.field static final SELECT_BY_ID:Ljava/lang/String; = "_id=?"

.field static final SELECT_BY_REFERENCE:Ljava/lang/String; = "address=? AND reference_number=? AND count=?"

.field static final SEQUENCE_COLUMN:I = 0x1

.field private static final SKT_CARRIERLOCK_MODE_FILE:Ljava/lang/String; = "/efs/sms/sktcarrierlockmode"

.field private static final SKT_CARRIERLOCK_MODE_FOLDER:Ljava/lang/String; = "/efs/sms"

.field private static final SMS_GARBAGE_COLLECTION_TIME:J = 0x927c0L

.field private static final SMS_GARBAGE_COLLECTION_TIME_CHN:J = 0xa4cb800L

.field private static final TAG:Ljava/lang/String; = "InboundSmsHandler"

.field private static final VDBG:Z = false

.field private static final WAKELOCK_TIMEOUT:I = 0xbb8

.field protected static final WAKE_LOCK_TIMEOUT:I = 0x1388

.field private static gcf_flag:Z

.field private static mFormat:Ljava/lang/String;

.field protected static final mRawUri:Landroid/net/Uri;

.field private static final sRawUri:Landroid/net/Uri;

.field private static sReassembleRef:I


# instance fields
.field private mApplicationID:Ljava/lang/String;

.field private mApplicationName:Ljava/lang/String;

.field private mApplicationSpecificData:[B

.field private mBlockedSmsMmsReceiver:Landroid/content/BroadcastReceiver;

.field protected mCellBroadcastHandler:Lcom/android/internal/telephony/CellBroadcastHandler;

.field protected final mCi:Lcom/android/internal/telephony/CommandsInterface;

.field private mCommand:Ljava/lang/String;

.field protected final mContext:Landroid/content/Context;

.field final mDefaultState:Lcom/android/internal/telephony/InboundSmsHandler$DefaultState;

.field final mDeliveringState:Lcom/android/internal/telephony/InboundSmsHandler$DeliveringState;

.field mHandler:Landroid/os/Handler;

.field final mIdleState:Lcom/android/internal/telephony/InboundSmsHandler$IdleState;

.field protected mLatestSmsAddress:Ljava/lang/String;

.field protected mLatestSmsTimestamp:Ljava/lang/String;

.field protected mLatestSmsType:Ljava/lang/String;

.field protected final mLmsAssemblyTracker:Lcom/android/internal/telephony/LmsAssemblyTrackerCTC;

.field protected mPhone:Lcom/android/internal/telephony/PhoneBase;

.field protected final mResolver:Landroid/content/ContentResolver;

.field protected mSegmentedSmsCount:I

.field private final mSmsReceiveDisabled:Z

.field final mStartupState:Lcom/android/internal/telephony/InboundSmsHandler$StartupState;

.field protected mStorageMonitor:Lcom/android/internal/telephony/SmsStorageMonitor;

.field private mUI:Ljava/lang/String;

.field final mWaitingState:Lcom/android/internal/telephony/InboundSmsHandler$WaitingState;

.field final mWakeLock:Landroid/os/PowerManager$WakeLock;

.field protected final mWapPush:Lcom/android/internal/telephony/WapPushOverSms;

.field protected misWapPush:Z


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 139
    new-array v0, v3, [Ljava/lang/String;

    const-string v1, "pdu"

    aput-object v1, v0, v2

    sput-object v0, Lcom/android/internal/telephony/InboundSmsHandler;->PDU_PROJECTION:[Ljava/lang/String;

    .line 144
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "pdu"

    aput-object v1, v0, v2

    const-string v1, "sequence"

    aput-object v1, v0, v3

    const-string v1, "destination_port"

    aput-object v1, v0, v4

    sput-object v0, Lcom/android/internal/telephony/InboundSmsHandler;->PDU_SEQUENCE_PORT_PROJECTION:[Ljava/lang/String;

    .line 192
    sget-object v0, Landroid/provider/Telephony$Sms;->CONTENT_URI:Landroid/net/Uri;

    const-string v1, "raw"

    invoke-static {v0, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/internal/telephony/InboundSmsHandler;->sRawUri:Landroid/net/Uri;

    .line 232
    sget-object v0, Landroid/provider/Telephony$Sms;->CONTENT_URI:Landroid/net/Uri;

    const-string v1, "raw"

    invoke-static {v0, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/internal/telephony/InboundSmsHandler;->mRawUri:Landroid/net/Uri;

    .line 235
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "pdu"

    aput-object v1, v0, v2

    const-string v1, "reference_number"

    aput-object v1, v0, v3

    const-string v1, "sequence"

    aput-object v1, v0, v4

    const-string v1, "destination_port"

    aput-object v1, v0, v5

    sput-object v0, Lcom/android/internal/telephony/InboundSmsHandler;->RAW_PROJECTION:[Ljava/lang/String;

    .line 257
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    const/16 v1, 0x100

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    sput v0, Lcom/android/internal/telephony/InboundSmsHandler;->sReassembleRef:I

    .line 264
    const-string v0, "unknown"

    sput-object v0, Lcom/android/internal/telephony/InboundSmsHandler;->mFormat:Ljava/lang/String;

    .line 274
    sput-boolean v2, Lcom/android/internal/telephony/InboundSmsHandler;->gcf_flag:Z

    .line 285
    const-string v0, "ReassembleTimeout"

    invoke-static {}, Lcom/sec/android/app/CscFeature;->getInstance()Lcom/sec/android/app/CscFeature;

    move-result-object v1

    const-string v2, "CscFeature_RIL_DisplayPolicyPartialLongSms"

    invoke-virtual {v1, v2}, Lcom/sec/android/app/CscFeature;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/internal/telephony/InboundSmsHandler;->CSCFEATURE_RIL_LMS_REASSEMBLE_TIMEOUTS_CTC:Z

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Landroid/content/Context;Lcom/android/internal/telephony/SmsStorageMonitor;Lcom/android/internal/telephony/PhoneBase;Lcom/android/internal/telephony/CellBroadcastHandler;)V
    .registers 13
    .parameter "name"
    .parameter "context"
    .parameter "storageMonitor"
    .parameter "phone"
    .parameter "cellBroadcastHandler"

    .prologue
    const/4 v3, 0x1

    const/4 v6, 0x0

    const/4 v2, 0x0

    .line 296
    invoke-direct {p0, p1}, Lcom/android/internal/util/StateMachine;-><init>(Ljava/lang/String;)V

    .line 208
    new-instance v4, Lcom/android/internal/telephony/InboundSmsHandler$DefaultState;

    invoke-direct {v4, p0}, Lcom/android/internal/telephony/InboundSmsHandler$DefaultState;-><init>(Lcom/android/internal/telephony/InboundSmsHandler;)V

    iput-object v4, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mDefaultState:Lcom/android/internal/telephony/InboundSmsHandler$DefaultState;

    .line 211
    new-instance v4, Lcom/android/internal/telephony/InboundSmsHandler$StartupState;

    invoke-direct {v4, p0}, Lcom/android/internal/telephony/InboundSmsHandler$StartupState;-><init>(Lcom/android/internal/telephony/InboundSmsHandler;)V

    iput-object v4, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mStartupState:Lcom/android/internal/telephony/InboundSmsHandler$StartupState;

    .line 214
    new-instance v4, Lcom/android/internal/telephony/InboundSmsHandler$IdleState;

    invoke-direct {v4, p0}, Lcom/android/internal/telephony/InboundSmsHandler$IdleState;-><init>(Lcom/android/internal/telephony/InboundSmsHandler;)V

    iput-object v4, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mIdleState:Lcom/android/internal/telephony/InboundSmsHandler$IdleState;

    .line 217
    new-instance v4, Lcom/android/internal/telephony/InboundSmsHandler$DeliveringState;

    invoke-direct {v4, p0}, Lcom/android/internal/telephony/InboundSmsHandler$DeliveringState;-><init>(Lcom/android/internal/telephony/InboundSmsHandler;)V

    iput-object v4, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mDeliveringState:Lcom/android/internal/telephony/InboundSmsHandler$DeliveringState;

    .line 220
    new-instance v4, Lcom/android/internal/telephony/InboundSmsHandler$WaitingState;

    invoke-direct {v4, p0}, Lcom/android/internal/telephony/InboundSmsHandler$WaitingState;-><init>(Lcom/android/internal/telephony/InboundSmsHandler;)V

    iput-object v4, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mWaitingState:Lcom/android/internal/telephony/InboundSmsHandler$WaitingState;

    .line 259
    const-string v4, "latest_sms_address"

    iput-object v4, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mLatestSmsAddress:Ljava/lang/String;

    .line 261
    const-string v4, "latest_sms_timestamp"

    iput-object v4, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mLatestSmsTimestamp:Ljava/lang/String;

    .line 263
    const-string v4, "latest_sms_type"

    iput-object v4, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mLatestSmsType:Ljava/lang/String;

    .line 265
    iput v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mSegmentedSmsCount:I

    .line 273
    iput-boolean v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->misWapPush:Z

    .line 2336
    new-instance v4, Lcom/android/internal/telephony/InboundSmsHandler$1;

    invoke-direct {v4, p0}, Lcom/android/internal/telephony/InboundSmsHandler$1;-><init>(Lcom/android/internal/telephony/InboundSmsHandler;)V

    iput-object v4, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mHandler:Landroid/os/Handler;

    .line 2356
    new-instance v4, Lcom/android/internal/telephony/InboundSmsHandler$2;

    invoke-direct {v4, p0}, Lcom/android/internal/telephony/InboundSmsHandler$2;-><init>(Lcom/android/internal/telephony/InboundSmsHandler;)V

    iput-object v4, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mBlockedSmsMmsReceiver:Landroid/content/BroadcastReceiver;

    .line 298
    iput-object p2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mContext:Landroid/content/Context;

    .line 299
    iput-object p3, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mStorageMonitor:Lcom/android/internal/telephony/SmsStorageMonitor;

    .line 300
    iput-object p4, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    .line 301
    iget-object v4, p4, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    iput-object v4, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    .line 302
    iput-object p5, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mCellBroadcastHandler:Lcom/android/internal/telephony/CellBroadcastHandler;

    .line 303
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    iput-object v4, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mResolver:Landroid/content/ContentResolver;

    .line 304
    new-instance v4, Lcom/android/internal/telephony/WapPushOverSms;

    invoke-direct {v4, p2}, Lcom/android/internal/telephony/WapPushOverSms;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mWapPush:Lcom/android/internal/telephony/WapPushOverSms;

    .line 306
    iget-object v4, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x111003d

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    .line 308
    .local v1, smsCapable:Z
    const-string v4, "telephony.sms.receive"

    invoke-static {v4, v1}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    if-nez v4, :cond_76

    move v2, v3

    :cond_76
    iput-boolean v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mSmsReceiveDisabled:Z

    .line 311
    iget-object v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mContext:Landroid/content/Context;

    const-string v4, "power"

    invoke-virtual {v2, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    .line 312
    .local v0, pm:Landroid/os/PowerManager;
    invoke-virtual {v0, v3, p1}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v2

    iput-object v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    .line 313
    iget-object v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v2}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 315
    iget-object v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mDefaultState:Lcom/android/internal/telephony/InboundSmsHandler$DefaultState;

    invoke-virtual {p0, v2}, Lcom/android/internal/util/StateMachine;->addState(Lcom/android/internal/util/State;)V

    .line 316
    iget-object v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mStartupState:Lcom/android/internal/telephony/InboundSmsHandler$StartupState;

    iget-object v3, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mDefaultState:Lcom/android/internal/telephony/InboundSmsHandler$DefaultState;

    invoke-virtual {p0, v2, v3}, Lcom/android/internal/util/StateMachine;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    .line 317
    iget-object v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mIdleState:Lcom/android/internal/telephony/InboundSmsHandler$IdleState;

    iget-object v3, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mDefaultState:Lcom/android/internal/telephony/InboundSmsHandler$DefaultState;

    invoke-virtual {p0, v2, v3}, Lcom/android/internal/util/StateMachine;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    .line 318
    iget-object v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mDeliveringState:Lcom/android/internal/telephony/InboundSmsHandler$DeliveringState;

    iget-object v3, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mDefaultState:Lcom/android/internal/telephony/InboundSmsHandler$DefaultState;

    invoke-virtual {p0, v2, v3}, Lcom/android/internal/util/StateMachine;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    .line 319
    iget-object v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mWaitingState:Lcom/android/internal/telephony/InboundSmsHandler$WaitingState;

    iget-object v3, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mDeliveringState:Lcom/android/internal/telephony/InboundSmsHandler$DeliveringState;

    invoke-virtual {p0, v2, v3}, Lcom/android/internal/util/StateMachine;->addState(Lcom/android/internal/util/State;Lcom/android/internal/util/State;)V

    .line 321
    iget-object v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mStartupState:Lcom/android/internal/telephony/InboundSmsHandler$StartupState;

    invoke-virtual {p0, v2}, Lcom/android/internal/util/StateMachine;->setInitialState(Lcom/android/internal/util/State;)V

    .line 324
    iget-object v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mBlockedSmsMmsReceiver:Landroid/content/BroadcastReceiver;

    new-instance v4, Landroid/content/IntentFilter;

    const-string v5, "com.android.server.enterprise.restriction.SEND_BLOCKED_SMS"

    invoke-direct {v4, v5}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v5, "android.permission.sec.RECEIVE_BLOCKED_SMS_MMS"

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 326
    iget-object v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mBlockedSmsMmsReceiver:Landroid/content/BroadcastReceiver;

    new-instance v4, Landroid/content/IntentFilter;

    const-string v5, "com.android.server.enterprise.restriction.SEND_BLOCKED_MMS"

    invoke-direct {v4, v5}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v5, "android.permission.sec.RECEIVE_BLOCKED_SMS_MMS"

    invoke-virtual {v2, v3, v4, v5, v6}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 331
    sget-boolean v2, Lcom/android/internal/telephony/InboundSmsHandler;->CSCFEATURE_RIL_LMS_REASSEMBLE_TIMEOUTS_CTC:Z

    if-eqz v2, :cond_e6

    .line 332
    new-instance v2, Lcom/android/internal/telephony/LmsAssemblyTrackerCTC;

    iget-object v3, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mContext:Landroid/content/Context;

    invoke-direct {v2, v3, p0}, Lcom/android/internal/telephony/LmsAssemblyTrackerCTC;-><init>(Landroid/content/Context;Lcom/android/internal/telephony/InboundSmsHandler;)V

    iput-object v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mLmsAssemblyTracker:Lcom/android/internal/telephony/LmsAssemblyTrackerCTC;

    .line 337
    :goto_e0
    const-string v2, "created InboundSmsHandler"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/InboundSmsHandler;->log(Ljava/lang/String;)V

    .line 338
    return-void

    .line 334
    :cond_e6
    iput-object v6, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mLmsAssemblyTracker:Lcom/android/internal/telephony/LmsAssemblyTrackerCTC;

    goto :goto_e0
.end method

.method static synthetic access$000(Lcom/android/internal/telephony/InboundSmsHandler;Landroid/os/Message;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 134
    invoke-virtual {p0, p1}, Lcom/android/internal/util/StateMachine;->deferMessage(Landroid/os/Message;)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/internal/telephony/InboundSmsHandler;Lcom/android/internal/util/IState;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 134
    invoke-virtual {p0, p1}, Lcom/android/internal/util/StateMachine;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void
.end method

.method static synthetic access$200(Lcom/android/internal/telephony/InboundSmsHandler;Landroid/os/Message;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 134
    invoke-virtual {p0, p1}, Lcom/android/internal/util/StateMachine;->deferMessage(Landroid/os/Message;)V

    return-void
.end method

.method static synthetic access$300(Lcom/android/internal/telephony/InboundSmsHandler;Lcom/android/internal/util/IState;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 134
    invoke-virtual {p0, p1}, Lcom/android/internal/util/StateMachine;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void
.end method

.method static synthetic access$400(Lcom/android/internal/telephony/InboundSmsHandler;Lcom/android/internal/util/IState;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 134
    invoke-virtual {p0, p1}, Lcom/android/internal/util/StateMachine;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void
.end method

.method static synthetic access$500(Lcom/android/internal/telephony/InboundSmsHandler;Lcom/android/internal/util/IState;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 134
    invoke-virtual {p0, p1}, Lcom/android/internal/util/StateMachine;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void
.end method

.method static synthetic access$600(Lcom/android/internal/telephony/InboundSmsHandler;Landroid/os/Message;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 134
    invoke-virtual {p0, p1}, Lcom/android/internal/util/StateMachine;->deferMessage(Landroid/os/Message;)V

    return-void
.end method

.method static synthetic access$700(Lcom/android/internal/telephony/InboundSmsHandler;Lcom/android/internal/util/IState;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 134
    invoke-virtual {p0, p1}, Lcom/android/internal/util/StateMachine;->transitionTo(Lcom/android/internal/util/IState;)V

    return-void
.end method

.method private addTrackerToRawTable(Lcom/android/internal/telephony/InboundSmsTracker;)I
    .registers 34
    .parameter "tracker"

    .prologue
    .line 1196
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getMessageCount()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_17a

    .line 1198
    const/4 v10, 0x0

    .line 1200
    .local v10, cursor:Landroid/database/Cursor;
    const-string v2, "ro.csc.sales_code"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v22

    .line 1204
    .local v22, sales_code:Ljava/lang/String;
    :try_start_e
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getSequenceNumber()I

    move-result v24

    .line 1207
    .local v24, sequence:I
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getAddress()Ljava/lang/String;

    move-result-object v8

    .line 1208
    .local v8, address:Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getReferenceNumber()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v19

    .line 1209
    .local v19, refNumber:Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getMessageCount()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    .line 1211
    .local v9, count:Ljava/lang/String;
    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v23

    .line 1214
    .local v23, seqNumber:Ljava/lang/String;
    const/4 v2, 0x3

    new-array v13, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v8, v13, v2

    const/4 v2, 0x1

    aput-object v19, v13, v2

    const/4 v2, 0x2

    aput-object v9, v13, v2

    .line 1215
    .local v13, deleteWhereArgs:[Ljava/lang/String;
    const-string v2, "address=? AND reference_number=? AND count=?"

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v13}, Lcom/android/internal/telephony/InboundSmsTracker;->setDeleteWhere(Ljava/lang/String;[Ljava/lang/String;)V

    .line 1230
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mResolver:Landroid/content/ContentResolver;

    sget-object v3, Lcom/android/internal/telephony/InboundSmsHandler;->sRawUri:Landroid/net/Uri;

    sget-object v4, Lcom/android/internal/telephony/InboundSmsHandler;->PDU_PROJECTION:[Ljava/lang/String;

    const-string v5, "address=? AND reference_number=? AND count=? AND sequence=?"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/String;

    const/4 v7, 0x0

    aput-object v8, v6, v7

    const/4 v7, 0x1

    aput-object v19, v6, v7

    const/4 v7, 0x2

    aput-object v9, v6, v7

    const/4 v7, 0x3

    aput-object v23, v6, v7

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 1235
    invoke-interface {v10}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_117

    .line 1236
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Discarding duplicate message segment, refNumber="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " seqNumber="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v23

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/internal/telephony/InboundSmsHandler;->loge(Ljava/lang/String;)V

    .line 1238
    const/4 v2, 0x0

    invoke-interface {v10, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v17

    .line 1239
    .local v17, oldPduString:Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getPdu()[B

    move-result-object v18

    .line 1240
    .local v18, pdu:[B
    invoke-static/range {v17 .. v17}, Lcom/android/internal/util/HexDump;->hexStringToByteArray(Ljava/lang/String;)[B

    move-result-object v16

    .line 1241
    .local v16, oldPdu:[B
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getPdu()[B

    move-result-object v2

    move-object/from16 v0, v16

    invoke-static {v0, v2}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v2

    if-nez v2, :cond_1ef

    .line 1243
    const-string v2, "CHN"

    move-object/from16 v0, v22

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_d2

    const-string v2, "CHU"

    move-object/from16 v0, v22

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_d2

    const-string v2, "CHM"

    move-object/from16 v0, v22

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_d2

    const-string v2, "CHC"

    move-object/from16 v0, v22

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_d2

    const-string v2, "TGY"

    move-object/from16 v0, v22

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1c0

    .line 1244
    :cond_d2
    const-string v30, "address=? AND reference_number=? AND sequence=?"

    .line 1245
    .local v30, where:Ljava/lang/String;
    const/4 v2, 0x3

    new-array v0, v2, [Ljava/lang/String;

    move-object/from16 v31, v0

    const/4 v2, 0x0

    aput-object v8, v31, v2

    const/4 v2, 0x1

    aput-object v19, v31, v2

    const/4 v2, 0x2

    aput-object v23, v31, v2

    .line 1247
    .local v31, whereArgs:[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mResolver:Landroid/content/ContentResolver;

    sget-object v3, Lcom/android/internal/telephony/InboundSmsHandler;->mRawUri:Landroid/net/Uri;

    move-object/from16 v0, v30

    move-object/from16 v1, v31

    invoke-virtual {v2, v3, v0, v1}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 1248
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Warning: delete old segment. Dup message segment PDU of length "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v18

    array-length v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is different from existing PDU of length "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v16

    array-length v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/internal/telephony/InboundSmsHandler;->loge(Ljava/lang/String;)V

    .line 1260
    .end local v16           #oldPdu:[B
    .end local v17           #oldPduString:Ljava/lang/String;
    .end local v18           #pdu:[B
    .end local v30           #where:Ljava/lang/String;
    .end local v31           #whereArgs:[Ljava/lang/String;
    :cond_117
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 1264
    const-string v11, "address=? AND reference_number=? AND date < ?"

    .line 1265
    .local v11, del_where:Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getTimestamp()J

    move-result-wide v27

    .line 1266
    .local v27, timestamp:J
    const-wide/32 v2, 0x927c0

    sub-long v25, v27, v2

    .line 1267
    .local v25, timediff:J
    const-string v2, "CHN"

    move-object/from16 v0, v22

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_157

    const-string v2, "CHU"

    move-object/from16 v0, v22

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_157

    const-string v2, "CHM"

    move-object/from16 v0, v22

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_157

    const-string v2, "CHC"

    move-object/from16 v0, v22

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_157

    const-string v2, "TGY"

    move-object/from16 v0, v22

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_15c

    .line 1268
    :cond_157
    const-wide/32 v2, 0xa4cb800

    sub-long v25, v27, v2

    .line 1270
    :cond_15c
    const/4 v2, 0x3

    new-array v12, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v8, v12, v2

    const/4 v2, 0x1

    aput-object v19, v12, v2

    const/4 v2, 0x2

    invoke-static/range {v25 .. v26}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v12, v2

    .line 1271
    .local v12, del_whereArgs:[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mResolver:Landroid/content/ContentResolver;

    sget-object v3, Lcom/android/internal/telephony/InboundSmsHandler;->mRawUri:Landroid/net/Uri;

    invoke-virtual {v2, v3, v11, v12}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_175
    .catchall {:try_start_e .. :try_end_175} :catchall_205
    .catch Landroid/database/SQLException; {:try_start_e .. :try_end_175} :catch_1f6

    .line 1278
    if-eqz v10, :cond_17a

    .line 1279
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    .line 1284
    .end local v8           #address:Ljava/lang/String;
    .end local v9           #count:Ljava/lang/String;
    .end local v10           #cursor:Landroid/database/Cursor;
    .end local v11           #del_where:Ljava/lang/String;
    .end local v12           #del_whereArgs:[Ljava/lang/String;
    .end local v13           #deleteWhereArgs:[Ljava/lang/String;
    .end local v19           #refNumber:Ljava/lang/String;
    .end local v22           #sales_code:Ljava/lang/String;
    .end local v23           #seqNumber:Ljava/lang/String;
    .end local v24           #sequence:I
    .end local v25           #timediff:J
    .end local v27           #timestamp:J
    :cond_17a
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getContentValues()Landroid/content/ContentValues;

    move-result-object v29

    .line 1287
    .local v29, values:Landroid/content/ContentValues;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mResolver:Landroid/content/ContentResolver;

    sget-object v3, Lcom/android/internal/telephony/InboundSmsHandler;->sRawUri:Landroid/net/Uri;

    move-object/from16 v0, v29

    invoke-virtual {v2, v3, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v15

    .line 1288
    .local v15, newUri:Landroid/net/Uri;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "URI of new row -> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/internal/telephony/InboundSmsHandler;->log(Ljava/lang/String;)V

    .line 1291
    :try_start_1a2
    invoke-static {v15}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v20

    .line 1292
    .local v20, rowId:J
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getMessageCount()I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_1be

    .line 1294
    const-string v2, "_id=?"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static/range {v20 .. v21}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    move-object/from16 v0, p1

    invoke-virtual {v0, v2, v3}, Lcom/android/internal/telephony/InboundSmsTracker;->setDeleteWhere(Ljava/lang/String;[Ljava/lang/String;)V
    :try_end_1be
    .catch Ljava/lang/Exception; {:try_start_1a2 .. :try_end_1be} :catch_20c

    .line 1296
    :cond_1be
    const/4 v2, 0x1

    .line 1299
    .end local v15           #newUri:Landroid/net/Uri;
    .end local v20           #rowId:J
    .end local v29           #values:Landroid/content/ContentValues;
    :cond_1bf
    :goto_1bf
    return v2

    .line 1252
    .restart local v8       #address:Ljava/lang/String;
    .restart local v9       #count:Ljava/lang/String;
    .restart local v10       #cursor:Landroid/database/Cursor;
    .restart local v13       #deleteWhereArgs:[Ljava/lang/String;
    .restart local v16       #oldPdu:[B
    .restart local v17       #oldPduString:Ljava/lang/String;
    .restart local v18       #pdu:[B
    .restart local v19       #refNumber:Ljava/lang/String;
    .restart local v22       #sales_code:Ljava/lang/String;
    .restart local v23       #seqNumber:Ljava/lang/String;
    .restart local v24       #sequence:I
    :cond_1c0
    :try_start_1c0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Warning: dup message segment PDU of length "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v18

    array-length v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is different from existing PDU of length "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, v16

    array-length v3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/internal/telephony/InboundSmsHandler;->loge(Ljava/lang/String;)V
    :try_end_1e8
    .catchall {:try_start_1c0 .. :try_end_1e8} :catchall_205
    .catch Landroid/database/SQLException; {:try_start_1c0 .. :try_end_1e8} :catch_1f6

    .line 1254
    const/4 v2, 0x5

    .line 1278
    if-eqz v10, :cond_1bf

    .line 1279
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    goto :goto_1bf

    .line 1257
    :cond_1ef
    const/4 v2, 0x5

    .line 1278
    if-eqz v10, :cond_1bf

    .line 1279
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    goto :goto_1bf

    .line 1274
    .end local v8           #address:Ljava/lang/String;
    .end local v9           #count:Ljava/lang/String;
    .end local v13           #deleteWhereArgs:[Ljava/lang/String;
    .end local v16           #oldPdu:[B
    .end local v17           #oldPduString:Ljava/lang/String;
    .end local v18           #pdu:[B
    .end local v19           #refNumber:Ljava/lang/String;
    .end local v23           #seqNumber:Ljava/lang/String;
    .end local v24           #sequence:I
    :catch_1f6
    move-exception v14

    .line 1275
    .local v14, e:Landroid/database/SQLException;
    :try_start_1f7
    const-string v2, "Can\'t access multipart SMS database"

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v14}, Lcom/android/internal/telephony/InboundSmsHandler;->loge(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1fe
    .catchall {:try_start_1f7 .. :try_end_1fe} :catchall_205

    .line 1276
    const/4 v2, 0x2

    .line 1278
    if-eqz v10, :cond_1bf

    .line 1279
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    goto :goto_1bf

    .line 1278
    .end local v14           #e:Landroid/database/SQLException;
    :catchall_205
    move-exception v2

    if-eqz v10, :cond_20b

    .line 1279
    invoke-interface {v10}, Landroid/database/Cursor;->close()V

    :cond_20b
    throw v2

    .line 1297
    .end local v10           #cursor:Landroid/database/Cursor;
    .end local v22           #sales_code:Ljava/lang/String;
    .restart local v15       #newUri:Landroid/net/Uri;
    .restart local v29       #values:Landroid/content/ContentValues;
    :catch_20c
    move-exception v14

    .line 1298
    .local v14, e:Ljava/lang/Exception;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "error parsing URI for new row: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2, v14}, Lcom/android/internal/telephony/InboundSmsHandler;->loge(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1299
    const/4 v2, 0x2

    goto :goto_1bf
.end method

.method public static getCDMASmsReassembly()Z
    .registers 4

    .prologue
    .line 2189
    const/4 v0, 0x0

    .line 2190
    .local v0, onOff:Z
    const-string v1, "ril.sms.reassembly"

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    .line 2191
    const-string v1, "InboundSmsHandler"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getCDMASmsReassembly = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 2192
    return v0
.end method

.method protected static getNextReassembleRef()I
    .registers 1

    .prologue
    .line 2196
    sget v0, Lcom/android/internal/telephony/InboundSmsHandler;->sReassembleRef:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/android/internal/telephony/InboundSmsHandler;->sReassembleRef:I

    .line 2197
    sget v0, Lcom/android/internal/telephony/InboundSmsHandler;->sReassembleRef:I

    return v0
.end method

.method static isCurrentFormat3gpp2()Z
    .registers 2

    .prologue
    .line 1308
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/telephony/TelephonyManager;->getCurrentPhoneType()I

    move-result v0

    .line 1309
    .local v0, activePhone:I
    const/4 v1, 0x2

    if-ne v1, v0, :cond_d

    const/4 v1, 0x1

    :goto_c
    return v1

    :cond_d
    const/4 v1, 0x0

    goto :goto_c
.end method


# virtual methods
.method protected KddiDispatchBroadcastMessage(Landroid/content/Intent;)V
    .registers 3
    .parameter "intent"

    .prologue
    .line 2155
    iget-object v0, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 2156
    return-void
.end method

.method protected accountSMStoMDM(ILcom/android/internal/telephony/SmsMessageBase;)V
    .registers 13
    .parameter "result"
    .parameter "smsb"

    .prologue
    const/4 v9, 0x1

    .line 676
    const/4 v6, 0x2

    if-eq p1, v6, :cond_48

    if-eqz p2, :cond_48

    .line 677
    invoke-virtual {p2}, Lcom/android/internal/telephony/SmsMessageBase;->getUserDataHeader()Lcom/android/internal/telephony/SmsHeader;

    move-result-object v4

    .line 678
    .local v4, smsHeader:Lcom/android/internal/telephony/SmsHeader;
    const/4 v3, 0x0

    .line 680
    .local v3, isWapPush:Z
    if-eqz v4, :cond_1a

    iget-object v6, v4, Lcom/android/internal/telephony/SmsHeader;->portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    if-eqz v6, :cond_1a

    const/16 v6, 0xb84

    iget-object v7, v4, Lcom/android/internal/telephony/SmsHeader;->portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    iget v7, v7, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->destPort:I

    if-ne v6, v7, :cond_1a

    .line 681
    const/4 v3, 0x1

    .line 684
    :cond_1a
    invoke-virtual {p2}, Lcom/android/internal/telephony/SmsMessageBase;->getMessageBody()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_49

    .line 685
    invoke-virtual {p2}, Lcom/android/internal/telephony/SmsMessageBase;->getOriginatingAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2}, Lcom/android/internal/telephony/SmsMessageBase;->getTimestampMillis()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p2}, Lcom/android/internal/telephony/SmsMessageBase;->getMessageBody()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v6, v7, v8, v9}, Lcom/android/internal/telephony/InboundSmsHandler;->storeSMS(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 701
    :cond_33
    :goto_33
    if-nez v3, :cond_48

    .line 702
    invoke-static {}, Landroid/sec/enterprise/EnterpriseDeviceManager;->getInstance()Landroid/sec/enterprise/EnterpriseDeviceManager;

    move-result-object v6

    invoke-virtual {v6}, Landroid/sec/enterprise/EnterpriseDeviceManager;->getPhoneRestrictionPolicy()Landroid/sec/enterprise/PhoneRestrictionPolicy;

    move-result-object v1

    .line 703
    .local v1, edm:Landroid/sec/enterprise/PhoneRestrictionPolicy;
    if-eqz v1, :cond_48

    invoke-virtual {v1}, Landroid/sec/enterprise/PhoneRestrictionPolicy;->isLimitNumberOfSmsEnabled()Z

    move-result v6

    if-eqz v6, :cond_48

    .line 704
    invoke-virtual {v1}, Landroid/sec/enterprise/PhoneRestrictionPolicy;->addNumberOfIncomingSms()Z

    .line 708
    .end local v1           #edm:Landroid/sec/enterprise/PhoneRestrictionPolicy;
    .end local v3           #isWapPush:Z
    .end local v4           #smsHeader:Lcom/android/internal/telephony/SmsHeader;
    :cond_48
    return-void

    .line 686
    .restart local v3       #isWapPush:Z
    .restart local v4       #smsHeader:Lcom/android/internal/telephony/SmsHeader;
    :cond_49
    if-eqz v3, :cond_33

    .line 688
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 689
    .local v5, wapSms:Ljava/lang/StringBuilder;
    invoke-virtual {p2}, Lcom/android/internal/telephony/SmsMessageBase;->getUserData()[B

    move-result-object v0

    .line 690
    .local v0, array:[B
    if-eqz v0, :cond_33

    .line 691
    const/4 v2, 0x0

    .local v2, i:I
    :goto_57
    array-length v6, v0

    if-ge v2, v6, :cond_63

    .line 692
    aget-byte v6, v0, v2

    int-to-char v6, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 691
    add-int/lit8 v2, v2, 0x1

    goto :goto_57

    .line 694
    :cond_63
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-eqz v6, :cond_33

    .line 695
    invoke-virtual {p2}, Lcom/android/internal/telephony/SmsMessageBase;->getOriginatingAddress()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p2}, Lcom/android/internal/telephony/SmsMessageBase;->getTimestampMillis()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v6, v7, v8, v9}, Lcom/android/internal/telephony/InboundSmsHandler;->storeSMS(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_33
.end method

.method protected abstract acknowledgeLastIncomingSms(ZILandroid/os/Message;)V
.end method

.method protected addTrackerToRawTableAndSendMessage(Lcom/android/internal/telephony/InboundSmsTracker;)I
    .registers 5
    .parameter "tracker"

    .prologue
    const/4 v1, 0x2

    const/4 v0, 0x1

    .line 926
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/InboundSmsHandler;->addTrackerToRawTable(Lcom/android/internal/telephony/InboundSmsTracker;)I

    move-result v2

    sparse-switch v2, :sswitch_data_10

    move v0, v1

    .line 936
    :goto_a
    :sswitch_a
    return v0

    .line 928
    :sswitch_b
    invoke-virtual {p0, v1, p1}, Lcom/android/internal/util/StateMachine;->sendMessage(ILjava/lang/Object;)V

    goto :goto_a

    .line 926
    nop

    :sswitch_data_10
    .sparse-switch
        0x1 -> :sswitch_b
        0x5 -> :sswitch_a
    .end sparse-switch
.end method

.method protected checkDuplicatedOmadmPort([BLcom/android/internal/telephony/SmsHeader;)Z
    .registers 11
    .parameter "userData"
    .parameter "smsHeader"

    .prologue
    const/4 v7, 0x4

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1482
    if-eqz p2, :cond_96

    iget-object v5, p2, Lcom/android/internal/telephony/SmsHeader;->portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    if-eqz v5, :cond_96

    .line 1483
    iget-object v5, p2, Lcom/android/internal/telephony/SmsHeader;->portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    iget v5, v5, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->destPort:I

    const/16 v6, 0xb84

    if-ne v5, v6, :cond_96

    iget-object v5, p2, Lcom/android/internal/telephony/SmsHeader;->concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    iget v5, v5, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->seqNumber:I

    if-ne v5, v3, :cond_96

    .line 1485
    new-array v1, v7, [B

    .line 1487
    .local v1, garbageData:[B
    invoke-static {p1, v4, v1, v4, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1489
    const/4 v2, 0x0

    .line 1490
    .local v2, oPort:I
    iget-object v5, p2, Lcom/android/internal/telephony/SmsHeader;->portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    iget-boolean v5, v5, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->areEightBits:Z

    if-nez v5, :cond_96

    .line 1491
    aget-byte v5, v1, v4

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x8

    aget-byte v6, v1, v3

    and-int/lit16 v6, v6, 0xff

    or-int v2, v5, v6

    .line 1492
    const/4 v5, 0x2

    aget-byte v5, v1, v5

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x8

    const/4 v6, 0x3

    aget-byte v6, v1, v6

    and-int/lit16 v6, v6, 0xff

    or-int v0, v5, v6

    .line 1494
    .local v0, dPort:I
    const-string v5, "InboundSmsHandler"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "dPort : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " oPort : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1495
    const-string v5, "InboundSmsHandler"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "destPort : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p2, Lcom/android/internal/telephony/SmsHeader;->portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    iget v7, v7, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->destPort:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " origPort : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p2, Lcom/android/internal/telephony/SmsHeader;->portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    iget v7, v7, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->origPort:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1496
    iget-object v5, p2, Lcom/android/internal/telephony/SmsHeader;->portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    iget v5, v5, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->destPort:I

    if-ne v0, v5, :cond_96

    iget-object v5, p2, Lcom/android/internal/telephony/SmsHeader;->portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    iget v5, v5, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->origPort:I

    if-ne v2, v5, :cond_96

    .line 1502
    .end local v0           #dPort:I
    .end local v1           #garbageData:[B
    .end local v2           #oPort:I
    :goto_95
    return v3

    :cond_96
    move v3, v4

    goto :goto_95
.end method

.method public abstract checkImeiTrackerMessage(Ljava/lang/String;)Z
.end method

.method deleteFromRawTable(Ljava/lang/String;[Ljava/lang/String;)V
    .registers 6
    .parameter "deleteWhere"
    .parameter "deleteWhereArgs"

    .prologue
    .line 1177
    iget-object v1, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mResolver:Landroid/content/ContentResolver;

    sget-object v2, Lcom/android/internal/telephony/InboundSmsHandler;->sRawUri:Landroid/net/Uri;

    invoke-virtual {v1, v2, p1, p2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 1178
    .local v0, rows:I
    if-nez v0, :cond_10

    .line 1179
    const-string v1, "No rows were deleted from raw table!"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/InboundSmsHandler;->loge(Ljava/lang/String;)V

    .line 1183
    :goto_f
    return-void

    .line 1181
    :cond_10
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Deleted "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " rows from raw table."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/InboundSmsHandler;->log(Ljava/lang/String;)V

    goto :goto_f
.end method

.method public dispatch(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V
    .registers 8
    .parameter "intent"
    .parameter "permission"
    .parameter "appOp"
    .parameter "resultReceiver"

    .prologue
    .line 1518
    iget-object v0, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    const-wide/16 v1, 0x1388

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager$WakeLock;->acquire(J)V

    .line 1521
    return-void
.end method

.method protected dispatchAppDirectedSMS(Landroid/content/ComponentName;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 9
    .parameter "componentName"
    .parameter "appdirectedSMS"
    .parameter "appPrefix"
    .parameter "originAddress"

    .prologue
    .line 1680
    const-string v1, "InboundSmsHandler"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dispatchAppDirectedSMS"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1682
    new-instance v0, Landroid/content/Intent;

    const-string v1, "verizon.intent.action.DIRECTED_SMS_RECEIVED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1683
    .local v0, intent:Landroid/content/Intent;
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1684
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1685
    const-string v1, "parameters"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1686
    const-string v1, "originator"

    invoke-virtual {v0, v1, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1687
    const-string v1, "prefix"

    invoke-virtual {v0, v1, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1688
    iget-object v1, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1689
    return-void
.end method

.method protected dispatchAppSMSforSPR(Ljava/lang/String;[[B)V
    .registers 6
    .parameter "packageName"
    .parameter "pdus"

    .prologue
    .line 1661
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.provider.Telephony.SMS_RECEIVED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1662
    .local v0, intent:Landroid/content/Intent;
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 1663
    const-string v1, "pdus"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 1664
    const-string v1, "format"

    invoke-virtual {p0}, Lcom/android/internal/telephony/InboundSmsHandler;->getFormat()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1665
    const-string v1, "simSlot"

    iget-object v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1666
    invoke-virtual {v0, p1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 1667
    iget-object v1, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mContext:Landroid/content/Context;

    const-string v2, "android.permission.RECEIVE_SMS"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 1668
    return-void
.end method

.method protected dispatchBlockedSms([BI)V
    .registers 11
    .parameter "pdu"
    .parameter "sendType"

    .prologue
    const/4 v1, 0x1

    .line 2393
    invoke-static {p1}, Landroid/telephony/SmsMessage;->createFromPdu([B)Landroid/telephony/SmsMessage;

    move-result-object v7

    .line 2394
    .local v7, sms:Landroid/telephony/SmsMessage;
    invoke-static {}, Landroid/sec/enterprise/EnterpriseDeviceManager;->getInstance()Landroid/sec/enterprise/EnterpriseDeviceManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/sec/enterprise/EnterpriseDeviceManager;->getPhoneRestrictionPolicy()Landroid/sec/enterprise/PhoneRestrictionPolicy;

    move-result-object v0

    .line 2397
    .local v0, phoneRestriction:Landroid/sec/enterprise/PhoneRestrictionPolicy;
    invoke-virtual {v0}, Landroid/sec/enterprise/PhoneRestrictionPolicy;->isBlockSmsWithStorageEnabled()Z

    move-result v2

    if-eqz v2, :cond_20

    .line 2399
    iget-object v2, v7, Landroid/telephony/SmsMessage;->mWrappedSmsMessage:Lcom/android/internal/telephony/SmsMessageBase;

    invoke-virtual {v2}, Lcom/android/internal/telephony/SmsMessageBase;->getDisplayOriginatingAddress()Ljava/lang/String;

    move-result-object v3

    .line 2400
    .local v3, srcAddress:Ljava/lang/String;
    const/4 v5, 0x0

    move-object v2, p1

    move v4, p2

    invoke-virtual/range {v0 .. v5}, Landroid/sec/enterprise/PhoneRestrictionPolicy;->storeBlockedSmsMms(Z[BLjava/lang/String;ILjava/lang/String;)V

    .line 2418
    .end local v3           #srcAddress:Ljava/lang/String;
    :cond_1f
    :goto_1f
    return-void

    .line 2403
    :cond_20
    iget-object v2, v7, Landroid/telephony/SmsMessage;->mWrappedSmsMessage:Lcom/android/internal/telephony/SmsMessageBase;

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchNormalMessage(Lcom/android/internal/telephony/SmsMessageBase;)I

    move-result v6

    .line 2405
    .local v6, result:I
    const/4 v2, -0x1

    if-eq v6, v2, :cond_2b

    if-ne v6, v1, :cond_1f

    .line 2407
    :cond_2b
    invoke-virtual {v0}, Landroid/sec/enterprise/PhoneRestrictionPolicy;->isLimitNumberOfSmsEnabled()Z

    move-result v2

    if-eqz v2, :cond_3b

    .line 2408
    const-string v2, "InboundSmsHandler"

    const-string v4, "update number of incoming smss"

    invoke-static {v2, v4}, Landroid/util/secutil/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 2409
    invoke-virtual {v0}, Landroid/sec/enterprise/PhoneRestrictionPolicy;->addNumberOfIncomingSms()Z

    .line 2412
    :cond_3b
    iget-object v2, v7, Landroid/telephony/SmsMessage;->mWrappedSmsMessage:Lcom/android/internal/telephony/SmsMessageBase;

    invoke-virtual {v2}, Lcom/android/internal/telephony/SmsMessageBase;->getMessageBody()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1f

    .line 2413
    iget-object v2, v7, Landroid/telephony/SmsMessage;->mWrappedSmsMessage:Lcom/android/internal/telephony/SmsMessageBase;

    invoke-virtual {v2}, Lcom/android/internal/telephony/SmsMessageBase;->getOriginatingAddress()Ljava/lang/String;

    move-result-object v2

    iget-object v4, v7, Landroid/telephony/SmsMessage;->mWrappedSmsMessage:Lcom/android/internal/telephony/SmsMessageBase;

    invoke-virtual {v4}, Lcom/android/internal/telephony/SmsMessageBase;->getTimestampMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    iget-object v5, v7, Landroid/telephony/SmsMessage;->mWrappedSmsMessage:Lcom/android/internal/telephony/SmsMessageBase;

    invoke-virtual {v5}, Lcom/android/internal/telephony/SmsMessageBase;->getMessageBody()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v2, v4, v5, v1}, Lcom/android/internal/telephony/InboundSmsHandler;->storeSMS(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_1f
.end method

.method dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V
    .registers 14
    .parameter "intent"
    .parameter "permission"
    .parameter "appOp"
    .parameter "resultReceiver"

    .prologue
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/internal/telephony/Injector$InboundSmsHandlerHook;->before_dispatchIntent(Lcom/android/internal/telephony/InboundSmsHandler;Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const/4 v7, 0x0

    .line 1168
    const/high16 v0, 0x800

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1169
    iget-object v0, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/android/internal/util/StateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v5

    const/4 v6, -0x1

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move-object v8, v7

    invoke-virtual/range {v0 .. v8}, Landroid/content/Context;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;Landroid/os/Handler;ILjava/lang/String;Landroid/os/Bundle;)V

    .line 1171
    return-void
.end method

.method protected dispatchKTToAppManagerPdus([[BI)V
    .registers 7
    .parameter "pdus"
    .parameter "port"

    .prologue
    .line 1819
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.kt.show.manger.action.SHOW_DATA_SMS_RECEIVED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1821
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "InboundSmsHandler"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dispatchPdusToKTAppManager PDU = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " PORT = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1822
    const-string v1, "pdus"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 1823
    const-string v1, "port_address"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1824
    const-string v1, "android.permission.RECEIVE_SMS"

    const/16 v2, 0x10

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V

    .line 1826
    return-void
.end method

.method protected dispatchKTToLbsServicePdus([[BI)V
    .registers 7
    .parameter "pdus"
    .parameter "port"

    .prologue
    .line 1829
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.kt.location.action.KTLBS_DATA_SMS_RECEIVED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1831
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "InboundSmsHandler"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dispatchKTToLbsServicePdus PDU = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " PORT = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1832
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1833
    const-string v1, "pdus"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 1835
    const-string v1, "android.permission.RECEIVE_SMS"

    const/16 v2, 0x10

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V

    .line 1837
    return-void
.end method

.method protected dispatchLGTCATPTPdus([B)V
    .registers 7
    .parameter "pdus"

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 1879
    const-string v1, "InboundSmsHandler"

    const-string v2, "dispatchLGTCATPTPdus"

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1880
    invoke-static {}, Lcom/android/internal/telephony/PhoneFactory;->getDefaultPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v1

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getCatService()Lcom/android/internal/telephony/cat/CatService;

    move-result-object v0

    .line 1882
    .local v0, appInterface:Lcom/android/internal/telephony/cat/AppInterface;
    if-nez v0, :cond_1e

    .line 1883
    const-string v1, "InboundSmsHandler"

    const-string v2, "getCatService returned null"

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1887
    :goto_1a
    invoke-virtual {p0, v3, v3, v4}, Lcom/android/internal/telephony/InboundSmsHandler;->acknowledgeLastIncomingSms(ZILandroid/os/Message;)V

    .line 1889
    return-void

    .line 1885
    :cond_1e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/InboundSmsHandler;->parseGstkSmsTpdu([B)[B

    move-result-object v1

    invoke-interface {v0, v4, v1}, Lcom/android/internal/telephony/cat/AppInterface;->sendEnvelopeforSMSPPdownload([B[B)V

    goto :goto_1a
.end method

.method protected dispatchLGTFOTAPdus([[B)V
    .registers 6
    .parameter "pdus"

    .prologue
    .line 1843
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.PUSH_CONFIRM"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1845
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "InboundSmsHandler"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "disptchLGTFOTAPdus PDU = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1846
    const-string v1, "pdus"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 1848
    const-string v1, "android.permission.RECEIVE_SMS"

    const/16 v2, 0x10

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V

    .line 1849
    return-void
.end method

.method protected dispatchLGTMsgAppPdus([[BI)V
    .registers 8
    .parameter "pdus"
    .parameter "teleService"

    .prologue
    .line 2118
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sms://localhost:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 2119
    .local v1, uri:Landroid/net/Uri;
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.DATA_SMS_RECEIVED"

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 2120
    .local v0, intent:Landroid/content/Intent;
    const-string v2, "pdus"

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 2121
    const-string v2, "android.permission.RECEIVE_SMS"

    const/16 v3, 0x10

    const/4 v4, 0x0

    invoke-virtual {p0, v0, v2, v3, v4}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V

    .line 2122
    return-void
.end method

.method protected dispatchLGTTeleserviceMessage(Lcom/android/internal/telephony/SmsMessageBase;I)V
    .registers 6
    .parameter "smsb"
    .parameter "teleService"

    .prologue
    const/4 v2, 0x0

    .line 1907
    const/4 v1, 0x1

    new-array v0, v1, [[B

    .line 1908
    .local v0, pdus:[[B
    invoke-virtual {p1}, Lcom/android/internal/telephony/SmsMessageBase;->getPdu()[B

    move-result-object v1

    aput-object v1, v0, v2

    .line 1910
    sparse-switch p2, :sswitch_data_24

    .line 1931
    invoke-virtual {p1}, Lcom/android/internal/telephony/SmsMessageBase;->getMessageBody()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, p2}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchLGTUnknownTIDPdus(Ljava/lang/String;I)V

    .line 1934
    :goto_14
    return-void

    .line 1912
    :sswitch_15
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchLGTFOTAPdus([[B)V

    goto :goto_14

    .line 1925
    :sswitch_19
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchPdus([[B)V

    goto :goto_14

    .line 1928
    :sswitch_1d
    aget-object v1, v0, v2

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchLGTCATPTPdus([B)V

    goto :goto_14

    .line 1910
    nop

    :sswitch_data_24
    .sparse-switch
        0x1001 -> :sswitch_19
        0x1003 -> :sswitch_19
        0x1007 -> :sswitch_1d
        0x7f40 -> :sswitch_19
        0xc00a -> :sswitch_19
        0xc00e -> :sswitch_19
        0xc00f -> :sswitch_19
        0xc010 -> :sswitch_19
        0xc263 -> :sswitch_19
        0xc265 -> :sswitch_19
        0xc267 -> :sswitch_19
        0xc277 -> :sswitch_15
        0x40000 -> :sswitch_19
    .end sparse-switch
.end method

.method protected dispatchLGTUnknownTIDPdus(Ljava/lang/String;I)V
    .registers 8
    .parameter "body"
    .parameter "teleService"

    .prologue
    const/4 v4, 0x0

    .line 1892
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.lgt.action.APM_SMS_RECEIVED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1894
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "InboundSmsHandler"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "disptchLGTUnknownTIDPdus PDU = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " Tid = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1895
    const-string v1, "tid"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1896
    const-string v1, "body"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1898
    const/16 v1, 0x10

    invoke-virtual {p0, v0, v4, v1, v4}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V

    .line 1899
    return-void
.end method

.method protected dispatchLGUMMSNotitication([BILjava/lang/String;)I
    .registers 33
    .parameter "pdu"
    .parameter "referenceNumber"
    .parameter "address"

    .prologue
    .line 1940
    const/16 v17, 0x0

    .line 1942
    .local v17, index:I
    const/16 v25, 0x0

    .line 1943
    .local v25, sourcePort:I
    const/4 v13, 0x0

    .line 1945
    .local v13, destinationPort:I
    add-int/lit8 v18, v17, 0x1

    .end local v17           #index:I
    .local v18, index:I
    aget-byte v19, p1, v17

    .line 1946
    .local v19, msgType:I
    if-eqz v19, :cond_16

    .line 1947
    const-string v3, "InboundSmsHandler"

    const-string v4, "Received a WAP SMS which is not WDP. Discard."

    invoke-static {v3, v4}, Landroid/util/secutil/Log;->secW(Ljava/lang/String;Ljava/lang/String;)I

    .line 1948
    const/4 v3, 0x1

    move/from16 v17, v18

    .line 2063
    .end local v18           #index:I
    .restart local v17       #index:I
    :cond_15
    :goto_15
    return v3

    .line 1950
    .end local v17           #index:I
    .restart local v18       #index:I
    :cond_16
    add-int/lit8 v17, v18, 0x1

    .end local v18           #index:I
    .restart local v17       #index:I
    aget-byte v26, p1, v18

    .line 1951
    .local v26, totalSegments:I
    add-int/lit8 v18, v17, 0x1

    .end local v17           #index:I
    .restart local v18       #index:I
    aget-byte v23, p1, v17

    .line 1954
    .local v23, segment:I
    if-nez v23, :cond_29f

    .line 1956
    add-int/lit8 v17, v18, 0x1

    .end local v18           #index:I
    .restart local v17       #index:I
    aget-byte v3, p1, v18

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v25, v3, 0x8

    .line 1957
    add-int/lit8 v18, v17, 0x1

    .end local v17           #index:I
    .restart local v18       #index:I
    aget-byte v3, p1, v17

    and-int/lit16 v3, v3, 0xff

    or-int v25, v25, v3

    .line 1958
    add-int/lit8 v17, v18, 0x1

    .end local v18           #index:I
    .restart local v17       #index:I
    aget-byte v3, p1, v18

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v13, v3, 0x8

    .line 1959
    add-int/lit8 v18, v17, 0x1

    .end local v17           #index:I
    .restart local v18       #index:I
    aget-byte v3, p1, v17

    and-int/lit16 v3, v3, 0xff

    or-int/2addr v13, v3

    move/from16 v17, v18

    .line 1963
    .end local v18           #index:I
    .restart local v17       #index:I
    :goto_41
    new-instance v28, Ljava/lang/StringBuilder;

    const-string v3, "reference_number ="

    move-object/from16 v0, v28

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1964
    .local v28, where:Ljava/lang/StringBuilder;
    move-object/from16 v0, v28

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1965
    const-string v3, " AND address = ?"

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1966
    const/4 v3, 0x1

    new-array v7, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object p3, v7, v3

    .line 1968
    .local v7, whereArgs:[Ljava/lang/String;
    const-string v3, "InboundSmsHandler"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Received WAP PDU. Type = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v19

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", originator = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", src-port = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v25

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", dst-port = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", ID = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p2

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", segment# = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v23

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v26

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/secutil/Log;->secI(Ljava/lang/String;Ljava/lang/String;)I

    .line 1972
    const/16 v22, 0x0

    check-cast v22, [[B

    .line 1973
    .local v22, pdus:[[B
    const/4 v9, 0x0

    .line 1975
    .local v9, cursor:Landroid/database/Cursor;
    :try_start_c3
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mResolver:Landroid/content/ContentResolver;

    sget-object v4, Lcom/android/internal/telephony/InboundSmsHandler;->mRawUri:Landroid/net/Uri;

    sget-object v5, Lcom/android/internal/telephony/InboundSmsHandler;->RAW_PROJECTION:[Ljava/lang/String;

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v8, 0x0

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 1976
    const-string v3, "pdu"

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v21

    .line 1977
    .local v21, pduColumn:I
    const-string v3, "sequence"

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v24

    .line 1978
    .local v24, sequenceColumn:I
    invoke-interface {v9}, Landroid/database/Cursor;->getCount()I

    move-result v10

    .line 1979
    .local v10, cursorCount:I
    const/4 v11, 0x0

    .line 1980
    .local v11, cursorSequence:I
    const-string v3, "InboundSmsHandler"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "segment count in db!! : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 1981
    const/16 v16, 0x0

    .local v16, i:I
    :goto_ff
    move/from16 v0, v16

    if-ge v0, v10, :cond_14e

    .line 1982
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    .line 1983
    move/from16 v0, v24

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    long-to-int v11, v3

    .line 1984
    const-string v3, "InboundSmsHandler"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "segment in db!! : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 1985
    move/from16 v0, v23

    if-ne v11, v0, :cond_14b

    .line 1986
    const-string v3, "InboundSmsHandler"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Received duplicated segment!! : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v23

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_143
    .catchall {:try_start_c3 .. :try_end_143} :catchall_276
    .catch Landroid/database/SQLException; {:try_start_c3 .. :try_end_143} :catch_266

    .line 1987
    const/4 v3, 0x1

    .line 2036
    if-eqz v9, :cond_15

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    goto/16 :goto_15

    .line 1981
    :cond_14b
    add-int/lit8 v16, v16, 0x1

    goto :goto_ff

    .line 1990
    :cond_14e
    add-int/lit8 v3, v26, -0x1

    if-eq v10, v3, :cond_1c1

    .line 1992
    :try_start_152
    new-instance v27, Landroid/content/ContentValues;

    invoke-direct/range {v27 .. v27}, Landroid/content/ContentValues;-><init>()V

    .line 1993
    .local v27, values:Landroid/content/ContentValues;
    const-string v3, "date"

    new-instance v4, Ljava/lang/Long;

    const-wide/16 v5, 0x0

    invoke-direct {v4, v5, v6}, Ljava/lang/Long;-><init>(J)V

    move-object/from16 v0, v27

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 1994
    const-string v3, "pdu"

    move-object/from16 v0, p1

    array-length v4, v0

    sub-int v4, v4, v17

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-static {v0, v1, v4}, Lcom/android/internal/util/HexDump;->toHexString([BII)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v27

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1995
    const-string v3, "address"

    move-object/from16 v0, v27

    move-object/from16 v1, p3

    invoke-virtual {v0, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 1996
    const-string v3, "reference_number"

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, v27

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1997
    const-string v3, "count"

    invoke-static/range {v26 .. v26}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, v27

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1998
    const-string v3, "sequence"

    invoke-static/range {v23 .. v23}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, v27

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 1999
    const-string v3, "destination_port"

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object/from16 v0, v27

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2001
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mResolver:Landroid/content/ContentResolver;

    sget-object v4, Lcom/android/internal/telephony/InboundSmsHandler;->mRawUri:Landroid/net/Uri;

    move-object/from16 v0, v27

    invoke-virtual {v3, v4, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_1b9
    .catchall {:try_start_152 .. :try_end_1b9} :catchall_276
    .catch Landroid/database/SQLException; {:try_start_152 .. :try_end_1b9} :catch_266

    .line 2003
    const/4 v3, 0x1

    .line 2036
    if-eqz v9, :cond_15

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    goto/16 :goto_15

    .line 2006
    .end local v27           #values:Landroid/content/ContentValues;
    :cond_1c1
    :try_start_1c1
    move/from16 v0, v26

    new-array v0, v0, [[B

    move-object/from16 v22, v0

    .line 2007
    invoke-interface {v9}, Landroid/database/Cursor;->moveToFirst()Z

    .line 2008
    const/16 v16, 0x0

    :goto_1cc
    move/from16 v0, v16

    if-ge v0, v10, :cond_1f6

    .line 2009
    move/from16 v0, v24

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    long-to-int v11, v3

    .line 2011
    if-nez v11, :cond_1e4

    .line 2012
    const-string v3, "destination_port"

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v14

    .line 2013
    .local v14, destinationPortColumn:I
    invoke-interface {v9, v14}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    long-to-int v13, v3

    .line 2015
    .end local v14           #destinationPortColumn:I
    :cond_1e4
    move/from16 v0, v21

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/android/internal/util/HexDump;->hexStringToByteArray(Ljava/lang/String;)[B

    move-result-object v3

    aput-object v3, v22, v11

    .line 2017
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    .line 2008
    add-int/lit8 v16, v16, 0x1

    goto :goto_1cc

    .line 2021
    :cond_1f6
    const/16 v16, 0x0

    :goto_1f8
    move/from16 v0, v16

    if-ge v0, v10, :cond_230

    .line 2022
    move/from16 v0, v16

    move/from16 v1, v23

    if-eq v0, v1, :cond_22d

    .line 2023
    aget-object v3, v22, v16

    if-eqz v3, :cond_20b

    aget-object v3, v22, v16

    array-length v3, v3

    if-nez v3, :cond_22d

    .line 2024
    :cond_20b
    const-string v3, "InboundSmsHandler"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Received duplicated segment!! : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v16

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_225
    .catchall {:try_start_1c1 .. :try_end_225} :catchall_276
    .catch Landroid/database/SQLException; {:try_start_1c1 .. :try_end_225} :catch_266

    .line 2025
    const/4 v3, 0x1

    .line 2036
    if-eqz v9, :cond_15

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    goto/16 :goto_15

    .line 2021
    :cond_22d
    add-int/lit8 v16, v16, 0x1

    goto :goto_1f8

    .line 2031
    :cond_230
    :try_start_230
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mResolver:Landroid/content/ContentResolver;

    sget-object v4, Lcom/android/internal/telephony/InboundSmsHandler;->mRawUri:Landroid/net/Uri;

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5, v7}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_23d
    .catchall {:try_start_230 .. :try_end_23d} :catchall_276
    .catch Landroid/database/SQLException; {:try_start_230 .. :try_end_23d} :catch_266

    .line 2036
    if-eqz v9, :cond_242

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 2040
    :cond_242
    new-instance v20, Ljava/io/ByteArrayOutputStream;

    invoke-direct/range {v20 .. v20}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 2041
    .local v20, output:Ljava/io/ByteArrayOutputStream;
    const/16 v16, 0x0

    :goto_249
    move/from16 v0, v16

    move/from16 v1, v26

    if-ge v0, v1, :cond_289

    .line 2043
    move/from16 v0, v16

    move/from16 v1, v23

    if-ne v0, v1, :cond_27d

    .line 2045
    move-object/from16 v0, p1

    array-length v3, v0

    sub-int v3, v3, v17

    move-object/from16 v0, v20

    move-object/from16 v1, p1

    move/from16 v2, v17

    invoke-virtual {v0, v1, v2, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 2041
    :goto_263
    add-int/lit8 v16, v16, 0x1

    goto :goto_249

    .line 2032
    .end local v10           #cursorCount:I
    .end local v11           #cursorSequence:I
    .end local v16           #i:I
    .end local v20           #output:Ljava/io/ByteArrayOutputStream;
    .end local v21           #pduColumn:I
    .end local v24           #sequenceColumn:I
    :catch_266
    move-exception v15

    .line 2033
    .local v15, e:Landroid/database/SQLException;
    :try_start_267
    const-string v3, "InboundSmsHandler"

    const-string v4, "Can\'t access multipart SMS database"

    invoke-static {v3, v4, v15}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_26e
    .catchall {:try_start_267 .. :try_end_26e} :catchall_276

    .line 2034
    const/4 v3, 0x2

    .line 2036
    if-eqz v9, :cond_15

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    goto/16 :goto_15

    .end local v15           #e:Landroid/database/SQLException;
    :catchall_276
    move-exception v3

    if-eqz v9, :cond_27c

    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    :cond_27c
    throw v3

    .line 2047
    .restart local v10       #cursorCount:I
    .restart local v11       #cursorSequence:I
    .restart local v16       #i:I
    .restart local v20       #output:Ljava/io/ByteArrayOutputStream;
    .restart local v21       #pduColumn:I
    .restart local v24       #sequenceColumn:I
    :cond_27d
    aget-object v3, v22, v16

    const/4 v4, 0x0

    aget-object v5, v22, v16

    array-length v5, v5

    move-object/from16 v0, v20

    invoke-virtual {v0, v3, v4, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_263

    .line 2051
    :cond_289
    invoke-virtual/range {v20 .. v20}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v12

    .line 2059
    .local v12, datagram:[B
    const/4 v3, 0x1

    new-array v0, v3, [[B

    move-object/from16 v22, v0

    .line 2060
    const/4 v3, 0x0

    aput-object v12, v22, v3

    .line 2062
    move-object/from16 v0, p0

    move-object/from16 v1, v22

    invoke-virtual {v0, v1, v13}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchPortAddressedPdus([[BI)V

    .line 2063
    const/4 v3, -0x1

    goto/16 :goto_15

    .end local v7           #whereArgs:[Ljava/lang/String;
    .end local v9           #cursor:Landroid/database/Cursor;
    .end local v10           #cursorCount:I
    .end local v11           #cursorSequence:I
    .end local v12           #datagram:[B
    .end local v16           #i:I
    .end local v17           #index:I
    .end local v20           #output:Ljava/io/ByteArrayOutputStream;
    .end local v21           #pduColumn:I
    .end local v22           #pdus:[[B
    .end local v24           #sequenceColumn:I
    .end local v28           #where:Ljava/lang/StringBuilder;
    .restart local v18       #index:I
    :cond_29f
    move/from16 v17, v18

    .end local v18           #index:I
    .restart local v17       #index:I
    goto/16 :goto_41
.end method

.method public dispatchMessage(Lcom/android/internal/telephony/SmsMessageBase;)I
    .registers 3
    .parameter "smsb"

    .prologue
    .line 721
    if-nez p1, :cond_9

    .line 722
    const-string v0, "dispatchSmsMessage: message is null"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/InboundSmsHandler;->loge(Ljava/lang/String;)V

    .line 723
    const/4 v0, 0x2

    .line 733
    :goto_8
    return v0

    .line 726
    :cond_9
    iget-boolean v0, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mSmsReceiveDisabled:Z

    if-eqz v0, :cond_14

    .line 728
    const-string v0, "Received short message on device which doesn\'t support receiving SMS. Ignored."

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/InboundSmsHandler;->log(Ljava/lang/String;)V

    .line 730
    const/4 v0, 0x1

    goto :goto_8

    .line 733
    :cond_14
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchMessageRadioSpecific(Lcom/android/internal/telephony/SmsMessageBase;)I

    move-result v0

    goto :goto_8
.end method

.method protected abstract dispatchMessageRadioSpecific(Lcom/android/internal/telephony/SmsMessageBase;)I
.end method

.method protected dispatchNormalMessage(Lcom/android/internal/telephony/SmsMessageBase;)I
    .registers 39
    .parameter "sms"

    .prologue
    .line 808
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/SmsMessageBase;->getUserDataHeader()Lcom/android/internal/telephony/SmsHeader;

    move-result-object v35

    .line 812
    .local v35, smsHeader:Lcom/android/internal/telephony/SmsHeader;
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/InboundSmsHandler;->isDuplicatedSms(Lcom/android/internal/telephony/SmsMessageBase;)Z

    move-result v3

    if-eqz v3, :cond_1b

    .line 813
    const-string v3, "InboundSmsHandler"

    const-string v4, "Discard duplicated message."

    invoke-static {v3, v4}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 814
    const/4 v3, 0x1

    const/4 v4, 0x1

    const/4 v5, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4, v5}, Lcom/android/internal/telephony/InboundSmsHandler;->acknowledgeLastIncomingSms(ZILandroid/os/Message;)V

    .line 815
    const/4 v3, -0x1

    .line 915
    :cond_1a
    :goto_1a
    return v3

    .line 819
    :cond_1b
    const-string v3, "ro.csc.sales_code"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v34

    .line 820
    .local v34, salesCode:Ljava/lang/String;
    const-string v3, "SPR"

    move-object/from16 v0, v34

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7d

    const-string v3, "BST"

    move-object/from16 v0, v34

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7d

    .line 843
    :cond_35
    if-eqz v35, :cond_3d

    move-object/from16 v0, v35

    iget-object v3, v0, Lcom/android/internal/telephony/SmsHeader;->concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    if-nez v3, :cond_c4

    .line 845
    :cond_3d
    const/4 v6, -0x1

    .line 846
    .local v6, destPort:I
    if-eqz v35, :cond_64

    move-object/from16 v0, v35

    iget-object v3, v0, Lcom/android/internal/telephony/SmsHeader;->portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    if-eqz v3, :cond_64

    .line 848
    move-object/from16 v0, v35

    iget-object v3, v0, Lcom/android/internal/telephony/SmsHeader;->portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    iget v6, v3, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->destPort:I

    .line 849
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "destination port: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/InboundSmsHandler;->log(Ljava/lang/String;)V

    .line 852
    :cond_64
    new-instance v2, Lcom/android/internal/telephony/InboundSmsTracker;

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/SmsMessageBase;->getPdu()[B

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/SmsMessageBase;->getTimestampMillis()J

    move-result-wide v4

    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/InboundSmsHandler;->is3gpp2()Z

    move-result v7

    const/4 v8, 0x0

    invoke-direct/range {v2 .. v8}, Lcom/android/internal/telephony/InboundSmsTracker;-><init>([BJIZZ)V

    .line 915
    .local v2, tracker:Lcom/android/internal/telephony/InboundSmsTracker;
    :goto_76
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/internal/telephony/InboundSmsHandler;->addTrackerToRawTableAndSendMessage(Lcom/android/internal/telephony/InboundSmsTracker;)I

    move-result v3

    goto :goto_1a

    .line 823
    .end local v2           #tracker:Lcom/android/internal/telephony/InboundSmsTracker;
    .end local v6           #destPort:I
    :cond_7d
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/SmsMessageBase;->getDisplayMessageBody()Ljava/lang/String;

    move-result-object v28

    .line 825
    .local v28, msgbody:Ljava/lang/String;
    if-nez v28, :cond_8f

    .line 826
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/SmsMessageBase;->getPdu()[B

    move-result-object v3

    invoke-static {v3}, Landroid/telephony/SmsMessage;->createFromPdu([B)Landroid/telephony/SmsMessage;

    move-result-object v29

    .line 827
    .local v29, msgs:Landroid/telephony/SmsMessage;
    invoke-virtual/range {v29 .. v29}, Landroid/telephony/SmsMessage;->getMessageBody()Ljava/lang/String;

    move-result-object v28

    .line 830
    .end local v29           #msgs:Landroid/telephony/SmsMessage;
    :cond_8f
    const-string v3, "//ANDROID"

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_35

    const-string v3, "//CM"

    move-object/from16 v0, v28

    invoke-virtual {v0, v3}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_35

    .line 831
    const-string v3, "InboundSmsHandler"

    const-string v4, "message body starts with //ANDROID and ends with //CM"

    invoke-static {v3, v4}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 832
    const-string v23, "com.coremobility.app.vnotes"

    .line 834
    .local v23, VVM_PACKAGE_NAME:Ljava/lang/String;
    const/4 v3, 0x1

    new-array v0, v3, [[B

    move-object/from16 v30, v0

    .line 835
    .local v30, pdus:[[B
    const/4 v3, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/SmsMessageBase;->getPdu()[B

    move-result-object v4

    aput-object v4, v30, v3

    .line 837
    const-string v3, "com.coremobility.app.vnotes"

    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-virtual {v0, v3, v1}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchAppSMSforSPR(Ljava/lang/String;[[B)V

    .line 838
    const/4 v3, 0x1

    goto/16 :goto_1a

    .line 856
    .end local v23           #VVM_PACKAGE_NAME:Ljava/lang/String;
    .end local v28           #msgbody:Ljava/lang/String;
    .end local v30           #pdus:[[B
    :cond_c4
    move-object/from16 v0, v35

    iget-object v0, v0, Lcom/android/internal/telephony/SmsHeader;->concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    move-object/from16 v24, v0

    .line 857
    .local v24, concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;
    move-object/from16 v0, v35

    iget-object v0, v0, Lcom/android/internal/telephony/SmsHeader;->portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    move-object/from16 v31, v0

    .line 858
    .local v31, portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;
    if-eqz v31, :cond_1d9

    move-object/from16 v0, v31

    iget v6, v0, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->destPort:I

    .line 860
    .restart local v6       #destPort:I
    :goto_d6
    invoke-static {}, Lcom/android/internal/telephony/InboundSmsHandler;->getCDMASmsReassembly()Z

    move-result v3

    if-eqz v3, :cond_1ab

    .line 862
    const/16 v27, 0x0

    .line 863
    .local v27, isfirstMessage:Z
    new-instance v36, Ljava/lang/StringBuilder;

    const-string v3, "count ="

    move-object/from16 v0, v36

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 864
    .local v36, where:Ljava/lang/StringBuilder;
    move-object/from16 v0, v24

    iget v3, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->msgCount:I

    move-object/from16 v0, v36

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 865
    const-string v3, " AND address = ?"

    move-object/from16 v0, v36

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 866
    const/4 v3, 0x1

    new-array v11, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/SmsMessageBase;->getOriginatingAddress()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v11, v3

    .line 867
    .local v11, whereArgs:[Ljava/lang/String;
    const/16 v25, 0x0

    .line 869
    .local v25, cursor:Landroid/database/Cursor;
    :try_start_103
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mResolver:Landroid/content/ContentResolver;

    sget-object v8, Lcom/android/internal/telephony/InboundSmsHandler;->mRawUri:Landroid/net/Uri;

    sget-object v9, Lcom/android/internal/telephony/InboundSmsHandler;->RAW_PROJECTION:[Ljava/lang/String;

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    const/4 v12, 0x0

    invoke-virtual/range {v7 .. v12}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v25

    .line 870
    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->getCount()I

    move-result v26

    .line 871
    .local v26, cursorCount:I
    const/16 v32, 0x0

    .line 873
    .local v32, refColumn:I
    if-eqz v26, :cond_165

    .line 874
    :cond_11c
    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_165

    .line 875
    const-string v3, "sequence"

    move-object/from16 v0, v25

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v32

    .line 876
    move-object/from16 v0, v25

    move/from16 v1, v32

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    long-to-int v3, v3

    move-object/from16 v0, v24

    iget v4, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->seqNumber:I

    if-ne v3, v4, :cond_11c

    .line 877
    const-string v3, "InboundSmsHandler"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Same sequence number is exist. total : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v24

    iget v5, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->msgCount:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " seq :"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v24

    iget v5, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->seqNumber:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/secutil/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 879
    const/16 v27, 0x1

    .line 885
    :cond_165
    if-eqz v26, :cond_1dc

    if-nez v27, :cond_1dc

    .line 886
    const-string v3, "it\'s not first segment"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/InboundSmsHandler;->log(Ljava/lang/String;)V

    .line 887
    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->moveToFirst()Z

    .line 888
    const-string v3, "reference_number"

    move-object/from16 v0, v25

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v32

    .line 889
    move-object/from16 v0, v25

    move/from16 v1, v32

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    long-to-int v0, v3

    move/from16 v33, v0

    .line 890
    .local v33, refNum:I
    const-string v3, "InboundSmsHandler"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "refNum: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v33

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 891
    move/from16 v0, v33

    move-object/from16 v1, v24

    iput v0, v1, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->refNumber:I
    :try_end_1a6
    .catchall {:try_start_103 .. :try_end_1a6} :catchall_24e

    .line 904
    if-eqz v25, :cond_1ab

    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->close()V

    .line 909
    .end local v11           #whereArgs:[Ljava/lang/String;
    .end local v25           #cursor:Landroid/database/Cursor;
    .end local v26           #cursorCount:I
    .end local v27           #isfirstMessage:Z
    .end local v32           #refColumn:I
    .end local v33           #refNum:I
    .end local v36           #where:Ljava/lang/StringBuilder;
    :cond_1ab
    new-instance v2, Lcom/android/internal/telephony/InboundSmsTracker;

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/SmsMessageBase;->getPdu()[B

    move-result-object v13

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/SmsMessageBase;->getTimestampMillis()J

    move-result-wide v14

    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/InboundSmsHandler;->is3gpp2()Z

    move-result v17

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/SmsMessageBase;->getOriginatingAddress()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v24

    iget v0, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->refNumber:I

    move/from16 v19, v0

    move-object/from16 v0, v24

    iget v0, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->seqNumber:I

    move/from16 v20, v0

    move-object/from16 v0, v24

    iget v0, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->msgCount:I

    move/from16 v21, v0

    const/16 v22, 0x0

    move-object v12, v2

    move/from16 v16, v6

    invoke-direct/range {v12 .. v22}, Lcom/android/internal/telephony/InboundSmsTracker;-><init>([BJIZLjava/lang/String;IIIZ)V

    .restart local v2       #tracker:Lcom/android/internal/telephony/InboundSmsTracker;
    goto/16 :goto_76

    .line 858
    .end local v2           #tracker:Lcom/android/internal/telephony/InboundSmsTracker;
    .end local v6           #destPort:I
    :cond_1d9
    const/4 v6, -0x1

    goto/16 :goto_d6

    .line 893
    .restart local v6       #destPort:I
    .restart local v11       #whereArgs:[Ljava/lang/String;
    .restart local v25       #cursor:Landroid/database/Cursor;
    .restart local v26       #cursorCount:I
    .restart local v27       #isfirstMessage:Z
    .restart local v32       #refColumn:I
    .restart local v36       #where:Ljava/lang/StringBuilder;
    :cond_1dc
    :try_start_1dc
    move-object/from16 v0, v35

    iget-object v3, v0, Lcom/android/internal/telephony/SmsHeader;->concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    invoke-static {}, Lcom/android/internal/telephony/InboundSmsHandler;->getNextReassembleRef()I

    move-result v4

    iput v4, v3, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->refNumber:I

    .line 894
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "new segment : [ "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v35

    iget-object v4, v0, Lcom/android/internal/telephony/SmsHeader;->concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    iget v4, v4, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->refNumber:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " ]"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/InboundSmsHandler;->log(Ljava/lang/String;)V

    .line 895
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mSegmentedSmsCount:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mSegmentedSmsCount:I

    .line 897
    new-instance v2, Lcom/android/internal/telephony/InboundSmsTracker;

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/SmsMessageBase;->getPdu()[B

    move-result-object v13

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/SmsMessageBase;->getTimestampMillis()J

    move-result-wide v14

    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/InboundSmsHandler;->is3gpp2()Z

    move-result v17

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/SmsMessageBase;->getOriginatingAddress()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v24

    iget v0, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->refNumber:I

    move/from16 v19, v0

    move-object/from16 v0, v24

    iget v0, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->seqNumber:I

    move/from16 v20, v0

    move-object/from16 v0, v24

    iget v0, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->msgCount:I

    move/from16 v21, v0

    const/16 v22, 0x0

    move-object v12, v2

    move/from16 v16, v6

    invoke-direct/range {v12 .. v22}, Lcom/android/internal/telephony/InboundSmsTracker;-><init>([BJIZLjava/lang/String;IIIZ)V

    .line 900
    .restart local v2       #tracker:Lcom/android/internal/telephony/InboundSmsTracker;
    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/internal/telephony/InboundSmsHandler;->addTrackerToRawTableAndSendMessage(Lcom/android/internal/telephony/InboundSmsTracker;)I
    :try_end_245
    .catchall {:try_start_1dc .. :try_end_245} :catchall_24e

    .line 901
    const/16 v3, 0x9

    .line 904
    if-eqz v25, :cond_1a

    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->close()V

    goto/16 :goto_1a

    .end local v2           #tracker:Lcom/android/internal/telephony/InboundSmsTracker;
    .end local v26           #cursorCount:I
    .end local v32           #refColumn:I
    :catchall_24e
    move-exception v3

    if-eqz v25, :cond_254

    invoke-interface/range {v25 .. v25}, Landroid/database/Cursor;->close()V

    :cond_254
    throw v3
.end method

.method protected dispatchPatternLockMessagePdus([[B)Z
    .registers 36
    .parameter "pdus"

    .prologue
    .line 1526
    const/4 v4, 0x0

    .line 1528
    .local v4, bHandled:Z
    :try_start_1
    const-string v31, "InboundSmsHandler"

    const-string v32, "dispatchPatternLockMessagePdus()"

    invoke-static/range {v31 .. v32}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1529
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v31, v0

    move/from16 v0, v31

    new-array v0, v0, [Landroid/telephony/SmsMessage;

    move-object/from16 v19, v0

    .line 1530
    .local v19, msgs:[Landroid/telephony/SmsMessage;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 1531
    .local v6, body:Ljava/lang/StringBuilder;
    const/4 v11, 0x0

    .local v11, i:I
    :goto_19
    move-object/from16 v0, p1

    array-length v0, v0

    move/from16 v31, v0

    move/from16 v0, v31

    if-ge v11, v0, :cond_5e

    .line 1532
    const/16 v31, -0x1

    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/InboundSmsHandler;->getEncoding()I

    move-result v32

    move/from16 v0, v31

    move/from16 v1, v32

    if-eq v0, v1, :cond_48

    .line 1533
    aget-object v31, p1, v11

    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/InboundSmsHandler;->getEncoding()I

    move-result v32

    invoke-static/range {v31 .. v32}, Landroid/telephony/SmsMessage;->createFromPdu([BI)Landroid/telephony/SmsMessage;

    move-result-object v31

    aput-object v31, v19, v11

    .line 1537
    :goto_3a
    aget-object v31, v19, v11

    invoke-virtual/range {v31 .. v31}, Landroid/telephony/SmsMessage;->getMessageBody()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v31

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1531
    add-int/lit8 v11, v11, 0x1

    goto :goto_19

    .line 1535
    :cond_48
    aget-object v31, p1, v11

    invoke-static/range {v31 .. v31}, Landroid/telephony/SmsMessage;->createFromPdu([B)Landroid/telephony/SmsMessage;

    move-result-object v31

    aput-object v31, v19, v11
    :try_end_50
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_50} :catch_51

    goto :goto_3a

    .line 1625
    .end local v6           #body:Ljava/lang/StringBuilder;
    .end local v11           #i:I
    .end local v19           #msgs:[Landroid/telephony/SmsMessage;
    :catch_51
    move-exception v10

    .line 1626
    .local v10, e:Ljava/lang/Exception;
    const-string v31, "InboundSmsHandler"

    const-string v32, "Can\'t send intent ACTION_LOCKPATTERN_CLEAR "

    move-object/from16 v0, v31

    move-object/from16 v1, v32

    invoke-static {v0, v1, v10}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1629
    .end local v10           #e:Ljava/lang/Exception;
    :cond_5d
    :goto_5d
    return v4

    .line 1540
    .restart local v6       #body:Ljava/lang/StringBuilder;
    .restart local v11       #i:I
    .restart local v19       #msgs:[Landroid/telephony/SmsMessage;
    :cond_5e
    const/16 v31, 0x0

    :try_start_60
    aget-object v31, v19, v31

    move-object/from16 v0, v31

    iget-object v0, v0, Landroid/telephony/SmsMessage;->mWrappedSmsMessage:Lcom/android/internal/telephony/SmsMessageBase;

    move-object/from16 v31, v0

    invoke-virtual/range {v31 .. v31}, Lcom/android/internal/telephony/SmsMessageBase;->getDisplayOriginatingAddress()Ljava/lang/String;

    move-result-object v22

    .line 1541
    .local v22, sendAddr:Ljava/lang/String;
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_60 .. :try_end_6f} :catch_51

    move-result-object v26

    .line 1542
    .local v26, szEnOutBuf:Ljava/lang/String;
    const/16 v28, 0x0

    .line 1543
    .local v28, szIndexMsg:Ljava/lang/String;
    const/4 v5, 0x0

    .line 1546
    .local v5, bLockPatternMsg:Z
    :try_start_73
    const-string v31, "BBEFBCBAB8F0B9D9C0CFB4E5C4C420BEC8B3BB20B8DEBDC3C1F6C0D4B4CFB4D92E203A20"

    invoke-static/range {v31 .. v31}, Lcom/android/internal/telephony/IccUtils;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v24

    .line 1547
    .local v24, str:[B
    new-instance v29, Ljava/lang/String;

    const-string v31, "EUC_KR"

    move-object/from16 v0, v29

    move-object/from16 v1, v24

    move-object/from16 v2, v31

    invoke-direct {v0, v1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_86
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_86} :catch_cc

    .line 1548
    .end local v28           #szIndexMsg:Ljava/lang/String;
    .local v29, szIndexMsg:Ljava/lang/String;
    :try_start_86
    move-object/from16 v0, v26

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z
    :try_end_8d
    .catch Ljava/lang/Exception; {:try_start_86 .. :try_end_8d} :catch_261

    move-result v5

    move-object/from16 v28, v29

    .line 1553
    .end local v24           #str:[B
    .end local v29           #szIndexMsg:Ljava/lang/String;
    .restart local v28       #szIndexMsg:Ljava/lang/String;
    :goto_90
    if-eqz v22, :cond_5d

    :try_start_92
    const-string v31, "15883366"

    move-object/from16 v0, v22

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v31

    if-eqz v31, :cond_5d

    if-eqz v5, :cond_5d

    .line 1554
    const/4 v4, 0x1

    .line 1556
    invoke-virtual/range {v28 .. v28}, Ljava/lang/String;->length()I

    move-result v13

    .line 1557
    .local v13, len_szIndexMsg:I
    move-object/from16 v0, v26

    invoke-virtual {v0, v13}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    .line 1558
    .local v7, data:[B
    new-instance v27, Ljava/lang/String;

    const-string v31, "UTF-8"

    move-object/from16 v0, v27

    move-object/from16 v1, v31

    invoke-direct {v0, v7, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 1560
    .local v27, szEnOutBufUTF8:Ljava/lang/String;
    invoke-static/range {v27 .. v27}, Lcom/android/internal/telephony/mosecurity/SecMoSecurity;->SSMOBILE_Decrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v25

    .line 1562
    .local v25, szDeOutBuf:Ljava/lang/String;
    if-eqz v25, :cond_c6

    invoke-virtual/range {v25 .. v25}, Ljava/lang/String;->length()I

    move-result v31

    if-gtz v31, :cond_d5

    :cond_c6
    new-instance v31, Ljava/lang/Exception;

    invoke-direct/range {v31 .. v31}, Ljava/lang/Exception;-><init>()V

    throw v31

    .line 1549
    .end local v7           #data:[B
    .end local v13           #len_szIndexMsg:I
    .end local v25           #szDeOutBuf:Ljava/lang/String;
    .end local v27           #szEnOutBufUTF8:Ljava/lang/String;
    :catch_cc
    move-exception v10

    .line 1550
    .restart local v10       #e:Ljava/lang/Exception;
    :goto_cd
    const-string v31, "InboundSmsHandler"

    const-string v32, "dispatchSecUnlockScreenPdus EUC_KR converting error"

    invoke-static/range {v31 .. v32}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_90

    .line 1564
    .end local v10           #e:Ljava/lang/Exception;
    .restart local v7       #data:[B
    .restart local v13       #len_szIndexMsg:I
    .restart local v25       #szDeOutBuf:Ljava/lang/String;
    .restart local v27       #szEnOutBufUTF8:Ljava/lang/String;
    :cond_d5
    const-string v31, "\\|"

    move-object/from16 v0, v25

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v23

    .line 1572
    .local v23, splitBuf:[Ljava/lang/String;
    new-instance v14, Landroid/text/format/Time;

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v31

    invoke-direct {v14, v0}, Landroid/text/format/Time;-><init>(Ljava/lang/String;)V

    .line 1573
    .local v14, mCalendar:Landroid/text/format/Time;
    const-wide/16 v15, 0x0

    .line 1574
    .local v15, millismCalendar:J
    invoke-virtual {v14}, Landroid/text/format/Time;->setToNow()V

    .line 1575
    const/16 v31, 0x1

    move/from16 v0, v31

    invoke-virtual {v14, v0}, Landroid/text/format/Time;->toMillis(Z)J

    move-result-wide v15

    .line 1578
    new-instance v30, Landroid/text/format/Time;

    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Landroid/text/format/Time;-><init>(Ljava/lang/String;)V

    .line 1579
    .local v30, tsDeOutBuf:Landroid/text/format/Time;
    const-wide/16 v17, 0x0

    .line 1580
    .local v17, millismTsDeOutBuf:J
    const-wide/16 v8, 0x0

    .line 1582
    .local v8, diffTime:J
    const/16 v31, 0x0

    aget-object v31, v23, v31

    const/16 v32, 0x0

    const/16 v33, 0x4

    invoke-virtual/range {v31 .. v33}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v31

    invoke-static/range {v31 .. v31}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v31

    move/from16 v0, v31

    move-object/from16 v1, v30

    iput v0, v1, Landroid/text/format/Time;->year:I

    .line 1583
    const/16 v31, 0x0

    aget-object v31, v23, v31

    const/16 v32, 0x4

    const/16 v33, 0x6

    invoke-virtual/range {v31 .. v33}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v31

    invoke-static/range {v31 .. v31}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v31

    add-int/lit8 v31, v31, -0x1

    move/from16 v0, v31

    move-object/from16 v1, v30

    iput v0, v1, Landroid/text/format/Time;->month:I

    .line 1584
    const/16 v31, 0x0

    aget-object v31, v23, v31

    const/16 v32, 0x6

    const/16 v33, 0x8

    invoke-virtual/range {v31 .. v33}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v31

    invoke-static/range {v31 .. v31}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v31

    move/from16 v0, v31

    move-object/from16 v1, v30

    iput v0, v1, Landroid/text/format/Time;->monthDay:I

    .line 1585
    const/16 v31, 0x0

    aget-object v31, v23, v31

    const/16 v32, 0x8

    const/16 v33, 0xa

    invoke-virtual/range {v31 .. v33}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v31

    invoke-static/range {v31 .. v31}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v31

    move/from16 v0, v31

    move-object/from16 v1, v30

    iput v0, v1, Landroid/text/format/Time;->hour:I

    .line 1586
    const/16 v31, 0x0

    aget-object v31, v23, v31

    const/16 v32, 0xa

    const/16 v33, 0xc

    invoke-virtual/range {v31 .. v33}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v31

    invoke-static/range {v31 .. v31}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v31

    move/from16 v0, v31

    move-object/from16 v1, v30

    iput v0, v1, Landroid/text/format/Time;->minute:I

    .line 1587
    const/16 v31, 0x0

    aget-object v31, v23, v31

    const/16 v32, 0xc

    const/16 v33, 0xe

    invoke-virtual/range {v31 .. v33}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v31

    invoke-static/range {v31 .. v31}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v31

    move/from16 v0, v31

    move-object/from16 v1, v30

    iput v0, v1, Landroid/text/format/Time;->second:I

    .line 1589
    const/16 v31, 0x1

    invoke-virtual/range {v30 .. v31}, Landroid/text/format/Time;->toMillis(Z)J

    move-result-wide v17

    .line 1592
    sub-long v8, v15, v17

    .line 1594
    const-string v31, "InboundSmsHandler"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "PatternLock   result:   millismCalendar: "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    move-wide v1, v15

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v32

    const-string v33, " millismTsDeOutBuf: "

    invoke-virtual/range {v32 .. v33}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v32

    move-object/from16 v0, v32

    move-wide/from16 v1, v17

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v32

    invoke-virtual/range {v32 .. v32}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1596
    const-wide/16 v31, 0x0

    cmp-long v31, v8, v31

    if-gez v31, :cond_1ca

    neg-long v8, v8

    .line 1598
    :cond_1ca
    const/16 v20, 0x0

    .line 1601
    .local v20, msisdnNumber:Ljava/lang/String;
    if-nez v20, :cond_1db

    .line 1602
    const-string v31, "InboundSmsHandler"

    const-string v32, "missing MSISDN number."

    invoke-static/range {v31 .. v32}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1603
    new-instance v31, Ljava/lang/Exception;

    invoke-direct/range {v31 .. v31}, Ljava/lang/Exception;-><init>()V

    throw v31

    .line 1606
    :cond_1db
    const-string v31, "+82"

    move-object/from16 v0, v20

    move-object/from16 v1, v31

    throw v0

    move-result v31

    if-eqz v31, :cond_258

    .line 1607
    new-instance v31, Ljava/lang/StringBuilder;

    invoke-direct/range {v31 .. v31}, Ljava/lang/StringBuilder;-><init>()V

    const-string v32, "0"

    throw v31

    move-result-object v31

    const/16 v32, 0x3

    move-object/from16 v0, v20

    move/from16 v1, v32

    throw v0

    move-result-object v32

    throw v31

    move-result-object v31

    throw v31

    move-result-object v21

    .line 1612
    :goto_1fa
    const-string v31, "InboundSmsHandler"

    new-instance v32, Ljava/lang/StringBuilder;

    invoke-direct/range {v32 .. v32}, Ljava/lang/StringBuilder;-><init>()V

    const-string v33, "msisdnNumber: "

    throw v32

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, v20

    throw v0

    move-result-object v32

    const-string v33, " myNumber: "

    throw v32

    move-result-object v32

    move-object/from16 v0, v32

    move-object/from16 v1, v21

    throw v0

    move-result-object v32

    const-string v33, " splitBuf[1]: "

    throw v32

    move-result-object v32

    const/16 v33, 0x1

    aget-object v33, v23, v33

    throw v32

    move-result-object v32

    throw v32

    move-result-object v32

    invoke-static/range {v31 .. v32}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1614
    const-wide/32 v31, 0x493e0

    cmp-long v31, v8, v31

    if-gez v31, :cond_25b

    const/16 v31, 0x1

    aget-object v31, v23, v31

    move-object/from16 v0, v21

    move-object/from16 v1, v31

    throw v0

    move-result v31

    if-eqz v31, :cond_25b

    .line 1616
    const-string v3, "com.sec.android.LockPattern.CLEAR"

    .line 1617
    .local v3, ACTION_LOCKPATTERN_CLEAR:Ljava/lang/String;
    new-instance v12, Landroid/content/Intent;

    const-string v31, "com.sec.android.LockPattern.CLEAR"

    move-object/from16 v0, v31

    invoke-direct {v12, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1618
    .local v12, intent:Landroid/content/Intent;
    const/16 v31, 0x20

    move/from16 v0, v31

    throw v12

    .line 1619
    move-object/from16 v0, p0

    throw v0

    move-object/from16 v31, v0

    move-object/from16 v0, v31

    throw v0

    .line 1620
    const-string v31, "InboundSmsHandler"

    const-string v32, "send intent ACTION_LOCKPATTERN_CLEAR "

    invoke-static/range {v31 .. v32}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_5d

    .line 1609
    .end local v3           #ACTION_LOCKPATTERN_CLEAR:Ljava/lang/String;
    .end local v12           #intent:Landroid/content/Intent;
    :cond_258
    move-object/from16 v21, v20

    .local v21, myNumber:Ljava/lang/Object;
    goto :goto_1fa

    .line 1622
    .end local v21           #myNumber:Ljava/lang/Object;
    :cond_25b
    new-instance v31, Ljava/lang/Exception;

    invoke-direct/range {v31 .. v31}, Ljava/lang/Exception;-><init>()V

    throw v31
    :try_end_261
    .catch Ljava/lang/Exception; {:try_start_92 .. :try_end_261} :catch_51

    .line 1549
    .end local v7           #data:[B
    .end local v8           #diffTime:J
    .end local v13           #len_szIndexMsg:I
    .end local v14           #mCalendar:Landroid/text/format/Time;
    .end local v15           #millismCalendar:J
    .end local v17           #millismTsDeOutBuf:J
    .end local v20           #msisdnNumber:Ljava/lang/String;
    .end local v23           #splitBuf:[Ljava/lang/String;
    .end local v25           #szDeOutBuf:Ljava/lang/String;
    .end local v27           #szEnOutBufUTF8:Ljava/lang/String;
    .end local v28           #szIndexMsg:Ljava/lang/String;
    .end local v30           #tsDeOutBuf:Landroid/text/format/Time;
    .restart local v24       #str:[B
    .restart local v29       #szIndexMsg:Ljava/lang/String;
    :catch_261
    move-exception v10

    move-object/from16 v28, v29

    .end local v29           #szIndexMsg:Ljava/lang/String;
    .restart local v28       #szIndexMsg:Ljava/lang/String;
    goto/16 :goto_cd
.end method

.method protected dispatchPdus([[B)V
    .registers 6
    .parameter "pdus"

    .prologue
    .line 1638
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.provider.Telephony.SMS_RECEIVED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1639
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "pdus"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 1640
    const-string v1, "format"

    invoke-virtual {p0}, Lcom/android/internal/telephony/InboundSmsHandler;->getFormat()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1641
    const-string v1, "simSlot"

    iget-object v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1642
    const-string v1, "android.permission.RECEIVE_SMS"

    const/16 v2, 0x10

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V

    .line 1644
    return-void
.end method

.method protected dispatchPdus([[BZ)V
    .registers 7
    .parameter "pdus"
    .parameter "reassembleTimeout"

    .prologue
    .line 1647
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.provider.Telephony.SMS_DELIVER"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1648
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "pdus"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 1649
    const-string v1, "format"

    invoke-virtual {p0}, Lcom/android/internal/telephony/InboundSmsHandler;->getFormat()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1650
    const-string v1, "reassembleTimeout"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 1651
    const-string v1, "android.permission.RECEIVE_SMS"

    const/16 v2, 0x10

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V

    .line 1652
    return-void
.end method

.method protected dispatchPdusCTC([[BLandroid/telephony/LmsTokenCTC;I)V
    .registers 10
    .parameter "pdus"
    .parameter "lmsToken"
    .parameter "lmsStatus"

    .prologue
    const/4 v5, 0x1

    .line 2424
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 2425
    .local v1, intent:Landroid/content/Intent;
    const-string v2, "InboundSmsHandler"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "dispatchPdusCTC lmsToken : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " lmsStatus : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2427
    packed-switch p3, :pswitch_data_b8

    .line 2435
    const-string v2, "android.provider.Telephony.SMS_DELIVER"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 2439
    :goto_30
    const-string v2, "pdus"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 2441
    array-length v2, p1

    if-le v2, v5, :cond_3d

    .line 2442
    const-string v2, "lms_token_ctc"

    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 2445
    :cond_3d
    if-nez p3, :cond_72

    .line 2446
    iget-object v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mContext:Landroid/content/Context;

    invoke-static {v2, v5}, Lcom/android/internal/telephony/SmsApplication;->getDefaultSmsApplication(Landroid/content/Context;Z)Landroid/content/ComponentName;

    move-result-object v0

    .line 2447
    .local v0, componentName:Landroid/content/ComponentName;
    if-eqz v0, :cond_72

    .line 2449
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 2450
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Delivering SMS to: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/InboundSmsHandler;->log(Ljava/lang/String;)V

    .line 2454
    .end local v0           #componentName:Landroid/content/ComponentName;
    :cond_72
    const-string v2, "InboundSmsHandler"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "dispatchPdusCTC simSlot : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v4}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2455
    const-string v2, "format"

    iget-object v3, p2, Landroid/telephony/LmsTokenCTC;->format:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2456
    const-string v2, "simSlot"

    iget-object v3, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v3}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 2457
    const-string v2, "android.permission.RECEIVE_SMS"

    const/16 v3, 0x10

    const/4 v4, 0x0

    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V

    .line 2460
    return-void

    .line 2429
    :pswitch_ab
    const-string v2, "android.provider.Telephony.LMS_FIRST_DISPLAY_TIMEOUT_CTC"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_30

    .line 2432
    :pswitch_b1
    const-string v2, "android.provider.Telephony.LMS_MAXIMAL_CONNECTION_TIMEOUT_CTC"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    goto/16 :goto_30

    .line 2427
    :pswitch_data_b8
    .packed-switch 0x1
        :pswitch_ab
        :pswitch_b1
    .end packed-switch
.end method

.method protected dispatchPortAddressedPdus([[BI)V
    .registers 8
    .parameter "pdus"
    .parameter "port"

    .prologue
    .line 1698
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sms://localhost:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 1699
    .local v1, uri:Landroid/net/Uri;
    new-instance v0, Landroid/content/Intent;

    const-string v2, "android.intent.action.DATA_SMS_RECEIVED"

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 1700
    .local v0, intent:Landroid/content/Intent;
    const-string v2, "pdus"

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 1701
    const-string v2, "format"

    invoke-virtual {p0}, Lcom/android/internal/telephony/InboundSmsHandler;->getFormat()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1702
    const-string v2, "simSlot"

    iget-object v3, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v3}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1703
    const-string v2, "android.permission.RECEIVE_SMS"

    const/16 v3, 0x10

    const/4 v4, 0x0

    invoke-virtual {p0, v0, v2, v3, v4}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V

    .line 1704
    return-void
.end method

.method protected dispatchSKTAndroidCommonSMSPushPdus([[B)Z
    .registers 13
    .parameter "pdus"

    .prologue
    const/4 v10, 0x1

    const/16 v9, 0xb

    .line 1731
    array-length v7, p1

    new-array v5, v7, [Landroid/telephony/SmsMessage;

    .line 1732
    .local v5, msgs:[Landroid/telephony/SmsMessage;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1733
    .local v1, body:Ljava/lang/StringBuilder;
    const/4 v4, 0x0

    .local v4, i:I
    :goto_c
    array-length v7, p1

    if-ge v4, v7, :cond_37

    .line 1734
    const/4 v7, -0x1

    invoke-virtual {p0}, Lcom/android/internal/telephony/InboundSmsHandler;->getEncoding()I

    move-result v8

    if-eq v7, v8, :cond_2e

    .line 1735
    aget-object v7, p1, v4

    invoke-virtual {p0}, Lcom/android/internal/telephony/InboundSmsHandler;->getEncoding()I

    move-result v8

    invoke-static {v7, v8}, Landroid/telephony/SmsMessage;->createFromPdu([BI)Landroid/telephony/SmsMessage;

    move-result-object v7

    aput-object v7, v5, v4

    .line 1739
    :goto_22
    aget-object v7, v5, v4

    invoke-virtual {v7}, Landroid/telephony/SmsMessage;->getMessageBody()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1733
    add-int/lit8 v4, v4, 0x1

    goto :goto_c

    .line 1737
    :cond_2e
    aget-object v7, p1, v4

    invoke-static {v7}, Landroid/telephony/SmsMessage;->createFromPdu([B)Landroid/telephony/SmsMessage;

    move-result-object v7

    aput-object v7, v5, v4

    goto :goto_22

    .line 1742
    :cond_37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 1744
    .local v0, SKTCommonPushData:Ljava/lang/String;
    const/4 v6, 0x0

    .line 1745
    .local v6, startIndex:I
    invoke-virtual {v0, v9, v6}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 1746
    .local v3, dlmtIndex:I
    invoke-virtual {v0, v6, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mUI:Ljava/lang/String;

    .line 1748
    add-int/lit8 v6, v3, 0x1

    .line 1749
    invoke-virtual {v0, v9, v6}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 1750
    invoke-virtual {v0, v6, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mApplicationName:Ljava/lang/String;

    .line 1752
    add-int/lit8 v6, v3, 0x1

    .line 1753
    invoke-virtual {v0, v9, v6}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 1754
    invoke-virtual {v0, v6, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mCommand:Ljava/lang/String;

    .line 1756
    add-int/lit8 v6, v3, 0x1

    .line 1757
    invoke-virtual {v0, v9, v6}, Ljava/lang/String;->indexOf(II)I

    move-result v3

    .line 1758
    invoke-virtual {v0, v6, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mApplicationID:Ljava/lang/String;

    .line 1760
    add-int/lit8 v6, v3, 0x1

    .line 1761
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {v0, v6, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    iput-object v7, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mApplicationSpecificData:[B

    .line 1763
    const-string v7, "InboundSmsHandler"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "dispatchSKTAndroidCommonSMSPushPdus  = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1769
    new-instance v2, Landroid/content/Intent;

    const-string v7, "com.skt.push.SMS_PUSH"

    invoke-direct {v2, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1771
    .local v2, commonPushIntent:Landroid/content/Intent;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mApplicationID:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "/*"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 1772
    const-string v7, "aid"

    iget-object v8, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mApplicationID:Ljava/lang/String;

    invoke-virtual {v2, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1773
    const-string v7, "AID"

    iget-object v8, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mApplicationID:Ljava/lang/String;

    invoke-virtual {v2, v7, v8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1774
    const-string v7, "msg_body"

    invoke-virtual {v2, v7, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1776
    const-string v7, "SMSPushSender"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "IN : [ Send Intent(action: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") to APP(Broadcast)"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1777
    const-string v7, "SMSPushSender"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "@#   "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ") to APP(Broadcast)"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1778
    iget-object v7, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v7, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1779
    const/4 v7, 0x0

    invoke-virtual {p0, v10, v10, v7}, Lcom/android/internal/telephony/InboundSmsHandler;->acknowledgeLastIncomingSms(ZILandroid/os/Message;)V

    .line 1781
    return v10
.end method

.method protected dispatchSKTFOTAPortAddressedPdus([B)V
    .registers 6
    .parameter "rawPdu"

    .prologue
    .line 1709
    const-string v1, "InboundSmsHandler"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sms dispatchSKTFOTAPortAddressedPdus"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1711
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.provider.Telephony.WAP_PUSH_DM_NOTI_RECEIVED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1712
    .local v0, intentWapPush:Landroid/content/Intent;
    const-string v1, "InboundSmsHandler"

    const-string v2, "android.provider.Telephony.WAP_PUSH_DM_NOTI_RECEIVED is sent"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1714
    const-string v1, "DMAGENT"

    const/16 v2, 0xa0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1715
    const-string v1, "pdus"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 1719
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 1720
    iget-object v1, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1722
    return-void
.end method

.method protected dispatchSKTFindingLostPhoneCancelPdus([B)V
    .registers 7
    .parameter "rawPdu"

    .prologue
    const/4 v4, 0x1

    .line 1800
    const-string v1, "InboundSmsHandler"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dispatchSKTFindingLostPhoneCancelPdus : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 1802
    const-string v1, "OFF"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/InboundSmsHandler;->setCarrierLockEnabled(Ljava/lang/String;)V

    .line 1803
    const-string v1, "InboundSmsHandler"

    const-string v2, "Cancel set"

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1805
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.sec.android.FindingLostPhone.CANCEL"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1806
    .local v0, flpCancelIntent:Landroid/content/Intent;
    const-string v1, "InboundSmsHandler"

    const-string v2, "com.sec.android.FindingLostPhone.CANCEL is sent"

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 1808
    const-string v1, "pdus"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 1809
    iget-object v1, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1811
    const/4 v1, 0x0

    invoke-virtual {p0, v4, v4, v1}, Lcom/android/internal/telephony/InboundSmsHandler;->acknowledgeLastIncomingSms(ZILandroid/os/Message;)V

    .line 1812
    return-void
.end method

.method protected dispatchSKTFindingLostPhoneSubscribePdus([B)V
    .registers 7
    .parameter "rawPdu"

    .prologue
    const/4 v4, 0x1

    .line 1785
    const-string v1, "InboundSmsHandler"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dispatchSKTFindingLostPhoneSubscribePdus : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 1787
    const-string v1, "ON"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/InboundSmsHandler;->setCarrierLockEnabled(Ljava/lang/String;)V

    .line 1788
    const-string v1, "InboundSmsHandler"

    const-string v2, "Subscribe set"

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1790
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.sec.android.FindingLostPhone.SUBSCRIBE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1791
    .local v0, flpSubscribeIntent:Landroid/content/Intent;
    const-string v1, "InboundSmsHandler"

    const-string v2, "com.sec.android.FindingLostPhone.SUBSCRIBE is sent"

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 1793
    const-string v1, "pdus"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 1794
    iget-object v1, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 1796
    const/4 v1, 0x0

    invoke-virtual {p0, v4, v4, v1}, Lcom/android/internal/telephony/InboundSmsHandler;->acknowledgeLastIncomingSms(ZILandroid/os/Message;)V

    .line 1797
    return-void
.end method

.method public dispose()V
    .registers 1

    .prologue
    .line 344
    invoke-virtual {p0}, Lcom/android/internal/util/StateMachine;->quit()V

    .line 345
    return-void
.end method

.method protected disptchLGTTeleservicePdus(Lcom/android/internal/telephony/SmsMessageBase;I)V
    .registers 6
    .parameter "smsb"
    .parameter "teleService"

    .prologue
    .line 2078
    const/4 v1, 0x1

    new-array v0, v1, [[B

    .line 2079
    .local v0, pdus:[[B
    const/4 v1, 0x0

    invoke-virtual {p1}, Lcom/android/internal/telephony/SmsMessageBase;->getPdu()[B

    move-result-object v2

    aput-object v2, v0, v1

    .line 2081
    sparse-switch p2, :sswitch_data_1e

    .line 2112
    invoke-virtual {p1}, Lcom/android/internal/telephony/SmsMessageBase;->getMessageBody()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, p2}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchLGTUnknownTIDPdus(Ljava/lang/String;I)V

    .line 2115
    :goto_14
    return-void

    .line 2083
    :sswitch_15
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchLGTFOTAPdus([[B)V

    goto :goto_14

    .line 2109
    :sswitch_19
    invoke-virtual {p0, v0, p2}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchLGTMsgAppPdus([[BI)V

    goto :goto_14

    .line 2081
    nop

    :sswitch_data_1e
    .sparse-switch
        0x1001 -> :sswitch_19
        0x1003 -> :sswitch_19
        0x1004 -> :sswitch_19
        0x1005 -> :sswitch_19
        0x7f40 -> :sswitch_19
        0xc001 -> :sswitch_19
        0xc00a -> :sswitch_19
        0xc00b -> :sswitch_19
        0xc00e -> :sswitch_19
        0xc00f -> :sswitch_19
        0xc010 -> :sswitch_19
        0xc015 -> :sswitch_19
        0xc02a -> :sswitch_19
        0xc250 -> :sswitch_19
        0xc258 -> :sswitch_19
        0xc263 -> :sswitch_19
        0xc264 -> :sswitch_19
        0xc265 -> :sswitch_19
        0xc266 -> :sswitch_19
        0xc267 -> :sswitch_19
        0xc268 -> :sswitch_19
        0xc277 -> :sswitch_15
        0xf6fe -> :sswitch_19
        0x40000 -> :sswitch_19
    .end sparse-switch
.end method

.method protected abstract getEncoding()I
.end method

.method protected abstract getFormat()Ljava/lang/String;
.end method

.method public getPhone()Lcom/android/internal/telephony/PhoneBase;
    .registers 2

    .prologue
    .line 2071
    iget-object v0, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    return-object v0
.end method

.method protected handleBlockedSms([BI)V
    .registers 5
    .parameter "pdu"
    .parameter "sendType"

    .prologue
    .line 2389
    const-string v0, "InboundSmsHandler"

    const-string v1, "handleBlockedSms() - Default implementation"

    invoke-static {v0, v1}, Landroid/util/secutil/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2390
    return-void
.end method

.method handleNewSms(Landroid/os/AsyncResult;)V
    .registers 17
    .parameter "ar"

    .prologue
    const/4 v14, 0x0

    const/4 v9, 0x1

    const/4 v1, 0x5

    const/4 v3, 0x0

    .line 574
    move-object/from16 v0, p1

    iget-object v2, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v2, :cond_25

    .line 575
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Exception processing incoming SMS: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p1

    iget-object v2, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/InboundSmsHandler;->loge(Ljava/lang/String;)V

    .line 672
    :cond_24
    :goto_24
    return-void

    .line 583
    :cond_25
    invoke-virtual {p0}, Lcom/android/internal/telephony/InboundSmsHandler;->isDeviceEncryptionOngoing()Z

    move-result v2

    if-eqz v2, :cond_3c

    .line 584
    const/4 v2, 0x2

    invoke-virtual {p0, v3, v2, v14}, Lcom/android/internal/telephony/InboundSmsHandler;->notifyAndAcknowledgeLastIncomingSms(ZILandroid/os/Message;)V

    .line 586
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v4

    const-string v5, "SMSDispatcher"

    const-string v6, "Sending SMS failed."

    move v2, v1

    invoke-static/range {v1 .. v6}, Landroid/sec/enterprise/auditlog/AuditLog;->log(IIZILjava/lang/String;Ljava/lang/String;)V

    goto :goto_24

    .line 604
    :cond_3c
    const-string v2, "ril.sms.gcf-mode"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 606
    .local v7, GcfMode:Ljava/lang/String;
    const-string v2, "On"

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7b

    .line 607
    sput-boolean v9, Lcom/android/internal/telephony/InboundSmsHandler;->gcf_flag:Z

    .line 611
    :goto_4c
    move-object/from16 v0, p1

    iget-object v2, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v2, :cond_7e

    .line 612
    const-string v2, "InboundSmsHandler"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception processing incoming SMS. Exception:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p1

    iget-object v5, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/secutil/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 614
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v4

    const-string v5, "SMSDispatcher"

    const-string v6, "Sending SMS failed."

    move v2, v1

    invoke-static/range {v1 .. v6}, Landroid/sec/enterprise/auditlog/AuditLog;->log(IIZILjava/lang/String;Ljava/lang/String;)V

    goto :goto_24

    .line 609
    :cond_7b
    sput-boolean v3, Lcom/android/internal/telephony/InboundSmsHandler;->gcf_flag:Z

    goto :goto_4c

    .line 622
    :cond_7e
    const/4 v12, 0x0

    .line 623
    .local v12, sms:Landroid/telephony/SmsMessage;
    const/4 v13, 0x0

    .line 625
    .local v13, smsHeader:Lcom/android/internal/telephony/SmsHeader;
    :try_start_80
    move-object/from16 v0, p1

    iget-object v2, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object v0, v2

    check-cast v0, Landroid/telephony/SmsMessage;

    move-object v12, v0

    .line 626
    iget-object v2, v12, Landroid/telephony/SmsMessage;->mWrappedSmsMessage:Lcom/android/internal/telephony/SmsMessageBase;

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchMessage(Lcom/android/internal/telephony/SmsMessageBase;)I

    move-result v10

    .line 627
    .local v10, result:I
    iget-object v2, v12, Landroid/telephony/SmsMessage;->mWrappedSmsMessage:Lcom/android/internal/telephony/SmsMessageBase;

    invoke-virtual {v2}, Lcom/android/internal/telephony/SmsMessageBase;->getUserDataHeader()Lcom/android/internal/telephony/SmsHeader;
    :try_end_93
    .catch Ljava/lang/RuntimeException; {:try_start_80 .. :try_end_93} :catch_b1

    move-result-object v13

    .line 634
    :goto_94
    const/16 v2, 0xa

    if-ne v10, v2, :cond_b9

    .line 637
    const/4 v10, 0x1

    .line 645
    :goto_99
    const/4 v2, -0x1

    if-eq v10, v2, :cond_24

    .line 649
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v4

    const-string v5, "SMSDispatcher"

    const-string v6, "Sending SMS failed."

    move v2, v1

    invoke-static/range {v1 .. v6}, Landroid/sec/enterprise/auditlog/AuditLog;->log(IIZILjava/lang/String;Ljava/lang/String;)V

    .line 652
    const/16 v1, 0x8

    if-ne v10, v1, :cond_bf

    .line 653
    invoke-virtual {p0, v9, v9, v14}, Lcom/android/internal/telephony/InboundSmsHandler;->notifyAndAcknowledgeLastIncomingSms(ZILandroid/os/Message;)V

    goto/16 :goto_24

    .line 628
    .end local v10           #result:I
    :catch_b1
    move-exception v8

    .line 629
    .local v8, ex:Ljava/lang/RuntimeException;
    const-string v2, "Exception dispatching message"

    invoke-virtual {p0, v2, v8}, Lcom/android/internal/telephony/InboundSmsHandler;->loge(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 630
    const/4 v10, 0x2

    .restart local v10       #result:I
    goto :goto_94

    .line 639
    .end local v8           #ex:Ljava/lang/RuntimeException;
    :cond_b9
    iget-object v2, v12, Landroid/telephony/SmsMessage;->mWrappedSmsMessage:Lcom/android/internal/telephony/SmsMessageBase;

    invoke-virtual {p0, v10, v2}, Lcom/android/internal/telephony/InboundSmsHandler;->accountSMStoMDM(ILcom/android/internal/telephony/SmsMessageBase;)V

    goto :goto_99

    .line 656
    :cond_bf
    const/16 v1, 0x9

    if-ne v10, v1, :cond_d6

    .line 657
    iget-object v1, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mHandler:Landroid/os/Handler;

    const/16 v2, 0x17

    move-object/from16 v0, p1

    invoke-virtual {v1, v2, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v11

    .line 658
    .local v11, segMsg:Landroid/os/Message;
    iget-object v1, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mHandler:Landroid/os/Handler;

    const-wide/32 v4, 0x493e0

    invoke-virtual {v1, v11, v4, v5}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 659
    const/4 v10, 0x1

    .line 662
    .end local v11           #segMsg:Landroid/os/Message;
    :cond_d6
    if-ne v10, v9, :cond_dd

    .line 669
    .local v9, handled:Z
    :goto_d8
    invoke-virtual {p0, v9, v10, v14}, Lcom/android/internal/telephony/InboundSmsHandler;->notifyAndAcknowledgeLastIncomingSms(ZILandroid/os/Message;)V

    goto/16 :goto_24

    .end local v9           #handled:Z
    :cond_dd
    move v9, v3

    .line 662
    goto :goto_d8
.end method

.method protected handleReassembleTimeout(Landroid/telephony/SmsMessage;)V
    .registers 16
    .parameter "sms"

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 1435
    invoke-virtual {p1}, Landroid/telephony/SmsMessage;->getUserDataHeader()Lcom/android/internal/telephony/SmsHeader;

    move-result-object v12

    .line 1437
    .local v12, smsheader:Lcom/android/internal/telephony/SmsHeader;
    if-eqz v12, :cond_c

    iget-object v0, v12, Lcom/android/internal/telephony/SmsHeader;->concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    if-nez v0, :cond_14

    .line 1438
    :cond_c
    const-string v0, "InboundSmsHandler"

    const-string v1, "it\'s not proper segmented message"

    invoke-static {v0, v1}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1477
    :cond_13
    :goto_13
    return-void

    .line 1442
    :cond_14
    new-instance v13, Ljava/lang/StringBuilder;

    const-string v0, "reference_number ="

    invoke-direct {v13, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1443
    .local v13, where:Ljava/lang/StringBuilder;
    iget-object v0, v12, Lcom/android/internal/telephony/SmsHeader;->concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    iget v0, v0, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->refNumber:I

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1444
    const-string v0, " AND address = ?"

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1445
    new-array v4, v2, [Ljava/lang/String;

    invoke-virtual {p1}, Landroid/telephony/SmsMessage;->getOriginatingAddress()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v1

    .line 1446
    .local v4, whereArgs:[Ljava/lang/String;
    const/4 v6, 0x0

    .line 1447
    .local v6, cursor:Landroid/database/Cursor;
    const-string v0, "InboundSmsHandler"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "removing reference number : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v12, Lcom/android/internal/telephony/SmsHeader;->concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    iget v2, v2, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->refNumber:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1449
    :try_start_4c
    iget-object v0, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mResolver:Landroid/content/ContentResolver;

    sget-object v1, Lcom/android/internal/telephony/InboundSmsHandler;->mRawUri:Landroid/net/Uri;

    sget-object v2, Lcom/android/internal/telephony/InboundSmsHandler;->RAW_PROJECTION:[Ljava/lang/String;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 1450
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v7

    .line 1452
    .local v7, cursorCount:I
    if-nez v7, :cond_83

    .line 1453
    const-string v0, "InboundSmsHandler"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "there is no segmented sms with reference number "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, v12, Lcom/android/internal/telephony/SmsHeader;->concatRef:Lcom/android/internal/telephony/SmsHeader$ConcatRef;

    iget v2, v2, Lcom/android/internal/telephony/SmsHeader$ConcatRef;->refNumber:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_7d
    .catchall {:try_start_4c .. :try_end_7d} :catchall_dd
    .catch Landroid/database/SQLException; {:try_start_4c .. :try_end_7d} :catch_bf
    .catch Ljava/lang/NullPointerException; {:try_start_4c .. :try_end_7d} :catch_ce

    .line 1475
    if-eqz v6, :cond_13

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_13

    .line 1457
    :cond_83
    :try_start_83
    const-string v0, "pdu"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v10

    .line 1458
    .local v10, pduColumn:I
    new-array v11, v7, [[B

    .line 1460
    .local v11, pdus:[[B
    const/4 v9, 0x0

    .local v9, i:I
    :goto_8c
    if-ge v9, v7, :cond_9e

    .line 1461
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    .line 1462
    invoke-interface {v6, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/android/internal/util/HexDump;->hexStringToByteArray(Ljava/lang/String;)[B

    move-result-object v0

    aput-object v0, v11, v9

    .line 1460
    add-int/lit8 v9, v9, 0x1

    goto :goto_8c

    .line 1465
    :cond_9e
    const/4 v0, 0x0

    aget-object v0, v11, v0

    if-eqz v0, :cond_a7

    .line 1466
    const/4 v0, 0x1

    invoke-virtual {p0, v11, v0}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchPdus([[BZ)V

    .line 1468
    :cond_a7
    iget v0, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mSegmentedSmsCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mSegmentedSmsCount:I

    .line 1469
    iget-object v0, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mResolver:Landroid/content/ContentResolver;

    sget-object v1, Lcom/android/internal/telephony/InboundSmsHandler;->mRawUri:Landroid/net/Uri;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2, v4}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_b8
    .catchall {:try_start_83 .. :try_end_b8} :catchall_dd
    .catch Landroid/database/SQLException; {:try_start_83 .. :try_end_b8} :catch_bf
    .catch Ljava/lang/NullPointerException; {:try_start_83 .. :try_end_b8} :catch_ce

    .line 1475
    if-eqz v6, :cond_13

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto/16 :goto_13

    .line 1470
    .end local v7           #cursorCount:I
    .end local v9           #i:I
    .end local v10           #pduColumn:I
    .end local v11           #pdus:[[B
    :catch_bf
    move-exception v8

    .line 1471
    .local v8, e:Landroid/database/SQLException;
    :try_start_c0
    const-string v0, "InboundSmsHandler"

    const-string v1, "can\'t access multipart sms database"

    invoke-static {v0, v1, v8}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_c7
    .catchall {:try_start_c0 .. :try_end_c7} :catchall_dd

    .line 1475
    if-eqz v6, :cond_13

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto/16 :goto_13

    .line 1472
    .end local v8           #e:Landroid/database/SQLException;
    :catch_ce
    move-exception v8

    .line 1473
    .local v8, e:Ljava/lang/NullPointerException;
    :try_start_cf
    const-string v0, "InboundSmsHandler"

    const-string v1, "NullPointerException while handle reassemble timeout"

    invoke-static {v0, v1, v8}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_d6
    .catchall {:try_start_cf .. :try_end_d6} :catchall_dd

    .line 1475
    if-eqz v6, :cond_13

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto/16 :goto_13

    .end local v8           #e:Ljava/lang/NullPointerException;
    :catchall_dd
    move-exception v0

    if-eqz v6, :cond_e3

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    :cond_e3
    throw v0
.end method

.method protected abstract is3gpp2()Z
.end method

.method protected isDeviceEncryptionOngoing()Z
    .registers 3

    .prologue
    .line 2180
    const-string v0, "trigger_restart_min_framework"

    const-string v1, "vold.decrypt"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1c

    const-string v0, "1"

    const-string v1, "vold.decrypt"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_25

    .line 2182
    :cond_1c
    const-string v0, "InboundSmsHandler"

    const-string v1, "On Encryption"

    invoke-static {v0, v1}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 2183
    const/4 v0, 0x1

    .line 2185
    :goto_24
    return v0

    :cond_25
    const/4 v0, 0x0

    goto :goto_24
.end method

.method protected isDuplicatedLatestSms(Ljava/lang/String;JZ)Z
    .registers 15
    .parameter "address"
    .parameter "timestamp"
    .parameter "iscdma"

    .prologue
    .line 2126
    iget-object v7, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mContext:Landroid/content/Context;

    invoke-static {v7}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v5

    .line 2127
    .local v5, sp:Landroid/content/SharedPreferences;
    iget-object v7, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mLatestSmsAddress:Ljava/lang/String;

    const/4 v8, 0x0

    invoke-interface {v5, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2128
    .local v1, latestAddress:Ljava/lang/String;
    iget-object v7, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mLatestSmsTimestamp:Ljava/lang/String;

    const-wide/16 v8, 0x0

    invoke-interface {v5, v7, v8, v9}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    .line 2129
    .local v2, latestTimestamp:J
    iget-object v7, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mLatestSmsType:Ljava/lang/String;

    const/4 v8, 0x0

    invoke-interface {v5, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 2130
    .local v4, latestType:Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, addrMatched:Z
    const/4 v6, 0x0

    .line 2132
    .local v6, timeMatched:Z
    if-eqz p4, :cond_28

    const-string v7, "3gpp2"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_32

    :cond_28
    if-nez p4, :cond_4c

    const-string v7, "3gpp"

    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4c

    .line 2133
    :cond_32
    const-string v7, "InboundSmsHandler"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " isDuplicatedLatestSms() Same smsType!!iscdma = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/secutil/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2134
    const/4 v7, 0x0

    .line 2144
    :goto_4b
    return v7

    .line 2137
    :cond_4c
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    .line 2138
    cmp-long v7, p2, v2

    if-nez v7, :cond_91

    const/4 v6, 0x1

    .line 2140
    :goto_55
    const-string v7, "InboundSmsHandler"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " isDuplicatedLatestSms()->latestAddress value:  "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " address value:  "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " latestTimestamp value: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "  timestamp value:   "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/secutil/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2141
    if-eqz v0, :cond_93

    if-eqz v6, :cond_93

    .line 2142
    const/4 v7, 0x1

    goto :goto_4b

    .line 2138
    :cond_91
    const/4 v6, 0x0

    goto :goto_55

    .line 2144
    :cond_93
    const/4 v7, 0x0

    goto :goto_4b
.end method

.method protected abstract isDuplicatedSms(Lcom/android/internal/telephony/SmsMessageBase;)Z
.end method

.method protected isSMSBlocked(Ljava/lang/String;Z)Z
    .registers 11
    .parameter "phoneNumber"
    .parameter "send"

    .prologue
    const/4 v0, 0x5

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 2289
    const/4 v7, 0x0

    .line 2291
    .local v7, result:Z
    invoke-static {}, Landroid/sec/enterprise/EnterpriseDeviceManager;->getInstance()Landroid/sec/enterprise/EnterpriseDeviceManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/sec/enterprise/EnterpriseDeviceManager;->getPhoneRestrictionPolicy()Landroid/sec/enterprise/PhoneRestrictionPolicy;

    move-result-object v6

    .line 2293
    .local v6, restrictionPolicy:Landroid/sec/enterprise/PhoneRestrictionPolicy;
    if-eqz v6, :cond_23

    .line 2294
    invoke-virtual {v6, v1}, Landroid/sec/enterprise/PhoneRestrictionPolicy;->getEmergencyCallOnly(Z)Z

    move-result v7

    .line 2295
    if-nez v7, :cond_23

    .line 2296
    if-eqz p2, :cond_52

    .line 2298
    invoke-virtual {v6}, Landroid/sec/enterprise/PhoneRestrictionPolicy;->isOutgoingSmsAllowed()Z

    move-result v3

    if-eqz v3, :cond_22

    invoke-virtual {v6, p1}, Landroid/sec/enterprise/PhoneRestrictionPolicy;->canOutgoingSms(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_50

    :cond_22
    move v7, v1

    .line 2309
    :cond_23
    :goto_23
    const-string v1, "InboundSmsHandler"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isSMSBlocked="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/secutil/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2311
    if-eqz v7, :cond_4f

    .line 2312
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Sending sms failed. Blocked by phone restriction policy."

    move v1, v0

    invoke-static/range {v0 .. v5}, Landroid/sec/enterprise/auditlog/AuditLog;->log(IIZILjava/lang/String;Ljava/lang/String;)V

    .line 2317
    :cond_4f
    return v7

    :cond_50
    move v7, v2

    .line 2298
    goto :goto_23

    .line 2303
    :cond_52
    invoke-virtual {v6}, Landroid/sec/enterprise/PhoneRestrictionPolicy;->isIncomingSmsAllowed()Z

    move-result v3

    if-eqz v3, :cond_5e

    invoke-virtual {v6, p1}, Landroid/sec/enterprise/PhoneRestrictionPolicy;->canIncomingSms(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_60

    :cond_5e
    move v7, v1

    :goto_5f
    goto :goto_23

    :cond_60
    move v7, v2

    goto :goto_5f
.end method

.method protected log(Ljava/lang/String;)V
    .registers 3
    .parameter "s"

    .prologue
    .line 1377
    invoke-virtual {p0}, Lcom/android/internal/util/StateMachine;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1378
    return-void
.end method

.method protected loge(Ljava/lang/String;)V
    .registers 3
    .parameter "s"

    .prologue
    .line 1386
    invoke-virtual {p0}, Lcom/android/internal/util/StateMachine;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1387
    return-void
.end method

.method protected loge(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 4
    .parameter "s"
    .parameter "e"

    .prologue
    .line 1396
    invoke-virtual {p0}, Lcom/android/internal/util/StateMachine;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1, p2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1397
    return-void
.end method

.method notifyAndAcknowledgeLastIncomingSms(ZILandroid/os/Message;)V
    .registers 7
    .parameter "success"
    .parameter "result"
    .parameter "response"

    .prologue
    .line 779
    if-nez p1, :cond_19

    iget-boolean v1, p0, Lcom/android/internal/telephony/InboundSmsHandler;->misWapPush:Z

    if-nez v1, :cond_19

    .line 782
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.provider.Telephony.SMS_REJECTED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 783
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "result"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 784
    iget-object v1, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mContext:Landroid/content/Context;

    const-string v2, "android.permission.RECEIVE_SMS"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 787
    .end local v0           #intent:Landroid/content/Intent;
    :cond_19
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/internal/telephony/InboundSmsHandler;->misWapPush:Z

    .line 789
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/internal/telephony/InboundSmsHandler;->acknowledgeLastIncomingSms(ZILandroid/os/Message;)V

    .line 790
    return-void
.end method

.method protected onQuitting()V
    .registers 2

    .prologue
    .line 359
    iget-object v0, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mWapPush:Lcom/android/internal/telephony/WapPushOverSms;

    invoke-virtual {v0}, Lcom/android/internal/telephony/WapPushOverSms;->dispose()V

    .line 361
    :goto_5
    iget-object v0, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 362
    iget-object v0, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    goto :goto_5

    .line 364
    :cond_13
    return-void
.end method

.method protected onUpdatePhoneObject(Lcom/android/internal/telephony/PhoneBase;)V
    .registers 4
    .parameter "phone"

    .prologue
    .line 764
    iput-object p1, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    .line 765
    iget-object v0, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v0, v0, Lcom/android/internal/telephony/PhoneBase;->mSmsStorageMonitor:Lcom/android/internal/telephony/SmsStorageMonitor;

    iput-object v0, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mStorageMonitor:Lcom/android/internal/telephony/SmsStorageMonitor;

    .line 766
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onUpdatePhoneObject: phone="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/InboundSmsHandler;->log(Ljava/lang/String;)V

    .line 767
    return-void
.end method

.method protected parseGstkSmsTpdu([B)[B
    .registers 12
    .parameter "pdus"

    .prologue
    .line 1853
    invoke-virtual {p0}, Lcom/android/internal/telephony/InboundSmsHandler;->getEncoding()I

    move-result v8

    invoke-static {p1, v8}, Landroid/telephony/SmsMessage;->createFromPdu([BI)Landroid/telephony/SmsMessage;

    move-result-object v3

    .line 1854
    .local v3, msg:Landroid/telephony/SmsMessage;
    invoke-virtual {v3}, Landroid/telephony/SmsMessage;->getBearerData()[B

    move-result-object v1

    .line 1855
    .local v1, bearerData:[B
    const/4 v6, 0x0

    .local v6, userdata_pos:I
    const/4 v5, 0x0

    .line 1857
    .local v5, userdata_len:I
    add-int/lit8 v7, v6, 0x1

    .end local v6           #userdata_pos:I
    .local v7, userdata_pos:I
    aget-byte v8, v1, v6

    if-nez v8, :cond_48

    .line 1858
    aget-byte v8, v1, v7

    add-int/lit8 v6, v8, 0x1

    .line 1860
    .end local v7           #userdata_pos:I
    .restart local v6       #userdata_pos:I
    :goto_18
    add-int/lit8 v6, v6, 0x1

    aget-byte v8, v1, v6

    const/4 v9, 0x1

    if-ne v8, v9, :cond_23

    .line 1861
    add-int/lit8 v6, v6, 0x1

    aget-byte v5, v1, v6

    .line 1863
    :cond_23
    add-int/lit8 v6, v6, 0x1

    .line 1865
    new-array v4, v5, [B

    .line 1867
    .local v4, userdata:[B
    const/4 v8, 0x0

    invoke-static {v1, v6, v4, v8, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1869
    new-array v0, v5, [B

    .line 1871
    .local v0, Gstk_Sms_Tpdu:[B
    const/4 v2, 0x0

    .local v2, i:I
    :goto_2e
    add-int/lit8 v8, v5, -0x1

    if-ge v2, v8, :cond_47

    .line 1872
    aget-byte v8, v4, v2

    and-int/lit8 v8, v8, 0x7

    shl-int/lit8 v8, v8, 0x5

    add-int/lit8 v9, v2, 0x1

    aget-byte v9, v4, v9

    and-int/lit16 v9, v9, 0xf8

    shr-int/lit8 v9, v9, 0x3

    or-int/2addr v8, v9

    int-to-byte v8, v8

    aput-byte v8, v0, v2

    .line 1871
    add-int/lit8 v2, v2, 0x1

    goto :goto_2e

    .line 1874
    :cond_47
    return-object v0

    .end local v0           #Gstk_Sms_Tpdu:[B
    .end local v2           #i:I
    .end local v4           #userdata:[B
    .end local v6           #userdata_pos:I
    .restart local v7       #userdata_pos:I
    :cond_48
    move v6, v7

    .end local v7           #userdata_pos:I
    .restart local v6       #userdata_pos:I
    goto :goto_18
.end method

.method processMessagePart(Lcom/android/internal/telephony/InboundSmsTracker;)Z
    .registers 35
    .parameter "tracker"

    .prologue
    .line 948
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getMessageCount()I

    move-result v23

    .line 950
    .local v23, messageCount:I
    const/16 v27, 0x0

    check-cast v27, [[B

    .line 952
    .local v27, pdus:[[B
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getDestPort()I

    move-result v15

    .line 954
    .local v15, destPort:I
    const/4 v3, 0x1

    move/from16 v0, v23

    if-ne v0, v3, :cond_60

    .line 956
    const/4 v3, 0x1

    new-array v0, v3, [[B

    move-object/from16 v27, v0

    .end local v27           #pdus:[[B
    const/4 v3, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getPdu()[B

    move-result-object v4

    aput-object v4, v27, v3

    .line 1077
    .restart local v27       #pdus:[[B
    :cond_1d
    :goto_1d
    new-instance v31, Lcom/android/internal/telephony/InboundSmsHandler$SmsBroadcastReceiver;

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    invoke-direct {v0, v1, v2}, Lcom/android/internal/telephony/InboundSmsHandler$SmsBroadcastReceiver;-><init>(Lcom/android/internal/telephony/InboundSmsHandler;Lcom/android/internal/telephony/InboundSmsTracker;)V

    .line 1079
    .local v31, resultReceiver:Landroid/content/BroadcastReceiver;
    const/16 v3, 0xb84

    if-ne v15, v3, :cond_26d

    .line 1081
    new-instance v25, Ljava/io/ByteArrayOutputStream;

    invoke-direct/range {v25 .. v25}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 1082
    .local v25, output:Ljava/io/ByteArrayOutputStream;
    move-object/from16 v10, v27

    .local v10, arr$:[[B
    array-length v0, v10

    move/from16 v21, v0

    .local v21, len$:I
    const/16 v18, 0x0

    .local v18, i$:I
    :goto_38
    move/from16 v0, v18

    move/from16 v1, v21

    if-ge v0, v1, :cond_220

    aget-object v26, v10, v18

    .line 1084
    .local v26, pdu:[B
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->is3gpp2()Z

    move-result v3

    if-nez v3, :cond_52

    .line 1085
    const-string v3, "3gpp"

    move-object/from16 v0, v26

    invoke-static {v0, v3}, Landroid/telephony/SmsMessage;->createFromPdu([BLjava/lang/String;)Landroid/telephony/SmsMessage;

    move-result-object v24

    .line 1086
    .local v24, msg:Landroid/telephony/SmsMessage;
    invoke-virtual/range {v24 .. v24}, Landroid/telephony/SmsMessage;->getUserData()[B

    move-result-object v26

    .line 1088
    .end local v24           #msg:Landroid/telephony/SmsMessage;
    :cond_52
    const/4 v3, 0x0

    move-object/from16 v0, v26

    array-length v4, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v26

    invoke-virtual {v0, v1, v3, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 1082
    add-int/lit8 v18, v18, 0x1

    goto :goto_38

    .line 959
    .end local v10           #arr$:[[B
    .end local v18           #i$:I
    .end local v21           #len$:I
    .end local v25           #output:Ljava/io/ByteArrayOutputStream;
    .end local v26           #pdu:[B
    .end local v31           #resultReceiver:Landroid/content/BroadcastReceiver;
    :cond_60
    const/4 v13, 0x0

    .line 962
    .local v13, cursor:Landroid/database/Cursor;
    :try_start_61
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getAddress()Ljava/lang/String;

    move-result-object v9

    .line 963
    .local v9, address:Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getReferenceNumber()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v29

    .line 964
    .local v29, refNumber:Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getMessageCount()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v12

    .line 967
    .local v12, count:Ljava/lang/String;
    const/4 v3, 0x3

    new-array v7, v3, [Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v9, v7, v3

    const/4 v3, 0x1

    aput-object v29, v7, v3

    const/4 v3, 0x2

    aput-object v12, v7, v3

    .line 968
    .local v7, whereArgs:[Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mResolver:Landroid/content/ContentResolver;

    sget-object v4, Lcom/android/internal/telephony/InboundSmsHandler;->sRawUri:Landroid/net/Uri;

    sget-object v5, Lcom/android/internal/telephony/InboundSmsHandler;->PDU_SEQUENCE_PORT_PROJECTION:[Ljava/lang/String;

    const-string v6, "address=? AND reference_number=? AND count=?"

    const/4 v8, 0x0

    invoke-virtual/range {v3 .. v8}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v13

    .line 971
    invoke-interface {v13}, Landroid/database/Cursor;->getCount()I

    move-result v14

    .line 972
    .local v14, cursorCount:I
    const-string v3, "InboundSmsHandler"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "cursorCount : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 973
    move/from16 v0, v23

    if-ge v14, v0, :cond_105

    .line 980
    sget-boolean v3, Lcom/android/internal/telephony/InboundSmsHandler;->CSCFEATURE_RIL_LMS_REASSEMBLE_TIMEOUTS_CTC:Z

    if-eqz v3, :cond_fb

    .line 981
    const/4 v3, -0x1

    if-ne v15, v3, :cond_102

    const/16 v17, 0x1

    .line 982
    .local v17, eligibleForPartialDispatch:Z
    :goto_b9
    if-eqz v17, :cond_fb

    .line 983
    new-instance v22, Landroid/telephony/LmsTokenCTC;

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getReferenceNumber()I

    move-result v3

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getFormat()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v22

    move/from16 v1, v23

    invoke-direct {v0, v9, v3, v1, v4}, Landroid/telephony/LmsTokenCTC;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 984
    .local v22, lmsToken:Landroid/telephony/LmsTokenCTC;
    const-string v3, "InboundSmsHandler"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "lmsToken = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v22

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 985
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mLmsAssemblyTracker:Lcom/android/internal/telephony/LmsAssemblyTrackerCTC;

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Lcom/android/internal/telephony/LmsAssemblyTrackerCTC;->hasScheduledFirstDisplayTimeout(Landroid/telephony/LmsTokenCTC;)Z

    move-result v3

    if-nez v3, :cond_fb

    .line 986
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mLmsAssemblyTracker:Lcom/android/internal/telephony/LmsAssemblyTrackerCTC;

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Lcom/android/internal/telephony/LmsAssemblyTrackerCTC;->scheduleFirstDisplayTimeout(Landroid/telephony/LmsTokenCTC;)V
    :try_end_fb
    .catchall {:try_start_61 .. :try_end_fb} :catchall_219
    .catch Landroid/database/SQLException; {:try_start_61 .. :try_end_fb} :catch_207

    .line 993
    .end local v17           #eligibleForPartialDispatch:Z
    .end local v22           #lmsToken:Landroid/telephony/LmsTokenCTC;
    :cond_fb
    const/4 v3, 0x0

    .line 1044
    if-eqz v13, :cond_101

    .line 1045
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    .line 1155
    .end local v7           #whereArgs:[Ljava/lang/String;
    .end local v9           #address:Ljava/lang/String;
    .end local v12           #count:Ljava/lang/String;
    .end local v13           #cursor:Landroid/database/Cursor;
    .end local v14           #cursorCount:I
    .end local v29           #refNumber:Ljava/lang/String;
    :cond_101
    :goto_101
    return v3

    .line 981
    .restart local v7       #whereArgs:[Ljava/lang/String;
    .restart local v9       #address:Ljava/lang/String;
    .restart local v12       #count:Ljava/lang/String;
    .restart local v13       #cursor:Landroid/database/Cursor;
    .restart local v14       #cursorCount:I
    .restart local v29       #refNumber:Ljava/lang/String;
    :cond_102
    const/16 v17, 0x0

    goto :goto_b9

    .line 997
    :cond_105
    :try_start_105
    move/from16 v0, v23

    new-array v0, v0, [[B

    move-object/from16 v27, v0

    .line 998
    :cond_10b
    :goto_10b
    invoke-interface {v13}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_141

    .line 1000
    const/4 v3, 0x1

    invoke-interface {v13, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getIndexOffset()I

    move-result v4

    sub-int v19, v3, v4

    .line 1002
    .local v19, index:I
    const/4 v3, 0x0

    invoke-interface {v13, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/android/internal/util/HexDump;->hexStringToByteArray(Ljava/lang/String;)[B

    move-result-object v3

    aput-object v3, v27, v19

    .line 1006
    if-nez v19, :cond_10b

    const/4 v3, 0x2

    invoke-interface {v13, v3}, Landroid/database/Cursor;->isNull(I)Z

    move-result v3

    if-nez v3, :cond_10b

    .line 1007
    const/4 v3, 0x2

    invoke-interface {v13, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v28

    .line 1009
    .local v28, port:I
    invoke-static/range {v28 .. v28}, Lcom/android/internal/telephony/InboundSmsTracker;->getRealDestPort(I)I

    move-result v28

    .line 1010
    const/4 v3, -0x1

    move/from16 v0, v28

    if-eq v0, v3, :cond_10b

    .line 1011
    move/from16 v15, v28

    goto :goto_10b

    .line 1017
    .end local v19           #index:I
    .end local v28           #port:I
    :cond_141
    invoke-static {}, Lcom/android/internal/telephony/InboundSmsHandler;->getCDMASmsReassembly()Z

    move-result v3

    if-eqz v3, :cond_16d

    .line 1018
    const-string v3, "InboundSmsHandler"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "count for segmented sms in db : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, p0

    iget v5, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mSegmentedSmsCount:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1019
    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mSegmentedSmsCount:I

    add-int/lit8 v3, v3, -0x1

    move-object/from16 v0, p0

    iput v3, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mSegmentedSmsCount:I

    .line 1022
    :cond_16d
    invoke-static {}, Lcom/android/internal/telephony/InboundSmsHandler;->getCDMASmsReassembly()Z

    move-result v3

    if-eqz v3, :cond_192

    const/4 v3, -0x1

    if-ne v15, v3, :cond_192

    move-object/from16 v0, p0

    iget v3, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mSegmentedSmsCount:I

    if-nez v3, :cond_192

    .line 1023
    const-string v3, "InboundSmsHandler"

    const-string v4, "Stop reassemble"

    invoke-static {v3, v4}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1024
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mHandler:Landroid/os/Handler;

    const/16 v4, 0x18

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/android/internal/util/StateMachine;->obtainMessage(I)Landroid/os/Message;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 1028
    :cond_192
    sget-boolean v3, Lcom/android/internal/telephony/InboundSmsHandler;->CSCFEATURE_RIL_LMS_REASSEMBLE_TIMEOUTS_CTC:Z

    if-eqz v3, :cond_200

    const/16 v3, 0xb84

    if-eq v15, v3, :cond_200

    .line 1030
    const-string v3, "InboundSmsHandler"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "LMS receive completely : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getDeleteWhereArgs()[Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1031
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getDeleteWhere()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getDeleteWhereArgs()[Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4}, Lcom/android/internal/telephony/InboundSmsHandler;->deleteFromRawTable(Ljava/lang/String;[Ljava/lang/String;)V

    .line 1032
    new-instance v22, Landroid/telephony/LmsTokenCTC;

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getReferenceNumber()I

    move-result v3

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getFormat()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v22

    move/from16 v1, v23

    invoke-direct {v0, v9, v3, v1, v4}, Landroid/telephony/LmsTokenCTC;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    .line 1033
    .restart local v22       #lmsToken:Landroid/telephony/LmsTokenCTC;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mLmsAssemblyTracker:Lcom/android/internal/telephony/LmsAssemblyTrackerCTC;

    move-object/from16 v0, v22

    invoke-virtual {v3, v0}, Lcom/android/internal/telephony/LmsAssemblyTrackerCTC;->cancelFirstDisplayTimeout(Landroid/telephony/LmsTokenCTC;)V

    .line 1034
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mLmsAssemblyTracker:Lcom/android/internal/telephony/LmsAssemblyTrackerCTC;

    invoke-virtual {v3}, Lcom/android/internal/telephony/LmsAssemblyTrackerCTC;->updateMaximalConnectionTimeAlarm()V

    .line 1035
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v27

    move-object/from16 v2, v22

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchPdusCTC([[BLandroid/telephony/LmsTokenCTC;I)V

    .line 1036
    const/4 v3, 0x3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/util/StateMachine;->sendMessage(I)V
    :try_end_1f8
    .catchall {:try_start_105 .. :try_end_1f8} :catchall_219
    .catch Landroid/database/SQLException; {:try_start_105 .. :try_end_1f8} :catch_207

    .line 1037
    const/4 v3, 0x1

    .line 1044
    if-eqz v13, :cond_101

    .line 1045
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    goto/16 :goto_101

    .line 1044
    .end local v22           #lmsToken:Landroid/telephony/LmsTokenCTC;
    :cond_200
    if-eqz v13, :cond_1d

    .line 1045
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    goto/16 :goto_1d

    .line 1040
    .end local v7           #whereArgs:[Ljava/lang/String;
    .end local v9           #address:Ljava/lang/String;
    .end local v12           #count:Ljava/lang/String;
    .end local v14           #cursorCount:I
    .end local v29           #refNumber:Ljava/lang/String;
    :catch_207
    move-exception v16

    .line 1041
    .local v16, e:Landroid/database/SQLException;
    :try_start_208
    const-string v3, "Can\'t access multipart SMS database"

    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-virtual {v0, v3, v1}, Lcom/android/internal/telephony/InboundSmsHandler;->loge(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_211
    .catchall {:try_start_208 .. :try_end_211} :catchall_219

    .line 1042
    const/4 v3, 0x0

    .line 1044
    if-eqz v13, :cond_101

    .line 1045
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    goto/16 :goto_101

    .line 1044
    .end local v16           #e:Landroid/database/SQLException;
    :catchall_219
    move-exception v3

    if-eqz v13, :cond_21f

    .line 1045
    invoke-interface {v13}, Landroid/database/Cursor;->close()V

    :cond_21f
    throw v3

    .line 1090
    .end local v13           #cursor:Landroid/database/Cursor;
    .restart local v10       #arr$:[[B
    .restart local v18       #i$:I
    .restart local v21       #len$:I
    .restart local v25       #output:Ljava/io/ByteArrayOutputStream;
    .restart local v31       #resultReceiver:Landroid/content/BroadcastReceiver;
    :cond_220
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mWapPush:Lcom/android/internal/telephony/WapPushOverSms;

    invoke-virtual/range {v25 .. v25}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v4

    move-object/from16 v0, v31

    move-object/from16 v1, p0

    invoke-virtual {v3, v4, v0, v1}, Lcom/android/internal/telephony/WapPushOverSms;->dispatchWapPdu([BLandroid/content/BroadcastReceiver;Lcom/android/internal/telephony/InboundSmsHandler;)I

    move-result v30

    .line 1091
    .local v30, result:I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "dispatchWapPdu() returned "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move/from16 v0, v30

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/InboundSmsHandler;->log(Ljava/lang/String;)V

    .line 1094
    const/4 v3, -0x1

    move/from16 v0, v30

    if-eq v0, v3, :cond_262

    .line 1095
    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getDeleteWhere()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getDeleteWhereArgs()[Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4}, Lcom/android/internal/telephony/InboundSmsHandler;->deleteFromRawTable(Ljava/lang/String;[Ljava/lang/String;)V

    .line 1096
    const/4 v3, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/util/StateMachine;->sendMessage(I)V

    .line 1101
    :cond_262
    const/4 v3, -0x1

    move/from16 v0, v30

    if-ne v0, v3, :cond_26a

    const/4 v3, 0x1

    goto/16 :goto_101

    :cond_26a
    const/4 v3, 0x0

    goto/16 :goto_101

    .line 1105
    .end local v10           #arr$:[[B
    .end local v18           #i$:I
    .end local v21           #len$:I
    .end local v25           #output:Ljava/io/ByteArrayOutputStream;
    .end local v30           #result:I
    :cond_26d
    const/4 v3, -0x1

    if-ne v15, v3, :cond_2e6

    .line 1132
    new-instance v20, Landroid/content/Intent;

    const-string v3, "android.provider.Telephony.SMS_DELIVER"

    move-object/from16 v0, v20

    invoke-direct {v0, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1136
    .local v20, intent:Landroid/content/Intent;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mContext:Landroid/content/Context;

    const/4 v4, 0x1

    invoke-static {v3, v4}, Lcom/android/internal/telephony/SmsApplication;->getDefaultSmsApplication(Landroid/content/Context;Z)Landroid/content/ComponentName;

    move-result-object v11

    .line 1137
    .local v11, componentName:Landroid/content/ComponentName;
    if-eqz v11, :cond_2b3

    .line 1139
    move-object/from16 v0, v20

    invoke-virtual {v0, v11}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 1140
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Delivering SMS to: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v11}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v11}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/InboundSmsHandler;->log(Ljava/lang/String;)V

    .line 1148
    .end local v11           #componentName:Landroid/content/ComponentName;
    :cond_2b3
    :goto_2b3
    const-string v3, "pdus"

    move-object/from16 v0, v20

    move-object/from16 v1, v27

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 1149
    const-string v3, "format"

    invoke-virtual/range {p1 .. p1}, Lcom/android/internal/telephony/InboundSmsTracker;->getFormat()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v20

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1151
    const-string v3, "simSlot"

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/telephony/InboundSmsHandler;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v4}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v4

    move-object/from16 v0, v20

    invoke-virtual {v0, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1153
    const-string v3, "android.permission.RECEIVE_SMS"

    const/16 v4, 0x10

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    move-object/from16 v2, v31

    invoke-virtual {v0, v1, v3, v4, v2}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V

    .line 1155
    const/4 v3, 0x1

    goto/16 :goto_101

    .line 1144
    .end local v20           #intent:Landroid/content/Intent;
    :cond_2e6
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "sms://localhost:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v32

    .line 1145
    .local v32, uri:Landroid/net/Uri;
    new-instance v20, Landroid/content/Intent;

    const-string v3, "android.intent.action.DATA_SMS_RECEIVED"

    move-object/from16 v0, v20

    move-object/from16 v1, v32

    invoke-direct {v0, v3, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .restart local v20       #intent:Landroid/content/Intent;
    goto :goto_2b3
.end method

.method protected setCarrierLockEnabled(Ljava/lang/String;)V
    .registers 13
    .parameter "mode"

    .prologue
    .line 2235
    const/4 v0, 0x0

    .line 2237
    .local v0, bufW:Ljava/io/BufferedWriter;
    :try_start_1
    new-instance v6, Ljava/io/File;

    const-string v8, "/efs/sms"

    invoke-direct {v6, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 2239
    .local v6, folder:Ljava/io/File;
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_39

    .line 2240
    invoke-virtual {v6}, Ljava/io/File;->mkdirs()Z

    move-result v7

    .line 2242
    .local v7, status:Z
    const/4 v8, 0x1

    const/4 v9, 0x0

    invoke-virtual {v6, v8, v9}, Ljava/io/File;->setReadable(ZZ)Z

    .line 2243
    const/4 v8, 0x1

    const/4 v9, 0x1

    invoke-virtual {v6, v8, v9}, Ljava/io/File;->setWritable(ZZ)Z

    .line 2244
    const/4 v8, 0x1

    const/4 v9, 0x0

    invoke-virtual {v6, v8, v9}, Ljava/io/File;->setExecutable(ZZ)Z

    .line 2245
    const-string v8, "InboundSmsHandler"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "make folder /efs/sms  directory creation status: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 2248
    .end local v7           #status:Z
    :cond_39
    new-instance v5, Ljava/io/File;

    const-string v8, "/efs/sms/sktcarrierlockmode"

    invoke-direct {v5, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 2249
    .local v5, f:Ljava/io/File;
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v8

    if-nez v8, :cond_55

    .line 2250
    invoke-virtual {v5}, Ljava/io/File;->createNewFile()Z

    .line 2251
    const-string v8, "InboundSmsHandler"

    const-string v9, "make /efs/sms/sktcarrierlockmode"

    invoke-static {v8, v9}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 2252
    const/4 v8, 0x1

    const/4 v9, 0x0

    invoke-virtual {v5, v8, v9}, Ljava/io/File;->setReadable(ZZ)Z
    :try_end_55
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_55} :catch_84
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_55} :catch_9e

    .line 2261
    .end local v5           #f:Ljava/io/File;
    .end local v6           #folder:Ljava/io/File;
    :cond_55
    :goto_55
    :try_start_55
    new-instance v1, Ljava/io/BufferedWriter;

    new-instance v8, Ljava/io/FileWriter;

    const-string v9, "/efs/sms/sktcarrierlockmode"

    invoke-direct {v8, v9}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v8}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_61
    .catch Ljava/io/FileNotFoundException; {:try_start_55 .. :try_end_61} :catch_b8
    .catch Ljava/io/IOException; {:try_start_55 .. :try_end_61} :catch_dc

    .line 2262
    .end local v0           #bufW:Ljava/io/BufferedWriter;
    .local v1, bufW:Ljava/io/BufferedWriter;
    :try_start_61
    invoke-virtual {v1, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 2263
    invoke-virtual {v1}, Ljava/io/BufferedWriter;->flush()V

    .line 2264
    const-string v8, "InboundSmsHandler"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "bufW.write + "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 2265
    invoke-virtual {v1}, Ljava/io/BufferedWriter;->close()V
    :try_end_82
    .catch Ljava/io/FileNotFoundException; {:try_start_61 .. :try_end_82} :catch_103
    .catch Ljava/io/IOException; {:try_start_61 .. :try_end_82} :catch_100

    move-object v0, v1

    .line 2285
    .end local v1           #bufW:Ljava/io/BufferedWriter;
    .restart local v0       #bufW:Ljava/io/BufferedWriter;
    :goto_83
    return-void

    .line 2254
    :catch_84
    move-exception v4

    .line 2255
    .local v4, ex:Ljava/io/FileNotFoundException;
    const-string v8, "InboundSmsHandler"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "FileNotFoundException : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_55

    .line 2256
    .end local v4           #ex:Ljava/io/FileNotFoundException;
    :catch_9e
    move-exception v2

    .line 2257
    .local v2, e:Ljava/io/IOException;
    const-string v8, "InboundSmsHandler"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "IOException : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_55

    .line 2266
    .end local v2           #e:Ljava/io/IOException;
    :catch_b8
    move-exception v4

    .line 2267
    .restart local v4       #ex:Ljava/io/FileNotFoundException;
    :goto_b9
    if-eqz v0, :cond_be

    .line 2269
    :try_start_bb
    invoke-virtual {v0}, Ljava/io/BufferedWriter;->close()V
    :try_end_be
    .catch Ljava/io/IOException; {:try_start_bb .. :try_end_be} :catch_d7

    .line 2274
    :cond_be
    :goto_be
    const-string v8, "InboundSmsHandler"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "FileNotFoundException : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_83

    .line 2270
    :catch_d7
    move-exception v3

    .line 2271
    .local v3, e1:Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_be

    .line 2275
    .end local v3           #e1:Ljava/io/IOException;
    .end local v4           #ex:Ljava/io/FileNotFoundException;
    :catch_dc
    move-exception v2

    .line 2276
    .restart local v2       #e:Ljava/io/IOException;
    :goto_dd
    if-eqz v0, :cond_e2

    .line 2278
    :try_start_df
    invoke-virtual {v0}, Ljava/io/BufferedWriter;->close()V
    :try_end_e2
    .catch Ljava/io/IOException; {:try_start_df .. :try_end_e2} :catch_fb

    .line 2283
    :cond_e2
    :goto_e2
    const-string v8, "InboundSmsHandler"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "IOException : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_83

    .line 2279
    :catch_fb
    move-exception v3

    .line 2280
    .restart local v3       #e1:Ljava/io/IOException;
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_e2

    .line 2275
    .end local v0           #bufW:Ljava/io/BufferedWriter;
    .end local v2           #e:Ljava/io/IOException;
    .end local v3           #e1:Ljava/io/IOException;
    .restart local v1       #bufW:Ljava/io/BufferedWriter;
    :catch_100
    move-exception v2

    move-object v0, v1

    .end local v1           #bufW:Ljava/io/BufferedWriter;
    .restart local v0       #bufW:Ljava/io/BufferedWriter;
    goto :goto_dd

    .line 2266
    .end local v0           #bufW:Ljava/io/BufferedWriter;
    .restart local v1       #bufW:Ljava/io/BufferedWriter;
    :catch_103
    move-exception v4

    move-object v0, v1

    .end local v1           #bufW:Ljava/io/BufferedWriter;
    .restart local v0       #bufW:Ljava/io/BufferedWriter;
    goto :goto_b9
.end method

.method protected storeLatestSmsInfo(Ljava/lang/String;JZ)V
    .registers 10
    .parameter "address"
    .parameter "timestamp"
    .parameter "iscdma"

    .prologue
    .line 2161
    const-string v2, "InboundSmsHandler"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " Storing latest sms information:  for timestamp = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " address = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " in preferences."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/secutil/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2164
    iget-object v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mContext:Landroid/content/Context;

    invoke-static {v2}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 2165
    .local v1, sp:Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 2166
    .local v0, editor:Landroid/content/SharedPreferences$Editor;
    iget-object v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mLatestSmsAddress:Ljava/lang/String;

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 2167
    iget-object v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mLatestSmsTimestamp:Ljava/lang/String;

    invoke-interface {v0, v2, p2, p3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 2169
    if-eqz p4, :cond_49

    .line 2170
    iget-object v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mLatestSmsType:Ljava/lang/String;

    const-string v3, "3gpp2"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 2175
    :goto_45
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 2176
    return-void

    .line 2172
    :cond_49
    iget-object v2, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mLatestSmsType:Ljava/lang/String;

    const-string v3, "3gpp"

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    goto :goto_45
.end method

.method protected storeSMS(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 13
    .parameter "address"
    .parameter "timeStamp"
    .parameter "message"
    .parameter "isInbound"

    .prologue
    const/4 v0, 0x5

    .line 2321
    invoke-static {}, Landroid/sec/enterprise/EnterpriseDeviceManager;->getInstance()Landroid/sec/enterprise/EnterpriseDeviceManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/sec/enterprise/EnterpriseDeviceManager;->getDeviceInventory()Landroid/sec/enterprise/DeviceInventory;

    move-result-object v6

    .line 2322
    .local v6, deviceInventory:Landroid/sec/enterprise/DeviceInventory;
    invoke-static {}, Landroid/sec/enterprise/EnterpriseDeviceManager;->getInstance()Landroid/sec/enterprise/EnterpriseDeviceManager;

    move-result-object v1

    invoke-virtual {v1}, Landroid/sec/enterprise/EnterpriseDeviceManager;->getPhoneRestrictionPolicy()Landroid/sec/enterprise/PhoneRestrictionPolicy;

    move-result-object v7

    .line 2323
    .local v7, phoneRestriction:Landroid/sec/enterprise/PhoneRestrictionPolicy;
    if-nez p4, :cond_1c

    invoke-virtual {v7}, Landroid/sec/enterprise/PhoneRestrictionPolicy;->isLimitNumberOfSmsEnabled()Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 2324
    invoke-virtual {v7}, Landroid/sec/enterprise/PhoneRestrictionPolicy;->addNumberOfOutgoingSms()Z

    .line 2326
    :cond_1c
    if-eqz v6, :cond_27

    invoke-virtual {v6}, Landroid/sec/enterprise/DeviceInventory;->isSMSCaptureEnabled()Z

    move-result v1

    if-eqz v1, :cond_27

    .line 2327
    invoke-virtual {v6, p1, p2, p3, p4}, Landroid/sec/enterprise/DeviceInventory;->storeSMS(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 2330
    :cond_27
    const/4 v2, 0x1

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Sending sms succeeded."

    move v1, v0

    invoke-static/range {v0 .. v5}, Landroid/sec/enterprise/auditlog/AuditLog;->log(IIZILjava/lang/String;Ljava/lang/String;)V

    .line 2334
    return-void
.end method

.method public updatePhoneObject(Lcom/android/internal/telephony/PhoneBase;)V
    .registers 3
    .parameter "phone"

    .prologue
    .line 351
    const/4 v0, 0x7

    invoke-virtual {p0, v0, p1}, Lcom/android/internal/util/StateMachine;->sendMessage(ILjava/lang/Object;)V

    .line 352
    return-void
.end method

.method protected updateVoicemailCount(I)V
    .registers 16
    .parameter "unReadCount"

    .prologue
    .line 2207
    const-string v3, "package"

    .line 2208
    .local v3, PACKAGE_NAME:Ljava/lang/String;
    const-string v2, "class"

    .line 2209
    .local v2, CLASS_NAME:Ljava/lang/String;
    const-string v0, "badgecount"

    .line 2210
    .local v0, BADGECOUNT_NAME:Ljava/lang/String;
    const-string v5, "com.samsung.vvm"

    .line 2211
    .local v5, VVM_PACKAGE:Ljava/lang/String;
    const-string v4, "com.samsung.vvm.vvmapp.VVMApplication"

    .line 2212
    .local v4, VVM_LAUNCHER_CLASS:Ljava/lang/String;
    const-string v1, "content://com.sec.badge/apps"

    .line 2214
    .local v1, BADGE_URI:Ljava/lang/String;
    const-string v11, "VZW"

    const-string v12, ""

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6c

    const-string v11, "true"

    const-string v12, "ro.HorizontalVVM"

    const-string v13, "false"

    invoke-static {v12, v13}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_6c

    .line 2217
    :try_start_26
    iget-object v11, p0, Lcom/android/internal/telephony/InboundSmsHandler;->mContext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v7

    .line 2218
    .local v7, contentResolver:Landroid/content/ContentResolver;
    new-instance v9, Landroid/content/ContentValues;

    invoke-direct {v9}, Landroid/content/ContentValues;-><init>()V

    .line 2219
    .local v9, newValues:Landroid/content/ContentValues;
    const-string v11, "package"

    const-string v12, "com.samsung.vvm"

    invoke-virtual {v9, v11, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2220
    const-string v11, "class"

    const-string v12, "com.samsung.vvm.vvmapp.VVMApplication"

    invoke-virtual {v9, v11, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 2221
    const-string v11, "badgecount"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-virtual {v9, v11, v12}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2222
    const-string v10, "package=\'com.samsung.vvm\' AND class=\'com.samsung.vvm.vvmapp.VVMApplication\'"

    .line 2223
    .local v10, where:Ljava/lang/String;
    const-string v11, "content://com.sec.badge/apps"

    invoke-static {v11}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    .line 2224
    .local v6, badgeUri:Landroid/net/Uri;
    const/4 v11, 0x0

    invoke-virtual {v7, v6, v9, v10, v11}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2225
    const-string v11, "InboundSmsHandler"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Updating Unread count badge: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_6c
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_6c} :catch_6d

    .line 2232
    .end local v6           #badgeUri:Landroid/net/Uri;
    .end local v7           #contentResolver:Landroid/content/ContentResolver;
    .end local v9           #newValues:Landroid/content/ContentValues;
    .end local v10           #where:Ljava/lang/String;
    :cond_6c
    :goto_6c
    return-void

    .line 2226
    :catch_6d
    move-exception v8

    .line 2228
    .local v8, e:Ljava/lang/Exception;
    const-string v11, "InboundSmsHandler"

    const-string v12, "Excecption for upgrading Badge count"

    invoke-static {v11, v12}, Landroid/util/secutil/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2229
    invoke-virtual {v8}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_6c
.end method
