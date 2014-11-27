.class public Lcom/android/internal/telephony/SMSStateBroadcaster;
.super Ljava/lang/Object;
.source "SMSStateBroadcaster.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .parameter "context"

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    return-void
.end method


# virtual methods
.method public dispose()V
    .registers 1

    .prologue
    .line 20
    return-void
.end method

.method public sendSMSReceived(IIILjava/lang/String;Ljava/lang/String;)V
    .registers 6
    .parameter "contextId"
    .parameter "size"
    .parameter "numFrags"
    .parameter "origaddr"
    .parameter "smsc"

    .prologue
    .line 17
    return-void
.end method

.method public sendSMSSending(IIILjava/lang/String;Ljava/lang/String;)V
    .registers 6
    .parameter "contextId"
    .parameter "size"
    .parameter "numFrags"
    .parameter "destaddr"
    .parameter "smsc"

    .prologue
    .line 11
    return-void
.end method

.method public sendSMSSent(IIS)V
    .registers 4
    .parameter "contextId"
    .parameter "ErrCode"
    .parameter "resultCode"

    .prologue
    .line 14
    return-void
.end method
