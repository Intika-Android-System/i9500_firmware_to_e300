.class Lcom/movial/ipphone/WifiCallSwitchPreference$5;
.super Ljava/lang/Thread;
.source "WifiCallSwitchPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/movial/ipphone/WifiCallSwitchPreference;->registerToIPRegistry(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/movial/ipphone/WifiCallSwitchPreference;

.field final synthetic val$register:Z


# direct methods
.method constructor <init>(Lcom/movial/ipphone/WifiCallSwitchPreference;Z)V
    .registers 3
    .parameter
    .parameter

    .prologue
    .line 208
    iput-object p1, p0, Lcom/movial/ipphone/WifiCallSwitchPreference$5;->this$0:Lcom/movial/ipphone/WifiCallSwitchPreference;

    iput-boolean p2, p0, Lcom/movial/ipphone/WifiCallSwitchPreference$5;->val$register:Z

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    .line 211
    :try_start_0
    iget-boolean v1, p0, Lcom/movial/ipphone/WifiCallSwitchPreference$5;->val$register:Z

    if-eqz v1, :cond_16

    .line 212
    iget-object v1, p0, Lcom/movial/ipphone/WifiCallSwitchPreference$5;->this$0:Lcom/movial/ipphone/WifiCallSwitchPreference;

    #getter for: Lcom/movial/ipphone/WifiCallSwitchPreference;->mIPManager:Lcom/movial/ipphone/IPManager;
    invoke-static {v1}, Lcom/movial/ipphone/WifiCallSwitchPreference;->access$300(Lcom/movial/ipphone/WifiCallSwitchPreference;)Lcom/movial/ipphone/IPManager;

    move-result-object v1

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/movial/ipphone/WifiCallSwitchPreference$5;->this$0:Lcom/movial/ipphone/WifiCallSwitchPreference;

    #getter for: Lcom/movial/ipphone/WifiCallSwitchPreference;->mIPStateListener:Lcom/movial/ipphone/IPStateListener;
    invoke-static {v3}, Lcom/movial/ipphone/WifiCallSwitchPreference;->access$200(Lcom/movial/ipphone/WifiCallSwitchPreference;)Lcom/movial/ipphone/IPStateListener;

    move-result-object v3

    const/4 v4, 0x2

    invoke-virtual {v1, v2, v3, v4}, Lcom/movial/ipphone/IPManager;->listen(ZLcom/movial/ipphone/IPStateListener;I)V

    .line 218
    :goto_15
    return-void

    .line 214
    :cond_16
    iget-object v1, p0, Lcom/movial/ipphone/WifiCallSwitchPreference$5;->this$0:Lcom/movial/ipphone/WifiCallSwitchPreference;

    #getter for: Lcom/movial/ipphone/WifiCallSwitchPreference;->mIPManager:Lcom/movial/ipphone/IPManager;
    invoke-static {v1}, Lcom/movial/ipphone/WifiCallSwitchPreference;->access$300(Lcom/movial/ipphone/WifiCallSwitchPreference;)Lcom/movial/ipphone/IPManager;

    move-result-object v1

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/movial/ipphone/WifiCallSwitchPreference$5;->this$0:Lcom/movial/ipphone/WifiCallSwitchPreference;

    #getter for: Lcom/movial/ipphone/WifiCallSwitchPreference;->mIPStateListener:Lcom/movial/ipphone/IPStateListener;
    invoke-static {v3}, Lcom/movial/ipphone/WifiCallSwitchPreference;->access$200(Lcom/movial/ipphone/WifiCallSwitchPreference;)Lcom/movial/ipphone/IPStateListener;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v3, v4}, Lcom/movial/ipphone/IPManager;->listen(ZLcom/movial/ipphone/IPStateListener;I)V
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_27} :catch_28

    goto :goto_15

    .line 215
    :catch_28
    move-exception v0

    .line 216
    .local v0, e:Ljava/lang/Exception;
    const-string v1, "WifiCallSwitchPreference"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "register IPStateListener failed. "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_15
.end method
