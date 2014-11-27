.class public Lcom/movial/ipphone/IPSmsMessage;
.super Lcom/android/internal/telephony/SmsMessageBase;
.source "IPSmsMessage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/movial/ipphone/IPSmsMessage$PduParser;
    }
.end annotation


# static fields
.field static final LOG_TAG:Ljava/lang/String; = "IPSmsMessage"

.field private static mMessageReference:I


# instance fields
.field private automaticDeletion:Z

.field private dataCodingScheme:I

.field private dischargeTimeMillis:J

.field private forSubmit:Z

.field private isStatusReportMessage:Z

.field private messageClass:Lcom/android/internal/telephony/SmsConstants$MessageClass;

.field private mti:I

.field private protocolIdentifier:I

.field private recipientAddress:Lcom/android/internal/telephony/gsm/GsmSmsAddress;

.field private replyPathPresent:Z

.field private status:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 140
    const/4 v0, 0x0

    sput v0, Lcom/movial/ipphone/IPSmsMessage;->mMessageReference:I

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 91
    invoke-direct {p0}, Lcom/android/internal/telephony/SmsMessageBase;-><init>()V

    .line 111
    iput-boolean v0, p0, Lcom/movial/ipphone/IPSmsMessage;->replyPathPresent:Z

    .line 137
    iput-boolean v0, p0, Lcom/movial/ipphone/IPSmsMessage;->isStatusReportMessage:Z

    .line 542
    return-void
.end method

.method public static calculateLength(Ljava/lang/CharSequence;Z)Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    .registers 5
    .parameter "msgBody"
    .parameter "use7bitOnly"

    .prologue
    .line 841
    invoke-static {p0, p1}, Lcom/android/internal/telephony/gsm/SmsMessage;->calculateLength(Ljava/lang/CharSequence;Z)Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;

    move-result-object v1

    .line 843
    .local v1, ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    if-nez v1, :cond_2d

    .line 844
    new-instance v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;

    .end local v1           #ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    invoke-direct {v1}, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;-><init>()V

    .line 845
    .restart local v1       #ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    mul-int/lit8 v0, v2, 0x2

    .line 846
    .local v0, octets:I
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    iput v2, v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitCount:I

    .line 847
    const/16 v2, 0x8c

    if-le v0, v2, :cond_2e

    .line 848
    add-int/lit16 v2, v0, 0x85

    div-int/lit16 v2, v2, 0x86

    iput v2, v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->msgCount:I

    .line 850
    iget v2, v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->msgCount:I

    mul-int/lit16 v2, v2, 0x86

    sub-int/2addr v2, v0

    div-int/lit8 v2, v2, 0x2

    iput v2, v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitsRemaining:I

    .line 856
    :goto_2a
    const/4 v2, 0x3

    iput v2, v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitSize:I

    .line 858
    .end local v0           #octets:I
    :cond_2d
    return-object v1

    .line 853
    .restart local v0       #octets:I
    :cond_2e
    const/4 v2, 0x1

    iput v2, v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->msgCount:I

    .line 854
    rsub-int v2, v0, 0x8c

    div-int/lit8 v2, v2, 0x2

    iput v2, v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitsRemaining:I

    goto :goto_2a
.end method

