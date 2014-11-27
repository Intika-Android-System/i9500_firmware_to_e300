.class public Lcom/itsoninc/android/ItsOnPhoneClient;
.super Ljava/lang/Object;
.source "ItsOnPhoneClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itsoninc/android/ItsOnPhoneClient$2;,
        Lcom/itsoninc/android/ItsOnPhoneClient$AndroidFramework;
    }
.end annotation


# static fields
.field protected static final EVENT_POLL_CALLS_RESULT:I = 0x1

.field static final IOPC_LOGD:Z


# instance fields
.field LOG_TAG:Ljava/lang/String;

.field mApi:Lcom/itsoninc/android/ItsOnOemApi;

.field public mHandler:Landroid/os/Handler;

.field mRil:Lcom/android/internal/telephony/RIL;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/internal/telephony/RIL;)V
    .registers 7
    .parameter "context"
    .parameter "ril"

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const-string v0, "IOPC"

    iput-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->LOG_TAG:Ljava/lang/String;

    .line 29
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mApi:Lcom/itsoninc/android/ItsOnOemApi;

    .line 56
    invoke-static {}, Lcom/itsoninc/android/ItsOnOemApi;->getInstance()Lcom/itsoninc/android/ItsOnOemApi;

    move-result-object v0

    iput-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mApi:Lcom/itsoninc/android/ItsOnOemApi;

    .line 57
    iget-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mApi:Lcom/itsoninc/android/ItsOnOemApi;

    invoke-virtual {v0, p1}, Lcom/itsoninc/android/ItsOnOemApiBase;->initTelephony(Landroid/content/Context;)V

    .line 59
    iput-object p2, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mRil:Lcom/android/internal/telephony/RIL;

    .line 60
    new-instance v0, Lcom/itsoninc/android/ItsOnPhoneClient$1;

    invoke-direct {v0, p0}, Lcom/itsoninc/android/ItsOnPhoneClient$1;-><init>(Lcom/itsoninc/android/ItsOnPhoneClient;)V

    iput-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mHandler:Landroid/os/Handler;

    .line 63
    iget-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mApi:Lcom/itsoninc/android/ItsOnOemApi;

    new-instance v1, Lcom/itsoninc/android/ItsOnPhoneClient$AndroidFramework;

    iget-object v2, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mRil:Lcom/android/internal/telephony/RIL;

    iget-object v3, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mHandler:Landroid/os/Handler;

    invoke-direct {v1, p0, v2, v3}, Lcom/itsoninc/android/ItsOnPhoneClient$AndroidFramework;-><init>(Lcom/itsoninc/android/ItsOnPhoneClient;Lcom/android/internal/telephony/RIL;Landroid/os/Handler;)V

    invoke-virtual {v0, v1}, Lcom/itsoninc/android/ItsOnOemApiBase;->setFrameworkInterface(Lcom/itsoninc/android/ItsOnFrameworkInterface;)V

    .line 64
    return-void
.end method

