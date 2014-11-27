.class public abstract Lcom/android/internal/telephony/uicc/IccFileHandler;
.super Landroid/os/Handler;
.source "IccFileHandler.java"

# interfaces
.implements Lcom/android/internal/telephony/uicc/IccConstants;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;,
        Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;,
        Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    }
.end annotation


# static fields
.field protected static final COMMAND_GET_RESPONSE:I = 0xc0

.field protected static final COMMAND_READ_BINARY:I = 0xb0

.field protected static final COMMAND_READ_RECORD:I = 0xb2

.field protected static final COMMAND_SEEK:I = 0xa2

.field protected static final COMMAND_UPDATE_BINARY:I = 0xd6

.field protected static final COMMAND_UPDATE_RECORD:I = 0xdc

.field protected static final EF_TYPE_CYCLIC:I = 0x3

.field protected static final EF_TYPE_LINEAR_FIXED:I = 0x1

.field protected static final EF_TYPE_TRANSPARENT:I = 0x0

.field protected static final EVENT_GET_BIG_BINARY_SIZE_DONE:I = 0x76

.field protected static final EVENT_GET_BINARY_SIZE_DONE:I = 0x4

.field protected static final EVENT_GET_EF_LINEAR_RECORD_SIZE_DONE:I = 0x8

.field protected static final EVENT_GET_IMG_RECORD_SIZE_DONE:I = 0x70

.field private static final EVENT_GET_ITEM_SIZE_DONE:I = 0x6e

.field private static final EVENT_GET_RECORD_INFO_DONE:I = 0x73

.field protected static final EVENT_GET_RECORD_SIZE_DONE:I = 0x6

.field protected static final EVENT_GET_RECORD_SIZE_IMG_DONE:I = 0xb

.field protected static final EVENT_GET_SIM_FILE_STATUS_DONE:I = 0x74

.field protected static final EVENT_GET_USIM_PB_CAPA_DONE:I = 0x72

.field private static final EVENT_READ_ADN_DONE:I = 0x6f

.field protected static final EVENT_READ_BIG_BINARY_DONE:I = 0x77

.field protected static final EVENT_READ_BINARY_DONE:I = 0x5

.field protected static final EVENT_READ_ICON_DONE:I = 0xa

.field protected static final EVENT_READ_IMG_DONE:I = 0x9

.field protected static final EVENT_READ_IMG_RECORD_DONE:I = 0x71

.field protected static final EVENT_READ_RECORD_DONE:I = 0x7

.field protected static final EVENT_UPDATE_ADN_DONE:I = 0x75

.field protected static final GET_RESPONSE_EF_IMG_SIZE_BYTES:I = 0xa

.field protected static final GET_RESPONSE_EF_SIZE_BYTES:I = 0xf

.field protected static final MAX_SEC_SIM_DATA_STRING:I = 0xfd

.field protected static final READ_RECORD_MODE_ABSOLUTE:I = 0x4

.field protected static final RESPONSE_DATA_ACCESS_CONDITION_1:I = 0x8

.field protected static final RESPONSE_DATA_ACCESS_CONDITION_2:I = 0x9

.field protected static final RESPONSE_DATA_ACCESS_CONDITION_3:I = 0xa

.field protected static final RESPONSE_DATA_FILE_ID_1:I = 0x4

.field protected static final RESPONSE_DATA_FILE_ID_2:I = 0x5

.field protected static final RESPONSE_DATA_FILE_SIZE_1:I = 0x2

.field protected static final RESPONSE_DATA_FILE_SIZE_2:I = 0x3

.field protected static final RESPONSE_DATA_FILE_STATUS:I = 0xb

.field protected static final RESPONSE_DATA_FILE_TYPE:I = 0x6

.field protected static final RESPONSE_DATA_LENGTH:I = 0xc

.field protected static final RESPONSE_DATA_RECORD_LENGTH:I = 0xe

.field protected static final RESPONSE_DATA_RFU_1:I = 0x0

.field protected static final RESPONSE_DATA_RFU_2:I = 0x1

.field protected static final RESPONSE_DATA_RFU_3:I = 0x7

.field protected static final RESPONSE_DATA_STRUCTURE:I = 0xd

.field protected static final TYPE_DF:I = 0x2

.field protected static final TYPE_EF:I = 0x4

.field protected static final TYPE_MF:I = 0x1

.field protected static final TYPE_RFU:I


# instance fields
.field protected final mAid:Ljava/lang/String;

.field protected final mCi:Lcom/android/internal/telephony/CommandsInterface;

.field protected final mParentApp:Lcom/android/internal/telephony/uicc/UiccCardApplication;


# direct methods
.method protected constructor <init>(Lcom/android/internal/telephony/uicc/UiccCardApplication;Ljava/lang/String;Lcom/android/internal/telephony/CommandsInterface;)V
    .registers 4
    .parameter "app"
    .parameter "aid"
    .parameter "ci"

    .prologue
    .line 217
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 218
    iput-object p1, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mParentApp:Lcom/android/internal/telephony/uicc/UiccCardApplication;

    .line 219
    iput-object p2, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    .line 220
    iput-object p3, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    .line 221
    return-void
.end method

