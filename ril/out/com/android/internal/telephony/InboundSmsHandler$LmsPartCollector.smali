.class Lcom/android/internal/telephony/InboundSmsHandler$LmsPartCollector;
.super Ljava/lang/Object;
.source "InboundSmsHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/InboundSmsHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "LmsPartCollector"
.end annotation


# instance fields
.field private mDestPort:I

.field private final mIsCdmaWapPush:Z

.field private final mMessageCount:I

.field private final mPdus:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "[B>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(IZ)V
    .registers 5
    .parameter "messageCount"
    .parameter "isCdmaWapPush"

    .prologue
    .line 2473
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2469
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/InboundSmsHandler$LmsPartCollector;->mPdus:Ljava/util/Map;

    .line 2471
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/internal/telephony/InboundSmsHandler$LmsPartCollector;->mDestPort:I

    .line 2474
    const/4 v0, 0x1

    if-ge p1, v0, :cond_18

    .line 2475
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "messageCount should be >= 1"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2477
    :cond_18
    iput p1, p0, Lcom/android/internal/telephony/InboundSmsHandler$LmsPartCollector;->mMessageCount:I

    .line 2478
    iput-boolean p2, p0, Lcom/android/internal/telephony/InboundSmsHandler$LmsPartCollector;->mIsCdmaWapPush:Z

    .line 2479
    return-void
.end method


# virtual methods
.method add(I[BLjava/lang/Integer;)V
    .registers 6
    .parameter "sequenceNumber"
    .parameter "pdu"
    .parameter "destPort"

    .prologue
    .line 2483
    iget-boolean v0, p0, Lcom/android/internal/telephony/InboundSmsHandler$LmsPartCollector;->mIsCdmaWapPush:Z

    if-nez v0, :cond_6

    .line 2484
    add-int/lit8 p1, p1, -0x1

    .line 2487
    :cond_6
    if-ltz p1, :cond_c

    iget v0, p0, Lcom/android/internal/telephony/InboundSmsHandler$LmsPartCollector;->mMessageCount:I

    if-lt p1, v0, :cond_14

    .line 2488
    :cond_c
    new-instance v0, Ljava/lang/IndexOutOfBoundsException;

    const-string v1, "Illegal sequence number"

    invoke-direct {v0, v1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 2491
    :cond_14
    iget-object v0, p0, Lcom/android/internal/telephony/InboundSmsHandler$LmsPartCollector;->mPdus:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2493
    if-eqz p3, :cond_25

    .line 2494
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/android/internal/telephony/InboundSmsHandler$LmsPartCollector;->mDestPort:I

    .line 2496
    :cond_25
    return-void
.end method

.method addAllFromCursor(Landroid/database/Cursor;III)V
    .registers 9
    .parameter "cursor"
    .parameter "sequenceNumberColumn"
    .parameter "pduColumn"
    .parameter "destPortColumn"

    .prologue
    .line 2499
    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v3

    if-eqz v3, :cond_25

    .line 2500
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    .line 2501
    .local v2, seqNumber:I
    invoke-interface {p1, p3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/android/internal/util/HexDump;->hexStringToByteArray(Ljava/lang/String;)[B

    move-result-object v1

    .line 2502
    .local v1, pdu:[B
    const/4 v0, 0x0

    .line 2503
    .local v0, destPort:Ljava/lang/Integer;
    invoke-interface {p1, p4}, Landroid/database/Cursor;->isNull(I)Z

    move-result v3

    if-nez v3, :cond_21

    .line 2504
    invoke-interface {p1, p4}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 2507
    :cond_21
    invoke-virtual {p0, v2, v1, v0}, Lcom/android/internal/telephony/InboundSmsHandler$LmsPartCollector;->add(I[BLjava/lang/Integer;)V

    goto :goto_0

    .line 2509
    .end local v0           #destPort:Ljava/lang/Integer;
    .end local v1           #pdu:[B
    .end local v2           #seqNumber:I
    :cond_25
    return-void
.end method

.method getDestPort()I
    .registers 2

    .prologue
    .line 2524
    iget v0, p0, Lcom/android/internal/telephony/InboundSmsHandler$LmsPartCollector;->mDestPort:I

    return v0
.end method

.method getPdusSequence()[[B
    .registers 5

    .prologue
    .line 2516
    iget v2, p0, Lcom/android/internal/telephony/InboundSmsHandler$LmsPartCollector;->mMessageCount:I

    new-array v1, v2, [[B

    .line 2517
    .local v1, pdus:[[B
    const/4 v0, 0x0

    .local v0, i:I
    :goto_5
    iget v2, p0, Lcom/android/internal/telephony/InboundSmsHandler$LmsPartCollector;->mMessageCount:I

    if-ge v0, v2, :cond_1a

    .line 2518
    iget-object v2, p0, Lcom/android/internal/telephony/InboundSmsHandler$LmsPartCollector;->mPdus:Ljava/util/Map;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    aput-object v2, v1, v0

    .line 2517
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 2520
    :cond_1a
    return-object v1
.end method

.method isEmpty()Z
    .registers 2

    .prologue
    .line 2512
    iget-object v0, p0, Lcom/android/internal/telephony/InboundSmsHandler$LmsPartCollector;->mPdus:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method
