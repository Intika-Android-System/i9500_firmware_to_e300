.class Lcom/android/internal/telephony/cat/SendSSParams;
.super Lcom/android/internal/telephony/cat/DisplayTextParams;
.source "CommandParams.java"


# instance fields
.field ssString:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/cat/CommandDetails;Lcom/android/internal/telephony/cat/TextMessage;Ljava/lang/String;)V
    .registers 4
    .parameter "cmdDet"
    .parameter "textMsg"
    .parameter "ssString"

    .prologue
    .line 282
    invoke-direct {p0, p1, p2}, Lcom/android/internal/telephony/cat/DisplayTextParams;-><init>(Lcom/android/internal/telephony/cat/CommandDetails;Lcom/android/internal/telephony/cat/TextMessage;)V

    .line 283
    iput-object p3, p0, Lcom/android/internal/telephony/cat/SendSSParams;->ssString:Ljava/lang/String;

    .line 284
    return-void
.end method

.method constructor <init>(Lcom/android/internal/telephony/cat/CommandDetails;Lcom/android/internal/telephony/cat/TextMessage;Ljava/lang/String;Z)V
    .registers 5
    .parameter "cmdDet"
    .parameter "textMsg"
    .parameter "ssString"
    .parameter "hasIcon"

    .prologue
    .line 286
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/telephony/cat/SendSSParams;-><init>(Lcom/android/internal/telephony/cat/CommandDetails;Lcom/android/internal/telephony/cat/TextMessage;Ljava/lang/String;)V

    .line 287
    invoke-virtual {p0, p4}, Lcom/android/internal/telephony/cat/CommandParams;->setHasIconTag(Z)V

    .line 288
    return-void
.end method