.method private adaptCallList(Ljava/util/List;)Ljava/util/List;
    .registers 9
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/telephony/DriverCall;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/itsoninc/android/DeviceCall;",
            ">;"
        }
    .end annotation

    .prologue
    .line 108
    .local p1, callList:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/DriverCall;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 110
    .local v2, deviceCalls:Ljava/util/List;,"Ljava/util/List<Lcom/itsoninc/android/DeviceCall;>;"
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_9
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_42

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/DriverCall;

    .line 111
    .local v0, call:Lcom/android/internal/telephony/DriverCall;
    const/4 v4, 0x0

    .line 112
    .local v4, state:Lcom/itsoninc/android/DeviceCall$CallState;
    sget-object v5, Lcom/itsoninc/android/ItsOnPhoneClient$2;->$SwitchMap$com$android$internal$telephony$DriverCall$State:[I

    iget-object v6, v0, Lcom/android/internal/telephony/DriverCall;->state:Lcom/android/internal/telephony/DriverCall$State;

    invoke-virtual {v6}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_44

    .line 133
    :goto_23
    new-instance v1, Lcom/itsoninc/android/DeviceCall;

    iget-boolean v5, v0, Lcom/android/internal/telephony/DriverCall;->isVoice:Z

    iget-object v6, v0, Lcom/android/internal/telephony/DriverCall;->number:Ljava/lang/String;

    invoke-direct {v1, v5, v4, v6}, Lcom/itsoninc/android/DeviceCall;-><init>(ZLcom/itsoninc/android/DeviceCall$CallState;Ljava/lang/String;)V

    .line 134
    .local v1, d:Lcom/itsoninc/android/DeviceCall;
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 114
    .end local v1           #d:Lcom/itsoninc/android/DeviceCall;
    :pswitch_30
    sget-object v4, Lcom/itsoninc/android/DeviceCall$CallState;->ACTIVE:Lcom/itsoninc/android/DeviceCall$CallState;

    .line 115
    goto :goto_23

    .line 117
    :pswitch_33
    sget-object v4, Lcom/itsoninc/android/DeviceCall$CallState;->ALERTING:Lcom/itsoninc/android/DeviceCall$CallState;

    .line 118
    goto :goto_23

    .line 120
    :pswitch_36
    sget-object v4, Lcom/itsoninc/android/DeviceCall$CallState;->DIALING:Lcom/itsoninc/android/DeviceCall$CallState;

    .line 121
    goto :goto_23

    .line 123
    :pswitch_39
    sget-object v4, Lcom/itsoninc/android/DeviceCall$CallState;->HOLDING:Lcom/itsoninc/android/DeviceCall$CallState;

    .line 124
    goto :goto_23

    .line 126
    :pswitch_3c
    sget-object v4, Lcom/itsoninc/android/DeviceCall$CallState;->INCOMING:Lcom/itsoninc/android/DeviceCall$CallState;

    .line 127
    goto :goto_23

    .line 129
    :pswitch_3f
    sget-object v4, Lcom/itsoninc/android/DeviceCall$CallState;->WAITING:Lcom/itsoninc/android/DeviceCall$CallState;

    goto :goto_23

    .line 136
    .end local v0           #call:Lcom/android/internal/telephony/DriverCall;
    .end local v4           #state:Lcom/itsoninc/android/DeviceCall$CallState;
    :cond_42
    return-object v2

    .line 112
    nop

    :pswitch_data_44
    .packed-switch 0x1
        :pswitch_30
        :pswitch_33
        :pswitch_36
        :pswitch_39
        :pswitch_3c
        :pswitch_3f
    .end packed-switch
.end method


# virtual methods
.method public acceptCall()V
    .registers 2

    .prologue
    .line 152
    iget-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mApi:Lcom/itsoninc/android/ItsOnOemApi;

    invoke-virtual {v0}, Lcom/itsoninc/android/ItsOnOemApiBase;->acceptCall()V

    .line 153
    return-void
.end method

.method public authorizeIncomingSMS(Landroid/telephony/SmsMessage;)Z
    .registers 4
    .parameter "sms"

    .prologue
    .line 71
    iget-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mApi:Lcom/itsoninc/android/ItsOnOemApi;

    invoke-virtual {p1}, Landroid/telephony/SmsMessage;->getPdu()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itsoninc/android/ItsOnOemApiBase;->authorizeIncomingSms([B)Z

    move-result v0

    return v0
.end method

.method public authorizeIncomingVoice(Ljava/lang/String;)Z
    .registers 3
    .parameter "address"

    .prologue
    .line 94
    iget-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mApi:Lcom/itsoninc/android/ItsOnOemApi;

    invoke-virtual {v0, p1}, Lcom/itsoninc/android/ItsOnOemApiBase;->authorizeIncomingVoice(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public authorizeOutgoingSMS(Ljava/lang/String;I)Z
    .registers 4
    .parameter "address"
    .parameter "serial"

    .prologue
    .line 79
    iget-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mApi:Lcom/itsoninc/android/ItsOnOemApi;

    invoke-virtual {v0, p1, p2}, Lcom/itsoninc/android/ItsOnOemApiBase;->authorizeOutgoingSms(Ljava/lang/String;I)Z

    move-result v0

    return v0
.end method

.method public authorizeOutgoingSMS([BI)Z
    .registers 4
    .parameter "pdu"
    .parameter "serial"

    .prologue
    .line 75
    iget-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mApi:Lcom/itsoninc/android/ItsOnOemApi;

    invoke-virtual {v0, p1, p2}, Lcom/itsoninc/android/ItsOnOemApiBase;->authorizeOutgoingSms([BI)Z

    move-result v0

    return v0
.end method

.method public authorizeOutgoingVoice(Ljava/lang/String;)Z
    .registers 3
    .parameter "address"

    .prologue
    .line 98
    iget-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mApi:Lcom/itsoninc/android/ItsOnOemApi;

    invoke-virtual {v0, p1}, Lcom/itsoninc/android/ItsOnOemApiBase;->authorizeOutgoingVoice(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public callWaiting(Ljava/lang/String;)Z
    .registers 3
    .parameter "number"

    .prologue
    .line 155
    iget-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mApi:Lcom/itsoninc/android/ItsOnOemApi;

    invoke-virtual {v0, p1}, Lcom/itsoninc/android/ItsOnOemApiBase;->callWaiting(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public dial(Ljava/lang/String;)Z
    .registers 3
    .parameter "address"

    .prologue
    .line 145
    iget-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mApi:Lcom/itsoninc/android/ItsOnOemApi;

    invoke-virtual {v0, p1}, Lcom/itsoninc/android/ItsOnOemApiBase;->dial(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public flash(Ljava/lang/String;)Z
    .registers 3
    .parameter "featureCode"

    .prologue
    .line 149
    iget-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mApi:Lcom/itsoninc/android/ItsOnOemApi;

    invoke-virtual {v0, p1}, Lcom/itsoninc/android/ItsOnOemApiBase;->flash(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public incomingCallReject()V
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mApi:Lcom/itsoninc/android/ItsOnOemApi;

    invoke-virtual {v0}, Lcom/itsoninc/android/ItsOnOemApiBase;->rejectCall()V

    .line 92
    return-void
.end method

.method public nitzTimeReceived(Ljava/lang/String;J)V
    .registers 5
    .parameter "time"
    .parameter "nitzReceiveTime"

    .prologue
    .line 140
    iget-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mApi:Lcom/itsoninc/android/ItsOnOemApi;

    invoke-virtual {v0, p1, p2, p3}, Lcom/itsoninc/android/ItsOnOemApiBase;->nitzTimeReceived(Ljava/lang/String;J)V

    .line 141
    return-void
.end method

.method public onNewDataSession(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .parameter "iface"
    .parameter "apn"
    .parameter "apnType"

    .prologue
    .line 67
    iget-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mApi:Lcom/itsoninc/android/ItsOnOemApi;

    invoke-virtual {v0, p1, p2, p3}, Lcom/itsoninc/android/ItsOnOemApiBase;->onNewDataSession(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    return-void
.end method

.method public sendSMSDone(I)V
    .registers 3
    .parameter "serial"

    .prologue
    .line 83
    iget-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mApi:Lcom/itsoninc/android/ItsOnOemApi;

    invoke-virtual {v0, p1}, Lcom/itsoninc/android/ItsOnOemApiBase;->smsDone(I)V

    .line 84
    return-void
.end method

.method public sendSMSError(I)V
    .registers 3
    .parameter "serial"

    .prologue
    .line 87
    iget-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mApi:Lcom/itsoninc/android/ItsOnOemApi;

    invoke-virtual {v0, p1}, Lcom/itsoninc/android/ItsOnOemApiBase;->smsError(I)V

    .line 88
    return-void
.end method

.method public setEmergencyMode(Z)V
    .registers 3
    .parameter "inEmergencyMode"

    .prologue
    .line 165
    iget-object v0, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mApi:Lcom/itsoninc/android/ItsOnOemApi;

    invoke-virtual {v0, p1}, Lcom/itsoninc/android/ItsOnOemApiBase;->setEmergencyMode(Z)V

    .line 166
    return-void
.end method

.method public trackCalls(Ljava/util/List;)V
    .registers 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/telephony/DriverCall;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 103
    .local p1, callList:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/DriverCall;>;"
    invoke-direct {p0, p1}, Lcom/itsoninc/android/ItsOnPhoneClient;->adaptCallList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 104
    .local v0, deviceCalls:Ljava/util/List;,"Ljava/util/List<Lcom/itsoninc/android/DeviceCall;>;"
    iget-object v1, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mApi:Lcom/itsoninc/android/ItsOnOemApi;

    invoke-virtual {v1, v0}, Lcom/itsoninc/android/ItsOnOemApiBase;->processCallList(Ljava/util/List;)V

    .line 105
    return-void
.end method

.method public trackCdmaCalls(Ljava/util/List;)V
    .registers 4
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/telephony/DriverCall;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 160
    .local p1, callList:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/DriverCall;>;"
    invoke-direct {p0, p1}, Lcom/itsoninc/android/ItsOnPhoneClient;->adaptCallList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 161
    .local v0, deviceCalls:Ljava/util/List;,"Ljava/util/List<Lcom/itsoninc/android/DeviceCall;>;"
    iget-object v1, p0, Lcom/itsoninc/android/ItsOnPhoneClient;->mApi:Lcom/itsoninc/android/ItsOnOemApi;

    invoke-virtual {v1, v0}, Lcom/itsoninc/android/ItsOnOemApiBase;->processCDMACallList(Ljava/util/List;)V

    .line 162
    return-void
.end method
