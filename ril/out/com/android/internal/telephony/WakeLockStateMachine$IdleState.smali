.class Lcom/android/internal/telephony/WakeLockStateMachine$IdleState;
.super Lcom/android/internal/util/State;
.source "WakeLockStateMachine.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/WakeLockStateMachine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "IdleState"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/telephony/WakeLockStateMachine;


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/WakeLockStateMachine;)V
    .registers 2
    .parameter

    .prologue
    .line 159
    iput-object p1, p0, Lcom/android/internal/telephony/WakeLockStateMachine$IdleState;->this$0:Lcom/android/internal/telephony/WakeLockStateMachine;

    invoke-direct {p0}, Lcom/android/internal/util/State;-><init>()V

    return-void
.end method


# virtual methods
.method public enter()V
    .registers 5

    .prologue
    .line 162
    iget-object v0, p0, Lcom/android/internal/telephony/WakeLockStateMachine$IdleState;->this$0:Lcom/android/internal/telephony/WakeLockStateMachine;

    const/4 v1, 0x3

    const-wide/16 v2, 0xbb8

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/internal/util/StateMachine;->sendMessageDelayed(IJ)V

    .line 163
    return-void
.end method

.method public exit()V
    .registers 3

    .prologue
    .line 167
    iget-object v0, p0, Lcom/android/internal/telephony/WakeLockStateMachine$IdleState;->this$0:Lcom/android/internal/telephony/WakeLockStateMachine;

    #getter for: Lcom/android/internal/telephony/WakeLockStateMachine;->mWakeLock:Landroid/os/PowerManager$WakeLock;
    invoke-static {v0}, Lcom/android/internal/telephony/WakeLockStateMachine;->access$000(Lcom/android/internal/telephony/WakeLockStateMachine;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    .line 168
    iget-object v0, p0, Lcom/android/internal/telephony/WakeLockStateMachine$IdleState;->this$0:Lcom/android/internal/telephony/WakeLockStateMachine;

    const-string v1, "acquired wakelock, leaving Idle state"

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/WakeLockStateMachine;->log(Ljava/lang/String;)V

    .line 169
    return-void
.end method

.method public processMessage(Landroid/os/Message;)Z
    .registers 5
    .parameter "msg"

    .prologue
    const/4 v0, 0x1

    .line 173
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_42

    .line 194
    :pswitch_6
    const/4 v0, 0x0

    :cond_7
    :goto_7
    return v0

    .line 176
    :pswitch_8
    iget-object v1, p0, Lcom/android/internal/telephony/WakeLockStateMachine$IdleState;->this$0:Lcom/android/internal/telephony/WakeLockStateMachine;

    invoke-virtual {v1, p1}, Lcom/android/internal/telephony/WakeLockStateMachine;->handleSmsMessage(Landroid/os/Message;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 177
    iget-object v1, p0, Lcom/android/internal/telephony/WakeLockStateMachine$IdleState;->this$0:Lcom/android/internal/telephony/WakeLockStateMachine;

    iget-object v2, p0, Lcom/android/internal/telephony/WakeLockStateMachine$IdleState;->this$0:Lcom/android/internal/telephony/WakeLockStateMachine;

    #getter for: Lcom/android/internal/telephony/WakeLockStateMachine;->mWaitingState:Lcom/android/internal/telephony/WakeLockStateMachine$WaitingState;
    invoke-static {v2}, Lcom/android/internal/telephony/WakeLockStateMachine;->access$100(Lcom/android/internal/telephony/WakeLockStateMachine;)Lcom/android/internal/telephony/WakeLockStateMachine$WaitingState;

    move-result-object v2

    #calls: Lcom/android/internal/util/StateMachine;->transitionTo(Lcom/android/internal/util/IState;)V
    invoke-static {v1, v2}, Lcom/android/internal/telephony/WakeLockStateMachine;->access$200(Lcom/android/internal/telephony/WakeLockStateMachine;Lcom/android/internal/util/IState;)V

    goto :goto_7

    .line 182
    :pswitch_1c
    iget-object v1, p0, Lcom/android/internal/telephony/WakeLockStateMachine$IdleState;->this$0:Lcom/android/internal/telephony/WakeLockStateMachine;

    #getter for: Lcom/android/internal/telephony/WakeLockStateMachine;->mWakeLock:Landroid/os/PowerManager$WakeLock;
    invoke-static {v1}, Lcom/android/internal/telephony/WakeLockStateMachine;->access$000(Lcom/android/internal/telephony/WakeLockStateMachine;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->release()V

    .line 184
    iget-object v1, p0, Lcom/android/internal/telephony/WakeLockStateMachine$IdleState;->this$0:Lcom/android/internal/telephony/WakeLockStateMachine;

    #getter for: Lcom/android/internal/telephony/WakeLockStateMachine;->mWakeLock:Landroid/os/PowerManager$WakeLock;
    invoke-static {v1}, Lcom/android/internal/telephony/WakeLockStateMachine;->access$000(Lcom/android/internal/telephony/WakeLockStateMachine;)Landroid/os/PowerManager$WakeLock;

    move-result-object v1

    invoke-virtual {v1}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v1

    if-eqz v1, :cond_39

    .line 186
    iget-object v1, p0, Lcom/android/internal/telephony/WakeLockStateMachine$IdleState;->this$0:Lcom/android/internal/telephony/WakeLockStateMachine;

    const-string v2, "mWakeLock is still held after release"

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/WakeLockStateMachine;->log(Ljava/lang/String;)V

    goto :goto_7

    .line 188
    :cond_39
    iget-object v1, p0, Lcom/android/internal/telephony/WakeLockStateMachine$IdleState;->this$0:Lcom/android/internal/telephony/WakeLockStateMachine;

    const-string v2, "mWakeLock released"

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/WakeLockStateMachine;->log(Ljava/lang/String;)V

    goto :goto_7

    .line 173
    nop

    :pswitch_data_42
    .packed-switch 0x1
        :pswitch_8
        :pswitch_6
        :pswitch_1c
    .end packed-switch
.end method