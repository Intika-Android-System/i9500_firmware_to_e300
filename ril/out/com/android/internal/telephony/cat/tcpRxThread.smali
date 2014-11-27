.class Lcom/android/internal/telephony/cat/tcpRxThread;
.super Ljava/lang/Object;
.source "CatBIPConnection.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field conn:Lcom/android/internal/telephony/cat/CatBIPClientConnection;

.field volatile stopRequestTCP:Z

.field volatile terminatedByException:Z


# direct methods
.method public constructor <init>(Lcom/android/internal/telephony/cat/CatBIPClientConnection;)V
    .registers 3
    .parameter "c"

    .prologue
    const/4 v0, 0x0

    .line 441
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 368
    iput-boolean v0, p0, Lcom/android/internal/telephony/cat/tcpRxThread;->stopRequestTCP:Z

    .line 369
    iput-boolean v0, p0, Lcom/android/internal/telephony/cat/tcpRxThread;->terminatedByException:Z

    .line 442
    iput-object p1, p0, Lcom/android/internal/telephony/cat/tcpRxThread;->conn:Lcom/android/internal/telephony/cat/CatBIPClientConnection;

    .line 443
    return-void
.end method


# virtual methods
.method public run()V
    .registers 9

    .prologue
    const/4 v7, 0x1

    .line 373
    :cond_1
    :goto_1
    iget-boolean v5, p0, Lcom/android/internal/telephony/cat/tcpRxThread;->stopRequestTCP:Z

    if-nez v5, :cond_ff

    .line 375
    :try_start_5
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v5

    if-eqz v5, :cond_e

    .line 376
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/android/internal/telephony/cat/tcpRxThread;->stopRequestTCP:Z

    .line 379
    :cond_e
    iget-object v5, p0, Lcom/android/internal/telephony/cat/tcpRxThread;->conn:Lcom/android/internal/telephony/cat/CatBIPClientConnection;

    iget-object v5, v5, Lcom/android/internal/telephony/cat/CatBIPClientConnection;->rxBuf:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v5}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v5

    if-nez v5, :cond_ed

    invoke-static {}, Lcom/android/internal/telephony/cat/CatService;->isBIPCmdBeingProcessed()Z

    move-result v5

    if-nez v5, :cond_ed

    .line 382
    iget-object v5, p0, Lcom/android/internal/telephony/cat/tcpRxThread;->conn:Lcom/android/internal/telephony/cat/CatBIPClientConnection;

    iget v4, v5, Lcom/android/internal/telephony/cat/CatBIPConnection;->bufferSize:I

    .line 384
    .local v4, size:I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Maximum Packet Size negotiated by UICC "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 386
    new-array v0, v4, [B

    .line 388
    .local v0, dataReceived:[B
    iget-object v5, p0, Lcom/android/internal/telephony/cat/tcpRxThread;->conn:Lcom/android/internal/telephony/cat/CatBIPClientConnection;

    iget-object v5, v5, Lcom/android/internal/telephony/cat/CatBIPClientConnection;->in:Ljava/io/DataInputStream;

    invoke-virtual {v5, v0}, Ljava/io/DataInputStream;->read([B)I

    move-result v3

    .line 389
    .local v3, oneByte:I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Length of data = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 390
    const/4 v5, -0x1

    if-eq v3, v5, :cond_9c

    .line 391
    iget-object v5, p0, Lcom/android/internal/telephony/cat/tcpRxThread;->conn:Lcom/android/internal/telephony/cat/CatBIPClientConnection;

    iget-object v5, v5, Lcom/android/internal/telephony/cat/CatBIPClientConnection;->rxBuf:Ljava/io/ByteArrayOutputStream;

    const/4 v6, 0x0

    invoke-virtual {v5, v0, v6, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 393
    iget-object v5, p0, Lcom/android/internal/telephony/cat/tcpRxThread;->conn:Lcom/android/internal/telephony/cat/CatBIPClientConnection;

    iget-object v5, v5, Lcom/android/internal/telephony/cat/CatBIPConnection;->mCatBIPManager:Lcom/android/internal/telephony/cat/CatBIPManager;

    iget-object v6, p0, Lcom/android/internal/telephony/cat/tcpRxThread;->conn:Lcom/android/internal/telephony/cat/CatBIPClientConnection;

    invoke-virtual {v5, v6}, Lcom/android/internal/telephony/cat/CatBIPManager;->sendDataAvailableEvent(Lcom/android/internal/telephony/cat/CatBIPConnection;)V

    .line 394
    const-string v5, "Read Data!!"

    invoke-static {p0, v5}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_71
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_71} :catch_72
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_71} :catch_c3

    goto :goto_1

    .line 413
    .end local v0           #dataReceived:[B
    .end local v3           #oneByte:I
    .end local v4           #size:I
    :catch_72
    move-exception v1

    .line 415
    .local v1, e:Ljava/io/IOException;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "IOException : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 416
    iput-boolean v7, p0, Lcom/android/internal/telephony/cat/tcpRxThread;->terminatedByException:Z

    .line 417
    invoke-static {}, Ljava/lang/Thread;->yield()V

    .line 418
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 419
    iput-boolean v7, p0, Lcom/android/internal/telephony/cat/tcpRxThread;->stopRequestTCP:Z

    goto/16 :goto_1

    .line 396
    .end local v1           #e:Ljava/io/IOException;
    .restart local v0       #dataReceived:[B
    .restart local v3       #oneByte:I
    .restart local v4       #size:I
    :cond_9c
    :try_start_9c
    iget-object v5, p0, Lcom/android/internal/telephony/cat/tcpRxThread;->conn:Lcom/android/internal/telephony/cat/CatBIPClientConnection;

    const/4 v6, 0x0

    iput-boolean v6, v5, Lcom/android/internal/telephony/cat/CatBIPClientConnection;->isLinkEstablished:Z

    .line 397
    iget-object v5, p0, Lcom/android/internal/telephony/cat/tcpRxThread;->conn:Lcom/android/internal/telephony/cat/CatBIPClientConnection;

    iget-object v5, v5, Lcom/android/internal/telephony/cat/CatBIPConnection;->uiccTerminalIface:Lcom/android/internal/telephony/cat/TransportLevel;

    invoke-virtual {v5}, Lcom/android/internal/telephony/cat/TransportLevel;->isServer()Z

    move-result v5

    if-eqz v5, :cond_b9

    .line 398
    iget-object v5, p0, Lcom/android/internal/telephony/cat/tcpRxThread;->conn:Lcom/android/internal/telephony/cat/CatBIPClientConnection;

    const/4 v6, 0x5

    iput-byte v6, v5, Lcom/android/internal/telephony/cat/CatBIPConnection;->linkStateCause:B

    .line 399
    iget-object v5, p0, Lcom/android/internal/telephony/cat/tcpRxThread;->conn:Lcom/android/internal/telephony/cat/CatBIPClientConnection;

    iget-object v5, v5, Lcom/android/internal/telephony/cat/CatBIPConnection;->mCatBIPManager:Lcom/android/internal/telephony/cat/CatBIPManager;

    iget-object v6, p0, Lcom/android/internal/telephony/cat/tcpRxThread;->conn:Lcom/android/internal/telephony/cat/CatBIPClientConnection;

    invoke-virtual {v5, v6}, Lcom/android/internal/telephony/cat/CatBIPManager;->sendChannelStatusEvent(Lcom/android/internal/telephony/cat/CatBIPConnection;)V

    .line 401
    :cond_b9
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/android/internal/telephony/cat/tcpRxThread;->stopRequestTCP:Z

    .line 402
    const-string v5, "Connection terminated by BIP Server"

    invoke-static {p0, v5}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_c1
    .catch Ljava/io/IOException; {:try_start_9c .. :try_end_c1} :catch_72
    .catch Ljava/lang/Exception; {:try_start_9c .. :try_end_c1} :catch_c3

    goto/16 :goto_1

    .line 421
    .end local v0           #dataReceived:[B
    .end local v3           #oneByte:I
    .end local v4           #size:I
    :catch_c3
    move-exception v2

    .line 423
    .local v2, ee:Ljava/lang/Exception;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Exception : "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {p0, v5}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 424
    iput-boolean v7, p0, Lcom/android/internal/telephony/cat/tcpRxThread;->terminatedByException:Z

    .line 425
    invoke-static {}, Ljava/lang/Thread;->yield()V

    .line 426
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 427
    iput-boolean v7, p0, Lcom/android/internal/telephony/cat/tcpRxThread;->stopRequestTCP:Z

    goto/16 :goto_1

    .line 406
    .end local v2           #ee:Ljava/lang/Exception;
    :cond_ed
    const-wide/16 v5, 0x64

    :try_start_ef
    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_f2
    .catch Ljava/lang/InterruptedException; {:try_start_ef .. :try_end_f2} :catch_f4
    .catch Ljava/io/IOException; {:try_start_ef .. :try_end_f2} :catch_72
    .catch Ljava/lang/Exception; {:try_start_ef .. :try_end_f2} :catch_c3

    goto/16 :goto_1

    .line 407
    :catch_f4
    move-exception v1

    .line 408
    .local v1, e:Ljava/lang/InterruptedException;
    :try_start_f5
    const-string v5, "Interrupt Received!"

    invoke-static {p0, v5}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 409
    const/4 v5, 0x1

    iput-boolean v5, p0, Lcom/android/internal/telephony/cat/tcpRxThread;->stopRequestTCP:Z
    :try_end_fd
    .catch Ljava/io/IOException; {:try_start_f5 .. :try_end_fd} :catch_72
    .catch Ljava/lang/Exception; {:try_start_f5 .. :try_end_fd} :catch_c3

    goto/16 :goto_1

    .line 439
    .end local v1           #e:Ljava/lang/InterruptedException;
    :cond_ff
    return-void
.end method
