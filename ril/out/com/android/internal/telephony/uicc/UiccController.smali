.class public Lcom/android/internal/telephony/uicc/UiccController;
.super Landroid/os/Handler;
.source "UiccController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/uicc/UiccController$UiccCardBroadcastReceiver;
    }
.end annotation


# static fields
.field public static final APP_FAM_3GPP:I = 0x1

.field public static final APP_FAM_3GPP2:I = 0x2

.field public static final APP_FAM_IMS:I = 0x3

.field private static final DBG:Z = true

.field private static final EVENT_GET_ICC_STATUS_DONE:I = 0x2

.field private static final EVENT_ICC_STATUS_CHANGED:I = 0x1

.field private static final LOG_TAG:Ljava/lang/String; = "UiccController"

.field private static mInstance:[Lcom/android/internal/telephony/uicc/UiccController;

.field private static final mLock:[Ljava/lang/Object;


# instance fields
.field private NoSimNotyFlag:Z

.field private mCi:Lcom/android/internal/telephony/CommandsInterface;

.field private mContext:Landroid/content/Context;

.field private mCurrentPhone:Lcom/android/internal/telephony/PhoneBase;

.field private mIccChangedRegistrants:Landroid/os/RegistrantList;

.field mIccSwapDialog:Landroid/app/AlertDialog;

.field private final mReceiver:Landroid/content/BroadcastReceiver;

.field private mUiccCard:Lcom/android/internal/telephony/uicc/UiccCard;

.field private updateFlag:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 112
    invoke-static {}, Lcom/android/internal/telephony/MultiSimManager;->getSimSlotCount()I

    move-result v1

    new-array v1, v1, [Ljava/lang/Object;

    sput-object v1, Lcom/android/internal/telephony/uicc/UiccController;->mLock:[Ljava/lang/Object;

    .line 113
    invoke-static {}, Lcom/android/internal/telephony/MultiSimManager;->getSimSlotCount()I

    move-result v1

    new-array v1, v1, [Lcom/android/internal/telephony/uicc/UiccController;

    sput-object v1, Lcom/android/internal/telephony/uicc/UiccController;->mInstance:[Lcom/android/internal/telephony/uicc/UiccController;

    .line 134
    const/4 v0, 0x0

    .local v0, simSlot:I
    :goto_11
    invoke-static {}, Lcom/android/internal/telephony/MultiSimManager;->getSimSlotCount()I

    move-result v1

    if-ge v0, v1, :cond_23

    .line 135
    sget-object v1, Lcom/android/internal/telephony/uicc/UiccController;->mLock:[Ljava/lang/Object;

    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    aput-object v2, v1, v0

    .line 134
    add-int/lit8 v0, v0, 0x1

    goto :goto_11

    .line 137
    :cond_23
    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;)V
    .registers 8
    .parameter "c"
    .parameter "ci"

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 252
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 120
    new-instance v1, Landroid/os/RegistrantList;

    invoke-direct {v1}, Landroid/os/RegistrantList;-><init>()V

    iput-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    .line 123
    iput-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCurrentPhone:Lcom/android/internal/telephony/PhoneBase;

    .line 124
    new-instance v1, Lcom/android/internal/telephony/uicc/UiccController$UiccCardBroadcastReceiver;

    invoke-direct {v1, p0, v3}, Lcom/android/internal/telephony/uicc/UiccController$UiccCardBroadcastReceiver;-><init>(Lcom/android/internal/telephony/uicc/UiccController;Lcom/android/internal/telephony/uicc/UiccController$1;)V

    iput-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 125
    iput-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccSwapDialog:Landroid/app/AlertDialog;

    .line 126
    iput-boolean v4, p0, Lcom/android/internal/telephony/uicc/UiccController;->updateFlag:Z

    .line 129
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->NoSimNotyFlag:Z

    .line 253
    const-string v1, "UiccController"

    const-string v2, "Creating UiccController"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 254
    iput-object p1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mContext:Landroid/content/Context;

    .line 255
    iput-object p2, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    .line 256
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v1, p0, v4, v3}, Lcom/android/internal/telephony/CommandsInterface;->registerForIccStatusChanged(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 258
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v1, p0, v4, v3}, Lcom/android/internal/telephony/CommandsInterface;->registerForOn(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 260
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "com.samsung.intent.action.ICC_CARD_STATE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 261
    .local v0, iccCardIntentfilter:Landroid/content/IntentFilter;
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 263
    return-void
.end method

.method private constructor <init>(Lcom/android/internal/telephony/PhoneBase;)V
    .registers 4
    .parameter "phone"

    .prologue
    const/4 v1, 0x0

    .line 168
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 120
    new-instance v0, Landroid/os/RegistrantList;

    invoke-direct {v0}, Landroid/os/RegistrantList;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    .line 123
    iput-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCurrentPhone:Lcom/android/internal/telephony/PhoneBase;

    .line 124
    new-instance v0, Lcom/android/internal/telephony/uicc/UiccController$UiccCardBroadcastReceiver;

    invoke-direct {v0, p0, v1}, Lcom/android/internal/telephony/uicc/UiccController$UiccCardBroadcastReceiver;-><init>(Lcom/android/internal/telephony/uicc/UiccController;Lcom/android/internal/telephony/uicc/UiccController$1;)V

    iput-object v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->mReceiver:Landroid/content/BroadcastReceiver;

    .line 125
    iput-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccSwapDialog:Landroid/app/AlertDialog;

    .line 126
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->updateFlag:Z

    .line 129
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->NoSimNotyFlag:Z

    .line 169
    const-string v0, "UiccController: setCurrentPhone"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 170
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/uicc/UiccController;->setCurrentPhone(Lcom/android/internal/telephony/PhoneBase;)V

    .line 171
    return-void
.end method

.method static synthetic access$100(Lcom/android/internal/telephony/uicc/UiccController;)Z
    .registers 2
    .parameter "x0"

    .prologue
    .line 101
    iget-boolean v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->updateFlag:Z

    return v0
.end method

.method static synthetic access$102(Lcom/android/internal/telephony/uicc/UiccController;Z)Z
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 101
    iput-boolean p1, p0, Lcom/android/internal/telephony/uicc/UiccController;->updateFlag:Z

    return p1
.end method

.method static synthetic access$200(Lcom/android/internal/telephony/uicc/UiccController;Z)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 101
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/uicc/UiccController;->onIccSwap(Z)V

    return-void
.end method

.method static synthetic access$300()[Ljava/lang/Object;
    .registers 1

    .prologue
    .line 101
    sget-object v0, Lcom/android/internal/telephony/uicc/UiccController;->mLock:[Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$400(Lcom/android/internal/telephony/uicc/UiccController;Ljava/lang/String;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 101
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Lcom/android/internal/telephony/uicc/UiccController;)Landroid/content/Context;
    .registers 2
    .parameter "x0"

    .prologue
    .line 101
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public static getInstance(Lcom/android/internal/telephony/PhoneBase;)Lcom/android/internal/telephony/uicc/UiccController;
    .registers 4
    .parameter "phone"

    .prologue
    .line 156
    sget-object v0, Lcom/android/internal/telephony/uicc/UiccController;->mLock:[Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v1

    aget-object v1, v0, v1

    monitor-enter v1

    .line 157
    :try_start_9
    sget-object v0, Lcom/android/internal/telephony/uicc/UiccController;->mInstance:[Lcom/android/internal/telephony/uicc/UiccController;

    invoke-virtual {p0}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v2

    aget-object v0, v0, v2

    if-nez v0, :cond_1e

    .line 158
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v2, "UiccController.getInstance can\'t be called before make()"

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 163
    :catchall_1b
    move-exception v0

    monitor-exit v1
    :try_end_1d
    .catchall {:try_start_9 .. :try_end_1d} :catchall_1b

    throw v0

    .line 161
    :cond_1e
    :try_start_1e
    sget-object v0, Lcom/android/internal/telephony/uicc/UiccController;->mInstance:[Lcom/android/internal/telephony/uicc/UiccController;

    invoke-virtual {p0}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v2

    aget-object v0, v0, v2

    invoke-virtual {v0, p0}, Lcom/android/internal/telephony/uicc/UiccController;->setCurrentPhone(Lcom/android/internal/telephony/PhoneBase;)V

    .line 162
    sget-object v0, Lcom/android/internal/telephony/uicc/UiccController;->mInstance:[Lcom/android/internal/telephony/uicc/UiccController;

    invoke-virtual {p0}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v2

    aget-object v0, v0, v2

    monitor-exit v1
    :try_end_32
    .catchall {:try_start_1e .. :try_end_32} :catchall_1b

    return-object v0
.end method

.method private log(Ljava/lang/String;)V
    .registers 4
    .parameter "string"

    .prologue
    .line 304
    const-string v0, "UiccController"

    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCurrentPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/internal/telephony/MultiSimManager;->appendSimSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 305
    return-void
.end method

.method private loge(Ljava/lang/String;)V
    .registers 4
    .parameter "string"

    .prologue
    .line 447
    const-string v0, "UiccController"

    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCurrentPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/internal/telephony/MultiSimManager;->appendSimSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 448
    return-void
.end method

.method private loge(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 5
    .parameter "string"
    .parameter "tr"

    .prologue
    .line 451
    const-string v0, "UiccController"

    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCurrentPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v1

    invoke-static {v0, v1}, Lcom/android/internal/telephony/MultiSimManager;->appendSimSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1, p2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 452
    return-void
.end method

.method public static make(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;)Lcom/android/internal/telephony/uicc/UiccController;
    .registers 3
    .parameter "c"
    .parameter "ci"

    .prologue
    .line 142
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/android/internal/telephony/uicc/UiccController;->make(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;I)Lcom/android/internal/telephony/uicc/UiccController;

    move-result-object v0

    return-object v0
.end method

.method public static make(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;I)Lcom/android/internal/telephony/uicc/UiccController;
    .registers 6
    .parameter "c"
    .parameter "ci"
    .parameter "simSlot"

    .prologue
    .line 146
    sget-object v0, Lcom/android/internal/telephony/uicc/UiccController;->mLock:[Ljava/lang/Object;

    aget-object v1, v0, p2

    monitor-enter v1

    .line 147
    :try_start_5
    sget-object v0, Lcom/android/internal/telephony/uicc/UiccController;->mInstance:[Lcom/android/internal/telephony/uicc/UiccController;

    aget-object v0, v0, p2

    if-eqz v0, :cond_16

    .line 148
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v2, "UiccController.make() should only be called once"

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 152
    :catchall_13
    move-exception v0

    monitor-exit v1
    :try_end_15
    .catchall {:try_start_5 .. :try_end_15} :catchall_13

    throw v0

    .line 150
    :cond_16
    :try_start_16
    sget-object v0, Lcom/android/internal/telephony/uicc/UiccController;->mInstance:[Lcom/android/internal/telephony/uicc/UiccController;

    new-instance v2, Lcom/android/internal/telephony/uicc/UiccController;

    invoke-direct {v2, p0, p1}, Lcom/android/internal/telephony/uicc/UiccController;-><init>(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;)V

    aput-object v2, v0, p2

    .line 151
    sget-object v0, Lcom/android/internal/telephony/uicc/UiccController;->mInstance:[Lcom/android/internal/telephony/uicc/UiccController;

    aget-object v0, v0, p2

    monitor-exit v1
    :try_end_24
    .catchall {:try_start_16 .. :try_end_24} :catchall_13

    return-object v0
.end method

.method private declared-synchronized onGetIccCardStatusDone(Landroid/os/AsyncResult;)V
    .registers 7
    .parameter "ar"

    .prologue
    .line 266
    monitor-enter p0

    :try_start_1
    iget-object v1, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v1, :cond_10

    .line 267
    const-string v1, "UiccController"

    const-string v2, "Error getting ICC status. RIL_REQUEST_GET_ICC_STATUS should never return an error"

    iget-object v3, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_24

    .line 301
    :goto_e
    monitor-exit p0

    return-void

    .line 273
    :cond_10
    :try_start_10
    iget-object v0, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v0, Lcom/android/internal/telephony/uicc/IccCardStatus;

    .line 275
    .local v0, status:Lcom/android/internal/telephony/uicc/IccCardStatus;
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCard:Lcom/android/internal/telephony/uicc/UiccCard;

    if-nez v1, :cond_3f

    .line 278
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCurrentPhone:Lcom/android/internal/telephony/PhoneBase;

    if-nez v1, :cond_27

    .line 279
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "onGetIccCardStatusDone : mCurrentPhone is null"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_24
    .catchall {:try_start_10 .. :try_end_24} :catchall_24

    .line 266
    .end local v0           #status:Lcom/android/internal/telephony/uicc/IccCardStatus;
    :catchall_24
    move-exception v1

    monitor-exit p0

    throw v1

    .line 282
    .restart local v0       #status:Lcom/android/internal/telephony/uicc/IccCardStatus;
    :cond_27
    :try_start_27
    new-instance v1, Lcom/android/internal/telephony/uicc/UiccCard;

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    iget-object v4, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCurrentPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-direct {v1, v2, v3, v0, v4}, Lcom/android/internal/telephony/uicc/UiccCard;-><init>(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;Lcom/android/internal/telephony/uicc/IccCardStatus;Lcom/android/internal/telephony/PhoneBase;)V

    iput-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCard:Lcom/android/internal/telephony/uicc/UiccCard;

    .line 294
    :goto_34
    const-string v1, "Notifying IccChangedRegistrants"

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 299
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v1}, Landroid/os/RegistrantList;->notifyRegistrants()V

    goto :goto_e

    .line 286
    :cond_3f
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCurrentPhone:Lcom/android/internal/telephony/PhoneBase;

    if-nez v1, :cond_4b

    .line 287
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "onGetIccCardStatusDone : mCurrentPhone is null"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 290
    :cond_4b
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCard:Lcom/android/internal/telephony/uicc/UiccCard;

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    iget-object v4, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCurrentPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1, v2, v3, v0, v4}, Lcom/android/internal/telephony/uicc/UiccCard;->update(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;Lcom/android/internal/telephony/uicc/IccCardStatus;Lcom/android/internal/telephony/PhoneBase;)V
    :try_end_56
    .catchall {:try_start_27 .. :try_end_56} :catchall_24

    goto :goto_34
.end method

.method private onIccSwap(Z)V
    .registers 15
    .parameter "isAdded"

    .prologue
    .line 354
    sget-object v11, Lcom/android/internal/telephony/uicc/UiccController;->mLock:[Ljava/lang/Object;

    monitor-enter v11

    .line 359
    const/4 v4, 0x0

    .line 377
    .local v4, listener:Landroid/content/DialogInterface$OnClickListener;
    :try_start_4
    new-instance v5, Lcom/android/internal/telephony/uicc/UiccController$1;

    invoke-direct {v5, p0}, Lcom/android/internal/telephony/uicc/UiccController$1;-><init>(Lcom/android/internal/telephony/uicc/UiccController;)V
    :try_end_9
    .catchall {:try_start_4 .. :try_end_9} :catchall_d4

    .line 397
    .end local v4           #listener:Landroid/content/DialogInterface$OnClickListener;
    .local v5, listener:Landroid/content/DialogInterface$OnClickListener;
    :try_start_9
    iget-object v10, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccSwapDialog:Landroid/app/AlertDialog;

    if-eqz v10, :cond_17

    .line 398
    const-string v10, "already icc swap dialog showing, dissmiss dialog"

    invoke-direct {p0, v10}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 399
    iget-object v10, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccSwapDialog:Landroid/app/AlertDialog;

    invoke-virtual {v10}, Landroid/app/Dialog;->dismiss()V

    .line 402
    :cond_17
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v7

    .line 407
    .local v7, r:Landroid/content/res/Resources;
    if-eqz p1, :cond_c2

    const v10, 0x10406e1

    invoke-virtual {v7, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 409
    .local v9, title:Ljava/lang/String;
    :goto_24
    if-eqz p1, :cond_cb

    const v10, 0x10406e2

    invoke-virtual {v7, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 411
    .local v6, message:Ljava/lang/String;
    :goto_2d
    const v10, 0x10406e3

    invoke-virtual {v7, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 412
    .local v2, buttonPositive:Ljava/lang/String;
    const/high16 v10, 0x104

    invoke-virtual {v7, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 413
    .local v1, buttonNegative:Ljava/lang/String;
    const/4 v8, 0x4

    .line 418
    .local v8, theme:I
    new-instance v10, Landroid/app/AlertDialog$Builder;

    iget-object v12, p0, Lcom/android/internal/telephony/uicc/UiccController;->mContext:Landroid/content/Context;

    invoke-direct {v10, v12, v8}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v10, v9}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    invoke-virtual {v10, v6}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    invoke-virtual {v10, v2, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v10

    const/4 v12, 0x0

    invoke-virtual {v10, v12}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v3

    .line 424
    .local v3, iccSwapBuilder:Landroid/app/AlertDialog$Builder;
    const-string v10, "SPR"

    const-string v12, ""

    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_7b

    const-string v10, "XAS"

    const-string v12, ""

    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_7b

    const-string v10, "VMU"

    const-string v12, ""

    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_7b

    const-string v10, "BST"

    const-string v12, ""

    invoke-virtual {v10, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_7e

    .line 428
    :cond_7b
    invoke-virtual {v3, v1, v5}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 431
    :cond_7e
    invoke-virtual {v3}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v10

    iput-object v10, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccSwapDialog:Landroid/app/AlertDialog;

    .line 434
    iget-object v10, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccSwapDialog:Landroid/app/AlertDialog;

    invoke-virtual {v10}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v10

    const/16 v12, 0x7da

    invoke-virtual {v10, v12}, Landroid/view/Window;->setType(I)V

    .line 435
    iget-object v10, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccSwapDialog:Landroid/app/AlertDialog;

    invoke-virtual {v10}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v10

    const/4 v12, 0x2

    invoke-virtual {v10, v12}, Landroid/view/Window;->addFlags(I)V

    .line 436
    iget-object v10, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccSwapDialog:Landroid/app/AlertDialog;

    invoke-virtual {v10}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v10

    const/high16 v12, 0x20

    invoke-virtual {v10, v12}, Landroid/view/Window;->addFlags(I)V

    .line 438
    iget-object v10, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccSwapDialog:Landroid/app/AlertDialog;

    invoke-virtual {v10}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 439
    .local v0, attrs:Landroid/view/WindowManager$LayoutParams;
    const/16 v10, 0x10

    iput v10, v0, Landroid/view/WindowManager$LayoutParams;->privateFlags:I

    .line 440
    iget-object v10, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccSwapDialog:Landroid/app/AlertDialog;

    invoke-virtual {v10}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v10

    invoke-virtual {v10, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 442
    iget-object v10, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccSwapDialog:Landroid/app/AlertDialog;

    invoke-virtual {v10}, Landroid/app/Dialog;->show()V

    .line 443
    monitor-exit v11

    .line 444
    return-void

    .line 407
    .end local v0           #attrs:Landroid/view/WindowManager$LayoutParams;
    .end local v1           #buttonNegative:Ljava/lang/String;
    .end local v2           #buttonPositive:Ljava/lang/String;
    .end local v3           #iccSwapBuilder:Landroid/app/AlertDialog$Builder;
    .end local v6           #message:Ljava/lang/String;
    .end local v8           #theme:I
    .end local v9           #title:Ljava/lang/String;
    :cond_c2
    const v10, 0x10406de

    invoke-virtual {v7, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    goto/16 :goto_24

    .line 409
    .restart local v9       #title:Ljava/lang/String;
    :cond_cb
    const v10, 0x10406df

    invoke-virtual {v7, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;
    :try_end_d1
    .catchall {:try_start_9 .. :try_end_d1} :catchall_d7

    move-result-object v6

    goto/16 :goto_2d

    .line 443
    .end local v5           #listener:Landroid/content/DialogInterface$OnClickListener;
    .end local v7           #r:Landroid/content/res/Resources;
    .end local v9           #title:Ljava/lang/String;
    .restart local v4       #listener:Landroid/content/DialogInterface$OnClickListener;
    :catchall_d4
    move-exception v10

    :goto_d5
    :try_start_d5
    monitor-exit v11
    :try_end_d6
    .catchall {:try_start_d5 .. :try_end_d6} :catchall_d4

    throw v10

    .end local v4           #listener:Landroid/content/DialogInterface$OnClickListener;
    .restart local v5       #listener:Landroid/content/DialogInterface$OnClickListener;
    :catchall_d7
    move-exception v10

    move-object v4, v5

    .end local v5           #listener:Landroid/content/DialogInterface$OnClickListener;
    .restart local v4       #listener:Landroid/content/DialogInterface$OnClickListener;
    goto :goto_d5
.end method


# virtual methods
.method public dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .registers 7
    .parameter "fd"
    .parameter "pw"
    .parameter "args"

    .prologue
    .line 308
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "UiccController: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 309
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mContext="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 310
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mInstance="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/android/internal/telephony/uicc/UiccController;->mInstance:[Lcom/android/internal/telephony/uicc/UiccController;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 311
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mCi="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 312
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mUiccCard="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCard:Lcom/android/internal/telephony/uicc/UiccCard;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 313
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mIccChangedRegistrants: size="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v2}, Landroid/os/RegistrantList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 314
    const/4 v0, 0x0

    .local v0, i:I
    :goto_93
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v1}, Landroid/os/RegistrantList;->size()I

    move-result v1

    if-ge v0, v1, :cond_ca

    .line 315
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "  mIccChangedRegistrants["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v1, v0}, Landroid/os/RegistrantList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Registrant;

    invoke-virtual {v1}, Landroid/os/Registrant;->getHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 314
    add-int/lit8 v0, v0, 0x1

    goto :goto_93

    .line 318
    :cond_ca
    invoke-virtual {p2}, Ljava/io/PrintWriter;->println()V

    .line 319
    invoke-virtual {p2}, Ljava/io/PrintWriter;->flush()V

    .line 320
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCard:Lcom/android/internal/telephony/uicc/UiccCard;

    if-eqz v1, :cond_d9

    .line 321
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCard:Lcom/android/internal/telephony/uicc/UiccCard;

    invoke-virtual {v1, p1, p2, p3}, Lcom/android/internal/telephony/uicc/UiccCard;->dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 323
    :cond_d9
    return-void
.end method

.method public getIccFileHandler(I)Lcom/android/internal/telephony/uicc/IccFileHandler;
    .registers 5
    .parameter "family"

    .prologue
    .line 205
    sget-object v1, Lcom/android/internal/telephony/uicc/UiccController;->mLock:[Ljava/lang/Object;

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCurrentPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v2

    aget-object v2, v1, v2

    monitor-enter v2

    .line 206
    :try_start_b
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCard:Lcom/android/internal/telephony/uicc/UiccCard;

    if-eqz v1, :cond_1d

    .line 207
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCard:Lcom/android/internal/telephony/uicc/UiccCard;

    invoke-virtual {v1, p1}, Lcom/android/internal/telephony/uicc/UiccCard;->getApplication(I)Lcom/android/internal/telephony/uicc/UiccCardApplication;

    move-result-object v0

    .line 208
    .local v0, app:Lcom/android/internal/telephony/uicc/UiccCardApplication;
    if-eqz v0, :cond_1d

    .line 209
    invoke-virtual {v0}, Lcom/android/internal/telephony/uicc/UiccCardApplication;->getIccFileHandler()Lcom/android/internal/telephony/uicc/IccFileHandler;

    move-result-object v1

    monitor-exit v2

    .line 212
    .end local v0           #app:Lcom/android/internal/telephony/uicc/UiccCardApplication;
    :goto_1c
    return-object v1

    :cond_1d
    const/4 v1, 0x0

    monitor-exit v2

    goto :goto_1c

    .line 213
    :catchall_20
    move-exception v1

    monitor-exit v2
    :try_end_22
    .catchall {:try_start_b .. :try_end_22} :catchall_20

    throw v1
.end method

.method public getIccRecords(I)Lcom/android/internal/telephony/uicc/IccRecords;
    .registers 5
    .parameter "family"

    .prologue
    .line 192
    sget-object v1, Lcom/android/internal/telephony/uicc/UiccController;->mLock:[Ljava/lang/Object;

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCurrentPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v2

    aget-object v2, v1, v2

    monitor-enter v2

    .line 193
    :try_start_b
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCard:Lcom/android/internal/telephony/uicc/UiccCard;

    if-eqz v1, :cond_1d

    .line 194
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCard:Lcom/android/internal/telephony/uicc/UiccCard;

    invoke-virtual {v1, p1}, Lcom/android/internal/telephony/uicc/UiccCard;->getApplication(I)Lcom/android/internal/telephony/uicc/UiccCardApplication;

    move-result-object v0

    .line 195
    .local v0, app:Lcom/android/internal/telephony/uicc/UiccCardApplication;
    if-eqz v0, :cond_1d

    .line 196
    invoke-virtual {v0}, Lcom/android/internal/telephony/uicc/UiccCardApplication;->getIccRecords()Lcom/android/internal/telephony/uicc/IccRecords;

    move-result-object v1

    monitor-exit v2

    .line 199
    .end local v0           #app:Lcom/android/internal/telephony/uicc/UiccCardApplication;
    :goto_1c
    return-object v1

    :cond_1d
    const/4 v1, 0x0

    monitor-exit v2

    goto :goto_1c

    .line 200
    :catchall_20
    move-exception v1

    monitor-exit v2
    :try_end_22
    .catchall {:try_start_b .. :try_end_22} :catchall_20

    throw v1
.end method

.method public getUiccCard()Lcom/android/internal/telephony/uicc/UiccCard;
    .registers 3

    .prologue
    .line 175
    sget-object v0, Lcom/android/internal/telephony/uicc/UiccController;->mLock:[Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCurrentPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v1

    aget-object v1, v0, v1

    monitor-enter v1

    .line 176
    :try_start_b
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCard:Lcom/android/internal/telephony/uicc/UiccCard;

    monitor-exit v1

    return-object v0

    .line 177
    :catchall_f
    move-exception v0

    monitor-exit v1
    :try_end_11
    .catchall {:try_start_b .. :try_end_11} :catchall_f

    throw v0
.end method

.method public getUiccCardApplication(I)Lcom/android/internal/telephony/uicc/UiccCardApplication;
    .registers 4
    .parameter "family"

    .prologue
    .line 182
    sget-object v0, Lcom/android/internal/telephony/uicc/UiccController;->mLock:[Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCurrentPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v1

    aget-object v1, v0, v1

    monitor-enter v1

    .line 183
    :try_start_b
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCard:Lcom/android/internal/telephony/uicc/UiccCard;

    if-eqz v0, :cond_17

    .line 184
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCard:Lcom/android/internal/telephony/uicc/UiccCard;

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/uicc/UiccCard;->getApplication(I)Lcom/android/internal/telephony/uicc/UiccCardApplication;

    move-result-object v0

    monitor-exit v1

    .line 186
    :goto_16
    return-object v0

    :cond_17
    const/4 v0, 0x0

    monitor-exit v1

    goto :goto_16

    .line 187
    :catchall_1a
    move-exception v0

    monitor-exit v1
    :try_end_1c
    .catchall {:try_start_b .. :try_end_1c} :catchall_1a

    throw v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .registers 7
    .parameter "msg"

    .prologue
    .line 235
    sget-object v1, Lcom/android/internal/telephony/uicc/UiccController;->mLock:[Ljava/lang/Object;

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCurrentPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v2

    aget-object v2, v1, v2

    monitor-enter v2

    .line 236
    :try_start_b
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_4c

    .line 247
    const-string v1, "UiccController"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " Unknown Event "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p1, Landroid/os/Message;->what:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    :goto_2a
    monitor-exit v2

    .line 250
    return-void

    .line 238
    :pswitch_2c
    const-string v1, "Received EVENT_ICC_STATUS_CHANGED, calling getIccCardStatus"

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 239
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/4 v3, 0x2

    invoke-virtual {p0, v3}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v3

    invoke-interface {v1, v3}, Lcom/android/internal/telephony/CommandsInterface;->getIccCardStatus(Landroid/os/Message;)V

    goto :goto_2a

    .line 249
    :catchall_3c
    move-exception v1

    monitor-exit v2
    :try_end_3e
    .catchall {:try_start_b .. :try_end_3e} :catchall_3c

    throw v1

    .line 242
    :pswitch_3f
    :try_start_3f
    const-string v1, "Received EVENT_GET_ICC_STATUS_DONE"

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 243
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 244
    .local v0, ar:Landroid/os/AsyncResult;
    invoke-direct {p0, v0}, Lcom/android/internal/telephony/uicc/UiccController;->onGetIccCardStatusDone(Landroid/os/AsyncResult;)V
    :try_end_4b
    .catchall {:try_start_3f .. :try_end_4b} :catchall_3c

    goto :goto_2a

    .line 236
    :pswitch_data_4c
    .packed-switch 0x1
        :pswitch_2c
        :pswitch_3f
    .end packed-switch
.end method

.method public registerForIccChanged(Landroid/os/Handler;ILjava/lang/Object;)V
    .registers 7
    .parameter "h"
    .parameter "what"
    .parameter "obj"

    .prologue
    .line 218
    sget-object v1, Lcom/android/internal/telephony/uicc/UiccController;->mLock:[Ljava/lang/Object;

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCurrentPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v2

    aget-object v2, v1, v2

    monitor-enter v2

    .line 219
    :try_start_b
    new-instance v0, Landroid/os/Registrant;

    invoke-direct {v0, p1, p2, p3}, Landroid/os/Registrant;-><init>(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 220
    .local v0, r:Landroid/os/Registrant;
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v1, v0}, Landroid/os/RegistrantList;->add(Landroid/os/Registrant;)V

    .line 223
    invoke-virtual {v0}, Landroid/os/Registrant;->notifyRegistrant()V

    .line 224
    monitor-exit v2

    .line 225
    return-void

    .line 224
    .end local v0           #r:Landroid/os/Registrant;
    :catchall_1a
    move-exception v1

    monitor-exit v2
    :try_end_1c
    .catchall {:try_start_b .. :try_end_1c} :catchall_1a

    throw v1
.end method

.method public setCurrentPhone(Lcom/android/internal/telephony/PhoneBase;)V
    .registers 4
    .parameter "phone"

    .prologue
    .line 348
    sget-object v0, Lcom/android/internal/telephony/uicc/UiccController;->mLock:[Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v1

    aget-object v1, v0, v1

    monitor-enter v1

    .line 349
    :try_start_9
    iput-object p1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCurrentPhone:Lcom/android/internal/telephony/PhoneBase;

    .line 350
    monitor-exit v1

    .line 351
    return-void

    .line 350
    :catchall_d
    move-exception v0

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_9 .. :try_end_f} :catchall_d

    throw v0
.end method

.method public unregisterForIccChanged(Landroid/os/Handler;)V
    .registers 4
    .parameter "h"

    .prologue
    .line 228
    sget-object v0, Lcom/android/internal/telephony/uicc/UiccController;->mLock:[Ljava/lang/Object;

    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCurrentPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v1

    aget-object v1, v0, v1

    monitor-enter v1

    .line 229
    :try_start_b
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v0, p1}, Landroid/os/RegistrantList;->remove(Landroid/os/Handler;)V

    .line 230
    monitor-exit v1

    .line 231
    return-void

    .line 230
    :catchall_12
    move-exception v0

    monitor-exit v1
    :try_end_14
    .catchall {:try_start_b .. :try_end_14} :catchall_12

    throw v0
.end method
