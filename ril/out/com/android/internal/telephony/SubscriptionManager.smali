.class public Lcom/android/internal/telephony/SubscriptionManager;
.super Landroid/os/Handler;
.source "SubscriptionManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;,
        Lcom/android/internal/telephony/SubscriptionManager$PhoneSubscriptionInfo;,
        Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;
    }
.end annotation


# static fields
.field private static final EVENT_ALL_CARD_INFO_AVAILABLE:I = 0x2

.field private static final EVENT_CARD_INFO_AVAILABLE:I = 0x0

.field private static final EVENT_CARD_INFO_NOT_AVAILABLE:I = 0x1

.field private static final EVENT_PROCESS_AVAILABLE_CARDS:I = 0xb

.field private static final EVENT_RADIO_OFF_OR_NOT_AVAILABLE:I = 0xa

.field private static final EVENT_RADIO_ON:I = 0x9

.field private static final EVENT_SET_DATA_SUBSCRIPTION_DONE:I = 0x5

.field private static final EVENT_SET_UICC_SUBSCRIPTION_DONE:I = 0x3

.field private static final EVENT_SUBSCRIPTION_STATUS_CHANGED:I = 0x4

.field static final LOG_TAG:Ljava/lang/String; = "SubscriptionManager"

.field public static final SUB_ACTIVATE_FAILED:Ljava/lang/String; = "ACTIVATE FAILED"

.field public static final SUB_ACTIVATE_NOT_SUPPORTED:Ljava/lang/String; = "ACTIVATE NOT SUPPORTED"

.field public static final SUB_ACTIVATE_SUCCESS:Ljava/lang/String; = "ACTIVATE SUCCESS"

.field public static final SUB_DEACTIVATE_FAILED:Ljava/lang/String; = "DEACTIVATE FAILED"

.field public static final SUB_DEACTIVATE_NOT_SUPPORTED:Ljava/lang/String; = "DEACTIVATE NOT SUPPORTED"

.field public static final SUB_DEACTIVATE_SUCCESS:Ljava/lang/String; = "DEACTIVATE SUCCESS"

.field public static final SUB_NOT_CHANGED:Ljava/lang/String; = "NO CHANGE IN SUBSCRIPTION"

.field private static final SUB_STATUS_ACTIVATED:I = 0x1

.field private static final SUB_STATUS_DEACTIVATED:I

.field private static mContext:Landroid/content/Context;

.field private static sSubscriptionManager:Lcom/android/internal/telephony/SubscriptionManager;


# instance fields
.field private isSimReset:[Z

.field private mActivatePending:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;",
            "Lcom/android/internal/telephony/Subscription;",
            ">;"
        }
    .end annotation
.end field

.field private mAllCardsStatusAvailable:Z

.field private mCardCount:I

