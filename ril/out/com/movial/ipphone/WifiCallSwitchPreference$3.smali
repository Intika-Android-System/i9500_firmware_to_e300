.class Lcom/movial/ipphone/WifiCallSwitchPreference$3;
.super Landroid/content/BroadcastReceiver;
.source "WifiCallSwitchPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/movial/ipphone/WifiCallSwitchPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/movial/ipphone/WifiCallSwitchPreference;


# direct methods
.method constructor <init>(Lcom/movial/ipphone/WifiCallSwitchPreference;)V
    .registers 2
    .parameter

    .prologue
    .line 106
    iput-object p1, p0, Lcom/movial/ipphone/WifiCallSwitchPreference$3;->this$0:Lcom/movial/ipphone/WifiCallSwitchPreference;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 7
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 108
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 109
    .local v0, action:Ljava/lang/String;
    const-string v1, "WifiCallSwitchPreference"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onReceive: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    const-string v1, "com.movial.ACTION_ACTIVATE_IMS"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_30

    .line 112
    iget-object v1, p0, Lcom/movial/ipphone/WifiCallSwitchPreference$3;->this$0:Lcom/movial/ipphone/WifiCallSwitchPreference;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/preference/TwoStatePreference;->setChecked(Z)V

    .line 113
    iget-object v1, p0, Lcom/movial/ipphone/WifiCallSwitchPreference$3;->this$0:Lcom/movial/ipphone/WifiCallSwitchPreference;

    invoke-virtual {v1}, Lcom/movial/ipphone/WifiCallSwitchPreference;->onSwitchClicked()V

    .line 119
    :cond_2f
    :goto_2f
    return-void

    .line 114
    :cond_30
    const-string v1, "com.movial.ACTION_DEACTIVATE_IMS"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_44

    .line 115
    iget-object v1, p0, Lcom/movial/ipphone/WifiCallSwitchPreference$3;->this$0:Lcom/movial/ipphone/WifiCallSwitchPreference;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/preference/TwoStatePreference;->setChecked(Z)V

    .line 116
    iget-object v1, p0, Lcom/movial/ipphone/WifiCallSwitchPreference$3;->this$0:Lcom/movial/ipphone/WifiCallSwitchPreference;

    invoke-virtual {v1}, Lcom/movial/ipphone/WifiCallSwitchPreference;->onSwitchClicked()V

    goto :goto_2f

    .line 117
    :cond_44
    const-string v1, "com.movial.IMS_REGISTRATION"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2f

    goto :goto_2f
.end method
