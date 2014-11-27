.class Lcom/itsoninc/android/ItsOnPhoneClient$AndroidFramework;
.super Ljava/lang/Object;
.source "ItsOnPhoneClient.java"

# interfaces
.implements Lcom/itsoninc/android/ItsOnFrameworkInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/itsoninc/android/ItsOnPhoneClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AndroidFramework"
.end annotation


# instance fields
.field private mHandler:Landroid/os/Handler;

.field private mRil:Lcom/android/internal/telephony/RIL;

.field final synthetic this$0:Lcom/itsoninc/android/ItsOnPhoneClient;


# direct methods
.method constructor <init>(Lcom/itsoninc/android/ItsOnPhoneClient;Lcom/android/internal/telephony/RIL;Landroid/os/Handler;)V
    .registers 4
    .parameter
    .parameter "ril"
    .parameter "handler"

    .prologue
    .line 35
    iput-object p1, p0, Lcom/itsoninc/android/ItsOnPhoneClient$AndroidFramework;->this$0:Lcom/itsoninc/android/ItsOnPhoneClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p2, p0, Lcom/itsoninc/android/ItsOnPhoneClient$AndroidFramework;->mRil:Lcom/android/internal/telephony/RIL;

    .line 37
    iput-object p3, p0, Lcom/itsoninc/android/ItsOnPhoneClient$AndroidFramework;->mHandler:Landroid/os/Handler;

    .line 38
    return-void
.end method


# virtual methods
.method public hangupForegroundCalls()V
    .registers 3

    .prologue
    .line 47
    iget-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient$AndroidFramework;->mRil:Lcom/android/internal/telephony/RIL;

    iget-object v1, p0, Lcom/itsoninc/android/ItsOnPhoneClient$AndroidFramework;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/RIL;->hangupForegroundResumeBackground(Landroid/os/Message;)V

    .line 48
    return-void
.end method

.method public hangupIncomingCalls()V
    .registers 3

    .prologue
    .line 51
    iget-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient$AndroidFramework;->mRil:Lcom/android/internal/telephony/RIL;

    iget-object v1, p0, Lcom/itsoninc/android/ItsOnPhoneClient$AndroidFramework;->mHandler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/RIL;->hangupWaitingOrBackground(Landroid/os/Message;)V

    .line 52
    return-void
.end method

.method public sendCallRing()V
    .registers 1

    .prologue
    .line 44
    return-void
.end method

.method public sendCallStateChanged()V
    .registers 1

    .prologue
    .line 41
    return-void
.end method
