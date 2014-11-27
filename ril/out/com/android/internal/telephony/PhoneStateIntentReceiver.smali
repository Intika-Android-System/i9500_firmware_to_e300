.class public final Lcom/android/internal/telephony/PhoneStateIntentReceiver;
.super Landroid/content/BroadcastReceiver;
.source "PhoneStateIntentReceiver.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final DBG:Z = false

.field private static final LOG_TAG:Ljava/lang/String; = "PhoneStatIntentReceiver"

.field private static final NOTIF_PHONE:I = 0x1

.field private static final NOTIF_SERVICE:I = 0x2

.field private static final NOTIF_SIGNAL:I = 0x4


# instance fields
.field private mAsuEventWhat:I

.field private mContext:Landroid/content/Context;

.field private mFilter:Landroid/content/IntentFilter;

.field mPhoneState:Lcom/android/internal/telephony/PhoneConstants$State;

.field private mPhoneStateEventWhat:I

.field mServiceState:Landroid/telephony/ServiceState;

.field private mServiceStateEventWhat:I

.field mSignalStrength:Landroid/telephony/SignalStrength;

.field private mTarget:Landroid/os/Handler;

.field private mWants:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 60
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 47
    sget-object v0, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    iput-object v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mPhoneState:Lcom/android/internal/telephony/PhoneConstants$State;

    .line 48
    new-instance v0, Landroid/telephony/ServiceState;

    invoke-direct {v0}, Landroid/telephony/ServiceState;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mServiceState:Landroid/telephony/ServiceState;

    .line 49
    new-instance v0, Landroid/telephony/SignalStrength;

    invoke-direct {v0}, Landroid/telephony/SignalStrength;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mSignalStrength:Landroid/telephony/SignalStrength;

    .line 61
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mFilter:Landroid/content/IntentFilter;

    .line 62
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;)V
    .registers 3
    .parameter "context"
    .parameter "target"

    .prologue
    .line 65
    invoke-direct {p0}, Lcom/android/internal/telephony/PhoneStateIntentReceiver;-><init>()V

    .line 66
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->setContext(Landroid/content/Context;)V

    .line 67
    invoke-virtual {p0, p2}, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->setTarget(Landroid/os/Handler;)V

    .line 68
    return-void
.end method


# virtual methods
.method public getNotifyPhoneCallState()Z
    .registers 2

    .prologue
    .line 130
    iget v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mWants:I

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public getNotifyServiceState()Z
    .registers 2

    .prologue
    .line 140
    iget v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mWants:I

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public getNotifySignalStrength()Z
    .registers 2

    .prologue
    .line 150
    iget v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mWants:I

    and-int/lit8 v0, v0, 0x4

    if-eqz v0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public getPhoneState()Lcom/android/internal/telephony/PhoneConstants$State;
    .registers 3

    .prologue
    .line 79
    iget v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mWants:I

    and-int/lit8 v0, v0, 0x1

    if-nez v0, :cond_e

    .line 80
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "client must call notifyPhoneCallState(int)"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 83
    :cond_e
    iget-object v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mPhoneState:Lcom/android/internal/telephony/PhoneConstants$State;

    return-object v0
.end method

.method public getServiceState()Landroid/telephony/ServiceState;
    .registers 3

    .prologue
    .line 87
    iget v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mWants:I

    and-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_e

    .line 88
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "client must call notifyServiceState(int)"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 91
    :cond_e
    iget-object v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mServiceState:Landroid/telephony/ServiceState;

    return-object v0
.end method

.method public getSignalStrengthDbm()I
    .registers 3

    .prologue
    .line 116
    iget v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mWants:I

    and-int/lit8 v0, v0, 0x4

    if-nez v0, :cond_e

    .line 117
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "client must call notifySignalStrength(int)"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 120
    :cond_e
    iget-object v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mSignalStrength:Landroid/telephony/SignalStrength;

    invoke-virtual {v0}, Landroid/telephony/SignalStrength;->getDbm()I

    move-result v0

    return v0
.end method

.method public getSignalStrengthLevelAsu()I
    .registers 3

    .prologue
    .line 101
    iget v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mWants:I

    and-int/lit8 v0, v0, 0x4

    if-nez v0, :cond_e

    .line 102
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "client must call notifySignalStrength(int)"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 105
    :cond_e
    iget-object v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mSignalStrength:Landroid/telephony/SignalStrength;

    invoke-virtual {v0}, Landroid/telephony/SignalStrength;->getAsuLevel()I

    move-result v0

    return v0
.end method

.method public notifyPhoneCallState(I)V
    .registers 4
    .parameter "eventWhat"

    .prologue
    .line 124
    iget v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mWants:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mWants:I

    .line 125
    iput p1, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mPhoneStateEventWhat:I

    .line 126
    iget-object v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.PHONE_STATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 127
    return-void
.end method

.method public notifyServiceState(I)V
    .registers 4
    .parameter "eventWhat"

    .prologue
    .line 134
    iget v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mWants:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mWants:I

    .line 135
    iput p1, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mServiceStateEventWhat:I

    .line 136
    iget-object v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.SERVICE_STATE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 137
    return-void
