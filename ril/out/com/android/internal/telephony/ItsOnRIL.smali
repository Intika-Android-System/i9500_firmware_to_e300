.class public Lcom/android/internal/telephony/ItsOnRIL;
.super Lcom/android/internal/telephony/RIL;
.source "ItsOnRIL.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/ItsOnRIL$ItsOnRilHandler;
    }
.end annotation


# static fields
.field static final DEBUG:Z = false

.field protected static final EVENT_POLL_CALLS_RESULT:I = 0x1

.field static final LOG_TAG:Ljava/lang/String; = "ItsOnRil"

.field public static final RIL_REQUEST_IMS_SEND_SMS:I = 0x1869f


# instance fields
.field private mHandler:Landroid/os/Handler;

.field mIOPhoneClient:Lcom/itsoninc/android/ItsOnPhoneClient;


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .registers 5
    .parameter "context"
    .parameter "preferredNetworkType"
    .parameter "cdmaSubscription"

    .prologue
    .line 41
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/telephony/RIL;-><init>(Landroid/content/Context;II)V

    .line 43
    invoke-static {p0}, Lcom/itsoninc/android/ItsOnPhoneClientFactory;->configure(Lcom/android/internal/telephony/RIL;)V

    .line 44
    invoke-static {p1}, Lcom/itsoninc/android/ItsOnPhoneClientFactory;->get(Landroid/content/Context;)Lcom/itsoninc/android/ItsOnPhoneClient;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/telephony/ItsOnRIL;->mIOPhoneClient:Lcom/itsoninc/android/ItsOnPhoneClient;

    .line 45
    new-instance v0, Lcom/android/internal/telephony/ItsOnRIL$ItsOnRilHandler;

    invoke-direct {v0, p0}, Lcom/android/internal/telephony/ItsOnRIL$ItsOnRilHandler;-><init>(Lcom/android/internal/telephony/ItsOnRIL;)V

    iput-object v0, p0, Lcom/android/internal/telephony/ItsOnRIL;->mHandler:Landroid/os/Handler;

    .line 46
    return-void
.end method

