.class public Lcom/itsoninc/android/ItsOnPhoneClientFactory;
.super Ljava/lang/Object;
.source "ItsOnPhoneClientFactory.java"


# static fields
.field static mRil:Lcom/android/internal/telephony/RIL;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static configure(Lcom/android/internal/telephony/RIL;)V
    .registers 1
    .parameter "ril"

    .prologue
    .line 11
    sput-object p0, Lcom/itsoninc/android/ItsOnPhoneClientFactory;->mRil:Lcom/android/internal/telephony/RIL;

    .line 12
    return-void
.end method

.method public static get(Landroid/content/Context;)Lcom/itsoninc/android/ItsOnPhoneClient;
    .registers 3
    .parameter "context"

    .prologue
    .line 15
    sget-object v0, Lcom/itsoninc/android/ItsOnPhoneClientFactory;->mRil:Lcom/android/internal/telephony/RIL;

    if-nez v0, :cond_6

    .line 16
    const/4 v0, 0x0

    .line 18
    :goto_5
    return-object v0

    :cond_6
    new-instance v0, Lcom/itsoninc/android/ItsOnPhoneClient;

    sget-object v1, Lcom/itsoninc/android/ItsOnPhoneClientFactory;->mRil:Lcom/android/internal/telephony/RIL;

    invoke-direct {v0, p0, v1}, Lcom/itsoninc/android/ItsOnPhoneClient;-><init>(Landroid/content/Context;Lcom/android/internal/telephony/RIL;)V

    goto :goto_5
.end method
