.class public Lcom/movial/ipphone/IPInboundSmsHandler;
.super Lcom/android/internal/telephony/gsm/GsmInboundSmsHandler;
.source "IPInboundSmsHandler.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "IPInboundSmsHandler"


# instance fields
.field private mIPService:Lcom/movial/ipphone/IIPService;


# direct methods
.method protected constructor <init>(Landroid/content/Context;Lcom/android/internal/telephony/SmsStorageMonitor;Lcom/movial/ipphone/IPPhone;)V
    .registers 5
    .parameter "context"
    .parameter "storageMonitor"
    .parameter "ipPhone"

    .prologue
    .line 34
    invoke-virtual {p3}, Lcom/movial/ipphone/IPPhone;->getGsmPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/gsm/GSMPhone;

    invoke-direct {p0, p1, p2, v0}, Lcom/android/internal/telephony/gsm/GsmInboundSmsHandler;-><init>(Landroid/content/Context;Lcom/android/internal/telephony/SmsStorageMonitor;Lcom/android/internal/telephony/PhoneBase;)V

    .line 35
    return-void
.end method

.method public static makeInboundSmsHandler(Landroid/content/Context;Lcom/android/internal/telephony/SmsStorageMonitor;Lcom/movial/ipphone/IPPhone;)Lcom/movial/ipphone/IPInboundSmsHandler;
    .registers 4
    .parameter "context"
    .parameter "storageMonitor"
    .parameter "ipPhone"

    .prologue
    .line 28
    new-instance v0, Lcom/movial/ipphone/IPInboundSmsHandler;

    invoke-direct {v0, p0, p1, p2}, Lcom/movial/ipphone/IPInboundSmsHandler;-><init>(Landroid/content/Context;Lcom/android/internal/telephony/SmsStorageMonitor;Lcom/movial/ipphone/IPPhone;)V

    .line 29
    .local v0, handler:Lcom/movial/ipphone/IPInboundSmsHandler;
    invoke-virtual {v0}, Lcom/android/internal/util/StateMachine;->start()V

    .line 30
    return-object v0
.end method


# virtual methods
.method protected acknowledgeLastIncomingSms(ZILandroid/os/Message;)V
    .registers 8
    .parameter "success"
    .parameter "result"
    .parameter "response"

    .prologue
    .line 43
    const-string v1, "IPInboundSmsHandler"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sending ack success:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " result:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    iget-object v1, p0, Lcom/movial/ipphone/IPInboundSmsHandler;->mIPService:Lcom/movial/ipphone/IIPService;

    if-eqz v1, :cond_4a

    .line 46
    :try_start_26
    iget-object v1, p0, Lcom/movial/ipphone/IPInboundSmsHandler;->mIPService:Lcom/movial/ipphone/IIPService;

    invoke-static {p2}, Lcom/movial/ipphone/IPInboundSmsHandler;->resultToCause(I)I

    move-result v2

    invoke-interface {v1, p1, v2}, Lcom/movial/ipphone/IIPService;->acknowledgeLastIncomingIpSms(ZI)V
    :try_end_2f
    .catch Landroid/os/RemoteException; {:try_start_26 .. :try_end_2f} :catch_30

    .line 54
    :goto_2f
    return-void

    .line 47
    :catch_30
    move-exception v0

    .line 48
    .local v0, e:Landroid/os/RemoteException;
    const-string v1, "IPInboundSmsHandler"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "acknowledgeLastIncomingSms failed: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2f

    .line 52
    .end local v0           #e:Landroid/os/RemoteException;
    :cond_4a
    invoke-super {p0, p1, p2, p3}, Lcom/android/internal/telephony/gsm/GsmInboundSmsHandler;->acknowledgeLastIncomingSms(ZILandroid/os/Message;)V

    goto :goto_2f
.end method

.method setIPService(Lcom/movial/ipphone/IIPService;)V
    .registers 2
    .parameter "ipService"

    .prologue
    .line 38
    iput-object p1, p0, Lcom/movial/ipphone/IPInboundSmsHandler;->mIPService:Lcom/movial/ipphone/IIPService;

    .line 39
    return-void
.end method