.method public static createFromEfRecord(I[B)Lcom/movial/ipphone/IPSmsMessage;
    .registers 9
    .parameter "index"
    .parameter "data"

    .prologue
    const/4 v4, 0x0

    .line 208
    :try_start_1
    new-instance v1, Lcom/movial/ipphone/IPSmsMessage;

    invoke-direct {v1}, Lcom/movial/ipphone/IPSmsMessage;-><init>()V

    .line 210
    .local v1, msg:Lcom/movial/ipphone/IPSmsMessage;
    iput p0, v1, Lcom/android/internal/telephony/SmsMessageBase;->mIndexOnIcc:I

    .line 215
    const/4 v5, 0x0

    aget-byte v5, p1, v5

    and-int/lit8 v5, v5, 0x1

    if-nez v5, :cond_18

    .line 216
    const-string v5, "IPSmsMessage"

    const-string v6, "SMS parsing failed: Trying to parse a free record"

    invoke-static {v5, v6}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v1, v4

    .line 233
    .end local v1           #msg:Lcom/movial/ipphone/IPSmsMessage;
    :goto_17
    return-object v1

    .line 220
    .restart local v1       #msg:Lcom/movial/ipphone/IPSmsMessage;
    :cond_18
    const/4 v5, 0x0

    aget-byte v5, p1, v5

    and-int/lit8 v5, v5, 0x7

    iput v5, v1, Lcom/android/internal/telephony/SmsMessageBase;->mStatusOnIcc:I

    .line 223
    array-length v5, p1

    add-int/lit8 v3, v5, -0x1

    .line 227
    .local v3, size:I
    new-array v2, v3, [B

    .line 228
    .local v2, pdu:[B
    const/4 v5, 0x1

    const/4 v6, 0x0

    invoke-static {p1, v5, v2, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 229
    invoke-direct {v1, v2}, Lcom/movial/ipphone/IPSmsMessage;->parsePdu([B)V
    :try_end_2c
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_2c} :catch_2d

    goto :goto_17

    .line 231
    .end local v1           #msg:Lcom/movial/ipphone/IPSmsMessage;
    .end local v2           #pdu:[B
    .end local v3           #size:I
    :catch_2d
    move-exception v0

    .line 232
    .local v0, ex:Ljava/lang/RuntimeException;
    const-string v5, "IPSmsMessage"

    const-string v6, "SMS PDU parsing failed: "

    invoke-static {v5, v6, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v1, v4

    .line 233
    goto :goto_17
.end method

.method public static createFromPdu([B)Lcom/movial/ipphone/IPSmsMessage;
    .registers 5
    .parameter "pdu"

    .prologue
    .line 147
    :try_start_0
    new-instance v1, Lcom/movial/ipphone/IPSmsMessage;

    invoke-direct {v1}, Lcom/movial/ipphone/IPSmsMessage;-><init>()V

    .line 148
    .local v1, msg:Lcom/movial/ipphone/IPSmsMessage;
    invoke-direct {v1, p0}, Lcom/movial/ipphone/IPSmsMessage;->parsePdu([B)V
    :try_end_8
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_8} :catch_9

    .line 152
    .end local v1           #msg:Lcom/movial/ipphone/IPSmsMessage;
    :goto_8
    return-object v1

    .line 150
    :catch_9
    move-exception v0

    .line 151
    .local v0, ex:Ljava/lang/RuntimeException;
    const-string v2, "IPSmsMessage"

    const-string v3, "SMS PDU parsing failed: "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 152
    const/4 v1, 0x0

    goto :goto_8
.end method

.method private static encodeUCS2(Ljava/lang/String;[B)[B
    .registers 9
    .parameter "message"
    .parameter "header"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 394
    const-string v3, "utf-16be"

    invoke-virtual {p0, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 396
    .local v1, textPart:[B
    if-eqz p1, :cond_30

    .line 398
    array-length v3, p1

    array-length v4, v1

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    new-array v2, v3, [B

    .line 400
    .local v2, userData:[B
    array-length v3, p1

    int-to-byte v3, v3

    aput-byte v3, v2, v5

    .line 401
    array-length v3, p1

    invoke-static {p1, v5, v2, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 402
    array-length v3, p1

    add-int/lit8 v3, v3, 0x1

    array-length v4, v1

    invoke-static {v1, v5, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 407
    :goto_20
    array-length v3, v2

    add-int/lit8 v3, v3, 0x1

    new-array v0, v3, [B

    .line 408
    .local v0, ret:[B
    array-length v3, v2

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, v0, v5

    .line 409
    array-length v3, v2

    invoke-static {v2, v5, v0, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 410
    return-object v0

    .line 405
    .end local v0           #ret:[B
    .end local v2           #userData:[B
    :cond_30
    move-object v2, v1

    .restart local v2       #userData:[B
    goto :goto_20
.end method

.method public static getPreviousMessageReference()I
    .registers 1

    .prologue
    .line 1293
    sget v0, Lcom/movial/ipphone/IPSmsMessage;->mMessageReference:I

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public static getSubmitPdu(Ljava/lang/String;Ljava/lang/String;I[BZ)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    .registers 13
    .parameter "scAddress"
    .parameter "destinationAddress"
    .parameter "destinationPort"
    .parameter "data"
    .parameter "statusReportRequested"

    .prologue
    const/4 v7, 0x0

    .line 444
    new-instance v1, Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    invoke-direct {v1}, Lcom/android/internal/telephony/SmsHeader$PortAddrs;-><init>()V

    .line 445
    .local v1, portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;
    iput p2, v1, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->destPort:I

    .line 446
    iput v7, v1, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->origPort:I

    .line 447
    iput-boolean v7, v1, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->areEightBits:Z

    .line 449
    new-instance v3, Lcom/android/internal/telephony/SmsHeader;

    invoke-direct {v3}, Lcom/android/internal/telephony/SmsHeader;-><init>()V

    .line 450
    .local v3, smsHeader:Lcom/android/internal/telephony/SmsHeader;
    iput-object v1, v3, Lcom/android/internal/telephony/SmsHeader;->portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    .line 452
    invoke-static {v3}, Lcom/android/internal/telephony/SmsHeader;->toByteArray(Lcom/android/internal/telephony/SmsHeader;)[B

    move-result-object v4

    .line 454
    .local v4, smsHeaderData:[B
    array-length v5, p3

    array-length v6, v4

    add-int/2addr v5, v6

    add-int/lit8 v5, v5, 0x1

    const/16 v6, 0x8c

    if-le v5, v6, :cond_45

    .line 455
    const-string v5, "IPSmsMessage"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SMS data message may only contain "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    array-length v7, v4

    rsub-int v7, v7, 0x8c

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " bytes"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 457
    const/4 v2, 0x0

    .line 483
    :goto_44
    return-object v2

    .line 460
    :cond_45
    new-instance v2, Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    invoke-direct {v2}, Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;-><init>()V

    .line 461
    .local v2, ret:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    const/16 v5, 0x41

    invoke-static {p0, p1, v5, p4, v2}, Lcom/movial/ipphone/IPSmsMessage;->getSubmitPduHead(Ljava/lang/String;Ljava/lang/String;BZLcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;)Ljava/io/ByteArrayOutputStream;

    move-result-object v0

    .line 468
    .local v0, bo:Ljava/io/ByteArrayOutputStream;
    const/4 v5, 0x4

    invoke-virtual {v0, v5}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 473
    array-length v5, p3

    array-length v6, v4

    add-int/2addr v5, v6

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v0, v5}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 476
    array-length v5, v4

    invoke-virtual {v0, v5}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 477
    array-length v5, v4

    invoke-virtual {v0, v4, v7, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 480
    array-length v5, p3

    invoke-virtual {v0, p3, v7, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 482
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    iput-object v5, v2, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    goto :goto_44
.end method

.method public static getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    .registers 5
    .parameter "scAddress"
    .parameter "destinationAddress"
    .parameter "message"
    .parameter "statusReportRequested"

    .prologue
    .line 425
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lcom/movial/ipphone/IPSmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[B)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v0

    return-object v0
.end method

.method public static getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[B)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    .registers 13
    .parameter "scAddress"
    .parameter "destinationAddress"
    .parameter "message"
    .parameter "statusReportRequested"
    .parameter "header"

    .prologue
    const/4 v5, 0x0

    .line 260
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move v6, v5

    move v7, v5

    invoke-static/range {v0 .. v7}, Lcom/movial/ipphone/IPSmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BIII)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v0

    return-object v0
.end method

.method public static getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BIII)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    .registers 23
    .parameter "scAddress"
    .parameter "destinationAddress"
    .parameter "message"
    .parameter "statusReportRequested"
    .parameter "header"
    .parameter "encoding"
    .parameter "languageTable"
    .parameter "languageShiftTable"

    .prologue
    .line 284
    if-eqz p2, :cond_4

    if-nez p1, :cond_6

    .line 285
    :cond_4
    const/4 v7, 0x0

    .line 382
    :goto_5
    return-object v7

    .line 288
    :cond_6
    if-nez p5, :cond_80

    .line 290
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-static {v0, v12}, Lcom/movial/ipphone/IPSmsMessage;->calculateLength(Ljava/lang/CharSequence;Z)Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;

    move-result-object v9

    .line 291
    .local v9, ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    iget v0, v9, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitSize:I

    move/from16 p5, v0

    .line 292
    iget v0, v9, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageTable:I

    move/from16 p6, v0

    .line 293
    iget v0, v9, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageShiftTable:I

    move/from16 p7, v0

    .line 295
    const/4 v12, 0x1

    move/from16 v0, p5

    if-ne v0, v12, :cond_80

    if-nez p6, :cond_24

    if-eqz p7, :cond_80

    .line 296
    :cond_24
    if-eqz p4, :cond_d9

    .line 297
    invoke-static/range {p4 .. p4}, Lcom/android/internal/telephony/SmsHeader;->fromByteArray([B)Lcom/android/internal/telephony/SmsHeader;

    move-result-object v8

    .line 298
    .local v8, smsHeader:Lcom/android/internal/telephony/SmsHeader;
    iget v12, v8, Lcom/android/internal/telephony/SmsHeader;->languageTable:I

    move/from16 v0, p6

    if-ne v12, v0, :cond_36

    iget v12, v8, Lcom/android/internal/telephony/SmsHeader;->languageShiftTable:I

    move/from16 v0, p7

    if-eq v12, v0, :cond_80

    .line 300
    :cond_36
    const-string v12, "IPSmsMessage"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Updating language table in SMS header: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget v14, v8, Lcom/android/internal/telephony/SmsHeader;->languageTable:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " -> "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move/from16 v0, p6

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ", "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget v14, v8, Lcom/android/internal/telephony/SmsHeader;->languageShiftTable:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " -> "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move/from16 v0, p7

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    move/from16 v0, p6

    iput v0, v8, Lcom/android/internal/telephony/SmsHeader;->languageTable:I

    .line 304
    move/from16 v0, p7

    iput v0, v8, Lcom/android/internal/telephony/SmsHeader;->languageShiftTable:I

    .line 305
    invoke-static {v8}, Lcom/android/internal/telephony/SmsHeader;->toByteArray(Lcom/android/internal/telephony/SmsHeader;)[B

    move-result-object p4

    .line 316
    .end local v8           #smsHeader:Lcom/android/internal/telephony/SmsHeader;
    .end local v9           #ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    :cond_80
    :goto_80
    new-instance v7, Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    invoke-direct {v7}, Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;-><init>()V

    .line 318
    .local v7, ret:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    if-eqz p4, :cond_eb

    const/16 v12, 0x40

    :goto_89
    or-int/lit8 v12, v12, 0x1

    int-to-byte v6, v12

    .line 319
    .local v6, mtiByte:B
    move-object/from16 v0, p1

    move/from16 v1, p3

    invoke-static {p0, v0, v6, v1, v7}, Lcom/movial/ipphone/IPSmsMessage;->getSubmitPduHead(Ljava/lang/String;Ljava/lang/String;BZLcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;)Ljava/io/ByteArrayOutputStream;

    move-result-object v4

    .line 326
    .local v4, bo:Ljava/io/ByteArrayOutputStream;
    const/4 v12, 0x1

    move/from16 v0, p5

    if-ne v0, v12, :cond_ed

    .line 327
    :try_start_99
    move-object/from16 v0, p2

    move-object/from16 v1, p4

    move/from16 v2, p6

    move/from16 v3, p7

    invoke-static {v0, v1, v2, v3}, Lcom/android/internal/telephony/GsmAlphabet;->stringToGsm7BitPackedWithHeader(Ljava/lang/String;[BII)[B
    :try_end_a4
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_99 .. :try_end_a4} :catch_101

    move-result-object v11

    .line 353
    .local v11, userData:[B
    :goto_a5
    const/4 v12, 0x1

    move/from16 v0, p5

    if-ne v0, v12, :cond_129

    .line 354
    const/4 v12, 0x0

    aget-byte v12, v11, v12

    and-int/lit16 v12, v12, 0xff

    const/16 v13, 0xa0

    if-le v12, v13, :cond_118

    .line 356
    const-string v12, "IPSmsMessage"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Message too long ("

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const/4 v14, 0x0

    aget-byte v14, v11, v14

    and-int/lit16 v14, v14, 0xff

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " septets)"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 357
    const/4 v7, 0x0

    goto/16 :goto_5

    .line 308
    .end local v4           #bo:Ljava/io/ByteArrayOutputStream;
    .end local v6           #mtiByte:B
    .end local v7           #ret:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    .end local v11           #userData:[B
    .restart local v9       #ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    :cond_d9
    new-instance v8, Lcom/android/internal/telephony/SmsHeader;

    invoke-direct {v8}, Lcom/android/internal/telephony/SmsHeader;-><init>()V

    .line 309
    .restart local v8       #smsHeader:Lcom/android/internal/telephony/SmsHeader;
    move/from16 v0, p6

    iput v0, v8, Lcom/android/internal/telephony/SmsHeader;->languageTable:I

    .line 310
    move/from16 v0, p7

    iput v0, v8, Lcom/android/internal/telephony/SmsHeader;->languageShiftTable:I

    .line 311
    invoke-static {v8}, Lcom/android/internal/telephony/SmsHeader;->toByteArray(Lcom/android/internal/telephony/SmsHeader;)[B

    move-result-object p4

    goto :goto_80

    .line 318
    .end local v8           #smsHeader:Lcom/android/internal/telephony/SmsHeader;
    .end local v9           #ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    .restart local v7       #ret:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_eb
    const/4 v12, 0x0

    goto :goto_89

    .line 331
    .restart local v4       #bo:Ljava/io/ByteArrayOutputStream;
    .restart local v6       #mtiByte:B
    :cond_ed
    :try_start_ed
    move-object/from16 v0, p2

    move-object/from16 v1, p4

    invoke-static {v0, v1}, Lcom/movial/ipphone/IPSmsMessage;->encodeUCS2(Ljava/lang/String;[B)[B
    :try_end_f4
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_ed .. :try_end_f4} :catch_f6
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_ed .. :try_end_f4} :catch_101

    move-result-object v11

    .restart local v11       #userData:[B
    goto :goto_a5

    .line 332
    .end local v11           #userData:[B
    :catch_f6
    move-exception v10

    .line 333
    .local v10, uex:Ljava/io/UnsupportedEncodingException;
    :try_start_f7
    const-string v12, "IPSmsMessage"

    const-string v13, "Implausible UnsupportedEncodingException "

    invoke-static {v12, v13, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_fe
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_f7 .. :try_end_fe} :catch_101

    .line 336
    const/4 v7, 0x0

    goto/16 :goto_5

    .line 339
    .end local v10           #uex:Ljava/io/UnsupportedEncodingException;
    :catch_101
    move-exception v5

    .line 343
    .local v5, ex:Lcom/android/internal/telephony/EncodeException;
    :try_start_102
    move-object/from16 v0, p2

    move-object/from16 v1, p4

    invoke-static {v0, v1}, Lcom/movial/ipphone/IPSmsMessage;->encodeUCS2(Ljava/lang/String;[B)[B
    :try_end_109
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_102 .. :try_end_109} :catch_10d

    move-result-object v11

    .line 344
    .restart local v11       #userData:[B
    const/16 p5, 0x3

    goto :goto_a5

    .line 345
    .end local v11           #userData:[B
    :catch_10d
    move-exception v10

    .line 346
    .restart local v10       #uex:Ljava/io/UnsupportedEncodingException;
    const-string v12, "IPSmsMessage"

    const-string v13, "Implausible UnsupportedEncodingException "

    invoke-static {v12, v13, v10}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 349
    const/4 v7, 0x0

    goto/16 :goto_5

    .line 367
    .end local v5           #ex:Lcom/android/internal/telephony/EncodeException;
    .end local v10           #uex:Ljava/io/UnsupportedEncodingException;
    .restart local v11       #userData:[B
    :cond_118
    const/4 v12, 0x0

    invoke-virtual {v4, v12}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 380
    :goto_11c
    const/4 v12, 0x0

    array-length v13, v11

    invoke-virtual {v4, v11, v12, v13}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 381
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v12

    iput-object v12, v7, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    goto/16 :goto_5

    .line 369
    :cond_129
    const/4 v12, 0x0

    aget-byte v12, v11, v12

    and-int/lit16 v12, v12, 0xff

    const/16 v13, 0x8c

    if-le v12, v13, :cond_158

    .line 371
    const-string v12, "IPSmsMessage"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Message too long ("

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const/4 v14, 0x0

    aget-byte v14, v11, v14

    and-int/lit16 v14, v14, 0xff

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " bytes)"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 372
    const/4 v7, 0x0

    goto/16 :goto_5

    .line 376
    :cond_158
    const/16 v12, 0x8

    invoke-virtual {v4, v12}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_11c
.end method

.method private static getSubmitPduHead(Ljava/lang/String;Ljava/lang/String;BZLcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;)Ljava/io/ByteArrayOutputStream;
    .registers 11
    .parameter "scAddress"
    .parameter "destinationAddress"
    .parameter "mtiByte"
    .parameter "statusReportRequested"
    .parameter "ret"

    .prologue
    const/4 v3, 0x0

    .line 501
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/16 v2, 0xb4

    invoke-direct {v0, v2}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 505
    .local v0, bo:Ljava/io/ByteArrayOutputStream;
    if-nez p0, :cond_42

    .line 506
    const/4 v2, 0x0

    iput-object v2, p4, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    .line 513
    :goto_d
    if-eqz p3, :cond_12

    .line 515
    or-int/lit8 v2, p2, 0x20

    int-to-byte p2, v2

    .line 518
    :cond_12
    invoke-virtual {v0, p2}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 523
    sget v2, Lcom/movial/ipphone/IPSmsMessage;->mMessageReference:I

    add-int/lit8 v4, v2, 0x1

    sput v4, Lcom/movial/ipphone/IPSmsMessage;->mMessageReference:I

    rem-int/lit16 v2, v2, 0x100

    invoke-virtual {v0, v2}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 527
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->networkPortionToCalledPartyBCD(Ljava/lang/String;)[B

    move-result-object v1

    .line 531
    .local v1, daBytes:[B
    array-length v2, v1

    add-int/lit8 v2, v2, -0x1

    mul-int/lit8 v4, v2, 0x2

    array-length v2, v1

    add-int/lit8 v2, v2, -0x1

    aget-byte v2, v1, v2

    and-int/lit16 v2, v2, 0xf0

    const/16 v5, 0xf0

    if-ne v2, v5, :cond_49

    const/4 v2, 0x1

    :goto_35
    sub-int v2, v4, v2

    invoke-virtual {v0, v2}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 535
    array-length v2, v1

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 538
    invoke-virtual {v0, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 539
    return-object v0

    .line 508
    .end local v1           #daBytes:[B
    :cond_42
    invoke-static {p0}, Landroid/telephony/PhoneNumberUtils;->networkPortionToCalledPartyBCDWithLength(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, p4, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    goto :goto_d

    .restart local v1       #daBytes:[B
    :cond_49
    move v2, v3

    .line 531
    goto :goto_35
.end method

.method public static getTPLayerLengthForPDU(Ljava/lang/String;)I
    .registers 5
    .parameter "pdu"

    .prologue
    .line 242
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    div-int/lit8 v0, v2, 0x2

    .line 243
    .local v0, len:I
    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x10

    invoke-static {v2, v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v1

    .line 245
    .local v1, smscLen:I
    sub-int v2, v0, v1

    add-int/lit8 v2, v2, -0x1

    return v2
.end method

.method public static newFromCDS(Ljava/lang/String;)Lcom/movial/ipphone/IPSmsMessage;
    .registers 5
    .parameter "line"

    .prologue
    .line 187
    :try_start_0
    new-instance v1, Lcom/movial/ipphone/IPSmsMessage;

    invoke-direct {v1}, Lcom/movial/ipphone/IPSmsMessage;-><init>()V

    .line 188
    .local v1, msg:Lcom/movial/ipphone/IPSmsMessage;
    invoke-static {p0}, Lcom/android/internal/telephony/IccUtils;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/movial/ipphone/IPSmsMessage;->parsePdu([B)V
    :try_end_c
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_c} :catch_d

    .line 192
    .end local v1           #msg:Lcom/movial/ipphone/IPSmsMessage;
    :goto_c
    return-object v1

    .line 190
    :catch_d
    move-exception v0

    .line 191
    .local v0, ex:Ljava/lang/RuntimeException;
    const-string v2, "IPSmsMessage"

    const-string v3, "CDS SMS PDU parsing failed: "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 192
    const/4 v1, 0x0

    goto :goto_c
.end method

.method public static newFromCMT([Ljava/lang/String;)Lcom/movial/ipphone/IPSmsMessage;
    .registers 5
    .parameter "lines"

    .prologue
    .line 175
    :try_start_0
    new-instance v1, Lcom/movial/ipphone/IPSmsMessage;

    invoke-direct {v1}, Lcom/movial/ipphone/IPSmsMessage;-><init>()V

    .line 176
    .local v1, msg:Lcom/movial/ipphone/IPSmsMessage;
    const/4 v2, 0x1

    aget-object v2, p0, v2

    invoke-static {v2}, Lcom/android/internal/telephony/IccUtils;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/movial/ipphone/IPSmsMessage;->parsePdu([B)V
    :try_end_f
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_f} :catch_10

    .line 180
    .end local v1           #msg:Lcom/movial/ipphone/IPSmsMessage;
    :goto_f
    return-object v1

    .line 178
    :catch_10
    move-exception v0

    .line 179
    .local v0, ex:Ljava/lang/RuntimeException;
    const-string v2, "IPSmsMessage"

    const-string v3, "SMS PDU parsing failed: "

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 180
    const/4 v1, 0x0

    goto :goto_f
.end method

.method private parsePdu([B)V
    .registers 7
    .parameter "pdu"

    .prologue
    .line 963
    iput-object p1, p0, Lcom/android/internal/telephony/SmsMessageBase;->mPdu:[B

    .line 967
    new-instance v1, Lcom/movial/ipphone/IPSmsMessage$PduParser;

    invoke-direct {v1, p1}, Lcom/movial/ipphone/IPSmsMessage$PduParser;-><init>([B)V

    .line 969
    .local v1, p:Lcom/movial/ipphone/IPSmsMessage$PduParser;
    invoke-virtual {v1}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->getSCAddress()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/internal/telephony/SmsMessageBase;->mScAddress:Ljava/lang/String;

    .line 971
    iget-object v2, p0, Lcom/android/internal/telephony/SmsMessageBase;->mScAddress:Ljava/lang/String;

    if-eqz v2, :cond_11

    .line 979
    :cond_11
    invoke-virtual {v1}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->getByte()I

    move-result v0

    .line 981
    .local v0, firstByte:I
    const-string v2, "IPSmsMessage"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "mti: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 983
    and-int/lit8 v2, v0, 0x3

    iput v2, p0, Lcom/movial/ipphone/IPSmsMessage;->mti:I

    .line 984
    iget v2, p0, Lcom/movial/ipphone/IPSmsMessage;->mti:I

    packed-switch v2, :pswitch_data_46

    .line 997
    :pswitch_36
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Unsupported message type"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 990
    :pswitch_3e
    invoke-direct {p0, v1, v0}, Lcom/movial/ipphone/IPSmsMessage;->parseSmsDeliver(Lcom/movial/ipphone/IPSmsMessage$PduParser;I)V

    .line 999
    :goto_41
    return-void

    .line 993
    :pswitch_42
    invoke-direct {p0, v1, v0}, Lcom/movial/ipphone/IPSmsMessage;->parseSmsStatusReport(Lcom/movial/ipphone/IPSmsMessage$PduParser;I)V

    goto :goto_41

    .line 984
    :pswitch_data_46
    .packed-switch 0x0
        :pswitch_3e
        :pswitch_36
        :pswitch_42
        :pswitch_3e
    .end packed-switch
.end method

.method private parseSmsDeliver(Lcom/movial/ipphone/IPSmsMessage$PduParser;I)V
    .registers 9
    .parameter "p"
    .parameter "firstByte"

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1056
    and-int/lit16 v1, p2, 0x80

    const/16 v4, 0x80

    if-ne v1, v4, :cond_58

    move v1, v2

    :goto_9
    iput-boolean v1, p0, Lcom/movial/ipphone/IPSmsMessage;->replyPathPresent:Z

    .line 1058
    invoke-virtual {p1}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->getAddress()Lcom/android/internal/telephony/gsm/GsmSmsAddress;

    move-result-object v1

    iput-object v1, p0, Lcom/android/internal/telephony/SmsMessageBase;->mOriginatingAddress:Lcom/android/internal/telephony/SmsAddress;

    .line 1060
    iget-object v1, p0, Lcom/android/internal/telephony/SmsMessageBase;->mOriginatingAddress:Lcom/android/internal/telephony/SmsAddress;

    if-eqz v1, :cond_15

    .line 1067
    :cond_15
    invoke-virtual {p1}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->getByte()I

    move-result v1

    iput v1, p0, Lcom/movial/ipphone/IPSmsMessage;->protocolIdentifier:I

    .line 1071
    invoke-virtual {p1}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->getByte()I

    move-result v1

    iput v1, p0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    .line 1074
    const-string v1, "IPSmsMessage"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "SMS TP-PID:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/movial/ipphone/IPSmsMessage;->protocolIdentifier:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " data coding scheme: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1078
    invoke-virtual {p1}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->getSCTimestampMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/android/internal/telephony/SmsMessageBase;->mScTimeMillis:J

    .line 1082
    and-int/lit8 v1, p2, 0x40

    const/16 v4, 0x40

    if-ne v1, v4, :cond_5a

    move v0, v2

    .line 1084
    .local v0, hasUserDataHeader:Z
    :goto_54
    invoke-direct {p0, p1, v0}, Lcom/movial/ipphone/IPSmsMessage;->parseUserData(Lcom/movial/ipphone/IPSmsMessage$PduParser;Z)V

    .line 1085
    return-void

    .end local v0           #hasUserDataHeader:Z
    :cond_58
    move v1, v3

    .line 1056
    goto :goto_9

    :cond_5a
    move v0, v3

    .line 1082
    goto :goto_54
.end method

.method private parseSmsStatusReport(Lcom/movial/ipphone/IPSmsMessage$PduParser;I)V
    .registers 11
    .parameter "p"
    .parameter "firstByte"

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 1008
    iput-boolean v4, p0, Lcom/movial/ipphone/IPSmsMessage;->isStatusReportMessage:Z

    .line 1011
    and-int/lit8 v3, p2, 0x20

    if-nez v3, :cond_3d

    move v3, v4

    :goto_9
    iput-boolean v3, p0, Lcom/movial/ipphone/IPSmsMessage;->forSubmit:Z

    .line 1013
    invoke-virtual {p1}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->getByte()I

    move-result v3

    iput v3, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMessageRef:I

    .line 1015
    invoke-virtual {p1}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->getAddress()Lcom/android/internal/telephony/gsm/GsmSmsAddress;

    move-result-object v3

    iput-object v3, p0, Lcom/movial/ipphone/IPSmsMessage;->recipientAddress:Lcom/android/internal/telephony/gsm/GsmSmsAddress;

    .line 1017
    invoke-virtual {p1}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->getSCTimestampMillis()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/android/internal/telephony/SmsMessageBase;->mScTimeMillis:J

    .line 1019
    invoke-virtual {p1}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->getSCTimestampMillis()J

    move-result-wide v6

    iput-wide v6, p0, Lcom/movial/ipphone/IPSmsMessage;->dischargeTimeMillis:J

    .line 1021
    invoke-virtual {p1}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->getByte()I

    move-result v3

    iput v3, p0, Lcom/movial/ipphone/IPSmsMessage;->status:I

    .line 1024
    invoke-virtual {p1}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->moreDataPresent()Z

    move-result v3

    if-eqz v3, :cond_65

    .line 1026
    invoke-virtual {p1}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->getByte()I

    move-result v0

    .line 1027
    .local v0, extraParams:I
    move v2, v0

    .line 1028
    .local v2, moreExtraParams:I
    :goto_34
    and-int/lit16 v3, v2, 0x80

    if-eqz v3, :cond_3f

    .line 1032
    invoke-virtual {p1}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->getByte()I

    move-result v2

    goto :goto_34

    .end local v0           #extraParams:I
    .end local v2           #moreExtraParams:I
    :cond_3d
    move v3, v5

    .line 1011
    goto :goto_9

    .line 1037
    .restart local v0       #extraParams:I
    .restart local v2       #moreExtraParams:I
    :cond_3f
    and-int/lit8 v3, v0, 0x78

    if-nez v3, :cond_65

    .line 1039
    and-int/lit8 v3, v0, 0x1

    if-eqz v3, :cond_4d

    .line 1040
    invoke-virtual {p1}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->getByte()I

    move-result v3

    iput v3, p0, Lcom/movial/ipphone/IPSmsMessage;->protocolIdentifier:I

    .line 1043
    :cond_4d
    and-int/lit8 v3, v0, 0x2

    if-eqz v3, :cond_57

    .line 1044
    invoke-virtual {p1}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->getByte()I

    move-result v3

    iput v3, p0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    .line 1047
    :cond_57
    and-int/lit8 v3, v0, 0x4

    if-eqz v3, :cond_65

    .line 1048
    and-int/lit8 v3, p2, 0x40

    const/16 v6, 0x40

    if-ne v3, v6, :cond_66

    move v1, v4

    .line 1049
    .local v1, hasUserDataHeader:Z
    :goto_62
    invoke-direct {p0, p1, v1}, Lcom/movial/ipphone/IPSmsMessage;->parseUserData(Lcom/movial/ipphone/IPSmsMessage$PduParser;Z)V

    .line 1053
    .end local v0           #extraParams:I
    .end local v1           #hasUserDataHeader:Z
    .end local v2           #moreExtraParams:I
    :cond_65
    return-void

    .restart local v0       #extraParams:I
    .restart local v2       #moreExtraParams:I
    :cond_66
    move v1, v5

    .line 1048
    goto :goto_62
.end method

.method private parseUserData(Lcom/movial/ipphone/IPSmsMessage$PduParser;Z)V
    .registers 19
    .parameter "p"
    .parameter "hasUserDataHeader"

    .prologue
    .line 1095
    const/4 v6, 0x0

    .line 1096
    .local v6, hasMessageClass:Z
    const/4 v10, 0x0

    .line 1098
    .local v10, userDataCompressed:Z
    const/4 v5, 0x0

    .line 1099
    .local v5, encodingType:I
    const-string v11, "IPSmsMessage"

    const-string v12, "parse userdata"

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1102
    move-object/from16 v0, p0

    iget v11, v0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    and-int/lit16 v11, v11, 0x80

    if-nez v11, :cond_b8

    .line 1104
    move-object/from16 v0, p0

    iget v11, v0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    and-int/lit8 v11, v11, 0x40

    if-eqz v11, :cond_82

    const/4 v11, 0x1

    :goto_1b
    move-object/from16 v0, p0

    iput-boolean v11, v0, Lcom/movial/ipphone/IPSmsMessage;->automaticDeletion:Z

    .line 1105
    move-object/from16 v0, p0

    iget v11, v0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    and-int/lit8 v11, v11, 0x20

    if-eqz v11, :cond_84

    const/4 v10, 0x1

    .line 1106
    :goto_28
    move-object/from16 v0, p0

    iget v11, v0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    and-int/lit8 v11, v11, 0x10

    if-eqz v11, :cond_86

    const/4 v6, 0x1

    .line 1108
    :goto_31
    if-eqz v10, :cond_88

    .line 1109
    const-string v11, "IPSmsMessage"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "4 - Unsupported SMS data coding scheme (compression) "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p0

    iget v13, v0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    and-int/lit16 v13, v13, 0xff

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1187
    :goto_51
    const/4 v11, 0x1

    if-ne v5, v11, :cond_1ae

    const/4 v11, 0x1

    :goto_55
    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-virtual {v0, v1, v11}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->constructUserData(ZZ)I

    move-result v3

    .line 1189
    .local v3, count:I
    invoke-virtual/range {p1 .. p1}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->getUserData()[B

    move-result-object v11

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase;->mUserData:[B

    .line 1190
    invoke-virtual/range {p1 .. p1}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->getUserDataHeader()Lcom/android/internal/telephony/SmsHeader;

    move-result-object v11

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase;->mUserDataHeader:Lcom/android/internal/telephony/SmsHeader;

    .line 1192
    packed-switch v5, :pswitch_data_314

    .line 1249
    :goto_70
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase;->mMessageBody:Ljava/lang/String;

    if-eqz v11, :cond_79

    .line 1250
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/SmsMessageBase;->parseMessageBody()V

    .line 1253
    :cond_79
    if-nez v6, :cond_2e9

    .line 1254
    sget-object v11, Lcom/android/internal/telephony/SmsConstants$MessageClass;->UNKNOWN:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/movial/ipphone/IPSmsMessage;->messageClass:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    .line 1271
    :goto_81
    return-void

    .line 1104
    .end local v3           #count:I
    :cond_82
    const/4 v11, 0x0

    goto :goto_1b

    .line 1105
    :cond_84
    const/4 v10, 0x0

    goto :goto_28

    .line 1106
    :cond_86
    const/4 v6, 0x0

    goto :goto_31

    .line 1112
    :cond_88
    move-object/from16 v0, p0

    iget v11, v0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    shr-int/lit8 v11, v11, 0x2

    and-int/lit8 v11, v11, 0x3

    packed-switch v11, :pswitch_data_322

    goto :goto_51

    .line 1114
    :pswitch_94
    const/4 v5, 0x1

    .line 1115
    goto :goto_51

    .line 1118
    :pswitch_96
    const/4 v5, 0x3

    .line 1119
    goto :goto_51

    .line 1123
    :pswitch_98
    const-string v11, "IPSmsMessage"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "1 - Unsupported SMS data coding scheme "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p0

    iget v13, v0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    and-int/lit16 v13, v13, 0xff

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1125
    const/4 v5, 0x2

    goto :goto_51

    .line 1129
    :cond_b8
    move-object/from16 v0, p0

    iget v11, v0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    and-int/lit16 v11, v11, 0xf0

    const/16 v12, 0xf0

    if-ne v11, v12, :cond_d7

    .line 1130
    const/4 v11, 0x0

    move-object/from16 v0, p0

    iput-boolean v11, v0, Lcom/movial/ipphone/IPSmsMessage;->automaticDeletion:Z

    .line 1131
    const/4 v6, 0x1

    .line 1132
    const/4 v10, 0x0

    .line 1134
    move-object/from16 v0, p0

    iget v11, v0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    and-int/lit8 v11, v11, 0x4

    if-nez v11, :cond_d4

    .line 1136
    const/4 v5, 0x1

    goto/16 :goto_51

    .line 1139
    :cond_d4
    const/4 v5, 0x2

    goto/16 :goto_51

    .line 1141
    :cond_d7
    move-object/from16 v0, p0

    iget v11, v0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    and-int/lit16 v11, v11, 0xf0

    const/16 v12, 0xc0

    if-eq v11, v12, :cond_f5

    move-object/from16 v0, p0

    iget v11, v0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    and-int/lit16 v11, v11, 0xf0

    const/16 v12, 0xd0

    if-eq v11, v12, :cond_f5

    move-object/from16 v0, p0

    iget v11, v0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    and-int/lit16 v11, v11, 0xf0

    const/16 v12, 0xe0

    if-ne v11, v12, :cond_159

    .line 1150
    :cond_f5
    move-object/from16 v0, p0

    iget v11, v0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    and-int/lit16 v11, v11, 0xf0

    const/16 v12, 0xe0

    if-ne v11, v12, :cond_12e

    .line 1151
    const/4 v5, 0x3

    .line 1156
    :goto_100
    const/4 v10, 0x0

    .line 1157
    move-object/from16 v0, p0

    iget v11, v0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    and-int/lit8 v11, v11, 0x8

    const/16 v12, 0x8

    if-ne v11, v12, :cond_130

    const/4 v2, 0x1

    .line 1161
    .local v2, active:Z
    :goto_10c
    move-object/from16 v0, p0

    iget v11, v0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    and-int/lit8 v11, v11, 0x3

    if-nez v11, :cond_134

    .line 1162
    const/4 v11, 0x1

    move-object/from16 v0, p0

    iput-boolean v11, v0, Lcom/android/internal/telephony/SmsMessageBase;->mIsMwi:Z

    .line 1163
    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/android/internal/telephony/SmsMessageBase;->mMwiSense:Z

    .line 1164
    move-object/from16 v0, p0

    iget v11, v0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    and-int/lit16 v11, v11, 0xf0

    const/16 v12, 0xc0

    if-ne v11, v12, :cond_132

    const/4 v11, 0x1

    :goto_128
    move-object/from16 v0, p0

    iput-boolean v11, v0, Lcom/android/internal/telephony/SmsMessageBase;->mMwiDontStore:Z

    goto/16 :goto_51

    .line 1153
    .end local v2           #active:Z
    :cond_12e
    const/4 v5, 0x1

    goto :goto_100

    .line 1157
    :cond_130
    const/4 v2, 0x0

    goto :goto_10c

    .line 1164
    .restart local v2       #active:Z
    :cond_132
    const/4 v11, 0x0

    goto :goto_128

    .line 1166
    :cond_134
    const/4 v11, 0x0

    move-object/from16 v0, p0

    iput-boolean v11, v0, Lcom/android/internal/telephony/SmsMessageBase;->mIsMwi:Z

    .line 1168
    const-string v11, "IPSmsMessage"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "MWI for fax, email, or other "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p0

    iget v13, v0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    and-int/lit16 v13, v13, 0xff

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_51

    .line 1171
    .end local v2           #active:Z
    :cond_159
    move-object/from16 v0, p0

    iget v11, v0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    and-int/lit16 v11, v11, 0xc0

    const/16 v12, 0x80

    if-ne v11, v12, :cond_18e

    .line 1174
    move-object/from16 v0, p0

    iget v11, v0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    const/16 v12, 0x84

    if-ne v11, v12, :cond_16e

    .line 1176
    const/4 v5, 0x4

    goto/16 :goto_51

    .line 1178
    :cond_16e
    const-string v11, "IPSmsMessage"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "5 - Unsupported SMS data coding scheme "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p0

    iget v13, v0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    and-int/lit16 v13, v13, 0xff

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_51

    .line 1182
    :cond_18e
    const-string v11, "IPSmsMessage"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "3 - Unsupported SMS data coding scheme "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p0

    iget v13, v0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    and-int/lit16 v13, v13, 0xff

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_51

    .line 1187
    :cond_1ae
    const/4 v11, 0x0

    goto/16 :goto_55

    .line 1196
    .restart local v3       #count:I
    :pswitch_1b1
    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->getUserDataUTF8(I)Ljava/lang/String;

    move-result-object v11

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase;->mMessageBody:Ljava/lang/String;

    .line 1198
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase;->mUserDataHeader:Lcom/android/internal/telephony/SmsHeader;

    if-eqz v11, :cond_1de

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase;->mUserDataHeader:Lcom/android/internal/telephony/SmsHeader;

    iget-object v11, v11, Lcom/android/internal/telephony/SmsHeader;->portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    if-eqz v11, :cond_1de

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase;->mUserDataHeader:Lcom/android/internal/telephony/SmsHeader;

    iget-object v11, v11, Lcom/android/internal/telephony/SmsHeader;->portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    iget v11, v11, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->destPort:I

    const/16 v12, 0xb84

    if-ne v11, v12, :cond_1de

    .line 1200
    const-string v11, "IPSmsMessage"

    const-string v12, "receive WAP PUSH"

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_70

    .line 1206
    :cond_1de
    const/4 v8, 0x0

    .line 1208
    .local v8, newText:[B
    :try_start_1df
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase;->mMessageBody:Ljava/lang/String;

    const/4 v12, 0x0

    invoke-static {v11, v12}, Lcom/movial/ipphone/IPSmsMessage;->encodeUCS2(Ljava/lang/String;[B)[B

    move-result-object v8

    .line 1209
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase;->mPdu:[B

    array-length v11, v11

    array-length v12, v8

    add-int/lit8 v12, v12, -0x1

    add-int/2addr v11, v12

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/internal/telephony/SmsMessageBase;->mMessageBody:Ljava/lang/String;

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    sub-int/2addr v11, v12

    new-array v7, v11, [B
    :try_end_1fc
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1df .. :try_end_1fc} :catch_2a5

    .line 1215
    .local v7, newPdu:[B
    const-string v11, "IPSmsMessage"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "new Encoded Text: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-static {v8}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1216
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase;->mPdu:[B

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/android/internal/telephony/SmsMessageBase;->mPdu:[B

    array-length v14, v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/SmsMessageBase;->mMessageBody:Ljava/lang/String;

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v15

    sub-int/2addr v14, v15

    add-int/lit8 v14, v14, -0x1

    invoke-static {v11, v12, v7, v13, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1217
    const/4 v11, 0x0

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/internal/telephony/SmsMessageBase;->mPdu:[B

    array-length v12, v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/android/internal/telephony/SmsMessageBase;->mMessageBody:Ljava/lang/String;

    invoke-virtual {v13}, Ljava/lang/String;->length()I

    move-result v13

    sub-int/2addr v12, v13

    add-int/lit8 v12, v12, -0x1

    array-length v13, v8

    invoke-static {v8, v11, v7, v12, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1220
    const/4 v4, 0x0

    .line 1221
    .local v4, dcs_offset:I
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase;->mPdu:[B

    aget-byte v11, v11, v4

    add-int/lit8 v11, v11, 0x2

    add-int/2addr v4, v11

    .line 1222
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase;->mPdu:[B

    aget-byte v11, v11, v4

    add-int/lit8 v11, v11, 0x1

    div-int/lit8 v11, v11, 0x2

    add-int/lit8 v11, v11, 0x1

    add-int/2addr v4, v11

    .line 1223
    add-int/lit8 v4, v4, 0x2

    .line 1225
    const-string v11, "IPSmsMessage"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "change DCS from "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    aget-byte v13, v7, v4

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " to 0x1b"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1226
    const/16 v11, 0x1b

    aput-byte v11, v7, v4

    .line 1227
    const-string v11, "IPSmsMessage"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "new encoded: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-static {v7}, Lcom/android/internal/telephony/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1228
    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/android/internal/telephony/SmsMessageBase;->mPdu:[B

    goto/16 :goto_70

    .line 1210
    .end local v4           #dcs_offset:I
    .end local v7           #newPdu:[B
    :catch_2a5
    move-exception v9

    .line 1211
    .local v9, uex:Ljava/io/UnsupportedEncodingException;
    const-string v11, "IPSmsMessage"

    const-string v12, "Implausible UnsupportedEncodingException "

    invoke-static {v11, v12, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_81

    .line 1233
    .end local v8           #newText:[B
    .end local v9           #uex:Ljava/io/UnsupportedEncodingException;
    :pswitch_2af
    if-eqz p2, :cond_2cc

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase;->mUserDataHeader:Lcom/android/internal/telephony/SmsHeader;

    iget v11, v11, Lcom/android/internal/telephony/SmsHeader;->languageTable:I

    move v12, v11

    :goto_2b8
    if-eqz p2, :cond_2cf

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase;->mUserDataHeader:Lcom/android/internal/telephony/SmsHeader;

    iget v11, v11, Lcom/android/internal/telephony/SmsHeader;->languageShiftTable:I

    :goto_2c0
    move-object/from16 v0, p1

    invoke-virtual {v0, v3, v12, v11}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->getUserDataGSM7Bit(III)Ljava/lang/String;

    move-result-object v11

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase;->mMessageBody:Ljava/lang/String;

    goto/16 :goto_70

    :cond_2cc
    const/4 v11, 0x0

    move v12, v11

    goto :goto_2b8

    :cond_2cf
    const/4 v11, 0x0

    goto :goto_2c0

    .line 1239
    :pswitch_2d1
    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->getUserDataUCS2(I)Ljava/lang/String;

    move-result-object v11

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase;->mMessageBody:Ljava/lang/String;

    goto/16 :goto_70

    .line 1243
    :pswitch_2dd
    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lcom/movial/ipphone/IPSmsMessage$PduParser;->getUserDataKSC5601(I)Ljava/lang/String;

    move-result-object v11

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/android/internal/telephony/SmsMessageBase;->mMessageBody:Ljava/lang/String;

    goto/16 :goto_70

    .line 1256
    :cond_2e9
    move-object/from16 v0, p0

    iget v11, v0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    and-int/lit8 v11, v11, 0x3

    packed-switch v11, :pswitch_data_32e

    goto/16 :goto_81

    .line 1258
    :pswitch_2f4
    sget-object v11, Lcom/android/internal/telephony/SmsConstants$MessageClass;->CLASS_0:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/movial/ipphone/IPSmsMessage;->messageClass:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    goto/16 :goto_81

    .line 1261
    :pswitch_2fc
    sget-object v11, Lcom/android/internal/telephony/SmsConstants$MessageClass;->CLASS_1:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/movial/ipphone/IPSmsMessage;->messageClass:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    goto/16 :goto_81

    .line 1264
    :pswitch_304
    sget-object v11, Lcom/android/internal/telephony/SmsConstants$MessageClass;->CLASS_2:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/movial/ipphone/IPSmsMessage;->messageClass:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    goto/16 :goto_81

    .line 1267
    :pswitch_30c
    sget-object v11, Lcom/android/internal/telephony/SmsConstants$MessageClass;->CLASS_3:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    move-object/from16 v0, p0

    iput-object v11, v0, Lcom/movial/ipphone/IPSmsMessage;->messageClass:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    goto/16 :goto_81

    .line 1192
    :pswitch_data_314
    .packed-switch 0x0
        :pswitch_1b1
        :pswitch_2af
        :pswitch_1b1
        :pswitch_2d1
        :pswitch_2dd
    .end packed-switch

    .line 1112
    :pswitch_data_322
    .packed-switch 0x0
        :pswitch_94
        :pswitch_98
        :pswitch_96
        :pswitch_98
    .end packed-switch

    .line 1256
    :pswitch_data_32e
    .packed-switch 0x0
        :pswitch_2f4
        :pswitch_2fc
        :pswitch_304
        :pswitch_30c
    .end packed-switch
.end method


# virtual methods
.method getDataCodingScheme()I
    .registers 2

    .prologue
    .line 876
    iget v0, p0, Lcom/movial/ipphone/IPSmsMessage;->dataCodingScheme:I

    return v0
.end method

.method public getMessageClass()Lcom/android/internal/telephony/SmsConstants$MessageClass;
    .registers 2

    .prologue
    .line 1278
    iget-object v0, p0, Lcom/movial/ipphone/IPSmsMessage;->messageClass:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    return-object v0
.end method

.method public getMessageIdentifier()I
    .registers 2

    .prologue
    .line 868
    const/4 v0, 0x0

    return v0
.end method

.method public getMessagePriority()I
    .registers 2

    .prologue
    .line 1299
    const/4 v0, 0x0

    return v0
.end method

.method public getProtocolIdentifier()I
    .registers 2

    .prologue
    .line 864
    iget v0, p0, Lcom/movial/ipphone/IPSmsMessage;->protocolIdentifier:I

    return v0
.end method

.method public getStatus()I
    .registers 2

    .prologue
    .line 939
    iget v0, p0, Lcom/movial/ipphone/IPSmsMessage;->status:I

    return v0
.end method

.method public isCphsMwiMessage()Z
    .registers 2

    .prologue
    .line 890
    iget-object v0, p0, Lcom/android/internal/telephony/SmsMessageBase;->mOriginatingAddress:Lcom/android/internal/telephony/SmsAddress;

    check-cast v0, Lcom/android/internal/telephony/gsm/GsmSmsAddress;

    invoke-virtual {v0}, Lcom/android/internal/telephony/gsm/GsmSmsAddress;->isCphsVoiceMessageClear()Z

    move-result v0

    if-nez v0, :cond_14

    iget-object v0, p0, Lcom/android/internal/telephony/SmsMessageBase;->mOriginatingAddress:Lcom/android/internal/telephony/SmsAddress;

    check-cast v0, Lcom/android/internal/telephony/gsm/GsmSmsAddress;

    invoke-virtual {v0}, Lcom/android/internal/telephony/gsm/GsmSmsAddress;->isCphsVoiceMessageSet()Z

    move-result v0

    if-eqz v0, :cond_16

    :cond_14
    const/4 v0, 0x1

    :goto_15
    return v0

    :cond_16
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public isMWIClearMessage()Z
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 897
    iget-boolean v0, p0, Lcom/android/internal/telephony/SmsMessageBase;->mIsMwi:Z

    if-eqz v0, :cond_a

    iget-boolean v0, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMwiSense:Z

    if-nez v0, :cond_a

    .line 901
    :goto_9
    return v1

    :cond_a
    iget-object v0, p0, Lcom/android/internal/telephony/SmsMessageBase;->mOriginatingAddress:Lcom/android/internal/telephony/SmsAddress;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lcom/android/internal/telephony/SmsMessageBase;->mOriginatingAddress:Lcom/android/internal/telephony/SmsAddress;

    check-cast v0, Lcom/android/internal/telephony/gsm/GsmSmsAddress;

    invoke-virtual {v0}, Lcom/android/internal/telephony/gsm/GsmSmsAddress;->isCphsVoiceMessageClear()Z

    move-result v0

    if-eqz v0, :cond_1b

    move v0, v1

    :goto_19
    move v1, v0

    goto :goto_9

    :cond_1b
    const/4 v0, 0x0

    goto :goto_19
.end method

.method public isMWISetMessage()Z
    .registers 3

    .prologue
    const/4 v1, 0x1

    .line 908
    iget-boolean v0, p0, Lcom/android/internal/telephony/SmsMessageBase;->mIsMwi:Z

    if-eqz v0, :cond_a

    iget-boolean v0, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMwiSense:Z

    if-eqz v0, :cond_a

    .line 912
    :goto_9
    return v1

    :cond_a
    iget-object v0, p0, Lcom/android/internal/telephony/SmsMessageBase;->mOriginatingAddress:Lcom/android/internal/telephony/SmsAddress;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Lcom/android/internal/telephony/SmsMessageBase;->mOriginatingAddress:Lcom/android/internal/telephony/SmsAddress;

    check-cast v0, Lcom/android/internal/telephony/gsm/GsmSmsAddress;

    invoke-virtual {v0}, Lcom/android/internal/telephony/gsm/GsmSmsAddress;->isCphsVoiceMessageSet()Z

    move-result v0

    if-eqz v0, :cond_1b

    move v0, v1

    :goto_19
    move v1, v0

    goto :goto_9

    :cond_1b
    const/4 v0, 0x0

    goto :goto_19
.end method

.method public isMwiDontStore()Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    .line 919
    iget-boolean v1, p0, Lcom/android/internal/telephony/SmsMessageBase;->mIsMwi:Z

    if-eqz v1, :cond_a

    iget-boolean v1, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMwiDontStore:Z

    if-eqz v1, :cond_a

    .line 933
    :cond_9
    :goto_9
    return v0

    .line 923
    :cond_a
    invoke-virtual {p0}, Lcom/movial/ipphone/IPSmsMessage;->isCphsMwiMessage()Z

    move-result v1

    if-eqz v1, :cond_1d

    .line 927
    const-string v1, " "

    invoke-virtual {p0}, Lcom/android/internal/telephony/SmsMessageBase;->getMessageBody()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_9

    goto :goto_9

    .line 933
    :cond_1d
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public isReplace()Z
    .registers 3

    .prologue
    .line 882
    iget v0, p0, Lcom/movial/ipphone/IPSmsMessage;->protocolIdentifier:I

    and-int/lit16 v0, v0, 0xc0

    const/16 v1, 0x40

    if-ne v0, v1, :cond_18

    iget v0, p0, Lcom/movial/ipphone/IPSmsMessage;->protocolIdentifier:I

    and-int/lit8 v0, v0, 0x3f

    if-lez v0, :cond_18

    iget v0, p0, Lcom/movial/ipphone/IPSmsMessage;->protocolIdentifier:I

    and-int/lit8 v0, v0, 0x3f

    const/16 v1, 0x8

    if-ge v0, v1, :cond_18

    const/4 v0, 0x1

    :goto_17
    return v0

    :cond_18
    const/4 v0, 0x0

    goto :goto_17
.end method

.method public isReplyPathPresent()Z
    .registers 2

    .prologue
    .line 951
    iget-boolean v0, p0, Lcom/movial/ipphone/IPSmsMessage;->replyPathPresent:Z

    return v0
.end method

.method public isStatusReportMessage()Z
    .registers 2

    .prologue
    .line 945
    iget-boolean v0, p0, Lcom/movial/ipphone/IPSmsMessage;->isStatusReportMessage:Z

    return v0
.end method

.method public isTypeZero()Z
    .registers 3

    .prologue
    .line 161
    iget v0, p0, Lcom/movial/ipphone/IPSmsMessage;->protocolIdentifier:I

    const/16 v1, 0x40

    if-ne v0, v1, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method isUsimDataDownload()Z
    .registers 3

    .prologue
    .line 1288
    iget-object v0, p0, Lcom/movial/ipphone/IPSmsMessage;->messageClass:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    sget-object v1, Lcom/android/internal/telephony/SmsConstants$MessageClass;->CLASS_2:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    if-ne v0, v1, :cond_14

    iget v0, p0, Lcom/movial/ipphone/IPSmsMessage;->protocolIdentifier:I

    const/16 v1, 0x7f

    if-eq v0, v1, :cond_12

    iget v0, p0, Lcom/movial/ipphone/IPSmsMessage;->protocolIdentifier:I

    const/16 v1, 0x7c

    if-ne v0, v1, :cond_14

    :cond_12
    const/4 v0, 0x1

    :goto_13
    return v0

    :cond_14
    const/4 v0, 0x0

    goto :goto_13
.end method
