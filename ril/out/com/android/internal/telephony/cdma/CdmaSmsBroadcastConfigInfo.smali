.class public Lcom/android/internal/telephony/cdma/CdmaSmsBroadcastConfigInfo;
.super Ljava/lang/Object;
.source "CdmaSmsBroadcastConfigInfo.java"


# instance fields
.field private mFromServiceCategory:I

.field private mLanguage:I

.field private mSelected:Z

.field private mToServiceCategory:I


# direct methods
.method public constructor <init>(IIIZ)V
    .registers 5
    .parameter "fromServiceCategory"
    .parameter "toServiceCategory"
    .parameter "language"
    .parameter "selected"

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput p1, p0, Lcom/android/internal/telephony/cdma/CdmaSmsBroadcastConfigInfo;->mFromServiceCategory:I

    .line 48
    iput p2, p0, Lcom/android/internal/telephony/cdma/CdmaSmsBroadcastConfigInfo;->mToServiceCategory:I

    .line 49
    iput p3, p0, Lcom/android/internal/telephony/cdma/CdmaSmsBroadcastConfigInfo;->mLanguage:I

    .line 50
    iput-boolean p4, p0, Lcom/android/internal/telephony/cdma/CdmaSmsBroadcastConfigInfo;->mSelected:Z

    .line 51
    return-void
.end method


# virtual methods
.method public getFromServiceCategory()I
    .registers 2

    .prologue
    .line 57
    iget v0, p0, Lcom/android/internal/telephony/cdma/CdmaSmsBroadcastConfigInfo;->mFromServiceCategory:I

    return v0
.end method

.method public getLanguage()I
    .registers 2

    .prologue
    .line 71
    iget v0, p0, Lcom/android/internal/telephony/cdma/CdmaSmsBroadcastConfigInfo;->mLanguage:I

    return v0
.end method

.method public getToServiceCategory()I
    .registers 2

    .prologue
    .line 64
    iget v0, p0, Lcom/android/internal/telephony/cdma/CdmaSmsBroadcastConfigInfo;->mToServiceCategory:I

    return v0
.end method

.method public isSelected()Z
    .registers 2

    .prologue
    .line 78
    iget-boolean v0, p0, Lcom/android/internal/telephony/cdma/CdmaSmsBroadcastConfigInfo;->mSelected:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CdmaSmsBroadcastConfigInfo: Id ["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/cdma/CdmaSmsBroadcastConfigInfo;->mFromServiceCategory:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/cdma/CdmaSmsBroadcastConfigInfo;->mToServiceCategory:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "] "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/android/internal/telephony/cdma/CdmaSmsBroadcastConfigInfo;->isSelected()Z

    move-result v0

    if-eqz v0, :cond_34

    const-string v0, "ENABLED"

    :goto_2b
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_34
    const-string v0, "DISABLED"

    goto :goto_2b
.end method