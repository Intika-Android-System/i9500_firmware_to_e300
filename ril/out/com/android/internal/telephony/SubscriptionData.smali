.class public Lcom/android/internal/telephony/SubscriptionData;
.super Ljava/lang/Object;
.source "SubscriptionData.java"


# instance fields
.field public subscription:[Lcom/android/internal/telephony/Subscription;


# direct methods
.method public constructor <init>(I)V
    .registers 5
    .parameter "numSub"

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    new-array v1, p1, [Lcom/android/internal/telephony/Subscription;

    iput-object v1, p0, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    .line 43
    const/4 v0, 0x0

    .local v0, i:I
    :goto_8
    if-ge v0, p1, :cond_16

    .line 44
    iget-object v1, p0, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    new-instance v2, Lcom/android/internal/telephony/Subscription;

    invoke-direct {v2}, Lcom/android/internal/telephony/Subscription;-><init>()V

    aput-object v2, v1, v0

    .line 43
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 46
    :cond_16
    return-void
.end method


# virtual methods
.method public copyFrom(Lcom/android/internal/telephony/SubscriptionData;)Lcom/android/internal/telephony/SubscriptionData;
    .registers 5
    .parameter "from"

    .prologue
    .line 56
    if-eqz p1, :cond_28

    .line 57
    invoke-virtual {p1}, Lcom/android/internal/telephony/SubscriptionData;->getLength()I

    move-result v1

    new-array v1, v1, [Lcom/android/internal/telephony/Subscription;

    iput-object v1, p0, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    .line 58
    const/4 v0, 0x0

    .local v0, i:I
    :goto_b
    invoke-virtual {p1}, Lcom/android/internal/telephony/SubscriptionData;->getLength()I

    move-result v1

    if-ge v0, v1, :cond_28

    .line 59
    iget-object v1, p0, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    new-instance v2, Lcom/android/internal/telephony/Subscription;

    invoke-direct {v2}, Lcom/android/internal/telephony/Subscription;-><init>()V

    aput-object v2, v1, v0

    .line 60
    iget-object v1, p0, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v1, v1, v0

    iget-object v2, p1, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v2, v2, v0

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/Subscription;->copyFrom(Lcom/android/internal/telephony/Subscription;)Lcom/android/internal/telephony/Subscription;

    .line 58
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 63
    .end local v0           #i:I
    :cond_28
    return-object p0
.end method

.method public getIccId()Ljava/lang/String;
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 67
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    array-length v0, v0

    if-lez v0, :cond_13

    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v0, v0, v1

    if-eqz v0, :cond_13

    .line 68
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v0, v0, v1

    iget-object v0, v0, Lcom/android/internal/telephony/Subscription;->iccId:Ljava/lang/String;

    .line 70
    :goto_12
    return-object v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public getLength()I
    .registers 2

    .prologue
    .line 49
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    if-eqz v0, :cond_8

    .line 50
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    array-length v0, v0

    .line 52
    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public getSubscription(Lcom/android/internal/telephony/Subscription;)Lcom/android/internal/telephony/Subscription;
    .registers 4
    .parameter "sub"

    .prologue
    .line 83
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget-object v1, p0, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    array-length v1, v1

    if-ge v0, v1, :cond_18

    .line 84
    iget-object v1, p0, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Lcom/android/internal/telephony/Subscription;->isSame(Lcom/android/internal/telephony/Subscription;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 85
    iget-object v1, p0, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v1, v1, v0

    .line 88
    :goto_14
    return-object v1

    .line 83
    :cond_15
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 88
    :cond_18
    const/4 v1, 0x0

    goto :goto_14
.end method

.method public hasSubscription(Lcom/android/internal/telephony/Subscription;)Z
    .registers 4
    .parameter "sub"

    .prologue
    .line 74
    const/4 v0, 0x0

    .local v0, i:I
    :goto_1
    iget-object v1, p0, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    array-length v1, v1

    if-ge v0, v1, :cond_15

    .line 75
    iget-object v1, p0, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1}, Lcom/android/internal/telephony/Subscription;->isSame(Lcom/android/internal/telephony/Subscription;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 76
    const/4 v1, 0x1

    .line 79
    :goto_11
    return v1

    .line 74
    :cond_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 79
    :cond_15
    const/4 v1, 0x0

    goto :goto_11
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 92
    iget-object v0, p0, Lcom/android/internal/telephony/SubscriptionData;->subscription:[Lcom/android/internal/telephony/Subscription;

    invoke-static {v0}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method