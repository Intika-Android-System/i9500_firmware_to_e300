.class public final Lcom/android/internal/telephony/Subscription;
.super Ljava/lang/Object;
.source "Subscription.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/Subscription$SubscriptionStatus;
    }
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "RIL_Subscription"

.field public static final SUBSCRIPTION_INDEX_INVALID:I = -0x1


# instance fields
.field private DEBUG:Z

.field public appId:Ljava/lang/String;

.field public appLabel:Ljava/lang/String;

.field public appType:Ljava/lang/String;

.field public iccId:Ljava/lang/String;

.field public m3gpp2Index:I

.field public m3gppIndex:I

.field public slotId:I

.field public subId:I

.field public subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/Subscription;->DEBUG:Z

    .line 70
    invoke-virtual {p0}, Lcom/android/internal/telephony/Subscription;->clear()V

    .line 71
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    const/4 v0, -0x1

    .line 114
    iput v0, p0, Lcom/android/internal/telephony/Subscription;->slotId:I

    .line 115
    iput v0, p0, Lcom/android/internal/telephony/Subscription;->m3gppIndex:I

    .line 116
    iput v0, p0, Lcom/android/internal/telephony/Subscription;->m3gpp2Index:I

    .line 117
    iput v0, p0, Lcom/android/internal/telephony/Subscription;->subId:I

    .line 118
    sget-object v0, Lcom/android/internal/telephony/Subscription$SubscriptionStatus;->SUB_INVALID:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    iput-object v0, p0, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    .line 119
    iput-object v1, p0, Lcom/android/internal/telephony/Subscription;->appId:Ljava/lang/String;

    .line 120
    iput-object v1, p0, Lcom/android/internal/telephony/Subscription;->appLabel:Ljava/lang/String;

    .line 121
    iput-object v1, p0, Lcom/android/internal/telephony/Subscription;->appType:Ljava/lang/String;

    .line 122
    iput-object v1, p0, Lcom/android/internal/telephony/Subscription;->iccId:Ljava/lang/String;

    .line 123
    return-void
.end method

.method public copyFrom(Lcom/android/internal/telephony/Subscription;)Lcom/android/internal/telephony/Subscription;
    .registers 4
    .parameter "from"

    .prologue
    .line 131
    if-eqz p1, :cond_4a

    .line 132
    iget v0, p1, Lcom/android/internal/telephony/Subscription;->slotId:I

    iput v0, p0, Lcom/android/internal/telephony/Subscription;->slotId:I

    .line 133
    iget v0, p1, Lcom/android/internal/telephony/Subscription;->m3gppIndex:I

    iput v0, p0, Lcom/android/internal/telephony/Subscription;->m3gppIndex:I

    .line 134
    iget v0, p1, Lcom/android/internal/telephony/Subscription;->m3gpp2Index:I

    iput v0, p0, Lcom/android/internal/telephony/Subscription;->m3gpp2Index:I

    .line 135
    iget v0, p1, Lcom/android/internal/telephony/Subscription;->subId:I

    iput v0, p0, Lcom/android/internal/telephony/Subscription;->subId:I

    .line 136
    iget-object v0, p1, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    iput-object v0, p0, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    .line 137
    iget-object v0, p1, Lcom/android/internal/telephony/Subscription;->appId:Ljava/lang/String;

    if-eqz v0, :cond_23

    .line 138
    new-instance v0, Ljava/lang/String;

    iget-object v1, p1, Lcom/android/internal/telephony/Subscription;->appId:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/internal/telephony/Subscription;->appId:Ljava/lang/String;

    .line 140
    :cond_23
    iget-object v0, p1, Lcom/android/internal/telephony/Subscription;->appLabel:Ljava/lang/String;

    if-eqz v0, :cond_30

    .line 141
    new-instance v0, Ljava/lang/String;

    iget-object v1, p1, Lcom/android/internal/telephony/Subscription;->appLabel:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/internal/telephony/Subscription;->appLabel:Ljava/lang/String;

    .line 143
    :cond_30
    iget-object v0, p1, Lcom/android/internal/telephony/Subscription;->appType:Ljava/lang/String;

    if-eqz v0, :cond_3d

    .line 144
    new-instance v0, Ljava/lang/String;

    iget-object v1, p1, Lcom/android/internal/telephony/Subscription;->appType:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/internal/telephony/Subscription;->appType:Ljava/lang/String;

    .line 146
    :cond_3d
    iget-object v0, p1, Lcom/android/internal/telephony/Subscription;->iccId:Ljava/lang/String;

    if-eqz v0, :cond_4a

    .line 147
    new-instance v0, Ljava/lang/String;

    iget-object v1, p1, Lcom/android/internal/telephony/Subscription;->iccId:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/android/internal/telephony/Subscription;->iccId:Ljava/lang/String;

    .line 151
    :cond_4a
    return-object p0
