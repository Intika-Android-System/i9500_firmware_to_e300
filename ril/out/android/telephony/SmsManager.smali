.class public final Landroid/telephony/SmsManager;
.super Ljava/lang/Object;
.source "SmsManager.java"


# static fields
.field protected static final COPY_TO_SIM_FAIL:I = 0x1

.field protected static final COPY_TO_SIM_NOT_AVAILABLE:I = 0x2

.field protected static final COPY_TO_SIM_SIM_FULL:I = 0x3

.field protected static final COPY_TO_SIM_SUCCESS:I = 0x0

.field static final GSM_SMS_FAIL_CAUSE_DSAC_FAIL:I = 0xd6

.field public static final ICC_TYPE_AUTO:I = -0x1

.field public static final ICC_TYPE_CSIM:I = 0x4

.field public static final ICC_TYPE_CSIM_GSM:I = 0xa

.field public static final ICC_TYPE_ISIM:I = 0x5

.field public static final ICC_TYPE_RUIM:I = 0x3

.field public static final ICC_TYPE_SIM:I = 0x1

.field public static final ICC_TYPE_UNKNOW:I = 0x0

.field public static final ICC_TYPE_USIM:I = 0x2

.field protected static final ISMS:Ljava/lang/String; = "isms"

.field private static final LOG_TAG:Ljava/lang/String; = "SmsManager"

.field public static final RESULT_ERROR_DSAC_FAILURE:I = 0x7

.field public static final RESULT_ERROR_FDN_CHECK_FAILURE:I = 0x6

.field public static final RESULT_ERROR_GENERIC_FAILURE:I = 0x1

.field public static final RESULT_ERROR_LIMIT_EXCEEDED:I = 0x5

.field public static final RESULT_ERROR_NO_SERVICE:I = 0x4

.field public static final RESULT_ERROR_NULL_PDU:I = 0x3

.field public static final RESULT_ERROR_RADIO_OFF:I = 0x2

.field public static final STATUS_ON_ICC_FREE:I = 0x0

.field public static final STATUS_ON_ICC_READ:I = 0x1

.field public static final STATUS_ON_ICC_SENT:I = 0x5

.field public static final STATUS_ON_ICC_UNREAD:I = 0x3

.field public static final STATUS_ON_ICC_UNSENT:I = 0x7

.field public static final VALUE_INPUT_MODE_AUTO:I = 0x2

.field public static final VALUE_INPUT_MODE_GSM7BIT:I = 0x0

.field public static final VALUE_INPUT_MODE_UCS2:I = 0x1

.field static mMsgEncodingType:I

.field public static mTotalCountDUIM:I

.field public static mTotalCountSim:I

.field private static final sInstance:Landroid/telephony/SmsManager;


# instance fields
.field protected mServiceName:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 76
    new-instance v0, Landroid/telephony/SmsManager;

    invoke-direct {v0}, Landroid/telephony/SmsManager;-><init>()V

    sput-object v0, Landroid/telephony/SmsManager;->sInstance:Landroid/telephony/SmsManager;

    .line 889
    const/4 v0, 0x0

    sput v0, Landroid/telephony/SmsManager;->mMsgEncodingType:I

    return-void
.end method

.method protected constructor <init>()V
    .registers 2

    .prologue
    .line 370
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 371
    const-string v0, "isms"

    iput-object v0, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    .line 372
    return-void
.end method

