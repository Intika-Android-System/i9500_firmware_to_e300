.class Lcom/android/internal/telephony/ItsOnRIL$ItsOnRilHandler;
.super Landroid/os/Handler;
.source "ItsOnRIL.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/ItsOnRIL;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ItsOnRilHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/telephony/ItsOnRIL;


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/ItsOnRIL;)V
    .registers 2
    .parameter

    .prologue
    .line 114
    iput-object p1, p0, Lcom/android/internal/telephony/ItsOnRIL$ItsOnRilHandler;->this$0:Lcom/android/internal/telephony/ItsOnRIL;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 8
    .parameter "msg"

    .prologue
    .line 117
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 118
    .local v0, ar:Landroid/os/AsyncResult;
    iget v4, p1, Landroid/os/Message;->what:I

    packed-switch v4, :pswitch_data_44

    .line 135
    :cond_9
    return-void

    .line 120
    :pswitch_a
    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, Ljava/util/List;

    .line 121
    .local v3, polledCalls:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/DriverCall;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_12
    :goto_12
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_9

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/DriverCall;

    .line 122
    .local v1, c:Lcom/android/internal/telephony/DriverCall;
    iget-boolean v4, v1, Lcom/android/internal/telephony/DriverCall;->isVoice:Z

    if-eqz v4, :cond_12

    iget-object v4, v1, Lcom/android/internal/telephony/DriverCall;->state:Lcom/android/internal/telephony/DriverCall$State;

    sget-object v5, Lcom/android/internal/telephony/DriverCall$State;->INCOMING:Lcom/android/internal/telephony/DriverCall$State;

    if-eq v4, v5, :cond_2e

    iget-object v4, v1, Lcom/android/internal/telephony/DriverCall;->state:Lcom/android/internal/telephony/DriverCall$State;

    sget-object v5, Lcom/android/internal/telephony/DriverCall$State;->WAITING:Lcom/android/internal/telephony/DriverCall$State;

    if-ne v4, v5, :cond_12

    .line 125
    :cond_2e
    iget-object v4, p0, Lcom/android/internal/telephony/ItsOnRIL$ItsOnRilHandler;->this$0:Lcom/android/internal/telephony/ItsOnRIL;

    iget-object v4, v4, Lcom/android/internal/telephony/ItsOnRIL;->mIOPhoneClient:Lcom/itsoninc/android/ItsOnPhoneClient;

    iget-object v5, v1, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    invoke-virtual {v4, v5}, Lcom/itsoninc/android/ItsOnPhoneClient;->authorizeIncomingVoice(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_12

    .line 127
    iget-object v4, p0, Lcom/android/internal/telephony/ItsOnRIL$ItsOnRilHandler;->this$0:Lcom/android/internal/telephony/ItsOnRIL;

    invoke-virtual {p0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/android/internal/telephony/RIL;->hangupWaitingOrBackground(Landroid/os/Message;)V

    goto :goto_12

    .line 118
    :pswitch_data_44
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method