.field private mCardInfoAvailable:[Z

.field private mCardSubMgr:Lcom/android/internal/telephony/CardSubscriptionManager;

.field private mCi:[Lcom/android/internal/telephony/CommandsInterface;

.field private mCurrentDds:I

.field private mCurrentSubscriptions:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;",
            "Lcom/android/internal/telephony/SubscriptionManager$PhoneSubscriptionInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mDataActive:Z

.field private mDeactivatePending:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;",
            "Lcom/android/internal/telephony/Subscription;",
            ">;"
        }
    .end annotation
.end field

.field private mDisableDdsInProgress:Z

.field private mFlagAllCardsInfo:Z

.field private mIsNewCard:[Z

.field private mNumPhones:I

.field mOldICCID:Ljava/lang/String;

.field private mProxyPhone:[Lcom/android/internal/telephony/Phone;

.field private mQueuedDds:I

.field private mRadioOn:[Z

.field private mSetDdsCompleteMsg:Landroid/os/Message;

.field private mSetDdsRequired:Z

.field private mSetSubscriptionInProgress:Z

.field private mSetSubscriptionRegistrants:Landroid/os/RegistrantList;

.field private mSubActivatedRegistrants:[Landroid/os/RegistrantList;

.field private mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

.field private mSubResult:[Ljava/lang/String;


# direct methods
.method private constructor <init>(Landroid/content/Context;[Lcom/android/internal/telephony/CommandsInterface;)V
    .registers 10
    .parameter "context"
    .parameter "ci"

    .prologue
    const/4 v4, 0x1

    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 216
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 109
    invoke-static {}, Lcom/android/internal/telephony/MultiSimManager;->getSimSlotCount()I

    move-result v2

    iput v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    .line 144
    iget v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    new-array v2, v2, [Z

    iput-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCardInfoAvailable:[Z

    .line 145
    iget v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    new-array v2, v2, [Z

    iput-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mIsNewCard:[Z

    .line 146
    iget v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    new-array v2, v2, [Z

    iput-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mRadioOn:[Z

    .line 147
    iget v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    new-array v2, v2, [Z

    iput-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->isSimReset:[Z

    .line 148
    iget v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    new-array v2, v2, [Ljava/lang/String;

    iput-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSubResult:[Ljava/lang/String;

    .line 155
    iput-boolean v5, p0, Lcom/android/internal/telephony/SubscriptionManager;->mAllCardsStatusAvailable:Z

    .line 157
    iput-boolean v4, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetDdsRequired:Z

    .line 163
    iput-boolean v5, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetSubscriptionInProgress:Z

    .line 165
    iput-boolean v5, p0, Lcom/android/internal/telephony/SubscriptionManager;->mDataActive:Z

    .line 169
    new-instance v2, Landroid/os/RegistrantList;

    invoke-direct {v2}, Landroid/os/RegistrantList;-><init>()V

    iput-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetSubscriptionRegistrants:Landroid/os/RegistrantList;

    .line 171
    iput v5, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCardCount:I

    .line 173
    iput-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mOldICCID:Ljava/lang/String;

    .line 175
    iput-boolean v5, p0, Lcom/android/internal/telephony/SubscriptionManager;->mFlagAllCardsInfo:Z

    .line 217
    const-string v2, "SubscriptionManager"

    const-string v3, "Constructor - Enter"

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 219
    sput-object p1, Lcom/android/internal/telephony/SubscriptionManager;->mContext:Landroid/content/Context;

    .line 221
    invoke-static {p1, p2}, Lcom/android/internal/telephony/CardSubscriptionManager;->getInstance(Landroid/content/Context;[Lcom/android/internal/telephony/CommandsInterface;)Lcom/android/internal/telephony/CardSubscriptionManager;

    move-result-object v2

    iput-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/CardSubscriptionManager;

    .line 222
    iget v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    new-array v2, v2, [Landroid/os/RegistrantList;

    iput-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

    .line 223
    iget v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    new-array v2, v2, [Landroid/os/RegistrantList;

    iput-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    .line 224
    const/4 v0, 0x0

    .local v0, i:I
    :goto_5b
    iget v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v0, v2, :cond_88

    .line 225
    iget-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/CardSubscriptionManager;

    new-instance v3, Ljava/lang/Integer;

    invoke-direct {v3, v0}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v0, p0, v5, v3}, Lcom/android/internal/telephony/CardSubscriptionManager;->registerForCardInfoAvailable(ILandroid/os/Handler;ILjava/lang/Object;)V

    .line 227
    iget-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/CardSubscriptionManager;

    new-instance v3, Ljava/lang/Integer;

    invoke-direct {v3, v0}, Ljava/lang/Integer;-><init>(I)V

    invoke-virtual {v2, v0, p0, v4, v3}, Lcom/android/internal/telephony/CardSubscriptionManager;->registerForCardInfoUnavailable(ILandroid/os/Handler;ILjava/lang/Object;)V

    .line 230
    iget-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

    new-instance v3, Landroid/os/RegistrantList;

    invoke-direct {v3}, Landroid/os/RegistrantList;-><init>()V

    aput-object v3, v2, v0

    .line 231
    iget-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    new-instance v3, Landroid/os/RegistrantList;

    invoke-direct {v3}, Landroid/os/RegistrantList;-><init>()V

    aput-object v3, v2, v0

    .line 224
    add-int/lit8 v0, v0, 0x1

    goto :goto_5b

    .line 233
    :cond_88
    iget-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/CardSubscriptionManager;

    const/4 v3, 0x2

    invoke-virtual {v2, p0, v3, v6}, Lcom/android/internal/telephony/CardSubscriptionManager;->registerForAllCardsInfoAvailable(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 235
    iput-object p2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    .line 236
    const/4 v0, 0x0

    :goto_91
    iget v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v0, v2, :cond_d1

    .line 237
    iget-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v2, v2, v0

    const/4 v3, 0x4

    new-instance v4, Ljava/lang/Integer;

    invoke-direct {v4, v0}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v2, p0, v3, v4}, Lcom/android/internal/telephony/CommandsInterface;->registerForSubscriptionStatusChanged(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 239
    iget-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v2, v2, v0

    const/16 v3, 0xa

    new-instance v4, Ljava/lang/Integer;

    invoke-direct {v4, v0}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v2, p0, v3, v4}, Lcom/android/internal/telephony/CommandsInterface;->registerForOffOrNotAvailable(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 241
    iget-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v2, v2, v0

    const/16 v3, 0x9

    new-instance v4, Ljava/lang/Integer;

    invoke-direct {v4, v0}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v2, p0, v3, v4}, Lcom/android/internal/telephony/CommandsInterface;->registerForOn(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 243
    iget-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCardInfoAvailable:[Z

    aput-boolean v5, v2, v0

    .line 244
    iget-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mIsNewCard:[Z

    aput-boolean v5, v2, v0

    .line 245
    iget-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mRadioOn:[Z

    aput-boolean v5, v2, v0

    .line 246
    iget-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->isSimReset:[Z

    aput-boolean v5, v2, v0

    .line 236
    add-int/lit8 v0, v0, 0x1

    goto :goto_91

    .line 249
    :cond_d1
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    .line 250
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    .line 251
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    iput-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    .line 252
    const/4 v0, 0x0

    :goto_e7
    iget v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v0, v2, :cond_108

    .line 253
    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v2

    aget-object v1, v2, v0

    .line 254
    .local v1, sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    iget-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-virtual {v2, v1, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 255
    iget-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-virtual {v2, v1, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    iget-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    new-instance v3, Lcom/android/internal/telephony/SubscriptionManager$PhoneSubscriptionInfo;

    invoke-direct {v3, p0}, Lcom/android/internal/telephony/SubscriptionManager$PhoneSubscriptionInfo;-><init>(Lcom/android/internal/telephony/SubscriptionManager;)V

    invoke-virtual {v2, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    add-int/lit8 v0, v0, 0x1

    goto :goto_e7

    .line 260
    .end local v1           #sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    :cond_108
    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager;->getDataSubscription()I

    move-result v2

    iput v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCurrentDds:I

    .line 261
    const-string v2, "SubscriptionManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "constructor current active dds is:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    const-string v2, "SubscriptionManager"

    const-string v3, "Constructor - Exit"

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    return-void
.end method

.method private getCurrentSubscription(Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/Subscription;
    .registers 3
    .parameter "subId"

    .prologue
    .line 1056
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/SubscriptionManager$PhoneSubscriptionInfo;

    iget-object v0, v0, Lcom/android/internal/telephony/SubscriptionManager$PhoneSubscriptionInfo;->sub:Lcom/android/internal/telephony/Subscription;

    return-object v0
.end method

.method private getCurrentSubscriptionReadiness(Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;)Z
    .registers 3
    .parameter "subId"

    .prologue
    .line 1068
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/SubscriptionManager$PhoneSubscriptionInfo;

    iget-boolean v0, v0, Lcom/android/internal/telephony/SubscriptionManager$PhoneSubscriptionInfo;->subReady:Z

    return v0
.end method

.method private getCurrentSubscriptionStatus(Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/Subscription$SubscriptionStatus;
    .registers 3
    .parameter "subId"

    .prologue
    .line 1064
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/SubscriptionManager$PhoneSubscriptionInfo;

    iget-object v0, v0, Lcom/android/internal/telephony/SubscriptionManager$PhoneSubscriptionInfo;->sub:Lcom/android/internal/telephony/Subscription;

    iget-object v0, v0, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    return-object v0
.end method

.method public static getDataSubscription()I
    .registers 2

    .prologue
    .line 1282
    const-string v0, "persist.sys.dataprefer.simid"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getInstance()Lcom/android/internal/telephony/SubscriptionManager;
    .registers 1

    .prologue
    .line 207
    sget-object v0, Lcom/android/internal/telephony/SubscriptionManager;->sSubscriptionManager:Lcom/android/internal/telephony/SubscriptionManager;

    return-object v0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;[Lcom/android/internal/telephony/CommandsInterface;)Lcom/android/internal/telephony/SubscriptionManager;
    .registers 5
    .parameter "context"
    .parameter "ci"

    .prologue
    .line 195
    const-class v1, Lcom/android/internal/telephony/SubscriptionManager;

    monitor-enter v1

    :try_start_3
    const-string v0, "SubscriptionManager"

    const-string v2, "getInstance"

    invoke-static {v0, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    sget-object v0, Lcom/android/internal/telephony/SubscriptionManager;->sSubscriptionManager:Lcom/android/internal/telephony/SubscriptionManager;

    if-nez v0, :cond_15

    .line 197
    new-instance v0, Lcom/android/internal/telephony/SubscriptionManager;

    invoke-direct {v0, p0, p1}, Lcom/android/internal/telephony/SubscriptionManager;-><init>(Landroid/content/Context;[Lcom/android/internal/telephony/CommandsInterface;)V

    sput-object v0, Lcom/android/internal/telephony/SubscriptionManager;->sSubscriptionManager:Lcom/android/internal/telephony/SubscriptionManager;

    .line 199
    :cond_15
    sget-object v0, Lcom/android/internal/telephony/SubscriptionManager;->sSubscriptionManager:Lcom/android/internal/telephony/SubscriptionManager;
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_19

    monitor-exit v1

    return-object v0

    .line 195
    :catchall_19
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private isAllCardsInfoAvailable()Z
    .registers 9

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 760
    const/4 v4, 0x1

    .line 761
    .local v4, result:Z
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCardInfoAvailable:[Z

    .local v0, arr$:[Z
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_7
    if-ge v2, v3, :cond_15

    aget-boolean v1, v0, v2

    .line 762
    .local v1, available:Z
    if-eqz v4, :cond_13

    if-eqz v1, :cond_13

    move v4, v5

    .line 761
    :goto_10
    add-int/lit8 v2, v2, 0x1

    goto :goto_7

    :cond_13
    move v4, v6

    .line 762
    goto :goto_10

    .line 764
    .end local v1           #available:Z
    :cond_15
    if-nez v4, :cond_1b

    iget-boolean v7, p0, Lcom/android/internal/telephony/SubscriptionManager;->mAllCardsStatusAvailable:Z

    if-eqz v7, :cond_1c

    :cond_1b
    move v6, v5

    :cond_1c
    return v6
.end method

.method private isAllRadioOn()Z
    .registers 6

    .prologue
    .line 752
    const/4 v4, 0x1

    .line 753
    .local v4, result:Z
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mRadioOn:[Z

    .local v0, arr$:[Z
    array-length v2, v0

    .local v2, len$:I
    const/4 v1, 0x0

    .local v1, i$:I
    :goto_5
    if-ge v1, v2, :cond_13

    aget-boolean v3, v0, v1

    .line 754
    .local v3, radioOn:Z
    if-eqz v4, :cond_11

    if-eqz v3, :cond_11

    const/4 v4, 0x1

    .line 753
    :goto_e
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 754
    :cond_11
    const/4 v4, 0x0

    goto :goto_e

    .line 756
    .end local v3           #radioOn:Z
    :cond_13
    return v4
.end method

.method private isAnyPendingActivateRequest(I)Z
    .registers 5
    .parameter "subId"

    .prologue
    .line 1000
    iget-object v1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v2

    aget-object v2, v2, p1

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Subscription;

    .line 1001
    .local v0, newSub:Lcom/android/internal/telephony/Subscription;
    if-eqz v0, :cond_18

    iget-object v1, v0, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    sget-object v2, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    if-ne v1, v2, :cond_18

    .line 1003
    const/4 v1, 0x1

    .line 1005
    :goto_17
    return v1

    :cond_18
    const/4 v1, 0x0

    goto :goto_17
.end method

.method private isPresentInActivatePendingList(Lcom/android/internal/telephony/Subscription;)Z
    .registers 6
    .parameter "userSub"

    .prologue
    .line 741
    const/4 v1, 0x0

    .local v1, i:I
    :goto_1
    iget v3, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v1, v3, :cond_20

    .line 742
    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v3

    aget-object v2, v3, v1

    .line 743
    .local v2, sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    iget-object v3, p0, Lcom/android/internal/telephony/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Subscription;

    .line 744
    .local v0, actPendingSub:Lcom/android/internal/telephony/Subscription;
    if-eqz p1, :cond_1d

    invoke-virtual {p1, v0}, Lcom/android/internal/telephony/Subscription;->isSame(Lcom/android/internal/telephony/Subscription;)Z

    move-result v3

    if-eqz v3, :cond_1d

    .line 745
    const/4 v3, 0x1

    .line 748
    .end local v0           #actPendingSub:Lcom/android/internal/telephony/Subscription;
    .end local v2           #sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    :goto_1c
    return v3

    .line 741
    .restart local v0       #actPendingSub:Lcom/android/internal/telephony/Subscription;
    .restart local v2       #sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    :cond_1d
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 748
    .end local v0           #actPendingSub:Lcom/android/internal/telephony/Subscription;
    .end local v2           #sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    :cond_20
    const/4 v3, 0x0

    goto :goto_1c
.end method

.method private notifySubscriptionActivated(I)V
    .registers 3
    .parameter "subId"

    .prologue
    .line 1089
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 1090
    return-void
.end method

.method private notifySubscriptionDeactivated(I)V
    .registers 3
    .parameter "subId"

    .prologue
    .line 1081
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v0, v0, p1

    invoke-virtual {v0}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 1082
    return-void
.end method

.method private printPendingActivateRequests()V
    .registers 7

    .prologue
    .line 821
    const-string v3, "SubscriptionManager"

    const-string v4, "ActivatePending Queue : "

    invoke-static {v3, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 822
    const/4 v0, 0x0

    .local v0, i:I
    :goto_8
    iget v3, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v0, v3, :cond_39

    .line 823
    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v3

    aget-object v2, v3, v0

    .line 824
    .local v2, sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    iget-object v3, p0, Lcom/android/internal/telephony/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/Subscription;

    .line 825
    .local v1, newSub:Lcom/android/internal/telephony/Subscription;
    const-string v3, "SubscriptionManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 822
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 827
    .end local v1           #newSub:Lcom/android/internal/telephony/Subscription;
    .end local v2           #sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    :cond_39
    return-void
.end method

.method private printPendingDeactivateRequests()V
    .registers 7

    .prologue
    .line 833
    const-string v3, "SubscriptionManager"

    const-string v4, "DeactivatePending Queue : "

    invoke-static {v3, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 834
    const/4 v0, 0x0

    .local v0, i:I
    :goto_8
    iget v3, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v0, v3, :cond_39

    .line 835
    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v3

    aget-object v2, v3, v0

    .line 836
    .local v2, sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    iget-object v3, p0, Lcom/android/internal/telephony/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/Subscription;

    .line 837
    .local v1, newSub:Lcom/android/internal/telephony/Subscription;
    const-string v3, "SubscriptionManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 834
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 839
    .end local v1           #newSub:Lcom/android/internal/telephony/Subscription;
    .end local v2           #sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    :cond_39
    return-void
.end method

.method private processActivateRequests()V
    .registers 4

    .prologue
    .line 899
    const-string v0, "SubscriptionManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "processActivateRequests: mSetSubscriptionInProgress = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetSubscriptionInProgress:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 900
    iget-boolean v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-nez v0, :cond_24

    .line 901
    invoke-direct {p0}, Lcom/android/internal/telephony/SubscriptionManager;->startNextPendingActivateRequests()Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetSubscriptionInProgress:Z

    .line 903
    :cond_24
    return-void
.end method

.method private processAllCardsInfoAvailable()V
    .registers 13

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 560
    invoke-direct {p0}, Lcom/android/internal/telephony/SubscriptionManager;->isAllRadioOn()Z

    move-result v6

    if-nez v6, :cond_10

    .line 561
    const-string v6, "SubscriptionManager"

    const-string v7, "processAllCardsInfoAvailable: Radio Not Available "

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 642
    :goto_f
    return-void

    .line 565
    :cond_10
    const/4 v0, 0x0

    .line 566
    .local v0, availableCards:I
    iput-boolean v11, p0, Lcom/android/internal/telephony/SubscriptionManager;->mAllCardsStatusAvailable:Z

    .line 568
    const/4 v1, 0x0

    .local v1, i:I
    :goto_14
    iget v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v1, v6, :cond_2b

    .line 569
    iget-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCardInfoAvailable:[Z

    aget-boolean v6, v6, v1

    if-nez v6, :cond_26

    iget-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/CardSubscriptionManager;

    invoke-virtual {v6, v1}, Lcom/android/internal/telephony/CardSubscriptionManager;->isCardAbsentOrError(I)Z

    move-result v6

    if-eqz v6, :cond_28

    .line 570
    :cond_26
    add-int/lit8 v0, v0, 0x1

    .line 568
    :cond_28
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 575
    :cond_2b
    iget v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ne v0, v6, :cond_36

    iget-boolean v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-nez v6, :cond_36

    .line 576
    invoke-direct {p0}, Lcom/android/internal/telephony/SubscriptionManager;->processActivateRequests()V

    .line 583
    :cond_36
    invoke-static {}, Lcom/android/internal/telephony/CardSubscriptionManager;->getInstance()Lcom/android/internal/telephony/CardSubscriptionManager;

    move-result-object v3

    .line 584
    .local v3, mCardSubscriptionManager:Lcom/android/internal/telephony/CardSubscriptionManager;
    iget v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    new-array v2, v6, [Lcom/android/internal/telephony/SubscriptionData;

    .line 585
    .local v2, mCardSubscrInfo:[Lcom/android/internal/telephony/SubscriptionData;
    const/4 v1, 0x0

    :goto_3f
    iget v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v1, v6, :cond_4c

    .line 586
    invoke-virtual {v3, v1}, Lcom/android/internal/telephony/CardSubscriptionManager;->getCardSubscriptions(I)Lcom/android/internal/telephony/SubscriptionData;

    move-result-object v6

    aput-object v6, v2, v1

    .line 585
    add-int/lit8 v1, v1, 0x1

    goto :goto_3f

    .line 590
    :cond_4c
    new-instance v5, Lcom/android/internal/telephony/SubscriptionData;

    iget v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    invoke-direct {v5, v6}, Lcom/android/internal/telephony/SubscriptionData;-><init>(I)V

    .line 593
    .local v5, mUserSelSub:Lcom/android/internal/telephony/SubscriptionData;
    const-string v6, "ril.MSIMM"

    invoke-static {v6, v10}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v6

    if-ne v6, v11, :cond_160

    .line 594
    const-string v6, "SubscriptionManager"

    const-string v7, "processAllCardsInfoAvailable: only SIM2 is presented"

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 595
    const-string v6, "persist.radio.calldefault.simid"

    const-string v7, "0"

    invoke-static {v6, v7}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 597
    const/4 v1, 0x0

    :goto_6a
    iget v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v1, v6, :cond_c2

    .line 598
    const-string v6, "ril.ICC_TYPE"

    invoke-static {v6, v1}, Lcom/android/internal/telephony/MultiSimManager;->appendPropertySimSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v6

    const-string v7, ""

    invoke-static {v6, v7}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_bf

    .line 599
    const-string v6, "SubscriptionManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "processAllCardsInfoAvailable: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "ril.ICC_TYPE"

    invoke-static {v8, v1}, Lcom/android/internal/telephony/MultiSimManager;->appendPropertySimSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "ril.ICC_TYPE"

    invoke-static {v8, v1}, Lcom/android/internal/telephony/MultiSimManager;->appendPropertySimSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v8

    const-string v9, ""

    invoke-static {v8, v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 600
    const-string v6, "ril.ICC_TYPE"

    invoke-static {v6, v1}, Lcom/android/internal/telephony/MultiSimManager;->appendPropertySimSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v6

    const-string v7, "0"

    invoke-static {v6, v7}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 597
    :cond_bf
    add-int/lit8 v1, v1, 0x1

    goto :goto_6a

    .line 605
    :cond_c2
    iget-object v6, v5, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v6, v6, v10

    aget-object v7, v2, v10

    iget-object v7, v7, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v7, v7, v10

    invoke-virtual {v6, v7}, Lcom/android/internal/telephony/Subscription;->copyFrom(Lcom/android/internal/telephony/Subscription;)Lcom/android/internal/telephony/Subscription;

    .line 606
    iget-object v6, v5, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v6, v6, v10

    iput v11, v6, Lcom/android/internal/telephony/Subscription;->slotId:I

    .line 607
    iget-object v6, v5, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v6, v6, v10

    iput v11, v6, Lcom/android/internal/telephony/Subscription;->subId:I

    .line 608
    iget-object v6, v5, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v6, v6, v10

    sget-object v7, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    iput-object v7, v6, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    .line 609
    sget-object v6, Lcom/android/internal/telephony/SubscriptionManager;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v7, "phone2_on"

    invoke-static {v6, v7, v11}, Landroid/provider/Settings$System;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    .line 612
    iget-object v6, v5, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v6, v6, v10

    iget-object v6, v6, Lcom/android/internal/telephony/Subscription;->appType:Ljava/lang/String;

    const-string v7, "SIM"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_108

    .line 613
    const-string v6, "ril.ICC_TYPE"

    const-string v7, "1"

    invoke-static {v6, v7}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 641
    :cond_103
    :goto_103
    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/SubscriptionManager;->setSubscription(Lcom/android/internal/telephony/SubscriptionData;)Z

    goto/16 :goto_f

    .line 614
    :cond_108
    iget-object v6, v5, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v6, v6, v10

    iget-object v6, v6, Lcom/android/internal/telephony/Subscription;->appType:Ljava/lang/String;

    const-string v7, "USIM"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_11e

    .line 615
    const-string v6, "ril.ICC_TYPE"

    const-string v7, "2"

    invoke-static {v6, v7}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_103

    .line 616
    :cond_11e
    iget-object v6, v5, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v6, v6, v10

    iget-object v6, v6, Lcom/android/internal/telephony/Subscription;->appType:Ljava/lang/String;

    const-string v7, "RUIM"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_134

    .line 617
    const-string v6, "ril.ICC_TYPE"

    const-string v7, "3"

    invoke-static {v6, v7}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_103

    .line 618
    :cond_134
    iget-object v6, v5, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v6, v6, v10

    iget-object v6, v6, Lcom/android/internal/telephony/Subscription;->appType:Ljava/lang/String;

    const-string v7, "CSIM"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_14a

    .line 619
    const-string v6, "ril.ICC_TYPE"

    const-string v7, "4"

    invoke-static {v6, v7}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_103

    .line 620
    :cond_14a
    iget-object v6, v5, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v6, v6, v10

    iget-object v6, v6, Lcom/android/internal/telephony/Subscription;->appType:Ljava/lang/String;

    const-string v7, "UNKNOWN"

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_103

    .line 621
    const-string v6, "ril.ICC_TYPE"

    const-string v7, "0"

    invoke-static {v6, v7}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_103

    .line 624
    :cond_160
    const/4 v1, 0x0

    :goto_161
    iget v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v1, v6, :cond_103

    .line 625
    iget-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCardInfoAvailable:[Z

    aget-boolean v6, v6, v1

    if-eqz v6, :cond_1b6

    .line 626
    const-string v6, "SubscriptionManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "processAllCardsInfoAvailable: SIM"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " is presented"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 629
    iget-object v6, v5, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v6, v6, v1

    aget-object v7, v2, v1

    iget-object v7, v7, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v7, v7, v10

    invoke-virtual {v6, v7}, Lcom/android/internal/telephony/Subscription;->copyFrom(Lcom/android/internal/telephony/Subscription;)Lcom/android/internal/telephony/Subscription;

    .line 630
    iget-object v6, v5, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v6, v6, v1

    iput v1, v6, Lcom/android/internal/telephony/Subscription;->subId:I

    .line 631
    if-nez v1, :cond_1b9

    .line 632
    sget-object v6, Lcom/android/internal/telephony/SubscriptionManager;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v7, "phone1_on"

    invoke-static {v6, v7, v11}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    .line 636
    .local v4, mStatus:I
    :goto_1aa
    iget-object v6, v5, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v6, v6, v1

    invoke-static {}, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->values()[Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    move-result-object v7

    aget-object v7, v7, v4

    iput-object v7, v6, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    .line 624
    .end local v4           #mStatus:I
    :cond_1b6
    add-int/lit8 v1, v1, 0x1

    goto :goto_161

    .line 634
    :cond_1b9
    sget-object v6, Lcom/android/internal/telephony/SubscriptionManager;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v7, "phone2_on"

    invoke-static {v6, v7, v11}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    .restart local v4       #mStatus:I
    goto :goto_1aa
.end method

.method private processAvailableCards()V
    .registers 3

    .prologue
    .line 655
    invoke-direct {p0}, Lcom/android/internal/telephony/SubscriptionManager;->isAllRadioOn()Z

    move-result v0

    if-nez v0, :cond_e

    .line 656
    const-string v0, "SubscriptionManager"

    const-string v1, "processAvailableCards: Radio Not Available "

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 665
    :goto_d
    return-void

    .line 659
    :cond_e
    iget-boolean v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-eqz v0, :cond_1a

    .line 660
    const-string v0, "SubscriptionManager"

    const-string v1, "processAvailableCards: set subscription in progress!!"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_d

    .line 664
    :cond_1a
    invoke-direct {p0}, Lcom/android/internal/telephony/SubscriptionManager;->processActivateRequests()V

    goto :goto_d
.end method

.method private processCardInfoAvailable(Landroid/os/AsyncResult;)V
    .registers 13
    .parameter "ar"

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 673
    iget-object v0, p1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    .line 675
    .local v0, cardIndex:Ljava/lang/Integer;
    iget-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mRadioOn:[Z

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    aget-boolean v6, v6, v7

    if-nez v6, :cond_29

    .line 676
    const-string v6, "SubscriptionManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "processCardInfoAvailable: Radio Not Available on cardIndex = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 738
    :cond_28
    :goto_28
    return-void

    .line 680
    :cond_29
    iget-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCardInfoAvailable:[Z

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    aput-boolean v10, v6, v7

    .line 682
    const-string v6, "SubscriptionManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "processCardInfoAvailable: CARD:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " is available"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 684
    invoke-direct {p0}, Lcom/android/internal/telephony/SubscriptionManager;->isAllCardsInfoAvailable()Z

    move-result v6

    if-nez v6, :cond_5d

    .line 685
    const-string v6, "SubscriptionManager"

    const-string v7, "All cards info not available!! Waiting for all info before processing"

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_28

    .line 689
    :cond_5d
    const-string v6, "SubscriptionManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "processCardInfoAvailable: mSetSubscriptionInProgress = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-boolean v8, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetSubscriptionInProgress:Z

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 691
    iget-boolean v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-nez v6, :cond_7e

    .line 692
    invoke-direct {p0}, Lcom/android/internal/telephony/SubscriptionManager;->processActivateRequests()V

    .line 696
    :cond_7e
    iget-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->isSimReset:[Z

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    aget-boolean v6, v6, v7

    if-eqz v6, :cond_28

    .line 697
    iget-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->isSimReset:[Z

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    aput-boolean v9, v6, v7

    .line 701
    invoke-static {}, Lcom/android/internal/telephony/CardSubscriptionManager;->getInstance()Lcom/android/internal/telephony/CardSubscriptionManager;

    move-result-object v3

    .line 702
    .local v3, mCardSubscriptionManager:Lcom/android/internal/telephony/CardSubscriptionManager;
    iget v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    new-array v2, v6, [Lcom/android/internal/telephony/SubscriptionData;

    .line 703
    .local v2, mCardSubscrInfo:[Lcom/android/internal/telephony/SubscriptionData;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_99
    iget v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v1, v6, :cond_a6

    .line 704
    invoke-virtual {v3, v1}, Lcom/android/internal/telephony/CardSubscriptionManager;->getCardSubscriptions(I)Lcom/android/internal/telephony/SubscriptionData;

    move-result-object v6

    aput-object v6, v2, v1

    .line 703
    add-int/lit8 v1, v1, 0x1

    goto :goto_99

    .line 708
    :cond_a6
    new-instance v5, Lcom/android/internal/telephony/SubscriptionData;

    iget v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    invoke-direct {v5, v6}, Lcom/android/internal/telephony/SubscriptionData;-><init>(I)V

    .line 711
    .local v5, mUserSelSub:Lcom/android/internal/telephony/SubscriptionData;
    const-string v6, "ril.MSIMM"

    invoke-static {v6, v9}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v6

    if-ne v6, v10, :cond_e9

    .line 712
    const-string v6, "SubscriptionManager"

    const-string v7, "SIM reset! only SIM2 is presented"

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 713
    iget-object v6, v5, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v6, v6, v9

    aget-object v7, v2, v9

    iget-object v7, v7, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v7, v7, v9

    invoke-virtual {v6, v7}, Lcom/android/internal/telephony/Subscription;->copyFrom(Lcom/android/internal/telephony/Subscription;)Lcom/android/internal/telephony/Subscription;

    .line 714
    iget-object v6, v5, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v6, v6, v9

    iput v10, v6, Lcom/android/internal/telephony/Subscription;->slotId:I

    .line 715
    iget-object v6, v5, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v6, v6, v9

    iput v10, v6, Lcom/android/internal/telephony/Subscription;->subId:I

    .line 716
    iget-object v6, v5, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v6, v6, v9

    sget-object v7, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    iput-object v7, v6, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    .line 717
    const-string v6, "persist.radio.calldefault.simid"

    const-string v7, "0"

    invoke-static {v6, v7}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 736
    :cond_e4
    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/SubscriptionManager;->setSubscription(Lcom/android/internal/telephony/SubscriptionData;)Z

    goto/16 :goto_28

    .line 719
    :cond_e9
    const/4 v1, 0x0

    :goto_ea
    iget v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v1, v6, :cond_e4

    .line 720
    iget-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCardInfoAvailable:[Z

    aget-boolean v6, v6, v1

    if-eqz v6, :cond_13f

    .line 721
    const-string v6, "SubscriptionManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "SIM reset! SIM"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " is presented"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 724
    iget-object v6, v5, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v6, v6, v1

    aget-object v7, v2, v1

    iget-object v7, v7, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v7, v7, v9

    invoke-virtual {v6, v7}, Lcom/android/internal/telephony/Subscription;->copyFrom(Lcom/android/internal/telephony/Subscription;)Lcom/android/internal/telephony/Subscription;

    .line 725
    iget-object v6, v5, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v6, v6, v1

    iput v1, v6, Lcom/android/internal/telephony/Subscription;->subId:I

    .line 726
    if-nez v1, :cond_142

    .line 727
    sget-object v6, Lcom/android/internal/telephony/SubscriptionManager;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v7, "phone1_on"

    invoke-static {v6, v7, v9}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    .line 731
    .local v4, mStatus:I
    :goto_133
    iget-object v6, v5, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v6, v6, v1

    invoke-static {}, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->values()[Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    move-result-object v7

    aget-object v7, v7, v4

    iput-object v7, v6, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    .line 719
    .end local v4           #mStatus:I
    :cond_13f
    add-int/lit8 v1, v1, 0x1

    goto :goto_ea

    .line 729
    :cond_142
    sget-object v6, Lcom/android/internal/telephony/SubscriptionManager;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    const-string v7, "phone2_on"

    invoke-static {v6, v7, v9}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v4

    .restart local v4       #mStatus:I
    goto :goto_133
.end method

.method private processCardInfoNotAvailable(Landroid/os/AsyncResult;)V
    .registers 12
    .parameter "ar"

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 773
    iget-object v7, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v7, :cond_a

    iget-object v7, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    if-nez v7, :cond_12

    .line 774
    :cond_a
    const-string v5, "SubscriptionManager"

    const-string v6, "processCardInfoNotAvailable - Exception"

    invoke-static {v5, v6}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 815
    :cond_11
    :goto_11
    return-void

    .line 778
    :cond_12
    iget-object v0, p1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    .line 779
    .local v0, cardIndex:Ljava/lang/Integer;
    iget-object v2, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v2, Lcom/android/internal/telephony/MultiSimManager$CardUnavailableReason;

    .line 781
    .local v2, reason:Lcom/android/internal/telephony/MultiSimManager$CardUnavailableReason;
    const-string v7, "SubscriptionManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "processCardInfoNotAvailable on cardIndex = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " reason = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 783
    iget-object v7, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCardInfoAvailable:[Z

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v8

    aput-boolean v6, v7, v8

    .line 788
    const/4 v4, 0x1

    .line 789
    .local v4, subscriptionRequired:Z
    const/4 v1, 0x0

    .local v1, i:I
    :goto_46
    iget v7, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v1, v7, :cond_58

    .line 790
    if-eqz v4, :cond_56

    iget-object v7, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCardInfoAvailable:[Z

    aget-boolean v7, v7, v1

    if-nez v7, :cond_56

    move v4, v5

    .line 789
    :goto_53
    add-int/lit8 v1, v1, 0x1

    goto :goto_46

    :cond_56
    move v4, v6

    .line 790
    goto :goto_53

    .line 795
    :cond_58
    sget-object v7, Lcom/android/internal/telephony/MultiSimManager$CardUnavailableReason;->REASON_RADIO_UNAVAILABLE:Lcom/android/internal/telephony/MultiSimManager$CardUnavailableReason;

    if-eq v2, v7, :cond_60

    sget-object v7, Lcom/android/internal/telephony/MultiSimManager$CardUnavailableReason;->REASON_SIM_REFRESH_RESET:Lcom/android/internal/telephony/MultiSimManager$CardUnavailableReason;

    if-ne v2, v7, :cond_84

    .line 799
    :cond_60
    const/4 v1, 0x0

    :goto_61
    iget v7, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v1, v7, :cond_84

    .line 800
    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v7

    aget-object v3, v7, v1

    .line 801
    .local v3, sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    invoke-direct {p0, v3}, Lcom/android/internal/telephony/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/Subscription;

    move-result-object v7

    iget v7, v7, Lcom/android/internal/telephony/Subscription;->slotId:I

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v8

    if-ne v7, v8, :cond_81

    .line 802
    invoke-direct {p0, v3}, Lcom/android/internal/telephony/SubscriptionManager;->resetCurrentSubscription(Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;)V

    .line 803
    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v7

    invoke-direct {p0, v7}, Lcom/android/internal/telephony/SubscriptionManager;->notifySubscriptionDeactivated(I)V

    .line 799
    :cond_81
    add-int/lit8 v1, v1, 0x1

    goto :goto_61

    .line 808
    .end local v3           #sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    :cond_84
    sget-object v7, Lcom/android/internal/telephony/MultiSimManager$CardUnavailableReason;->REASON_RADIO_UNAVAILABLE:Lcom/android/internal/telephony/MultiSimManager$CardUnavailableReason;

    if-ne v2, v7, :cond_8a

    .line 809
    iput-boolean v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mAllCardsStatusAvailable:Z

    .line 812
    :cond_8a
    sget-object v6, Lcom/android/internal/telephony/MultiSimManager$CardUnavailableReason;->REASON_SIM_REFRESH_RESET:Lcom/android/internal/telephony/MultiSimManager$CardUnavailableReason;

    if-ne v2, v6, :cond_11

    .line 813
    iget-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->isSimReset:[Z

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v7

    aput-boolean v5, v6, v7

    goto/16 :goto_11
.end method

.method private processSetDataSubscriptionDone(Landroid/os/AsyncResult;)V
    .registers 5
    .parameter "ar"

    .prologue
    .line 339
    const-string v0, "SubscriptionManager"

    const-string v1, "processSetDataSubscriptionDone()"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 341
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    if-eqz v0, :cond_20

    .line 342
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    iget v1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mQueuedDds:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-static {v0, v1, v2}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 343
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    .line 344
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    .line 346
    :cond_20
    return-void
.end method

.method private processSetUiccSubscriptionDone(Landroid/os/AsyncResult;)V
    .registers 14
    .parameter "ar"

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    const/4 v11, 0x0

    .line 419
    iget-object v4, p1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;

    .line 420
    .local v4, setSubParam:Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;
    const/4 v0, 0x0

    .line 421
    .local v0, cause:Ljava/lang/String;
    sget-object v5, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_INVALID:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    .line 422
    .local v5, subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;
    const/4 v1, 0x0

    .line 424
    .local v1, currentSub:Lcom/android/internal/telephony/Subscription;
    iget-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mRadioOn:[Z

    iget v9, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-boolean v6, v6, v9

    if-nez v6, :cond_2e

    .line 425
    const-string v6, "SubscriptionManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "processSetUiccSubscriptionDone: Radio Not Available on subId = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 554
    :cond_2d
    :goto_2d
    return-void

    .line 430
    :cond_2e
    iget-object v6, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    sget-object v9, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    if-ne v6, v9, :cond_64

    .line 431
    const-string v6, "ril.MSIMM"

    invoke-static {v6, v8}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v6

    if-ne v6, v7, :cond_45

    .line 432
    const-string v6, "SubscriptionManager"

    const-string v9, "subscription is activated in sim2 only mode. sub id will change to 0"

    invoke-static {v6, v9}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 433
    iput v8, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    .line 435
    :cond_45
    const-string v6, "SubscriptionManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "notifySubscriptionActivated of SUB "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 436
    iget v6, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-direct {p0, v6}, Lcom/android/internal/telephony/SubscriptionManager;->notifySubscriptionActivated(I)V

    .line 439
    :cond_64
    iget-object v6, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v6, :cond_185

    .line 442
    iget-object v6, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    instance-of v6, v6, Lcom/android/internal/telephony/CommandException;

    if-eqz v6, :cond_86

    .line 443
    iget-object v6, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    check-cast v6, Lcom/android/internal/telephony/CommandException;

    check-cast v6, Lcom/android/internal/telephony/CommandException;

    invoke-virtual {v6}, Lcom/android/internal/telephony/CommandException;->getCommandError()Lcom/android/internal/telephony/CommandException$Error;

    move-result-object v2

    .line 444
    .local v2, error:Lcom/android/internal/telephony/CommandException$Error;
    if-eqz v2, :cond_86

    sget-object v6, Lcom/android/internal/telephony/CommandException$Error;->SUBSCRIPTION_NOT_SUPPORTED:Lcom/android/internal/telephony/CommandException$Error;

    if-ne v2, v6, :cond_86

    .line 446
    iget-object v6, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    sget-object v9, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    if-ne v6, v9, :cond_10f

    .line 447
    const-string v0, "ACTIVATE NOT SUPPORTED"

    .line 454
    .end local v2           #error:Lcom/android/internal/telephony/CommandException$Error;
    :cond_86
    :goto_86
    iget-object v6, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    sget-object v9, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    if-ne v6, v9, :cond_119

    .line 456
    const-string v6, "SubscriptionManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "subscription of SUB:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " Activate Failed"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 457
    if-nez v0, :cond_b0

    .line 458
    const-string v0, "ACTIVATE FAILED"

    .line 460
    :cond_b0
    sget-object v5, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_DEACTIVATED:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    .line 461
    iget-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v9

    iget v10, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v9, v9, v10

    invoke-virtual {v6, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1           #currentSub:Lcom/android/internal/telephony/Subscription;
    check-cast v1, Lcom/android/internal/telephony/Subscription;

    .line 464
    .restart local v1       #currentSub:Lcom/android/internal/telephony/Subscription;
    iget-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v9

    iget v10, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v9, v9, v10

    invoke-virtual {v6, v9, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 529
    :goto_cf
    const-string v6, "SubscriptionManager"

    const-string v9, "set uicc subscription done. update the current subscriptions"

    invoke-static {v6, v9}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 531
    iget v6, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-direct {p0, v6, v1, v5, v0}, Lcom/android/internal/telephony/SubscriptionManager;->updateCurrentSubscription(ILcom/android/internal/telephony/Subscription;Lcom/android/internal/telephony/Subscription$SubscriptionStatus;Ljava/lang/String;)V

    .line 536
    iget-object v6, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v6, :cond_e9

    .line 538
    iget v9, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    sget-object v6, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    if-ne v5, v6, :cond_252

    move v6, v7

    :goto_e6
    invoke-direct {p0, v9, v6}, Lcom/android/internal/telephony/SubscriptionManager;->updateSubscriptionReadiness(IZ)V

    .line 541
    :cond_e9
    iget-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSubResult:[Ljava/lang/String;

    iget v7, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    aput-object v0, v6, v7

    .line 543
    invoke-direct {p0}, Lcom/android/internal/telephony/SubscriptionManager;->startNextPendingDeactivateRequests()Z

    move-result v6

    if-nez v6, :cond_2d

    .line 545
    invoke-direct {p0}, Lcom/android/internal/telephony/SubscriptionManager;->startNextPendingActivateRequests()Z

    move-result v6

    if-nez v6, :cond_2d

    .line 548
    iput-boolean v8, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetSubscriptionInProgress:Z

    .line 550
    iget-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetSubscriptionRegistrants:Landroid/os/RegistrantList;

    if-eqz v6, :cond_2d

    .line 551
    iget-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetSubscriptionRegistrants:Landroid/os/RegistrantList;

    new-instance v7, Landroid/os/AsyncResult;

    iget-object v8, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSubResult:[Ljava/lang/String;

    invoke-direct {v7, v11, v8, v11}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v6, v7}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_2d

    .line 448
    .restart local v2       #error:Lcom/android/internal/telephony/CommandException$Error;
    :cond_10f
    iget-object v6, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    sget-object v9, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    if-ne v6, v9, :cond_86

    .line 449
    const-string v0, "DEACTIVATE NOT SUPPORTED"

    goto/16 :goto_86

    .line 465
    .end local v2           #error:Lcom/android/internal/telephony/CommandException$Error;
    :cond_119
    iget-object v6, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    sget-object v9, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    if-ne v6, v9, :cond_17c

    .line 467
    const-string v6, "SubscriptionManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "subscription of SUB:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " Deactivate Failed"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 472
    if-nez v0, :cond_158

    .line 473
    iget v6, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-direct {p0, v6}, Lcom/android/internal/telephony/SubscriptionManager;->isAnyPendingActivateRequest(I)Z

    move-result v6

    if-eqz v6, :cond_179

    .line 474
    const-string v0, "ACTIVATE FAILED"

    .line 479
    iget-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v9

    iget v10, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v9, v9, v10

    invoke-virtual {v6, v9, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 484
    :cond_158
    :goto_158
    sget-object v5, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    .line 485
    iget-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v9

    iget v10, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v9, v9, v10

    invoke-virtual {v6, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1           #currentSub:Lcom/android/internal/telephony/Subscription;
    check-cast v1, Lcom/android/internal/telephony/Subscription;

    .line 487
    .restart local v1       #currentSub:Lcom/android/internal/telephony/Subscription;
    iget-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v9

    iget v10, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v9, v9, v10

    invoke-virtual {v6, v9, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_cf

    .line 481
    :cond_179
    const-string v0, "DEACTIVATE FAILED"

    goto :goto_158

    .line 489
    :cond_17c
    const-string v6, "SubscriptionManager"

    const-string v9, "UNKOWN: SHOULD NOT HIT HERE"

    invoke-static {v6, v9}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_cf

    .line 493
    :cond_185
    iget-object v6, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    sget-object v9, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    if-ne v6, v9, :cond_1ef

    .line 495
    const-string v6, "SubscriptionManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "subscription of SUB:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " Activated"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 496
    sget-object v5, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    .line 497
    const-string v0, "ACTIVATE SUCCESS"

    .line 498
    iget-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v9

    iget v10, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v9, v9, v10

    invoke-virtual {v6, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1           #currentSub:Lcom/android/internal/telephony/Subscription;
    check-cast v1, Lcom/android/internal/telephony/Subscription;

    .line 500
    .restart local v1       #currentSub:Lcom/android/internal/telephony/Subscription;
    if-nez v1, :cond_1ca

    .line 501
    const-string v6, "SubscriptionManager"

    const-string v7, "currentSub is null"

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2d

    .line 504
    :cond_1ca
    const-string v6, "ril.MSIMM"

    invoke-static {v6, v8}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v6

    if-ne v6, v7, :cond_1d4

    .line 505
    iput v8, v1, Lcom/android/internal/telephony/Subscription;->subId:I

    .line 509
    :cond_1d4
    iget-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v9

    iget v10, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v9, v9, v10

    invoke-virtual {v6, v9, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 510
    new-instance v3, Landroid/content/Intent;

    const-string v6, "com.android.settings.subscription_activate"

    invoke-direct {v3, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 511
    .local v3, intent:Landroid/content/Intent;
    sget-object v6, Lcom/android/internal/telephony/SubscriptionManager;->mContext:Landroid/content/Context;

    invoke-virtual {v6, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_cf

    .line 512
    .end local v3           #intent:Landroid/content/Intent;
    :cond_1ef
    iget-object v6, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    sget-object v9, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    if-ne v6, v9, :cond_249

    .line 514
    const-string v6, "SubscriptionManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "subscription of SUB:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " Deactivated"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v6, v9}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 515
    sget-object v5, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_DEACTIVATED:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    .line 516
    const-string v0, "DEACTIVATE SUCCESS"

    .line 517
    iget-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v9

    iget v10, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v9, v9, v10

    invoke-virtual {v6, v9}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .end local v1           #currentSub:Lcom/android/internal/telephony/Subscription;
    check-cast v1, Lcom/android/internal/telephony/Subscription;

    .line 519
    .restart local v1       #currentSub:Lcom/android/internal/telephony/Subscription;
    iget-object v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v9

    iget v10, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    aget-object v9, v9, v10

    invoke-virtual {v6, v9, v11}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 521
    iget v6, v4, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    invoke-direct {p0, v6}, Lcom/android/internal/telephony/SubscriptionManager;->notifySubscriptionDeactivated(I)V

    .line 522
    new-instance v3, Landroid/content/Intent;

    const-string v6, "com.android.settings.subscription_deactivate"

    invoke-direct {v3, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 523
    .restart local v3       #intent:Landroid/content/Intent;
    sget-object v6, Lcom/android/internal/telephony/SubscriptionManager;->mContext:Landroid/content/Context;

    invoke-virtual {v6, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_cf

    .line 525
    .end local v3           #intent:Landroid/content/Intent;
    :cond_249
    const-string v6, "SubscriptionManager"

    const-string v9, "UNKOWN: SHOULD NOT HIT HERE"

    invoke-static {v6, v9}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_cf

    :cond_252
    move v6, v8

    .line 538
    goto/16 :goto_e6
.end method

.method private processSubscriptionStatusChanged(Landroid/os/AsyncResult;)V
    .registers 11
    .parameter "ar"

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 353
    iget-object v3, p1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Integer;

    .line 354
    .local v3, subId:Ljava/lang/Integer;
    iget-object v4, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v4, [I

    check-cast v4, [I

    aget v0, v4, v6

    .line 355
    .local v0, actStatus:I
    const-string v4, "SubscriptionManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "handleSubscriptionStatusChanged sub = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " actStatus = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 359
    if-ne v0, v5, :cond_ae

    .line 360
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-ne v0, v5, :cond_a2

    move v4, v5

    :goto_39
    invoke-direct {p0, v7, v4}, Lcom/android/internal/telephony/SubscriptionManager;->updateSubscriptionReadiness(IZ)V

    .line 362
    iget-boolean v4, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetDdsRequired:Z

    if-eqz v4, :cond_9a

    .line 363
    const/4 v1, 0x0

    .line 365
    .local v1, isMatchedDataSub:Z
    const-string v4, "ril.MSIMM"

    invoke-static {v4, v6}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v4

    if-ne v4, v5, :cond_a4

    .line 366
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-nez v4, :cond_61

    iget v4, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCurrentDds:I

    if-ne v4, v5, :cond_61

    .line 367
    const/4 v1, 0x1

    .line 368
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iput v4, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCurrentDds:I

    .line 369
    const-string v4, "SubscriptionManager"

    const-string v7, "change currentDds from 1 to 0 because of SIM2 only"

    invoke-static {v4, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 375
    :cond_61
    :goto_61
    if-eqz v1, :cond_9a

    .line 376
    const-string v4, "SubscriptionManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "setDataSubscription on "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCurrentDds:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 379
    iget v4, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCurrentDds:I

    iput v4, p0, Lcom/android/internal/telephony/SubscriptionManager;->mQueuedDds:I

    .line 380
    iput-boolean v5, p0, Lcom/android/internal/telephony/SubscriptionManager;->mDisableDdsInProgress:Z

    .line 381
    const/4 v4, 0x5

    new-instance v5, Ljava/lang/Integer;

    iget v7, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCurrentDds:I

    invoke-direct {v5, v7}, Ljava/lang/Integer;-><init>(I)V

    invoke-static {p0, v4, v5}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    .line 384
    .local v2, msgSetDdsDone:Landroid/os/Message;
    iget-object v4, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    iget v5, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCurrentDds:I

    aget-object v4, v4, v5

    invoke-interface {v4, v2}, Lcom/android/internal/telephony/CommandsInterface;->setDataSubscription(Landroid/os/Message;)V

    .line 385
    iput-boolean v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetDdsRequired:Z

    .line 388
    .end local v1           #isMatchedDataSub:Z
    .end local v2           #msgSetDdsDone:Landroid/os/Message;
    :cond_9a
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-direct {p0, v4}, Lcom/android/internal/telephony/SubscriptionManager;->notifySubscriptionActivated(I)V

    .line 412
    :goto_a1
    return-void

    :cond_a2
    move v4, v6

    .line 360
    goto :goto_39

    .line 371
    .restart local v1       #isMatchedDataSub:Z
    :cond_a4
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iget v7, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCurrentDds:I

    if-ne v4, v7, :cond_61

    .line 372
    const/4 v1, 0x1

    goto :goto_61

    .line 392
    .end local v1           #isMatchedDataSub:Z
    :cond_ae
    iget-object v4, p0, Lcom/android/internal/telephony/SubscriptionManager;->mRadioOn:[Z

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v7

    aget-boolean v4, v4, v7

    if-nez v4, :cond_d1

    .line 393
    const-string v4, "SubscriptionManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "processSubscriptionStatusChanged: Radio Not Available on subId = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a1

    .line 397
    :cond_d1
    if-nez v0, :cond_12e

    .line 398
    const-string v4, "1"

    const-string v7, "ril.setSub"

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-static {v7, v8}, Lcom/android/internal/telephony/MultiSimManager;->appendPropertySimSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v7

    const-string v8, "0"

    invoke-static {v7, v8}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_10a

    .line 399
    const-string v4, "SubscriptionManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "ignore SUB_STATUS_DEACTIVATED cause sub["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "] is not deactivated by SubscriptionManager"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_a1

    .line 404
    :cond_10a
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-ne v0, v5, :cond_12c

    :goto_110
    invoke-direct {p0, v4, v5}, Lcom/android/internal/telephony/SubscriptionManager;->updateSubscriptionReadiness(IZ)V

    .line 406
    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v4

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v5

    aget-object v4, v4, v5

    invoke-direct {p0, v4}, Lcom/android/internal/telephony/SubscriptionManager;->resetCurrentSubscription(Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;)V

    .line 407
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-direct {p0, v4}, Lcom/android/internal/telephony/SubscriptionManager;->notifySubscriptionDeactivated(I)V

    .line 408
    invoke-direct {p0}, Lcom/android/internal/telephony/SubscriptionManager;->triggerUpdateFromAvaialbleCards()V

    goto/16 :goto_a1

    :cond_12c
    move v5, v6

    .line 404
    goto :goto_110

    .line 410
    :cond_12e
    const-string v4, "SubscriptionManager"

    const-string v5, "handleSubscriptionStatusChanged INVALID"

    invoke-static {v4, v5}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_a1
.end method

.method private resetCurrentSubscription(Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;)V
    .registers 4
    .parameter "subId"

    .prologue
    .line 1048
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/Subscription;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Subscription;->clear()V

    .line 1049
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/Subscription;

    move-result-object v0

    sget-object v1, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_DEACTIVATED:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    iput-object v1, v0, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    .line 1051
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/SubscriptionManager$PhoneSubscriptionInfo;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/android/internal/telephony/SubscriptionManager$PhoneSubscriptionInfo;->cause:Ljava/lang/String;

    .line 1052
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/SubscriptionManager$PhoneSubscriptionInfo;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/android/internal/telephony/SubscriptionManager$PhoneSubscriptionInfo;->subReady:Z

    .line 1053
    return-void
.end method

.method private startNextPendingActivateRequests()Z
    .registers 14

    .prologue
    const/4 v12, 0x1

    const/4 v1, 0x0

    .line 948
    invoke-direct {p0}, Lcom/android/internal/telephony/SubscriptionManager;->printPendingActivateRequests()V

    .line 949
    const-string v0, "SubscriptionManager"

    const-string v2, "startNextPendingActivateRequests"

    invoke-static {v0, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 951
    const/4 v7, 0x0

    .local v7, i:I
    :goto_d
    iget v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v7, v0, :cond_fa

    .line 952
    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v0

    aget-object v10, v0, v7

    .line 953
    .local v10, sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-virtual {v0, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/internal/telephony/Subscription;

    .line 954
    .local v8, newSub:Lcom/android/internal/telephony/Subscription;
    if-eqz v8, :cond_33

    iget-object v0, v8, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    sget-object v2, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    if-ne v0, v2, :cond_33

    .line 955
    invoke-direct {p0, v8}, Lcom/android/internal/telephony/SubscriptionManager;->validateActivationRequest(Lcom/android/internal/telephony/Subscription;)Z

    move-result v0

    if-nez v0, :cond_36

    .line 957
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    const/4 v2, 0x0

    invoke-virtual {v0, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 951
    :cond_33
    add-int/lit8 v7, v7, 0x1

    goto :goto_d

    .line 962
    :cond_36
    iget v11, v8, Lcom/android/internal/telephony/Subscription;->subId:I

    .line 963
    .local v11, subId:I
    const-string v0, "SIM"

    iget-object v2, v8, Lcom/android/internal/telephony/Subscription;->appType:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4c

    const-string v0, "USIM"

    iget-object v2, v8, Lcom/android/internal/telephony/Subscription;->appType:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c3

    :cond_4c
    const-string v0, "GSM"

    iget-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mProxyPhone:[Lcom/android/internal/telephony/Phone;

    aget-object v2, v2, v11

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_c3

    .line 965
    const-string v0, "SubscriptionManager"

    const-string v2, "gets New GSM phone"

    invoke-static {v0, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 966
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mProxyPhone:[Lcom/android/internal/telephony/Phone;

    aget-object v0, v0, v11

    check-cast v0, Lcom/android/internal/telephony/PhoneProxy;

    const/16 v2, 0x10

    invoke-virtual {v0, v2}, Lcom/android/internal/telephony/PhoneProxy;->updatePhoneObject(I)V

    .line 973
    :cond_6e
    :goto_6e
    const-string v0, "SubscriptionManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "startNextPendingActivateRequests: Activating SUB : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 974
    const-string v0, "ril.setSub"

    iget v2, v8, Lcom/android/internal/telephony/Subscription;->subId:I

    invoke-static {v0, v2}, Lcom/android/internal/telephony/MultiSimManager;->appendPropertySimSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    const-string v2, "1"

    invoke-static {v0, v2}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 976
    new-instance v9, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;

    iget v0, v8, Lcom/android/internal/telephony/Subscription;->subId:I

    iget-object v2, v8, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    invoke-direct {v9, p0, v0, v2}, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;-><init>(Lcom/android/internal/telephony/SubscriptionManager;ILcom/android/internal/telephony/Subscription$SubscriptionStatus;)V

    .line 977
    .local v9, setSubParam:Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;
    const/4 v0, 0x3

    invoke-static {p0, v0, v9}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v5

    .line 981
    .local v5, msgSetUiccSubDone:Landroid/os/Message;
    iget v6, v8, Lcom/android/internal/telephony/Subscription;->subId:I

    .line 982
    .local v6, ciIndex:I
    const-string v0, "ril.MSIMM"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v12, :cond_ac

    .line 983
    const/4 v6, 0x0

    .line 986
    :cond_ac
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v0, v0, v6

    iget v1, v8, Lcom/android/internal/telephony/Subscription;->slotId:I

    invoke-virtual {v8}, Lcom/android/internal/telephony/Subscription;->getAppIndex()I

    move-result v2

    iget v3, v8, Lcom/android/internal/telephony/Subscription;->subId:I

    iget-object v4, v8, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    invoke-interface/range {v0 .. v5}, Lcom/android/internal/telephony/CommandsInterface;->setUiccSubscription(IIIILandroid/os/Message;)V

    move v0, v12

    .line 996
    .end local v5           #msgSetUiccSubDone:Landroid/os/Message;
    .end local v6           #ciIndex:I
    .end local v8           #newSub:Lcom/android/internal/telephony/Subscription;
    .end local v9           #setSubParam:Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;
    .end local v10           #sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    .end local v11           #subId:I
    :goto_c2
    return v0

    .line 967
    .restart local v8       #newSub:Lcom/android/internal/telephony/Subscription;
    .restart local v10       #sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    .restart local v11       #subId:I
    :cond_c3
    const-string v0, "RUIM"

    iget-object v2, v8, Lcom/android/internal/telephony/Subscription;->appType:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_d7

    const-string v0, "CSIM"

    iget-object v2, v8, Lcom/android/internal/telephony/Subscription;->appType:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6e

    :cond_d7
    const-string v0, "CDMA"

    iget-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mProxyPhone:[Lcom/android/internal/telephony/Phone;

    aget-object v2, v2, v11

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6e

    .line 969
    const-string v0, "SubscriptionManager"

    const-string v2, "gets New CDMA phone"

    invoke-static {v0, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 970
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mProxyPhone:[Lcom/android/internal/telephony/Phone;

    aget-object v0, v0, v11

    check-cast v0, Lcom/android/internal/telephony/PhoneProxy;

    const/4 v2, 0x6

    invoke-virtual {v0, v2}, Lcom/android/internal/telephony/PhoneProxy;->updatePhoneObject(I)V

    goto/16 :goto_6e

    .end local v8           #newSub:Lcom/android/internal/telephony/Subscription;
    .end local v10           #sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    .end local v11           #subId:I
    :cond_fa
    move v0, v1

    .line 996
    goto :goto_c2
.end method

.method private startNextPendingDeactivateRequests()Z
    .registers 13

    .prologue
    const/4 v0, 0x0

    const/4 v11, 0x1

    .line 848
    invoke-direct {p0}, Lcom/android/internal/telephony/SubscriptionManager;->printPendingDeactivateRequests()V

    .line 850
    const/4 v7, 0x0

    .local v7, i:I
    :goto_6
    iget v1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v7, v1, :cond_5b

    .line 851
    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v1

    aget-object v10, v1, v7

    .line 852
    .local v10, sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    iget-object v1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-virtual {v1, v10}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/internal/telephony/Subscription;

    .line 853
    .local v8, newSub:Lcom/android/internal/telephony/Subscription;
    if-eqz v8, :cond_2c

    iget-object v1, v8, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    sget-object v2, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    if-ne v1, v2, :cond_2c

    .line 854
    invoke-direct {p0, v8}, Lcom/android/internal/telephony/SubscriptionManager;->validateDeactivationRequest(Lcom/android/internal/telephony/Subscription;)Z

    move-result v1

    if-nez v1, :cond_2f

    .line 856
    iget-object v1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    const/4 v2, 0x0

    invoke-virtual {v1, v10, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 850
    :cond_2c
    add-int/lit8 v7, v7, 0x1

    goto :goto_6

    .line 860
    :cond_2f
    const-string v1, "SubscriptionManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "startNextPendingDeactivateRequests: Need to deactivating SUB : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 861
    iget v1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCurrentDds:I

    iget v2, v8, Lcom/android/internal/telephony/Subscription;->subId:I

    if-ne v1, v2, :cond_5c

    iget-boolean v1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mDataActive:Z

    if-eqz v1, :cond_5c

    .line 866
    const-string v0, "SubscriptionManager"

    const-string v1, "Deactivate all the data calls if there is any"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 867
    iput-boolean v11, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetDdsRequired:Z

    :goto_5a
    move v0, v11

    .line 892
    .end local v8           #newSub:Lcom/android/internal/telephony/Subscription;
    .end local v10           #sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    :cond_5b
    return v0

    .line 869
    .restart local v8       #newSub:Lcom/android/internal/telephony/Subscription;
    .restart local v10       #sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    :cond_5c
    const-string v1, "SubscriptionManager"

    const-string v2, "startNextPendingDeactivateRequests: Deactivating now"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 870
    const-string v1, "ril.setSub"

    iget v2, v8, Lcom/android/internal/telephony/Subscription;->subId:I

    invoke-static {v1, v2}, Lcom/android/internal/telephony/MultiSimManager;->appendPropertySimSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "0"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 872
    new-instance v9, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;

    iget v1, v8, Lcom/android/internal/telephony/Subscription;->subId:I

    iget-object v2, v8, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    invoke-direct {v9, p0, v1, v2}, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;-><init>(Lcom/android/internal/telephony/SubscriptionManager;ILcom/android/internal/telephony/Subscription$SubscriptionStatus;)V

    .line 873
    .local v9, setSubParam:Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;
    const/4 v1, 0x3

    invoke-static {p0, v1, v9}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v5

    .line 877
    .local v5, msgSetUiccSubDone:Landroid/os/Message;
    iget v6, v8, Lcom/android/internal/telephony/Subscription;->subId:I

    .line 878
    .local v6, ciIndex:I
    const-string v1, "ril.MSIMM"

    invoke-static {v1, v0}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-ne v0, v11, :cond_89

    .line 879
    const/4 v6, 0x0

    .line 882
    :cond_89
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v0, v0, v6

    iget v1, v8, Lcom/android/internal/telephony/Subscription;->slotId:I

    invoke-virtual {v8}, Lcom/android/internal/telephony/Subscription;->getAppIndex()I

    move-result v2

    iget v3, v8, Lcom/android/internal/telephony/Subscription;->subId:I

    iget-object v4, v8, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    invoke-interface/range {v0 .. v5}, Lcom/android/internal/telephony/CommandsInterface;->setUiccSubscription(IIIILandroid/os/Message;)V

    goto :goto_5a
.end method

.method private triggerUpdateFromAvaialbleCards()V
    .registers 2

    .prologue
    .line 648
    const/16 v0, 0xb

    invoke-virtual {p0, v0}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 649
    return-void
.end method

.method private updateCurrentSubscription(ILcom/android/internal/telephony/Subscription;Lcom/android/internal/telephony/Subscription$SubscriptionStatus;Ljava/lang/String;)V
    .registers 9
    .parameter "subId"
    .parameter "subscription"
    .parameter "subStatus"
    .parameter "cause"

    .prologue
    .line 1010
    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v1

    aget-object v0, v1, p1

    .line 1012
    .local v0, sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    const-string v1, "SubscriptionManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateCurrentSubscription: subId = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " subStatus = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\n subscription = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1015
    sget-object v1, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    if-ne p3, v1, :cond_5d

    .line 1016
    invoke-direct {p0, v0}, Lcom/android/internal/telephony/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/Subscription;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/android/internal/telephony/Subscription;->copyFrom(Lcom/android/internal/telephony/Subscription;)Lcom/android/internal/telephony/Subscription;

    .line 1022
    :goto_3d
    invoke-direct {p0, v0}, Lcom/android/internal/telephony/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/Subscription;

    move-result-object v1

    iput-object p3, v1, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    .line 1023
    if-nez p4, :cond_47

    .line 1024
    const-string p4, "NO CHANGE IN SUBSCRIPTION"

    .line 1026
    :cond_47
    iget-object v1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/SubscriptionManager$PhoneSubscriptionInfo;

    iput-object p4, v1, Lcom/android/internal/telephony/SubscriptionManager$PhoneSubscriptionInfo;->cause:Ljava/lang/String;

    .line 1027
    iget-object v1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/SubscriptionManager$PhoneSubscriptionInfo;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/android/internal/telephony/SubscriptionManager$PhoneSubscriptionInfo;->subReady:Z

    .line 1028
    return-void

    .line 1018
    :cond_5d
    invoke-direct {p0, v0}, Lcom/android/internal/telephony/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/Subscription;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/Subscription;->clear()V

    .line 1020
    sget-object p3, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_DEACTIVATED:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    goto :goto_3d
.end method

.method private updateSubscriptionReadiness(IZ)V
    .registers 7
    .parameter "subId"
    .parameter "ready"

    .prologue
    .line 1031
    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v1

    aget-object v0, v1, p1

    .line 1032
    .local v0, sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    const-string v1, "SubscriptionManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateSubscriptionReadiness("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1035
    if-eqz p2, :cond_46

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/Subscription;

    move-result-object v1

    iget-object v1, v1, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    sget-object v2, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    if-ne v1, v2, :cond_46

    .line 1036
    iget-object v1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/SubscriptionManager$PhoneSubscriptionInfo;

    const/4 v2, 0x1

    iput-boolean v2, v1, Lcom/android/internal/telephony/SubscriptionManager$PhoneSubscriptionInfo;->subReady:Z

    .line 1041
    :goto_45
    return-void

    .line 1040
    :cond_46
    iget-object v1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCurrentSubscriptions:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/SubscriptionManager$PhoneSubscriptionInfo;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lcom/android/internal/telephony/SubscriptionManager$PhoneSubscriptionInfo;->subReady:Z

    goto :goto_45
.end method

.method private validateActivationRequest(Lcom/android/internal/telephony/Subscription;)Z
    .registers 7
    .parameter "sub"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 928
    iget v0, p1, Lcom/android/internal/telephony/Subscription;->slotId:I

    .line 929
    .local v0, slotId:I
    const-string v3, "ril.MSIMM"

    invoke-static {v3, v2}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v1, :cond_d

    .line 930
    const/4 v0, 0x0

    .line 933
    :cond_d
    iget-object v3, p1, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    sget-object v4, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    if-ne v3, v4, :cond_46

    iget v3, p1, Lcom/android/internal/telephony/Subscription;->subId:I

    if-ltz v3, :cond_46

    iget v3, p1, Lcom/android/internal/telephony/Subscription;->subId:I

    iget v4, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v3, v4, :cond_46

    iget v3, p1, Lcom/android/internal/telephony/Subscription;->slotId:I

    if-ltz v3, :cond_46

    iget v3, p1, Lcom/android/internal/telephony/Subscription;->slotId:I

    iget v4, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v3, v4, :cond_46

    invoke-virtual {p1}, Lcom/android/internal/telephony/Subscription;->getAppIndex()I

    move-result v3

    if-ltz v3, :cond_46

    iget-object v3, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/CardSubscriptionManager;

    invoke-virtual {v3, v0}, Lcom/android/internal/telephony/CardSubscriptionManager;->getCardSubscriptions(I)Lcom/android/internal/telephony/SubscriptionData;

    move-result-object v3

    if-eqz v3, :cond_46

    invoke-virtual {p1}, Lcom/android/internal/telephony/Subscription;->getAppIndex()I

    move-result v3

    iget-object v4, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/CardSubscriptionManager;

    invoke-virtual {v4, v0}, Lcom/android/internal/telephony/CardSubscriptionManager;->getCardSubscriptions(I)Lcom/android/internal/telephony/SubscriptionData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/SubscriptionData;->getLength()I

    move-result v4

    if-ge v3, v4, :cond_46

    .line 940
    :goto_45
    return v1

    :cond_46
    move v1, v2

    goto :goto_45
.end method

.method private validateDeactivationRequest(Lcom/android/internal/telephony/Subscription;)Z
    .registers 7
    .parameter "sub"

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 909
    iget v0, p1, Lcom/android/internal/telephony/Subscription;->slotId:I

    .line 910
    .local v0, slotId:I
    const-string v3, "ril.MSIMM"

    invoke-static {v3, v2}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v3

    if-ne v3, v1, :cond_d

    .line 911
    const/4 v0, 0x0

    .line 914
    :cond_d
    iget-object v3, p1, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    sget-object v4, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    if-ne v3, v4, :cond_46

    iget v3, p1, Lcom/android/internal/telephony/Subscription;->subId:I

    if-ltz v3, :cond_46

    iget v3, p1, Lcom/android/internal/telephony/Subscription;->subId:I

    iget v4, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v3, v4, :cond_46

    iget v3, p1, Lcom/android/internal/telephony/Subscription;->slotId:I

    if-ltz v3, :cond_46

    iget v3, p1, Lcom/android/internal/telephony/Subscription;->slotId:I

    iget v4, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v3, v4, :cond_46

    invoke-virtual {p1}, Lcom/android/internal/telephony/Subscription;->getAppIndex()I

    move-result v3

    if-ltz v3, :cond_46

    iget-object v3, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/CardSubscriptionManager;

    invoke-virtual {v3, v0}, Lcom/android/internal/telephony/CardSubscriptionManager;->getCardSubscriptions(I)Lcom/android/internal/telephony/SubscriptionData;

    move-result-object v3

    if-eqz v3, :cond_46

    invoke-virtual {p1}, Lcom/android/internal/telephony/Subscription;->getAppIndex()I

    move-result v3

    iget-object v4, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCardSubMgr:Lcom/android/internal/telephony/CardSubscriptionManager;

    invoke-virtual {v4, v0}, Lcom/android/internal/telephony/CardSubscriptionManager;->getCardSubscriptions(I)Lcom/android/internal/telephony/SubscriptionData;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/SubscriptionData;->getLength()I

    move-result v4

    if-ge v3, v4, :cond_46

    .line 921
    :goto_45
    return v1

    :cond_46
    move v1, v2

    goto :goto_45
.end method


# virtual methods
.method public getActiveSubscriptionsCount()I
    .registers 7

    .prologue
    .line 1265
    const/4 v0, 0x0

    .line 1266
    .local v0, activeSubCount:I
    const/4 v1, 0x0

    .local v1, i:I
    :goto_2
    iget v3, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v1, v3, :cond_19

    .line 1267
    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v3

    aget-object v2, v3, v1

    .line 1268
    .local v2, sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    invoke-direct {p0, v2}, Lcom/android/internal/telephony/SubscriptionManager;->getCurrentSubscriptionStatus(Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    move-result-object v3

    sget-object v4, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    if-ne v3, v4, :cond_16

    .line 1269
    add-int/lit8 v0, v0, 0x1

    .line 1266
    :cond_16
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 1272
    .end local v2           #sub:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    :cond_19
    const-string v3, "SubscriptionManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "count of subs activated "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1273
    return v0
.end method

.method public getCurrentSubscription(I)Lcom/android/internal/telephony/Subscription;
    .registers 3
    .parameter "subId"

    .prologue
    .line 1060
    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v0

    aget-object v0, v0, p1

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/Subscription;

    move-result-object v0

    return-object v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .registers 9
    .parameter "msg"

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 270
    iget v2, p1, Landroid/os/Message;->what:I

    packed-switch v2, :pswitch_data_d8

    .line 328
    :cond_7
    :goto_7
    :pswitch_7
    return-void

    .line 272
    :pswitch_8
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 273
    .local v0, ar:Landroid/os/AsyncResult;
    iget-object v1, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    .line 274
    .local v1, subId:Ljava/lang/Integer;
    const-string v2, "SubscriptionManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "EVENT_RADIO_OFF_OR_NOT_AVAILABLE on SUB: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    iget-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mRadioOn:[Z

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput-boolean v6, v2, v3

    .line 276
    invoke-direct {p0}, Lcom/android/internal/telephony/SubscriptionManager;->isAllRadioOn()Z

    move-result v2

    if-nez v2, :cond_7

    .line 277
    iput-boolean v6, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetSubscriptionInProgress:Z

    .line 278
    iput-boolean v5, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetDdsRequired:Z

    goto :goto_7

    .line 283
    .end local v0           #ar:Landroid/os/AsyncResult;
    .end local v1           #subId:Ljava/lang/Integer;
    :pswitch_3b
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 284
    .restart local v0       #ar:Landroid/os/AsyncResult;
    iget-object v1, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Integer;

    .line 285
    .restart local v1       #subId:Ljava/lang/Integer;
    const-string v2, "SubscriptionManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "EVENT_RADIO_ON on SUB: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    iget-object v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mRadioOn:[Z

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput-boolean v5, v2, v3

    goto :goto_7

    .line 290
    .end local v0           #ar:Landroid/os/AsyncResult;
    .end local v1           #subId:Ljava/lang/Integer;
    :pswitch_64
    const-string v2, "SubscriptionManager"

    const-string v3, "EVENT_CARD_INFO_AVAILABLE"

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 291
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/os/AsyncResult;

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/SubscriptionManager;->processCardInfoAvailable(Landroid/os/AsyncResult;)V

    goto :goto_7

    .line 295
    :pswitch_73
    const-string v2, "SubscriptionManager"

    const-string v3, "EVENT_CARD_INFO_NOT_AVAILABLE"

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/os/AsyncResult;

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/SubscriptionManager;->processCardInfoNotAvailable(Landroid/os/AsyncResult;)V

    goto :goto_7

    .line 300
    :pswitch_82
    iget-boolean v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mFlagAllCardsInfo:Z

    if-nez v2, :cond_9b

    .line 301
    const-string v2, "SubscriptionManager"

    const-string v3, "EVENT_ALL_CARD_INFO_AVAILABLE, delay 1 sec"

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 302
    const/4 v2, 0x2

    invoke-virtual {p0, v2}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v2

    const-wide/16 v3, 0x3e8

    invoke-virtual {p0, v2, v3, v4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 303
    iput-boolean v5, p0, Lcom/android/internal/telephony/SubscriptionManager;->mFlagAllCardsInfo:Z

    goto/16 :goto_7

    .line 306
    :cond_9b
    const-string v2, "SubscriptionManager"

    const-string v3, "EVENT_ALL_CARD_INFO_AVAILABLE"

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 307
    invoke-direct {p0}, Lcom/android/internal/telephony/SubscriptionManager;->processAllCardsInfoAvailable()V

    goto/16 :goto_7

    .line 311
    :pswitch_a7
    const-string v2, "SubscriptionManager"

    const-string v3, "EVENT_SET_UICC_SUBSCRIPTION_DONE"

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 312
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/os/AsyncResult;

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/SubscriptionManager;->processSetUiccSubscriptionDone(Landroid/os/AsyncResult;)V

    goto/16 :goto_7

    .line 316
    :pswitch_b7
    const-string v2, "SubscriptionManager"

    const-string v3, "EVENT_SUBSCRIPTION_STATUS_CHANGED"

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 317
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/os/AsyncResult;

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/SubscriptionManager;->processSubscriptionStatusChanged(Landroid/os/AsyncResult;)V

    goto/16 :goto_7

    .line 321
    :pswitch_c7
    const-string v2, "SubscriptionManager"

    const-string v3, "EVENT_SET_DATA_SUBSCRIPTION_DONE"

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 322
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v2, Landroid/os/AsyncResult;

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/SubscriptionManager;->processSetDataSubscriptionDone(Landroid/os/AsyncResult;)V

    goto/16 :goto_7

    .line 270
    nop

    :pswitch_data_d8
    .packed-switch 0x0
        :pswitch_64
        :pswitch_73
        :pswitch_82
        :pswitch_a7
        :pswitch_b7
        :pswitch_c7
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_3b
        :pswitch_8
    .end packed-switch
.end method

.method public isSetSubscriptionInProgress()Z
    .registers 2

    .prologue
    .line 1277
    iget-boolean v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetSubscriptionInProgress:Z

    return v0
.end method

.method public isSubActive(I)Z
    .registers 5
    .parameter "subscription"

    .prologue
    .line 1072
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/SubscriptionManager;->getCurrentSubscription(I)Lcom/android/internal/telephony/Subscription;

    move-result-object v0

    .line 1073
    .local v0, currentSelSub:Lcom/android/internal/telephony/Subscription;
    iget-object v1, v0, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    sget-object v2, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    if-ne v1, v2, :cond_c

    const/4 v1, 0x1

    :goto_b
    return v1

    :cond_c
    const/4 v1, 0x0

    goto :goto_b
.end method

.method public declared-synchronized registerForSetSubscriptionCompleted(Landroid/os/Handler;ILjava/lang/Object;)V
    .registers 6
    .parameter "h"
    .parameter "what"
    .parameter "obj"

    .prologue
    .line 1252
    monitor-enter p0

    :try_start_1
    new-instance v0, Landroid/os/Registrant;

    invoke-direct {v0, p1, p2, p3}, Landroid/os/Registrant;-><init>(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 1253
    .local v0, r:Landroid/os/Registrant;
    iget-object v1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetSubscriptionRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v1, v0}, Landroid/os/RegistrantList;->add(Landroid/os/Registrant;)V
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 1254
    monitor-exit p0

    return-void

    .line 1252
    .end local v0           #r:Landroid/os/Registrant;
    :catchall_d
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public registerForSubscriptionActivated(ILandroid/os/Handler;ILjava/lang/Object;)V
    .registers 8
    .parameter "subId"
    .parameter "h"
    .parameter "what"
    .parameter "obj"

    .prologue
    .line 1233
    new-instance v0, Landroid/os/Registrant;

    invoke-direct {v0, p2, p3, p4}, Landroid/os/Registrant;-><init>(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 1234
    .local v0, r:Landroid/os/Registrant;
    iget-object v1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v2, v1, p1

    monitor-enter v2

    .line 1235
    :try_start_a
    iget-object v1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v1, v1, p1

    invoke-virtual {v1, v0}, Landroid/os/RegistrantList;->add(Landroid/os/Registrant;)V

    .line 1236
    monitor-exit v2

    .line 1237
    return-void

    .line 1236
    :catchall_13
    move-exception v1

    monitor-exit v2
    :try_end_15
    .catchall {:try_start_a .. :try_end_15} :catchall_13

    throw v1
.end method

.method public registerForSubscriptionDeactivated(ILandroid/os/Handler;ILjava/lang/Object;)V
    .registers 8
    .parameter "subId"
    .parameter "h"
    .parameter "what"
    .parameter "obj"

    .prologue
    .line 1213
    new-instance v0, Landroid/os/Registrant;

    invoke-direct {v0, p2, p3, p4}, Landroid/os/Registrant;-><init>(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 1214
    .local v0, r:Landroid/os/Registrant;
    iget-object v1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v2, v1, p1

    monitor-enter v2

    .line 1215
    :try_start_a
    iget-object v1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v1, v1, p1

    invoke-virtual {v1, v0}, Landroid/os/RegistrantList;->add(Landroid/os/Registrant;)V

    .line 1216
    monitor-exit v2

    .line 1217
    return-void

    .line 1216
    :catchall_13
    move-exception v1

    monitor-exit v2
    :try_end_15
    .catchall {:try_start_a .. :try_end_15} :catchall_13

    throw v1
.end method

.method public setDataSubscription(ILandroid/os/Message;)V
    .registers 7
    .parameter "subscription"
    .parameter "onCompleteMsg"

    .prologue
    .line 1182
    const-string v1, "SubscriptionManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setDataSubscription() sub="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1183
    iput-object p2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetDdsCompleteMsg:Landroid/os/Message;

    .line 1184
    iput p1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mQueuedDds:I

    .line 1185
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mDisableDdsInProgress:Z

    .line 1188
    const/4 v1, 0x5

    new-instance v2, Ljava/lang/Integer;

    iget v3, p0, Lcom/android/internal/telephony/SubscriptionManager;->mQueuedDds:I

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-static {p0, v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 1191
    .local v0, msgSetDataSub:Landroid/os/Message;
    const-string v1, "SubscriptionManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Set DDS to "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/android/internal/telephony/SubscriptionManager;->mQueuedDds:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " Calling cmd interface setDataSubscription"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1194
    const-string v1, "0"

    const-string v2, "ril.MSIMM"

    const-string v3, "0"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_69

    .line 1195
    iget-object v1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    iget v2, p0, Lcom/android/internal/telephony/SubscriptionManager;->mQueuedDds:I

    aget-object v1, v1, v2

    invoke-interface {v1, v0}, Lcom/android/internal/telephony/CommandsInterface;->setDataSubscription(Landroid/os/Message;)V

    .line 1200
    :goto_64
    iget v1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mQueuedDds:I

    iput v1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCurrentDds:I

    .line 1202
    return-void

    .line 1197
    :cond_69
    iget-object v1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mCi:[Lcom/android/internal/telephony/CommandsInterface;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-interface {v1, v0}, Lcom/android/internal/telephony/CommandsInterface;->setDataSubscription(Landroid/os/Message;)V

    .line 1198
    const-string v1, "SubscriptionManager"

    const-string v2, "RIL request is needed to SUB0 in case of SIM2 only"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_64
.end method

.method public setPhones([Lcom/android/internal/telephony/Phone;)V
    .registers 2
    .parameter "p"

    .prologue
    .line 331
    iput-object p1, p0, Lcom/android/internal/telephony/SubscriptionManager;->mProxyPhone:[Lcom/android/internal/telephony/Phone;

    .line 332
    return-void
.end method

.method public setSubscription(Lcom/android/internal/telephony/SubscriptionData;)Z
    .registers 10
    .parameter "subData"

    .prologue
    .line 1118
    const/4 v3, 0x0

    .line 1124
    .local v3, ret:Z
    iget-boolean v5, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-eqz v5, :cond_7

    .line 1125
    const/4 v5, 0x0

    .line 1173
    :goto_6
    return v5

    .line 1128
    :cond_7
    const/4 v1, 0x0

    .local v1, i:I
    :goto_8
    iget v5, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v1, v5, :cond_15

    .line 1129
    iget-object v5, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSubResult:[Ljava/lang/String;

    const-string v6, "NO CHANGE IN SUBSCRIPTION"

    aput-object v6, v5, v1

    .line 1128
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    .line 1133
    :cond_15
    const/4 v1, 0x0

    :goto_16
    iget v5, p0, Lcom/android/internal/telephony/SubscriptionManager;->mNumPhones:I

    if-ge v1, v5, :cond_bd

    .line 1134
    invoke-static {}, Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;->values()[Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;

    move-result-object v5

    aget-object v4, v5, v1

    .line 1139
    .local v4, subId:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    invoke-direct {p0, v4}, Lcom/android/internal/telephony/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/Subscription;

    move-result-object v5

    iget-object v6, p1, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v7

    aget-object v6, v6, v7

    invoke-virtual {v5, v6}, Lcom/android/internal/telephony/Subscription;->isSame(Lcom/android/internal/telephony/Subscription;)Z

    move-result v5

    if-nez v5, :cond_67

    .line 1140
    invoke-direct {p0, v4}, Lcom/android/internal/telephony/SubscriptionManager;->getCurrentSubscriptionStatus(Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    move-result-object v5

    sget-object v6, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_ACTIVATED:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    if-ne v5, v6, :cond_a6

    .line 1141
    const-string v5, "SubscriptionManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Need to deactivate current SUB :"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1142
    new-instance v2, Lcom/android/internal/telephony/Subscription;

    invoke-direct {v2}, Lcom/android/internal/telephony/Subscription;-><init>()V

    .line 1143
    .local v2, newSub:Lcom/android/internal/telephony/Subscription;
    invoke-direct {p0, v4}, Lcom/android/internal/telephony/SubscriptionManager;->getCurrentSubscription(Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/Subscription;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/android/internal/telephony/Subscription;->copyFrom(Lcom/android/internal/telephony/Subscription;)Lcom/android/internal/telephony/Subscription;

    .line 1144
    sget-object v5, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    iput-object v5, v2, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    .line 1145
    iget-object v5, p0, Lcom/android/internal/telephony/SubscriptionManager;->mDeactivatePending:Ljava/util/HashMap;

    invoke-virtual {v5, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1151
    .end local v2           #newSub:Lcom/android/internal/telephony/Subscription;
    :cond_67
    :goto_67
    iget-object v5, p1, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    aget-object v5, v5, v6

    iget-object v5, v5, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    sget-object v6, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_ACTIVATE:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    if-ne v5, v6, :cond_a2

    .line 1152
    const-string v5, "SubscriptionManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Need to activate new SUB : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1153
    new-instance v2, Lcom/android/internal/telephony/Subscription;

    invoke-direct {v2}, Lcom/android/internal/telephony/Subscription;-><init>()V

    .line 1154
    .restart local v2       #newSub:Lcom/android/internal/telephony/Subscription;
    iget-object v5, p1, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    aget-object v5, v5, v6

    invoke-virtual {v2, v5}, Lcom/android/internal/telephony/Subscription;->copyFrom(Lcom/android/internal/telephony/Subscription;)Lcom/android/internal/telephony/Subscription;

    .line 1155
    iget-object v5, p0, Lcom/android/internal/telephony/SubscriptionManager;->mActivatePending:Ljava/util/HashMap;

    invoke-virtual {v5, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1133
    .end local v2           #newSub:Lcom/android/internal/telephony/Subscription;
    :cond_a2
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_16

    .line 1146
    :cond_a6
    invoke-direct {p0, v4}, Lcom/android/internal/telephony/SubscriptionManager;->getCurrentSubscriptionStatus(Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;)Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    move-result-object v5

    sget-object v6, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_DEACTIVATED:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    if-ne v5, v6, :cond_67

    iget-object v5, p1, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    aget-object v5, v5, v6

    iget-object v5, v5, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    sget-object v6, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_DEACTIVATE:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    if-ne v5, v6, :cond_67

    goto :goto_67

    .line 1160
    .end local v4           #subId:Lcom/android/internal/telephony/SubscriptionManager$SubscriptionId;
    :cond_bd
    iget-boolean v5, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-nez v5, :cond_ca

    .line 1161
    invoke-direct {p0}, Lcom/android/internal/telephony/SubscriptionManager;->startNextPendingDeactivateRequests()Z

    move-result v0

    .line 1162
    .local v0, deactivateInProgress:Z
    if-eqz v0, :cond_d2

    .line 1163
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetSubscriptionInProgress:Z

    .line 1169
    .end local v0           #deactivateInProgress:Z
    :cond_ca
    :goto_ca
    iget-boolean v5, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetSubscriptionInProgress:Z

    if-eqz v5, :cond_cf

    .line 1171
    const/4 v3, 0x1

    :cond_cf
    move v5, v3

    .line 1173
    goto/16 :goto_6

    .line 1165
    .restart local v0       #deactivateInProgress:Z
    :cond_d2
    invoke-direct {p0}, Lcom/android/internal/telephony/SubscriptionManager;->processActivateRequests()V

    goto :goto_ca
.end method

.method public declared-synchronized unRegisterForSetSubscriptionCompleted(Landroid/os/Handler;)V
    .registers 3
    .parameter "h"

    .prologue
    .line 1261
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSetSubscriptionRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v0, p1}, Landroid/os/RegistrantList;->remove(Landroid/os/Handler;)V
    :try_end_6
    .catchall {:try_start_1 .. :try_end_6} :catchall_8

    .line 1262
    monitor-exit p0

    return-void

    .line 1261
    :catchall_8
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public unregisterForSubscriptionActivated(ILandroid/os/Handler;)V
    .registers 5
    .parameter "subId"
    .parameter "h"

    .prologue
    .line 1240
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v1, v0, p1

    monitor-enter v1

    .line 1241
    :try_start_5
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSubActivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v0, v0, p1

    invoke-virtual {v0, p2}, Landroid/os/RegistrantList;->remove(Landroid/os/Handler;)V

    .line 1242
    monitor-exit v1

    .line 1243
    return-void

    .line 1242
    :catchall_e
    move-exception v0

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_5 .. :try_end_10} :catchall_e

    throw v0
.end method

.method public unregisterForSubscriptionDeactivated(ILandroid/os/Handler;)V
    .registers 5
    .parameter "subId"
    .parameter "h"

    .prologue
    .line 1220
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v1, v0, p1

    monitor-enter v1

    .line 1221
    :try_start_5
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionManager;->mSubDeactivatedRegistrants:[Landroid/os/RegistrantList;

    aget-object v0, v0, p1

    invoke-virtual {v0, p2}, Landroid/os/RegistrantList;->remove(Landroid/os/Handler;)V

    .line 1222
    monitor-exit v1

    .line 1223
    return-void

    .line 1222
    :catchall_e
    move-exception v0

    monitor-exit v1
    :try_end_10
    .catchall {:try_start_5 .. :try_end_10} :catchall_e

    throw v0
.end method