.method private processException(Landroid/os/Message;Landroid/os/AsyncResult;)Z
    .registers 8
    .parameter "response"
    .parameter "ar"

    .prologue
    const/4 v4, 0x0

    .line 467
    const/4 v0, 0x0

    .line 468
    .local v0, flag:Z
    iget-object v2, p2, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v2, Lcom/android/internal/telephony/uicc/IccIoResult;

    .line 469
    .local v2, result:Lcom/android/internal/telephony/uicc/IccIoResult;
    iget-object v3, p2, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_11

    .line 470
    iget-object v3, p2, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-direct {p0, p1, v4, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 471
    const/4 v0, 0x1

    .line 479
    :cond_10
    :goto_10
    return v0

    .line 473
    :cond_11
    invoke-virtual {v2}, Lcom/android/internal/telephony/uicc/IccIoResult;->getException()Lcom/android/internal/telephony/uicc/IccException;

    move-result-object v1

    .line 474
    .local v1, iccException:Lcom/android/internal/telephony/uicc/IccException;
    if-eqz v1, :cond_10

    .line 475
    invoke-direct {p0, p1, v4, v1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 476
    const/4 v0, 0x1

    goto :goto_10
.end method

.method private sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V
    .registers 4
    .parameter "response"
    .parameter "result"
    .parameter "ex"

    .prologue
    .line 456
    if-nez p1, :cond_3

    .line 463
    :goto_2
    return-void

    .line 460
    :cond_3
    invoke-static {p1, p2, p3}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 462
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    goto :goto_2
.end method


# virtual methods
.method public dispose()V
    .registers 1

    .prologue
    .line 224
    return-void
.end method

.method public getAdnLikesRecordInfo(ILandroid/os/Message;)V
    .registers 5
    .parameter "fileid"
    .parameter "onLoaded"

    .prologue
    .line 1195
    const/16 v1, 0x73

    invoke-virtual {p0, v1, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 1198
    .local v0, response:Landroid/os/Message;
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v1, p1, v0}, Lcom/android/internal/telephony/CommandsInterface;->getPhoneBookStorageInfo(ILandroid/os/Message;)V

    .line 1199
    return-void
.end method

.method public getAdnLikesSimStatusInfo(ILandroid/os/Message;)V
    .registers 14
    .parameter "efid"
    .parameter "onLoaded"

    .prologue
    const/4 v7, 0x0

    const/4 v4, 0x0

    .line 1214
    const/16 v0, 0x74

    invoke-virtual {p0, v0, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    .line 1216
    .local v10, response:Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xc0

    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0xf

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move v5, v4

    move-object v8, v7

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 1218
    return-void
.end method

.method protected getCommonIccEFPath(I)Ljava/lang/String;
    .registers 4
    .parameter "efid"

    .prologue
    .line 1100
    sparse-switch p1, :sswitch_data_2e

    .line 1160
    const/4 v0, 0x0

    :goto_4
    return-object v0

    .line 1112
    :sswitch_5
    const-string v0, "3F007F10"

    goto :goto_4

    .line 1119
    :sswitch_8
    const-string v0, "3F00"

    goto :goto_4

    .line 1122
    :sswitch_b
    const-string v0, "3F007F105F3A"

    goto :goto_4

    .line 1124
    :sswitch_e
    const-string v0, "3F007F105F50"

    goto :goto_4

    .line 1127
    :sswitch_11
    const-string v0, "3F007FFF"

    goto :goto_4

    .line 1142
    :sswitch_14
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mParentApp:Lcom/android/internal/telephony/uicc/UiccCardApplication;

    if-eqz v0, :cond_24

    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mParentApp:Lcom/android/internal/telephony/uicc/UiccCardApplication;

    invoke-virtual {v0}, Lcom/android/internal/telephony/uicc/UiccCardApplication;->getIntType()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_24

    .line 1143
    const-string v0, "3F007F20"

    goto :goto_4

    .line 1145
    :cond_24
    const-string v0, "3F007FFF"

    goto :goto_4

    .line 1148
    :sswitch_27
    const-string v0, "3F007FFF5F1F"

    goto :goto_4

    .line 1157
    :sswitch_2a
    const-string v0, "3F00"

    goto :goto_4

    .line 1100
    nop

    :sswitch_data_2e
    .sparse-switch
        0x2f05 -> :sswitch_8
        0x2f30 -> :sswitch_2a
        0x2f40 -> :sswitch_2a
        0x2f41 -> :sswitch_2a
        0x2f42 -> :sswitch_2a
        0x2f43 -> :sswitch_2a
        0x2f50 -> :sswitch_2a
        0x2fe2 -> :sswitch_8
        0x2fe7 -> :sswitch_8
        0x4f1c -> :sswitch_27
        0x4f20 -> :sswitch_e
        0x4f30 -> :sswitch_b
        0x6f3a -> :sswitch_5
        0x6f3b -> :sswitch_5
        0x6f3e -> :sswitch_11
        0x6f40 -> :sswitch_5
        0x6f49 -> :sswitch_5
        0x6f4a -> :sswitch_5
        0x6f4b -> :sswitch_5
        0x6f4c -> :sswitch_5
        0x6f4e -> :sswitch_5
        0x6f60 -> :sswitch_14
        0x6f61 -> :sswitch_14
        0x6f73 -> :sswitch_14
        0x6f7b -> :sswitch_14
        0x6f7e -> :sswitch_14
        0x6fb7 -> :sswitch_14
        0x6fe3 -> :sswitch_14
        0x6fe5 -> :sswitch_5
    .end sparse-switch
.end method

.method public getEFLinearRecordSize(ILandroid/os/Message;)V
    .registers 14
    .parameter "fileid"
    .parameter "onLoaded"

    .prologue
    const/4 v7, 0x0

    const/4 v4, 0x0

    .line 299
    const/16 v0, 0x8

    new-instance v1, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    invoke-direct {v1, p1, p2}, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;-><init>(ILandroid/os/Message;)V

    invoke-virtual {p0, v0, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    .line 302
    .local v10, response:Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xc0

    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0xf

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move v5, v4

    move-object v8, v7

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 304
    return-void
.end method

.method protected abstract getEFPath(I)Ljava/lang/String;
.end method

.method public getSimSlot()I
    .registers 2

    .prologue
    .line 1222
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mParentApp:Lcom/android/internal/telephony/uicc/UiccCardApplication;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mParentApp:Lcom/android/internal/telephony/uicc/UiccCardApplication;

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccCardApplication;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    if-eqz v0, :cond_13

    .line 1223
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mParentApp:Lcom/android/internal/telephony/uicc/UiccCardApplication;

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccCardApplication;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v0

    .line 1225
    :goto_12
    return v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method public getUsimPBCapa(Landroid/os/Message;)V
    .registers 4
    .parameter "onLoaded"

    .prologue
    .line 1207
    const/16 v1, 0x72

    invoke-virtual {p0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 1209
    .local v0, response:Landroid/os/Message;
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v1, v0}, Lcom/android/internal/telephony/CommandsInterface;->getUsimPBCapa(Landroid/os/Message;)V

    .line 1210
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .registers 56
    .parameter "msg"

    .prologue
    .line 492
    const/16 v46, 0x0

    .line 513
    .local v46, response:Landroid/os/Message;
    :try_start_2
    move-object/from16 v0, p1

    iget v3, v0, Landroid/os/Message;->what:I

    sparse-switch v3, :sswitch_data_b0e

    .line 1087
    :cond_9
    :goto_9
    return-void

    .line 515
    :sswitch_a
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Landroid/os/AsyncResult;

    .line 516
    .local v34, ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object/from16 v42, v0

    check-cast v42, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    .line 517
    .local v42, lc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v47, v0

    check-cast v47, Lcom/android/internal/telephony/uicc/IccIoResult;

    .line 518
    .local v47, result:Lcom/android/internal/telephony/uicc/IccIoResult;
    move-object/from16 v0, v42

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mOnLoaded:Landroid/os/Message;

    move-object/from16 v46, v0

    .line 520
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->processException(Landroid/os/Message;Landroid/os/AsyncResult;)Z

    move-result v3

    if-nez v3, :cond_9

    .line 524
    move-object/from16 v0, v47

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    move-object/from16 v36, v0

    .line 526
    .local v36, data:[B
    const/4 v3, 0x4

    const/4 v4, 0x6

    aget-byte v4, v36, v4

    if-ne v3, v4, :cond_4b

    const/4 v3, 0x1

    const/16 v4, 0xd

    aget-byte v4, v36, v4

    if-eq v3, v4, :cond_5f

    .line 528
    :cond_4b
    new-instance v3, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;-><init>()V

    throw v3
    :try_end_51
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_51} :catch_51

    .line 1080
    .end local v34           #ar:Landroid/os/AsyncResult;
    .end local v36           #data:[B
    .end local v42           #lc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    .end local v47           #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    :catch_51
    move-exception v37

    .line 1081
    .local v37, exc:Ljava/lang/Exception;
    if-eqz v46, :cond_af1

    .line 1082
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move-object/from16 v2, v37

    invoke-direct {v0, v1, v3, v2}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto :goto_9

    .line 531
    .end local v37           #exc:Ljava/lang/Exception;
    .restart local v34       #ar:Landroid/os/AsyncResult;
    .restart local v36       #data:[B
    .restart local v42       #lc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    .restart local v47       #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    :cond_5f
    const/4 v3, 0x3

    :try_start_60
    new-array v0, v3, [I

    move-object/from16 v45, v0

    .line 532
    .local v45, recordSize:[I
    const/4 v3, 0x0

    const/16 v4, 0xe

    aget-byte v4, v36, v4

    and-int/lit16 v4, v4, 0xff

    aput v4, v45, v3

    .line 533
    const/4 v3, 0x1

    const/4 v4, 0x2

    aget-byte v4, v36, v4

    and-int/lit16 v4, v4, 0xff

    shl-int/lit8 v4, v4, 0x8

    const/4 v6, 0x3

    aget-byte v6, v36, v6

    and-int/lit16 v6, v6, 0xff

    add-int/2addr v4, v6

    aput v4, v45, v3

    .line 535
    const/4 v3, 0x2

    const/4 v4, 0x1

    aget v4, v45, v4

    const/4 v6, 0x0

    aget v6, v45, v6

    div-int/2addr v4, v6

    aput v4, v45, v3

    .line 537
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move-object/from16 v2, v45

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 543
    .end local v34           #ar:Landroid/os/AsyncResult;
    .end local v36           #data:[B
    .end local v42           #lc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    .end local v45           #recordSize:[I
    .end local v47           #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    :sswitch_93
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Landroid/os/AsyncResult;

    .line 544
    .restart local v34       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object/from16 v42, v0

    check-cast v42, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    .line 545
    .restart local v42       #lc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v47, v0

    check-cast v47, Lcom/android/internal/telephony/uicc/IccIoResult;

    .line 546
    .restart local v47       #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    move-object/from16 v0, v42

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mOnLoaded:Landroid/os/Message;

    move-object/from16 v46, v0

    .line 548
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->processException(Landroid/os/Message;Landroid/os/AsyncResult;)Z

    move-result v3

    if-nez v3, :cond_9

    .line 552
    move-object/from16 v0, v47

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    move-object/from16 v36, v0

    .line 554
    .restart local v36       #data:[B
    move-object/from16 v0, v42

    iget v5, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mEfid:I

    .line 555
    .local v5, fileid:I
    move-object/from16 v0, v42

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordNum:I

    move/from16 v44, v0

    .line 558
    .local v44, recordNum:I
    const/4 v3, 0x4

    const/4 v4, 0x6

    aget-byte v4, v36, v4

    if-eq v3, v4, :cond_dd

    .line 559
    new-instance v3, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;-><init>()V

    throw v3

    .line 563
    :cond_dd
    const/4 v3, 0x1

    const/16 v4, 0xd

    aget-byte v4, v36, v4

    if-eq v3, v4, :cond_f1

    const/4 v3, 0x3

    const/16 v4, 0xd

    aget-byte v4, v36, v4

    if-eq v3, v4, :cond_f1

    .line 565
    new-instance v3, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;-><init>()V

    throw v3

    .line 568
    :cond_f1
    const/16 v3, 0xe

    aget-byte v3, v36, v3

    and-int/lit16 v3, v3, 0xff

    move-object/from16 v0, v42

    iput v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordSize:I

    .line 570
    const/4 v3, 0x2

    aget-byte v3, v36, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    const/4 v4, 0x3

    aget-byte v4, v36, v4

    and-int/lit16 v4, v4, 0xff

    add-int v9, v3, v4

    .line 573
    .local v9, size:I
    move-object/from16 v0, v42

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordSize:I

    div-int v3, v9, v3

    move-object/from16 v0, v42

    iput v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mCountRecords:I

    .line 575
    move-object/from16 v0, v42

    iget-boolean v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mLoadAll:Z

    if-eqz v3, :cond_126

    .line 576
    new-instance v3, Ljava/util/ArrayList;

    move-object/from16 v0, v42

    iget v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mCountRecords:I

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    move-object/from16 v0, v42

    iput-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->results:Ljava/util/ArrayList;

    .line 579
    :cond_126
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v4, 0xb2

    move-object/from16 v0, v42

    iget v5, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mEfid:I

    .end local v5           #fileid:I
    move-object/from16 v0, v42

    iget v6, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mEfid:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v42

    iget v7, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordNum:I

    const/4 v8, 0x4

    move-object/from16 v0, v42

    iget v9, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordSize:I

    .end local v9           #size:I
    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    const/4 v13, 0x7

    move-object/from16 v0, p0

    move-object/from16 v1, v42

    invoke-virtual {v0, v13, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v13

    invoke-interface/range {v3 .. v13}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    goto/16 :goto_9

    .line 586
    .end local v34           #ar:Landroid/os/AsyncResult;
    .end local v36           #data:[B
    .end local v42           #lc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    .end local v44           #recordNum:I
    .end local v47           #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    :sswitch_157
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Landroid/os/AsyncResult;

    .line 587
    .restart local v34       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object v0, v3

    check-cast v0, Landroid/os/Message;

    move-object/from16 v46, v0

    .line 588
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v47, v0

    check-cast v47, Lcom/android/internal/telephony/uicc/IccIoResult;

    .line 590
    .restart local v47       #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->processException(Landroid/os/Message;Landroid/os/AsyncResult;)Z

    move-result v3

    if-nez v3, :cond_9

    .line 594
    move-object/from16 v0, v47

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    move-object/from16 v36, v0

    .line 596
    .restart local v36       #data:[B
    move-object/from16 v0, p1

    iget v5, v0, Landroid/os/Message;->arg1:I

    .line 598
    .restart local v5       #fileid:I
    const/4 v3, 0x4

    const/4 v4, 0x6

    aget-byte v4, v36, v4

    if-eq v3, v4, :cond_196

    .line 599
    new-instance v3, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;-><init>()V

    throw v3

    .line 602
    :cond_196
    const/16 v3, 0xd

    aget-byte v3, v36, v3

    if-eqz v3, :cond_1a2

    .line 603
    new-instance v3, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;-><init>()V

    throw v3

    .line 606
    :cond_1a2
    const/4 v3, 0x2

    aget-byte v3, v36, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    const/4 v4, 0x3

    aget-byte v4, v36, v4

    and-int/lit16 v4, v4, 0xff

    add-int v9, v3, v4

    .line 609
    .restart local v9       #size:I
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v4, 0xb0

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    const/4 v13, 0x5

    const/16 v17, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v17

    move-object/from16 v2, v46

    invoke-virtual {v0, v13, v5, v1, v2}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v13

    invoke-interface/range {v3 .. v13}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    goto/16 :goto_9

    .line 619
    .end local v5           #fileid:I
    .end local v9           #size:I
    .end local v34           #ar:Landroid/os/AsyncResult;
    .end local v36           #data:[B
    .end local v47           #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    :sswitch_1d6
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Landroid/os/AsyncResult;

    .line 620
    .restart local v34       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object/from16 v42, v0

    check-cast v42, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    .line 621
    .restart local v42       #lc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v47, v0

    check-cast v47, Lcom/android/internal/telephony/uicc/IccIoResult;

    .line 622
    .restart local v47       #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    move-object/from16 v0, v42

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mOnLoaded:Landroid/os/Message;

    move-object/from16 v46, v0

    .line 624
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->processException(Landroid/os/Message;Landroid/os/AsyncResult;)Z

    move-result v3

    if-nez v3, :cond_9

    .line 628
    move-object/from16 v0, v42

    iget-boolean v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mLoadAll:Z

    if-nez v3, :cond_218

    .line 629
    move-object/from16 v0, v47

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 631
    :cond_218
    move-object/from16 v0, v42

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->results:Ljava/util/ArrayList;

    move-object/from16 v0, v47

    iget-object v4, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 633
    move-object/from16 v0, v42

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordNum:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, v42

    iput v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordNum:I

    .line 635
    move-object/from16 v0, v42

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordNum:I

    move-object/from16 v0, v42

    iget v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mCountRecords:I

    if-le v3, v4, :cond_245

    .line 636
    move-object/from16 v0, v42

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->results:Ljava/util/ArrayList;

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 638
    :cond_245
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v11, 0xb2

    move-object/from16 v0, v42

    iget v12, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mEfid:I

    move-object/from16 v0, v42

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mEfid:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, v42

    iget v14, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordNum:I

    const/4 v15, 0x4

    move-object/from16 v0, v42

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordSize:I

    move/from16 v16, v0

    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move-object/from16 v19, v0

    const/4 v3, 0x7

    move-object/from16 v0, p0

    move-object/from16 v1, v42

    invoke-virtual {v0, v3, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v20

    invoke-interface/range {v10 .. v20}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    goto/16 :goto_9

    .line 652
    .end local v34           #ar:Landroid/os/AsyncResult;
    .end local v42           #lc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    .end local v47           #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    :sswitch_27c
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Landroid/os/AsyncResult;

    .line 653
    .restart local v34       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object v0, v3

    check-cast v0, Landroid/os/Message;

    move-object/from16 v46, v0

    .line 654
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v47, v0

    check-cast v47, Lcom/android/internal/telephony/uicc/IccIoResult;

    .line 656
    .restart local v47       #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    move-object/from16 v0, p1

    iget-object v3, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->processException(Landroid/os/Message;Landroid/os/AsyncResult;)Z

    move-result v3

    if-nez v3, :cond_9

    .line 660
    move-object/from16 v0, v47

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 664
    .end local v34           #ar:Landroid/os/AsyncResult;
    .end local v47           #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    :sswitch_2b3
    const-string v3, "IccFileHandler: get record size img done"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->logd(Ljava/lang/String;)V

    .line 665
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Landroid/os/AsyncResult;

    .line 666
    .restart local v34       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object/from16 v42, v0

    check-cast v42, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    .line 667
    .restart local v42       #lc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v47, v0

    check-cast v47, Lcom/android/internal/telephony/uicc/IccIoResult;

    .line 668
    .restart local v47       #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    move-object/from16 v0, v42

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mOnLoaded:Landroid/os/Message;

    move-object/from16 v46, v0

    .line 670
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_2ec

    .line 671
    const/4 v3, 0x0

    move-object/from16 v0, v34

    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 675
    :cond_2ec
    invoke-virtual/range {v47 .. v47}, Lcom/android/internal/telephony/uicc/IccIoResult;->getException()Lcom/android/internal/telephony/uicc/IccException;

    move-result-object v41

    .line 677
    .local v41, iccException:Lcom/android/internal/telephony/uicc/IccException;
    if-eqz v41, :cond_2fe

    .line 678
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move-object/from16 v2, v41

    invoke-direct {v0, v1, v3, v2}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 682
    :cond_2fe
    move-object/from16 v0, v47

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    move-object/from16 v36, v0

    .line 683
    .restart local v36       #data:[B
    const/16 v3, 0xe

    aget-byte v3, v36, v3

    and-int/lit16 v3, v3, 0xff

    move-object/from16 v0, v42

    iput v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordSize:I

    .line 685
    const/4 v3, 0x4

    const/4 v4, 0x6

    aget-byte v4, v36, v4

    if-ne v3, v4, :cond_31b

    const/4 v3, 0x1

    const/16 v4, 0xd

    aget-byte v4, v36, v4

    if-eq v3, v4, :cond_328

    .line 687
    :cond_31b
    const-string v3, "IccFileHandler: File type mismatch: Throw Exception"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->loge(Ljava/lang/String;)V

    .line 688
    new-instance v3, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;-><init>()V

    throw v3

    .line 691
    :cond_328
    const-string v3, "IccFileHandler: read EF IMG"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->logd(Ljava/lang/String;)V

    .line 692
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v11, 0xb2

    move-object/from16 v0, v42

    iget v12, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mEfid:I

    move-object/from16 v0, v42

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mEfid:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, v42

    iget v14, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordNum:I

    const/4 v15, 0x4

    move-object/from16 v0, v42

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordSize:I

    move/from16 v16, v0

    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move-object/from16 v19, v0

    const/16 v3, 0x9

    move-object/from16 v0, p0

    move-object/from16 v1, v42

    invoke-virtual {v0, v3, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v20

    invoke-interface/range {v10 .. v20}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    goto/16 :goto_9

    .line 700
    .end local v34           #ar:Landroid/os/AsyncResult;
    .end local v36           #data:[B
    .end local v41           #iccException:Lcom/android/internal/telephony/uicc/IccException;
    .end local v42           #lc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    .end local v47           #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    :sswitch_367
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Landroid/os/AsyncResult;

    .line 701
    .restart local v34       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object/from16 v42, v0

    check-cast v42, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    .line 702
    .restart local v42       #lc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v47, v0

    check-cast v47, Lcom/android/internal/telephony/uicc/IccIoResult;

    .line 703
    .restart local v47       #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    move-object/from16 v0, v42

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mOnLoaded:Landroid/os/Message;

    move-object/from16 v46, v0

    .line 705
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_399

    .line 706
    const/4 v3, 0x0

    move-object/from16 v0, v34

    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 710
    :cond_399
    invoke-virtual/range {v47 .. v47}, Lcom/android/internal/telephony/uicc/IccIoResult;->getException()Lcom/android/internal/telephony/uicc/IccException;

    move-result-object v41

    .line 711
    .restart local v41       #iccException:Lcom/android/internal/telephony/uicc/IccException;
    if-eqz v41, :cond_3ab

    .line 712
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move-object/from16 v2, v41

    invoke-direct {v0, v1, v3, v2}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 716
    :cond_3ab
    move-object/from16 v0, v47

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 719
    .end local v34           #ar:Landroid/os/AsyncResult;
    .end local v41           #iccException:Lcom/android/internal/telephony/uicc/IccException;
    .end local v42           #lc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    .end local v47           #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    :sswitch_3b9
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Landroid/os/AsyncResult;

    .line 720
    .restart local v34       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object v0, v3

    check-cast v0, Landroid/os/Message;

    move-object/from16 v46, v0

    .line 721
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v47, v0

    check-cast v47, Lcom/android/internal/telephony/uicc/IccIoResult;

    .line 723
    .restart local v47       #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_3e6

    .line 724
    const/4 v3, 0x0

    move-object/from16 v0, v34

    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 728
    :cond_3e6
    invoke-virtual/range {v47 .. v47}, Lcom/android/internal/telephony/uicc/IccIoResult;->getException()Lcom/android/internal/telephony/uicc/IccException;

    move-result-object v41

    .line 729
    .restart local v41       #iccException:Lcom/android/internal/telephony/uicc/IccException;
    if-eqz v41, :cond_3f8

    .line 730
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move-object/from16 v2, v41

    invoke-direct {v0, v1, v3, v2}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 734
    :cond_3f8
    move-object/from16 v0, v47

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 740
    .end local v34           #ar:Landroid/os/AsyncResult;
    .end local v41           #iccException:Lcom/android/internal/telephony/uicc/IccException;
    .end local v47           #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    :sswitch_406
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Landroid/os/AsyncResult;

    .line 741
    .restart local v34       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object/from16 v50, v0

    check-cast v50, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;

    .line 742
    .local v50, tc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v47, v0

    check-cast v47, Lcom/android/internal/telephony/uicc/IccIoResult;

    .line 743
    .restart local v47       #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    move-object/from16 v0, v50

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mOnLoaded:Landroid/os/Message;

    move-object/from16 v46, v0

    .line 745
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_438

    .line 746
    const/4 v3, 0x0

    move-object/from16 v0, v34

    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 750
    :cond_438
    invoke-virtual/range {v47 .. v47}, Lcom/android/internal/telephony/uicc/IccIoResult;->getException()Lcom/android/internal/telephony/uicc/IccException;

    move-result-object v41

    .line 752
    .restart local v41       #iccException:Lcom/android/internal/telephony/uicc/IccException;
    if-eqz v41, :cond_44a

    .line 753
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move-object/from16 v2, v41

    invoke-direct {v0, v1, v3, v2}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 757
    :cond_44a
    move-object/from16 v0, v47

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    move-object/from16 v36, v0

    .line 758
    .restart local v36       #data:[B
    move-object/from16 v0, v50

    iget v5, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mEfid:I

    .line 760
    .restart local v5       #fileid:I
    const/4 v3, 0x4

    const/4 v4, 0x6

    aget-byte v4, v36, v4

    if-eq v3, v4, :cond_460

    .line 761
    new-instance v3, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;-><init>()V

    throw v3

    .line 764
    :cond_460
    const/16 v3, 0xd

    aget-byte v3, v36, v3

    if-eqz v3, :cond_46c

    .line 765
    new-instance v3, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;-><init>()V

    throw v3

    .line 769
    :cond_46c
    const/4 v3, 0x2

    aget-byte v3, v36, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    const/4 v4, 0x3

    aget-byte v4, v36, v4

    and-int/lit16 v4, v4, 0xff

    add-int v9, v3, v4

    .line 774
    .restart local v9       #size:I
    const/4 v3, 0x0

    move-object/from16 v0, v50

    iput v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mPhaseNum:I

    .line 775
    move-object/from16 v0, v50

    iput v9, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mBinSize:I

    .line 776
    div-int/lit16 v3, v9, 0xfd

    move-object/from16 v0, v50

    iput v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mCountPhases:I

    .line 777
    const/16 v3, 0xfd

    if-le v9, v3, :cond_4cf

    const/4 v3, 0x1

    :goto_48e
    move-object/from16 v0, v50

    iput-boolean v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mLoadAll:Z

    .line 778
    new-instance v3, Ljava/util/ArrayList;

    move-object/from16 v0, v50

    iget v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mCountPhases:I

    add-int/lit8 v4, v4, 0x1

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    move-object/from16 v0, v50

    iput-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->results:Ljava/util/ArrayList;

    .line 779
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v11, 0xb0

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v3, 0xfd

    if-le v9, v3, :cond_4d1

    const/16 v16, 0xfd

    :goto_4b5
    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move-object/from16 v19, v0

    const/16 v3, 0x77

    move-object/from16 v0, p0

    move-object/from16 v1, v50

    invoke-virtual {v0, v3, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v20

    move v12, v5

    invoke-interface/range {v10 .. v20}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    goto/16 :goto_9

    .line 777
    :cond_4cf
    const/4 v3, 0x0

    goto :goto_48e

    :cond_4d1
    move/from16 v16, v9

    .line 779
    goto :goto_4b5

    .line 790
    .end local v5           #fileid:I
    .end local v9           #size:I
    .end local v34           #ar:Landroid/os/AsyncResult;
    .end local v36           #data:[B
    .end local v41           #iccException:Lcom/android/internal/telephony/uicc/IccException;
    .end local v47           #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    .end local v50           #tc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;
    :sswitch_4d4
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Landroid/os/AsyncResult;

    .line 791
    .restart local v34       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object/from16 v50, v0

    check-cast v50, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;

    .line 792
    .restart local v50       #tc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v47, v0

    check-cast v47, Lcom/android/internal/telephony/uicc/IccIoResult;

    .line 793
    .restart local v47       #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    move-object/from16 v0, v50

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mOnLoaded:Landroid/os/Message;

    move-object/from16 v46, v0

    .line 795
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_506

    .line 796
    const/4 v3, 0x0

    move-object/from16 v0, v34

    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 800
    :cond_506
    invoke-virtual/range {v47 .. v47}, Lcom/android/internal/telephony/uicc/IccIoResult;->getException()Lcom/android/internal/telephony/uicc/IccException;

    move-result-object v41

    .line 802
    .restart local v41       #iccException:Lcom/android/internal/telephony/uicc/IccException;
    if-eqz v41, :cond_518

    .line 803
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move-object/from16 v2, v41

    invoke-direct {v0, v1, v3, v2}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 807
    :cond_518
    move-object/from16 v0, v50

    iget-boolean v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mLoadAll:Z

    if-nez v3, :cond_52c

    .line 808
    move-object/from16 v0, v47

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 810
    :cond_52c
    move-object/from16 v0, v50

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->results:Ljava/util/ArrayList;

    move-object/from16 v0, v47

    iget-object v4, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 811
    move-object/from16 v0, v50

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mPhaseNum:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, v50

    iput v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mPhaseNum:I

    .line 815
    move-object/from16 v0, v50

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mPhaseNum:I

    move-object/from16 v0, v50

    iget v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mCountPhases:I

    if-le v3, v4, :cond_58c

    .line 816
    move-object/from16 v0, v50

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mBinSize:I

    new-array v0, v3, [B

    move-object/from16 v48, v0

    .line 817
    .local v48, resultData:[B
    const/16 v40, 0x0

    .local v40, i:I
    :goto_555
    move-object/from16 v0, v50

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mPhaseNum:I

    move/from16 v0, v40

    if-ge v0, v3, :cond_580

    .line 818
    move-object/from16 v0, v50

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->results:Ljava/util/ArrayList;

    move/from16 v0, v40

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [B

    move-object v0, v3

    check-cast v0, [B

    move-object/from16 v51, v0

    .line 819
    .local v51, tempData:[B
    const/4 v3, 0x0

    move/from16 v0, v40

    mul-int/lit16 v4, v0, 0xfd

    move-object/from16 v0, v51

    array-length v6, v0

    move-object/from16 v0, v51

    move-object/from16 v1, v48

    invoke-static {v0, v3, v1, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 817
    add-int/lit8 v40, v40, 0x1

    goto :goto_555

    .line 822
    .end local v51           #tempData:[B
    :cond_580
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move-object/from16 v2, v48

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 824
    .end local v40           #i:I
    .end local v48           #resultData:[B
    :cond_58c
    move-object/from16 v0, v50

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mPhaseNum:I

    mul-int/lit16 v3, v3, 0xfd

    shr-int/lit8 v14, v3, 0x8

    .line 825
    .local v14, iccIoP1:I
    move-object/from16 v0, v50

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mPhaseNum:I

    mul-int/lit16 v3, v3, 0xfd

    and-int/lit16 v15, v3, 0xff

    .line 827
    .local v15, IccIoP2:I
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v11, 0xb0

    move-object/from16 v0, v50

    iget v12, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mEfid:I

    move-object/from16 v0, v50

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mEfid:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, v50

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mPhaseNum:I

    move-object/from16 v0, v50

    iget v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mCountPhases:I

    if-ge v3, v4, :cond_5d5

    const/16 v16, 0xfd

    :goto_5bc
    const/16 v17, 0x0

    const/16 v18, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move-object/from16 v19, v0

    const/16 v3, 0x77

    move-object/from16 v0, p0

    move-object/from16 v1, v50

    invoke-virtual {v0, v3, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v20

    invoke-interface/range {v10 .. v20}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    goto/16 :goto_9

    :cond_5d5
    move-object/from16 v0, v50

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mBinSize:I

    move-object/from16 v0, v50

    iget v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;->mPhaseNum:I

    mul-int/lit16 v4, v4, 0xfd

    sub-int v16, v3, v4

    goto :goto_5bc

    .line 841
    .end local v14           #iccIoP1:I
    .end local v15           #IccIoP2:I
    .end local v34           #ar:Landroid/os/AsyncResult;
    .end local v41           #iccException:Lcom/android/internal/telephony/uicc/IccException;
    .end local v47           #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    .end local v50           #tc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadTransparentContext;
    :sswitch_5e2
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Landroid/os/AsyncResult;

    .line 842
    .restart local v34       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object/from16 v42, v0

    check-cast v42, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    .line 843
    .restart local v42       #lc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v47, v0

    check-cast v47, Lcom/android/internal/telephony/uicc/IccIoResult;

    .line 844
    .restart local v47       #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    move-object/from16 v0, v42

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mOnLoaded:Landroid/os/Message;

    move-object/from16 v46, v0

    .line 846
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_614

    .line 847
    const/4 v3, 0x0

    move-object/from16 v0, v34

    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 851
    :cond_614
    invoke-virtual/range {v47 .. v47}, Lcom/android/internal/telephony/uicc/IccIoResult;->getException()Lcom/android/internal/telephony/uicc/IccException;

    move-result-object v41

    .line 853
    .restart local v41       #iccException:Lcom/android/internal/telephony/uicc/IccException;
    if-eqz v41, :cond_626

    .line 854
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move-object/from16 v2, v41

    invoke-direct {v0, v1, v3, v2}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 858
    :cond_626
    move-object/from16 v0, v47

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 863
    .end local v34           #ar:Landroid/os/AsyncResult;
    .end local v41           #iccException:Lcom/android/internal/telephony/uicc/IccException;
    .end local v42           #lc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    .end local v47           #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    :sswitch_634
    const/16 v52, 0x0

    .line 864
    .local v52, total:I
    const/16 v53, 0x0

    .line 865
    .local v53, used:I
    const/16 v39, 0x0

    .line 867
    .local v39, firstIndex:I
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Landroid/os/AsyncResult;

    .line 869
    .restart local v34       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_684

    .line 876
    :goto_648
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object/from16 v43, v0

    check-cast v43, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;

    .line 877
    .local v43, pblc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;
    move-object/from16 v0, v43

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mOnLoaded:Landroid/os/Message;

    move-object/from16 v46, v0

    .line 879
    move/from16 v0, v53

    move-object/from16 v1, v43

    iput v0, v1, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mUsedRecords:I

    .line 880
    move/from16 v0, v39

    move-object/from16 v1, v43

    iput v0, v1, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mRecordNum:I

    .line 882
    const/4 v3, 0x0

    move-object/from16 v0, v43

    iput v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mCountRecords:I

    .line 884
    if-nez v53, :cond_6a6

    .line 888
    new-instance v3, Ljava/util/ArrayList;

    move-object/from16 v0, v43

    iget v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mTotalRecords:I

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    move-object/from16 v0, v43

    iput-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->results:Ljava/util/ArrayList;

    .line 889
    move-object/from16 v0, v43

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->results:Ljava/util/ArrayList;

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 871
    .end local v43           #pblc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;
    :cond_684
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, [I

    check-cast v3, [I

    const/4 v4, 0x0

    aget v52, v3, v4

    .line 872
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, [I

    check-cast v3, [I

    const/4 v4, 0x1

    aget v53, v3, v4

    .line 873
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, [I

    check-cast v3, [I

    const/4 v4, 0x2

    aget v39, v3, v4

    goto :goto_648

    .line 893
    .restart local v43       #pblc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;
    :cond_6a6
    move-object/from16 v0, v43

    iget-boolean v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mLoadAll:Z

    if-eqz v3, :cond_6b9

    .line 894
    new-instance v3, Ljava/util/ArrayList;

    move-object/from16 v0, v43

    iget v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mTotalRecords:I

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    move-object/from16 v0, v43

    iput-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->results:Ljava/util/ArrayList;

    .line 897
    :cond_6b9
    move-object/from16 v0, v43

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mCountRecords:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, v43

    iput v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mCountRecords:I

    .line 898
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    move-object/from16 v16, v0

    const/16 v17, 0xb2

    move-object/from16 v0, v43

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mEfid:I

    move/from16 v18, v0

    move-object/from16 v0, v43

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mRecordNum:I

    move/from16 v19, v0

    const/16 v20, 0x0

    const/16 v3, 0x6f

    move-object/from16 v0, p0

    move-object/from16 v1, v43

    invoke-virtual {v0, v3, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v21

    invoke-interface/range {v16 .. v21}, Lcom/android/internal/telephony/CommandsInterface;->getPhoneBookEntry(IIILjava/lang/String;Landroid/os/Message;)V

    goto/16 :goto_9

    .line 903
    .end local v34           #ar:Landroid/os/AsyncResult;
    .end local v39           #firstIndex:I
    .end local v43           #pblc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;
    .end local v52           #total:I
    .end local v53           #used:I
    :sswitch_6e8
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Landroid/os/AsyncResult;

    .line 904
    .restart local v34       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object/from16 v43, v0

    check-cast v43, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;

    .line 906
    .restart local v43       #pblc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v49, v0

    check-cast v49, Lcom/android/internal/telephony/uicc/SimPBEntryResult;

    .line 907
    .local v49, resultPB:Lcom/android/internal/telephony/uicc/SimPBEntryResult;
    move-object/from16 v0, v43

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mOnLoaded:Landroid/os/Message;

    move-object/from16 v46, v0

    .line 909
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_71a

    .line 910
    const/4 v3, 0x0

    move-object/from16 v0, v34

    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 913
    :cond_71a
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "pblc EFID = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v43

    iget v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mEfid:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "record number = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v43

    iget v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mRecordNum:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "total record = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v43

    iget v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mTotalRecords:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "Used Record = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v43

    iget v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mUsedRecords:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "count record = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v43

    iget v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mCountRecords:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->logd(Ljava/lang/String;)V

    .line 915
    move-object/from16 v0, v43

    iget-boolean v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mLoadAll:Z

    if-nez v3, :cond_7d1

    .line 916
    const/4 v3, 0x1

    new-array v0, v3, [Ljava/lang/String;

    move-object/from16 v21, v0

    .line 917
    .local v21, emails:[Ljava/lang/String;
    const/4 v3, 0x0

    move-object/from16 v0, v49

    iget-object v4, v0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->alphaTags:[Ljava/lang/String;

    const/4 v6, 0x2

    aget-object v4, v4, v6

    aput-object v4, v21, v3

    .line 918
    new-instance v16, Lcom/android/internal/telephony/uicc/AdnRecord;

    move-object/from16 v0, v43

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mEfid:I

    move/from16 v17, v0

    move-object/from16 v0, v49

    iget v0, v0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->recordIndex:I

    move/from16 v18, v0

    move-object/from16 v0, v49

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->alphaTags:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v19, v3, v4

    move-object/from16 v0, v49

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->numbers:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v20, v3, v4

    move-object/from16 v0, v49

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->numbers:[Ljava/lang/String;

    const/4 v4, 0x1

    aget-object v22, v3, v4

    move-object/from16 v0, v49

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->numbers:[Ljava/lang/String;

    const/4 v4, 0x2

    aget-object v23, v3, v4

    move-object/from16 v0, v49

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->numbers:[Ljava/lang/String;

    const/4 v4, 0x3

    aget-object v24, v3, v4

    move-object/from16 v0, v49

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->numbers:[Ljava/lang/String;

    const/4 v4, 0x4

    aget-object v25, v3, v4

    move-object/from16 v0, v49

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->alphaTags:[Ljava/lang/String;

    const/4 v4, 0x1

    aget-object v26, v3, v4

    invoke-direct/range {v16 .. v26}, Lcom/android/internal/telephony/uicc/AdnRecord;-><init>(IILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 919
    .local v16, adn:Lcom/android/internal/telephony/uicc/AdnRecord;
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move-object/from16 v2, v16

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 921
    .end local v16           #adn:Lcom/android/internal/telephony/uicc/AdnRecord;
    .end local v21           #emails:[Ljava/lang/String;
    :cond_7d1
    const/4 v3, 0x1

    new-array v0, v3, [Ljava/lang/String;

    move-object/from16 v21, v0

    .line 922
    .restart local v21       #emails:[Ljava/lang/String;
    const/4 v3, 0x0

    move-object/from16 v0, v49

    iget-object v4, v0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->alphaTags:[Ljava/lang/String;

    const/4 v6, 0x2

    aget-object v4, v4, v6

    aput-object v4, v21, v3

    .line 923
    new-instance v16, Lcom/android/internal/telephony/uicc/AdnRecord;

    move-object/from16 v0, v43

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mEfid:I

    move/from16 v17, v0

    move-object/from16 v0, v49

    iget v0, v0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->recordIndex:I

    move/from16 v18, v0

    move-object/from16 v0, v49

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->alphaTags:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v19, v3, v4

    move-object/from16 v0, v49

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->numbers:[Ljava/lang/String;

    const/4 v4, 0x0

    aget-object v20, v3, v4

    move-object/from16 v0, v49

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->numbers:[Ljava/lang/String;

    const/4 v4, 0x1

    aget-object v22, v3, v4

    move-object/from16 v0, v49

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->numbers:[Ljava/lang/String;

    const/4 v4, 0x2

    aget-object v23, v3, v4

    move-object/from16 v0, v49

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->numbers:[Ljava/lang/String;

    const/4 v4, 0x3

    aget-object v24, v3, v4

    move-object/from16 v0, v49

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->numbers:[Ljava/lang/String;

    const/4 v4, 0x4

    aget-object v25, v3, v4

    move-object/from16 v0, v49

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->alphaTags:[Ljava/lang/String;

    const/4 v4, 0x1

    aget-object v26, v3, v4

    invoke-direct/range {v16 .. v26}, Lcom/android/internal/telephony/uicc/AdnRecord;-><init>(IILjava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 924
    .restart local v16       #adn:Lcom/android/internal/telephony/uicc/AdnRecord;
    move-object/from16 v0, v43

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->results:Ljava/util/ArrayList;

    move-object/from16 v0, v16

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 925
    move-object/from16 v0, v49

    iget v3, v0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->nextIndex:I

    move-object/from16 v0, v43

    iput v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mRecordNum:I

    .line 926
    move-object/from16 v0, v43

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mUsedRecords:I

    move-object/from16 v0, v43

    iget v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mCountRecords:I

    if-le v3, v4, :cond_85c

    move-object/from16 v0, v49

    iget v3, v0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->nextIndex:I

    const v4, 0xffff

    if-ne v3, v4, :cond_85c

    .line 928
    const-string v3, "Read ADN finished unexpected, Try again"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->logd(Ljava/lang/String;)V

    .line 929
    move-object/from16 v0, v43

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mEfid:I

    move-object/from16 v0, v43

    iget-object v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mOnLoaded:Landroid/os/Message;

    move-object/from16 v0, p0

    invoke-virtual {v0, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->loadItemInPhoneBookStorageAll(ILandroid/os/Message;)V

    goto/16 :goto_9

    .line 931
    :cond_85c
    move-object/from16 v0, v43

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mUsedRecords:I

    move-object/from16 v0, v43

    iget v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mCountRecords:I

    if-eq v3, v4, :cond_86f

    move-object/from16 v0, v49

    iget v3, v0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->nextIndex:I

    const v4, 0xffff

    if-ne v3, v4, :cond_87d

    .line 932
    :cond_86f
    move-object/from16 v0, v43

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->results:Ljava/util/ArrayList;

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 934
    :cond_87d
    move-object/from16 v0, v43

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mCountRecords:I

    add-int/lit8 v3, v3, 0x1

    move-object/from16 v0, v43

    iput v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mCountRecords:I

    .line 935
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    move-object/from16 v22, v0

    const/16 v23, 0xb2

    move-object/from16 v0, v43

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mEfid:I

    move/from16 v24, v0

    move-object/from16 v0, v43

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;->mRecordNum:I

    move/from16 v25, v0

    const/16 v26, 0x0

    const/16 v3, 0x6f

    move-object/from16 v0, p0

    move-object/from16 v1, v43

    invoke-virtual {v0, v3, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v27

    invoke-interface/range {v22 .. v27}, Lcom/android/internal/telephony/CommandsInterface;->getPhoneBookEntry(IIILjava/lang/String;Landroid/os/Message;)V

    goto/16 :goto_9

    .line 943
    .end local v16           #adn:Lcom/android/internal/telephony/uicc/AdnRecord;
    .end local v21           #emails:[Ljava/lang/String;
    .end local v34           #ar:Landroid/os/AsyncResult;
    .end local v43           #pblc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;
    .end local v49           #resultPB:Lcom/android/internal/telephony/uicc/SimPBEntryResult;
    :sswitch_8ac
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Landroid/os/AsyncResult;

    .line 944
    .restart local v34       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object/from16 v42, v0

    check-cast v42, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    .line 945
    .restart local v42       #lc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v47, v0

    check-cast v47, Lcom/android/internal/telephony/uicc/IccIoResult;

    .line 946
    .restart local v47       #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    move-object/from16 v0, v42

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mOnLoaded:Landroid/os/Message;

    move-object/from16 v46, v0

    .line 948
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_8de

    .line 949
    const/4 v3, 0x0

    move-object/from16 v0, v34

    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 953
    :cond_8de
    invoke-virtual/range {v47 .. v47}, Lcom/android/internal/telephony/uicc/IccIoResult;->getException()Lcom/android/internal/telephony/uicc/IccException;

    move-result-object v41

    .line 955
    .restart local v41       #iccException:Lcom/android/internal/telephony/uicc/IccException;
    if-eqz v41, :cond_8f0

    .line 956
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move-object/from16 v2, v41

    invoke-direct {v0, v1, v3, v2}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 960
    :cond_8f0
    move-object/from16 v0, v47

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    move-object/from16 v36, v0

    .line 961
    .restart local v36       #data:[B
    move-object/from16 v0, v42

    iget v5, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mEfid:I

    .line 962
    .restart local v5       #fileid:I
    move-object/from16 v0, v42

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordNum:I

    move/from16 v44, v0

    .line 964
    .restart local v44       #recordNum:I
    const/4 v3, 0x4

    const/4 v4, 0x6

    aget-byte v4, v36, v4

    if-eq v3, v4, :cond_90c

    .line 965
    new-instance v3, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;-><init>()V

    throw v3

    .line 968
    :cond_90c
    const/4 v3, 0x1

    const/16 v4, 0xd

    aget-byte v4, v36, v4

    if-eq v3, v4, :cond_919

    .line 969
    new-instance v3, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;-><init>()V

    throw v3

    .line 972
    :cond_919
    const/16 v3, 0xe

    aget-byte v3, v36, v3

    and-int/lit16 v3, v3, 0xff

    move-object/from16 v0, v42

    iput v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordSize:I

    .line 974
    const/4 v3, 0x2

    aget-byte v3, v36, v3

    and-int/lit16 v3, v3, 0xff

    shl-int/lit8 v3, v3, 0x8

    const/4 v4, 0x3

    aget-byte v4, v36, v4

    and-int/lit16 v4, v4, 0xff

    add-int v9, v3, v4

    .line 977
    .restart local v9       #size:I
    move-object/from16 v0, v42

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordSize:I

    div-int v3, v9, v3

    move-object/from16 v0, v42

    iput v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mCountRecords:I

    .line 979
    move-object/from16 v0, v42

    iget-boolean v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mLoadAll:Z

    if-eqz v3, :cond_94e

    .line 980
    new-instance v3, Ljava/util/ArrayList;

    move-object/from16 v0, v42

    iget v4, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mCountRecords:I

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    move-object/from16 v0, v42

    iput-object v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->results:Ljava/util/ArrayList;

    .line 983
    :cond_94e
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    move-object/from16 v22, v0

    const/16 v23, 0xb2

    move-object/from16 v0, v42

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mEfid:I

    move/from16 v24, v0

    move-object/from16 v0, v42

    iget v3, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mEfid:I

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v42

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordNum:I

    move/from16 v26, v0

    const/16 v27, 0x4

    move-object/from16 v0, v42

    iget v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mRecordSize:I

    move/from16 v28, v0

    const/16 v29, 0x0

    const/16 v30, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move-object/from16 v31, v0

    const/16 v3, 0x71

    move-object/from16 v0, p0

    move-object/from16 v1, v42

    invoke-virtual {v0, v3, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v32

    invoke-interface/range {v22 .. v32}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    goto/16 :goto_9

    .line 992
    .end local v5           #fileid:I
    .end local v9           #size:I
    .end local v34           #ar:Landroid/os/AsyncResult;
    .end local v36           #data:[B
    .end local v41           #iccException:Lcom/android/internal/telephony/uicc/IccException;
    .end local v42           #lc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    .end local v44           #recordNum:I
    .end local v47           #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    :sswitch_98d
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Landroid/os/AsyncResult;

    .line 993
    .restart local v34       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object v0, v3

    check-cast v0, Landroid/os/Message;

    move-object/from16 v46, v0

    .line 995
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_9b2

    .line 996
    const/4 v3, 0x0

    move-object/from16 v0, v34

    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 1000
    :cond_9b2
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, [I

    move-object v0, v3

    check-cast v0, [I

    move-object/from16 v35, v0

    .line 1001
    .local v35, capaResult:[I
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move-object/from16 v2, v35

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 1006
    .end local v34           #ar:Landroid/os/AsyncResult;
    .end local v35           #capaResult:[I
    :sswitch_9c9
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Landroid/os/AsyncResult;

    .line 1007
    .restart local v34       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object v0, v3

    check-cast v0, Landroid/os/Message;

    move-object/from16 v46, v0

    .line 1008
    const/4 v3, 0x1

    new-array v0, v3, [I

    move-object/from16 v38, v0

    .line 1009
    .local v38, fileStatus:[I
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_9f3

    .line 1010
    const/4 v3, 0x0

    move-object/from16 v0, v34

    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 1014
    :cond_9f3
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v47, v0

    check-cast v47, Lcom/android/internal/telephony/uicc/IccIoResult;

    .line 1016
    .restart local v47       #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_a0f

    .line 1017
    const/4 v3, 0x0

    move-object/from16 v0, v34

    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 1021
    :cond_a0f
    invoke-virtual/range {v47 .. v47}, Lcom/android/internal/telephony/uicc/IccIoResult;->getException()Lcom/android/internal/telephony/uicc/IccException;

    move-result-object v41

    .line 1023
    .restart local v41       #iccException:Lcom/android/internal/telephony/uicc/IccException;
    if-eqz v41, :cond_a21

    .line 1024
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move-object/from16 v2, v41

    invoke-direct {v0, v1, v3, v2}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 1028
    :cond_a21
    move-object/from16 v0, v47

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    move-object/from16 v36, v0

    .line 1030
    .restart local v36       #data:[B
    const/4 v3, 0x4

    const/4 v4, 0x6

    aget-byte v4, v36, v4

    if-eq v3, v4, :cond_a33

    .line 1031
    new-instance v3, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;-><init>()V

    throw v3

    .line 1034
    :cond_a33
    const/4 v3, 0x1

    const/16 v4, 0xd

    aget-byte v4, v36, v4

    if-eq v3, v4, :cond_a47

    const/4 v3, 0x3

    const/16 v4, 0xd

    aget-byte v4, v36, v4

    if-eq v3, v4, :cond_a47

    .line 1035
    new-instance v3, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccFileTypeMismatch;-><init>()V

    throw v3

    .line 1037
    :cond_a47
    const/4 v3, 0x0

    const/16 v4, 0xb

    aget-byte v4, v36, v4

    and-int/lit16 v4, v4, 0xff

    aput v4, v38, v3

    .line 1038
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move-object/from16 v2, v38

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 1043
    .end local v34           #ar:Landroid/os/AsyncResult;
    .end local v36           #data:[B
    .end local v38           #fileStatus:[I
    .end local v41           #iccException:Lcom/android/internal/telephony/uicc/IccException;
    .end local v47           #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    :sswitch_a5c
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Landroid/os/AsyncResult;

    .line 1044
    .restart local v34       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object v0, v3

    check-cast v0, Landroid/os/Message;

    move-object/from16 v46, v0

    .line 1046
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_a81

    .line 1047
    const/4 v3, 0x0

    move-object/from16 v0, v34

    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 1051
    :cond_a81
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, [I

    move-object v0, v3

    check-cast v0, [I

    move-object/from16 v33, v0

    .line 1052
    .local v33, RecordInfo:[I
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move-object/from16 v2, v33

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 1058
    .end local v33           #RecordInfo:[I
    .end local v34           #ar:Landroid/os/AsyncResult;
    :sswitch_a98
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    move-object/from16 v34, v0

    check-cast v34, Landroid/os/AsyncResult;

    .line 1059
    .restart local v34       #ar:Landroid/os/AsyncResult;
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object/from16 v42, v0

    check-cast v42, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    .line 1060
    .restart local v42       #lc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    move-object/from16 v0, v34

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v47, v0

    check-cast v47, Lcom/android/internal/telephony/uicc/IccIoResult;

    .line 1061
    .restart local v47       #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    move-object/from16 v0, v42

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;->mOnLoaded:Landroid/os/Message;

    move-object/from16 v46, v0

    .line 1063
    move-object/from16 v0, v34

    iget-object v3, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_aca

    .line 1064
    const/4 v3, 0x0

    move-object/from16 v0, v34

    iget-object v4, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 1068
    :cond_aca
    invoke-virtual/range {v47 .. v47}, Lcom/android/internal/telephony/uicc/IccIoResult;->getException()Lcom/android/internal/telephony/uicc/IccException;

    move-result-object v41

    .line 1070
    .restart local v41       #iccException:Lcom/android/internal/telephony/uicc/IccException;
    if-eqz v41, :cond_ae3

    .line 1071
    const-string v3, "getException not null"

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->loge(Ljava/lang/String;)V

    .line 1073
    const/4 v3, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    move-object/from16 v2, v41

    invoke-direct {v0, v1, v3, v2}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V

    goto/16 :goto_9

    .line 1077
    :cond_ae3
    move-object/from16 v0, v47

    iget-object v3, v0, Lcom/android/internal/telephony/uicc/IccIoResult;->payload:[B

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v46

    invoke-direct {v0, v1, v3, v4}, Lcom/android/internal/telephony/uicc/IccFileHandler;->sendResult(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)V
    :try_end_aef
    .catch Ljava/lang/Exception; {:try_start_60 .. :try_end_aef} :catch_51

    goto/16 :goto_9

    .line 1084
    .end local v34           #ar:Landroid/os/AsyncResult;
    .end local v41           #iccException:Lcom/android/internal/telephony/uicc/IccException;
    .end local v42           #lc:Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;
    .end local v47           #result:Lcom/android/internal/telephony/uicc/IccIoResult;
    .restart local v37       #exc:Ljava/lang/Exception;
    :cond_af1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "uncaught exception"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    move-object/from16 v0, v37

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->loge(Ljava/lang/String;)V

    goto/16 :goto_9

    .line 513
    nop

    :sswitch_data_b0e
    .sparse-switch
        0x4 -> :sswitch_157
        0x5 -> :sswitch_27c
        0x6 -> :sswitch_93
        0x7 -> :sswitch_1d6
        0x8 -> :sswitch_a
        0x9 -> :sswitch_367
        0xa -> :sswitch_3b9
        0xb -> :sswitch_2b3
        0x6e -> :sswitch_634
        0x6f -> :sswitch_6e8
        0x70 -> :sswitch_8ac
        0x71 -> :sswitch_5e2
        0x72 -> :sswitch_98d
        0x73 -> :sswitch_a5c
        0x74 -> :sswitch_9c9
        0x75 -> :sswitch_a98
        0x76 -> :sswitch_406
        0x77 -> :sswitch_4d4
    .end sparse-switch
.end method

.method public loadEFImgLinearFixed(ILandroid/os/Message;)V
    .registers 14
    .parameter "recordNum"
    .parameter "onLoaded"

    .prologue
    const/4 v7, 0x0

    const/16 v2, 0x4f20

    .line 257
    const/16 v0, 0xb

    new-instance v1, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    invoke-direct {v1, v2, p1, p2}, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;-><init>(IILandroid/os/Message;)V

    invoke-virtual {p0, v0, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    .line 261
    .local v10, response:Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xc0

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x4

    const/16 v6, 0xa

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v4, p1

    move-object v8, v7

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 265
    return-void
.end method

.method public loadEFImgLinearFixedSTK(ILandroid/os/Message;)V
    .registers 14
    .parameter "recordNum"
    .parameter "onLoaded"

    .prologue
    const/4 v7, 0x0

    const/16 v2, 0x4f20

    .line 278
    const/16 v0, 0x70

    new-instance v1, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    invoke-direct {v1, v2, p1, p2}, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;-><init>(IILandroid/os/Message;)V

    invoke-virtual {p0, v0, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    .line 283
    .local v10, response:Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xc0

    const-string v3, "img"

    const/4 v5, 0x4

    const/16 v6, 0xa

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v4, p1

    move-object v8, v7

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 286
    return-void
.end method

.method public loadEFImgTransparent(IIIILandroid/os/Message;)V
    .registers 18
    .parameter "fileid"
    .parameter "highOffset"
    .parameter "lowOffset"
    .parameter "length"
    .parameter "onLoaded"

    .prologue
    .line 379
    const/16 v1, 0xa

    const/4 v2, 0x0

    move-object/from16 v0, p5

    invoke-virtual {p0, v1, p1, v2, v0}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v11

    .line 382
    .local v11, response:Landroid/os/Message;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "IccFileHandler: loadEFImgTransparent fileid = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " filePath = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x4f20

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " highOffset = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " lowOffset = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " length = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move/from16 v0, p4

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->logd(Ljava/lang/String;)V

    .line 392
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v2, 0xb0

    const/16 v3, 0x4f20

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v4

    const/4 v8, 0x0

    const/4 v9, 0x0

    iget-object v10, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v3, p1

    move v5, p2

    move v6, p3

    move/from16 v7, p4

    invoke-interface/range {v1 .. v11}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 394
    return-void
.end method

.method public loadEFImgTransparentSTK(IIIILandroid/os/Message;)V
    .registers 18
    .parameter "fileid"
    .parameter "highOffset"
    .parameter "lowOffset"
    .parameter "length"
    .parameter "onLoaded"

    .prologue
    .line 409
    const/4 v1, 0x4

    const/4 v2, 0x0

    move-object/from16 v0, p5

    invoke-virtual {p0, v1, p1, v2, v0}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v11

    .line 411
    .local v11, response:Landroid/os/Message;
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v2, 0xc0

    const-string v4, "img"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/16 v7, 0xf

    const/4 v8, 0x0

    const/4 v9, 0x0

    iget-object v10, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v3, p1

    invoke-interface/range {v1 .. v11}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 414
    return-void
.end method

.method public loadEFLinearFixed(IILandroid/os/Message;)V
    .registers 15
    .parameter "fileid"
    .parameter "recordNum"
    .parameter "onLoaded"

    .prologue
    const/4 v7, 0x0

    const/4 v4, 0x0

    .line 239
    const/4 v0, 0x6

    new-instance v1, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    invoke-direct {v1, p1, p2, p3}, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;-><init>(IILandroid/os/Message;)V

    invoke-virtual {p0, v0, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    .line 243
    .local v10, response:Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xc0

    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0xf

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move v5, v4

    move-object v8, v7

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 245
    return-void
.end method

.method public loadEFLinearFixedAll(ILandroid/os/Message;)V
    .registers 14
    .parameter "fileid"
    .parameter "onLoaded"

    .prologue
    const/4 v7, 0x0

    const/4 v4, 0x0

    .line 316
    const/4 v0, 0x6

    new-instance v1, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    invoke-direct {v1, p1, p2}, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;-><init>(ILandroid/os/Message;)V

    invoke-virtual {p0, v0, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    .line 319
    .local v10, response:Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xc0

    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0xf

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move v5, v4

    move-object v8, v7

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 321
    return-void
.end method

.method public loadEFTransparent(IILandroid/os/Message;)V
    .registers 15
    .parameter "fileid"
    .parameter "size"
    .parameter "onLoaded"

    .prologue
    const/4 v7, 0x0

    const/4 v4, 0x0

    .line 360
    const/4 v0, 0x5

    invoke-virtual {p0, v0, p1, v4, p3}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    .line 363
    .local v10, response:Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xb0

    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v3

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move v5, v4

    move v6, p2

    move-object v8, v7

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 365
    return-void
.end method

.method public loadEFTransparent(ILandroid/os/Message;)V
    .registers 14
    .parameter "fileid"
    .parameter "onLoaded"

    .prologue
    const/4 v7, 0x0

    const/4 v4, 0x0

    .line 341
    const/4 v0, 0x4

    invoke-virtual {p0, v0, p1, v4, p2}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v10

    .line 344
    .local v10, response:Landroid/os/Message;
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xc0

    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v3

    const/16 v6, 0xf

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move v5, v4

    move-object v8, v7

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 347
    return-void
.end method

.method loadItemInPhoneBookStorageAll(ILandroid/os/Message;)V
    .registers 6
    .parameter "fileid"
    .parameter "onLoaded"

    .prologue
    .line 1179
    const/16 v1, 0x6e

    new-instance v2, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;

    invoke-direct {v2, p1, p2}, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadPBEntryContext;-><init>(ILandroid/os/Message;)V

    invoke-virtual {p0, v1, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 1182
    .local v0, response:Landroid/os/Message;
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v1, p1, v0}, Lcom/android/internal/telephony/CommandsInterface;->getPhoneBookStorageInfo(ILandroid/os/Message;)V

    .line 1183
    return-void
.end method

.method protected abstract logd(Ljava/lang/String;)V
.end method

.method protected abstract loge(Ljava/lang/String;)V
.end method

.method public updateEFLinearFixed(II[BLjava/lang/String;Landroid/os/Message;)V
    .registers 18
    .parameter "fileid"
    .parameter "recordNum"
    .parameter "data"
    .parameter "pin2"
    .parameter "onComplete"

    .prologue
    .line 429
    const/16 v1, 0x75

    new-instance v2, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;

    move-object/from16 v0, p5

    invoke-direct {v2, p1, v0}, Lcom/android/internal/telephony/uicc/IccFileHandler$LoadLinearFixedContext;-><init>(ILandroid/os/Message;)V

    invoke-virtual {p0, v1, v2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v11

    .line 432
    .local v11, response:Landroid/os/Message;
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v2, 0xdc

    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x4

    array-length v7, p3

    invoke-static {p3}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v8

    iget-object v10, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v3, p1

    move v5, p2

    move-object/from16 v9, p4

    invoke-interface/range {v1 .. v11}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 436
    return-void
.end method

.method public updateEFTransparent(I[BLandroid/os/Message;)V
    .registers 15
    .parameter "fileid"
    .parameter "data"
    .parameter "onComplete"

    .prologue
    const/4 v4, 0x0

    .line 444
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const/16 v1, 0xd6

    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getEFPath(I)Ljava/lang/String;

    move-result-object v3

    array-length v6, p2

    invoke-static {p2}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/IccFileHandler;->mAid:Ljava/lang/String;

    move v2, p1

    move v5, v4

    move-object v10, p3

    invoke-interface/range {v0 .. v10}, Lcom/android/internal/telephony/CommandsInterface;->iccIOForApp(IILjava/lang/String;IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V

    .line 447
    return-void
.end method