.method private static decodeDtmfSmsAddress([BI)Ljava/lang/String;
    .registers 8
    .parameter "rawData"
    .parameter "numFields"

    .prologue
    const/4 v3, 0x0

    const/16 v5, 0xa

    .line 50
    if-nez p0, :cond_6

    .line 64
    :cond_5
    :goto_5
    return-object v3

    .line 55
    :cond_6
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1, p1}, Ljava/lang/StringBuffer;-><init>(I)V

    .line 56
    .local v1, strBuf:Ljava/lang/StringBuffer;
    const/4 v0, 0x0

    .local v0, i:I
    :goto_c
    if-ge v0, p1, :cond_3f

    .line 57
    aget-byte v4, p0, v0

    and-int/lit8 v2, v4, 0xf

    .line 58
    .local v2, val:I
    const/4 v4, 0x1

    if-lt v2, v4, :cond_23

    const/16 v4, 0x9

    if-gt v2, v4, :cond_23

    invoke-static {v2, v5}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 56
    :goto_20
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 59
    :cond_23
    if-ne v2, v5, :cond_2b

    const/16 v4, 0x30

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_20

    .line 60
    :cond_2b
    const/16 v4, 0xb

    if-ne v2, v4, :cond_35

    const/16 v4, 0x2a

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_20

    .line 61
    :cond_35
    const/16 v4, 0xc

    if-ne v2, v4, :cond_5

    const/16 v4, 0x23

    invoke-virtual {v1, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    goto :goto_20

    .line 64
    .end local v2           #val:I
    :cond_3f
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_5
.end method

.method private extractAddress(Lcom/android/internal/telephony/RILRequest;I)Ljava/lang/String;
    .registers 9
    .parameter "rr"
    .parameter "initialOffset"

    .prologue
    .line 241
    iget-object v4, p1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    add-int/lit8 v5, p2, 0x1c

    invoke-virtual {v4, v5}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 242
    iget-object v4, p1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v4}, Landroid/os/Parcel;->readByte()B

    move-result v2

    .line 243
    .local v2, address_nbr_of_digits:I
    const/4 v1, 0x0

    .line 244
    .local v1, addressBytes:[B
    new-array v1, v2, [B

    .line 245
    const/4 v3, 0x0

    .local v3, i:I
    :goto_11
    if-ge v3, v2, :cond_1e

    .line 246
    iget-object v4, p1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v4}, Landroid/os/Parcel;->readByte()B

    move-result v4

    aput-byte v4, v1, v3

    .line 245
    add-int/lit8 v3, v3, 0x1

    goto :goto_11

    .line 248
    :cond_1e
    invoke-static {v1, v2}, Lcom/android/internal/telephony/ItsOnRIL;->decodeDtmfSmsAddress([BI)Ljava/lang/String;

    move-result-object v0

    .line 249
    .local v0, address:Ljava/lang/String;
    return-object v0
.end method

.method private extractCdmaPdu(Landroid/os/Parcel;)[B
    .registers 10
    .parameter "p"

    .prologue
    .line 68
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    const/16 v7, 0x200

    invoke-direct {v1, v7}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 69
    .local v1, baos:Ljava/io/ByteArrayOutputStream;
    new-instance v3, Ljava/io/DataOutputStream;

    invoke-direct {v3, v1}, Ljava/io/DataOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 72
    .local v3, dos:Ljava/io/DataOutputStream;
    :try_start_c
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v7

    invoke-virtual {v3, v7}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 73
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v7

    invoke-virtual {v3, v7}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 74
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v7

    invoke-virtual {v3, v7}, Ljava/io/DataOutputStream;->writeInt(I)V

    .line 75
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v7

    invoke-virtual {v3, v7}, Ljava/io/DataOutputStream;->write(I)V

    .line 76
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v7

    invoke-virtual {v3, v7}, Ljava/io/DataOutputStream;->write(I)V

    .line 77
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v7

    invoke-virtual {v3, v7}, Ljava/io/DataOutputStream;->write(I)V

    .line 78
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v7

    invoke-virtual {v3, v7}, Ljava/io/DataOutputStream;->write(I)V

    .line 80
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    .line 81
    .local v0, address_nbr_of_digits:I
    invoke-virtual {v3, v0}, Ljava/io/DataOutputStream;->write(I)V

    .line 82
    const/4 v5, 0x0

    .local v5, i:I
    :goto_45
    if-ge v5, v0, :cond_51

    .line 83
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v7

    invoke-virtual {v3, v7}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 82
    add-int/lit8 v5, v5, 0x1

    goto :goto_45

    .line 86
    :cond_51
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v7

    invoke-virtual {v3, v7}, Ljava/io/DataOutputStream;->write(I)V

    .line 87
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v7

    invoke-virtual {v3, v7}, Ljava/io/DataOutputStream;->write(I)V

    .line 89
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v6

    .line 90
    .local v6, subaddr_nbr_of_digits:I
    invoke-virtual {v3, v6}, Ljava/io/DataOutputStream;->write(I)V

    .line 91
    const/4 v5, 0x0

    :goto_67
    if-ge v5, v6, :cond_73

    .line 92
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v7

    invoke-virtual {v3, v7}, Ljava/io/DataOutputStream;->writeByte(I)V

    .line 91
    add-int/lit8 v5, v5, 0x1

    goto :goto_67

    .line 95
    :cond_73
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 96
    .local v2, bearerDataLength:I
    invoke-virtual {v3, v2}, Ljava/io/DataOutputStream;->write(I)V

    .line 97
    const/4 v5, 0x0

    :goto_7b
    if-ge v5, v2, :cond_8d

    .line 98
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v7

    invoke-virtual {v3, v7}, Ljava/io/DataOutputStream;->writeByte(I)V
    :try_end_84
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_84} :catch_87

    .line 97
    add-int/lit8 v5, v5, 0x1

    goto :goto_7b

    .line 100
    .end local v0           #address_nbr_of_digits:I
    .end local v2           #bearerDataLength:I
    .end local v5           #i:I
    .end local v6           #subaddr_nbr_of_digits:I
    :catch_87
    move-exception v4

    .line 101
    .local v4, e:Ljava/io/IOException;
    const-string v7, "Failed to convert SMS PDU"

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/ItsOnRIL;->riljLog(Ljava/lang/String;)V

    .line 104
    .end local v4           #e:Ljava/io/IOException;
    :cond_8d
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v7

    return-object v7
.end method

.method private findFromList(I)Lcom/android/internal/telephony/RILRequest;
    .registers 4
    .parameter "serial"

    .prologue
    .line 109
    iget-object v1, p0, Lcom/android/internal/telephony/RIL;->mRequestList:Landroid/util/SparseArray;

    monitor-enter v1

    .line 110
    :try_start_3
    iget-object v0, p0, Lcom/android/internal/telephony/RIL;->mRequestList:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/RILRequest;

    monitor-exit v1

    return-object v0

    .line 111
    :catchall_d
    move-exception v0

    monitor-exit v1
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_d

    throw v0
.end method


# virtual methods
.method protected processSolicited(Landroid/os/Parcel;)Lcom/android/internal/telephony/RILRequest;
    .registers 14
    .parameter "p"

    .prologue
    .line 257
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v4

    .line 258
    .local v4, pos:I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v7

    .line 259
    .local v7, serial:I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 263
    .local v2, error:I
    invoke-direct {p0, v7}, Lcom/android/internal/telephony/ItsOnRIL;->findFromList(I)Lcom/android/internal/telephony/RILRequest;

    move-result-object v6

    .line 265
    .local v6, rr:Lcom/android/internal/telephony/RILRequest;
    if-nez v6, :cond_3c

    .line 266
    const-string v9, "ItsOnRil"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Unexpected solicited response! sn: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " error: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 268
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 269
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->processSolicited(Landroid/os/Parcel;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v9

    .line 310
    :goto_3b
    return-object v9

    .line 271
    :cond_3c
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "processSolicited "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, v6, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v10}, Lcom/android/internal/telephony/ItsOnRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/ItsOnRIL;->riljLog(Ljava/lang/String;)V

    .line 272
    if-nez v2, :cond_118

    .line 273
    iget v9, v6, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    sparse-switch v9, :sswitch_data_128

    .line 309
    :cond_5f
    :goto_5f
    invoke-virtual {p1, v4}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 310
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->processSolicited(Landroid/os/Parcel;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v9

    goto :goto_3b

    .line 276
    :sswitch_67
    iget-object v9, p0, Lcom/android/internal/telephony/ItsOnRIL;->mIOPhoneClient:Lcom/itsoninc/android/ItsOnPhoneClient;

    iget v10, v6, Lcom/android/internal/telephony/RILRequest;->mSerial:I

    invoke-virtual {v9, v10}, Lcom/itsoninc/android/ItsOnPhoneClient;->sendSMSDone(I)V

    goto :goto_5f

    .line 279
    :sswitch_6f
    iget-object v9, v6, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    iget-object v1, v9, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v1, Lcom/android/internal/telephony/dataconnection/DataConnection$ConnectionParams;

    .line 281
    .local v1, cp:Lcom/android/internal/telephony/dataconnection/DataConnection$ConnectionParams;
    const/4 v0, 0x0

    .line 282
    .local v0, apn:Ljava/lang/String;
    const/4 v3, 0x0

    .line 283
    .local v3, iface:Ljava/lang/String;
    invoke-virtual {v1}, Lcom/android/internal/telephony/dataconnection/DataConnection$ConnectionParams;->getApnContext()Lcom/android/internal/telephony/dataconnection/ApnContext;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnSetting()Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v9

    iget-object v9, v9, Lcom/android/internal/telephony/dataconnection/ApnSetting;->apn:Ljava/lang/String;

    if-eqz v9, :cond_9d

    invoke-virtual {v1}, Lcom/android/internal/telephony/dataconnection/DataConnection$ConnectionParams;->getApnContext()Lcom/android/internal/telephony/dataconnection/ApnContext;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnSetting()Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v9

    iget-object v9, v9, Lcom/android/internal/telephony/dataconnection/ApnSetting;->apn:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-eqz v9, :cond_9d

    .line 284
    invoke-virtual {v1}, Lcom/android/internal/telephony/dataconnection/DataConnection$ConnectionParams;->getApnContext()Lcom/android/internal/telephony/dataconnection/ApnContext;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnSetting()Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v9

    iget-object v0, v9, Lcom/android/internal/telephony/dataconnection/ApnSetting;->apn:Ljava/lang/String;

    .line 288
    :cond_9d
    :try_start_9d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/RIL;->responseSetupDataCall(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/android/internal/telephony/dataconnection/DataCallResponse;

    .line 289
    .local v5, result:Lcom/android/internal/telephony/dataconnection/DataCallResponse;
    iget-object v9, v5, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->ifname:Ljava/lang/String;

    if-eqz v9, :cond_b1

    iget-object v9, v5, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->ifname:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v9

    if-eqz v9, :cond_b1

    .line 290
    iget-object v3, v5, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->ifname:Ljava/lang/String;

    .line 292
    :cond_b1
    if-eqz v0, :cond_5f

    iget v9, v5, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->status:I

    if-nez v9, :cond_5f

    if-eqz v3, :cond_5f

    .line 293
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "New session apn "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " iface "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " type "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v1}, Lcom/android/internal/telephony/dataconnection/DataConnection$ConnectionParams;->getApnContext()Lcom/android/internal/telephony/dataconnection/ApnContext;

    move-result-object v10

    invoke-virtual {v10}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/ItsOnRIL;->riljLog(Ljava/lang/String;)V

    .line 294
    iget-object v9, p0, Lcom/android/internal/telephony/ItsOnRIL;->mIOPhoneClient:Lcom/itsoninc/android/ItsOnPhoneClient;

    invoke-virtual {v1}, Lcom/android/internal/telephony/dataconnection/DataConnection$ConnectionParams;->getApnContext()Lcom/android/internal/telephony/dataconnection/ApnContext;

    move-result-object v10

    invoke-virtual {v10}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v3, v0, v10}, Lcom/itsoninc/android/ItsOnPhoneClient;->onNewDataSession(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_f8
    .catch Ljava/lang/Throwable; {:try_start_9d .. :try_end_f8} :catch_fa

    goto/16 :goto_5f

    .line 296
    .end local v5           #result:Lcom/android/internal/telephony/dataconnection/DataCallResponse;
    :catch_fa
    move-exception v8

    .line 297
    .local v8, t:Ljava/lang/Throwable;
    const-string v9, "ERROR: fail to parse call state "

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/ItsOnRIL;->riljLog(Ljava/lang/String;)V

    .line 298
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "ERROR: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/ItsOnRIL;->riljLog(Ljava/lang/String;)V

    goto/16 :goto_5f

    .line 302
    .end local v0           #apn:Ljava/lang/String;
    .end local v1           #cp:Lcom/android/internal/telephony/dataconnection/DataConnection$ConnectionParams;
    .end local v3           #iface:Ljava/lang/String;
    .end local v8           #t:Ljava/lang/Throwable;
    :cond_118
    iget v9, v6, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    sparse-switch v9, :sswitch_data_136

    goto/16 :goto_5f

    .line 305
    :sswitch_11f
    iget-object v9, p0, Lcom/android/internal/telephony/ItsOnRIL;->mIOPhoneClient:Lcom/itsoninc/android/ItsOnPhoneClient;

    iget v10, v6, Lcom/android/internal/telephony/RILRequest;->mSerial:I

    invoke-virtual {v9, v10}, Lcom/itsoninc/android/ItsOnPhoneClient;->sendSMSError(I)V

    goto/16 :goto_5f

    .line 273
    :sswitch_data_128
    .sparse-switch
        0x19 -> :sswitch_67
        0x1b -> :sswitch_6f
        0x57 -> :sswitch_67
    .end sparse-switch

    .line 302
    :sswitch_data_136
    .sparse-switch
        0x19 -> :sswitch_11f
        0x57 -> :sswitch_11f
    .end sparse-switch
.end method

.method protected processUnsolicited(Landroid/os/Parcel;)V
    .registers 14
    .parameter "p"

    .prologue
    .line 316
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v5

    .line 317
    .local v5, pos:I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v6

    .line 319
    .local v6, response:I
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "processUnsolicited "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {v6}, Lcom/android/internal/telephony/ItsOnRIL;->responseToString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/ItsOnRIL;->riljLog(Ljava/lang/String;)V

    .line 322
    sparse-switch v6, :sswitch_data_a6

    .line 363
    :cond_2f
    :goto_2f
    invoke-virtual {p1, v5}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 364
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->processUnsolicited(Landroid/os/Parcel;)V

    .line 365
    :goto_35
    return-void

    .line 324
    :sswitch_36
    const/4 v9, 0x2

    new-array v0, v9, [Ljava/lang/String;

    .line 325
    .local v0, a:[Ljava/lang/String;
    const/4 v9, 0x1

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v0, v9

    .line 326
    invoke-static {v0}, Landroid/telephony/SmsMessage;->newFromCMT([Ljava/lang/String;)Landroid/telephony/SmsMessage;

    move-result-object v8

    .line 327
    .local v8, sms:Landroid/telephony/SmsMessage;
    iget-object v9, p0, Lcom/android/internal/telephony/ItsOnRIL;->mIOPhoneClient:Lcom/itsoninc/android/ItsOnPhoneClient;

    invoke-virtual {v9, v8}, Lcom/itsoninc/android/ItsOnPhoneClient;->authorizeIncomingSMS(Landroid/telephony/SmsMessage;)Z

    move-result v9

    if-nez v9, :cond_2f

    .line 328
    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual {p0, v9, v10, v11}, Lcom/android/internal/telephony/RIL;->acknowledgeLastIncomingGsmSms(ZILandroid/os/Message;)V

    goto :goto_35

    .line 334
    .end local v0           #a:[Ljava/lang/String;
    .end local v8           #sms:Landroid/telephony/SmsMessage;
    :sswitch_53
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v4

    .line 335
    .local v4, nitzTime:Ljava/lang/String;
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v2

    .line 336
    .local v2, nitzReceiveTime:J
    iget-object v9, p0, Lcom/android/internal/telephony/ItsOnRIL;->mIOPhoneClient:Lcom/itsoninc/android/ItsOnPhoneClient;

    invoke-virtual {v9, v4, v2, v3}, Lcom/itsoninc/android/ItsOnPhoneClient;->nitzTimeReceived(Ljava/lang/String;J)V

    goto :goto_2f

    .line 340
    .end local v2           #nitzReceiveTime:J
    .end local v4           #nitzTime:Ljava/lang/String;
    :sswitch_61
    invoke-static {p1}, Landroid/telephony/SmsMessage;->newFromParcel(Landroid/os/Parcel;)Landroid/telephony/SmsMessage;

    move-result-object v8

    .line 341
    .restart local v8       #sms:Landroid/telephony/SmsMessage;
    iget-object v9, v8, Landroid/telephony/SmsMessage;->mWrappedSmsMessage:Lcom/android/internal/telephony/SmsMessageBase;

    iget-object v9, v9, Lcom/android/internal/telephony/SmsMessageBase;->mOriginatingAddress:Lcom/android/internal/telephony/SmsAddress;

    new-instance v10, Ljava/lang/String;

    iget-object v11, v8, Landroid/telephony/SmsMessage;->mWrappedSmsMessage:Lcom/android/internal/telephony/SmsMessageBase;

    iget-object v11, v11, Lcom/android/internal/telephony/SmsMessageBase;->mOriginatingAddress:Lcom/android/internal/telephony/SmsAddress;

    iget-object v11, v11, Lcom/android/internal/telephony/SmsAddress;->origBytes:[B

    invoke-direct {v10, v11}, Ljava/lang/String;-><init>([B)V

    iput-object v10, v9, Lcom/android/internal/telephony/SmsAddress;->address:Ljava/lang/String;

    .line 344
    iget-object v9, p0, Lcom/android/internal/telephony/ItsOnRIL;->mIOPhoneClient:Lcom/itsoninc/android/ItsOnPhoneClient;

    invoke-virtual {v9, v8}, Lcom/itsoninc/android/ItsOnPhoneClient;->authorizeIncomingSMS(Landroid/telephony/SmsMessage;)Z

    move-result v9

    if-nez v9, :cond_2f

    .line 345
    const/4 v9, 0x1

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual {p0, v9, v10, v11}, Lcom/android/internal/telephony/RIL;->acknowledgeLastIncomingCdmaSms(ZILandroid/os/Message;)V

    goto :goto_35

    .line 350
    .end local v8           #sms:Landroid/telephony/SmsMessage;
    :sswitch_85
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/RIL;->responseCdmaCallWaiting(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/cdma/CdmaCallWaitingNotification;

    .line 351
    .local v1, cwNot:Lcom/android/internal/telephony/cdma/CdmaCallWaitingNotification;
    iget-object v9, p0, Lcom/android/internal/telephony/ItsOnRIL;->mIOPhoneClient:Lcom/itsoninc/android/ItsOnPhoneClient;

    iget-object v10, v1, Lcom/android/internal/telephony/cdma/CdmaCallWaitingNotification;->number:Ljava/lang/String;

    invoke-virtual {v9, v10}, Lcom/itsoninc/android/ItsOnPhoneClient;->callWaiting(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_2f

    goto :goto_35

    .line 356
    .end local v1           #cwNot:Lcom/android/internal/telephony/cdma/CdmaCallWaitingNotification;
    :sswitch_96
    iget-object v9, p0, Lcom/android/internal/telephony/ItsOnRIL;->mHandler:Landroid/os/Handler;

    if-nez v9, :cond_9a

    .line 359
    :cond_9a
    iget-object v9, p0, Lcom/android/internal/telephony/ItsOnRIL;->mHandler:Landroid/os/Handler;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Landroid/os/Handler;->obtainMessage(I)Landroid/os/Message;

    move-result-object v7

    .line 360
    .local v7, result:Landroid/os/Message;
    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/RIL;->getCurrentCalls(Landroid/os/Message;)V

    goto :goto_2f

    .line 322
    nop

    :sswitch_data_a6
    .sparse-switch
        0x3eb -> :sswitch_36
        0x3f0 -> :sswitch_53
        0x3fa -> :sswitch_96
        0x3fc -> :sswitch_61
        0x401 -> :sswitch_85
    .end sparse-switch
.end method

.method protected responseCallList(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 5
    .parameter "p"

    .prologue
    .line 369
    const-string v1, "Processing response call list"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/ItsOnRIL;->riljLog(Ljava/lang/String;)V

    .line 371
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->responseCallList(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    .line 372
    .local v0, response:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/DriverCall;>;"
    iget v1, p0, Lcom/android/internal/telephony/BaseCommands;->mPhoneType:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_16

    .line 373
    iget-object v1, p0, Lcom/android/internal/telephony/ItsOnRIL;->mIOPhoneClient:Lcom/itsoninc/android/ItsOnPhoneClient;

    invoke-virtual {v1, v0}, Lcom/itsoninc/android/ItsOnPhoneClient;->trackCdmaCalls(Ljava/util/List;)V

    .line 377
    :goto_15
    return-object v0

    .line 375
    :cond_16
    iget-object v1, p0, Lcom/android/internal/telephony/ItsOnRIL;->mIOPhoneClient:Lcom/itsoninc/android/ItsOnPhoneClient;

    invoke-virtual {v1, v0}, Lcom/itsoninc/android/ItsOnPhoneClient;->trackCalls(Ljava/util/List;)V

    goto :goto_15
.end method

.method protected riljLog(Ljava/lang/String;)V
    .registers 2
    .parameter "msg"

    .prologue
    .line 37
    return-void
.end method

.method protected send(Lcom/android/internal/telephony/RILRequest;)V
    .registers 11
    .parameter "rr"

    .prologue
    const/16 v6, 0x8

    const/4 v8, 0x0

    const/4 v7, 0x2

    .line 143
    iget v5, p1, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    sparse-switch v5, :sswitch_data_e6

    .line 221
    :cond_9
    :goto_9
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Sending "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, p1, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v6}, Lcom/android/internal/telephony/ItsOnRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/ItsOnRIL;->riljLog(Ljava/lang/String;)V

    .line 222
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 223
    :goto_28
    return-void

    .line 145
    :sswitch_29
    const/4 v1, 0x0

    .line 146
    .local v1, authorized:Z
    iget v5, p0, Lcom/android/internal/telephony/BaseCommands;->mPhoneType:I

    if-ne v5, v7, :cond_44

    .line 148
    const/4 v1, 0x1

    .line 154
    :goto_2f
    if-nez v1, :cond_9

    .line 155
    const-string v5, "Could not authorize call"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/ItsOnRIL;->riljLog(Ljava/lang/String;)V

    .line 156
    iget-object v5, p1, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-static {v5, v8, v8}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 157
    iget-object v5, p1, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-virtual {v5}, Landroid/os/Message;->sendToTarget()V

    .line 158
    invoke-virtual {p1}, Lcom/android/internal/telephony/RILRequest;->release()V

    goto :goto_28

    .line 150
    :cond_44
    iget-object v5, p1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v5, v6}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 151
    iget-object v5, p1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v5}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    .line 152
    .local v0, address:Ljava/lang/String;
    iget-object v5, p0, Lcom/android/internal/telephony/ItsOnRIL;->mIOPhoneClient:Lcom/itsoninc/android/ItsOnPhoneClient;

    invoke-virtual {v5, v0}, Lcom/itsoninc/android/ItsOnPhoneClient;->authorizeOutgoingVoice(Ljava/lang/String;)Z

    move-result v1

    goto :goto_2f

    .line 165
    .end local v0           #address:Ljava/lang/String;
    .end local v1           #authorized:Z
    :sswitch_56
    iget-object v5, p0, Lcom/android/internal/telephony/ItsOnRIL;->mIOPhoneClient:Lcom/itsoninc/android/ItsOnPhoneClient;

    invoke-virtual {v5}, Lcom/itsoninc/android/ItsOnPhoneClient;->incomingCallReject()V

    goto :goto_9

    .line 169
    :sswitch_5c
    iget-object v5, p0, Lcom/android/internal/telephony/ItsOnRIL;->mIOPhoneClient:Lcom/itsoninc/android/ItsOnPhoneClient;

    invoke-virtual {v5}, Lcom/itsoninc/android/ItsOnPhoneClient;->incomingCallReject()V

    goto :goto_9

    .line 172
    :sswitch_62
    iget v5, p0, Lcom/android/internal/telephony/BaseCommands;->mPhoneType:I

    if-ne v5, v7, :cond_9

    .line 173
    iget-object v5, p0, Lcom/android/internal/telephony/ItsOnRIL;->mIOPhoneClient:Lcom/itsoninc/android/ItsOnPhoneClient;

    invoke-virtual {v5}, Lcom/itsoninc/android/ItsOnPhoneClient;->acceptCall()V

    goto :goto_9

    .line 178
    :sswitch_6c
    iget-object v5, p1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v5, v6}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 179
    iget-object v5, p1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v5}, Landroid/os/Parcel;->readInt()I

    .line 180
    iget-object v5, p1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v5}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 181
    iget-object v5, p1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v5}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    .line 182
    .local v3, pdu:Ljava/lang/String;
    invoke-static {v3}, Lcom/android/internal/telephony/IccUtils;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v4

    .line 183
    .local v4, pduBytes:[B
    iget-object v5, p0, Lcom/android/internal/telephony/ItsOnRIL;->mIOPhoneClient:Lcom/itsoninc/android/ItsOnPhoneClient;

    iget v6, p1, Lcom/android/internal/telephony/RILRequest;->mSerial:I

    invoke-virtual {v5, v4, v6}, Lcom/itsoninc/android/ItsOnPhoneClient;->authorizeOutgoingSMS([BI)Z

    move-result v5

    if-nez v5, :cond_9

    .line 184
    invoke-virtual {p1, v7, v8}, Lcom/android/internal/telephony/RILRequest;->onError(ILjava/lang/Object;)V

    .line 185
    invoke-virtual {p1}, Lcom/android/internal/telephony/RILRequest;->release()V

    goto :goto_28

    .line 193
    .end local v3           #pdu:Ljava/lang/String;
    .end local v4           #pduBytes:[B
    :sswitch_96
    const/16 v5, 0x14

    invoke-direct {p0, p1, v5}, Lcom/android/internal/telephony/ItsOnRIL;->extractAddress(Lcom/android/internal/telephony/RILRequest;I)Ljava/lang/String;

    move-result-object v0

    .line 194
    .restart local v0       #address:Ljava/lang/String;
    iget-object v5, p0, Lcom/android/internal/telephony/ItsOnRIL;->mIOPhoneClient:Lcom/itsoninc/android/ItsOnPhoneClient;

    iget v6, p1, Lcom/android/internal/telephony/RILRequest;->mSerial:I

    invoke-virtual {v5, v0, v6}, Lcom/itsoninc/android/ItsOnPhoneClient;->authorizeOutgoingSMS(Ljava/lang/String;I)Z

    move-result v5

    if-nez v5, :cond_9

    .line 195
    invoke-virtual {p1, v7, v8}, Lcom/android/internal/telephony/RILRequest;->onError(ILjava/lang/Object;)V

    .line 196
    invoke-virtual {p1}, Lcom/android/internal/telephony/RILRequest;->release()V

    goto/16 :goto_28

    .line 201
    .end local v0           #address:Ljava/lang/String;
    :sswitch_ae
    iget-object v5, p1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v5, v6}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 202
    iget-object v5, p1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/ItsOnRIL;->extractCdmaPdu(Landroid/os/Parcel;)[B

    move-result-object v4

    .line 203
    .restart local v4       #pduBytes:[B
    iget-object v5, p0, Lcom/android/internal/telephony/ItsOnRIL;->mIOPhoneClient:Lcom/itsoninc/android/ItsOnPhoneClient;

    iget v6, p1, Lcom/android/internal/telephony/RILRequest;->mSerial:I

    invoke-virtual {v5, v4, v6}, Lcom/itsoninc/android/ItsOnPhoneClient;->authorizeOutgoingSMS([BI)Z

    move-result v5

    if-nez v5, :cond_9

    .line 204
    invoke-virtual {p1, v7, v8}, Lcom/android/internal/telephony/RILRequest;->onError(ILjava/lang/Object;)V

    .line 205
    invoke-virtual {p1}, Lcom/android/internal/telephony/RILRequest;->release()V

    goto/16 :goto_28

    .line 211
    .end local v4           #pduBytes:[B
    :sswitch_cb
    iget-object v5, p1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v5, v6}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 212
    iget-object v5, p1, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v5}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    .line 214
    .local v2, featureCode:Ljava/lang/String;
    iget-object v5, p0, Lcom/android/internal/telephony/ItsOnRIL;->mIOPhoneClient:Lcom/itsoninc/android/ItsOnPhoneClient;

    invoke-virtual {v5, v2}, Lcom/itsoninc/android/ItsOnPhoneClient;->flash(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_9

    .line 215
    invoke-virtual {p1, v7, v8}, Lcom/android/internal/telephony/RILRequest;->onError(ILjava/lang/Object;)V

    .line 216
    invoke-virtual {p1}, Lcom/android/internal/telephony/RILRequest;->release()V

    goto/16 :goto_28

    .line 143
    :sswitch_data_e6
    .sparse-switch
        0xa -> :sswitch_29
        0xc -> :sswitch_56
        0xd -> :sswitch_5c
        0x19 -> :sswitch_6c
        0x1a -> :sswitch_6c
        0x28 -> :sswitch_62
        0x54 -> :sswitch_cb
        0x57 -> :sswitch_ae
        0x1869f -> :sswitch_96
    .end sparse-switch
.end method