.method private static createMessageListFromRawRecords(Ljava/util/List;)Ljava/util/ArrayList;
    .registers 8
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/telephony/SmsRawData;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/telephony/SmsMessage;",
            ">;"
        }
    .end annotation

    .prologue
    .line 744
    .local p0, records:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/SmsRawData;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 745
    .local v3, messages:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/telephony/SmsMessage;>;"
    if-eqz p0, :cond_28

    .line 746
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    .line 747
    .local v0, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_c
    if-ge v2, v0, :cond_28

    .line 748
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/SmsRawData;

    .line 750
    .local v1, data:Lcom/android/internal/telephony/SmsRawData;
    if-eqz v1, :cond_25

    .line 751
    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v1}, Lcom/android/internal/telephony/SmsRawData;->getBytes()[B

    move-result-object v6

    invoke-static {v5, v6}, Landroid/telephony/SmsMessage;->createFromEfRecord(I[B)Landroid/telephony/SmsMessage;

    move-result-object v4

    .line 752
    .local v4, sms:Landroid/telephony/SmsMessage;
    if-eqz v4, :cond_25

    .line 753
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 747
    .end local v4           #sms:Landroid/telephony/SmsMessage;
    :cond_25
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 758
    .end local v0           #count:I
    .end local v1           #data:Lcom/android/internal/telephony/SmsRawData;
    .end local v2           #i:I
    :cond_28
    return-object v3
.end method

.method private static createMessageListFromRawRecords(Ljava/util/List;Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 10
    .parameter
    .parameter "format"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/telephony/SmsRawData;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/telephony/SmsMessage;",
            ">;"
        }
    .end annotation

    .prologue
    .line 763
    .local p0, records:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/SmsRawData;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 764
    .local v3, messages:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/telephony/SmsMessage;>;"
    if-eqz p0, :cond_4f

    .line 765
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    .line 766
    .local v0, count:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_c
    if-ge v2, v0, :cond_4f

    .line 767
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/SmsRawData;

    .line 769
    .local v1, data:Lcom/android/internal/telephony/SmsRawData;
    if-eqz v1, :cond_4a

    .line 770
    add-int/lit8 v5, v2, 0x1

    invoke-virtual {v1}, Lcom/android/internal/telephony/SmsRawData;->getBytes()[B

    move-result-object v6

    invoke-static {v5, v6, p1}, Landroid/telephony/SmsMessage;->createFromEfRecord(I[BLjava/lang/String;)Landroid/telephony/SmsMessage;

    move-result-object v4

    .line 771
    .local v4, sms:Landroid/telephony/SmsMessage;
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 772
    if-nez v4, :cond_47

    .line 773
    const-string v5, "SmsManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "createFromEfRecord NULL:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "index:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/secutil/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 766
    .end local v4           #sms:Landroid/telephony/SmsMessage;
    :cond_47
    :goto_47
    add-int/lit8 v2, v2, 0x1

    goto :goto_c

    .line 777
    :cond_4a
    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_47

    .line 781
    .end local v0           #count:I
    .end local v1           #data:Lcom/android/internal/telephony/SmsRawData;
    .end local v2           #i:I
    :cond_4f
    return-object v3
.end method

.method public static getAllMessagesFromIcc()Ljava/util/ArrayList;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/telephony/SmsMessage;",
            ">;"
        }
    .end annotation

    .prologue
    .line 487
    const/4 v1, 0x0

    .line 490
    .local v1, records:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/SmsRawData;>;"
    :try_start_1
    const-string v2, "isms"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v0

    .line 491
    .local v0, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v0, :cond_15

    .line 492
    invoke-static {}, Landroid/app/ActivityThread;->currentPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/android/internal/telephony/ISms;->getAllMessagesFromIccEf(Ljava/lang/String;)Ljava/util/List;
    :try_end_14
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_14} :catch_1a

    move-result-object v1

    .line 498
    .end local v0           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_15
    :goto_15
    invoke-static {v1}, Landroid/telephony/SmsManager;->createMessageListFromRawRecords(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v2

    return-object v2

    .line 494
    :catch_1a
    move-exception v2

    goto :goto_15
.end method

.method public static getDefault()Landroid/telephony/SmsManager;
    .registers 1

    .prologue
    .line 365
    sget-object v0, Landroid/telephony/SmsManager;->sInstance:Landroid/telephony/SmsManager;

    return-object v0
.end method


# virtual methods
.method public MakeSimPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)I
    .registers 19
    .parameter "body"
    .parameter "scAddress"
    .parameter "Address"
    .parameter "SmsType"
    .parameter "date"

    .prologue
    .line 1020
    const/4 v10, 0x0

    .line 1021
    .local v10, result:Z
    const/4 v11, 0x0

    .local v11, smsc:[B
    const/4 v8, 0x0

    .line 1024
    .local v8, pdu:[B
    invoke-virtual {p0}, Landroid/telephony/SmsManager;->getSMSAvailable()Z

    move-result v1

    if-nez v1, :cond_12

    .line 1025
    const-string v1, "SmsManager"

    const-string v2, "getSimDeliverPdu : COPY_TO_SIM_NOT_AVAILABLE"

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 1026
    const/4 v1, 0x2

    .line 1075
    :goto_11
    return v1

    .line 1028
    :cond_12
    invoke-virtual {p0}, Landroid/telephony/SmsManager;->getCurrentFormat()Ljava/lang/String;

    move-result-object v6

    .line 1029
    .local v6, format:Ljava/lang/String;
    const/4 v1, 0x1

    move/from16 v0, p4

    if-ne v0, v1, :cond_4e

    .line 1031
    const/4 v5, 0x0

    move-object v1, p2

    move-object/from16 v2, p3

    move-object v3, p1

    move-object/from16 v4, p5

    :try_start_22
    invoke-static/range {v1 .. v6}, Landroid/telephony/SmsMessage;->getSimDeliverPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;)Landroid/telephony/SmsMessage$DeliverPdu;

    move-result-object v9

    .line 1032
    .local v9, pdus:Landroid/telephony/SmsMessage$DeliverPdu;
    if-eqz v9, :cond_2c

    .line 1033
    iget-object v11, v9, Landroid/telephony/SmsMessage$DeliverPdu;->encodedScAddress:[B

    .line 1034
    iget-object v8, v9, Landroid/telephony/SmsMessage$DeliverPdu;->encodedMessage:[B
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_2c} :catch_33

    .line 1041
    :cond_2c
    const/4 v12, 0x1

    .line 1061
    .end local v9           #pdus:Landroid/telephony/SmsMessage$DeliverPdu;
    .local v12, status:I
    :goto_2d
    if-nez v11, :cond_7f

    if-nez v8, :cond_7f

    .line 1062
    const/4 v1, 0x1

    goto :goto_11

    .line 1036
    .end local v12           #status:I
    :catch_33
    move-exception v7

    .line 1037
    .local v7, e:Ljava/lang/Exception;
    const-string v1, "SmsManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getSimDeliverPdu Encoding ERR: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 1038
    const/4 v1, 0x1

    goto :goto_11

    .line 1044
    .end local v7           #e:Ljava/lang/Exception;
    :cond_4e
    const/4 v1, 0x0

    :try_start_4f
    move-object/from16 v0, p3

    invoke-static {p2, v0, p1, v1, v6}, Landroid/telephony/SmsMessage;->getSimSubmitPdu(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BLjava/lang/String;)Landroid/telephony/SmsMessage$SubmitPdu;

    move-result-object v9

    .line 1045
    .local v9, pdus:Landroid/telephony/SmsMessage$SubmitPdu;
    if-eqz v9, :cond_5b

    .line 1046
    iget-object v11, v9, Landroid/telephony/SmsMessage$SubmitPdu;->encodedScAddress:[B

    .line 1047
    iget-object v8, v9, Landroid/telephony/SmsMessage$SubmitPdu;->encodedMessage:[B
    :try_end_5b
    .catch Ljava/lang/Exception; {:try_start_4f .. :try_end_5b} :catch_62

    .line 1054
    :cond_5b
    const/4 v1, 0x2

    move/from16 v0, p4

    if-ne v0, v1, :cond_7d

    .line 1055
    const/4 v12, 0x5

    .restart local v12       #status:I
    goto :goto_2d

    .line 1049
    .end local v9           #pdus:Landroid/telephony/SmsMessage$SubmitPdu;
    .end local v12           #status:I
    :catch_62
    move-exception v7

    .line 1050
    .restart local v7       #e:Ljava/lang/Exception;
    const-string v1, "SmsManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getSimSubmitPdu Encoding ERR: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    .line 1051
    const/4 v1, 0x1

    goto :goto_11

    .line 1057
    .end local v7           #e:Ljava/lang/Exception;
    .restart local v9       #pdus:Landroid/telephony/SmsMessage$SubmitPdu;
    :cond_7d
    const/4 v12, 0x7

    .restart local v12       #status:I
    goto :goto_2d

    .line 1065
    .end local v9           #pdus:Landroid/telephony/SmsMessage$SubmitPdu;
    :cond_7f
    invoke-virtual {p0, v11, v8, v12}, Landroid/telephony/SmsManager;->copyMessageToIcc([B[BI)Z

    move-result v10

    .line 1067
    if-eqz v10, :cond_8a

    .line 1068
    invoke-virtual {p0}, Landroid/telephony/SmsManager;->resetSimFullStatus()V

    .line 1069
    const/4 v1, 0x0

    goto :goto_11

    .line 1071
    :cond_8a
    invoke-virtual {p0}, Landroid/telephony/SmsManager;->getSimFullStatus()Z

    move-result v1

    if-eqz v1, :cond_9a

    .line 1072
    const-string v1, "SmsManager"

    const-string v2, "getSimFullStatus: 3"

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1073
    const/4 v1, 0x3

    goto/16 :goto_11

    .line 1075
    :cond_9a
    const/4 v1, 0x1

    goto/16 :goto_11
.end method

.method public SetServiceName(Ljava/lang/String;)V
    .registers 2
    .parameter "ServiceName"

    .prologue
    .line 375
    iput-object p1, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    .line 376
    return-void
.end method

.method public copyMessageToIcc([B[BI)Z
    .registers 8
    .parameter "smsc"
    .parameter "pdu"
    .parameter "status"

    .prologue
    .line 394
    const/4 v1, 0x0

    .line 396
    .local v1, success:Z
    if-nez p2, :cond_b

    .line 397
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "pdu is NULL"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 401
    :cond_b
    :try_start_b
    iget-object v2, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v0

    .line 403
    .local v0, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v0, :cond_1f

    .line 404
    invoke-static {}, Landroid/app/ActivityThread;->currentPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, p3, p2, p1}, Lcom/android/internal/telephony/ISms;->copyMessageToIccEf(Ljava/lang/String;I[B[B)Z
    :try_end_1e
    .catch Landroid/os/RemoteException; {:try_start_b .. :try_end_1e} :catch_20

    move-result v1

    .line 411
    .end local v0           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_1f
    :goto_1f
    return v1

    .line 407
    :catch_20
    move-exception v2

    goto :goto_1f
.end method

.method public deleteMessageFromIcc(I)Z
    .registers 7
    .parameter "messageIndex"

    .prologue
    .line 426
    const/4 v2, 0x0

    .line 427
    .local v2, success:Z
    const/16 v3, 0xaf

    new-array v1, v3, [B

    .line 428
    .local v1, pdu:[B
    const/4 v3, -0x1

    invoke-static {v1, v3}, Ljava/util/Arrays;->fill([BB)V

    .line 432
    :try_start_9
    iget-object v3, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v3}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v0

    .line 434
    .local v0, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v0, :cond_1e

    .line 435
    invoke-static {}, Landroid/app/ActivityThread;->currentPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-interface {v0, v3, p1, v4, v1}, Lcom/android/internal/telephony/ISms;->updateMessageOnIccEf(Ljava/lang/String;II[B)Z
    :try_end_1d
    .catch Landroid/os/RemoteException; {:try_start_9 .. :try_end_1d} :catch_1f

    move-result v2

    .line 442
    .end local v0           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_1e
    :goto_1e
    return v2

    .line 438
    :catch_1f
    move-exception v3

    goto :goto_1e
.end method

.method public disableCellBroadcast(I)Z
    .registers 7
    .parameter "messageIdentifier"

    .prologue
    .line 638
    const/4 v1, 0x0

    .line 642
    .local v1, success:Z
    :try_start_1
    iget-object v2, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v0

    .line 643
    .local v0, iccISms:Lcom/android/internal/telephony/ISms;
    const-string v2, "SmsManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "disableCellBroadcast : mServiceName = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/secutil/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 645
    if-eqz v0, :cond_2b

    .line 646
    invoke-interface {v0, p1}, Lcom/android/internal/telephony/ISms;->disableCellBroadcast(I)Z
    :try_end_2a
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_2a} :catch_2c

    move-result v1

    .line 652
    .end local v0           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_2b
    :goto_2b
    return v1

    .line 648
    :catch_2c
    move-exception v2

    goto :goto_2b
.end method

.method public disableCellBroadcastRange(II)Z
    .registers 8
    .parameter "startMessageId"
    .parameter "endMessageId"

    .prologue
    .line 715
    const/4 v1, 0x0

    .line 717
    .local v1, success:Z
    if-ge p2, p1, :cond_b

    .line 718
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "endMessageId < startMessageId"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 722
    :cond_b
    :try_start_b
    iget-object v2, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v0

    .line 723
    .local v0, iccISms:Lcom/android/internal/telephony/ISms;
    const-string v2, "SmsManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "disableCellBroadcastRange : mServiceName = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/secutil/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 725
    if-eqz v0, :cond_35

    .line 726
    invoke-interface {v0, p1, p2}, Lcom/android/internal/telephony/ISms;->disableCellBroadcastRange(II)Z
    :try_end_34
    .catch Landroid/os/RemoteException; {:try_start_b .. :try_end_34} :catch_36

    move-result v1

    .line 732
    .end local v0           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_35
    :goto_35
    return v1

    .line 728
    :catch_36
    move-exception v2

    goto :goto_35
.end method

.method public divideMessage(Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 4
    .parameter "text"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 156
    if-nez p1, :cond_a

    .line 157
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "text is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 159
    :cond_a
    invoke-static {p1}, Landroid/telephony/SmsMessage;->fragmentText(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public divideMessage(Ljava/lang/String;I)Ljava/util/ArrayList;
    .registers 5
    .parameter "text"
    .parameter "encodingType"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 998
    if-nez p1, :cond_a

    .line 999
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "text is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1001
    :cond_a
    invoke-static {p1, p2}, Landroid/telephony/SmsMessage;->fragmentText(Ljava/lang/String;I)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public enableCellBroadcast(I)Z
    .registers 7
    .parameter "messageIdentifier"

    .prologue
    .line 604
    const/4 v1, 0x0

    .line 608
    .local v1, success:Z
    :try_start_1
    iget-object v2, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v0

    .line 609
    .local v0, iccISms:Lcom/android/internal/telephony/ISms;
    const-string v2, "SmsManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "enableCellBroadcast : mServiceName = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/secutil/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 611
    if-eqz v0, :cond_2b

    .line 612
    invoke-interface {v0, p1}, Lcom/android/internal/telephony/ISms;->enableCellBroadcast(I)Z
    :try_end_2a
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_2a} :catch_2c

    move-result v1

    .line 618
    .end local v0           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_2b
    :goto_2b
    return v1

    .line 614
    :catch_2c
    move-exception v2

    goto :goto_2b
.end method

.method public enableCellBroadcastRange(II)Z
    .registers 8
    .parameter "startMessageId"
    .parameter "endMessageId"

    .prologue
    .line 675
    const/4 v1, 0x0

    .line 677
    .local v1, success:Z
    if-ge p2, p1, :cond_b

    .line 678
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "endMessageId < startMessageId"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 682
    :cond_b
    :try_start_b
    iget-object v2, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v0

    .line 683
    .local v0, iccISms:Lcom/android/internal/telephony/ISms;
    const-string v2, "SmsManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "enableCellBroadcastRange : mServiceName = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/secutil/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 685
    if-eqz v0, :cond_35

    .line 686
    invoke-interface {v0, p1, p2}, Lcom/android/internal/telephony/ISms;->enableCellBroadcastRange(II)Z
    :try_end_34
    .catch Landroid/os/RemoteException; {:try_start_b .. :try_end_34} :catch_36

    move-result v1

    .line 692
    .end local v0           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_35
    :goto_35
    return v1

    .line 688
    :catch_36
    move-exception v2

    goto :goto_35
.end method

.method public getAllMessagesFromIccSimSlot()Ljava/util/ArrayList;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/telephony/SmsMessage;",
            ">;"
        }
    .end annotation

    .prologue
    .line 512
    const/4 v1, 0x0

    .line 515
    .local v1, records:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/SmsRawData;>;"
    :try_start_1
    iget-object v2, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v0

    .line 516
    .local v0, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v0, :cond_15

    .line 517
    invoke-static {}, Landroid/app/ActivityThread;->currentPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/android/internal/telephony/ISms;->getAllMessagesFromIccEf(Ljava/lang/String;)Ljava/util/List;
    :try_end_14
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_14} :catch_1a

    move-result-object v1

    .line 523
    .end local v0           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_15
    :goto_15
    invoke-static {v1}, Landroid/telephony/SmsManager;->createMessageListFromRawRecords(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v2

    return-object v2

    .line 519
    :catch_1a
    move-exception v2

    goto :goto_15
.end method

.method public getAllMessagesFromIccSimType(I)Ljava/util/ArrayList;
    .registers 10
    .parameter "iccType"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/telephony/SmsMessage;",
            ">;"
        }
    .end annotation

    .prologue
    .line 536
    const/4 v4, 0x0

    .line 537
    .local v4, records:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/SmsRawData;>;"
    const-string v1, "3gpp"

    .line 538
    .local v1, format:Ljava/lang/String;
    const/4 v5, 0x0

    .line 547
    .local v5, slotId:I
    const/4 v6, -0x1

    if-eq p1, v6, :cond_9

    if-nez p1, :cond_15

    .line 549
    :cond_9
    const-string v3, "ril.ICC_TYPE"

    .line 555
    .local v3, iccTypePropName:Ljava/lang/String;
    :try_start_b
    const-string v6, "0"

    invoke-static {v3, v6}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_14} :catch_23

    move-result p1

    .line 562
    .end local v3           #iccTypePropName:Ljava/lang/String;
    :cond_15
    :goto_15
    if-nez p1, :cond_2d

    .line 563
    const-string v6, "SmsManager"

    const-string v7, "IccType is Unknown"

    invoke-static {v6, v7}, Landroid/util/secutil/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 564
    invoke-static {v4, v1}, Landroid/telephony/SmsManager;->createMessageListFromRawRecords(Ljava/util/List;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    .line 583
    :goto_22
    return-object v6

    .line 556
    .restart local v3       #iccTypePropName:Ljava/lang/String;
    :catch_23
    move-exception v0

    .line 557
    .local v0, e:Ljava/lang/Exception;
    const-string v6, "SmsManager"

    const-string v7, "IccType is invalid"

    invoke-static {v6, v7}, Landroid/util/secutil/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 558
    const/4 p1, 0x0

    goto :goto_15

    .line 568
    .end local v0           #e:Ljava/lang/Exception;
    .end local v3           #iccTypePropName:Ljava/lang/String;
    :cond_2d
    :try_start_2d
    iget-object v6, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v6}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v6

    invoke-static {v6}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v2

    .line 569
    .local v2, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v2, :cond_48

    .line 570
    const/16 v6, 0xa

    if-ne p1, v6, :cond_40

    .line 571
    const/4 v6, 0x1

    sput-boolean v6, Landroid/telephony/TelephonyManager;->isSelecttelecomDF:Z

    .line 573
    :cond_40
    invoke-static {}, Landroid/app/ActivityThread;->currentPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v6}, Lcom/android/internal/telephony/ISms;->getAllMessagesFromIccEf(Ljava/lang/String;)Ljava/util/List;
    :try_end_47
    .catch Landroid/os/RemoteException; {:try_start_2d .. :try_end_47} :catch_55

    move-result-object v4

    .line 579
    .end local v2           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_48
    :goto_48
    const/4 v6, 0x3

    if-eq p1, v6, :cond_4e

    const/4 v6, 0x4

    if-ne p1, v6, :cond_50

    .line 580
    :cond_4e
    const-string v1, "3gpp2"

    .line 583
    :cond_50
    invoke-static {v4, v1}, Landroid/telephony/SmsManager;->createMessageListFromRawRecords(Ljava/util/List;Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    goto :goto_22

    .line 575
    :catch_55
    move-exception v6

    goto :goto_48
.end method

.method public getCbSettings()Landroid/telephony/gsm/CbConfig;
    .registers 13

    .prologue
    const/4 v7, 0x0

    const/4 v11, 0x0

    const/4 v10, 0x1

    .line 1160
    const-string v8, "SmsManager"

    const-string v9, "[CB] In getCbConfig"

    invoke-static {v8, v9}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1162
    const/4 v6, 0x0

    .line 1164
    .local v6, out:[B
    new-instance v0, Landroid/telephony/gsm/CbConfig;

    invoke-direct {v0}, Landroid/telephony/gsm/CbConfig;-><init>()V

    .line 1167
    .local v0, cbConfig:Landroid/telephony/gsm/CbConfig;
    :try_start_10
    iget-object v8, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v8}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v8

    invoke-static {v8}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v3

    .line 1169
    .local v3, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v3, :cond_2b

    .line 1170
    invoke-interface {v3}, Lcom/android/internal/telephony/ISms;->getCbSettings()[B
    :try_end_1f
    .catch Landroid/os/RemoteException; {:try_start_10 .. :try_end_1f} :catch_34
    .catch Ljava/lang/NullPointerException; {:try_start_10 .. :try_end_1f} :catch_3d

    move-result-object v6

    .line 1183
    .end local v3           #iccISms:Lcom/android/internal/telephony/ISms;
    :goto_20
    if-nez v6, :cond_46

    .line 1184
    const-string v8, "SmsManager"

    const-string v9, "[CB] out is null. Return null."

    invoke-static {v8, v9}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    move-object v0, v7

    .line 1215
    .end local v0           #cbConfig:Landroid/telephony/gsm/CbConfig;
    :cond_2a
    :goto_2a
    return-object v0

    .line 1172
    .restart local v0       #cbConfig:Landroid/telephony/gsm/CbConfig;
    .restart local v3       #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_2b
    :try_start_2b
    const-string v8, "SmsManager"

    const-string v9, "[CB] iccISms == null."

    invoke-static {v8, v9}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_32
    .catch Landroid/os/RemoteException; {:try_start_2b .. :try_end_32} :catch_34
    .catch Ljava/lang/NullPointerException; {:try_start_2b .. :try_end_32} :catch_3d

    move-object v0, v7

    .line 1173
    goto :goto_2a

    .line 1175
    .end local v3           #iccISms:Lcom/android/internal/telephony/ISms;
    :catch_34
    move-exception v1

    .line 1177
    .local v1, ex:Landroid/os/RemoteException;
    const-string v8, "SmsManager"

    const-string v9, "[CB ] Exception In getCbConfig of SmsManager.java  "

    invoke-static {v8, v9}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_20

    .line 1178
    .end local v1           #ex:Landroid/os/RemoteException;
    :catch_3d
    move-exception v1

    .line 1180
    .local v1, ex:Ljava/lang/NullPointerException;
    const-string v8, "SmsManager"

    const-string v9, "[CB ] NULL Exception In getCbConfig of SmsManager.java  "

    invoke-static {v8, v9}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_20

    .line 1188
    .end local v1           #ex:Ljava/lang/NullPointerException;
    :cond_46
    aget-byte v7, v6, v11

    if-ne v7, v10, :cond_78

    .line 1189
    iput-boolean v10, v0, Landroid/telephony/gsm/CbConfig;->bCBEnabled:Z

    .line 1193
    :goto_4c
    aget-byte v7, v6, v10

    int-to-char v7, v7

    iput-char v7, v0, Landroid/telephony/gsm/CbConfig;->selectedId:C

    .line 1194
    const/16 v7, 0x3e8

    iput-char v7, v0, Landroid/telephony/gsm/CbConfig;->msgIdMaxCount:C

    .line 1195
    const/4 v7, 0x3

    aget-byte v7, v6, v7

    iput v7, v0, Landroid/telephony/gsm/CbConfig;->msgIdCount:I

    .line 1197
    iget v7, v0, Landroid/telephony/gsm/CbConfig;->msgIdCount:I

    new-array v5, v7, [S

    .line 1199
    .local v5, msgIDs:[S
    const/4 v2, 0x4

    .local v2, i:I
    const/4 v4, 0x0

    .local v4, j:I
    :goto_60
    array-length v7, v5

    if-ge v4, v7, :cond_7b

    .line 1201
    aget-byte v7, v6, v2

    and-int/lit16 v7, v7, 0xff

    add-int/lit8 v8, v2, 0x1

    aget-byte v8, v6, v8

    and-int/lit16 v8, v8, 0xff

    shl-int/lit8 v8, v8, 0x8

    or-int/2addr v7, v8

    int-to-short v7, v7

    aput-short v7, v5, v4

    .line 1199
    add-int/lit8 v2, v2, 0x2

    add-int/lit8 v4, v4, 0x1

    goto :goto_60

    .line 1191
    .end local v2           #i:I
    .end local v4           #j:I
    .end local v5           #msgIDs:[S
    :cond_78
    iput-boolean v11, v0, Landroid/telephony/gsm/CbConfig;->bCBEnabled:Z

    goto :goto_4c

    .line 1204
    .restart local v2       #i:I
    .restart local v4       #j:I
    .restart local v5       #msgIDs:[S
    :cond_7b
    iput-object v5, v0, Landroid/telephony/gsm/CbConfig;->msgIDs:[S

    .line 1206
    const-string v7, "SmsManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "[SmsManger- CB] bCBEnabled = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-boolean v9, v0, Landroid/telephony/gsm/CbConfig;->bCBEnabled:Z

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " selectedId = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-char v9, v0, Landroid/telephony/gsm/CbConfig;->selectedId:C

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " msgIdMaxCount = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-char v9, v0, Landroid/telephony/gsm/CbConfig;->msgIdMaxCount:C

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " msgIdCount = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v0, Landroid/telephony/gsm/CbConfig;->msgIdCount:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1211
    const/4 v2, 0x0

    :goto_bc
    iget-object v7, v0, Landroid/telephony/gsm/CbConfig;->msgIDs:[S

    array-length v7, v7

    if-ge v2, v7, :cond_2a

    .line 1212
    const-string v7, "SmsManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "[CB] msgIDs =  "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, v0, Landroid/telephony/gsm/CbConfig;->msgIDs:[S

    aget-short v9, v9, v2

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1211
    add-int/lit8 v2, v2, 0x1

    goto :goto_bc
.end method

.method public getCurrentFormat()Ljava/lang/String;
    .registers 6

    .prologue
    .line 1547
    const/4 v1, 0x0

    .line 1548
    .local v1, simSlot:I
    const-string v2, "isms2"

    iget-object v3, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 1549
    const/4 v1, 0x1

    .line 1551
    :cond_c
    invoke-static {v1}, Landroid/telephony/MultiSimTelephonyManager;->getDefault(I)Landroid/telephony/MultiSimTelephonyManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/telephony/MultiSimTelephonyManager;->getPhoneTypeFromProperty()I

    move-result v0

    .line 1553
    .local v0, phonetype:I
    const-string v2, "SmsManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "getCurrentFormat() Service : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " simSlot : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " phonetype : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1555
    packed-switch v0, :pswitch_data_4e

    .line 1561
    const-string v2, "3gpp"

    :goto_47
    return-object v2

    .line 1557
    :pswitch_48
    const-string v2, "3gpp2"

    goto :goto_47

    .line 1559
    :pswitch_4b
    const-string v2, "3gpp"

    goto :goto_47

    .line 1555
    :pswitch_data_4e
    .packed-switch 0x1
        :pswitch_4b
        :pswitch_48
    .end packed-switch
.end method

.method getImsSmsFormat()Ljava/lang/String;
    .registers 4

    .prologue
    .line 821
    const-string v0, "unknown"

    .line 823
    .local v0, format:Ljava/lang/String;
    :try_start_2
    const-string v2, "isms"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v1

    .line 824
    .local v1, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v1, :cond_12

    .line 825
    invoke-interface {v1}, Lcom/android/internal/telephony/ISms;->getImsSmsFormat()Ljava/lang/String;
    :try_end_11
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_11} :catch_13

    move-result-object v0

    .line 830
    .end local v1           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_12
    :goto_12
    return-object v0

    .line 827
    :catch_13
    move-exception v2

    goto :goto_12
.end method

.method public getSMSAvailable()Z
    .registers 6

    .prologue
    .line 1096
    const-string v3, "SmsManager"

    const-string v4, "getSMSAvailable in SmsManager"

    invoke-static {v3, v4}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1097
    const/4 v2, 0x0

    .line 1099
    .local v2, ret:Z
    :try_start_8
    iget-object v3, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v3}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v1

    .line 1101
    .local v1, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v1, :cond_18

    .line 1102
    invoke-interface {v1}, Lcom/android/internal/telephony/ISms;->getSMSAvailable()Z
    :try_end_17
    .catch Landroid/os/RemoteException; {:try_start_8 .. :try_end_17} :catch_19

    move-result v2

    .line 1108
    .end local v1           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_18
    :goto_18
    return v2

    .line 1104
    :catch_19
    move-exception v0

    .line 1106
    .local v0, ex:Landroid/os/RemoteException;
    const-string v3, "SmsManager"

    const-string v4, "[CB ] Exception In getSMSAvailable() of SmsManager.java  "

    invoke-static {v3, v4}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_18
.end method

.method public getSMSPAvailable()Z
    .registers 6

    .prologue
    .line 1129
    const-string v3, "SmsManager"

    const-string v4, "getSMSPAvailable in SmsManager"

    invoke-static {v3, v4}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1130
    const/4 v2, 0x0

    .line 1133
    .local v2, ret:Z
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/telephony/TelephonyManager;->getSimState()I

    move-result v3

    const/4 v4, 0x5

    if-ne v3, v4, :cond_23

    .line 1135
    :try_start_13
    iget-object v3, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v3}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v1

    .line 1136
    .local v1, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v1, :cond_23

    .line 1137
    invoke-interface {v1}, Lcom/android/internal/telephony/ISms;->getSMSPAvailable()Z
    :try_end_22
    .catch Landroid/os/RemoteException; {:try_start_13 .. :try_end_22} :catch_24

    move-result v2

    .line 1144
    .end local v1           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_23
    :goto_23
    return v2

    .line 1139
    :catch_24
    move-exception v0

    .line 1141
    .local v0, ex:Landroid/os/RemoteException;
    const-string v3, "SmsManager"

    const-string v4, "[CB ] Exception In getSMSPAvailable() of SmsManager.java  "

    invoke-static {v3, v4}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_23
.end method

.method public getSimFullStatus()Z
    .registers 6

    .prologue
    .line 1081
    const-string v3, "SmsManager"

    const-string v4, "getSimFullStatus in SmsManager"

    invoke-static {v3, v4}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1082
    const/4 v2, 0x0

    .line 1084
    .local v2, ret:Z
    :try_start_8
    iget-object v3, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v3}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v3

    invoke-static {v3}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v1

    .line 1085
    .local v1, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v1, :cond_18

    .line 1086
    invoke-interface {v1}, Lcom/android/internal/telephony/ISms;->getSimFullStatus()Z
    :try_end_17
    .catch Landroid/os/RemoteException; {:try_start_8 .. :try_end_17} :catch_19

    move-result v2

    .line 1092
    .end local v1           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_18
    :goto_18
    return v2

    .line 1088
    :catch_19
    move-exception v0

    .line 1090
    .local v0, ex:Landroid/os/RemoteException;
    const-string v3, "SmsManager"

    const-string v4, "Exception In getSimFullStatus() of SmsManager.java    "

    invoke-static {v3, v4}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_18
.end method

.method public getSmsc()Ljava/lang/String;
    .registers 4

    .prologue
    .line 956
    const/4 v1, 0x0

    .line 959
    .local v1, smsc:Ljava/lang/String;
    :try_start_1
    iget-object v2, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v0

    .line 960
    .local v0, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v0, :cond_11

    .line 961
    invoke-interface {v0}, Lcom/android/internal/telephony/ISms;->getSmsc()Ljava/lang/String;
    :try_end_10
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_10} :catch_12

    move-result-object v1

    .line 966
    .end local v0           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_11
    :goto_11
    return-object v1

    .line 963
    :catch_12
    move-exception v2

    goto :goto_11
.end method

.method public getToddlerMode()Z
    .registers 3

    .prologue
    .line 978
    :try_start_0
    const-string v1, "isms"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v0

    .line 979
    .local v0, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v0, :cond_12

    .line 980
    invoke-interface {v0}, Lcom/android/internal/telephony/ISms;->getToddlerMode()Z
    :try_end_f
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_f} :catch_11

    move-result v1

    .line 986
    .end local v0           #iccISms:Lcom/android/internal/telephony/ISms;
    :goto_10
    return v1

    .line 982
    :catch_11
    move-exception v1

    .line 986
    :cond_12
    const/4 v1, 0x0

    goto :goto_10
.end method

.method isImsSmsSupported()Z
    .registers 4

    .prologue
    .line 796
    const/4 v0, 0x0

    .line 798
    .local v0, boSupported:Z
    :try_start_1
    const-string v2, "isms"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v1

    .line 799
    .local v1, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v1, :cond_11

    .line 800
    invoke-interface {v1}, Lcom/android/internal/telephony/ISms;->isImsSmsSupported()Z
    :try_end_10
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_10} :catch_12

    move-result v0

    .line 805
    .end local v1           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_11
    :goto_11
    return v0

    .line 802
    :catch_12
    move-exception v2

    goto :goto_11
.end method

.method public resetSimFullStatus()V
    .registers 5

    .prologue
    .line 1113
    const-string v2, "SmsManager"

    const-string v3, "resetSimFullStatus in SmsManager"

    invoke-static {v2, v3}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1115
    :try_start_7
    iget-object v2, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v1

    .line 1116
    .local v1, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v1, :cond_16

    .line 1117
    invoke-interface {v1}, Lcom/android/internal/telephony/ISms;->resetSimFullStatus()V
    :try_end_16
    .catch Landroid/os/RemoteException; {:try_start_7 .. :try_end_16} :catch_17

    .line 1123
    .end local v1           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_16
    :goto_16
    return-void

    .line 1119
    :catch_17
    move-exception v0

    .line 1121
    .local v0, ex:Landroid/os/RemoteException;
    const-string v2, "SmsManager"

    const-string v3, "Exception In resetSimFullStatus() of SmsManager.java  "

    invoke-static {v2, v3}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_16
.end method

.method public sendDataMessage(Ljava/lang/String;Ljava/lang/String;SS[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;)V
    .registers 17
    .parameter "destinationAddress"
    .parameter "scAddress"
    .parameter "destinationPort"
    .parameter "originationPort"
    .parameter "data"
    .parameter "sentIntent"
    .parameter "deliveryIntent"

    .prologue
    .line 327
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 328
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid destinationAddress"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 331
    :cond_e
    if-eqz p5, :cond_13

    array-length v1, p5

    if-nez v1, :cond_1b

    .line 332
    :cond_13
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid message data"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 336
    :cond_1b
    :try_start_1b
    iget-object v1, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v0

    .line 337
    .local v0, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v0, :cond_3e

    .line 338
    invoke-static {}, Landroid/app/ActivityThread;->currentPackageName()Ljava/lang/String;

    move-result-object v1

    const v2, 0xffff

    and-int v4, p3, v2

    const v2, 0xffff

    and-int v5, p4, v2

    move-object v2, p1

    move-object v3, p2

    move-object v6, p5

    move-object v7, p6

    move-object/from16 v8, p7

    invoke-interface/range {v0 .. v8}, Lcom/android/internal/telephony/ISms;->sendDatawithOrigPort(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;II[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;)V
    :try_end_3e
    .catch Landroid/os/RemoteException; {:try_start_1b .. :try_end_3e} :catch_3f

    .line 345
    .end local v0           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_3e
    :goto_3e
    return-void

    .line 342
    :catch_3f
    move-exception v1

    goto :goto_3e
.end method

.method public sendDataMessage(Ljava/lang/String;Ljava/lang/String;S[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;)V
    .registers 15
    .parameter "destinationAddress"
    .parameter "scAddress"
    .parameter "destinationPort"
    .parameter "data"
    .parameter "sentIntent"
    .parameter "deliveryIntent"

    .prologue
    .line 273
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 274
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid destinationAddress"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 277
    :cond_e
    if-eqz p4, :cond_13

    array-length v1, p4

    if-nez v1, :cond_1b

    .line 278
    :cond_13
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid message data"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 283
    :cond_1b
    :try_start_1b
    iget-object v1, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v0

    .line 285
    .local v0, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v0, :cond_38

    .line 286
    invoke-static {}, Landroid/app/ActivityThread;->currentPackageName()Ljava/lang/String;

    move-result-object v1

    const v2, 0xffff

    and-int v4, p3, v2

    move-object v2, p1

    move-object v3, p2

    move-object v5, p4

    move-object v6, p5

    move-object v7, p6

    invoke-interface/range {v0 .. v7}, Lcom/android/internal/telephony/ISms;->sendData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I[BLandroid/app/PendingIntent;Landroid/app/PendingIntent;)V
    :try_end_38
    .catch Landroid/os/RemoteException; {:try_start_1b .. :try_end_38} :catch_39

    .line 293
    .end local v0           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_38
    :goto_38
    return-void

    .line 290
    :catch_39
    move-exception v1

    goto :goto_38
.end method

.method public sendMultipartTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .registers 13
    .parameter "destinationAddress"
    .parameter "scAddress"
    .parameter
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, parts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p4, sentIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    .local p5, deliveryIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 206
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_10

    .line 207
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid destinationAddress"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 209
    :cond_10
    if-eqz p3, :cond_18

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v1, v3, :cond_20

    .line 210
    :cond_18
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid message body"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 213
    :cond_20
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-le v1, v3, :cond_3f

    .line 216
    :try_start_26
    iget-object v1, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v0

    .line 218
    .local v0, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v0, :cond_3e

    .line 219
    invoke-static {}, Landroid/app/ActivityThread;->currentPackageName()Ljava/lang/String;

    move-result-object v1

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-interface/range {v0 .. v6}, Lcom/android/internal/telephony/ISms;->sendMultipartText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    :try_end_3e
    .catch Landroid/os/RemoteException; {:try_start_26 .. :try_end_3e} :catch_6a

    .line 238
    .end local v0           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_3e
    :goto_3e
    return-void

    .line 227
    :cond_3f
    const/4 v5, 0x0

    .line 228
    .local v5, sentIntent:Landroid/app/PendingIntent;
    const/4 v6, 0x0

    .line 229
    .local v6, deliveryIntent:Landroid/app/PendingIntent;
    if-eqz p4, :cond_4f

    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_4f

    .line 230
    invoke-virtual {p4, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    .end local v5           #sentIntent:Landroid/app/PendingIntent;
    check-cast v5, Landroid/app/PendingIntent;

    .line 232
    .restart local v5       #sentIntent:Landroid/app/PendingIntent;
    :cond_4f
    if-eqz p5, :cond_5d

    invoke-virtual {p5}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_5d

    .line 233
    invoke-virtual {p5, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    .end local v6           #deliveryIntent:Landroid/app/PendingIntent;
    check-cast v6, Landroid/app/PendingIntent;

    .line 235
    .restart local v6       #deliveryIntent:Landroid/app/PendingIntent;
    :cond_5d
    invoke-virtual {p3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    invoke-virtual/range {v1 .. v6}, Landroid/telephony/SmsManager;->sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)V

    goto :goto_3e

    .line 223
    .end local v5           #sentIntent:Landroid/app/PendingIntent;
    .end local v6           #deliveryIntent:Landroid/app/PendingIntent;
    :catch_6a
    move-exception v1

    goto :goto_3e
.end method

.method public sendMultipartTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/String;I)V
    .registers 17
    .parameter "destinationAddress"
    .parameter "scAddress"
    .parameter
    .parameter
    .parameter
    .parameter "callbackNumber"
    .parameter "priority"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;",
            "Ljava/lang/String;",
            "I)V"
        }
    .end annotation

    .prologue
    .line 1279
    .local p3, parts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p4, sentIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    .local p5, deliveryIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    const-string v1, "SmsManager"

    const-string v2, "sendMultipartTextMessage in SmsManager with options."

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1280
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 1281
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid destinationAddress"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1283
    :cond_15
    if-nez p3, :cond_1f

    .line 1284
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid parts"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1286
    :cond_1f
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ge v1, v2, :cond_3a

    .line 1287
    invoke-static {}, Lcom/sec/android/app/CscFeature;->getInstance()Lcom/sec/android/app/CscFeature;

    move-result-object v1

    const-string v2, "CscFeature_Message_EnableSendingEmptySms"

    invoke-virtual {v1, v2}, Lcom/sec/android/app/CscFeature;->getEnableStatus(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3a

    .line 1288
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid message body"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1292
    :cond_3a
    invoke-virtual {p0}, Landroid/telephony/SmsManager;->getToddlerMode()Z

    move-result v1

    if-eqz v1, :cond_48

    .line 1293
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "toddler mode on"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1296
    :cond_48
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_6b

    .line 1298
    :try_start_4f
    iget-object v1, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v0

    .line 1299
    .local v0, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v0, :cond_6a

    .line 1300
    invoke-static {}, Landroid/app/ActivityThread;->currentPackageName()Ljava/lang/String;

    move-result-object v1

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object v7, p6

    move/from16 v8, p7

    invoke-interface/range {v0 .. v8}, Lcom/android/internal/telephony/ISms;->sendMultipartTextwithCBP(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;I)V
    :try_end_6a
    .catch Landroid/os/RemoteException; {:try_start_4f .. :try_end_6a} :catch_9c

    .line 1318
    .end local v0           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_6a
    :goto_6a
    return-void

    .line 1307
    :cond_6b
    const/4 v5, 0x0

    .line 1308
    .local v5, sentIntent:Landroid/app/PendingIntent;
    const/4 v6, 0x0

    .line 1309
    .local v6, deliveryIntent:Landroid/app/PendingIntent;
    if-eqz p4, :cond_7c

    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_7c

    .line 1310
    const/4 v1, 0x0

    invoke-virtual {p4, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    .end local v5           #sentIntent:Landroid/app/PendingIntent;
    check-cast v5, Landroid/app/PendingIntent;

    .line 1312
    .restart local v5       #sentIntent:Landroid/app/PendingIntent;
    :cond_7c
    if-eqz p5, :cond_8b

    invoke-virtual {p5}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_8b

    .line 1313
    const/4 v1, 0x0

    invoke-virtual {p5, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    .end local v6           #deliveryIntent:Landroid/app/PendingIntent;
    check-cast v6, Landroid/app/PendingIntent;

    .line 1315
    .restart local v6       #deliveryIntent:Landroid/app/PendingIntent;
    :cond_8b
    const/4 v1, 0x0

    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v7, p6

    move/from16 v8, p7

    invoke-virtual/range {v1 .. v8}, Landroid/telephony/SmsManager;->sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Ljava/lang/String;I)V

    goto :goto_6a

    .line 1303
    .end local v5           #sentIntent:Landroid/app/PendingIntent;
    .end local v6           #deliveryIntent:Landroid/app/PendingIntent;
    :catch_9c
    move-exception v1

    goto :goto_6a
.end method

.method public sendMultipartTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;ZIII)V
    .registers 22
    .parameter "destinationAddress"
    .parameter "scAddress"
    .parameter
    .parameter
    .parameter
    .parameter "replyPath"
    .parameter "expiry"
    .parameter "serviceType"
    .parameter "encodingType"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;ZIII)V"
        }
    .end annotation

    .prologue
    .line 1230
    .local p3, parts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p4, sentIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    .local p5, deliveryIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    const-string v2, "SmsManager"

    const-string v3, "sendMultipartTextMessage in SmsManager with options"

    invoke-static {v2, v3}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1232
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_15

    .line 1233
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Invalid destinationAddress"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1235
    :cond_15
    if-nez p3, :cond_1f

    .line 1236
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Invalid parts"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1238
    :cond_1f
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ge v2, v3, :cond_3a

    .line 1239
    invoke-static {}, Lcom/sec/android/app/CscFeature;->getInstance()Lcom/sec/android/app/CscFeature;

    move-result-object v2

    const-string v3, "CscFeature_Message_EnableSendingEmptySms"

    invoke-virtual {v2, v3}, Lcom/sec/android/app/CscFeature;->getEnableStatus(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3a

    .line 1240
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Invalid message body"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1244
    :cond_3a
    invoke-virtual {p0}, Landroid/telephony/SmsManager;->getToddlerMode()Z

    move-result v2

    if-eqz v2, :cond_48

    .line 1245
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "toddler mode on"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1248
    :cond_48
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_72

    .line 1250
    :try_start_4f
    iget-object v2, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v1

    .line 1251
    .local v1, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v1, :cond_71

    .line 1253
    invoke-static {}, Landroid/app/ActivityThread;->currentPackageName()Ljava/lang/String;

    move-result-object v2

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    invoke-interface/range {v1 .. v11}, Lcom/android/internal/telephony/ISms;->sendMultipartTextwithOptions(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;ZIII)V
    :try_end_71
    .catch Landroid/os/RemoteException; {:try_start_4f .. :try_end_71} :catch_ac

    .line 1273
    .end local v1           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_71
    :goto_71
    return-void

    .line 1261
    :cond_72
    const/4 v6, 0x0

    .line 1262
    .local v6, sentIntent:Landroid/app/PendingIntent;
    const/4 v7, 0x0

    .line 1263
    .local v7, deliveryIntent:Landroid/app/PendingIntent;
    if-eqz p4, :cond_85

    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_85

    .line 1264
    const/4 v2, 0x0

    move-object/from16 v0, p4

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    .end local v6           #sentIntent:Landroid/app/PendingIntent;
    check-cast v6, Landroid/app/PendingIntent;

    .line 1266
    .restart local v6       #sentIntent:Landroid/app/PendingIntent;
    :cond_85
    if-eqz p5, :cond_96

    invoke-virtual/range {p5 .. p5}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_96

    .line 1267
    const/4 v2, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    .end local v7           #deliveryIntent:Landroid/app/PendingIntent;
    check-cast v7, Landroid/app/PendingIntent;

    .line 1270
    .restart local v7       #deliveryIntent:Landroid/app/PendingIntent;
    :cond_96
    const/4 v2, 0x0

    invoke-virtual {p3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    invoke-virtual/range {v2 .. v11}, Landroid/telephony/SmsManager;->sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;ZIII)V

    goto :goto_71

    .line 1257
    .end local v6           #sentIntent:Landroid/app/PendingIntent;
    .end local v7           #deliveryIntent:Landroid/app/PendingIntent;
    :catch_ac
    move-exception v2

    goto :goto_71
.end method

.method public sendMultipartTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;ZIIII)V
    .registers 24
    .parameter "destinationAddress"
    .parameter "scAddress"
    .parameter
    .parameter
    .parameter
    .parameter "replyPath"
    .parameter "expiry"
    .parameter "serviceType"
    .parameter "encodingType"
    .parameter "confirmID"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;ZIIII)V"
        }
    .end annotation

    .prologue
    .line 1325
    .local p3, parts:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p4, sentIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    .local p5, deliveryIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    const-string v2, "SmsManager"

    const-string v3, "sendMultipartTextMessage in SmsManager with options.."

    invoke-static {v2, v3}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1326
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_15

    .line 1327
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Invalid destinationAddress"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1329
    :cond_15
    if-nez p3, :cond_1f

    .line 1330
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Invalid parts"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1332
    :cond_1f
    invoke-virtual/range {p3 .. p3}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-ge v2, v3, :cond_3a

    .line 1333
    invoke-static {}, Lcom/sec/android/app/CscFeature;->getInstance()Lcom/sec/android/app/CscFeature;

    move-result-object v2

    const-string v3, "CscFeature_Message_EnableSendingEmptySms"

    invoke-virtual {v2, v3}, Lcom/sec/android/app/CscFeature;->getEnableStatus(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3a

    .line 1334
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Invalid message body"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1338
    :cond_3a
    invoke-virtual {p0}, Landroid/telephony/SmsManager;->getToddlerMode()Z

    move-result v2

    if-eqz v2, :cond_48

    .line 1339
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "toddler mode on"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1342
    :cond_48
    invoke-virtual/range {p3 .. p3}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_73

    .line 1344
    :try_start_4f
    iget-object v2, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v1

    .line 1345
    .local v1, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v1, :cond_72

    .line 1347
    invoke-static {}, Landroid/app/ActivityThread;->currentPackageName()Ljava/lang/String;

    move-result-object v2

    move-object v3, p1

    move-object v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    invoke-interface/range {v1 .. v11}, Lcom/android/internal/telephony/ISms;->sendMultipartTextwithOptions(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;ZIII)V
    :try_end_72
    .catch Landroid/os/RemoteException; {:try_start_4f .. :try_end_72} :catch_b1

    .line 1367
    .end local v1           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_72
    :goto_72
    return-void

    .line 1355
    :cond_73
    const/4 v6, 0x0

    .line 1356
    .local v6, sentIntent:Landroid/app/PendingIntent;
    const/4 v7, 0x0

    .line 1357
    .local v7, deliveryIntent:Landroid/app/PendingIntent;
    if-eqz p4, :cond_86

    invoke-virtual/range {p4 .. p4}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_86

    .line 1358
    const/4 v2, 0x0

    move-object/from16 v0, p4

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    .end local v6           #sentIntent:Landroid/app/PendingIntent;
    check-cast v6, Landroid/app/PendingIntent;

    .line 1360
    .restart local v6       #sentIntent:Landroid/app/PendingIntent;
    :cond_86
    if-eqz p5, :cond_97

    invoke-virtual/range {p5 .. p5}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_97

    .line 1361
    const/4 v2, 0x0

    move-object/from16 v0, p5

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    .end local v7           #deliveryIntent:Landroid/app/PendingIntent;
    check-cast v7, Landroid/app/PendingIntent;

    .line 1364
    .restart local v7       #deliveryIntent:Landroid/app/PendingIntent;
    :cond_97
    const/4 v2, 0x0

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    move/from16 v11, p9

    move/from16 v12, p10

    invoke-virtual/range {v2 .. v12}, Landroid/telephony/SmsManager;->sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;ZIIII)V

    goto :goto_72

    .line 1351
    .end local v6           #sentIntent:Landroid/app/PendingIntent;
    .end local v7           #deliveryIntent:Landroid/app/PendingIntent;
    :catch_b1
    move-exception v2

    goto :goto_72
.end method

.method public sendOTADomestic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 7
    .parameter "destinationAddress"
    .parameter "scAddress"
    .parameter "text"

    .prologue
    .line 1490
    const-string v1, "SmsManager"

    const-string v2, "sendOTADomestic in SmsManager"

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1491
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 1492
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid destinationAddress"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1495
    :cond_15
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2f

    .line 1497
    invoke-static {}, Lcom/sec/android/app/CscFeature;->getInstance()Lcom/sec/android/app/CscFeature;

    move-result-object v1

    const-string v2, "CscFeature_Message_EnableSendingEmptySms"

    invoke-virtual {v1, v2}, Lcom/sec/android/app/CscFeature;->getEnableStatus(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2f

    .line 1498
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid message body"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1503
    :cond_2f
    :try_start_2f
    iget-object v1, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v0

    .line 1504
    .local v0, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v0, :cond_42

    .line 1505
    invoke-static {}, Landroid/app/ActivityThread;->currentPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1, p2, p3}, Lcom/android/internal/telephony/ISms;->sendOTADomestic(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_42
    .catch Landroid/os/RemoteException; {:try_start_2f .. :try_end_42} :catch_43

    .line 1510
    .end local v0           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_42
    :goto_42
    return-void

    .line 1507
    :catch_43
    move-exception v1

    goto :goto_42
.end method

.method public sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)V
    .registers 13
    .parameter "destinationAddress"
    .parameter "scAddress"
    .parameter "text"
    .parameter "sentIntent"
    .parameter "deliveryIntent"

    .prologue
    .line 124
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 125
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid destinationAddress"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 128
    :cond_e
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 129
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid message body"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 134
    :cond_1c
    :try_start_1c
    iget-object v1, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v0

    .line 136
    .local v0, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v0, :cond_34

    .line 137
    invoke-static {}, Landroid/app/ActivityThread;->currentPackageName()Ljava/lang/String;

    move-result-object v1

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-interface/range {v0 .. v6}, Lcom/android/internal/telephony/ISms;->sendText(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)V
    :try_end_34
    .catch Landroid/os/RemoteException; {:try_start_1c .. :try_end_34} :catch_35

    .line 143
    .end local v0           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_34
    :goto_34
    return-void

    .line 140
    :catch_35
    move-exception v1

    goto :goto_34
.end method

.method public sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;I)V
    .registers 7
    .parameter "destinationAddress"
    .parameter "scAddress"
    .parameter "text"
    .parameter "sentIntent"
    .parameter "deliveryIntent"
    .parameter "phoneType"

    .prologue
    .line 1483
    invoke-virtual/range {p0 .. p5}, Landroid/telephony/SmsManager;->sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;)V

    .line 1484
    return-void
.end method

.method public sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Ljava/lang/String;I)V
    .registers 17
    .parameter "destinationAddress"
    .parameter "scAddress"
    .parameter "text"
    .parameter "sentIntent"
    .parameter "deliveryIntent"
    .parameter "callbackNumber"
    .parameter "priority"

    .prologue
    .line 1452
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 1453
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid destinationAddress"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1456
    :cond_e
    invoke-virtual {p0}, Landroid/telephony/SmsManager;->getToddlerMode()Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 1457
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "toddler mode on"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1460
    :cond_1c
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_36

    .line 1462
    invoke-static {}, Lcom/sec/android/app/CscFeature;->getInstance()Lcom/sec/android/app/CscFeature;

    move-result-object v1

    const-string v2, "CscFeature_Message_EnableSendingEmptySms"

    invoke-virtual {v1, v2}, Lcom/sec/android/app/CscFeature;->getEnableStatus(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_36

    .line 1464
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid message body"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1469
    :cond_36
    :try_start_36
    iget-object v1, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v0

    .line 1470
    .local v0, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v0, :cond_51

    .line 1471
    invoke-static {}, Landroid/app/ActivityThread;->currentPackageName()Ljava/lang/String;

    move-result-object v1

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object v7, p6

    move/from16 v8, p7

    invoke-interface/range {v0 .. v8}, Lcom/android/internal/telephony/ISms;->sendTextwithCBP(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;Ljava/lang/String;I)V
    :try_end_51
    .catch Landroid/os/RemoteException; {:try_start_36 .. :try_end_51} :catch_52

    .line 1477
    .end local v0           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_51
    :goto_51
    return-void

    .line 1474
    :catch_52
    move-exception v1

    goto :goto_51
.end method

.method public sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;ZIII)V
    .registers 21
    .parameter "destinationAddress"
    .parameter "scAddress"
    .parameter "text"
    .parameter "sentIntent"
    .parameter "deliveryIntent"
    .parameter "replyPath"
    .parameter "expiry"
    .parameter "serviceType"
    .parameter "encodingType"

    .prologue
    .line 1421
    const-string v1, "SmsManager"

    const-string v2, "sendTextMessage in SmsManager with options"

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1422
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 1423
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid destinationAddress"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1426
    :cond_15
    invoke-virtual {p0}, Landroid/telephony/SmsManager;->getToddlerMode()Z

    move-result v1

    if-eqz v1, :cond_23

    .line 1427
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "toddler mode on"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1430
    :cond_23
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3d

    .line 1432
    invoke-static {}, Lcom/sec/android/app/CscFeature;->getInstance()Lcom/sec/android/app/CscFeature;

    move-result-object v1

    const-string v2, "CscFeature_Message_EnableSendingEmptySms"

    invoke-virtual {v1, v2}, Lcom/sec/android/app/CscFeature;->getEnableStatus(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3d

    .line 1433
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid message body"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1438
    :cond_3d
    :try_start_3d
    iget-object v1, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v0

    .line 1439
    .local v0, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v0, :cond_5e

    .line 1440
    invoke-static {}, Landroid/app/ActivityThread;->currentPackageName()Ljava/lang/String;

    move-result-object v1

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/ISms;->sendTextwithOptions(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;ZIII)V
    :try_end_5e
    .catch Landroid/os/RemoteException; {:try_start_3d .. :try_end_5e} :catch_5f

    .line 1446
    .end local v0           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_5e
    :goto_5e
    return-void

    .line 1443
    :catch_5f
    move-exception v1

    goto :goto_5e
.end method

.method public sendTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;ZIIII)V
    .registers 23
    .parameter "destinationAddress"
    .parameter "scAddress"
    .parameter "text"
    .parameter "sentIntent"
    .parameter "deliveryIntent"
    .parameter "replyPath"
    .parameter "expiry"
    .parameter "serviceType"
    .parameter "encodingType"
    .parameter "confirmID"

    .prologue
    .line 1518
    const-string v1, "SmsManager"

    const-string v2, "sendTextMessage in SmsManager with options."

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 1519
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_15

    .line 1520
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid destinationAddress"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1523
    :cond_15
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2f

    .line 1525
    invoke-static {}, Lcom/sec/android/app/CscFeature;->getInstance()Lcom/sec/android/app/CscFeature;

    move-result-object v1

    const-string v2, "CscFeature_Message_EnableSendingEmptySms"

    invoke-virtual {v1, v2}, Lcom/sec/android/app/CscFeature;->getEnableStatus(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2f

    .line 1526
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Invalid message body"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1530
    :cond_2f
    invoke-virtual {p0}, Landroid/telephony/SmsManager;->getToddlerMode()Z

    move-result v1

    if-eqz v1, :cond_3d

    .line 1531
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "toddler mode on"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1535
    :cond_3d
    :try_start_3d
    iget-object v1, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v0

    .line 1536
    .local v0, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v0, :cond_61

    .line 1537
    invoke-static {}, Landroid/app/ActivityThread;->currentPackageName()Ljava/lang/String;

    move-result-object v1

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    move/from16 v11, p10

    invoke-interface/range {v0 .. v11}, Lcom/android/internal/telephony/ISms;->sendTextwithOptionsReadconfirm(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;Landroid/app/PendingIntent;ZIIII)V
    :try_end_61
    .catch Landroid/os/RemoteException; {:try_start_3d .. :try_end_61} :catch_62

    .line 1543
    .end local v0           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_61
    :goto_61
    return-void

    .line 1540
    :catch_62
    move-exception v1

    goto :goto_61
.end method

.method public sendscptResultMessage(Ljava/lang/String;IIIILjava/util/ArrayList;Ljava/util/ArrayList;)V
    .registers 16
    .parameter "destinationAddress"
    .parameter "NoOfOccur"
    .parameter "Category"
    .parameter "Language"
    .parameter "categoryResult"
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "IIII",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/app/PendingIntent;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p6, sentIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    .local p7, deliveryIntents:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    const/4 v2, 0x0

    .line 1374
    const/4 v6, 0x0

    .line 1375
    .local v6, sentIntent:Landroid/app/PendingIntent;
    const/4 v7, 0x0

    .line 1377
    .local v7, deliveryIntent:Landroid/app/PendingIntent;
    if-eqz p6, :cond_11

    invoke-virtual {p6}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_11

    .line 1378
    invoke-virtual {p6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    .end local v6           #sentIntent:Landroid/app/PendingIntent;
    check-cast v6, Landroid/app/PendingIntent;

    .line 1380
    .restart local v6       #sentIntent:Landroid/app/PendingIntent;
    :cond_11
    if-eqz p7, :cond_1f

    invoke-virtual {p7}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_1f

    .line 1381
    invoke-virtual {p7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    .end local v7           #deliveryIntent:Landroid/app/PendingIntent;
    check-cast v7, Landroid/app/PendingIntent;

    .line 1385
    .restart local v7       #deliveryIntent:Landroid/app/PendingIntent;
    :cond_1f
    :try_start_1f
    iget-object v1, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v0

    .line 1386
    .local v0, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v0, :cond_33

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    .line 1387
    invoke-interface/range {v0 .. v7}, Lcom/android/internal/telephony/ISms;->sendscptResult(Ljava/lang/String;IIIILandroid/app/PendingIntent;Landroid/app/PendingIntent;)V
    :try_end_33
    .catch Landroid/os/RemoteException; {:try_start_1f .. :try_end_33} :catch_34

    .line 1392
    .end local v0           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_33
    :goto_33
    return-void

    .line 1389
    :catch_34
    move-exception v1

    goto :goto_33
.end method

.method public setCDMASmsReassembly(Z)V
    .registers 7
    .parameter "onOff"

    .prologue
    .line 1397
    :try_start_0
    const-string v2, "isms"

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v1

    .line 1398
    .local v1, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v1, :cond_f

    .line 1399
    invoke-interface {v1, p1}, Lcom/android/internal/telephony/ISms;->setCDMASmsReassembly(Z)V
    :try_end_f
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_f} :catch_10

    .line 1404
    .end local v1           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_f
    :goto_f
    return-void

    .line 1401
    :catch_10
    move-exception v0

    .line 1402
    .local v0, ex:Landroid/os/RemoteException;
    const-string v2, "SmsManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "expcetion in setCDMASmsReassembly "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_f
.end method

.method public updateMessageOnIcc(II[B)Z
    .registers 7
    .parameter "messageIndex"
    .parameter "newStatus"
    .parameter "pdu"

    .prologue
    .line 460
    const/4 v1, 0x0

    .line 464
    .local v1, success:Z
    :try_start_1
    iget-object v2, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v2}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v2

    invoke-static {v2}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v0

    .line 466
    .local v0, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v0, :cond_15

    .line 467
    invoke-static {}, Landroid/app/ActivityThread;->currentPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, p1, p2, p3}, Lcom/android/internal/telephony/ISms;->updateMessageOnIccEf(Ljava/lang/String;II[B)Z
    :try_end_14
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_14} :catch_16

    move-result v1

    .line 474
    .end local v0           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_15
    :goto_15
    return v1

    .line 470
    :catch_16
    move-exception v2

    goto :goto_15
.end method

.method public updateSmsServiceCenterOnSim(Ljava/lang/String;)Z
    .registers 11
    .parameter "scAddress"

    .prologue
    .line 918
    const-string v7, "SmsManager"

    const-string v8, "updateSmsServiceCenterOnSim"

    invoke-static {v7, v8}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 920
    const/4 v5, 0x0

    .line 925
    .local v5, success:Z
    if-nez p1, :cond_1d

    .line 926
    const/4 v0, 0x0

    .line 939
    .local v0, encodedScAddress:[B
    :goto_b
    :try_start_b
    iget-object v7, p0, Landroid/telephony/SmsManager;->mServiceName:Ljava/lang/String;

    invoke-static {v7}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v7

    invoke-static {v7}, Lcom/android/internal/telephony/ISms$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ISms;

    move-result-object v2

    .line 940
    .local v2, iccISms:Lcom/android/internal/telephony/ISms;
    if-eqz v2, :cond_1b

    .line 941
    invoke-interface {v2, v0}, Lcom/android/internal/telephony/ISms;->updateSmsServiceCenterOnSimEf([B)Z
    :try_end_1a
    .catch Landroid/os/RemoteException; {:try_start_b .. :try_end_1a} :catch_3d

    move-result v5

    .end local v2           #iccISms:Lcom/android/internal/telephony/ISms;
    :cond_1b
    :goto_1b
    move v6, v5

    .line 947
    .end local v0           #encodedScAddress:[B
    .end local v5           #success:Z
    .local v6, success:I
    :goto_1c
    return v6

    .line 928
    .end local v6           #success:I
    .restart local v5       #success:Z
    :cond_1d
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    .line 929
    .local v4, numberLenReal:I
    move v3, v4

    .line 930
    .local v3, numberLenEffective:I
    const/16 v7, 0x2b

    invoke-virtual {p1, v7}, Ljava/lang/String;->indexOf(I)I

    move-result v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_36

    const/4 v1, 0x1

    .line 931
    .local v1, hasPlus:Z
    :goto_2c
    if-eqz v1, :cond_30

    add-int/lit8 v3, v3, -0x1

    .line 932
    :cond_30
    const/16 v7, 0x14

    if-le v3, v7, :cond_38

    move v6, v5

    .line 933
    .restart local v6       #success:I
    goto :goto_1c

    .line 930
    .end local v1           #hasPlus:Z
    .end local v6           #success:I
    :cond_36
    const/4 v1, 0x0

    goto :goto_2c

    .line 935
    .restart local v1       #hasPlus:Z
    :cond_38
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->networkPortionToCalledPartyBCDWithLength(Ljava/lang/String;)[B

    move-result-object v0

    .restart local v0       #encodedScAddress:[B
    goto :goto_b

    .line 943
    .end local v1           #hasPlus:Z
    .end local v3           #numberLenEffective:I
    .end local v4           #numberLenReal:I
    :catch_3d
    move-exception v7

    goto :goto_1b
.end method
