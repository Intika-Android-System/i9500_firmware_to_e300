.class public Lcom/android/internal/telephony/gsm/SmsMessage;
.super Lcom/android/internal/telephony/SmsMessageBase;
.source "SmsMessage.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;,
        Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;,
        Lcom/android/internal/telephony/gsm/SmsMessage$DeliverPdu;
    }
.end annotation


# static fields
#the value of this static final field might be set in the static constructor
.field private static final CSCFEATURE_RIL_SPECIAL_ADDRESS_HANDLINGFOR:Z = false

.field private static DBG:Z = false

.field static final LOG_TAG:Ljava/lang/String; = "SmsMessage"

.field private static final VDBG:Z

.field public static mDay:I

.field public static mHour:I

.field public static mMin:I

.field public static mMonth:I

.field public static mSec:I

.field public static mTimezone:I

.field public static mYear:I

.field private static unsupportedDatacodingScheme:Z


# instance fields
.field private automaticDeletion:Z

.field private dischargeTimeMillis:J

.field private forSubmit:Z

.field private mDataCodingScheme:I

.field private mIsStatusReportMessage:Z

.field private mProtocolIdentifier:I

.field private mRecipientAddress:Lcom/android/internal/telephony/gsm/GsmSmsAddress;

.field private mReplyPathPresent:Z

.field private mStatus:I

.field private messageClass:Lcom/android/internal/telephony/SmsConstants$MessageClass;

.field protected numberOfMessages:I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v0, 0x0

    .line 119
    sput-boolean v0, Lcom/android/internal/telephony/gsm/SmsMessage;->unsupportedDatacodingScheme:Z

    .line 130
    sput-boolean v0, Lcom/android/internal/telephony/gsm/SmsMessage;->DBG:Z

    .line 168
    const-string v0, "CTC"

    invoke-static {}, Lcom/sec/android/app/CscFeature;->getInstance()Lcom/sec/android/app/CscFeature;

    move-result-object v1

    const-string v2, "CscFeature_RIL_SpecialAddressHandlingFor"

    invoke-virtual {v1, v2}, Lcom/sec/android/app/CscFeature;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    sput-boolean v0, Lcom/android/internal/telephony/gsm/SmsMessage;->CSCFEATURE_RIL_SPECIAL_ADDRESS_HANDLINGFOR:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 77
    invoke-direct {p0}, Lcom/android/internal/telephony/SmsMessageBase;-><init>()V

    .line 100
    iput-boolean v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mReplyPathPresent:Z

    .line 116
    iput-boolean v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mIsStatusReportMessage:Z

    .line 165
    const/16 v0, 0xff

    iput v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->numberOfMessages:I

    .line 610
    return-void
.end method

.method private static ChangeGsmCharCodetoUnicode([B)Ljava/lang/String;
    .registers 14
    .parameter "message"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/EncodeException;
        }
    .end annotation

    .prologue
    .line 2598
    const/4 v3, 0x0

    .line 2599
    .local v3, dataCnt:I
    const/4 v5, 0x0

    .line 2600
    .local v5, offset:I
    const/4 v0, 0x0

    .line 2601
    .local v0, charPlace:I
    const/4 v8, 0x2

    new-array v7, v8, [B

    fill-array-data v7, :array_150

    .line 2602
    .local v7, yenByteData:[B
    const-string v6, ""

    .line 2603
    .local v6, responseData:Ljava/lang/String;
    const/4 v2, 0x0

    .line 2604
    .local v2, compChar:C
    const-string v1, ""

    .line 2606
    .local v1, chgData:Ljava/lang/String;
    const/4 v0, 0x0

    :goto_f
    array-length v8, p0

    if-ge v0, v8, :cond_10e

    .line 2607
    aget-byte v8, p0, v0

    invoke-static {v8}, Lcom/android/internal/telephony/gsm/SmsMessage;->isSJIS2ByeteCharactor(B)Z

    move-result v8

    if-eqz v8, :cond_88

    .line 2609
    aget-byte v8, p0, v0

    and-int/lit16 v8, v8, 0xff

    shl-int/lit8 v8, v8, 0x8

    int-to-char v2, v8

    .line 2610
    add-int/lit8 v8, v0, 0x1

    aget-byte v8, p0, v8

    and-int/lit16 v8, v8, 0xff

    int-to-char v8, v8

    or-int/2addr v8, v2

    int-to-char v2, v8

    .line 2612
    invoke-static {v2}, Lcom/kddi/android/internal/telephony/KddiSmsDataConvertor;->getReceiveEmojiChange(C)Ljava/lang/String;

    move-result-object v1

    .line 2613
    if-eqz v1, :cond_62

    .line 2615
    sub-int v3, v0, v5

    .line 2616
    array-length v8, p0

    if-ge v5, v8, :cond_4f

    if-eqz v3, :cond_4f

    .line 2618
    :try_start_37
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    new-instance v9, Ljava/lang/String;

    const-string v10, "sjis"

    invoke-direct {v9, p0, v5, v3, v10}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_4e
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_37 .. :try_end_4e} :catch_67

    move-result-object v6

    .line 2624
    :cond_4f
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 2625
    add-int/lit8 v5, v0, 0x2

    .line 2628
    :cond_62
    add-int/lit8 v0, v0, 0x1

    .line 2606
    :cond_64
    :goto_64
    add-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 2619
    :catch_67
    move-exception v4

    .line 2620
    .local v4, ex:Ljava/io/UnsupportedEncodingException;
    const-string v8, "SmsMessage"

    const-string v9, "ChangeGsmCharCodetoUnicode() SJIS decode failed"

    invoke-static {v8, v9}, Landroid/util/secutil/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2621
    new-instance v8, Lcom/android/internal/telephony/EncodeException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "SJIS decode failed: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/android/internal/telephony/EncodeException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 2630
    .end local v4           #ex:Ljava/io/UnsupportedEncodingException;
    :cond_88
    aget-byte v8, p0, v0

    and-int/lit16 v8, v8, 0xff

    const/16 v9, 0x5c

    if-ne v8, v9, :cond_64

    .line 2631
    sub-int v3, v0, v5

    .line 2632
    array-length v8, p0

    if-ge v5, v8, :cond_c9

    .line 2633
    if-eqz v3, :cond_af

    .line 2635
    :try_start_97
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    new-instance v9, Ljava/lang/String;

    const-string v10, "sjis"

    invoke-direct {v9, p0, v5, v3, v10}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_ae
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_97 .. :try_end_ae} :catch_cc

    move-result-object v6

    .line 2642
    :cond_af
    :try_start_af
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    new-instance v9, Ljava/lang/String;

    const/4 v10, 0x0

    array-length v11, v7

    const-string v12, "utf-8"

    invoke-direct {v9, v7, v10, v11, v12}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_c8
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_af .. :try_end_c8} :catch_ed

    move-result-object v6

    .line 2648
    :cond_c9
    add-int/lit8 v5, v0, 0x1

    goto :goto_64

    .line 2636
    :catch_cc
    move-exception v4

    .line 2637
    .restart local v4       #ex:Ljava/io/UnsupportedEncodingException;
    const-string v8, "SmsMessage"

    const-string v9, "ChangeGsmCharCodetoUnicode() SJIS decode failed"

    invoke-static {v8, v9}, Landroid/util/secutil/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2638
    new-instance v8, Lcom/android/internal/telephony/EncodeException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "SJIS decode failed: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/android/internal/telephony/EncodeException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 2643
    .end local v4           #ex:Ljava/io/UnsupportedEncodingException;
    :catch_ed
    move-exception v4

    .line 2644
    .restart local v4       #ex:Ljava/io/UnsupportedEncodingException;
    const-string v8, "SmsMessage"

    const-string v9, "ChangeGsmCharCodetoUnicode() utf-8 decode failed"

    invoke-static {v8, v9}, Landroid/util/secutil/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2645
    new-instance v8, Lcom/android/internal/telephony/EncodeException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "SJIS decode failed: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/android/internal/telephony/EncodeException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 2652
    .end local v4           #ex:Ljava/io/UnsupportedEncodingException;
    :cond_10e
    sub-int v3, v0, v5

    .line 2653
    array-length v8, p0

    if-ge v5, v8, :cond_12d

    if-eqz v3, :cond_12d

    .line 2655
    :try_start_115
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    new-instance v9, Ljava/lang/String;

    const-string v10, "sjis"

    invoke-direct {v9, p0, v5, v3, v10}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_12c
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_115 .. :try_end_12c} :catch_12e

    move-result-object v6

    .line 2661
    :cond_12d
    return-object v6

    .line 2656
    :catch_12e
    move-exception v4

    .line 2657
    .restart local v4       #ex:Ljava/io/UnsupportedEncodingException;
    const-string v8, "SmsMessage"

    const-string v9, "ChangeGsmCharCodetoUnicode() SJIS decode failed"

    invoke-static {v8, v9}, Landroid/util/secutil/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 2658
    new-instance v8, Lcom/android/internal/telephony/EncodeException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "SJIS decode failed: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/android/internal/telephony/EncodeException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 2601
    nop

    :array_150
    .array-data 0x1
        0xc2t
        0xa5t
    .end array-data
.end method