.end method

.method public getAppIndex()I
    .registers 3

    .prologue
    .line 159
    iget v0, p0, Lcom/android/internal/telephony/Subscription;->m3gppIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_8

    .line 160
    iget v0, p0, Lcom/android/internal/telephony/Subscription;->m3gppIndex:I

    .line 162
    :goto_7
    return v0

    :cond_8
    iget v0, p0, Lcom/android/internal/telephony/Subscription;->m3gpp2Index:I

    goto :goto_7
.end method

.method public isSame(Lcom/android/internal/telephony/Subscription;)Z
    .registers 4
    .parameter "sub"

    .prologue
    .line 88
    if-eqz p1, :cond_8a

    .line 89
    iget v0, p0, Lcom/android/internal/telephony/Subscription;->slotId:I

    iget v1, p1, Lcom/android/internal/telephony/Subscription;->slotId:I

    if-ne v0, v1, :cond_91

    iget v0, p0, Lcom/android/internal/telephony/Subscription;->m3gppIndex:I

    iget v1, p1, Lcom/android/internal/telephony/Subscription;->m3gppIndex:I

    if-ne v0, v1, :cond_91

    iget v0, p0, Lcom/android/internal/telephony/Subscription;->m3gpp2Index:I

    iget v1, p1, Lcom/android/internal/telephony/Subscription;->m3gpp2Index:I

    if-ne v0, v1, :cond_91

    iget v0, p0, Lcom/android/internal/telephony/Subscription;->subId:I

    iget v1, p1, Lcom/android/internal/telephony/Subscription;->subId:I

    if-ne v0, v1, :cond_91

    iget-object v0, p0, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    iget-object v1, p1, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    if-ne v0, v1, :cond_91

    iget-object v0, p0, Lcom/android/internal/telephony/Subscription;->appId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_30

    iget-object v0, p1, Lcom/android/internal/telephony/Subscription;->appId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3a

    :cond_30
    iget-object v0, p0, Lcom/android/internal/telephony/Subscription;->appId:Ljava/lang/String;

    iget-object v1, p1, Lcom/android/internal/telephony/Subscription;->appId:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_91

    :cond_3a
    iget-object v0, p0, Lcom/android/internal/telephony/Subscription;->appLabel:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4a

    iget-object v0, p1, Lcom/android/internal/telephony/Subscription;->appLabel:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_54

    :cond_4a
    iget-object v0, p0, Lcom/android/internal/telephony/Subscription;->appLabel:Ljava/lang/String;

    iget-object v1, p1, Lcom/android/internal/telephony/Subscription;->appLabel:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_91

    :cond_54
    iget-object v0, p0, Lcom/android/internal/telephony/Subscription;->appType:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_64

    iget-object v0, p1, Lcom/android/internal/telephony/Subscription;->appType:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6e

    :cond_64
    iget-object v0, p0, Lcom/android/internal/telephony/Subscription;->appType:Ljava/lang/String;

    iget-object v1, p1, Lcom/android/internal/telephony/Subscription;->appType:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_91

    :cond_6e
    iget-object v0, p0, Lcom/android/internal/telephony/Subscription;->iccId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_7e

    iget-object v0, p1, Lcom/android/internal/telephony/Subscription;->iccId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_88

    :cond_7e
    iget-object v0, p0, Lcom/android/internal/telephony/Subscription;->iccId:Ljava/lang/String;

    iget-object v1, p1, Lcom/android/internal/telephony/Subscription;->iccId:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_91

    .line 102
    :cond_88
    const/4 v0, 0x1

    .line 107
    :goto_89
    return v0

    .line 105
    :cond_8a
    const-string v0, "RIL_Subscription"

    const-string v1, "Subscription.equals: sub == null"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    :cond_91
    const/4 v0, 0x0

    goto :goto_89
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 74
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Subscription = { slotId = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/Subscription;->slotId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", 3gppIndex = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/Subscription;->m3gppIndex:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", 3gpp2Index = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/Subscription;->m3gpp2Index:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", subId = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/Subscription;->subId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", subStatus = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/Subscription;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", appId = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/Subscription;->appId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", appLabel = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/Subscription;->appLabel:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", appType = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/Subscription;->appType:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", iccId = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/Subscription;->iccId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " }"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
