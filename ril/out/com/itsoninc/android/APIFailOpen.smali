.class public Lcom/itsoninc/android/APIFailOpen;
.super Ljava/lang/Object;
.source "APIFailOpen.java"

# interfaces
.implements Lcom/itsoninc/android/ItsOnOemInterface;


# instance fields
.field final DEBUG:Z

.field final LOGTAG:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/itsoninc/android/APIFailOpen;->DEBUG:Z

    .line 12
    const-class v0, Lcom/itsoninc/android/APIFailOpen;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/itsoninc/android/APIFailOpen;->LOGTAG:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public acceptCall()V
    .registers 1

    .prologue
    .line 122
    return-void
.end method

.method public accountMms(Ljava/lang/String;)V
    .registers 2
    .parameter "transactionId"

    .prologue
    .line 104
    return-void
.end method

.method public authorizeIncomingMms(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4
    .parameter "address"
    .parameter "transactionId"

    .prologue
    .line 99
    const/4 v0, 0x1

    return v0
.end method

.method public authorizeIncomingSms(Ljava/lang/String;Lcom/itsoninc/android/SmsType;Ljava/lang/String;)Z
    .registers 5
    .parameter "address"
    .parameter "type"
    .parameter "mimeType"

    .prologue
    .line 53
    const/4 v0, 0x1

    return v0
.end method

.method public authorizeIncomingSms([B)Z
    .registers 3
    .parameter "pdu"

    .prologue
    .line 60
    const/4 v0, 0x1

    return v0
.end method

.method public authorizeIncomingVoice(Ljava/lang/String;)Z
    .registers 3
    .parameter "address"

    .prologue
    .line 85
    const/4 v0, 0x1

    return v0
.end method

.method public authorizeOutgoingMms(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4
    .parameter "address"
    .parameter "transactionId"

    .prologue
    .line 90
    const/4 v0, 0x1

    return v0
.end method

.method public authorizeOutgoingMms(Ljava/util/List;Ljava/lang/String;)Z
    .registers 4
    .parameter
    .parameter "transactionId"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .line 95
    .local p1, addresses:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    const/4 v0, 0x1

    return v0
.end method

.method public authorizeOutgoingSms(Ljava/lang/String;I)Z
    .registers 4
    .parameter "address"
    .parameter "serial"

    .prologue
    .line 65
    const/4 v0, 0x1

    return v0
.end method

.method public authorizeOutgoingSms([BI)Z
    .registers 4
    .parameter "pdu"
    .parameter "serial"

    .prologue
    .line 72
    const/4 v0, 0x1

    return v0
.end method

.method public authorizeOutgoingVoice(Ljava/lang/String;)Z
    .registers 3
    .parameter "address"

    .prologue
    .line 28
    const/4 v0, 0x1

    return v0
.end method

.method public callWaiting(Ljava/lang/String;)Z
    .registers 3
    .parameter "number"

    .prologue
    .line 126
    const/4 v0, 0x1

    return v0
.end method

.method public cleanupMms(Ljava/lang/String;)V
    .registers 2
    .parameter "transactionId"

    .prologue
    .line 108
    return-void
.end method

.method public destroy()V
    .registers 1

    .prologue
    .line 139
    return-void
.end method

.method public dial(Ljava/lang/String;)Z
    .registers 3
    .parameter "address"

    .prologue
    .line 112
    const/4 v0, 0x1

    return v0
.end method

.method public flash(Ljava/lang/String;)Z
    .registers 3
    .parameter "featureCode"

    .prologue
    .line 117
    const/4 v0, 0x1

    return v0
.end method

.method public initFramework(Landroid/content/Context;)V
    .registers 2
    .parameter "context"

    .prologue
    .line 160
    return-void
.end method

.method public initTelephony(Landroid/content/Context;)V
    .registers 2
    .parameter "context"

    .prologue
    .line 164
    return-void
.end method

.method public isDataAllowed(JLjava/lang/String;)Z
    .registers 5
    .parameter "systemId"
    .parameter "operatorNumeric"

    .prologue
    .line 168
    const/4 v0, 0x1

    return v0
.end method

.method public nitzTimeReceived(Ljava/lang/String;J)V
    .registers 4
    .parameter "time"
    .parameter "nitzReceiveTime"

    .prologue
    .line 143
    return-void
.end method

.method public onForegroundActivitiesChanged(IIZ)V
    .registers 4
    .parameter "pid"
    .parameter "uid"
    .parameter "foregroundActivities"

    .prologue
    .line 148
    return-void
.end method

.method public onImportanceChanged(III)V
    .registers 4
    .parameter "pid"
    .parameter "uid"
    .parameter "importance"

    .prologue
    .line 152
    return-void
.end method

.method public onNewDataSession(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4
    .parameter "iface"
    .parameter "apn"
    .parameter "apnType"

    .prologue
    .line 177
    return-void
.end method

.method public onProcessDied(II)V
    .registers 3
    .parameter "pid"
    .parameter "uid"

    .prologue
    .line 156
    return-void
.end method

.method public processCDMACallList(Ljava/util/List;)V
    .registers 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/itsoninc/android/DeviceCall;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 132
    .local p1, callList:Ljava/util/List;,"Ljava/util/List<Lcom/itsoninc/android/DeviceCall;>;"
    return-void
.end method

.method public processCallList(Ljava/util/List;)V
    .registers 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/itsoninc/android/DeviceCall;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 43
    .local p1, callList:Ljava/util/List;,"Ljava/util/List<Lcom/itsoninc/android/DeviceCall;>;"
    return-void
.end method

.method public registerActivityMapping(Ljava/lang/String;I)V
    .registers 3
    .parameter "url"
    .parameter "uid"

    .prologue
    .line 24
    return-void
.end method

.method public registerDownloadMapping(Ljava/lang/String;)V
    .registers 2
    .parameter "url"

    .prologue
    .line 16
    return-void
.end method

.method public registerMediaMapping(Ljava/lang/String;)V
    .registers 2
    .parameter "url"

    .prologue
    .line 20
    return-void
.end method

.method public rejectCall()V
    .registers 1

    .prologue
    .line 48
    return-void
.end method

.method public setContext(Landroid/content/Context;)V
    .registers 2
    .parameter "context"

    .prologue
    .line 39
    return-void
.end method

.method public setDataConnectionHandler(Landroid/os/Handler;Landroid/os/Message;)V
    .registers 3
    .parameter "handler"
    .parameter "trySetupDataMessage"

    .prologue
    .line 173
    return-void
.end method

.method public setEmergencyMode(Z)V
    .registers 2
    .parameter "inEmergencyMode"

    .prologue
    .line 136
    return-void
.end method

.method public setFrameworkInterface(Lcom/itsoninc/android/ItsOnFrameworkInterface;)V
    .registers 2
    .parameter "fwIf"

    .prologue
    .line 34
    return-void
.end method

.method public smsDone(I)V
    .registers 2
    .parameter "serial"

    .prologue
    .line 77
    return-void
.end method

.method public smsError(I)V
    .registers 2
    .parameter "serial"

    .prologue
    .line 81
    return-void
.end method