.method public static ConvertDateStringToBCD(Ljava/lang/String;)[B
    .registers 20
    .parameter "mDate"

    .prologue
    .line 2326
    const-string v14, "SmsMessage"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "date : "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 2328
    const/4 v14, 0x0

    const/4 v15, 0x2

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 2329
    .local v12, year:Ljava/lang/String;
    const/4 v14, 0x2

    const/4 v15, 0x4

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 2330
    .local v4, month:Ljava/lang/String;
    const/4 v14, 0x4

    const/4 v15, 0x6

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 2331
    .local v1, day:Ljava/lang/String;
    const/4 v14, 0x6

    const/16 v15, 0x8

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 2332
    .local v2, hour:Ljava/lang/String;
    const/16 v14, 0x8

    const/16 v15, 0xa

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 2333
    .local v3, min:Ljava/lang/String;
    const/16 v14, 0xa

    const/16 v15, 0xc

    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 2335
    .local v5, sec:Ljava/lang/String;
    const-string v14, "SmsMessage"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "1. year:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " month:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " day:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " hour:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " min:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " sec:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 2338
    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    invoke-static {v14}, Lcom/android/internal/telephony/gsm/SmsMessage;->decToBcd(I)I

    move-result v14

    sput v14, Lcom/android/internal/telephony/gsm/SmsMessage;->mYear:I

    .line 2339
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    invoke-static {v14}, Lcom/android/internal/telephony/gsm/SmsMessage;->decToBcd(I)I

    move-result v14

    sput v14, Lcom/android/internal/telephony/gsm/SmsMessage;->mMonth:I

    .line 2340
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    invoke-static {v14}, Lcom/android/internal/telephony/gsm/SmsMessage;->decToBcd(I)I

    move-result v14

    sput v14, Lcom/android/internal/telephony/gsm/SmsMessage;->mDay:I

    .line 2341
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    invoke-static {v14}, Lcom/android/internal/telephony/gsm/SmsMessage;->decToBcd(I)I

    move-result v14

    sput v14, Lcom/android/internal/telephony/gsm/SmsMessage;->mHour:I

    .line 2342
    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    invoke-static {v14}, Lcom/android/internal/telephony/gsm/SmsMessage;->decToBcd(I)I

    move-result v14

    sput v14, Lcom/android/internal/telephony/gsm/SmsMessage;->mMin:I

    .line 2343
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    invoke-static {v14}, Lcom/android/internal/telephony/gsm/SmsMessage;->decToBcd(I)I

    move-result v14

    sput v14, Lcom/android/internal/telephony/gsm/SmsMessage;->mSec:I

    .line 2344
    const/4 v14, 0x0

    sput v14, Lcom/android/internal/telephony/gsm/SmsMessage;->mTimezone:I

    .line 2346
    const/4 v13, 0x0

    .line 2347
    .local v13, zone:Ljava/util/TimeZone;
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v13

    .line 2350
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    invoke-virtual {v13, v14, v15}, Ljava/util/TimeZone;->getOffset(J)I

    move-result v14

    int-to-long v10, v14

    .line 2351
    .local v10, tzOffset:J
    const-string v14, "SmsMessage"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "timezeone"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 2352
    const-wide/16 v14, 0x0

    cmp-long v14, v10, v14

    if-gez v14, :cond_2ec

    .line 2353
    neg-long v10, v10

    .line 2354
    const-wide/32 v14, 0xdbba0

    div-long v6, v10, v14

    .line 2355
    .local v6, temp:J
    const-string v14, "SmsMessage"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "timezeone->temp"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 2356
    long-to-int v14, v6

    invoke-static {v14}, Lcom/android/internal/telephony/gsm/SmsMessage;->decToBcd(I)I

    move-result v8

    .line 2357
    .local v8, temp2:I
    div-int/lit8 v14, v8, 0xa

    shl-int/lit8 v14, v14, 0x4

    rem-int/lit8 v15, v8, 0xa

    add-int/lit8 v15, v15, 0x8

    add-int/2addr v14, v15

    sput v14, Lcom/android/internal/telephony/gsm/SmsMessage;->mTimezone:I

    .line 2358
    const-string v14, "SmsMessage"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "mTimezone"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sget v16, Lcom/android/internal/telephony/gsm/SmsMessage;->mTimezone:I

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 2359
    const-string v14, "SmsMessage"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "2. year:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sget v16, Lcom/android/internal/telephony/gsm/SmsMessage;->mYear:I

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " month:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sget v16, Lcom/android/internal/telephony/gsm/SmsMessage;->mMonth:I

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " day:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sget v16, Lcom/android/internal/telephony/gsm/SmsMessage;->mDay:I

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " hour:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sget v16, Lcom/android/internal/telephony/gsm/SmsMessage;->mHour:I

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " min:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sget v16, Lcom/android/internal/telephony/gsm/SmsMessage;->mMin:I

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " sec:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sget v16, Lcom/android/internal/telephony/gsm/SmsMessage;->mSec:I

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 2362
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v14

    invoke-virtual {v14}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v14

    const-string v15, "ar"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_22c

    .line 2363
    const-string v14, "SmsMessage"

    const-string v15, "This is timestamp in Arabic."

    invoke-static {v14, v15}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 2364
    sget-object v14, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v15, "%02d%02d%02d%02d%02d%02d%02x"

    const/16 v16, 0x7

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mYear:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mMonth:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x2

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mDay:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x3

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mHour:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x4

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mMin:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x5

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mSec:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x6

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mTimezone:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v14 .. v16}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 2390
    .end local v8           #temp2:I
    .local v9, timestamp:Ljava/lang/String;
    :goto_20f
    const-string v14, "SmsMessage"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "timestamp string: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 2392
    invoke-static {v9}, Lcom/android/internal/telephony/uicc/IccUtils;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v14

    return-object v14

    .line 2365
    .end local v9           #timestamp:Ljava/lang/String;
    .restart local v8       #temp2:I
    :cond_22c
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v14

    invoke-virtual {v14}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v14

    const-string v15, "fa"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_29b

    .line 2366
    const-string v14, "SmsMessage"

    const-string v15, "This is timestamp in Farsi."

    invoke-static {v14, v15}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 2367
    sget-object v14, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v15, "%02d%02d%02d%02d%02d%02d%02x"

    const/16 v16, 0x7

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mYear:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mMonth:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x2

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mDay:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x3

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mHour:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x4

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mMin:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x5

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mSec:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x6

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mTimezone:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v14 .. v16}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .restart local v9       #timestamp:Ljava/lang/String;
    goto/16 :goto_20f

    .line 2369
    .end local v9           #timestamp:Ljava/lang/String;
    :cond_29b
    const-string v14, "%02d%02d%02d%02d%02d%02d%02x"

    const/4 v15, 0x7

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    sget v17, Lcom/android/internal/telephony/gsm/SmsMessage;->mYear:I

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x1

    sget v17, Lcom/android/internal/telephony/gsm/SmsMessage;->mMonth:I

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x2

    sget v17, Lcom/android/internal/telephony/gsm/SmsMessage;->mDay:I

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x3

    sget v17, Lcom/android/internal/telephony/gsm/SmsMessage;->mHour:I

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x4

    sget v17, Lcom/android/internal/telephony/gsm/SmsMessage;->mMin:I

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x5

    sget v17, Lcom/android/internal/telephony/gsm/SmsMessage;->mSec:I

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x6

    sget v17, Lcom/android/internal/telephony/gsm/SmsMessage;->mTimezone:I

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .restart local v9       #timestamp:Ljava/lang/String;
    goto/16 :goto_20f

    .line 2372
    .end local v6           #temp:J
    .end local v8           #temp2:I
    .end local v9           #timestamp:Ljava/lang/String;
    :cond_2ec
    const-wide/32 v14, 0xdbba0

    div-long v6, v10, v14

    .line 2373
    .restart local v6       #temp:J
    const-string v14, "SmsMessage"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "timezeone->temp"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 2374
    long-to-int v14, v6

    invoke-static {v14}, Lcom/android/internal/telephony/gsm/SmsMessage;->decToBcd(I)I

    move-result v14

    sput v14, Lcom/android/internal/telephony/gsm/SmsMessage;->mTimezone:I

    .line 2375
    const-string v14, "SmsMessage"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "mTimezone"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sget v16, Lcom/android/internal/telephony/gsm/SmsMessage;->mTimezone:I

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 2376
    const-string v14, "SmsMessage"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "2. year:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sget v16, Lcom/android/internal/telephony/gsm/SmsMessage;->mYear:I

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " month:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sget v16, Lcom/android/internal/telephony/gsm/SmsMessage;->mMonth:I

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " day:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sget v16, Lcom/android/internal/telephony/gsm/SmsMessage;->mDay:I

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " hour:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sget v16, Lcom/android/internal/telephony/gsm/SmsMessage;->mHour:I

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " min:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sget v16, Lcom/android/internal/telephony/gsm/SmsMessage;->mMin:I

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " sec:"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    sget v16, Lcom/android/internal/telephony/gsm/SmsMessage;->mSec:I

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 2379
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v14

    invoke-virtual {v14}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v14

    const-string v15, "ar"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_3ef

    .line 2380
    const-string v14, "SmsMessage"

    const-string v15, "This is timestamp in Arabic."

    invoke-static {v14, v15}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 2381
    sget-object v14, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v15, "%02d%02d%02d%02d%02d%02d%02d"

    const/16 v16, 0x7

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mYear:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mMonth:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x2

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mDay:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x3

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mHour:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x4

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mMin:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x5

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mSec:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x6

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mTimezone:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v14 .. v16}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .restart local v9       #timestamp:Ljava/lang/String;
    goto/16 :goto_20f

    .line 2382
    .end local v9           #timestamp:Ljava/lang/String;
    :cond_3ef
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v14

    invoke-virtual {v14}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    move-result-object v14

    const-string v15, "fa"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_45e

    .line 2383
    const-string v14, "SmsMessage"

    const-string v15, "This is timestamp in Farsi."

    invoke-static {v14, v15}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 2384
    sget-object v14, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v15, "%02d%02d%02d%02d%02d%02d%02d"

    const/16 v16, 0x7

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mYear:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mMonth:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x2

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mDay:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x3

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mHour:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x4

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mMin:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x5

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mSec:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x6

    sget v18, Lcom/android/internal/telephony/gsm/SmsMessage;->mTimezone:I

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v14 .. v16}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .restart local v9       #timestamp:Ljava/lang/String;
    goto/16 :goto_20f

    .line 2386
    .end local v9           #timestamp:Ljava/lang/String;
    :cond_45e
    const-string v14, "%02d%02d%02d%02d%02d%02d%02d"

    const/4 v15, 0x7

    new-array v15, v15, [Ljava/lang/Object;

    const/16 v16, 0x0

    sget v17, Lcom/android/internal/telephony/gsm/SmsMessage;->mYear:I

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x1

    sget v17, Lcom/android/internal/telephony/gsm/SmsMessage;->mMonth:I

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x2

    sget v17, Lcom/android/internal/telephony/gsm/SmsMessage;->mDay:I

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x3

    sget v17, Lcom/android/internal/telephony/gsm/SmsMessage;->mHour:I

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x4

    sget v17, Lcom/android/internal/telephony/gsm/SmsMessage;->mMin:I

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x5

    sget v17, Lcom/android/internal/telephony/gsm/SmsMessage;->mSec:I

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    const/16 v16, 0x6

    sget v17, Lcom/android/internal/telephony/gsm/SmsMessage;->mTimezone:I

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v17

    aput-object v17, v15, v16

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .restart local v9       #timestamp:Ljava/lang/String;
    goto/16 :goto_20f
.end method

.method static synthetic access$000()Z
    .registers 1

    .prologue
    .line 77
    sget-boolean v0, Lcom/android/internal/telephony/gsm/SmsMessage;->unsupportedDatacodingScheme:Z

    return v0
.end method

.method static synthetic access$100([B)Ljava/lang/String;
    .registers 2
    .parameter "x0"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/EncodeException;
        }
    .end annotation

    .prologue
    .line 77
    invoke-static {p0}, Lcom/android/internal/telephony/gsm/SmsMessage;->ChangeGsmCharCodetoUnicode([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static calculateLength(Ljava/lang/CharSequence;Z)Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    .registers 5
    .parameter "msgBody"
    .parameter "use7bitOnly"

    .prologue
    .line 991
    invoke-static {p0, p1}, Lcom/android/internal/telephony/GsmAlphabet;->CountGsmSeptets(Ljava/lang/CharSequence;Z)Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;

    move-result-object v1

    .line 992
    .local v1, ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    if-nez v1, :cond_2d

    .line 993
    new-instance v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;

    .end local v1           #ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    invoke-direct {v1}, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;-><init>()V

    .line 994
    .restart local v1       #ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    mul-int/lit8 v0, v2, 0x2

    .line 995
    .local v0, octets:I
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    iput v2, v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitCount:I

    .line 996
    const/16 v2, 0x8c

    if-le v0, v2, :cond_2e

    .line 997
    add-int/lit16 v2, v0, 0x85

    div-int/lit16 v2, v2, 0x86

    iput v2, v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->msgCount:I

    .line 999
    iget v2, v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->msgCount:I

    mul-int/lit16 v2, v2, 0x86

    sub-int/2addr v2, v0

    div-int/lit8 v2, v2, 0x2

    iput v2, v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitsRemaining:I

    .line 1005
    :goto_2a
    const/4 v2, 0x3

    iput v2, v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitSize:I

    .line 1007
    .end local v0           #octets:I
    :cond_2d
    return-object v1

    .line 1002
    .restart local v0       #octets:I
    :cond_2e
    const/4 v2, 0x1

    iput v2, v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->msgCount:I

    .line 1003
    rsub-int v2, v0, 0x8c

    div-int/lit8 v2, v2, 0x2

    iput v2, v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitsRemaining:I

    goto :goto_2a
.end method

.method public static calculateLength(Ljava/lang/CharSequence;ZI)Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    .registers 7
    .parameter "msgBody"
    .parameter "use7bitOnly"
    .parameter "encodingType"

    .prologue
    const/4 v3, 0x1

    .line 1661
    new-instance v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;

    invoke-direct {v1}, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;-><init>()V

    .line 1663
    .local v1, ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    if-ne p2, v3, :cond_33

    .line 1664
    const/4 v1, 0x0

    .line 1672
    :goto_9
    if-nez v1, :cond_32

    .line 1673
    new-instance v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;

    .end local v1           #ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    invoke-direct {v1}, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;-><init>()V

    .line 1674
    .restart local v1       #ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    mul-int/lit8 v0, v2, 0x2

    .line 1675
    .local v0, octets:I
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v2

    iput v2, v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitCount:I

    .line 1676
    const/16 v2, 0x8c

    if-le v0, v2, :cond_3f

    .line 1677
    add-int/lit16 v2, v0, 0x85

    div-int/lit16 v2, v2, 0x86

    iput v2, v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->msgCount:I

    .line 1679
    iget v2, v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->msgCount:I

    mul-int/lit16 v2, v2, 0x86

    sub-int/2addr v2, v0

    div-int/lit8 v2, v2, 0x2

    iput v2, v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitsRemaining:I

    .line 1685
    :goto_2f
    const/4 v2, 0x3

    iput v2, v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitSize:I

    .line 1687
    .end local v0           #octets:I
    :cond_32
    return-object v1

    .line 1666
    :cond_33
    if-nez p2, :cond_3a

    .line 1667
    invoke-static {p0, v3}, Lcom/android/internal/telephony/GsmAlphabet;->CountGsmSeptets(Ljava/lang/CharSequence;Z)Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;

    move-result-object v1

    goto :goto_9

    .line 1670
    :cond_3a
    invoke-static {p0, p1}, Lcom/android/internal/telephony/GsmAlphabet;->CountGsmSeptets(Ljava/lang/CharSequence;Z)Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;

    move-result-object v1

    goto :goto_9

    .line 1682
    .restart local v0       #octets:I
    :cond_3f
    iput v3, v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->msgCount:I

    .line 1683
    rsub-int v2, v0, 0x8c

    div-int/lit8 v2, v2, 0x2

    iput v2, v1, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitsRemaining:I

    goto :goto_2f
.end method

.method public static calculateLengthWithEmail(Ljava/lang/CharSequence;ZI)Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    .registers 10
    .parameter "msgBody"
    .parameter "use7bitOnly"
    .parameter "maxEmailLen"

    .prologue
    const/16 v6, 0x3e8

    const/4 v5, -0x1

    .line 1703
    invoke-static {p0, p1, p2}, Lcom/android/internal/telephony/GsmAlphabet;->CountGsmSeptetsWithEmail(Ljava/lang/CharSequence;ZI)Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;

    move-result-object v3

    .line 1704
    .local v3, ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    if-nez v3, :cond_35

    .line 1705
    new-instance v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;

    .end local v3           #ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    invoke-direct {v3}, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;-><init>()V

    .line 1706
    .restart local v3       #ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    mul-int/lit8 p2, p2, 0x2

    .line 1708
    if-lez p2, :cond_36

    rsub-int v4, p2, 0x8c

    add-int/lit8 v0, v4, -0x1

    .line 1710
    .local v0, maxLenPerSMS:I
    :goto_16
    if-lez p2, :cond_39

    rsub-int v4, p2, 0x86

    add-int/lit8 v1, v4, -0x1

    .line 1713
    .local v1, maxLenPerSMSWithHeader:I
    :goto_1c
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v4

    mul-int/lit8 v2, v4, 0x2

    .line 1714
    .local v2, octets:I
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v4

    iput v4, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitCount:I

    .line 1715
    if-le v2, v0, :cond_57

    .line 1716
    add-int/lit8 v4, v0, -0x2

    if-le p2, v4, :cond_3c

    .line 1717
    iput v6, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->msgCount:I

    .line 1718
    iput v5, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitsRemaining:I

    .line 1738
    :goto_32
    const/4 v4, 0x3

    iput v4, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitSize:I

    .line 1741
    .end local v0           #maxLenPerSMS:I
    .end local v1           #maxLenPerSMSWithHeader:I
    .end local v2           #octets:I
    :cond_35
    return-object v3

    .line 1708
    :cond_36
    const/16 v0, 0x8c

    goto :goto_16

    .line 1710
    .restart local v0       #maxLenPerSMS:I
    :cond_39
    const/16 v1, 0x86

    goto :goto_1c

    .line 1720
    .restart local v1       #maxLenPerSMSWithHeader:I
    .restart local v2       #octets:I
    :cond_3c
    rem-int v4, v2, v1

    if-eqz v4, :cond_4f

    .line 1721
    div-int v4, v2, v1

    add-int/lit8 v4, v4, 0x1

    iput v4, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->msgCount:I

    .line 1722
    rem-int v4, v2, v1

    sub-int v4, v1, v4

    div-int/lit8 v4, v4, 0x2

    iput v4, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitsRemaining:I

    goto :goto_32

    .line 1725
    :cond_4f
    div-int v4, v2, v1

    iput v4, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->msgCount:I

    .line 1726
    const/4 v4, 0x0

    iput v4, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitsRemaining:I

    goto :goto_32

    .line 1730
    :cond_57
    add-int/lit8 v4, v1, -0x2

    if-lt p2, v4, :cond_60

    .line 1731
    iput v6, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->msgCount:I

    .line 1732
    iput v5, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitsRemaining:I

    goto :goto_32

    .line 1734
    :cond_60
    const/4 v4, 0x1

    iput v4, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->msgCount:I

    .line 1735
    sub-int v4, v0, v2

    div-int/lit8 v4, v4, 0x2

    iput v4, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitsRemaining:I

    goto :goto_32
.end method

.method public static calculateLengthWithEmail(Ljava/lang/CharSequence;ZII)Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    .registers 12
    .parameter "msgBody"
    .parameter "use7bitOnly"
    .parameter "encodingType"
    .parameter "maxEmailLen"

    .prologue
    const/16 v7, 0x3e8

    const/4 v6, -0x1

    const/4 v5, 0x1

    .line 1757
    new-instance v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;

    invoke-direct {v3}, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;-><init>()V

    .line 1759
    .local v3, ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    if-ne p2, v5, :cond_3b

    .line 1760
    const/4 v3, 0x0

    .line 1767
    :goto_c
    if-nez v3, :cond_3a

    .line 1768
    new-instance v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;

    .end local v3           #ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    invoke-direct {v3}, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;-><init>()V

    .line 1769
    .restart local v3       #ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    mul-int/lit8 p3, p3, 0x2

    .line 1771
    if-lez p3, :cond_47

    rsub-int v4, p3, 0x8c

    add-int/lit8 v0, v4, -0x1

    .line 1773
    .local v0, maxLenPerSMS:I
    :goto_1b
    if-lez p3, :cond_4a

    rsub-int v4, p3, 0x86

    add-int/lit8 v1, v4, -0x1

    .line 1776
    .local v1, maxLenPerSMSWithHeader:I
    :goto_21
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v4

    mul-int/lit8 v2, v4, 0x2

    .line 1777
    .local v2, octets:I
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v4

    iput v4, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitCount:I

    .line 1778
    if-le v2, v0, :cond_68

    .line 1779
    add-int/lit8 v4, v0, -0x2

    if-le p3, v4, :cond_4d

    .line 1780
    iput v7, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->msgCount:I

    .line 1781
    iput v6, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitsRemaining:I

    .line 1801
    :goto_37
    const/4 v4, 0x3

    iput v4, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitSize:I

    .line 1804
    .end local v0           #maxLenPerSMS:I
    .end local v1           #maxLenPerSMSWithHeader:I
    .end local v2           #octets:I
    :cond_3a
    return-object v3

    .line 1761
    :cond_3b
    if-nez p2, :cond_42

    .line 1762
    invoke-static {p0, v5, p3}, Lcom/android/internal/telephony/GsmAlphabet;->CountGsmSeptetsWithEmail(Ljava/lang/CharSequence;ZI)Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;

    move-result-object v3

    goto :goto_c

    .line 1764
    :cond_42
    invoke-static {p0, p1, p3}, Lcom/android/internal/telephony/GsmAlphabet;->CountGsmSeptetsWithEmail(Ljava/lang/CharSequence;ZI)Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;

    move-result-object v3

    goto :goto_c

    .line 1771
    :cond_47
    const/16 v0, 0x8c

    goto :goto_1b

    .line 1773
    .restart local v0       #maxLenPerSMS:I
    :cond_4a
    const/16 v1, 0x86

    goto :goto_21

    .line 1783
    .restart local v1       #maxLenPerSMSWithHeader:I
    .restart local v2       #octets:I
    :cond_4d
    rem-int v4, v2, v1

    if-eqz v4, :cond_60

    .line 1784
    div-int v4, v2, v1

    add-int/lit8 v4, v4, 0x1

    iput v4, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->msgCount:I

    .line 1785
    rem-int v4, v2, v1

    sub-int v4, v1, v4

    div-int/lit8 v4, v4, 0x2

    iput v4, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitsRemaining:I

    goto :goto_37

    .line 1788
    :cond_60
    div-int v4, v2, v1

    iput v4, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->msgCount:I

    .line 1789
    const/4 v4, 0x0

    iput v4, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitsRemaining:I

    goto :goto_37

    .line 1793
    :cond_68
    add-int/lit8 v4, v1, -0x2

    if-lt p3, v4, :cond_71

    .line 1794
    iput v7, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->msgCount:I

    .line 1795
    iput v6, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitsRemaining:I

    goto :goto_37

    .line 1797
    :cond_71
    iput v5, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->msgCount:I

    .line 1798
    sub-int v4, v0, v2

    div-int/lit8 v4, v4, 0x2

    iput v4, v3, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitsRemaining:I

    goto :goto_37
.end method

.method public static createFromEfRecord(I[B)Lcom/android/internal/telephony/gsm/SmsMessage;
    .registers 10
    .parameter "index"
    .parameter "data"

    .prologue
    const/4 v4, 0x0

    .line 254
    :try_start_1
    new-instance v1, Lcom/android/internal/telephony/gsm/SmsMessage;

    invoke-direct {v1}, Lcom/android/internal/telephony/gsm/SmsMessage;-><init>()V

    .line 256
    .local v1, msg:Lcom/android/internal/telephony/gsm/SmsMessage;
    iput p0, v1, Lcom/android/internal/telephony/SmsMessageBase;->mIndexOnIcc:I

    .line 261
    const/4 v5, 0x0

    aget-byte v5, p1, v5

    and-int/lit8 v5, v5, 0x1

    if-nez v5, :cond_18

    .line 262
    const-string v5, "SmsMessage"

    const-string v6, "SMS parsing failed: Trying to parse a free record"

    invoke-static {v5, v6}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v1, v4

    .line 291
    .end local v1           #msg:Lcom/android/internal/telephony/gsm/SmsMessage;
    :goto_17
    return-object v1

    .line 266
    .restart local v1       #msg:Lcom/android/internal/telephony/gsm/SmsMessage;
    :cond_18
    const/4 v5, 0x0

    aget-byte v5, p1, v5

    and-int/lit8 v5, v5, 0x7

    iput v5, v1, Lcom/android/internal/telephony/SmsMessageBase;->mStatusOnIcc:I

    .line 269
    array-length v5, p1

    add-int/lit8 v3, v5, -0x1

    .line 273
    .local v3, size:I
    new-array v2, v3, [B

    .line 274
    .local v2, pdu:[B
    const/4 v5, 0x1

    const/4 v6, 0x0

    invoke-static {p1, v5, v2, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 275
    invoke-direct {v1, v2}, Lcom/android/internal/telephony/gsm/SmsMessage;->parsePdu([B)V

    .line 287
    const-string v5, "SmsMessage"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "mti: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v1, Lcom/android/internal/telephony/SmsMessageBase;->mMti:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " indexOnIcc :"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v1, Lcom/android/internal/telephony/SmsMessageBase;->mIndexOnIcc:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " statusOnIcc:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget v7, v1, Lcom/android/internal/telephony/SmsMessageBase;->mStatusOnIcc:I

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5e
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_5e} :catch_5f

    goto :goto_17

    .line 289
    .end local v1           #msg:Lcom/android/internal/telephony/gsm/SmsMessage;
    .end local v2           #pdu:[B
    .end local v3           #size:I
    :catch_5f
    move-exception v0

    .line 290
    .local v0, ex:Ljava/lang/RuntimeException;
    const-string v5, "SmsMessage"

    const-string v6, "SMS PDU parsing failed: "

    invoke-static {v5, v6, v0}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v1, v4

    .line 291
    goto :goto_17
.end method

.method public static createFromPdu([B)Lcom/android/internal/telephony/gsm/SmsMessage;
    .registers 7
    .parameter "pdu"

    .prologue
    const/4 v3, 0x0

    .line 186
    :try_start_1
    new-instance v2, Lcom/android/internal/telephony/gsm/SmsMessage;

    invoke-direct {v2}, Lcom/android/internal/telephony/gsm/SmsMessage;-><init>()V

    .line 187
    .local v2, msg:Lcom/android/internal/telephony/gsm/SmsMessage;
    invoke-direct {v2, p0}, Lcom/android/internal/telephony/gsm/SmsMessage;->parsePdu([B)V
    :try_end_9
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_9} :catch_a
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_9} :catch_14

    .line 194
    .end local v2           #msg:Lcom/android/internal/telephony/gsm/SmsMessage;
    :goto_9
    return-object v2

    .line 189
    :catch_a
    move-exception v1

    .line 190
    .local v1, ex:Ljava/lang/RuntimeException;
    const-string v4, "SmsMessage"

    const-string v5, "SMS PDU parsing failed: "

    invoke-static {v4, v5, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v2, v3

    .line 191
    goto :goto_9

    .line 192
    .end local v1           #ex:Ljava/lang/RuntimeException;
    :catch_14
    move-exception v0

    .line 193
    .local v0, e:Ljava/lang/OutOfMemoryError;
    const-string v4, "SmsMessage"

    const-string v5, "SMS PDU parsing failed with out of memory: "

    invoke-static {v4, v5, v0}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v2, v3

    .line 194
    goto :goto_9
.end method

.method private static decToBcd(I)I
    .registers 5
    .parameter "digit"

    .prologue
    .line 2309
    const/4 v1, 0x0

    .line 2310
    .local v1, left:I
    const/4 v2, 0x0

    .line 2311
    .local v2, right:I
    const/4 v0, 0x0

    .line 2313
    .local v0, bcd_value:I
    div-int/lit8 v1, p0, 0xa

    .line 2314
    rem-int/lit8 v2, p0, 0xa

    .line 2316
    mul-int/lit8 v3, v2, 0xa

    add-int v0, v3, v1

    .line 2318
    return v0
.end method

.method public static encodeGsmShiftJis(Ljava/lang/String;)[B
    .registers 16
    .parameter "message"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/EncodeException;
        }
    .end annotation

    .prologue
    .line 2679
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v12

    new-array v1, v12, [C

    .line 2680
    .local v1, buffer:[C
    const/4 v12, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v13

    const/4 v14, 0x0

    invoke-virtual {p0, v12, v13, v1, v14}, Ljava/lang/String;->getChars(II[CI)V

    .line 2682
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v12

    mul-int/lit8 v12, v12, 0x4

    new-array v10, v12, [B

    .line 2683
    .local v10, messageBuf:[B
    const/4 v3, 0x0

    .line 2684
    .local v3, count:I
    const/4 v11, 0x0

    .line 2687
    .local v11, start:I
    const/4 v8, 0x0

    .local v8, i:I
    :goto_1a
    :try_start_1a
    array-length v12, v1

    if-ge v8, v12, :cond_428

    .line 2719
    add-int/lit8 v12, v8, 0x1

    array-length v13, v1

    if-ge v12, v13, :cond_362

    aget-char v12, v1, v8

    add-int/lit8 v13, v8, 0x1

    aget-char v13, v1, v13

    invoke-static {v12, v13}, Ljava/lang/Character;->isSurrogatePair(CC)Z

    move-result v12

    if-eqz v12, :cond_362

    .line 2733
    aget-char v12, v1, v8

    const v13, 0xfffc

    and-int/2addr v12, v13

    const v13, 0xdbb8

    if-ne v12, v13, :cond_8a

    .line 2734
    aget-char v12, v1, v8

    and-int/lit8 v12, v12, 0x3

    add-int/lit8 v13, v8, 0x1

    aget-char v13, v1, v13

    invoke-static {v13}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/kddi/android/internal/telephony/KddiSmsDataConvertor;->getGooglePuaSurrogateEmoji(ILjava/lang/Character;)Ljava/lang/Character;

    move-result-object v2

    .line 2736
    .local v2, c:Ljava/lang/Character;
    if-eqz v2, :cond_87

    .line 2737
    if-ge v11, v8, :cond_472

    .line 2738
    sub-int v9, v8, v11

    .line 2739
    .local v9, len:I
    new-array v5, v9, [C

    .line 2740
    .local v5, dest:[C
    const/4 v12, 0x0

    invoke-static {v1, v11, v5, v12, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2742
    new-instance v12, Ljava/lang/String;

    invoke-direct {v12, v5}, Ljava/lang/String;-><init>([C)V

    const-string v13, "sjis"

    invoke-virtual {v12, v13}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 2743
    .local v0, b:[B
    const/4 v12, 0x0

    array-length v13, v0

    invoke-static {v0, v12, v10, v3, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2744
    array-length v12, v0

    add-int/2addr v3, v12

    move v4, v3

    .line 2747
    .end local v0           #b:[B
    .end local v3           #count:I
    .end local v5           #dest:[C
    .end local v9           #len:I
    .local v4, count:I
    :goto_68
    add-int/lit8 v3, v4, 0x1

    .end local v4           #count:I
    .restart local v3       #count:I
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    const v13, 0xff00

    and-int/2addr v12, v13

    shr-int/lit8 v12, v12, 0x8

    int-to-byte v12, v12

    aput-byte v12, v10, v4
    :try_end_77
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1a .. :try_end_77} :catch_44c

    .line 2748
    add-int/lit8 v4, v3, 0x1

    .end local v3           #count:I
    .restart local v4       #count:I
    :try_start_79
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    and-int/lit16 v12, v12, 0xff

    int-to-byte v12, v12

    aput-byte v12, v10, v3
    :try_end_82
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_79 .. :try_end_82} :catch_466

    .line 2749
    add-int/lit8 v8, v8, 0x1

    .line 2750
    add-int/lit8 v11, v8, 0x1

    move v3, v4

    .line 2687
    .end local v2           #c:Ljava/lang/Character;
    .end local v4           #count:I
    .restart local v3       #count:I
    :cond_87
    :goto_87
    add-int/lit8 v8, v8, 0x1

    goto :goto_1a

    .line 2764
    :cond_8a
    :try_start_8a
    aget-char v12, v1, v8

    const v13, 0xfffe

    and-int/2addr v12, v13

    const v13, 0xd83c

    if-ne v12, v13, :cond_87

    .line 2765
    aget-char v12, v1, v8

    and-int/lit8 v12, v12, 0x1

    add-int/lit8 v13, v8, 0x1

    aget-char v13, v1, v13

    invoke-static {v13}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/kddi/android/internal/telephony/KddiSmsDataConvertor;->getUnicodeSurrogateEmoji(ILjava/lang/Character;)Ljava/lang/Character;

    move-result-object v2

    .line 2766
    .restart local v2       #c:Ljava/lang/Character;
    if-eqz v2, :cond_87

    .line 2767
    if-ge v11, v8, :cond_46f

    .line 2768
    sub-int v9, v8, v11

    .line 2769
    .restart local v9       #len:I
    new-array v5, v9, [C

    .line 2770
    .restart local v5       #dest:[C
    const/4 v12, 0x0

    invoke-static {v1, v11, v5, v12, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2772
    new-instance v12, Ljava/lang/String;

    invoke-direct {v12, v5}, Ljava/lang/String;-><init>([C)V

    const-string v13, "sjis"

    invoke-virtual {v12, v13}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 2773
    .restart local v0       #b:[B
    const/4 v12, 0x0

    array-length v13, v0

    invoke-static {v0, v12, v10, v3, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2774
    array-length v12, v0
    :try_end_c2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_8a .. :try_end_c2} :catch_44c

    add-int/2addr v3, v12

    move v4, v3

    .line 2777
    .end local v0           #b:[B
    .end local v3           #count:I
    .end local v5           #dest:[C
    .end local v9           #len:I
    .restart local v4       #count:I
    :goto_c4
    :try_start_c4
    aget-char v12, v1, v8

    const v13, 0xd83c

    if-ne v12, v13, :cond_341

    add-int/lit8 v12, v8, 0x1

    aget-char v12, v1, v12

    const v13, 0xdde6

    if-lt v12, v13, :cond_341

    add-int/lit8 v12, v8, 0x1

    aget-char v12, v1, v12

    const v13, 0xddff

    if-gt v12, v13, :cond_341

    .line 2779
    add-int/lit8 v12, v8, 0x3

    array-length v13, v1

    if-ge v12, v13, :cond_341

    add-int/lit8 v12, v8, 0x2

    aget-char v12, v1, v12

    const v13, 0xd83c

    if-ne v12, v13, :cond_341

    add-int/lit8 v12, v8, 0x3

    aget-char v12, v1, v12

    const v13, 0xdde6

    if-lt v12, v13, :cond_341

    add-int/lit8 v12, v8, 0x3

    aget-char v12, v1, v12

    const v13, 0xddff

    if-gt v12, v13, :cond_341

    .line 2782
    add-int/lit8 v12, v8, 0x1

    aget-char v12, v1, v12

    const v13, 0xdde8

    if-ne v12, v13, :cond_137

    add-int/lit8 v12, v8, 0x3

    aget-char v12, v1, v12

    const v13, 0xddf3

    if-ne v12, v13, :cond_137

    .line 2783
    const v12, 0xf3d2

    invoke-static {v12}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;
    :try_end_115
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_c4 .. :try_end_115} :catch_466

    move-result-object v2

    .line 2784
    add-int/lit8 v3, v4, 0x1

    .end local v4           #count:I
    .restart local v3       #count:I
    :try_start_118
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    const v13, 0xff00

    and-int/2addr v12, v13

    shr-int/lit8 v12, v12, 0x8

    int-to-byte v12, v12

    aput-byte v12, v10, v4
    :try_end_125
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_118 .. :try_end_125} :catch_44c

    .line 2785
    add-int/lit8 v4, v3, 0x1

    .end local v3           #count:I
    .restart local v4       #count:I
    :try_start_127
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    and-int/lit16 v12, v12, 0xff

    int-to-byte v12, v12

    aput-byte v12, v10, v3

    .line 2786
    add-int/lit8 v8, v8, 0x3

    .line 2787
    add-int/lit8 v11, v8, 0x1

    move v3, v4

    .line 2788
    .end local v4           #count:I
    .restart local v3       #count:I
    goto/16 :goto_87

    .line 2789
    .end local v3           #count:I
    .restart local v4       #count:I
    :cond_137
    add-int/lit8 v12, v8, 0x1

    aget-char v12, v1, v12

    const v13, 0xdde9

    if-ne v12, v13, :cond_171

    add-int/lit8 v12, v8, 0x3

    aget-char v12, v1, v12

    const v13, 0xddea

    if-ne v12, v13, :cond_171

    .line 2790
    const v12, 0xf3cf

    invoke-static {v12}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;
    :try_end_14f
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_127 .. :try_end_14f} :catch_466

    move-result-object v2

    .line 2791
    add-int/lit8 v3, v4, 0x1

    .end local v4           #count:I
    .restart local v3       #count:I
    :try_start_152
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    const v13, 0xff00

    and-int/2addr v12, v13

    shr-int/lit8 v12, v12, 0x8

    int-to-byte v12, v12

    aput-byte v12, v10, v4
    :try_end_15f
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_152 .. :try_end_15f} :catch_44c

    .line 2792
    add-int/lit8 v4, v3, 0x1

    .end local v3           #count:I
    .restart local v4       #count:I
    :try_start_161
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    and-int/lit16 v12, v12, 0xff

    int-to-byte v12, v12

    aput-byte v12, v10, v3

    .line 2793
    add-int/lit8 v8, v8, 0x3

    .line 2794
    add-int/lit8 v11, v8, 0x1

    move v3, v4

    .line 2795
    .end local v4           #count:I
    .restart local v3       #count:I
    goto/16 :goto_87

    .line 2796
    .end local v3           #count:I
    .restart local v4       #count:I
    :cond_171
    add-int/lit8 v12, v8, 0x1

    aget-char v12, v1, v12

    const v13, 0xddea

    if-ne v12, v13, :cond_1ab

    add-int/lit8 v12, v8, 0x3

    aget-char v12, v1, v12

    const v13, 0xddf8

    if-ne v12, v13, :cond_1ab

    .line 2797
    const v12, 0xf348

    invoke-static {v12}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;
    :try_end_189
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_161 .. :try_end_189} :catch_466

    move-result-object v2

    .line 2798
    add-int/lit8 v3, v4, 0x1

    .end local v4           #count:I
    .restart local v3       #count:I
    :try_start_18c
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    const v13, 0xff00

    and-int/2addr v12, v13

    shr-int/lit8 v12, v12, 0x8

    int-to-byte v12, v12

    aput-byte v12, v10, v4
    :try_end_199
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_18c .. :try_end_199} :catch_44c

    .line 2799
    add-int/lit8 v4, v3, 0x1

    .end local v3           #count:I
    .restart local v4       #count:I
    :try_start_19b
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    and-int/lit16 v12, v12, 0xff

    int-to-byte v12, v12

    aput-byte v12, v10, v3

    .line 2800
    add-int/lit8 v8, v8, 0x3

    .line 2801
    add-int/lit8 v11, v8, 0x1

    move v3, v4

    .line 2802
    .end local v4           #count:I
    .restart local v3       #count:I
    goto/16 :goto_87

    .line 2803
    .end local v3           #count:I
    .restart local v4       #count:I
    :cond_1ab
    add-int/lit8 v12, v8, 0x1

    aget-char v12, v1, v12

    const v13, 0xddeb

    if-ne v12, v13, :cond_1e5

    add-int/lit8 v12, v8, 0x3

    aget-char v12, v1, v12

    const v13, 0xddf7

    if-ne v12, v13, :cond_1e5

    .line 2804
    const v12, 0xf3ce

    invoke-static {v12}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;
    :try_end_1c3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_19b .. :try_end_1c3} :catch_466

    move-result-object v2

    .line 2805
    add-int/lit8 v3, v4, 0x1

    .end local v4           #count:I
    .restart local v3       #count:I
    :try_start_1c6
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    const v13, 0xff00

    and-int/2addr v12, v13

    shr-int/lit8 v12, v12, 0x8

    int-to-byte v12, v12

    aput-byte v12, v10, v4
    :try_end_1d3
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1c6 .. :try_end_1d3} :catch_44c

    .line 2806
    add-int/lit8 v4, v3, 0x1

    .end local v3           #count:I
    .restart local v4       #count:I
    :try_start_1d5
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    and-int/lit16 v12, v12, 0xff

    int-to-byte v12, v12

    aput-byte v12, v10, v3

    .line 2807
    add-int/lit8 v8, v8, 0x3

    .line 2808
    add-int/lit8 v11, v8, 0x1

    move v3, v4

    .line 2809
    .end local v4           #count:I
    .restart local v3       #count:I
    goto/16 :goto_87

    .line 2810
    .end local v3           #count:I
    .restart local v4       #count:I
    :cond_1e5
    add-int/lit8 v12, v8, 0x1

    aget-char v12, v1, v12

    const v13, 0xddec

    if-ne v12, v13, :cond_21f

    add-int/lit8 v12, v8, 0x3

    aget-char v12, v1, v12

    const v13, 0xdde7

    if-ne v12, v13, :cond_21f

    .line 2811
    const v12, 0xf3d1

    invoke-static {v12}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;
    :try_end_1fd
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1d5 .. :try_end_1fd} :catch_466

    move-result-object v2

    .line 2812
    add-int/lit8 v3, v4, 0x1

    .end local v4           #count:I
    .restart local v3       #count:I
    :try_start_200
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    const v13, 0xff00

    and-int/2addr v12, v13

    shr-int/lit8 v12, v12, 0x8

    int-to-byte v12, v12

    aput-byte v12, v10, v4
    :try_end_20d
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_200 .. :try_end_20d} :catch_44c

    .line 2813
    add-int/lit8 v4, v3, 0x1

    .end local v3           #count:I
    .restart local v4       #count:I
    :try_start_20f
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    and-int/lit16 v12, v12, 0xff

    int-to-byte v12, v12

    aput-byte v12, v10, v3

    .line 2814
    add-int/lit8 v8, v8, 0x3

    .line 2815
    add-int/lit8 v11, v8, 0x1

    move v3, v4

    .line 2816
    .end local v4           #count:I
    .restart local v3       #count:I
    goto/16 :goto_87

    .line 2817
    .end local v3           #count:I
    .restart local v4       #count:I
    :cond_21f
    add-int/lit8 v12, v8, 0x1

    aget-char v12, v1, v12

    const v13, 0xddee

    if-ne v12, v13, :cond_259

    add-int/lit8 v12, v8, 0x3

    aget-char v12, v1, v12

    const v13, 0xddf9

    if-ne v12, v13, :cond_259

    .line 2818
    const v12, 0xf3d0

    invoke-static {v12}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;
    :try_end_237
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_20f .. :try_end_237} :catch_466

    move-result-object v2

    .line 2819
    add-int/lit8 v3, v4, 0x1

    .end local v4           #count:I
    .restart local v3       #count:I
    :try_start_23a
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    const v13, 0xff00

    and-int/2addr v12, v13

    shr-int/lit8 v12, v12, 0x8

    int-to-byte v12, v12

    aput-byte v12, v10, v4
    :try_end_247
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_23a .. :try_end_247} :catch_44c

    .line 2820
    add-int/lit8 v4, v3, 0x1

    .end local v3           #count:I
    .restart local v4       #count:I
    :try_start_249
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    and-int/lit16 v12, v12, 0xff

    int-to-byte v12, v12

    aput-byte v12, v10, v3

    .line 2821
    add-int/lit8 v8, v8, 0x3

    .line 2822
    add-int/lit8 v11, v8, 0x1

    move v3, v4

    .line 2823
    .end local v4           #count:I
    .restart local v3       #count:I
    goto/16 :goto_87

    .line 2824
    .end local v3           #count:I
    .restart local v4       #count:I
    :cond_259
    add-int/lit8 v12, v8, 0x1

    aget-char v12, v1, v12

    const v13, 0xddef

    if-ne v12, v13, :cond_293

    add-int/lit8 v12, v8, 0x3

    aget-char v12, v1, v12

    const v13, 0xddf5

    if-ne v12, v13, :cond_293

    .line 2825
    const v12, 0xf6a5

    invoke-static {v12}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;
    :try_end_271
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_249 .. :try_end_271} :catch_466

    move-result-object v2

    .line 2826
    add-int/lit8 v3, v4, 0x1

    .end local v4           #count:I
    .restart local v3       #count:I
    :try_start_274
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    const v13, 0xff00

    and-int/2addr v12, v13

    shr-int/lit8 v12, v12, 0x8

    int-to-byte v12, v12

    aput-byte v12, v10, v4
    :try_end_281
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_274 .. :try_end_281} :catch_44c

    .line 2827
    add-int/lit8 v4, v3, 0x1

    .end local v3           #count:I
    .restart local v4       #count:I
    :try_start_283
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    and-int/lit16 v12, v12, 0xff

    int-to-byte v12, v12

    aput-byte v12, v10, v3

    .line 2828
    add-int/lit8 v8, v8, 0x3

    .line 2829
    add-int/lit8 v11, v8, 0x1

    move v3, v4

    .line 2830
    .end local v4           #count:I
    .restart local v3       #count:I
    goto/16 :goto_87

    .line 2831
    .end local v3           #count:I
    .restart local v4       #count:I
    :cond_293
    add-int/lit8 v12, v8, 0x1

    aget-char v12, v1, v12

    const v13, 0xddf0

    if-ne v12, v13, :cond_2cd

    add-int/lit8 v12, v8, 0x3

    aget-char v12, v1, v12

    const v13, 0xddf7

    if-ne v12, v13, :cond_2cd

    .line 2832
    const v12, 0xf3d3

    invoke-static {v12}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;
    :try_end_2ab
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_283 .. :try_end_2ab} :catch_466

    move-result-object v2

    .line 2833
    add-int/lit8 v3, v4, 0x1

    .end local v4           #count:I
    .restart local v3       #count:I
    :try_start_2ae
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    const v13, 0xff00

    and-int/2addr v12, v13

    shr-int/lit8 v12, v12, 0x8

    int-to-byte v12, v12

    aput-byte v12, v10, v4
    :try_end_2bb
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2ae .. :try_end_2bb} :catch_44c

    .line 2834
    add-int/lit8 v4, v3, 0x1

    .end local v3           #count:I
    .restart local v4       #count:I
    :try_start_2bd
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    and-int/lit16 v12, v12, 0xff

    int-to-byte v12, v12

    aput-byte v12, v10, v3

    .line 2835
    add-int/lit8 v8, v8, 0x3

    .line 2836
    add-int/lit8 v11, v8, 0x1

    move v3, v4

    .line 2837
    .end local v4           #count:I
    .restart local v3       #count:I
    goto/16 :goto_87

    .line 2838
    .end local v3           #count:I
    .restart local v4       #count:I
    :cond_2cd
    add-int/lit8 v12, v8, 0x1

    aget-char v12, v1, v12

    const v13, 0xddf7

    if-ne v12, v13, :cond_307

    add-int/lit8 v12, v8, 0x3

    aget-char v12, v1, v12

    const v13, 0xddfa

    if-ne v12, v13, :cond_307

    .line 2839
    const v12, 0xf349

    invoke-static {v12}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;
    :try_end_2e5
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2bd .. :try_end_2e5} :catch_466

    move-result-object v2

    .line 2840
    add-int/lit8 v3, v4, 0x1

    .end local v4           #count:I
    .restart local v3       #count:I
    :try_start_2e8
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    const v13, 0xff00

    and-int/2addr v12, v13

    shr-int/lit8 v12, v12, 0x8

    int-to-byte v12, v12

    aput-byte v12, v10, v4
    :try_end_2f5
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2e8 .. :try_end_2f5} :catch_44c

    .line 2841
    add-int/lit8 v4, v3, 0x1

    .end local v3           #count:I
    .restart local v4       #count:I
    :try_start_2f7
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    and-int/lit16 v12, v12, 0xff

    int-to-byte v12, v12

    aput-byte v12, v10, v3

    .line 2842
    add-int/lit8 v8, v8, 0x3

    .line 2843
    add-int/lit8 v11, v8, 0x1

    move v3, v4

    .line 2844
    .end local v4           #count:I
    .restart local v3       #count:I
    goto/16 :goto_87

    .line 2845
    .end local v3           #count:I
    .restart local v4       #count:I
    :cond_307
    add-int/lit8 v12, v8, 0x1

    aget-char v12, v1, v12

    const v13, 0xddfa

    if-ne v12, v13, :cond_341

    add-int/lit8 v12, v8, 0x3

    aget-char v12, v1, v12

    const v13, 0xddf8

    if-ne v12, v13, :cond_341

    .line 2846
    const v12, 0xf790

    invoke-static {v12}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;
    :try_end_31f
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2f7 .. :try_end_31f} :catch_466

    move-result-object v2

    .line 2847
    add-int/lit8 v3, v4, 0x1

    .end local v4           #count:I
    .restart local v3       #count:I
    :try_start_322
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    const v13, 0xff00

    and-int/2addr v12, v13

    shr-int/lit8 v12, v12, 0x8

    int-to-byte v12, v12

    aput-byte v12, v10, v4
    :try_end_32f
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_322 .. :try_end_32f} :catch_44c

    .line 2848
    add-int/lit8 v4, v3, 0x1

    .end local v3           #count:I
    .restart local v4       #count:I
    :try_start_331
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    and-int/lit16 v12, v12, 0xff

    int-to-byte v12, v12

    aput-byte v12, v10, v3
    :try_end_33a
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_331 .. :try_end_33a} :catch_466

    .line 2849
    add-int/lit8 v8, v8, 0x3

    .line 2850
    add-int/lit8 v11, v8, 0x1

    move v3, v4

    .line 2851
    .end local v4           #count:I
    .restart local v3       #count:I
    goto/16 :goto_87

    .line 2855
    .end local v3           #count:I
    .restart local v4       #count:I
    :cond_341
    add-int/lit8 v3, v4, 0x1

    .end local v4           #count:I
    .restart local v3       #count:I
    :try_start_343
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    const v13, 0xff00

    and-int/2addr v12, v13

    shr-int/lit8 v12, v12, 0x8

    int-to-byte v12, v12

    aput-byte v12, v10, v4
    :try_end_350
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_343 .. :try_end_350} :catch_44c

    .line 2856
    add-int/lit8 v4, v3, 0x1

    .end local v3           #count:I
    .restart local v4       #count:I
    :try_start_352
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    and-int/lit16 v12, v12, 0xff

    int-to-byte v12, v12

    aput-byte v12, v10, v3
    :try_end_35b
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_352 .. :try_end_35b} :catch_466

    .line 2857
    add-int/lit8 v8, v8, 0x1

    .line 2858
    add-int/lit8 v11, v8, 0x1

    move v3, v4

    .end local v4           #count:I
    .restart local v3       #count:I
    goto/16 :goto_87

    .line 2861
    .end local v2           #c:Ljava/lang/Character;
    :cond_362
    :try_start_362
    aget-char v12, v1, v8

    const v13, 0xffff

    and-int/2addr v12, v13

    const/16 v13, 0xa5

    if-ne v12, v13, :cond_393

    .line 2862
    if-ge v11, v8, :cond_46c

    .line 2863
    sub-int v9, v8, v11

    .line 2864
    .restart local v9       #len:I
    new-array v5, v9, [C

    .line 2865
    .restart local v5       #dest:[C
    const/4 v12, 0x0

    invoke-static {v1, v11, v5, v12, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2867
    new-instance v12, Ljava/lang/String;

    invoke-direct {v12, v5}, Ljava/lang/String;-><init>([C)V

    const-string v13, "sjis"

    invoke-virtual {v12, v13}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 2868
    .restart local v0       #b:[B
    const/4 v12, 0x0

    array-length v13, v0

    invoke-static {v0, v12, v10, v3, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2869
    array-length v12, v0

    add-int/2addr v3, v12

    move v4, v3

    .line 2872
    .end local v0           #b:[B
    .end local v3           #count:I
    .end local v5           #dest:[C
    .end local v9           #len:I
    .restart local v4       #count:I
    :goto_389
    add-int/lit8 v3, v4, 0x1

    .end local v4           #count:I
    .restart local v3       #count:I
    const/16 v12, 0x5c

    aput-byte v12, v10, v4

    .line 2873
    add-int/lit8 v11, v8, 0x1

    goto/16 :goto_87

    .line 2875
    :cond_393
    aget-char v12, v1, v8

    invoke-static {v12}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v12

    invoke-static {v12}, Lcom/kddi/android/internal/telephony/KddiSmsDataConvertor;->getUnicodeEmoji(Ljava/lang/Character;)Ljava/lang/Character;

    move-result-object v2

    .line 2876
    .restart local v2       #c:Ljava/lang/Character;
    if-eqz v2, :cond_87

    .line 2877
    if-ge v11, v8, :cond_469

    .line 2878
    sub-int v9, v8, v11

    .line 2879
    .restart local v9       #len:I
    new-array v5, v9, [C

    .line 2880
    .restart local v5       #dest:[C
    const/4 v12, 0x0

    invoke-static {v1, v11, v5, v12, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2882
    new-instance v12, Ljava/lang/String;

    invoke-direct {v12, v5}, Ljava/lang/String;-><init>([C)V

    const-string v13, "sjis"

    invoke-virtual {v12, v13}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 2883
    .restart local v0       #b:[B
    const/4 v12, 0x0

    array-length v13, v0

    invoke-static {v0, v12, v10, v3, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2884
    array-length v12, v0
    :try_end_3ba
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_362 .. :try_end_3ba} :catch_44c

    add-int/2addr v3, v12

    move v4, v3

    .line 2887
    .end local v0           #b:[B
    .end local v3           #count:I
    .end local v5           #dest:[C
    .end local v9           #len:I
    .restart local v4       #count:I
    :goto_3bc
    :try_start_3bc
    aget-char v12, v1, v8

    const/16 v13, 0x23

    if-eq v12, v13, :cond_3ce

    aget-char v12, v1, v8

    const/16 v13, 0x30

    if-lt v12, v13, :cond_409

    aget-char v12, v1, v8

    const/16 v13, 0x39

    if-gt v12, v13, :cond_409

    .line 2889
    :cond_3ce
    add-int/lit8 v12, v8, 0x1

    array-length v13, v1

    if-ge v12, v13, :cond_3fc

    add-int/lit8 v12, v8, 0x1

    aget-char v12, v1, v12
    :try_end_3d7
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3bc .. :try_end_3d7} :catch_466

    const/16 v13, 0x20e3

    if-ne v12, v13, :cond_3fc

    .line 2891
    add-int/lit8 v8, v8, 0x1

    .line 2893
    add-int/lit8 v3, v4, 0x1

    .end local v4           #count:I
    .restart local v3       #count:I
    :try_start_3df
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    const v13, 0xff00

    and-int/2addr v12, v13

    shr-int/lit8 v12, v12, 0x8

    int-to-byte v12, v12

    aput-byte v12, v10, v4
    :try_end_3ec
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3df .. :try_end_3ec} :catch_44c

    .line 2894
    add-int/lit8 v4, v3, 0x1

    .end local v3           #count:I
    .restart local v4       #count:I
    :try_start_3ee
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    and-int/lit16 v12, v12, 0xff

    int-to-byte v12, v12

    aput-byte v12, v10, v3
    :try_end_3f7
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3ee .. :try_end_3f7} :catch_466

    .line 2895
    add-int/lit8 v11, v8, 0x1

    move v3, v4

    .end local v4           #count:I
    .restart local v3       #count:I
    goto/16 :goto_87

    .line 2897
    .end local v3           #count:I
    .restart local v4       #count:I
    :cond_3fc
    add-int/lit8 v3, v4, 0x1

    .end local v4           #count:I
    .restart local v3       #count:I
    :try_start_3fe
    aget-char v12, v1, v8

    and-int/lit16 v12, v12, 0xff

    int-to-byte v12, v12

    aput-byte v12, v10, v4

    .line 2898
    add-int/lit8 v11, v8, 0x1

    goto/16 :goto_87

    .line 2901
    .end local v3           #count:I
    .restart local v4       #count:I
    :cond_409
    add-int/lit8 v3, v4, 0x1

    .end local v4           #count:I
    .restart local v3       #count:I
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    const v13, 0xff00

    and-int/2addr v12, v13

    shr-int/lit8 v12, v12, 0x8

    int-to-byte v12, v12

    aput-byte v12, v10, v4
    :try_end_418
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_3fe .. :try_end_418} :catch_44c

    .line 2902
    add-int/lit8 v4, v3, 0x1

    .end local v3           #count:I
    .restart local v4       #count:I
    :try_start_41a
    invoke-virtual {v2}, Ljava/lang/Character;->charValue()C

    move-result v12

    and-int/lit16 v12, v12, 0xff

    int-to-byte v12, v12

    aput-byte v12, v10, v3
    :try_end_423
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_41a .. :try_end_423} :catch_466

    .line 2903
    add-int/lit8 v11, v8, 0x1

    move v3, v4

    .end local v4           #count:I
    .restart local v3       #count:I
    goto/16 :goto_87

    .line 2909
    .end local v2           #c:Ljava/lang/Character;
    :cond_428
    if-ge v11, v8, :cond_444

    .line 2910
    sub-int v9, v8, v11

    .line 2911
    .restart local v9       #len:I
    :try_start_42c
    new-array v5, v9, [C

    .line 2912
    .restart local v5       #dest:[C
    const/4 v12, 0x0

    invoke-static {v1, v11, v5, v12, v9}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2914
    new-instance v12, Ljava/lang/String;

    invoke-direct {v12, v5}, Ljava/lang/String;-><init>([C)V

    const-string v13, "sjis"

    invoke-virtual {v12, v13}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    .line 2915
    .restart local v0       #b:[B
    const/4 v12, 0x0

    array-length v13, v0

    invoke-static {v0, v12, v10, v3, v13}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2916
    array-length v12, v0
    :try_end_443
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_42c .. :try_end_443} :catch_44c

    add-int/2addr v3, v12

    .line 2922
    .end local v0           #b:[B
    .end local v5           #dest:[C
    .end local v9           #len:I
    :cond_444
    new-array v6, v3, [B

    .line 2923
    .local v6, destBuf:[B
    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-static {v10, v12, v6, v13, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2925
    return-object v6

    .line 2918
    .end local v6           #destBuf:[B
    :catch_44c
    move-exception v7

    .line 2919
    .local v7, e:Ljava/io/UnsupportedEncodingException;
    :goto_44d
    new-instance v12, Lcom/android/internal/telephony/EncodeException;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "ShiftJis encode failed: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v12, v13}, Lcom/android/internal/telephony/EncodeException;-><init>(Ljava/lang/String;)V

    throw v12

    .line 2918
    .end local v3           #count:I
    .end local v7           #e:Ljava/io/UnsupportedEncodingException;
    .restart local v2       #c:Ljava/lang/Character;
    .restart local v4       #count:I
    :catch_466
    move-exception v7

    move v3, v4

    .end local v4           #count:I
    .restart local v3       #count:I
    goto :goto_44d

    :cond_469
    move v4, v3

    .end local v3           #count:I
    .restart local v4       #count:I
    goto/16 :goto_3bc

    .end local v2           #c:Ljava/lang/Character;
    .end local v4           #count:I
    .restart local v3       #count:I
    :cond_46c
    move v4, v3

    .end local v3           #count:I
    .restart local v4       #count:I
    goto/16 :goto_389

    .end local v4           #count:I
    .restart local v2       #c:Ljava/lang/Character;
    .restart local v3       #count:I
    :cond_46f
    move v4, v3

    .end local v3           #count:I
    .restart local v4       #count:I
    goto/16 :goto_c4

    .end local v4           #count:I
    .restart local v3       #count:I
    :cond_472
    move v4, v3

    .end local v3           #count:I
    .restart local v4       #count:I
    goto/16 :goto_68
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

    .line 456
    const-string v3, "utf-16be"

    invoke-virtual {p0, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 458
    .local v1, textPart:[B
    if-eqz p1, :cond_30

    .line 460
    array-length v3, p1

    array-length v4, v1

    add-int/2addr v3, v4

    add-int/lit8 v3, v3, 0x1

    new-array v2, v3, [B

    .line 462
    .local v2, userData:[B
    array-length v3, p1

    int-to-byte v3, v3

    aput-byte v3, v2, v5

    .line 463
    array-length v3, p1

    invoke-static {p1, v5, v2, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 464
    array-length v3, p1

    add-int/lit8 v3, v3, 0x1

    array-length v4, v1

    invoke-static {v1, v5, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 469
    :goto_20
    array-length v3, v2

    add-int/lit8 v3, v3, 0x1

    new-array v0, v3, [B

    .line 470
    .local v0, ret:[B
    array-length v3, v2

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, v0, v5

    .line 471
    array-length v3, v2

    invoke-static {v2, v5, v0, v6, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 472
    return-object v0

    .line 467
    .end local v0           #ret:[B
    .end local v2           #userData:[B
    :cond_30
    move-object v2, v1

    .restart local v2       #userData:[B
    goto :goto_20
.end method

.method public static getSimDeliverPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[B)Lcom/android/internal/telephony/gsm/SmsMessage$DeliverPdu;
    .registers 20
    .parameter "scAddress"
    .parameter "Address"
    .parameter "message"
    .parameter "date"
    .parameter "header"

    .prologue
    .line 2479
    if-eqz p2, :cond_4

    if-nez p1, :cond_6

    .line 2480
    :cond_4
    const/4 v5, 0x0

    .line 2588
    :goto_5
    return-object v5

    .line 2483
    :cond_6
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-static {v0, v12}, Lcom/android/internal/telephony/GsmAlphabet;->CountGsmSeptets(Ljava/lang/CharSequence;Z)Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;

    move-result-object v7

    .line 2485
    .local v7, ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    if-eqz v7, :cond_5c

    .line 2486
    iget v12, v7, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageTable:I

    if-gtz v12, :cond_17

    iget v12, v7, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageShiftTable:I

    if-lez v12, :cond_5c

    .line 2487
    :cond_17
    const-string v12, "SmsMessage"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "getSimDeliverPdu: ted.languageTable = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget v14, v7, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageTable:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 2488
    const-string v12, "SmsMessage"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "getSimDeliverPdu: ted.languageShiftTable = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    iget v14, v7, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageShiftTable:I

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 2489
    new-instance v6, Lcom/android/internal/telephony/SmsHeader;

    invoke-direct {v6}, Lcom/android/internal/telephony/SmsHeader;-><init>()V

    .line 2490
    .local v6, smsHeader:Lcom/android/internal/telephony/SmsHeader;
    iget v12, v7, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageTable:I

    iput v12, v6, Lcom/android/internal/telephony/SmsHeader;->languageTable:I

    .line 2491
    iget v12, v7, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageShiftTable:I

    iput v12, v6, Lcom/android/internal/telephony/SmsHeader;->languageShiftTable:I

    .line 2492
    invoke-static {v6}, Lcom/android/internal/telephony/SmsHeader;->toByteArray(Lcom/android/internal/telephony/SmsHeader;)[B

    move-result-object p4

    .line 2496
    .end local v6           #smsHeader:Lcom/android/internal/telephony/SmsHeader;
    :cond_5c
    new-instance v5, Lcom/android/internal/telephony/gsm/SmsMessage$DeliverPdu;

    invoke-direct {v5}, Lcom/android/internal/telephony/gsm/SmsMessage$DeliverPdu;-><init>()V

    .line 2498
    .local v5, ret:Lcom/android/internal/telephony/gsm/SmsMessage$DeliverPdu;
    if-eqz p4, :cond_89

    const/16 v12, 0x40

    :goto_65
    or-int/lit8 v12, v12, 0x0

    int-to-byte v4, v12

    .line 2500
    .local v4, mtiByte:B
    const/4 v2, 0x0

    .line 2504
    .local v2, bo:Ljava/io/ByteArrayOutputStream;
    :try_start_69
    move-object/from16 v0, p1

    invoke-static {p0, v0, v4, v5}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSimDeliverPduHead(Ljava/lang/String;Ljava/lang/String;BLcom/android/internal/telephony/gsm/SmsMessage$DeliverPdu;)Ljava/io/ByteArrayOutputStream;

    move-result-object v2

    .line 2509
    if-eqz v7, :cond_8b

    .line 2510
    iget v12, v7, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageTable:I

    iget v13, v7, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageShiftTable:I

    move-object/from16 v0, p2

    move-object/from16 v1, p4

    invoke-static {v0, v1, v12, v13}, Lcom/android/internal/telephony/GsmAlphabet;->stringToGsm7BitPackedWithHeader(Ljava/lang/String;[BII)[B

    move-result-object v11

    .line 2517
    .local v11, userData:[B
    :goto_7d
    const/4 v12, 0x0

    aget-byte v12, v11, v12

    and-int/lit16 v12, v12, 0xff

    const/16 v13, 0xa0

    if-le v12, v13, :cond_96

    .line 2519
    const/4 v5, 0x0

    goto/16 :goto_5

    .line 2498
    .end local v2           #bo:Ljava/io/ByteArrayOutputStream;
    .end local v4           #mtiByte:B
    .end local v11           #userData:[B
    :cond_89
    const/4 v12, 0x0

    goto :goto_65

    .line 2513
    .restart local v2       #bo:Ljava/io/ByteArrayOutputStream;
    .restart local v4       #mtiByte:B
    :cond_8b
    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, p4

    invoke-static {v0, v1, v12, v13}, Lcom/android/internal/telephony/GsmAlphabet;->stringToGsm7BitPackedWithHeader(Ljava/lang/String;[BII)[B

    move-result-object v11

    .restart local v11       #userData:[B
    goto :goto_7d

    .line 2529
    :cond_96
    const/4 v12, 0x0

    invoke-virtual {v2, v12}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2533
    const/4 v12, 0x7

    new-array v9, v12, [B

    .line 2535
    .local v9, timestamp:[B
    invoke-static/range {p3 .. p3}, Lcom/android/internal/telephony/gsm/SmsMessage;->ConvertDateStringToBCD(Ljava/lang/String;)[B

    move-result-object v9

    .line 2537
    const/4 v12, 0x0

    array-length v13, v9

    invoke-virtual {v2, v9, v12, v13}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 2539
    const/4 v12, 0x0

    array-length v13, v11

    invoke-virtual {v2, v11, v12, v13}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_ab
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_69 .. :try_end_ab} :catch_b3

    .line 2587
    :goto_ab
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v12

    iput-object v12, v5, Lcom/android/internal/telephony/SmsMessageBase$DeliverPduBase;->encodedMessage:[B

    goto/16 :goto_5

    .line 2541
    .end local v9           #timestamp:[B
    .end local v11           #userData:[B
    :catch_b3
    move-exception v3

    .line 2547
    .local v3, ex:Lcom/android/internal/telephony/EncodeException;
    :try_start_b4
    const-string v12, "utf-16be"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_bb
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_b4 .. :try_end_bb} :catch_df

    move-result-object v8

    .line 2555
    .local v8, textPart:[B
    if-eqz p4, :cond_ea

    .line 2556
    move-object/from16 v0, p4

    array-length v12, v0

    array-length v13, v8

    add-int/2addr v12, v13

    new-array v11, v12, [B

    .line 2558
    .restart local v11       #userData:[B
    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object/from16 v0, p4

    array-length v14, v0

    move-object/from16 v0, p4

    invoke-static {v0, v12, v11, v13, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2559
    const/4 v12, 0x0

    move-object/from16 v0, p4

    array-length v13, v0

    array-length v14, v8

    invoke-static {v8, v12, v11, v13, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2564
    :goto_d7
    array-length v12, v11

    const/16 v13, 0x8c

    if-le v12, v13, :cond_ec

    .line 2566
    const/4 v5, 0x0

    goto/16 :goto_5

    .line 2548
    .end local v8           #textPart:[B
    .end local v11           #userData:[B
    :catch_df
    move-exception v10

    .line 2549
    .local v10, uex:Ljava/io/UnsupportedEncodingException;
    const-string v12, "SmsMessage"

    const-string v13, "Implausible UnsupportedEncodingException "

    invoke-static {v12, v13, v10}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2552
    const/4 v5, 0x0

    goto/16 :goto_5

    .line 2561
    .end local v10           #uex:Ljava/io/UnsupportedEncodingException;
    .restart local v8       #textPart:[B
    :cond_ea
    move-object v11, v8

    .restart local v11       #userData:[B
    goto :goto_d7

    .line 2571
    :cond_ec
    const/16 v12, 0x8

    invoke-virtual {v2, v12}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2575
    const/4 v12, 0x7

    new-array v9, v12, [B

    .line 2577
    .restart local v9       #timestamp:[B
    invoke-static/range {p3 .. p3}, Lcom/android/internal/telephony/gsm/SmsMessage;->ConvertDateStringToBCD(Ljava/lang/String;)[B

    move-result-object v9

    .line 2579
    const/4 v12, 0x0

    array-length v13, v9

    invoke-virtual {v2, v9, v12, v13}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 2582
    array-length v12, v11

    invoke-virtual {v2, v12}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2584
    const/4 v12, 0x0

    array-length v13, v11

    invoke-virtual {v2, v11, v12, v13}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_ab
.end method

.method private static getSimDeliverPduHead(Ljava/lang/String;Ljava/lang/String;BLcom/android/internal/telephony/gsm/SmsMessage$DeliverPdu;)Ljava/io/ByteArrayOutputStream;
    .registers 14
    .parameter "scAddress"
    .parameter "Address"
    .parameter "mtiByte"
    .parameter "ret"

    .prologue
    const/4 v7, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 2402
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/16 v8, 0xb4

    invoke-direct {v0, v8}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 2406
    .local v0, bo:Ljava/io/ByteArrayOutputStream;
    if-nez p0, :cond_32

    .line 2407
    iput-object v7, p3, Lcom/android/internal/telephony/SmsMessageBase$DeliverPduBase;->encodedScAddress:[B

    .line 2413
    :goto_e
    invoke-virtual {v0, p2}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2416
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 2417
    .local v1, c:C
    const/4 v4, 0x1

    .line 2429
    .local v4, isNumeric:Z
    if-eqz v4, :cond_55

    invoke-static {v1}, Landroid/telephony/PhoneNumberUtils;->isDialable(C)Z

    move-result v8

    if-eqz v8, :cond_55

    .line 2430
    const-string v7, "SmsMessage"

    const-string v8, "Address is Numeric."

    invoke-static {v7, v8}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 2431
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->networkPortionToCalledPartyBCD(Ljava/lang/String;)[B

    move-result-object v2

    .line 2435
    .local v2, daBytes:[B
    if-nez v2, :cond_39

    .line 2436
    invoke-virtual {v0, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2465
    :goto_2e
    invoke-virtual {v0, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2467
    .end local v0           #bo:Ljava/io/ByteArrayOutputStream;
    .end local v2           #daBytes:[B
    :goto_31
    return-object v0

    .line 2409
    .end local v1           #c:C
    .end local v4           #isNumeric:Z
    .restart local v0       #bo:Ljava/io/ByteArrayOutputStream;
    :cond_32
    invoke-static {p0}, Landroid/telephony/PhoneNumberUtils;->networkPortionToCalledPartyBCDWithLength(Ljava/lang/String;)[B

    move-result-object v8

    iput-object v8, p3, Lcom/android/internal/telephony/SmsMessageBase$DeliverPduBase;->encodedScAddress:[B

    goto :goto_e

    .line 2438
    .restart local v1       #c:C
    .restart local v2       #daBytes:[B
    .restart local v4       #isNumeric:Z
    :cond_39
    array-length v7, v2

    add-int/lit8 v7, v7, -0x1

    mul-int/lit8 v7, v7, 0x2

    array-length v8, v2

    add-int/lit8 v8, v8, -0x1

    aget-byte v8, v2, v8

    and-int/lit16 v8, v8, 0xf0

    const/16 v9, 0xf0

    if-ne v8, v9, :cond_53

    :goto_49
    sub-int v5, v7, v5

    invoke-virtual {v0, v5}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2441
    array-length v5, v2

    invoke-virtual {v0, v2, v6, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_2e

    :cond_53
    move v5, v6

    .line 2438
    goto :goto_49

    .line 2444
    .end local v2           #daBytes:[B
    :cond_55
    const-string v8, "SmsMessage"

    const-string v9, "Address is Alphabetic."

    invoke-static {v8, v9}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 2448
    :try_start_5c
    invoke-static {p1}, Lcom/android/internal/telephony/GsmAlphabet;->stringToGsm7BitPacked(Ljava/lang/String;)[B
    :try_end_5f
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_5c .. :try_end_5f} :catch_74

    move-result-object v2

    .line 2455
    .restart local v2       #daBytes:[B
    array-length v7, v2

    add-int/lit8 v7, v7, -0x1

    mul-int/lit8 v7, v7, 0x2

    invoke-virtual {v0, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2458
    const/16 v7, 0xd0

    invoke-virtual {v0, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2461
    array-length v7, v2

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v0, v2, v5, v7}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_2e

    .line 2449
    .end local v2           #daBytes:[B
    :catch_74
    move-exception v3

    .line 2450
    .local v3, ex:Lcom/android/internal/telephony/EncodeException;
    const-string v5, "SmsMessage"

    const-string v6, "Implausible UnsupportedEncodingException "

    invoke-static {v5, v6, v3}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v0, v7

    .line 2452
    goto :goto_31
.end method

.method public static getSimSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[B)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    .registers 16
    .parameter "scAddress"
    .parameter "Address"
    .parameter "message"
    .parameter "header"

    .prologue
    .line 2208
    if-eqz p2, :cond_4

    if-nez p1, :cond_6

    .line 2209
    :cond_4
    const/4 v3, 0x0

    .line 2303
    :goto_5
    return-object v3

    .line 2212
    :cond_6
    const/4 v9, 0x0

    invoke-static {p2, v9}, Lcom/android/internal/telephony/GsmAlphabet;->CountGsmSeptets(Ljava/lang/CharSequence;Z)Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;

    move-result-object v5

    .line 2214
    .local v5, ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    if-eqz v5, :cond_5a

    .line 2215
    iget v9, v5, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageTable:I

    if-gtz v9, :cond_15

    iget v9, v5, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageShiftTable:I

    if-lez v9, :cond_5a

    .line 2216
    :cond_15
    const-string v9, "SmsMessage"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "getSimSubmitPdu: ted.languageTable = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, v5, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageTable:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 2217
    const-string v9, "SmsMessage"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "getSimSubmitPdu: ted.languageShiftTable = "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget v11, v5, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageShiftTable:I

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 2218
    new-instance v4, Lcom/android/internal/telephony/SmsHeader;

    invoke-direct {v4}, Lcom/android/internal/telephony/SmsHeader;-><init>()V

    .line 2219
    .local v4, smsHeader:Lcom/android/internal/telephony/SmsHeader;
    iget v9, v5, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageTable:I

    iput v9, v4, Lcom/android/internal/telephony/SmsHeader;->languageTable:I

    .line 2220
    iget v9, v5, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageShiftTable:I

    iput v9, v4, Lcom/android/internal/telephony/SmsHeader;->languageShiftTable:I

    .line 2221
    invoke-static {v4}, Lcom/android/internal/telephony/SmsHeader;->toByteArray(Lcom/android/internal/telephony/SmsHeader;)[B

    move-result-object p3

    .line 2225
    .end local v4           #smsHeader:Lcom/android/internal/telephony/SmsHeader;
    :cond_5a
    new-instance v3, Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    invoke-direct {v3}, Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;-><init>()V

    .line 2227
    .local v3, ret:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    if-eqz p3, :cond_7f

    const/16 v9, 0x40

    :goto_63
    or-int/lit8 v9, v9, 0x1

    int-to-byte v2, v9

    .line 2229
    .local v2, mtiByte:B
    invoke-static {p0, p1, v2, v3}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSimSubmitPduHead(Ljava/lang/String;Ljava/lang/String;BLcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;)Ljava/io/ByteArrayOutputStream;

    move-result-object v0

    .line 2237
    .local v0, bo:Ljava/io/ByteArrayOutputStream;
    if-eqz v5, :cond_81

    .line 2238
    :try_start_6c
    iget v9, v5, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageTable:I

    iget v10, v5, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageShiftTable:I

    invoke-static {p2, p3, v9, v10}, Lcom/android/internal/telephony/GsmAlphabet;->stringToGsm7BitPackedWithHeader(Ljava/lang/String;[BII)[B

    move-result-object v8

    .line 2245
    .local v8, userData:[B
    :goto_74
    const/4 v9, 0x0

    aget-byte v9, v8, v9

    and-int/lit16 v9, v9, 0xff

    const/16 v10, 0xa0

    if-le v9, v10, :cond_88

    .line 2247
    const/4 v3, 0x0

    goto :goto_5

    .line 2227
    .end local v0           #bo:Ljava/io/ByteArrayOutputStream;
    .end local v2           #mtiByte:B
    .end local v8           #userData:[B
    :cond_7f
    const/4 v9, 0x0

    goto :goto_63

    .line 2241
    .restart local v0       #bo:Ljava/io/ByteArrayOutputStream;
    .restart local v2       #mtiByte:B
    :cond_81
    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static {p2, p3, v9, v10}, Lcom/android/internal/telephony/GsmAlphabet;->stringToGsm7BitPackedWithHeader(Ljava/lang/String;[BII)[B

    move-result-object v8

    .restart local v8       #userData:[B
    goto :goto_74

    .line 2257
    :cond_88
    const/4 v9, 0x0

    invoke-virtual {v0, v9}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2262
    const/4 v9, 0x0

    array-length v10, v8

    invoke-virtual {v0, v8, v9, v10}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_91
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_6c .. :try_end_91} :catch_99

    .line 2302
    :goto_91
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v9

    iput-object v9, v3, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    goto/16 :goto_5

    .line 2264
    .end local v8           #userData:[B
    :catch_99
    move-exception v1

    .line 2270
    .local v1, ex:Lcom/android/internal/telephony/EncodeException;
    :try_start_9a
    const-string v9, "utf-16be"

    invoke-virtual {p2, v9}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_9f
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_9a .. :try_end_9f} :catch_bb

    move-result-object v6

    .line 2278
    .local v6, textPart:[B
    if-eqz p3, :cond_c6

    .line 2279
    array-length v9, p3

    array-length v10, v6

    add-int/2addr v9, v10

    new-array v8, v9, [B

    .line 2281
    .restart local v8       #userData:[B
    const/4 v9, 0x0

    const/4 v10, 0x0

    array-length v11, p3

    invoke-static {p3, v9, v8, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2282
    const/4 v9, 0x0

    array-length v10, p3

    array-length v11, v6

    invoke-static {v6, v9, v8, v10, v11}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 2287
    :goto_b3
    array-length v9, v8

    const/16 v10, 0x8c

    if-le v9, v10, :cond_c8

    .line 2289
    const/4 v3, 0x0

    goto/16 :goto_5

    .line 2271
    .end local v6           #textPart:[B
    .end local v8           #userData:[B
    :catch_bb
    move-exception v7

    .line 2272
    .local v7, uex:Ljava/io/UnsupportedEncodingException;
    const-string v9, "SmsMessage"

    const-string v10, "Implausible UnsupportedEncodingException "

    invoke-static {v9, v10, v7}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2275
    const/4 v3, 0x0

    goto/16 :goto_5

    .line 2284
    .end local v7           #uex:Ljava/io/UnsupportedEncodingException;
    .restart local v6       #textPart:[B
    :cond_c6
    move-object v8, v6

    .restart local v8       #userData:[B
    goto :goto_b3

    .line 2294
    :cond_c8
    const/16 v9, 0x8

    invoke-virtual {v0, v9}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2297
    array-length v9, v8

    invoke-virtual {v0, v9}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2299
    const/4 v9, 0x0

    array-length v10, v8

    invoke-virtual {v0, v8, v9, v10}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_91
.end method

.method private static getSimSubmitPduHead(Ljava/lang/String;Ljava/lang/String;BLcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;)Ljava/io/ByteArrayOutputStream;
    .registers 10
    .parameter "scAddress"
    .parameter "Address"
    .parameter "mtiByte"
    .parameter "ret"

    .prologue
    const/4 v3, 0x0

    .line 2121
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/16 v2, 0xb4

    invoke-direct {v0, v2}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 2125
    .local v0, bo:Ljava/io/ByteArrayOutputStream;
    if-nez p0, :cond_35

    .line 2126
    const/4 v2, 0x0

    iput-object v2, p3, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    .line 2132
    :goto_d
    invoke-virtual {v0, p2}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2135
    invoke-virtual {v0, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2139
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->networkPortionToCalledPartyBCD(Ljava/lang/String;)[B

    move-result-object v1

    .line 2143
    .local v1, daBytes:[B
    array-length v2, v1

    add-int/lit8 v2, v2, -0x1

    mul-int/lit8 v4, v2, 0x2

    array-length v2, v1

    add-int/lit8 v2, v2, -0x1

    aget-byte v2, v1, v2

    and-int/lit16 v2, v2, 0xf0

    const/16 v5, 0xf0

    if-ne v2, v5, :cond_3c

    const/4 v2, 0x1

    :goto_28
    sub-int v2, v4, v2

    invoke-virtual {v0, v2}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2148
    array-length v2, v1

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 2151
    invoke-virtual {v0, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2153
    return-object v0

    .line 2128
    .end local v1           #daBytes:[B
    :cond_35
    invoke-static {p0}, Landroid/telephony/PhoneNumberUtils;->networkPortionToCalledPartyBCDWithLength(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, p3, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    goto :goto_d

    .restart local v1       #daBytes:[B
    :cond_3c
    move v2, v3

    .line 2143
    goto :goto_28
.end method

.method public static getSubmitPdu(Ljava/lang/String;Ljava/lang/String;II[BZ)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    .registers 14
    .parameter "scAddress"
    .parameter "destinationAddress"
    .parameter "destinationPort"
    .parameter "originationPort"
    .parameter "data"
    .parameter "statusReportRequested"

    .prologue
    const/4 v7, 0x0

    .line 2160
    new-instance v1, Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    invoke-direct {v1}, Lcom/android/internal/telephony/SmsHeader$PortAddrs;-><init>()V

    .line 2161
    .local v1, portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;
    iput p2, v1, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->destPort:I

    .line 2162
    iput p3, v1, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->origPort:I

    .line 2163
    iput-boolean v7, v1, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->areEightBits:Z

    .line 2165
    new-instance v3, Lcom/android/internal/telephony/SmsHeader;

    invoke-direct {v3}, Lcom/android/internal/telephony/SmsHeader;-><init>()V

    .line 2166
    .local v3, smsHeader:Lcom/android/internal/telephony/SmsHeader;
    iput-object v1, v3, Lcom/android/internal/telephony/SmsHeader;->portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    .line 2168
    invoke-static {v3}, Lcom/android/internal/telephony/SmsHeader;->toByteArray(Lcom/android/internal/telephony/SmsHeader;)[B

    move-result-object v4

    .line 2170
    .local v4, smsHeaderData:[B
    array-length v5, p4

    array-length v6, v4

    add-int/2addr v5, v6

    add-int/lit8 v5, v5, 0x1

    const/16 v6, 0x8c

    if-le v5, v6, :cond_45

    .line 2171
    const-string v5, "SmsMessage"

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

    invoke-static {v5, v6}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 2173
    const/4 v2, 0x0

    .line 2199
    :goto_44
    return-object v2

    .line 2176
    :cond_45
    new-instance v2, Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    invoke-direct {v2}, Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;-><init>()V

    .line 2177
    .local v2, ret:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    const/16 v5, 0x41

    invoke-static {p0, p1, v5, p5, v2}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPduHead(Ljava/lang/String;Ljava/lang/String;BZLcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;)Ljava/io/ByteArrayOutputStream;

    move-result-object v0

    .line 2184
    .local v0, bo:Ljava/io/ByteArrayOutputStream;
    const/4 v5, 0x4

    invoke-virtual {v0, v5}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2189
    array-length v5, p4

    array-length v6, v4

    add-int/2addr v5, v6

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v0, v5}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2192
    array-length v5, v4

    invoke-virtual {v0, v5}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2193
    array-length v5, v4

    invoke-virtual {v0, v4, v7, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 2196
    array-length v5, p4

    invoke-virtual {v0, p4, v7, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 2198
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    iput-object v5, v2, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    goto :goto_44
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

    .line 506
    new-instance v1, Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    invoke-direct {v1}, Lcom/android/internal/telephony/SmsHeader$PortAddrs;-><init>()V

    .line 507
    .local v1, portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;
    iput p2, v1, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->destPort:I

    .line 508
    iput v7, v1, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->origPort:I

    .line 509
    iput-boolean v7, v1, Lcom/android/internal/telephony/SmsHeader$PortAddrs;->areEightBits:Z

    .line 511
    new-instance v3, Lcom/android/internal/telephony/SmsHeader;

    invoke-direct {v3}, Lcom/android/internal/telephony/SmsHeader;-><init>()V

    .line 512
    .local v3, smsHeader:Lcom/android/internal/telephony/SmsHeader;
    iput-object v1, v3, Lcom/android/internal/telephony/SmsHeader;->portAddrs:Lcom/android/internal/telephony/SmsHeader$PortAddrs;

    .line 514
    invoke-static {v3}, Lcom/android/internal/telephony/SmsHeader;->toByteArray(Lcom/android/internal/telephony/SmsHeader;)[B

    move-result-object v4

    .line 516
    .local v4, smsHeaderData:[B
    array-length v5, p3

    array-length v6, v4

    add-int/2addr v5, v6

    add-int/lit8 v5, v5, 0x1

    const/16 v6, 0x8c

    if-le v5, v6, :cond_45

    .line 517
    const-string v5, "SmsMessage"

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

    invoke-static {v5, v6}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 519
    const/4 v2, 0x0

    .line 545
    :goto_44
    return-object v2

    .line 522
    :cond_45
    new-instance v2, Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    invoke-direct {v2}, Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;-><init>()V

    .line 523
    .local v2, ret:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    const/16 v5, 0x41

    invoke-static {p0, p1, v5, p4, v2}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPduHead(Ljava/lang/String;Ljava/lang/String;BZLcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;)Ljava/io/ByteArrayOutputStream;

    move-result-object v0

    .line 530
    .local v0, bo:Ljava/io/ByteArrayOutputStream;
    const/4 v5, 0x4

    invoke-virtual {v0, v5}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 535
    array-length v5, p3

    array-length v6, v4

    add-int/2addr v5, v6

    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v0, v5}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 538
    array-length v5, v4

    invoke-virtual {v0, v5}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 539
    array-length v5, v4

    invoke-virtual {v0, v4, v7, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 542
    array-length v5, p3

    invoke-virtual {v0, p3, v7, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 544
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
    .line 487
    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[B)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v0

    return-object v0
.end method

.method public static getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZIIIII)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    .registers 23
    .parameter "scAddress"
    .parameter "destinationAddress"
    .parameter "message"
    .parameter "statusReportRequested"
    .parameter "replyPath"
    .parameter "expiry"
    .parameter "serviceType"
    .parameter "encodingType"
    .parameter "a"
    .parameter "b"

    .prologue
    .line 2029
    if-gtz p8, :cond_4

    if-lez p9, :cond_2b

    .line 2030
    :cond_4
    new-instance v12, Lcom/android/internal/telephony/SmsHeader;

    invoke-direct {v12}, Lcom/android/internal/telephony/SmsHeader;-><init>()V

    .line 2031
    .local v12, Header:Lcom/android/internal/telephony/SmsHeader;
    move/from16 v0, p8

    iput v0, v12, Lcom/android/internal/telephony/SmsHeader;->languageTable:I

    .line 2032
    move/from16 v0, p9

    iput v0, v12, Lcom/android/internal/telephony/SmsHeader;->languageShiftTable:I

    .line 2033
    invoke-static {v12}, Lcom/android/internal/telephony/SmsHeader;->toByteArray(Lcom/android/internal/telephony/SmsHeader;)[B

    move-result-object v5

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move/from16 v4, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    invoke-static/range {v1 .. v11}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BZIIIII)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v1

    .line 2036
    .end local v12           #Header:Lcom/android/internal/telephony/SmsHeader;
    :goto_2a
    return-object v1

    :cond_2b
    const/4 v5, 0x0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move/from16 v4, p3

    move/from16 v6, p4

    move/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    invoke-static/range {v1 .. v11}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BZIIIII)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v1

    goto :goto_2a
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

    .line 318
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move v6, v5

    move v7, v5

    invoke-static/range {v0 .. v7}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BIII)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

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
    .line 343
    if-eqz p2, :cond_4

    if-nez p1, :cond_6

    .line 344
    :cond_4
    const/4 v7, 0x0

    .line 444
    :goto_5
    return-object v7

    .line 349
    :cond_6
    if-nez p5, :cond_80

    .line 351
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-static {v0, v12}, Lcom/android/internal/telephony/gsm/SmsMessage;->calculateLength(Ljava/lang/CharSequence;Z)Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;

    move-result-object v9

    .line 352
    .local v9, ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    iget v0, v9, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->codeUnitSize:I

    move/from16 p5, v0

    .line 353
    iget v0, v9, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageTable:I

    move/from16 p6, v0

    .line 354
    iget v0, v9, Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;->languageShiftTable:I

    move/from16 p7, v0

    .line 356
    const/4 v12, 0x1

    move/from16 v0, p5

    if-ne v0, v12, :cond_80

    if-nez p6, :cond_24

    if-eqz p7, :cond_80

    .line 358
    :cond_24
    if-eqz p4, :cond_d9

    .line 359
    invoke-static/range {p4 .. p4}, Lcom/android/internal/telephony/SmsHeader;->fromByteArray([B)Lcom/android/internal/telephony/SmsHeader;

    move-result-object v8

    .line 360
    .local v8, smsHeader:Lcom/android/internal/telephony/SmsHeader;
    iget v12, v8, Lcom/android/internal/telephony/SmsHeader;->languageTable:I

    move/from16 v0, p6

    if-ne v12, v0, :cond_36

    iget v12, v8, Lcom/android/internal/telephony/SmsHeader;->languageShiftTable:I

    move/from16 v0, p7

    if-eq v12, v0, :cond_80

    .line 362
    :cond_36
    const-string v12, "SmsMessage"

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

    invoke-static {v12, v13}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 365
    move/from16 v0, p6

    iput v0, v8, Lcom/android/internal/telephony/SmsHeader;->languageTable:I

    .line 366
    move/from16 v0, p7

    iput v0, v8, Lcom/android/internal/telephony/SmsHeader;->languageShiftTable:I

    .line 367
    invoke-static {v8}, Lcom/android/internal/telephony/SmsHeader;->toByteArray(Lcom/android/internal/telephony/SmsHeader;)[B

    move-result-object p4

    .line 378
    .end local v8           #smsHeader:Lcom/android/internal/telephony/SmsHeader;
    .end local v9           #ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    :cond_80
    :goto_80
    new-instance v7, Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    invoke-direct {v7}, Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;-><init>()V

    .line 380
    .local v7, ret:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    if-eqz p4, :cond_eb

    const/16 v12, 0x40

    :goto_89
    or-int/lit8 v12, v12, 0x1

    int-to-byte v6, v12

    .line 381
    .local v6, mtiByte:B
    move-object/from16 v0, p1

    move/from16 v1, p3

    invoke-static {p0, v0, v6, v1, v7}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPduHead(Ljava/lang/String;Ljava/lang/String;BZLcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;)Ljava/io/ByteArrayOutputStream;

    move-result-object v4

    .line 388
    .local v4, bo:Ljava/io/ByteArrayOutputStream;
    const/4 v12, 0x1

    move/from16 v0, p5

    if-ne v0, v12, :cond_ed

    .line 389
    :try_start_99
    move-object/from16 v0, p2

    move-object/from16 v1, p4

    move/from16 v2, p6

    move/from16 v3, p7

    invoke-static {v0, v1, v2, v3}, Lcom/android/internal/telephony/GsmAlphabet;->stringToGsm7BitPackedWithHeader(Ljava/lang/String;[BII)[B
    :try_end_a4
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_99 .. :try_end_a4} :catch_101

    move-result-object v11

    .line 415
    .local v11, userData:[B
    :goto_a5
    const/4 v12, 0x1

    move/from16 v0, p5

    if-ne v0, v12, :cond_129

    .line 416
    const/4 v12, 0x0

    aget-byte v12, v11, v12

    and-int/lit16 v12, v12, 0xff

    const/16 v13, 0xa0

    if-le v12, v13, :cond_118

    .line 418
    const-string v12, "SmsMessage"

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

    invoke-static {v12, v13}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 419
    const/4 v7, 0x0

    goto/16 :goto_5

    .line 370
    .end local v4           #bo:Ljava/io/ByteArrayOutputStream;
    .end local v6           #mtiByte:B
    .end local v7           #ret:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    .end local v11           #userData:[B
    .restart local v9       #ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    :cond_d9
    new-instance v8, Lcom/android/internal/telephony/SmsHeader;

    invoke-direct {v8}, Lcom/android/internal/telephony/SmsHeader;-><init>()V

    .line 371
    .restart local v8       #smsHeader:Lcom/android/internal/telephony/SmsHeader;
    move/from16 v0, p6

    iput v0, v8, Lcom/android/internal/telephony/SmsHeader;->languageTable:I

    .line 372
    move/from16 v0, p7

    iput v0, v8, Lcom/android/internal/telephony/SmsHeader;->languageShiftTable:I

    .line 373
    invoke-static {v8}, Lcom/android/internal/telephony/SmsHeader;->toByteArray(Lcom/android/internal/telephony/SmsHeader;)[B

    move-result-object p4

    goto :goto_80

    .line 380
    .end local v8           #smsHeader:Lcom/android/internal/telephony/SmsHeader;
    .end local v9           #ted:Lcom/android/internal/telephony/GsmAlphabet$TextEncodingDetails;
    .restart local v7       #ret:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_eb
    const/4 v12, 0x0

    goto :goto_89

    .line 393
    .restart local v4       #bo:Ljava/io/ByteArrayOutputStream;
    .restart local v6       #mtiByte:B
    :cond_ed
    :try_start_ed
    move-object/from16 v0, p2

    move-object/from16 v1, p4

    invoke-static {v0, v1}, Lcom/android/internal/telephony/gsm/SmsMessage;->encodeUCS2(Ljava/lang/String;[B)[B
    :try_end_f4
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_ed .. :try_end_f4} :catch_f6
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_ed .. :try_end_f4} :catch_101

    move-result-object v11

    .restart local v11       #userData:[B
    goto :goto_a5

    .line 394
    .end local v11           #userData:[B
    :catch_f6
    move-exception v10

    .line 395
    .local v10, uex:Ljava/io/UnsupportedEncodingException;
    :try_start_f7
    const-string v12, "SmsMessage"

    const-string v13, "Implausible UnsupportedEncodingException "

    invoke-static {v12, v13, v10}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_fe
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_f7 .. :try_end_fe} :catch_101

    .line 398
    const/4 v7, 0x0

    goto/16 :goto_5

    .line 401
    .end local v10           #uex:Ljava/io/UnsupportedEncodingException;
    :catch_101
    move-exception v5

    .line 405
    .local v5, ex:Lcom/android/internal/telephony/EncodeException;
    :try_start_102
    move-object/from16 v0, p2

    move-object/from16 v1, p4

    invoke-static {v0, v1}, Lcom/android/internal/telephony/gsm/SmsMessage;->encodeUCS2(Ljava/lang/String;[B)[B
    :try_end_109
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_102 .. :try_end_109} :catch_10d

    move-result-object v11

    .line 406
    .restart local v11       #userData:[B
    const/16 p5, 0x3

    goto :goto_a5

    .line 407
    .end local v11           #userData:[B
    :catch_10d
    move-exception v10

    .line 408
    .restart local v10       #uex:Ljava/io/UnsupportedEncodingException;
    const-string v12, "SmsMessage"

    const-string v13, "Implausible UnsupportedEncodingException "

    invoke-static {v12, v13, v10}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 411
    const/4 v7, 0x0

    goto/16 :goto_5

    .line 429
    .end local v5           #ex:Lcom/android/internal/telephony/EncodeException;
    .end local v10           #uex:Ljava/io/UnsupportedEncodingException;
    .restart local v11       #userData:[B
    :cond_118
    const/4 v12, 0x0

    invoke-virtual {v4, v12}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 442
    :goto_11c
    const/4 v12, 0x0

    array-length v13, v11

    invoke-virtual {v4, v11, v12, v13}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 443
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v12

    iput-object v12, v7, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    goto/16 :goto_5

    .line 431
    :cond_129
    const/4 v12, 0x0

    aget-byte v12, v11, v12

    and-int/lit16 v12, v12, 0xff

    const/16 v13, 0x8c

    if-le v12, v13, :cond_158

    .line 433
    const-string v12, "SmsMessage"

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

    invoke-static {v12, v13}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 434
    const/4 v7, 0x0

    goto/16 :goto_5

    .line 438
    :cond_158
    const/16 v12, 0x8

    invoke-virtual {v4, v12}, Ljava/io/ByteArrayOutputStream;->write(I)V

    goto :goto_11c
.end method

.method public static getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BZ)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    .registers 14
    .parameter "scAddress"
    .parameter "destinationAddress"
    .parameter "message"
    .parameter "statusReportRequested"
    .parameter "header"
    .parameter "is7bitAlphabet"

    .prologue
    const/4 v5, 0x0

    .line 1810
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move v6, v5

    move v7, v5

    invoke-static/range {v0 .. v7}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BIII)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v0

    return-object v0
.end method

.method public static getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BZIII)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    .registers 20
    .parameter "scAddress"
    .parameter "destinationAddress"
    .parameter "message"
    .parameter "statusReportRequested"
    .parameter "header"
    .parameter "replyPath"
    .parameter "expiry"
    .parameter "serviceType"
    .parameter "encodingType"

    .prologue
    .line 1830
    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    invoke-static/range {v0 .. v10}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BZIIIII)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    move-result-object v0

    return-object v0
.end method

.method public static getSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z[BZIIIII)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    .registers 26
    .parameter "scAddress"
    .parameter "destinationAddress"
    .parameter "message"
    .parameter "statusReportRequested"
    .parameter "header"
    .parameter "replyPath"
    .parameter "expiry"
    .parameter "serviceType"
    .parameter "encodingType"
    .parameter "languageTable"
    .parameter "languageShiftTable"

    .prologue
    .line 1852
    const-string v12, "SmsMessage"

    const-string v13, "getSubmitPdu with Options"

    invoke-static {v12, v13}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 1854
    if-eqz p2, :cond_b

    if-nez p1, :cond_d

    .line 1855
    :cond_b
    const/4 v8, 0x0

    .line 2017
    :goto_c
    return-object v8

    .line 1857
    :cond_d
    const-string v12, "SmsMessage"

    const-string v13, "**getSubmitPdu_Options**"

    invoke-static {v12, v13}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 1858
    const-string v12, "SmsMessage"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "replyPath = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move/from16 v0, p5

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 1859
    const-string v12, "SmsMessage"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "encodingType = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move/from16 v0, p8

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 1860
    const-string v12, "SmsMessage"

    const-string v13, "**********************"

    invoke-static {v12, v13}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 1862
    new-instance v8, Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    invoke-direct {v8}, Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;-><init>()V

    .line 1864
    .local v8, ret:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    if-eqz p4, :cond_e1

    const/16 v12, 0x40

    :goto_58
    or-int/lit8 v12, v12, 0x1

    int-to-byte v7, v12

    .line 1865
    .local v7, mtiByte:B
    if-eqz p5, :cond_78

    .line 1866
    or-int/lit16 v12, v7, 0x80

    int-to-byte v7, v12

    .line 1867
    const-string v12, "SmsMessage"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mtiByte = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 1876
    :cond_78
    or-int/lit8 v12, v7, 0x10

    int-to-byte v7, v12

    .line 1877
    const-string v12, "SmsMessage"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "mtiByte = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 1882
    const/4 v5, 0x0

    .line 1885
    .local v5, encodingUcs2:Z
    const/4 v4, 0x0

    .line 1886
    .local v4, bo:Ljava/io/ByteArrayOutputStream;
    move-object/from16 v0, p1

    move/from16 v1, p3

    invoke-static {p0, v0, v7, v1, v8}, Lcom/android/internal/telephony/gsm/SmsMessage;->getSubmitPduHead(Ljava/lang/String;Ljava/lang/String;BZLcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;)Ljava/io/ByteArrayOutputStream;

    move-result-object v4

    .line 1892
    const/4 v12, 0x1

    move/from16 v0, p8

    if-ne v0, v12, :cond_e4

    .line 1893
    :try_start_a2
    new-instance v12, Lcom/android/internal/telephony/EncodeException;

    const-string v13, "Input Method is Unicode"

    invoke-direct {v12, v13}, Lcom/android/internal/telephony/EncodeException;-><init>(Ljava/lang/String;)V

    throw v12
    :try_end_aa
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_a2 .. :try_end_aa} :catch_aa

    .line 1944
    :catch_aa
    move-exception v6

    .line 1959
    .local v6, ex:Lcom/android/internal/telephony/EncodeException;
    :try_start_ab
    const-string v12, "utf-16be"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_b2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_ab .. :try_end_b2} :catch_12c

    move-result-object v9

    .line 1969
    .local v9, textPart:[B
    if-eqz p4, :cond_137

    .line 1971
    move-object/from16 v0, p4

    array-length v12, v0

    array-length v13, v9

    add-int/2addr v12, v13

    add-int/lit8 v12, v12, 0x1

    new-array v11, v12, [B

    .line 1973
    .local v11, userData:[B
    const/4 v12, 0x0

    move-object/from16 v0, p4

    array-length v13, v0

    int-to-byte v13, v13

    aput-byte v13, v11, v12

    .line 1974
    const/4 v12, 0x0

    const/4 v13, 0x1

    move-object/from16 v0, p4

    array-length v14, v0

    move-object/from16 v0, p4

    invoke-static {v0, v12, v11, v13, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1975
    const/4 v12, 0x0

    move-object/from16 v0, p4

    array-length v13, v0

    add-int/lit8 v13, v13, 0x1

    array-length v14, v9

    invoke-static {v9, v12, v11, v13, v14}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1980
    :goto_d9
    array-length v12, v11

    const/16 v13, 0x8c

    if-le v12, v13, :cond_139

    .line 1982
    const/4 v8, 0x0

    goto/16 :goto_c

    .line 1864
    .end local v4           #bo:Ljava/io/ByteArrayOutputStream;
    .end local v5           #encodingUcs2:Z
    .end local v6           #ex:Lcom/android/internal/telephony/EncodeException;
    .end local v7           #mtiByte:B
    .end local v9           #textPart:[B
    .end local v11           #userData:[B
    :cond_e1
    const/4 v12, 0x0

    goto/16 :goto_58

    .line 1915
    .restart local v4       #bo:Ljava/io/ByteArrayOutputStream;
    .restart local v5       #encodingUcs2:Z
    .restart local v7       #mtiByte:B
    :cond_e4
    :try_start_e4
    move-object/from16 v0, p2

    move-object/from16 v1, p4

    move/from16 v2, p9

    move/from16 v3, p10

    invoke-static {v0, v1, v2, v3}, Lcom/android/internal/telephony/GsmAlphabet;->stringToGsm7BitPackedWithHeader(Ljava/lang/String;[BII)[B

    move-result-object v11

    .line 1918
    .restart local v11       #userData:[B
    const/4 v12, 0x0

    aget-byte v12, v11, v12

    and-int/lit16 v12, v12, 0xff

    const/16 v13, 0xa0

    if-le v12, v13, :cond_fc

    .line 1920
    const/4 v8, 0x0

    goto/16 :goto_c

    .line 1931
    :cond_fc
    const/4 v12, 0x0

    invoke-virtual {v4, v12}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1938
    move/from16 v0, p6

    invoke-virtual {v4, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 1939
    const-string v12, "SmsMessage"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "expirty = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move/from16 v0, p6

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 1943
    const/4 v12, 0x0

    array-length v13, v11

    invoke-virtual {v4, v11, v12, v13}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_124
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_e4 .. :try_end_124} :catch_aa

    .line 2016
    :goto_124
    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v12

    iput-object v12, v8, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    goto/16 :goto_c

    .line 1962
    .end local v11           #userData:[B
    .restart local v6       #ex:Lcom/android/internal/telephony/EncodeException;
    :catch_12c
    move-exception v10

    .line 1963
    .local v10, uex:Ljava/io/UnsupportedEncodingException;
    const-string v12, "SmsMessage"

    const-string v13, "Implausible UnsupportedEncodingException "

    invoke-static {v12, v13, v10}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 1966
    const/4 v8, 0x0

    goto/16 :goto_c

    .line 1977
    .end local v10           #uex:Ljava/io/UnsupportedEncodingException;
    .restart local v9       #textPart:[B
    :cond_137
    move-object v11, v9

    .restart local v11       #userData:[B
    goto :goto_d9

    .line 1997
    :cond_139
    const/16 v12, 0x8

    invoke-virtual {v4, v12}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2005
    move/from16 v0, p6

    invoke-virtual {v4, v0}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2006
    const-string v12, "SmsMessage"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "expirty = "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move/from16 v0, p6

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 2011
    array-length v12, v11

    invoke-virtual {v4, v12}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2013
    const/4 v12, 0x0

    array-length v13, v11

    invoke-virtual {v4, v11, v12, v13}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_124
.end method

.method public static getSubmitPduForKTOTA(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    .registers 14
    .parameter "scAddress"
    .parameter "destinationAddress"
    .parameter "message"

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x0

    .line 2046
    new-instance v4, Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;

    invoke-direct {v4}, Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;-><init>()V

    .line 2049
    .local v4, ret:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    const/4 v3, 0x1

    .line 2051
    .local v3, mtiByte:B
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/16 v6, 0xb4

    invoke-direct {v0, v6}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 2055
    .local v0, bo:Ljava/io/ByteArrayOutputStream;
    if-nez p0, :cond_4a

    .line 2056
    iput-object v8, v4, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    .line 2063
    :goto_13
    invoke-virtual {v0, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2066
    invoke-virtual {v0, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2071
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->networkPortionToCalledPartyBCD(Ljava/lang/String;)[B

    move-result-object v1

    .line 2075
    .local v1, daBytes:[B
    array-length v6, v1

    add-int/lit8 v6, v6, -0x1

    mul-int/lit8 v9, v6, 0x2

    array-length v6, v1

    add-int/lit8 v6, v6, -0x1

    aget-byte v6, v1, v6

    and-int/lit16 v6, v6, 0xf0

    const/16 v10, 0xf0

    if-ne v6, v10, :cond_51

    const/4 v6, 0x1

    :goto_2e
    sub-int v6, v9, v6

    invoke-virtual {v0, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2079
    array-length v6, v1

    invoke-virtual {v0, v1, v7, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 2082
    const/16 v6, 0x7f

    invoke-virtual {v0, v6}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2090
    :try_start_3c
    invoke-static {p2}, Lcom/android/internal/telephony/GsmAlphabet;->stringToGsm7BitPacked(Ljava/lang/String;)[B
    :try_end_3f
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_3c .. :try_end_3f} :catch_53

    move-result-object v5

    .line 2097
    .local v5, userData:[B
    aget-byte v6, v5, v7

    and-int/lit16 v6, v6, 0xff

    const/16 v9, 0xa0

    if-le v6, v9, :cond_5d

    move-object v4, v8

    .line 2109
    .end local v4           #ret:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    .end local v5           #userData:[B
    :goto_49
    return-object v4

    .line 2059
    .end local v1           #daBytes:[B
    .restart local v4       #ret:Lcom/android/internal/telephony/gsm/SmsMessage$SubmitPdu;
    :cond_4a
    invoke-static {p0}, Landroid/telephony/PhoneNumberUtils;->networkPortionToCalledPartyBCDWithLength(Ljava/lang/String;)[B

    move-result-object v6

    iput-object v6, v4, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    goto :goto_13

    .restart local v1       #daBytes:[B
    :cond_51
    move v6, v7

    .line 2075
    goto :goto_2e

    .line 2091
    :catch_53
    move-exception v2

    .line 2092
    .local v2, ex:Lcom/android/internal/telephony/EncodeException;
    const-string v6, "SmsMessage"

    const-string v7, "Implausible UnsupportedEncodingException "

    invoke-static {v6, v7, v2}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-object v4, v8

    .line 2094
    goto :goto_49

    .line 2103
    .end local v2           #ex:Lcom/android/internal/telephony/EncodeException;
    .restart local v5       #userData:[B
    :cond_5d
    invoke-virtual {v0, v7}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 2107
    array-length v6, v5

    invoke-virtual {v0, v5, v7, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 2108
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v6

    iput-object v6, v4, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedMessage:[B

    goto :goto_49
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

    .line 563
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const/16 v2, 0xb4

    invoke-direct {v0, v2}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 567
    .local v0, bo:Ljava/io/ByteArrayOutputStream;
    if-nez p0, :cond_3a

    .line 568
    const/4 v2, 0x0

    iput-object v2, p4, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    .line 577
    :goto_d
    if-eqz p3, :cond_12

    .line 579
    or-int/lit8 v2, p2, 0x20

    int-to-byte p2, v2

    .line 584
    :cond_12
    invoke-virtual {v0, p2}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 587
    invoke-virtual {v0, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 594
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->networkPortionToCalledPartyBCD(Ljava/lang/String;)[B

    move-result-object v1

    .line 599
    .local v1, daBytes:[B
    array-length v2, v1

    add-int/lit8 v2, v2, -0x1

    mul-int/lit8 v4, v2, 0x2

    array-length v2, v1

    add-int/lit8 v2, v2, -0x1

    aget-byte v2, v1, v2

    and-int/lit16 v2, v2, 0xf0

    const/16 v5, 0xf0

    if-ne v2, v5, :cond_41

    const/4 v2, 0x1

    :goto_2d
    sub-int v2, v4, v2

    invoke-virtual {v0, v2}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 603
    array-length v2, v1

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 606
    invoke-virtual {v0, v3}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 607
    return-object v0

    .line 570
    .end local v1           #daBytes:[B
    :cond_3a
    invoke-static {p0}, Landroid/telephony/PhoneNumberUtils;->networkPortionToCalledPartyBCDWithLength(Ljava/lang/String;)[B

    move-result-object v2

    iput-object v2, p4, Lcom/android/internal/telephony/SmsMessageBase$SubmitPduBase;->encodedScAddress:[B

    goto :goto_d

    .restart local v1       #daBytes:[B
    :cond_41
    move v2, v3

    .line 599
    goto :goto_2d
.end method

.method public static getTPLayerLengthForPDU(Ljava/lang/String;)I
    .registers 5
    .parameter "pdu"

    .prologue
    .line 300
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    div-int/lit8 v0, v2, 0x2

    .line 301
    .local v0, len:I
    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x10

    invoke-static {v2, v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v1

    .line 303
    .local v1, smscLen:I
    sub-int v2, v0, v1

    add-int/lit8 v2, v2, -0x1

    return v2
.end method

.method private static isSJIS2ByeteCharactor(B)Z
    .registers 3
    .parameter "in"

    .prologue
    .line 2666
    const/16 v0, 0x81

    and-int/lit16 v1, p0, 0xff

    if-gt v0, v1, :cond_c

    and-int/lit16 v0, p0, 0xff

    const/16 v1, 0x9f

    if-le v0, v1, :cond_30

    :cond_c
    const/16 v0, 0xe0

    and-int/lit16 v1, p0, 0xff

    if-gt v0, v1, :cond_18

    and-int/lit16 v0, p0, 0xff

    const/16 v1, 0xef

    if-le v0, v1, :cond_30

    :cond_18
    const/16 v0, 0xf3

    and-int/lit16 v1, p0, 0xff

    if-gt v0, v1, :cond_24

    and-int/lit16 v0, p0, 0xff

    const/16 v1, 0xf4

    if-le v0, v1, :cond_30

    :cond_24
    const/16 v0, 0xf6

    and-int/lit16 v1, p0, 0xff

    if-gt v0, v1, :cond_32

    and-int/lit16 v0, p0, 0xff

    const/16 v1, 0xf7

    if-gt v0, v1, :cond_32

    .line 2671
    :cond_30
    const/4 v0, 0x1

    .line 2674
    :goto_31
    return v0

    :cond_32
    const/4 v0, 0x0

    goto :goto_31
.end method

.method public static newFromCDS(Ljava/lang/String;)Lcom/android/internal/telephony/gsm/SmsMessage;
    .registers 5
    .parameter "line"

    .prologue
    .line 229
    :try_start_0
    new-instance v1, Lcom/android/internal/telephony/gsm/SmsMessage;

    invoke-direct {v1}, Lcom/android/internal/telephony/gsm/SmsMessage;-><init>()V

    .line 230
    .local v1, msg:Lcom/android/internal/telephony/gsm/SmsMessage;
    invoke-static {p0}, Lcom/android/internal/telephony/uicc/IccUtils;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/internal/telephony/gsm/SmsMessage;->parsePdu([B)V
    :try_end_c
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_c} :catch_d

    .line 238
    .end local v1           #msg:Lcom/android/internal/telephony/gsm/SmsMessage;
    :goto_c
    return-object v1

    .line 236
    :catch_d
    move-exception v0

    .line 237
    .local v0, ex:Ljava/lang/RuntimeException;
    const-string v2, "SmsMessage"

    const-string v3, "CDS SMS PDU parsing failed: "

    invoke-static {v2, v3, v0}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 238
    const/4 v1, 0x0

    goto :goto_c
.end method

.method public static newFromCMT([Ljava/lang/String;)Lcom/android/internal/telephony/gsm/SmsMessage;
    .registers 5
    .parameter "lines"

    .prologue
    .line 217
    :try_start_0
    new-instance v1, Lcom/android/internal/telephony/gsm/SmsMessage;

    invoke-direct {v1}, Lcom/android/internal/telephony/gsm/SmsMessage;-><init>()V

    .line 218
    .local v1, msg:Lcom/android/internal/telephony/gsm/SmsMessage;
    const/4 v2, 0x1

    aget-object v2, p0, v2

    invoke-static {v2}, Lcom/android/internal/telephony/uicc/IccUtils;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/internal/telephony/gsm/SmsMessage;->parsePdu([B)V
    :try_end_f
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_f} :catch_10

    .line 222
    .end local v1           #msg:Lcom/android/internal/telephony/gsm/SmsMessage;
    :goto_f
    return-object v1

    .line 220
    :catch_10
    move-exception v0

    .line 221
    .local v0, ex:Ljava/lang/RuntimeException;
    const-string v2, "SmsMessage"

    const-string v3, "SMS PDU parsing failed: "

    invoke-static {v2, v3, v0}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 222
    const/4 v1, 0x0

    goto :goto_f
.end method

.method private parsePdu([B)V
    .registers 6
    .parameter "pdu"

    .prologue
    .line 1126
    iput-object p1, p0, Lcom/android/internal/telephony/SmsMessageBase;->mPdu:[B

    .line 1130
    new-instance v1, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;

    invoke-direct {v1, p1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;-><init>([B)V

    .line 1132
    .local v1, p:Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;
    invoke-virtual {v1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getSCAddress()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/android/internal/telephony/SmsMessageBase;->mScAddress:Ljava/lang/String;

    .line 1134
    iget-object v2, p0, Lcom/android/internal/telephony/SmsMessageBase;->mScAddress:Ljava/lang/String;

    if-eqz v2, :cond_11

    .line 1142
    :cond_11
    invoke-virtual {v1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getByte()I

    move-result v0

    .line 1144
    .local v0, firstByte:I
    and-int/lit8 v2, v0, 0x3

    iput v2, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMti:I

    .line 1145
    iget v2, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMti:I

    packed-switch v2, :pswitch_data_32

    .line 1161
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "Unsupported message type"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1151
    :pswitch_26
    invoke-direct {p0, v1, v0}, Lcom/android/internal/telephony/gsm/SmsMessage;->parseSmsDeliver(Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;I)V

    .line 1163
    :goto_29
    return-void

    .line 1154
    :pswitch_2a
    invoke-direct {p0, v1, v0}, Lcom/android/internal/telephony/gsm/SmsMessage;->parseSmsSubmit(Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;I)V

    goto :goto_29

    .line 1157
    :pswitch_2e
    invoke-direct {p0, v1, v0}, Lcom/android/internal/telephony/gsm/SmsMessage;->parseSmsStatusReport(Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;I)V

    goto :goto_29

    .line 1145
    :pswitch_data_32
    .packed-switch 0x0
        :pswitch_26
        :pswitch_2a
        :pswitch_2e
        :pswitch_26
    .end packed-switch
.end method

.method private parseSmsDeliver(Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;I)V
    .registers 10
    .parameter "p"
    .parameter "firstByte"

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1216
    and-int/lit16 v2, p2, 0x80

    const/16 v5, 0x80

    if-ne v2, v5, :cond_a9

    move v2, v3

    :goto_9
    iput-boolean v2, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mReplyPathPresent:Z

    .line 1218
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getAddress()Lcom/android/internal/telephony/gsm/GsmSmsAddress;

    move-result-object v2

    iput-object v2, p0, Lcom/android/internal/telephony/SmsMessageBase;->mOriginatingAddress:Lcom/android/internal/telephony/SmsAddress;

    .line 1222
    iget-object v2, p0, Lcom/android/internal/telephony/SmsMessageBase;->mOriginatingAddress:Lcom/android/internal/telephony/SmsAddress;

    if-eqz v2, :cond_88

    .line 1223
    sget-boolean v2, Lcom/android/internal/telephony/gsm/SmsMessage;->CSCFEATURE_RIL_SPECIAL_ADDRESS_HANDLINGFOR:Z

    if-eqz v2, :cond_88

    .line 1224
    iget-object v2, p0, Lcom/android/internal/telephony/SmsMessageBase;->mOriginatingAddress:Lcom/android/internal/telephony/SmsAddress;

    iget-object v2, v2, Lcom/android/internal/telephony/SmsAddress;->address:Ljava/lang/String;

    const-string v5, "+00852"

    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_88

    .line 1225
    const-string v2, "SmsMessage"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "There is wrong format startwith +00852 Address Before = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/internal/telephony/SmsMessageBase;->mOriginatingAddress:Lcom/android/internal/telephony/SmsAddress;

    iget-object v6, v6, Lcom/android/internal/telephony/SmsAddress;->address:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/secutil/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1226
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/android/internal/telephony/SmsMessageBase;->mOriginatingAddress:Lcom/android/internal/telephony/SmsAddress;

    iget-object v2, v2, Lcom/android/internal/telephony/SmsAddress;->address:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 1227
    .local v1, origAddress:Ljava/lang/String;
    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 1228
    iget-object v2, p0, Lcom/android/internal/telephony/SmsMessageBase;->mOriginatingAddress:Lcom/android/internal/telephony/SmsAddress;

    const-string v5, "+"

    iput-object v5, v2, Lcom/android/internal/telephony/SmsAddress;->address:Ljava/lang/String;

    .line 1229
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/android/internal/telephony/SmsMessageBase;->mOriginatingAddress:Lcom/android/internal/telephony/SmsAddress;

    iget-object v6, v5, Lcom/android/internal/telephony/SmsAddress;->address:Ljava/lang/String;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v5, Lcom/android/internal/telephony/SmsAddress;->address:Ljava/lang/String;

    .line 1230
    const-string v2, "SmsMessage"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Address After Replacement = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/android/internal/telephony/SmsMessageBase;->mOriginatingAddress:Lcom/android/internal/telephony/SmsAddress;

    iget-object v6, v6, Lcom/android/internal/telephony/SmsAddress;->address:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Landroid/util/secutil/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 1235
    .end local v1           #origAddress:Ljava/lang/String;
    :cond_88
    iget-object v2, p0, Lcom/android/internal/telephony/SmsMessageBase;->mOriginatingAddress:Lcom/android/internal/telephony/SmsAddress;

    if-eqz v2, :cond_8c

    .line 1242
    :cond_8c
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getByte()I

    move-result v2

    iput v2, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mProtocolIdentifier:I

    .line 1246
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getByte()I

    move-result v2

    iput v2, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    .line 1253
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getSCTimestampMillis()J

    move-result-wide v5

    iput-wide v5, p0, Lcom/android/internal/telephony/SmsMessageBase;->mScTimeMillis:J

    .line 1257
    and-int/lit8 v2, p2, 0x40

    const/16 v5, 0x40

    if-ne v2, v5, :cond_ac

    move v0, v3

    .line 1259
    .local v0, hasUserDataHeader:Z
    :goto_a5
    invoke-direct {p0, p1, v0}, Lcom/android/internal/telephony/gsm/SmsMessage;->parseUserData(Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;Z)V

    .line 1260
    return-void

    .end local v0           #hasUserDataHeader:Z
    :cond_a9
    move v2, v4

    .line 1216
    goto/16 :goto_9

    :cond_ac
    move v0, v4

    .line 1257
    goto :goto_a5
.end method

.method private parseSmsStatusReport(Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;I)V
    .registers 8
    .parameter "p"
    .parameter "firstByte"

    .prologue
    const/4 v1, 0x1

    .line 1172
    iput-boolean v1, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mIsStatusReportMessage:Z

    .line 1175
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getByte()I

    move-result v3

    iput v3, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMessageRef:I

    .line 1177
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getAddress()Lcom/android/internal/telephony/gsm/GsmSmsAddress;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mRecipientAddress:Lcom/android/internal/telephony/gsm/GsmSmsAddress;

    .line 1179
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getSCTimestampMillis()J

    move-result-wide v3

    iput-wide v3, p0, Lcom/android/internal/telephony/SmsMessageBase;->mScTimeMillis:J

    .line 1180
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getSCTimestampMillis()J

    .line 1182
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getByte()I

    move-result v3

    iput v3, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mStatus:I

    .line 1185
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->moreDataPresent()Z

    move-result v3

    if-eqz v3, :cond_57

    .line 1187
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getByte()I

    move-result v0

    .line 1188
    .local v0, extraParams:I
    move v2, v0

    .line 1189
    .local v2, moreExtraParams:I
    :goto_29
    and-int/lit16 v3, v2, 0x80

    if-eqz v3, :cond_32

    .line 1193
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getByte()I

    move-result v2

    goto :goto_29

    .line 1197
    :cond_32
    and-int/lit8 v3, v0, 0x78

    if-nez v3, :cond_57

    .line 1199
    and-int/lit8 v3, v0, 0x1

    if-eqz v3, :cond_40

    .line 1200
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getByte()I

    move-result v3

    iput v3, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mProtocolIdentifier:I

    .line 1203
    :cond_40
    and-int/lit8 v3, v0, 0x2

    if-eqz v3, :cond_4a

    .line 1204
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getByte()I

    move-result v3

    iput v3, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    .line 1207
    :cond_4a
    and-int/lit8 v3, v0, 0x4

    if-eqz v3, :cond_57

    .line 1208
    and-int/lit8 v3, p2, 0x40

    const/16 v4, 0x40

    if-ne v3, v4, :cond_58

    .line 1209
    .local v1, hasUserDataHeader:Z
    :goto_54
    invoke-direct {p0, p1, v1}, Lcom/android/internal/telephony/gsm/SmsMessage;->parseUserData(Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;Z)V

    .line 1213
    .end local v0           #extraParams:I
    .end local v1           #hasUserDataHeader:Z
    .end local v2           #moreExtraParams:I
    :cond_57
    return-void

    .line 1208
    .restart local v0       #extraParams:I
    .restart local v2       #moreExtraParams:I
    :cond_58
    const/4 v1, 0x0

    goto :goto_54
.end method

.method private parseSmsSubmit(Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;I)V
    .registers 11
    .parameter "p"
    .parameter "firstByte"

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 1269
    and-int/lit16 v4, p2, 0x80

    const/16 v7, 0x80

    if-ne v4, v7, :cond_39

    move v4, v5

    :goto_9
    iput-boolean v4, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mReplyPathPresent:Z

    .line 1272
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getByte()I

    move-result v4

    iput v4, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMessageRef:I

    .line 1276
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getAddress()Lcom/android/internal/telephony/gsm/GsmSmsAddress;

    move-result-object v4

    iput-object v4, p0, Lcom/android/internal/telephony/SmsMessageBase;->recipientAddress:Lcom/android/internal/telephony/SmsAddress;

    .line 1281
    iget-object v4, p0, Lcom/android/internal/telephony/SmsMessageBase;->recipientAddress:Lcom/android/internal/telephony/SmsAddress;

    if-eqz v4, :cond_1b

    .line 1288
    :cond_1b
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getByte()I

    move-result v4

    iput v4, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mProtocolIdentifier:I

    .line 1292
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getByte()I

    move-result v4

    iput v4, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    .line 1300
    const/4 v2, 0x0

    .line 1301
    .local v2, validityPeriodLength:I
    shr-int/lit8 v4, p2, 0x3

    and-int/lit8 v1, v4, 0x3

    .line 1302
    .local v1, validityPeriodFormat:I
    if-nez v1, :cond_3b

    .line 1304
    const/4 v2, 0x0

    move v3, v2

    .line 1316
    .end local v2           #validityPeriodLength:I
    .local v3, validityPeriodLength:I
    :goto_30
    add-int/lit8 v2, v3, -0x1

    .end local v3           #validityPeriodLength:I
    .restart local v2       #validityPeriodLength:I
    if-lez v3, :cond_44

    .line 1318
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getByte()I

    move v3, v2

    .end local v2           #validityPeriodLength:I
    .restart local v3       #validityPeriodLength:I
    goto :goto_30

    .end local v1           #validityPeriodFormat:I
    .end local v3           #validityPeriodLength:I
    :cond_39
    move v4, v6

    .line 1269
    goto :goto_9

    .line 1306
    .restart local v1       #validityPeriodFormat:I
    .restart local v2       #validityPeriodLength:I
    :cond_3b
    const/4 v4, 0x2

    if-ne v4, v1, :cond_41

    .line 1308
    const/4 v2, 0x1

    move v3, v2

    .end local v2           #validityPeriodLength:I
    .restart local v3       #validityPeriodLength:I
    goto :goto_30

    .line 1312
    .end local v3           #validityPeriodLength:I
    .restart local v2       #validityPeriodLength:I
    :cond_41
    const/4 v2, 0x7

    move v3, v2

    .end local v2           #validityPeriodLength:I
    .restart local v3       #validityPeriodLength:I
    goto :goto_30

    .line 1321
    .end local v3           #validityPeriodLength:I
    .restart local v2       #validityPeriodLength:I
    :cond_44
    and-int/lit8 v4, p2, 0x40

    const/16 v7, 0x40

    if-ne v4, v7, :cond_4f

    move v0, v5

    .line 1323
    .local v0, hasUserDataHeader:Z
    :goto_4b
    invoke-direct {p0, p1, v0}, Lcom/android/internal/telephony/gsm/SmsMessage;->parseUserData(Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;Z)V

    .line 1324
    return-void

    .end local v0           #hasUserDataHeader:Z
    :cond_4f
    move v0, v6

    .line 1321
    goto :goto_4b
.end method

.method private parseUserData(Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;Z)V
    .registers 15
    .parameter "p"
    .parameter "hasUserDataHeader"

    .prologue
    const/16 v11, 0xe0

    const/16 v10, 0xc0

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 1334
    const/4 v3, 0x0

    .line 1335
    .local v3, hasMessageClass:Z
    const/4 v5, 0x0

    .line 1337
    .local v5, userDataCompressed:Z
    const/4 v2, 0x0

    .line 1340
    .local v2, encodingType:I
    const/4 v4, 0x0

    .line 1343
    .local v4, isChangedmwiSense:Z
    const/4 v4, 0x0

    .line 1344
    iput-boolean v7, p0, Lcom/android/internal/telephony/SmsMessageBase;->mIsMwi:Z

    .line 1345
    iput-boolean v7, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMwiSense:Z

    .line 1346
    iput-boolean v6, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMwiDontStore:Z

    .line 1347
    const/16 v8, 0xff

    iput v8, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->numberOfMessages:I

    .line 1348
    iget-object v8, p0, Lcom/android/internal/telephony/SmsMessageBase;->mUserDataHeader:Lcom/android/internal/telephony/SmsHeader;

    sput-boolean v7, Lcom/android/internal/telephony/SmsHeader;->udhi_isMwi:Z

    .line 1354
    iget v8, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    and-int/lit16 v8, v8, 0xff

    const/16 v9, 0x84

    if-ne v8, v9, :cond_100

    .line 1355
    const/4 v2, 0x4

    .line 1477
    :goto_22
    if-ne v2, v6, :cond_23d

    move v8, v6

    :goto_25
    invoke-virtual {p1, p2, v8}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->constructUserData(ZZ)I

    move-result v1

    .line 1479
    .local v1, count:I
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getUserData()[B

    move-result-object v8

    iput-object v8, p0, Lcom/android/internal/telephony/SmsMessageBase;->mUserData:[B

    .line 1480
    invoke-virtual {p1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getUserDataHeader()Lcom/android/internal/telephony/SmsHeader;

    move-result-object v8

    iput-object v8, p0, Lcom/android/internal/telephony/SmsMessageBase;->mUserDataHeader:Lcom/android/internal/telephony/SmsHeader;

    .line 1545
    const-string v8, "SmsMessage"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "udhi_isMwi: isMwi = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/android/internal/telephony/SmsMessageBase;->mUserDataHeader:Lcom/android/internal/telephony/SmsHeader;

    sget-boolean v10, Lcom/android/internal/telephony/SmsHeader;->udhi_isMwi:Z

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/secutil/Log;->secI(Ljava/lang/String;Ljava/lang/String;)I

    .line 1547
    if-eqz p2, :cond_db

    iget-object v8, p0, Lcom/android/internal/telephony/SmsMessageBase;->mUserDataHeader:Lcom/android/internal/telephony/SmsHeader;

    sget-boolean v8, Lcom/android/internal/telephony/SmsHeader;->udhi_isMwi:Z

    if-eqz v8, :cond_db

    .line 1548
    iget-object v8, p0, Lcom/android/internal/telephony/SmsMessageBase;->mUserDataHeader:Lcom/android/internal/telephony/SmsHeader;

    sget-boolean v8, Lcom/android/internal/telephony/SmsHeader;->udhi_isMwi:Z

    iput-boolean v8, p0, Lcom/android/internal/telephony/SmsMessageBase;->mIsMwi:Z

    .line 1549
    if-nez v4, :cond_63

    .line 1550
    iput-boolean v6, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMwiSense:Z

    .line 1555
    :cond_63
    iget-boolean v6, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMwiDontStore:Z

    if-eqz v6, :cond_6d

    .line 1556
    iget-object v6, p0, Lcom/android/internal/telephony/SmsMessageBase;->mUserDataHeader:Lcom/android/internal/telephony/SmsHeader;

    sget-boolean v6, Lcom/android/internal/telephony/SmsHeader;->udhi_mwiDontStore:Z

    iput-boolean v6, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMwiDontStore:Z

    .line 1558
    :cond_6d
    iget-object v6, p0, Lcom/android/internal/telephony/SmsMessageBase;->mUserDataHeader:Lcom/android/internal/telephony/SmsHeader;

    sget v6, Lcom/android/internal/telephony/SmsHeader;->udhi_voicemailcount:I

    iput v6, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->numberOfMessages:I

    .line 1559
    const-string v6, "SmsMessage"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "mwisettings: isMwi = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-boolean v9, p0, Lcom/android/internal/telephony/SmsMessageBase;->mIsMwi:Z

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1560
    const-string v6, "SmsMessage"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "mwisettings: mwiSense = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-boolean v9, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMwiSense:Z

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1561
    const-string v6, "SmsMessage"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "mwisettings: mwiDontStore = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-boolean v9, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMwiDontStore:Z

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1562
    const-string v6, "SmsMessage"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "mwisettings: numberOfMessages = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->numberOfMessages:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1567
    :cond_db
    packed-switch v2, :pswitch_data_28c

    .line 1590
    :goto_de
    iget-object v6, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMessageBody:Ljava/lang/String;

    if-eqz v6, :cond_f9

    .line 1592
    iget-object v6, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMessageBody:Ljava/lang/String;

    const-string v7, "\r\n"

    const-string v8, "\n"

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v6

    const/16 v7, 0xd

    const/16 v8, 0xa

    invoke-virtual {v6, v7, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMessageBody:Ljava/lang/String;

    .line 1594
    invoke-virtual {p0}, Lcom/android/internal/telephony/SmsMessageBase;->parseMessageBody()V

    .line 1597
    :cond_f9
    if-nez v3, :cond_26b

    .line 1598
    sget-object v6, Lcom/android/internal/telephony/SmsConstants$MessageClass;->UNKNOWN:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    iput-object v6, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->messageClass:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    .line 1615
    :goto_ff
    return-void

    .line 1356
    .end local v1           #count:I
    :cond_100
    iget v8, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    and-int/lit16 v8, v8, 0x80

    if-nez v8, :cond_170

    .line 1357
    iget v8, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    and-int/lit8 v8, v8, 0x20

    if-eqz v8, :cond_136

    move v5, v6

    .line 1358
    :goto_10d
    iget v8, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    and-int/lit8 v8, v8, 0x10

    if-eqz v8, :cond_138

    move v3, v6

    .line 1360
    :goto_114
    if-eqz v5, :cond_13a

    .line 1361
    const-string v8, "SmsMessage"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "4 - Unsupported SMS data coding scheme (compression) "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    and-int/lit16 v10, v10, 0xff

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1363
    sput-boolean v6, Lcom/android/internal/telephony/gsm/SmsMessage;->unsupportedDatacodingScheme:Z

    goto/16 :goto_22

    :cond_136
    move v5, v7

    .line 1357
    goto :goto_10d

    :cond_138
    move v3, v7

    .line 1358
    goto :goto_114

    .line 1365
    :cond_13a
    iget v8, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    shr-int/lit8 v8, v8, 0x2

    and-int/lit8 v8, v8, 0x3

    packed-switch v8, :pswitch_data_29a

    goto/16 :goto_22

    .line 1367
    :pswitch_145
    const/4 v2, 0x1

    .line 1368
    sput-boolean v7, Lcom/android/internal/telephony/gsm/SmsMessage;->unsupportedDatacodingScheme:Z

    goto/16 :goto_22

    .line 1372
    :pswitch_14a
    const/4 v2, 0x3

    .line 1373
    sput-boolean v7, Lcom/android/internal/telephony/gsm/SmsMessage;->unsupportedDatacodingScheme:Z

    goto/16 :goto_22

    .line 1384
    :pswitch_14f
    const-string v8, "SmsMessage"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "1 - Unsupported SMS data coding scheme "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    and-int/lit16 v10, v10, 0xff

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1386
    const/4 v2, 0x2

    .line 1387
    sput-boolean v7, Lcom/android/internal/telephony/gsm/SmsMessage;->unsupportedDatacodingScheme:Z

    goto/16 :goto_22

    .line 1392
    :cond_170
    iget v8, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    and-int/lit16 v8, v8, 0xf0

    const/16 v9, 0xf0

    if-ne v8, v9, :cond_188

    .line 1393
    const/4 v3, 0x1

    .line 1394
    const/4 v5, 0x0

    .line 1395
    sput-boolean v7, Lcom/android/internal/telephony/gsm/SmsMessage;->unsupportedDatacodingScheme:Z

    .line 1397
    iget v8, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    and-int/lit8 v8, v8, 0x4

    if-nez v8, :cond_185

    .line 1399
    const/4 v2, 0x1

    goto/16 :goto_22

    .line 1402
    :cond_185
    const/4 v2, 0x2

    goto/16 :goto_22

    .line 1404
    :cond_188
    iget v8, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    and-int/lit16 v8, v8, 0xf0

    if-eq v8, v10, :cond_19c

    iget v8, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    and-int/lit16 v8, v8, 0xf0

    const/16 v9, 0xd0

    if-eq v8, v9, :cond_19c

    iget v8, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    and-int/lit16 v8, v8, 0xf0

    if-ne v8, v11, :cond_1f5

    .line 1413
    :cond_19c
    sput-boolean v7, Lcom/android/internal/telephony/gsm/SmsMessage;->unsupportedDatacodingScheme:Z

    .line 1416
    iget v8, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    and-int/lit16 v8, v8, 0xf0

    if-ne v8, v10, :cond_1c5

    move v8, v6

    :goto_1a5
    iput-boolean v8, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMwiDontStore:Z

    .line 1417
    iput-boolean v6, p0, Lcom/android/internal/telephony/SmsMessageBase;->mIsMwi:Z

    .line 1419
    iget v8, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    and-int/lit16 v8, v8, 0xf0

    if-ne v8, v11, :cond_1c7

    .line 1420
    const/4 v2, 0x3

    .line 1425
    :goto_1b0
    const/4 v5, 0x0

    .line 1426
    iget v8, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    and-int/lit8 v8, v8, 0x8

    const/16 v9, 0x8

    if-ne v8, v9, :cond_1c9

    move v0, v6

    .line 1427
    .local v0, active:Z
    :goto_1ba
    iput-boolean v0, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMwiSense:Z

    .line 1431
    iget v8, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    and-int/lit8 v8, v8, 0x3

    if-nez v8, :cond_1cb

    .line 1433
    const/4 v4, 0x1

    goto/16 :goto_22

    .end local v0           #active:Z
    :cond_1c5
    move v8, v7

    .line 1416
    goto :goto_1a5

    .line 1422
    :cond_1c7
    const/4 v2, 0x1

    goto :goto_1b0

    :cond_1c9
    move v0, v7

    .line 1426
    goto :goto_1ba

    .line 1440
    .restart local v0       #active:Z
    :cond_1cb
    const-string v8, "SmsMessage"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "MWI in DCS for fax/email/other: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    and-int/lit16 v10, v10, 0xff

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " Dont store = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-boolean v10, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMwiDontStore:Z

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_22

    .line 1444
    .end local v0           #active:Z
    :cond_1f5
    iget v8, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    and-int/lit16 v8, v8, 0xc0

    const/16 v9, 0x80

    if-ne v8, v9, :cond_21d

    .line 1464
    sput-boolean v6, Lcom/android/internal/telephony/gsm/SmsMessage;->unsupportedDatacodingScheme:Z

    .line 1465
    const-string v8, "SmsMessage"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "5 - Unsupported SMS data coding scheme "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    and-int/lit16 v10, v10, 0xff

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_22

    .line 1469
    :cond_21d
    const-string v8, "SmsMessage"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "3 - Unsupported SMS data coding scheme "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    and-int/lit16 v10, v10, 0xff

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1473
    sput-boolean v6, Lcom/android/internal/telephony/gsm/SmsMessage;->unsupportedDatacodingScheme:Z

    goto/16 :goto_22

    :cond_23d
    move v8, v7

    .line 1477
    goto/16 :goto_25

    .line 1570
    .restart local v1       #count:I
    :pswitch_240
    const/4 v6, 0x0

    iput-object v6, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMessageBody:Ljava/lang/String;

    goto/16 :goto_de

    .line 1574
    :pswitch_245
    if-eqz p2, :cond_259

    iget-object v6, p0, Lcom/android/internal/telephony/SmsMessageBase;->mUserDataHeader:Lcom/android/internal/telephony/SmsHeader;

    iget v6, v6, Lcom/android/internal/telephony/SmsHeader;->languageTable:I

    :goto_24b
    if-eqz p2, :cond_251

    iget-object v7, p0, Lcom/android/internal/telephony/SmsMessageBase;->mUserDataHeader:Lcom/android/internal/telephony/SmsHeader;

    iget v7, v7, Lcom/android/internal/telephony/SmsHeader;->languageShiftTable:I

    :cond_251
    invoke-virtual {p1, v1, v6, v7}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getUserDataGSM7Bit(III)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMessageBody:Ljava/lang/String;

    goto/16 :goto_de

    :cond_259
    move v6, v7

    goto :goto_24b

    .line 1580
    :pswitch_25b
    invoke-virtual {p1, v1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getUserDataUCS2(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMessageBody:Ljava/lang/String;

    goto/16 :goto_de

    .line 1584
    :pswitch_263
    invoke-virtual {p1, v1}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getUserDataKSC5601(I)Ljava/lang/String;

    move-result-object v6

    iput-object v6, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMessageBody:Ljava/lang/String;

    goto/16 :goto_de

    .line 1600
    :cond_26b
    iget v6, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    and-int/lit8 v6, v6, 0x3

    packed-switch v6, :pswitch_data_2a6

    goto/16 :goto_ff

    .line 1602
    :pswitch_274
    sget-object v6, Lcom/android/internal/telephony/SmsConstants$MessageClass;->CLASS_0:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    iput-object v6, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->messageClass:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    goto/16 :goto_ff

    .line 1605
    :pswitch_27a
    sget-object v6, Lcom/android/internal/telephony/SmsConstants$MessageClass;->CLASS_1:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    iput-object v6, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->messageClass:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    goto/16 :goto_ff

    .line 1608
    :pswitch_280
    sget-object v6, Lcom/android/internal/telephony/SmsConstants$MessageClass;->CLASS_2:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    iput-object v6, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->messageClass:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    goto/16 :goto_ff

    .line 1611
    :pswitch_286
    sget-object v6, Lcom/android/internal/telephony/SmsConstants$MessageClass;->CLASS_3:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    iput-object v6, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->messageClass:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    goto/16 :goto_ff

    .line 1567
    :pswitch_data_28c
    .packed-switch 0x0
        :pswitch_240
        :pswitch_245
        :pswitch_240
        :pswitch_25b
        :pswitch_263
    .end packed-switch

    .line 1365
    :pswitch_data_29a
    .packed-switch 0x0
        :pswitch_145
        :pswitch_14f
        :pswitch_14a
        :pswitch_14f
    .end packed-switch

    .line 1600
    :pswitch_data_2a6
    .packed-switch 0x0
        :pswitch_274
        :pswitch_27a
        :pswitch_280
        :pswitch_286
    .end packed-switch
.end method


# virtual methods
.method getDataCodingScheme()I
    .registers 2

    .prologue
    .line 1021
    iget v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mDataCodingScheme:I

    return v0
.end method

.method public getMessageClass()Lcom/android/internal/telephony/SmsConstants$MessageClass;
    .registers 2

    .prologue
    .line 1622
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->messageClass:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    return-object v0
.end method

.method public getMessageIdentifier()I
    .registers 2

    .prologue
    .line 1641
    const/4 v0, 0x0

    return v0
.end method

.method public getMessagePriority()I
    .registers 3

    .prologue
    .line 2593
    const-string v0, "SmsMessage"

    const-string v1, "getMessagePriority: is not supported in GSM mode."

    invoke-static {v0, v1}, Landroid/util/secutil/Log;->secW(Ljava/lang/String;Ljava/lang/String;)I

    .line 2594
    const/4 v0, 0x0

    return v0
.end method

.method public getNumOfVoicemails()I
    .registers 2

    .prologue
    .line 1646
    iget v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->numberOfMessages:I

    return v0
.end method

.method public getProtocolIdentifier()I
    .registers 2

    .prologue
    .line 1013
    iget v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mProtocolIdentifier:I

    return v0
.end method

.method public getRecipientAddress()Ljava/lang/String;
    .registers 2

    .prologue
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mRecipientAddress:Lcom/android/internal/telephony/gsm/GsmSmsAddress;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mRecipientAddress:Lcom/android/internal/telephony/gsm/GsmSmsAddress;

    invoke-virtual {v0}, Lcom/android/internal/telephony/gsm/GsmSmsAddress;->getAddressString()Ljava/lang/String;

    move-result-object v0

    :goto_a
    return-object v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getStatus()I
    .registers 2

    .prologue
    .line 1102
    iget v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mStatus:I

    return v0
.end method

.method public isCphsMwiMessage()Z
    .registers 2

    .prologue
    .line 1035
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

    .line 1042
    iget-boolean v0, p0, Lcom/android/internal/telephony/SmsMessageBase;->mIsMwi:Z

    if-eqz v0, :cond_a

    iget-boolean v0, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMwiSense:Z

    if-nez v0, :cond_a

    .line 1046
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

    .line 1053
    iget-boolean v0, p0, Lcom/android/internal/telephony/SmsMessageBase;->mIsMwi:Z

    if-eqz v0, :cond_a

    iget-boolean v0, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMwiSense:Z

    if-eqz v0, :cond_a

    .line 1057
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
    .registers 5

    .prologue
    const/4 v1, 0x1

    .line 1064
    iget-boolean v2, p0, Lcom/android/internal/telephony/SmsMessageBase;->mIsMwi:Z

    if-eqz v2, :cond_a

    iget-boolean v2, p0, Lcom/android/internal/telephony/SmsMessageBase;->mMwiDontStore:Z

    if-eqz v2, :cond_a

    .line 1096
    :cond_9
    :goto_9
    return v1

    .line 1068
    :cond_a
    invoke-virtual {p0}, Lcom/android/internal/telephony/gsm/SmsMessage;->isCphsMwiMessage()Z

    move-result v2

    if-eqz v2, :cond_32

    .line 1074
    const-string v2, " "

    invoke-virtual {p0}, Lcom/android/internal/telephony/SmsMessageBase;->getMessageBody()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9

    .line 1077
    const-string v2, "ro.csc.sales_code"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1078
    .local v0, SalesCode:Ljava/lang/String;
    const-string v2, "RWC"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_32

    .line 1079
    const-string v2, "SmsMessage"

    const-string v3, "This is CPHS MWI message in Canada Rogers."

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9

    .line 1092
    .end local v0           #SalesCode:Ljava/lang/String;
    :cond_32
    invoke-virtual {p0}, Lcom/android/internal/telephony/SmsMessageBase;->getMessageBody()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_42

    invoke-virtual {p0}, Lcom/android/internal/telephony/SmsMessageBase;->getMessageBody()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_42

    .line 1096
    :cond_42
    const/4 v1, 0x0

    goto :goto_9
.end method

.method public isReplace()Z
    .registers 3

    .prologue
    .line 1027
    iget v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mProtocolIdentifier:I

    and-int/lit16 v0, v0, 0xc0

    const/16 v1, 0x40

    if-ne v0, v1, :cond_18

    iget v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mProtocolIdentifier:I

    and-int/lit8 v0, v0, 0x3f

    if-lez v0, :cond_18

    iget v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mProtocolIdentifier:I

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
    .line 1114
    iget-boolean v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mReplyPathPresent:Z

    return v0
.end method

.method public isStatusReportMessage()Z
    .registers 2

    .prologue
    .line 1108
    iget-boolean v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mIsStatusReportMessage:Z

    return v0
.end method

.method public isTypeZero()Z
    .registers 3

    .prologue
    .line 203
    iget v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mProtocolIdentifier:I

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
    .line 1632
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->messageClass:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    sget-object v1, Lcom/android/internal/telephony/SmsConstants$MessageClass;->CLASS_2:Lcom/android/internal/telephony/SmsConstants$MessageClass;

    if-ne v0, v1, :cond_14

    iget v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mProtocolIdentifier:I

    const/16 v1, 0x7f

    if-eq v0, v1, :cond_12

    iget v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage;->mProtocolIdentifier:I

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
