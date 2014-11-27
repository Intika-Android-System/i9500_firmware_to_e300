.class Lcom/android/internal/telephony/LmsAssemblyTrackerCTC$1;
.super Landroid/content/BroadcastReceiver;
.source "LmsAssemblyTrackerCTC.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/LmsAssemblyTrackerCTC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/telephony/LmsAssemblyTrackerCTC;


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/LmsAssemblyTrackerCTC;)V
    .registers 2
    .parameter

    .prologue
    .line 66
    iput-object p1, p0, Lcom/android/internal/telephony/LmsAssemblyTrackerCTC$1;->this$0:Lcom/android/internal/telephony/LmsAssemblyTrackerCTC;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 5
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 69
    iget-object v0, p0, Lcom/android/internal/telephony/LmsAssemblyTrackerCTC$1;->this$0:Lcom/android/internal/telephony/LmsAssemblyTrackerCTC;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 70
    return-void
.end method
