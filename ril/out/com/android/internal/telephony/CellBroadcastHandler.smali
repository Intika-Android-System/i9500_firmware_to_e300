.class public Lcom/android/internal/telephony/CellBroadcastHandler;
.super Lcom/android/internal/telephony/WakeLockStateMachine;
.source "CellBroadcastHandler.java"


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .registers 4
    .parameter "context"

    .prologue
    .line 38
    const-string v0, "CellBroadcastHandler"

    const/4 v1, 0x0

    invoke-direct {p0, v0, p1, v1}, Lcom/android/internal/telephony/CellBroadcastHandler;-><init>(Ljava/lang/String;Landroid/content/Context;Lcom/android/internal/telephony/PhoneBase;)V

    .line 39
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Landroid/content/Context;Lcom/android/internal/telephony/PhoneBase;)V
    .registers 4
    .parameter "debugTag"
    .parameter "context"
    .parameter "phone"

    .prologue
    .line 42
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/telephony/WakeLockStateMachine;-><init>(Ljava/lang/String;Landroid/content/Context;Lcom/android/internal/telephony/PhoneBase;)V

    .line 43
    return-void
.end method

.method public static makeCellBroadcastHandler(Landroid/content/Context;)Lcom/android/internal/telephony/CellBroadcastHandler;
    .registers 2
    .parameter "context"

    .prologue
    .line 51
    new-instance v0, Lcom/android/internal/telephony/CellBroadcastHandler;

    invoke-direct {v0, p0}, Lcom/android/internal/telephony/CellBroadcastHandler;-><init>(Landroid/content/Context;)V

    .line 52
    .local v0, handler:Lcom/android/internal/telephony/CellBroadcastHandler;
    invoke-virtual {v0}, Lcom/android/internal/util/StateMachine;->start()V

    .line 53
    return-object v0
.end method


# virtual methods
.method protected handleBroadcastSms(Landroid/telephony/SmsCbMessage;)V
    .registers 11
    .parameter "message"

    .prologue
    const/4 v7, 0x0

    .line 94
    invoke-virtual {p1}, Landroid/telephony/SmsCbMessage;->isEmergencyMessage()Z

    move-result v0

    if-eqz v0, :cond_2a

    .line 95
    const-string v0, "Dispatching emergency SMS CB"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/WakeLockStateMachine;->log(Ljava/lang/String;)V

    .line 96
    new-instance v1, Landroid/content/Intent;

    const-string v0, "android.provider.Telephony.SMS_EMERGENCY_CB_RECEIVED"

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 97
    .local v1, intent:Landroid/content/Intent;
    const-string v2, "android.permission.RECEIVE_EMERGENCY_BROADCAST"

    .line 98
    .local v2, receiverPermission:Ljava/lang/String;
    const/16 v3, 0x11

    .line 105
    .local v3, appOp:I
    :goto_17
    const-string v0, "message"

    invoke-virtual {v1, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 106
    iget-object v0, p0, Lcom/android/internal/telephony/WakeLockStateMachine;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/android/internal/telephony/WakeLockStateMachine;->mReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0}, Lcom/android/internal/util/StateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v5

    const/4 v6, -0x1

    move-object v8, v7

    invoke-virtual/range {v0 .. v8}, Landroid/content/Context;->sendOrderedBroadcast(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;Landroid/os/Handler;ILjava/lang/String;Landroid/os/Bundle;)V

    .line 108
    return-void

    .line 100
    .end local v1           #intent:Landroid/content/Intent;
    .end local v2           #receiverPermission:Ljava/lang/String;
    .end local v3           #appOp:I
    :cond_2a
    const-string v0, "Dispatching SMS CB"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/WakeLockStateMachine;->log(Ljava/lang/String;)V

    .line 101
    new-instance v1, Landroid/content/Intent;

    const-string v0, "android.provider.Telephony.SMS_CB_RECEIVED"

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 102
    .restart local v1       #intent:Landroid/content/Intent;
    const-string v2, "android.permission.RECEIVE_SMS"

    .line 103
    .restart local v2       #receiverPermission:Ljava/lang/String;
    const/16 v3, 0x10

    .restart local v3       #appOp:I
    goto :goto_17
.end method

.method protected handleLocationInfo(Landroid/os/AsyncResult;)V
    .registers 3
    .parameter "ar"

    .prologue
    .line 77
    const-string v0, "handleLocationInfo in CellBroadcastHandler. It will be used in GsmCellBroadcastHandler."

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/WakeLockStateMachine;->log(Ljava/lang/String;)V

    .line 78
    return-void
.end method

.method protected handleOperatorInfo(Landroid/os/AsyncResult;)V
    .registers 3
    .parameter "ar"

    .prologue
    .line 82
    const-string v0, "handleOperatorInfo in CellBroadcastHandler. It will be used in GsmCellBroadcastHandler."

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/WakeLockStateMachine;->log(Ljava/lang/String;)V

    .line 83
    return-void
.end method

.method protected handleSmsMessage(Landroid/os/Message;)Z
    .registers 4
    .parameter "message"

    .prologue
    .line 65
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v0, v0, Landroid/telephony/SmsCbMessage;

    if-eqz v0, :cond_f

    .line 66
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/telephony/SmsCbMessage;

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/CellBroadcastHandler;->handleBroadcastSms(Landroid/telephony/SmsCbMessage;)V

    .line 67
    const/4 v0, 0x1

    .line 70
    :goto_e
    return v0

    .line 69
    :cond_f
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "handleMessage got object of type: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/WakeLockStateMachine;->loge(Ljava/lang/String;)V

    .line 70
    const/4 v0, 0x0

    goto :goto_e
.end method
