.class Lcom/android/internal/telephony/cat/SendDTMFParams;
.super Lcom/android/internal/telephony/cat/DisplayTextParams;
.source "CommandParams.java"


# instance fields
.field dtmfString:[B


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/cat/CommandDetails;Lcom/android/internal/telephony/cat/TextMessage;[B)V
    .registers 4
    .parameter "cmdDet"
    .parameter "textMsg"
    .parameter "dtmfString"

    .prologue
    .line 317
    invoke-direct {p0, p1, p2}, Lcom/android/internal/telephony/cat/DisplayTextParams;-><init>(Lcom/android/internal/telephony/cat/CommandDetails;Lcom/android/internal/telephony/cat/TextMessage;)V

    .line 318
    iput-object p3, p0, Lcom/android/internal/telephony/cat/SendDTMFParams;->dtmfString:[B

    .line 319
    return-void
.end method

.method constructor <init>(Lcom/android/internal/telephony/cat/CommandDetails;Lcom/android/internal/telephony/cat/TextMessage;[BZ)V
    .registers 5
    .parameter "cmdDet"
    .parameter "textMsg"
    .parameter "dtmfString"
    .parameter "hasIcon"

    .prologue
    .line 322
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/telephony/cat/SendDTMFParams;-><init>(Lcom/android/internal/telephony/cat/CommandDetails;Lcom/android/internal/telephony/cat/TextMessage;[B)V

    .line 323
    invoke-virtual {p0, p4}, Lcom/android/internal/telephony/cat/CommandParams;->setHasIconTag(Z)V

    .line 324
    return-void
.end method