.end method

.method public notifySignalStrength(I)V
    .registers 4
    .parameter "eventWhat"

    .prologue
    .line 144
    iget v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mWants:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mWants:I

    .line 145
    iput p1, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mAsuEventWhat:I

    .line 146
    iget-object v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mFilter:Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.SIG_STR"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 147
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 10
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 163
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 166
    .local v0, action:Ljava/lang/String;
    :try_start_4
    const-string v4, "android.intent.action.SIG_STR"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2e

    .line 167
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v4

    invoke-static {v4}, Landroid/telephony/SignalStrength;->newFromBundle(Landroid/os/Bundle;)Landroid/telephony/SignalStrength;

    move-result-object v4

    iput-object v4, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mSignalStrength:Landroid/telephony/SignalStrength;

    .line 169
    iget-object v4, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mTarget:Landroid/os/Handler;

    if-eqz v4, :cond_2d

    invoke-virtual {p0}, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->getNotifySignalStrength()Z

    move-result v4

    if-eqz v4, :cond_2d

    .line 170
    iget-object v4, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mTarget:Landroid/os/Handler;

    iget v5, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mAsuEventWhat:I

    invoke-static {v4, v5}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v2

    .line 171
    .local v2, message:Landroid/os/Message;
    iget-object v4, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mTarget:Landroid/os/Handler;

    invoke-virtual {v4, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 198
    .end local v2           #message:Landroid/os/Message;
    :cond_2d
    :goto_2d
    return-void

    .line 173
    :cond_2e
    const-string v4, "android.intent.action.PHONE_STATE"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7b

    .line 176
    const-string v4, "state"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 177
    .local v3, phoneState:Ljava/lang/String;
    const-class v4, Lcom/android/internal/telephony/PhoneConstants$State;

    invoke-static {v4, v3}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v4

    check-cast v4, Lcom/android/internal/telephony/PhoneConstants$State;

    iput-object v4, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mPhoneState:Lcom/android/internal/telephony/PhoneConstants$State;

    .line 180
    iget-object v4, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mTarget:Landroid/os/Handler;

    if-eqz v4, :cond_2d

    invoke-virtual {p0}, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->getNotifyPhoneCallState()Z

    move-result v4

    if-eqz v4, :cond_2d

    .line 181
    iget-object v4, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mTarget:Landroid/os/Handler;

    iget v5, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mPhoneStateEventWhat:I

    invoke-static {v4, v5}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v2

    .line 183
    .restart local v2       #message:Landroid/os/Message;
    iget-object v4, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mTarget:Landroid/os/Handler;

    invoke-virtual {v4, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_5d
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_5d} :catch_5e

    goto :goto_2d

    .line 194
    .end local v2           #message:Landroid/os/Message;
    .end local v3           #phoneState:Ljava/lang/String;
    :catch_5e
    move-exception v1

    .line 195
    .local v1, ex:Ljava/lang/Exception;
    const-string v4, "PhoneStatIntentReceiver"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[PhoneStateIntentRecv] caught "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 196
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_2d

    .line 185
    .end local v1           #ex:Ljava/lang/Exception;
    :cond_7b
    :try_start_7b
    const-string v4, "android.intent.action.SERVICE_STATE"

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2d

    .line 186
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v4

    invoke-static {v4}, Landroid/telephony/ServiceState;->newFromBundle(Landroid/os/Bundle;)Landroid/telephony/ServiceState;

    move-result-object v4

    iput-object v4, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mServiceState:Landroid/telephony/ServiceState;

    .line 188
    iget-object v4, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mTarget:Landroid/os/Handler;

    if-eqz v4, :cond_2d

    invoke-virtual {p0}, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->getNotifyServiceState()Z

    move-result v4

    if-eqz v4, :cond_2d

    .line 189
    iget-object v4, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mTarget:Landroid/os/Handler;

    iget v5, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mServiceStateEventWhat:I

    invoke-static {v4, v5}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v2

    .line 191
    .restart local v2       #message:Landroid/os/Message;
    iget-object v4, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mTarget:Landroid/os/Handler;

    invoke-virtual {v4, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_a4
    .catch Ljava/lang/Exception; {:try_start_7b .. :try_end_a4} :catch_5e

    goto :goto_2d
.end method

.method public registerIntent()V
    .registers 3

    .prologue
    .line 154
    iget-object v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mFilter:Landroid/content/IntentFilter;

    invoke-virtual {v0, p0, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 155
    return-void
.end method

.method public setContext(Landroid/content/Context;)V
    .registers 2
    .parameter "c"

    .prologue
    .line 71
    iput-object p1, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mContext:Landroid/content/Context;

    .line 72
    return-void
.end method

.method public setTarget(Landroid/os/Handler;)V
    .registers 2
    .parameter "h"

    .prologue
    .line 75
    iput-object p1, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mTarget:Landroid/os/Handler;

    .line 76
    return-void
.end method

.method public unregisterIntent()V
    .registers 2

    .prologue
    .line 158
    iget-object v0, p0, Lcom/android/internal/telephony/PhoneStateIntentReceiver;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 159
    return-void
.end method
