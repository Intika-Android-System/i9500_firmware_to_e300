.class Lcom/android/internal/telephony/cat/GetChannelDataParams;
.super Lcom/android/internal/telephony/cat/CommandParams;
.source "CommandParams.java"


# instance fields
.field mChannelId:I


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/cat/CommandDetails;I)V
    .registers 3
    .parameter "cmdDet"
    .parameter "channelId"

    .prologue
    .line 444
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/cat/CommandParams;-><init>(Lcom/android/internal/telephony/cat/CommandDetails;)V

    .line 445
    iput p2, p0, Lcom/android/internal/telephony/cat/GetChannelDataParams;->mChannelId:I

    .line 446
    return-void
.end method
