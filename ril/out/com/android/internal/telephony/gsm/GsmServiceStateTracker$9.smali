.class Lcom/android/internal/telephony/gsm/GsmServiceStateTracker$9;
.super Ljava/lang/Object;
.source "GsmServiceStateTracker.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;)V
    .registers 2
    .parameter

    .prologue
    .line 4234
    iput-object p1, p0, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker$9;->this$0:Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .registers 9
    .parameter "dialog"
    .parameter "which"

    .prologue
    const/4 v5, 0x0

    .line 4236
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    .line 4238
    packed-switch p2, :pswitch_data_48

    .line 4252
    :goto_7
    invoke-static {v5}, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;->access$1102(Landroid/app/AlertDialog;)Landroid/app/AlertDialog;

    .line 4253
    return-void

    .line 4240
    :pswitch_b
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 4241
    .local v0, intent:Landroid/content/Intent;
    const-string v1, "com.android.phone"

    const-string v2, "com.android.phone.NetworkSetting"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 4242
    const/high16 v1, 0x1000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 4243
    const-string v1, "search-type"

    const-string v2, "manual"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 4244
    iget-object v1, p0, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker$9;->this$0:Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;

    iget-object v1, v1, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;->mPhone:Lcom/android/internal/telephony/gsm/GSMPhone;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_7

    .line 4248
    .end local v0           #intent:Landroid/content/Intent;
    :pswitch_31
    const-string v1, "ManualSelectionReceiver"

    const-string v2, "sendMessageDelayed(EVENT_NETWORK_STATE_CHANGED_BY_RESCAN)"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 4249
    iget-object v1, p0, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker$9;->this$0:Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;

    iget-object v2, p0, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker$9;->this$0:Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;

    const/16 v3, 0xfa0

    invoke-virtual {v2, v3, v5}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    const-wide/16 v3, 0x7530

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    goto :goto_7

    .line 4238
    :pswitch_data_48
    .packed-switch -0x2
        :pswitch_31
        :pswitch_b
    .end packed-switch
.end method