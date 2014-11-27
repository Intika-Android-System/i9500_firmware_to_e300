.class Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;
.super Ljava/lang/Object;
.source "SmsMessage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/gsm/SmsMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PduParser"
.end annotation


# instance fields
.field mCur:I

.field mPdu:[B

.field mUserData:[B

.field mUserDataHeader:Lcom/android/internal/telephony/SmsHeader;

.field mUserDataSeptetPadding:I

.field validityPeriodFormat:I


# direct methods
.method constructor <init>([B)V
    .registers 3
    .parameter "pdu"

    .prologue
    const/4 v0, 0x0

    .line 618
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 616
    iput v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->validityPeriodFormat:I

    .line 619
    iput-object p1, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    .line 620
    iput v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    .line 621
    iput v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserDataSeptetPadding:I

    .line 622
    return-void
.end method

.method private static KddiReplaceGsmUserData([B)[B
    .registers 11
    .parameter "data"

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v7, 0x2

    .line 955
    const/4 v1, 0x0

    .line 956
    .local v1, offset:I
    const/4 v5, 0x4

    new-array v4, v5, [[B

    new-array v5, v7, [B

    fill-array-data v5, :array_4a

    aput-object v5, v4, v8

    new-array v5, v7, [B

    fill-array-data v5, :array_50

    aput-object v5, v4, v9

    new-array v5, v7, [B

    fill-array-data v5, :array_56

    aput-object v5, v4, v7

    const/4 v5, 0x3

    new-array v6, v7, [B

    fill-array-data v6, :array_5c

    aput-object v6, v4, v5

    .line 962
    .local v4, smsType:[[B
    array-length v5, p0

    if-lt v5, v7, :cond_3d

    .line 963
    const/4 v0, 0x0

    .local v0, i:I
    :goto_28
    array-length v5, v4

    if-le v5, v0, :cond_3d

    .line 964
    aget-object v5, v4, v0

    aget-byte v5, v5, v8

    aget-byte v6, p0, v8

    if-ne v5, v6, :cond_46

    aget-object v5, v4, v0

    aget-byte v5, v5, v9

    aget-byte v6, p0, v9

    if-ne v5, v6, :cond_46

    .line 966
    add-int/lit8 v1, v1, 0x2

    .line 973
    .end local v0           #i:I
    :cond_3d
    array-length v5, p0

    sub-int v3, v5, v1

    .line 974
    .local v3, resultDataLen:I
    new-array v2, v3, [B

    .line 975
    .local v2, resultData:[B
    invoke-static {p0, v1, v2, v8, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 977
    return-object v2

    .line 963
    .end local v2           #resultData:[B
    .end local v3           #resultDataLen:I
    .restart local v0       #i:I
    :cond_46
    add-int/lit8 v0, v0, 0x1

    goto :goto_28

    .line 956
    nop

    :array_4a
    .array-data 0x1
        0x2t
        0x1t
    .end array-data

    nop

    :array_50
    .array-data 0x1
        0x0t
        0x1t
    .end array-data

    nop

    :array_56
    .array-data 0x1
        0x1t
        0x1t
    .end array-data

    nop

    :array_5c
    .array-data 0x1
        0x1t
        0x2t
    .end array-data
.end method


# virtual methods
.method constructUserData(ZZ)I
    .registers 16
    .parameter "hasUserDataHeader"
    .parameter "dataInSeptets"

    .prologue
    const/4 v10, 0x0

    .line 738
    iget v4, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    .line 741
    .local v4, offset:I
    iget v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->validityPeriodFormat:I

    packed-switch v9, :pswitch_data_90

    .line 753
    :goto_8
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    add-int/lit8 v5, v4, 0x1

    .end local v4           #offset:I
    .local v5, offset:I
    aget-byte v9, v9, v4

    and-int/lit16 v8, v9, 0xff

    .line 754
    .local v8, userDataLength:I
    const/4 v3, 0x0

    .line 755
    .local v3, headerSeptets:I
    const/4 v7, 0x0

    .line 757
    .local v7, userDataHeaderLength:I
    if-eqz p1, :cond_8d

    .line 758
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    add-int/lit8 v4, v5, 0x1

    .end local v5           #offset:I
    .restart local v4       #offset:I
    aget-byte v9, v9, v5

    and-int/lit16 v7, v9, 0xff

    .line 760
    new-array v6, v7, [B

    .line 761
    .local v6, udh:[B
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    invoke-static {v9, v4, v6, v10, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 762
    invoke-static {v6}, Lcom/android/internal/telephony/SmsHeader;->fromByteArray([B)Lcom/android/internal/telephony/SmsHeader;

    move-result-object v9

    iput-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserDataHeader:Lcom/android/internal/telephony/SmsHeader;

    .line 763
    add-int/2addr v4, v7

    .line 765
    add-int/lit8 v9, v7, 0x1

    mul-int/lit8 v2, v9, 0x8

    .line 766
    .local v2, headerBits:I
    div-int/lit8 v3, v2, 0x7

    .line 767
    rem-int/lit8 v9, v2, 0x7

    if-lez v9, :cond_64

    const/4 v9, 0x1

    :goto_35
    add-int/2addr v3, v9

    .line 768
    mul-int/lit8 v9, v3, 0x7

    sub-int/2addr v9, v2

    iput v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserDataSeptetPadding:I

    .line 772
    .end local v2           #headerBits:I
    .end local v6           #udh:[B
    :goto_3b
    if-eqz p2, :cond_66

    .line 778
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    array-length v9, v9

    sub-int v0, v9, v4

    .line 790
    .local v0, bufferLen:I
    :cond_42
    :goto_42
    new-array v9, v0, [B

    iput-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserData:[B

    .line 793
    invoke-static {}, Lcom/android/internal/telephony/gsm/SmsMessage;->access$000()Z

    move-result v9

    if-nez v9, :cond_72

    .line 794
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget-object v11, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserData:[B

    iget-object v12, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserData:[B

    array-length v12, v12

    invoke-static {v9, v4, v11, v10, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 799
    :goto_56
    iput v4, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    .line 801
    if-eqz p2, :cond_89

    .line 803
    sub-int v1, v8, v3

    .line 805
    .local v1, count:I
    if-gez v1, :cond_87

    .line 808
    .end local v1           #count:I
    :goto_5e
    return v10

    .line 744
    .end local v0           #bufferLen:I
    .end local v3           #headerSeptets:I
    .end local v7           #userDataHeaderLength:I
    .end local v8           #userDataLength:I
    :pswitch_5f
    const/4 v4, 0x7

    .line 745
    goto :goto_8

    .line 747
    :pswitch_61
    add-int/lit8 v4, v4, 0x1

    .line 748
    goto :goto_8

    .restart local v2       #headerBits:I
    .restart local v3       #headerSeptets:I
    .restart local v6       #udh:[B
    .restart local v7       #userDataHeaderLength:I
    .restart local v8       #userDataLength:I
    :cond_64
    move v9, v10

    .line 767
    goto :goto_35

    .line 784
    .end local v2           #headerBits:I
    .end local v6           #udh:[B
    :cond_66
    if-eqz p1, :cond_70

    add-int/lit8 v9, v7, 0x1

    :goto_6a
    sub-int v0, v8, v9

    .line 785
    .restart local v0       #bufferLen:I
    if-gez v0, :cond_42

    .line 786
    const/4 v0, 0x0

    goto :goto_42

    .end local v0           #bufferLen:I
    :cond_70
    move v9, v10

    .line 784
    goto :goto_6a

    .line 795
    .restart local v0       #bufferLen:I
    :cond_72
    if-eqz p1, :cond_7f

    .line 796
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget-object v11, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserData:[B

    iget-object v12, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserData:[B

    array-length v12, v12

    invoke-static {v9, v4, v11, v10, v12}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_56

    .line 798
    :cond_7f
    const-string v9, "SmsMessage"

    const-string v11, "array copy skip! if dataCodingScheme is unsupporting,\n encodingType is Unknown and messageBody is null"

    invoke-static {v9, v11}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_56

    .restart local v1       #count:I
    :cond_87
    move v10, v1

    .line 805
    goto :goto_5e

    .line 808
    .end local v1           #count:I
    :cond_89
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserData:[B

    array-length v10, v9

    goto :goto_5e

    .end local v0           #bufferLen:I
    .end local v4           #offset:I
    .restart local v5       #offset:I
    :cond_8d
    move v4, v5

    .end local v5           #offset:I
    .restart local v4       #offset:I
    goto :goto_3b

    .line 741
    nop

    :pswitch_data_90
    .packed-switch 0x1
        :pswitch_5f
        :pswitch_61
        :pswitch_5f
    .end packed-switch
.end method

.method getAddress()Lcom/android/internal/telephony/gsm/GsmSmsAddress;
    .registers 7

    .prologue
    .line 672
    iget-object v4, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v5, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    aget-byte v4, v4, v5

    and-int/lit16 v0, v4, 0xff

    .line 673
    .local v0, addressLength:I
    add-int/lit8 v4, v0, 0x1

    div-int/lit8 v4, v4, 0x2

    add-int/lit8 v2, v4, 0x2

    .line 676
    .local v2, lengthBytes:I
    :try_start_e
    new-instance v3, Lcom/android/internal/telephony/gsm/GsmSmsAddress;

    iget-object v4, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v5, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    invoke-direct {v3, v4, v5, v2}, Lcom/android/internal/telephony/gsm/GsmSmsAddress;-><init>([BII)V
    :try_end_17
    .catch Ljava/text/ParseException; {:try_start_e .. :try_end_17} :catch_1d

    .line 683
    .local v3, ret:Lcom/android/internal/telephony/gsm/GsmSmsAddress;
    iget v4, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/2addr v4, v2

    iput v4, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    .line 685
    return-object v3

    .line 677
    .end local v3           #ret:Lcom/android/internal/telephony/gsm/GsmSmsAddress;
    :catch_1d
    move-exception v1

    .line 678
    .local v1, e:Ljava/text/ParseException;
    const/4 v3, 0x0

    .line 680
    .restart local v3       #ret:Lcom/android/internal/telephony/gsm/GsmSmsAddress;
    new-instance v4, Ljava/lang/RuntimeException;

    invoke-virtual {v1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method getByte()I
    .registers 4

    .prologue
    .line 658
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v1, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method getSCAddress()Ljava/lang/String;
    .registers 6

    .prologue
    .line 633
    invoke-virtual {p0}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->getByte()I

    move-result v0

    .line 635
    .local v0, len:I
    if-nez v0, :cond_d

    .line 637
    const/4 v1, 0x0

    .line 649
    .local v1, ret:Ljava/lang/String;
    :goto_7
    iget v3, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/2addr v3, v0

    iput v3, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    .line 651
    return-object v1

    .line 641
    .end local v1           #ret:Ljava/lang/String;
    :cond_d
    :try_start_d
    iget-object v3, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v4, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    invoke-static {v3, v4, v0}, Landroid/telephony/PhoneNumberUtils;->calledPartyBCDToString([BII)Ljava/lang/String;
    :try_end_14
    .catch Ljava/lang/RuntimeException; {:try_start_d .. :try_end_14} :catch_16

    move-result-object v1

    .restart local v1       #ret:Ljava/lang/String;
    goto :goto_7

    .line 643
    .end local v1           #ret:Ljava/lang/String;
    :catch_16
    move-exception v2

    .line 644
    .local v2, tr:Ljava/lang/RuntimeException;
    const-string v3, "SmsMessage"

    const-string v4, "invalid SC address: "

    invoke-static {v3, v4, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 645
    const/4 v1, 0x0

    .restart local v1       #ret:Ljava/lang/String;
    goto :goto_7
.end method

.method getSCTimestampMillis()J
    .registers 14

    .prologue
    .line 695
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v10, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    aget-byte v9, v9, v10

    invoke-static {v9}, Lcom/android/internal/telephony/uicc/IccUtils;->gsmBcdByteToInt(B)I

    move-result v8

    .line 696
    .local v8, year:I
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v10, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    aget-byte v9, v9, v10

    invoke-static {v9}, Lcom/android/internal/telephony/uicc/IccUtils;->gsmBcdByteToInt(B)I

    move-result v3

    .line 697
    .local v3, month:I
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v10, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    aget-byte v9, v9, v10

    invoke-static {v9}, Lcom/android/internal/telephony/uicc/IccUtils;->gsmBcdByteToInt(B)I

    move-result v0

    .line 698
    .local v0, day:I
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v10, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    aget-byte v9, v9, v10

    invoke-static {v9}, Lcom/android/internal/telephony/uicc/IccUtils;->gsmBcdByteToInt(B)I

    move-result v1

    .line 699
    .local v1, hour:I
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v10, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    aget-byte v9, v9, v10

    invoke-static {v9}, Lcom/android/internal/telephony/uicc/IccUtils;->gsmBcdByteToInt(B)I

    move-result v2

    .line 700
    .local v2, minute:I
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v10, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    aget-byte v9, v9, v10

    invoke-static {v9}, Lcom/android/internal/telephony/uicc/IccUtils;->gsmBcdByteToInt(B)I

    move-result v4

    .line 707
    .local v4, second:I
    iget-object v9, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v10, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/lit8 v11, v10, 0x1

    iput v11, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    aget-byte v7, v9, v10

    .line 710
    .local v7, tzByte:B
    and-int/lit8 v9, v7, -0x9

    int-to-byte v9, v9

    invoke-static {v9}, Lcom/android/internal/telephony/uicc/IccUtils;->gsmBcdByteToInt(B)I

    move-result v6

    .line 712
    .local v6, timezoneOffset:I
    and-int/lit8 v9, v7, 0x8

    if-nez v9, :cond_92

    .line 714
    :goto_69
    new-instance v5, Landroid/text/format/Time;

    const-string v9, "UTC"

    invoke-direct {v5, v9}, Landroid/text/format/Time;-><init>(Ljava/lang/String;)V

    .line 717
    .local v5, time:Landroid/text/format/Time;
    const/16 v9, 0x5a

    if-lt v8, v9, :cond_94

    add-int/lit16 v9, v8, 0x76c

    :goto_76
    iput v9, v5, Landroid/text/format/Time;->year:I

    .line 718
    add-int/lit8 v9, v3, -0x1

    iput v9, v5, Landroid/text/format/Time;->month:I

    .line 719
    iput v0, v5, Landroid/text/format/Time;->monthDay:I

    .line 720
    iput v1, v5, Landroid/text/format/Time;->hour:I

    .line 721
    iput v2, v5, Landroid/text/format/Time;->minute:I

    .line 722
    iput v4, v5, Landroid/text/format/Time;->second:I

    .line 725
    const/4 v9, 0x1

    invoke-virtual {v5, v9}, Landroid/text/format/Time;->toMillis(Z)J

    move-result-wide v9

    mul-int/lit8 v11, v6, 0xf

    mul-int/lit8 v11, v11, 0x3c

    mul-int/lit16 v11, v11, 0x3e8

    int-to-long v11, v11

    sub-long/2addr v9, v11

    return-wide v9

    .line 712
    .end local v5           #time:Landroid/text/format/Time;
    :cond_92
    neg-int v6, v6

    goto :goto_69

    .line 717
    .restart local v5       #time:Landroid/text/format/Time;
    :cond_94
    add-int/lit16 v9, v8, 0x7d0

    goto :goto_76
.end method

.method getUserData()[B
    .registers 2

    .prologue
    .line 818
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserData:[B

    return-object v0
.end method

.method getUserDataGSM7Bit(III)Ljava/lang/String;
    .registers 11
    .parameter "septetCount"
    .parameter "languageTable"
    .parameter "languageShiftTable"

    .prologue
    .line 852
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v1, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    iget v3, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserDataSeptetPadding:I

    move v2, p1

    move v4, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/android/internal/telephony/GsmAlphabet;->gsm7BitPackedToString([BIIIII)Ljava/lang/String;

    move-result-object v6

    .line 855
    .local v6, ret:Ljava/lang/String;
    iget v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    mul-int/lit8 v1, p1, 0x7

    div-int/lit8 v1, v1, 0x8

    add-int/2addr v0, v1

    iput v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    .line 857
    return-object v6
.end method

.method getUserDataHeader()Lcom/android/internal/telephony/SmsHeader;
    .registers 2

    .prologue
    .line 838
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserDataHeader:Lcom/android/internal/telephony/SmsHeader;

    return-object v0
.end method

.method getUserDataKSC5601(I)Ljava/lang/String;
    .registers 7
    .parameter "byteCount"

    .prologue
    .line 913
    :try_start_0
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v3, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    const-string v4, "KSC5601"

    invoke-direct {v1, v2, v3, p1, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_b
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_b} :catch_11

    .line 919
    .local v1, ret:Ljava/lang/String;
    :goto_b
    iget v2, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/2addr v2, p1

    iput v2, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    .line 920
    return-object v1

    .line 914
    .end local v1           #ret:Ljava/lang/String;
    :catch_11
    move-exception v0

    .line 915
    .local v0, ex:Ljava/io/UnsupportedEncodingException;
    const-string v1, ""

    .line 916
    .restart local v1       #ret:Ljava/lang/String;
    const-string v2, "SmsMessage"

    const-string v3, "implausible UnsupportedEncodingException"

    invoke-static {v2, v3, v0}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_b
.end method

.method getUserDataSeptetPadding()I
    .registers 2

    .prologue
    .line 829
    iget v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserDataSeptetPadding:I

    return v0
.end method

.method getUserDataUCS2(I)Ljava/lang/String;
    .registers 7
    .parameter "byteCount"

    .prologue
    .line 871
    :try_start_0
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v3, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    const-string v4, "utf-16"

    invoke-direct {v1, v2, v3, p1, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_b
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_b} :catch_11

    .line 877
    .local v1, ret:Ljava/lang/String;
    :goto_b
    iget v2, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/2addr v2, p1

    iput v2, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    .line 878
    return-object v1

    .line 872
    .end local v1           #ret:Ljava/lang/String;
    :catch_11
    move-exception v0

    .line 873
    .local v0, ex:Ljava/io/UnsupportedEncodingException;
    const-string v1, ""

    .line 874
    .restart local v1       #ret:Ljava/lang/String;
    const-string v2, "SmsMessage"

    const-string v3, "implausible UnsupportedEncodingException"

    invoke-static {v2, v3, v0}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_b
.end method

.method getUserDataUtf8(I)Ljava/lang/String;
    .registers 7
    .parameter "byteCount"

    .prologue
    .line 892
    :try_start_0
    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    iget v3, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    const-string v4, "UTF-8"

    invoke-direct {v1, v2, v3, p1, v4}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_b
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_b} :catch_11

    .line 898
    .local v1, ret:Ljava/lang/String;
    :goto_b
    iget v2, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/2addr v2, p1

    iput v2, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    .line 899
    return-object v1

    .line 893
    .end local v1           #ret:Ljava/lang/String;
    :catch_11
    move-exception v0

    .line 894
    .local v0, ex:Ljava/io/UnsupportedEncodingException;
    const-string v1, ""

    .line 895
    .restart local v1       #ret:Ljava/lang/String;
    const-string v2, "SmsMessage"

    const-string v3, "implausible UnsupportedEncodingException"

    invoke-static {v2, v3, v0}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_b
.end method

.method kddiGsmDecodeShiftJis(I)Ljava/lang/String;
    .registers 7
    .parameter "byteCount"

    .prologue
    .line 935
    iget-object v3, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mUserData:[B

    invoke-static {v3}, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->KddiReplaceGsmUserData([B)[B

    move-result-object v3

    const/4 v4, 0x1

    invoke-static {v3, v4}, Lcom/kddi/android/internal/telephony/KddiSmsDataConvertor;->kddiChangeCmailPictCharCode([BI)[B

    move-result-object v1

    .line 938
    .local v1, replaceData:[B
    :try_start_b
    #calls: Lcom/android/internal/telephony/gsm/SmsMessage;->ChangeGsmCharCodetoUnicode([B)Ljava/lang/String;
    invoke-static {v1}, Lcom/android/internal/telephony/gsm/SmsMessage;->access$100([B)Ljava/lang/String;
    :try_end_e
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_b .. :try_end_e} :catch_15

    move-result-object v2

    .line 943
    .local v2, ret:Ljava/lang/String;
    :goto_f
    iget v3, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    add-int/2addr v3, p1

    iput v3, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    .line 944
    return-object v2

    .line 939
    .end local v2           #ret:Ljava/lang/String;
    :catch_15
    move-exception v0

    .line 940
    .local v0, ex:Lcom/android/internal/telephony/EncodeException;
    const-string v2, ""

    .line 941
    .restart local v2       #ret:Ljava/lang/String;
    const-string v3, "SmsMessage"

    const-string v4, "Error GSM Decode: "

    invoke-static {v3, v4, v0}, Landroid/util/secutil/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_f
.end method

.method moreDataPresent()Z
    .registers 3

    .prologue
    .line 924
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mPdu:[B

    array-length v0, v0

    iget v1, p0, Lcom/android/internal/telephony/gsm/SmsMessage$PduParser;->mCur:I

    if-le v0, v1, :cond_9

    const/4 v0, 0x1

    :goto_8
    return v0

    :cond_9
    const/4 v0, 0x0

    goto :goto_8
.end method
