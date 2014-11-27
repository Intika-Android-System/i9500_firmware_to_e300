.class public Lcom/android/internal/telephony/WapPushOverSms;
.super Ljava/lang/Object;
.source "WapPushOverSms.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# static fields
.field private static final DBG:Z = true

.field private static final TAG:Ljava/lang/String; = "WAP PUSH"


# instance fields
.field private final mContext:Landroid/content/Context;

.field protected mIQClient:Lcom/carrieriq/iqagent/client/IQClient;

.field private mPushOrigAddr:Ljava/lang/String;

.field private mWapPushAddress:Ljava/lang/String;

.field private volatile mWapPushManager:Lcom/android/internal/telephony/IWapPushManager;

.field private mWapPushTimeStamp:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 6
    .parameter "context"

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    iput-object p1, p0, Lcom/android/internal/telephony/WapPushOverSms;->mContext:Landroid/content/Context;

    .line 91
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/android/internal/telephony/IWapPushManager;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 92
    .local v1, intent:Landroid/content/Intent;
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->resolveSystemService(Landroid/content/pm/PackageManager;I)Landroid/content/ComponentName;

    move-result-object v0

    .line 93
    .local v0, comp:Landroid/content/ComponentName;
    invoke-virtual {v1, v0}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 94
    if-eqz v0, :cond_25

    const/4 v2, 0x1

    invoke-virtual {p1, v1, p0, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    move-result v2

    if-nez v2, :cond_2d

    .line 95
    :cond_25
    const-string v2, "WAP PUSH"

    const-string v3, "bindService() for wappush manager failed"

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    :goto_2c
    return-void

    .line 97
    :cond_2d
    const-string v2, "WAP PUSH"

    const-string v3, "bindService() for wappush manager succeeded"

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2c
.end method

.method private dispatchWapPdu_DMNoti([BILandroid/content/BroadcastReceiver;Lcom/android/internal/telephony/InboundSmsHandler;)V
    .registers 9
    .parameter "pdu"
    .parameter "binaryContentType"
    .parameter "receiver"
    .parameter "handler"

    .prologue
    .line 562
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.provider.Telephony.WAP_PUSH_DM_NOTI_RECEIVED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 563
    .local v1, intent:Landroid/content/Intent;
    const/16 v2, 0x20

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 564
    const-string v2, "pdus"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 565
    const-string v2, "pushtype"

    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 567
    const/16 v0, 0x13

    .line 568
    .local v0, appOp:I
    const-string v2, "WAP PUSH"

    const-string v3, "android.provider.Telephony.WAP_PUSH_DM_NOTI_RECEIVED is sent"

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 569
    const-string v2, "android.permission.RECEIVE_WAP_PUSH"

    invoke-virtual {p4, v1, v2, v0, p3}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V

    .line 570
    return-void
.end method

.method private dispatchWapPdu_DSNoti([BILandroid/content/BroadcastReceiver;Lcom/android/internal/telephony/InboundSmsHandler;)V
    .registers 9
    .parameter "pdu"
    .parameter "binaryContentType"
    .parameter "receiver"
    .parameter "handler"

    .prologue
    .line 597
    const/16 v0, 0x13

    .line 604
    .local v0, appOp:I
    invoke-static {}, Lcom/sec/android/app/CscFeature;->getInstance()Lcom/sec/android/app/CscFeature;

    move-result-object v2

    const-string v3, "CscFeature_Common_MyPhonebookBrandName"

    invoke-virtual {v2, v3}, Lcom/sec/android/app/CscFeature;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2b

    .line 605
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.provider.Telephony.WAP_PUSH_DS_NOTI_RECEIVED_MYPHONEBOOK"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 606
    .local v1, intent:Landroid/content/Intent;
    const-string v2, "ds_message"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 607
    const-string v2, "pushtype"

    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 608
    const-string v2, "android.permission.RECEIVE_WAP_PUSH"

    invoke-virtual {p4, v1, v2, v0, p3}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V

    .line 631
    :goto_2a
    return-void

    .line 621
    .end local v1           #intent:Landroid/content/Intent;
    :cond_2b
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.provider.Telephony.WAP_PUSH_RECEIVED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 622
    .restart local v1       #intent:Landroid/content/Intent;
    const-string v2, "application/vnd.syncml.ds.notification"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 623
    const-string v2, "data"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 626
    const-string v2, "ds_message"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 627
    const-string v2, "pushtype"

    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 628
    const-string v2, "WAP PUSH"

    const-string v3, "ds noti intent is sent"

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 629
    const-string v2, "android.permission.RECEIVE_WAP_PUSH"

    invoke-virtual {p4, v1, v2, v0, p3}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V

    goto :goto_2a
.end method

.method private dispatchWapPdu_MMS([BIIIILandroid/content/BroadcastReceiver;Lcom/android/internal/telephony/InboundSmsHandler;)V
    .registers 15
    .parameter "pdu"
    .parameter "transactionId"
    .parameter "pduType"
    .parameter "headerStartIndex"
    .parameter "headerLength"
    .parameter "receiver"
    .parameter "handler"

    .prologue
    const/4 v6, 0x0

    .line 537
    new-array v3, p5, [B

    .line 538
    .local v3, header:[B
    array-length v5, v3

    invoke-static {p1, p4, v3, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 539
    add-int v2, p4, p5

    .line 540
    .local v2, dataIndex:I
    array-length v5, p1

    sub-int/2addr v5, v2

    new-array v1, v5, [B

    .line 541
    .local v1, data:[B
    array-length v5, v1

    invoke-static {p1, v2, v1, v6, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 544
    new-instance v4, Landroid/content/Intent;

    const-string v5, "android.provider.Telephony.WAP_PUSH_DELIVER"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 545
    .local v4, intent:Landroid/content/Intent;
    const-string v5, "application/vnd.wap.mms-message"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 546
    const-string v5, "transactionId"

    invoke-virtual {v4, v5, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 547
    const-string v5, "pduType"

    invoke-virtual {v4, v5, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 548
    const-string v5, "header"

    invoke-virtual {v4, v5, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 549
    const-string v5, "data"

    invoke-virtual {v4, v5, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 551
    const-string v5, "simSlot"

    invoke-virtual {p7}, Lcom/android/internal/telephony/InboundSmsHandler;->getPhone()Lcom/android/internal/telephony/PhoneBase;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v6

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 553
    const/16 v0, 0x12

    .line 554
    .local v0, appOp:I
    const-string v5, "android.permission.RECEIVE_MMS"

    invoke-virtual {p7, v4, v5, v0, p6}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V

    .line 555
    return-void
.end method

.method private dispatchWapPdu_PushCO([BIIIILandroid/content/BroadcastReceiver;Lcom/android/internal/telephony/InboundSmsHandler;)V
    .registers 13
    .parameter "pdu"
    .parameter "transactionId"
    .parameter "pduType"
    .parameter "headerStartIndex"
    .parameter "headerLength"
    .parameter "receiver"
    .parameter "handler"

    .prologue
    .line 513
    new-array v1, p5, [B

    .line 514
    .local v1, header:[B
    const/4 v3, 0x0

    array-length v4, v1

    invoke-static {p1, p4, v1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 517
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.provider.Telephony.WAP_PUSH_RECEIVED"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 518
    .local v2, intent:Landroid/content/Intent;
    const-string v3, "application/vnd.wap.coc"

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 519
    const-string v3, "transactionId"

    invoke-virtual {v2, v3, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 520
    const-string v3, "pduType"

    invoke-virtual {v2, v3, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 521
    const-string v3, "header"

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 522
    const-string v3, "data"

    invoke-virtual {v2, v3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 524
    const-string v3, "simSlot"

    invoke-virtual {p7}, Lcom/android/internal/telephony/InboundSmsHandler;->getPhone()Lcom/android/internal/telephony/PhoneBase;

    move-result-object v4

    invoke-virtual {v4}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 526
    iget-object v3, p0, Lcom/android/internal/telephony/WapPushOverSms;->mPushOrigAddr:Ljava/lang/String;

    if-eqz v3, :cond_3f

    .line 527
    const-string v3, "origaddr"

    iget-object v4, p0, Lcom/android/internal/telephony/WapPushOverSms;->mPushOrigAddr:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 530
    :cond_3f
    const/16 v0, 0x13

    .line 531
    .local v0, appOp:I
    const-string v3, "android.permission.RECEIVE_WAP_PUSH"

    invoke-virtual {p7, v2, v3, v0, p6}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V

    .line 532
    return-void
.end method

.method private dispatchWapPdu_PushMsg([BILandroid/content/BroadcastReceiver;Lcom/android/internal/telephony/InboundSmsHandler;)V
    .registers 10
    .parameter "pdu"
    .parameter "binaryContentType"
    .parameter "receiver"
    .parameter "handler"

    .prologue
    .line 579
    const-string v2, "WAP PUSH"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "dispatchWapPdu_PushMsg : binaryContentType = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 581
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.provider.Telephony.WAP_PUSH_RECEIVED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 582
    .local v1, intent:Landroid/content/Intent;
    const-string v2, "pdus"

    invoke-virtual {v1, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 583
    const-string v2, "pushtype"

    invoke-virtual {v1, v2, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 586
    iget-object v2, p0, Lcom/android/internal/telephony/WapPushOverSms;->mPushOrigAddr:Ljava/lang/String;

    if-eqz v2, :cond_34

    .line 587
    const-string v2, "origaddr"

    iget-object v3, p0, Lcom/android/internal/telephony/WapPushOverSms;->mPushOrigAddr:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 589
    :cond_34
    const/16 v0, 0x13

    .line 590
    .local v0, appOp:I
    const-string v2, "android.permission.RECEIVE_WAP_PUSH"

    invoke-virtual {p4, v1, v2, v0, p3}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V

    .line 591
    return-void
.end method


# virtual methods
.method public dispatchWapPdu([BLandroid/content/BroadcastReceiver;Lcom/android/internal/telephony/InboundSmsHandler;)I
    .registers 45
    .parameter "pdu"
    .parameter "receiver"
    .parameter "handler"

    .prologue
    .line 125
    const-string v6, "WAP PUSH"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Rx: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static/range {p1 .. p1}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    const/16 v27, 0x0

    .line 129
    .local v27, index:I
    add-int/lit8 v28, v27, 0x1

    .end local v27           #index:I
    .local v28, index:I
    :try_start_20
    aget-byte v6, p1, v27
    :try_end_22
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_20 .. :try_end_22} :catch_53f

    and-int/lit16 v0, v6, 0xff

    move/from16 v38, v0

    .line 130
    .local v38, transactionId:I
    add-int/lit8 v27, v28, 0x1

    .end local v28           #index:I
    .restart local v27       #index:I
    :try_start_28
    aget-byte v6, p1, v28

    and-int/lit16 v0, v6, 0xff

    move/from16 v34, v0

    .line 138
    .local v34, pduType:I
    const/4 v6, 0x6

    move/from16 v0, v34

    if-eq v0, v6, :cond_d0

    const/4 v6, 0x7

    move/from16 v0, v34

    if-eq v0, v6, :cond_d0

    .line 140
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/internal/telephony/WapPushOverSms;->mContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x10e004c

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getInteger(I)I
    :try_end_46
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_28 .. :try_end_46} :catch_3df

    move-result v27

    .line 142
    const/4 v6, -0x1

    move/from16 v0, v27

    if-eq v0, v6, :cond_b4

    .line 143
    add-int/lit8 v28, v27, 0x1

    .end local v27           #index:I
    .restart local v28       #index:I
    :try_start_4e
    aget-byte v6, p1, v27
    :try_end_50
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_4e .. :try_end_50} :catch_53f

    and-int/lit16 v0, v6, 0xff

    move/from16 v38, v0

    .line 144
    add-int/lit8 v27, v28, 0x1

    .end local v28           #index:I
    .restart local v27       #index:I
    :try_start_56
    aget-byte v6, p1, v28

    and-int/lit16 v0, v6, 0xff

    move/from16 v34, v0

    .line 146
    const-string v6, "WAP PUSH"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "index = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v27

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " PDU Type = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v34

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " transactionID = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v38

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    const/4 v6, 0x6

    move/from16 v0, v34

    if-eq v0, v6, :cond_d0

    const/4 v6, 0x7

    move/from16 v0, v34

    if-eq v0, v6, :cond_d0

    .line 152
    const-string v6, "WAP PUSH"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Received non-PUSH WAP PDU. Type = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v34

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    const/4 v6, 0x1

    .line 498
    .end local v34           #pduType:I
    .end local v38           #transactionId:I
    :goto_b3
    return v6

    .line 156
    .restart local v34       #pduType:I
    .restart local v38       #transactionId:I
    :cond_b4
    const-string v6, "WAP PUSH"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Received non-PUSH WAP PDU. Type = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v34

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    const/4 v6, 0x1

    goto :goto_b3

    .line 161
    :cond_d0
    new-instance v33, Lcom/android/internal/telephony/WspTypeDecoder;

    move-object/from16 v0, v33

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/WspTypeDecoder;-><init>([B)V

    .line 169
    .local v33, pduDecoder:Lcom/android/internal/telephony/WspTypeDecoder;
    move-object/from16 v0, v33

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/WspTypeDecoder;->decodeUintvarInteger(I)Z

    move-result v6

    if-nez v6, :cond_ec

    .line 170
    const-string v6, "WAP PUSH"

    const-string v7, "Received PDU. Header Length error."

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    const/4 v6, 0x2

    goto :goto_b3

    .line 173
    :cond_ec
    invoke-virtual/range {v33 .. v33}, Lcom/android/internal/telephony/WspTypeDecoder;->getValue32()J

    move-result-wide v6

    long-to-int v11, v6

    .line 174
    .local v11, headerLength:I
    invoke-virtual/range {v33 .. v33}, Lcom/android/internal/telephony/WspTypeDecoder;->getDecodedDataLength()I

    move-result v6

    add-int v27, v27, v6

    .line 176
    move/from16 v25, v27

    .line 190
    .local v25, headerStartIndex:I
    move-object/from16 v0, v33

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/WspTypeDecoder;->decodeContentType(I)Z

    move-result v6

    if-nez v6, :cond_10c

    .line 191
    const-string v6, "WAP PUSH"

    const-string v7, "Received PDU. Header Content-Type error."

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 192
    const/4 v6, 0x2

    goto :goto_b3

    .line 195
    :cond_10c
    invoke-virtual/range {v33 .. v33}, Lcom/android/internal/telephony/WspTypeDecoder;->getValueString()Ljava/lang/String;

    move-result-object v31

    .line 196
    .local v31, mimeType:Ljava/lang/String;
    invoke-virtual/range {v33 .. v33}, Lcom/android/internal/telephony/WspTypeDecoder;->getValue32()J

    move-result-wide v16

    .line 199
    .local v16, binaryContentType:J
    invoke-virtual/range {v33 .. v33}, Lcom/android/internal/telephony/WspTypeDecoder;->getValue32()J

    move-result-wide v6

    long-to-int v0, v6

    move/from16 v26, v0

    .line 202
    .local v26, iBinaryContentType:I
    if-nez v31, :cond_191

    .line 204
    sparse-switch v26, :sswitch_data_544

    .line 262
    const-string v6, "WAP PUSH"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Received PDU. Unsupported Content-Type = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-wide/from16 v0, v16

    invoke-virtual {v7, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    const/4 v6, 0x1

    goto/16 :goto_b3

    .line 206
    :sswitch_13d
    const-string v31, "application/vnd.oma.drm.rights+xml"
    :try_end_13f
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_56 .. :try_end_13f} :catch_3df

    .line 316
    :goto_13f
    :try_start_13f
    invoke-static {}, Landroid/sec/enterprise/EnterpriseDeviceManager;->getInstance()Landroid/sec/enterprise/EnterpriseDeviceManager;

    move-result-object v23

    .line 317
    .local v23, edm:Landroid/sec/enterprise/EnterpriseDeviceManager;
    invoke-virtual/range {v23 .. v23}, Landroid/sec/enterprise/EnterpriseDeviceManager;->getPhoneRestrictionPolicy()Landroid/sec/enterprise/PhoneRestrictionPolicy;

    move-result-object v5

    .line 318
    .local v5, phoneResPol:Landroid/sec/enterprise/PhoneRestrictionPolicy;
    const-string v6, "gsm.operator.isroaming"

    const/4 v7, 0x0

    invoke-static {v6, v7}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_15a

    invoke-virtual/range {v23 .. v23}, Landroid/sec/enterprise/EnterpriseDeviceManager;->getRoamingPolicy()Landroid/sec/enterprise/RoamingPolicy;

    move-result-object v6

    invoke-virtual {v6}, Landroid/sec/enterprise/RoamingPolicy;->isRoamingPushEnabled()Z

    move-result v6

    if-eqz v6, :cond_160

    :cond_15a
    invoke-virtual {v5}, Landroid/sec/enterprise/PhoneRestrictionPolicy;->isWapPushAllowed()Z

    move-result v6

    if-nez v6, :cond_26f

    .line 321
    :cond_160
    const-string v6, "WAP PUSH"

    const-string v7, " MDM RoamingPush or WapPush Disabled "

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_167
    .catch Ljava/lang/NullPointerException; {:try_start_13f .. :try_end_167} :catch_2ab
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_13f .. :try_end_167} :catch_3df

    .line 322
    const/4 v6, 0x1

    goto/16 :goto_b3

    .line 209
    .end local v5           #phoneResPol:Landroid/sec/enterprise/PhoneRestrictionPolicy;
    .end local v23           #edm:Landroid/sec/enterprise/EnterpriseDeviceManager;
    :sswitch_16a
    :try_start_16a
    const-string v31, "application/vnd.oma.drm.rights+wbxml"

    .line 210
    goto :goto_13f

    .line 212
    :sswitch_16d
    const-string v31, "application/vnd.wap.sic"

    .line 213
    goto :goto_13f

    .line 215
    :sswitch_170
    const-string v31, "application/vnd.wap.slc"

    .line 216
    goto :goto_13f

    .line 218
    :sswitch_173
    const-string v31, "application/vnd.wap.coc"

    .line 219
    goto :goto_13f

    .line 221
    :sswitch_176
    const-string v31, "application/vnd.wap.mms-message"

    .line 222
    goto :goto_13f

    .line 224
    :sswitch_179
    const-string v31, "application/vnd.omaloc-supl-init"

    .line 225
    goto :goto_13f

    .line 227
    :sswitch_17c
    const-string v31, "application/vnd.docomo.pf"

    .line 228
    goto :goto_13f

    .line 236
    :sswitch_17f
    const-string v31, "application/vnd.syncml.notification"

    .line 237
    goto :goto_13f

    .line 242
    :sswitch_182
    const-string v31, "application/vnd.syncml.ds.notification"

    .line 243
    goto :goto_13f

    .line 246
    :sswitch_185
    const-string v31, "application/vnd.wap.connectivity-wbxml"

    .line 247
    goto :goto_13f

    .line 249
    :sswitch_188
    const-string v31, "application/vnd.syncml.dm+wbxml"

    .line 250
    goto :goto_13f

    .line 252
    :sswitch_18b
    const-string v31, "application/vnd.syncml.dm+xml"

    .line 253
    goto :goto_13f

    .line 257
    :sswitch_18e
    const-string v31, "application/vnd.wap.emn+wbxml"

    .line 258
    goto :goto_13f

    .line 267
    :cond_191
    const-string v6, "application/vnd.oma.drm.rights+xml"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_19e

    .line 268
    const/16 v26, 0x4a

    goto :goto_13f

    .line 269
    :cond_19e
    const-string v6, "application/vnd.oma.drm.rights+wbxml"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1ab

    .line 270
    const/16 v26, 0x4b

    goto :goto_13f

    .line 271
    :cond_1ab
    const-string v6, "application/vnd.wap.sic"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1b8

    .line 272
    const/16 v26, 0x2e

    goto :goto_13f

    .line 273
    :cond_1b8
    const-string v6, "application/vnd.wap.slc"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1c6

    .line 274
    const/16 v26, 0x30

    goto/16 :goto_13f

    .line 275
    :cond_1c6
    const-string v6, "application/vnd.wap.coc"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1d4

    .line 276
    const/16 v26, 0x32

    goto/16 :goto_13f

    .line 277
    :cond_1d4
    const-string v6, "application/vnd.wap.mms-message"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1e2

    .line 278
    const/16 v26, 0x3e

    goto/16 :goto_13f

    .line 279
    :cond_1e2
    const-string v6, "application/vnd.omaloc-supl-init"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1f0

    .line 280
    const/16 v26, 0x312

    goto/16 :goto_13f

    .line 281
    :cond_1f0
    const-string v6, "application/vnd.docomo.pf"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1fe

    .line 282
    const/16 v26, 0x310

    goto/16 :goto_13f

    .line 288
    :cond_1fe
    const-string v6, "application/vnd.syncml.notification"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_20c

    .line 289
    const/16 v26, 0x44

    goto/16 :goto_13f

    .line 290
    :cond_20c
    const-string v6, "application/vnd.syncml.ds.notification"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_21a

    .line 291
    const/16 v26, 0x4e

    goto/16 :goto_13f

    .line 294
    :cond_21a
    const-string v6, "application/vnd.wap.connectivity-wbxml"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_228

    .line 295
    const/16 v26, 0x36

    goto/16 :goto_13f

    .line 296
    :cond_228
    const-string v6, "application/vnd.syncml.dm+wbxml"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_236

    .line 297
    const/16 v26, 0x42

    goto/16 :goto_13f

    .line 298
    :cond_236
    const-string v6, "application/vnd.syncml.dm+xml"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_244

    .line 299
    const/16 v26, 0x43

    goto/16 :goto_13f

    .line 302
    :cond_244
    const-string v6, "application/vnd.wap.emn+wbxml"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_252

    .line 303
    const/16 v26, 0x30a

    goto/16 :goto_13f

    .line 307
    :cond_252
    const-string v6, "WAP PUSH"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Received PDU. Unknown Content-Type = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v31

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_26c
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_16a .. :try_end_26c} :catch_3df

    .line 309
    const/4 v6, 0x1

    goto/16 :goto_b3

    .line 324
    .restart local v5       #phoneResPol:Landroid/sec/enterprise/PhoneRestrictionPolicy;
    .restart local v23       #edm:Landroid/sec/enterprise/EnterpriseDeviceManager;
    :cond_26f
    const/16 v6, 0x3e

    move/from16 v0, v26

    if-ne v6, v0, :cond_2c6

    .line 325
    const/4 v6, 0x1

    :try_start_276
    invoke-virtual {v5, v6}, Landroid/sec/enterprise/PhoneRestrictionPolicy;->getEmergencyCallOnly(Z)Z

    move-result v6

    if-nez v6, :cond_282

    invoke-virtual {v5}, Landroid/sec/enterprise/PhoneRestrictionPolicy;->isIncomingMmsAllowed()Z

    move-result v6

    if-nez v6, :cond_28c

    .line 326
    :cond_282
    const-string v6, "WAP PUSH"

    const-string v7, "emergency call only or incoming MMS not allowed"

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 327
    const/4 v6, 0x1

    goto/16 :goto_b3

    .line 328
    :cond_28c
    invoke-virtual {v5}, Landroid/sec/enterprise/PhoneRestrictionPolicy;->isBlockMmsWithStorageEnabled()Z

    move-result v6

    if-eqz v6, :cond_2c6

    .line 329
    const-string v6, "WAP PUSH"

    const-string v7, "blocking mms with storage"

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 330
    const/4 v6, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/android/internal/telephony/WapPushOverSms;->mWapPushAddress:Ljava/lang/String;

    const/4 v9, -0x1

    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/android/internal/telephony/WapPushOverSms;->mWapPushTimeStamp:Ljava/lang/String;

    move-object/from16 v7, p1

    invoke-virtual/range {v5 .. v10}, Landroid/sec/enterprise/PhoneRestrictionPolicy;->storeBlockedSmsMms(Z[BLjava/lang/String;ILjava/lang/String;)V
    :try_end_2a8
    .catch Ljava/lang/NullPointerException; {:try_start_276 .. :try_end_2a8} :catch_2ab
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_276 .. :try_end_2a8} :catch_3df

    .line 332
    const/4 v6, 0x1

    goto/16 :goto_b3

    .line 335
    .end local v5           #phoneResPol:Landroid/sec/enterprise/PhoneRestrictionPolicy;
    .end local v23           #edm:Landroid/sec/enterprise/EnterpriseDeviceManager;
    :catch_2ab
    move-exception v32

    .line 336
    .local v32, npe:Ljava/lang/NullPointerException;
    :try_start_2ac
    const-string v6, "WAP PUSH"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "MDM failed to get policy - NullPointerException but this isn\'t issue"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v32

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 339
    .end local v32           #npe:Ljava/lang/NullPointerException;
    :cond_2c6
    const/16 v21, 0x0

    .line 340
    .local v21, dispatchedByApplication:Z
    sparse-switch v26, :sswitch_data_582

    .line 381
    :goto_2cb
    const/4 v6, 0x1

    move/from16 v0, v21

    if-ne v0, v6, :cond_333

    .line 382
    const/4 v6, -0x1

    goto/16 :goto_b3

    :sswitch_2d3
    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move/from16 v8, v38

    move/from16 v9, v34

    move/from16 v10, v25

    move-object/from16 v12, p2

    move-object/from16 v13, p3

    .line 342
    invoke-direct/range {v6 .. v13}, Lcom/android/internal/telephony/WapPushOverSms;->dispatchWapPdu_PushCO([BIIIILandroid/content/BroadcastReceiver;Lcom/android/internal/telephony/InboundSmsHandler;)V

    .line 343
    const/16 v21, 0x1

    .line 344
    goto :goto_2cb

    :sswitch_2e7
    move-object/from16 v6, p0

    move-object/from16 v7, p1

    move/from16 v8, v38

    move/from16 v9, v34

    move/from16 v10, v25

    move-object/from16 v12, p2

    move-object/from16 v13, p3

    .line 346
    invoke-direct/range {v6 .. v13}, Lcom/android/internal/telephony/WapPushOverSms;->dispatchWapPdu_MMS([BIIIILandroid/content/BroadcastReceiver;Lcom/android/internal/telephony/InboundSmsHandler;)V

    .line 347
    const/16 v21, 0x1

    .line 348
    goto :goto_2cb

    .line 354
    :sswitch_2fb
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v26

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/internal/telephony/WapPushOverSms;->dispatchWapPdu_DMNoti([BILandroid/content/BroadcastReceiver;Lcom/android/internal/telephony/InboundSmsHandler;)V

    .line 355
    const/16 v21, 0x1

    .line 356
    goto :goto_2cb

    .line 363
    :sswitch_30b
    const/16 v21, 0x0

    .line 364
    goto :goto_2cb

    .line 369
    :sswitch_30e
    invoke-static {}, Lcom/sec/android/app/CscFeature;->getInstance()Lcom/sec/android/app/CscFeature;

    move-result-object v6

    const-string v7, "CscFeature_Common_MyPhonebookBrandName"

    invoke-virtual {v6, v7}, Lcom/sec/android/app/CscFeature;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, ""

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_330

    .line 370
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, v26

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/internal/telephony/WapPushOverSms;->dispatchWapPdu_DSNoti([BILandroid/content/BroadcastReceiver;Lcom/android/internal/telephony/InboundSmsHandler;)V

    .line 371
    const/16 v21, 0x1

    goto :goto_2cb

    .line 373
    :cond_330
    const/16 v21, 0x1

    .line 375
    goto :goto_2cb

    .line 387
    :cond_333
    invoke-virtual/range {v33 .. v33}, Lcom/android/internal/telephony/WspTypeDecoder;->getDecodedDataLength()I

    move-result v6

    add-int v27, v27, v6

    .line 389
    new-array v0, v11, [B

    move-object/from16 v24, v0

    .line 390
    .local v24, header:[B
    const/4 v6, 0x0

    move-object/from16 v0, v24

    array-length v7, v0

    move-object/from16 v0, p1

    move/from16 v1, v25

    move-object/from16 v2, v24

    invoke-static {v0, v1, v2, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 394
    if-eqz v31, :cond_3c5

    const-string v6, "application/vnd.wap.coc"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3c5

    .line 395
    move-object/from16 v30, p1

    .line 408
    .local v30, intentData:[B
    :goto_358
    add-int v6, v27, v11

    add-int/lit8 v6, v6, -0x1

    move-object/from16 v0, v33

    move/from16 v1, v27

    invoke-virtual {v0, v1, v6}, Lcom/android/internal/telephony/WspTypeDecoder;->seekXWapApplicationId(II)Z

    move-result v6

    if-eqz v6, :cond_46f

    .line 409
    invoke-virtual/range {v33 .. v33}, Lcom/android/internal/telephony/WspTypeDecoder;->getValue32()J

    move-result-wide v6

    long-to-int v0, v6

    move/from16 v27, v0

    .line 410
    move-object/from16 v0, v33

    move/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/WspTypeDecoder;->decodeXWapApplicationId(I)Z

    .line 411
    invoke-virtual/range {v33 .. v33}, Lcom/android/internal/telephony/WspTypeDecoder;->getValueString()Ljava/lang/String;

    move-result-object v39

    .line 412
    .local v39, wapAppId:Ljava/lang/String;
    if-nez v39, :cond_383

    .line 413
    invoke-virtual/range {v33 .. v33}, Lcom/android/internal/telephony/WspTypeDecoder;->getValue32()J

    move-result-wide v6

    long-to-int v6, v6

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v39

    .line 416
    :cond_383
    if-nez v31, :cond_3fb

    invoke-static/range {v16 .. v17}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v19

    .line 418
    .local v19, contentType:Ljava/lang/String;
    :goto_389
    const-string v6, "WAP PUSH"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "appid found: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v39

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ":"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v19

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3af
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_2ac .. :try_end_3af} :catch_3df

    .line 421
    const/16 v37, 0x1

    .line 422
    .local v37, processFurther:Z
    :try_start_3b1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/WapPushOverSms;->mWapPushManager:Lcom/android/internal/telephony/IWapPushManager;

    move-object/from16 v40, v0

    .line 424
    .local v40, wapPushMan:Lcom/android/internal/telephony/IWapPushManager;
    if-nez v40, :cond_3fe

    .line 425
    const-string v6, "WAP PUSH"

    const-string v7, "wap push manager not found!"

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3c0
    .catch Landroid/os/RemoteException; {:try_start_3b1 .. :try_end_3c0} :catch_467
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_3b1 .. :try_end_3c0} :catch_3df

    .line 442
    :cond_3c0
    :goto_3c0
    if-nez v37, :cond_46f

    .line 443
    const/4 v6, 0x1

    goto/16 :goto_b3

    .line 397
    .end local v19           #contentType:Ljava/lang/String;
    .end local v30           #intentData:[B
    .end local v37           #processFurther:Z
    .end local v39           #wapAppId:Ljava/lang/String;
    .end local v40           #wapPushMan:Lcom/android/internal/telephony/IWapPushManager;
    :cond_3c5
    add-int v20, v25, v11

    .line 398
    .local v20, dataIndex:I
    :try_start_3c7
    move-object/from16 v0, p1

    array-length v6, v0

    sub-int v6, v6, v20

    new-array v0, v6, [B

    move-object/from16 v30, v0

    .line 399
    .restart local v30       #intentData:[B
    const/4 v6, 0x0

    move-object/from16 v0, v30

    array-length v7, v0

    move-object/from16 v0, p1

    move/from16 v1, v20

    move-object/from16 v2, v30

    invoke-static {v0, v1, v2, v6, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_3dd
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_3c7 .. :try_end_3dd} :catch_3df

    goto/16 :goto_358

    .line 494
    .end local v11           #headerLength:I
    .end local v16           #binaryContentType:J
    .end local v20           #dataIndex:I
    .end local v21           #dispatchedByApplication:Z
    .end local v24           #header:[B
    .end local v25           #headerStartIndex:I
    .end local v26           #iBinaryContentType:I
    .end local v30           #intentData:[B
    .end local v31           #mimeType:Ljava/lang/String;
    .end local v33           #pduDecoder:Lcom/android/internal/telephony/WspTypeDecoder;
    .end local v34           #pduType:I
    :catch_3df
    move-exception v14

    .line 497
    .end local v38           #transactionId:I
    .local v14, aie:Ljava/lang/ArrayIndexOutOfBoundsException;
    :goto_3e0
    const-string v6, "WAP PUSH"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "ignoring dispatchWapPdu() array index exception: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 498
    const/4 v6, 0x2

    goto/16 :goto_b3

    .end local v14           #aie:Ljava/lang/ArrayIndexOutOfBoundsException;
    .restart local v11       #headerLength:I
    .restart local v16       #binaryContentType:J
    .restart local v21       #dispatchedByApplication:Z
    .restart local v24       #header:[B
    .restart local v25       #headerStartIndex:I
    .restart local v26       #iBinaryContentType:I
    .restart local v30       #intentData:[B
    .restart local v31       #mimeType:Ljava/lang/String;
    .restart local v33       #pduDecoder:Lcom/android/internal/telephony/WspTypeDecoder;
    .restart local v34       #pduType:I
    .restart local v38       #transactionId:I
    .restart local v39       #wapAppId:Ljava/lang/String;
    :cond_3fb
    move-object/from16 v19, v31

    .line 416
    goto :goto_389

    .line 427
    .restart local v19       #contentType:Ljava/lang/String;
    .restart local v37       #processFurther:Z
    .restart local v40       #wapPushMan:Lcom/android/internal/telephony/IWapPushManager;
    :cond_3fe
    :try_start_3fe
    new-instance v29, Landroid/content/Intent;

    invoke-direct/range {v29 .. v29}, Landroid/content/Intent;-><init>()V

    .line 428
    .local v29, intent:Landroid/content/Intent;
    const-string v6, "transactionId"

    move-object/from16 v0, v29

    move/from16 v1, v38

    invoke-virtual {v0, v6, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 429
    const-string v6, "pduType"

    move-object/from16 v0, v29

    move/from16 v1, v34

    invoke-virtual {v0, v6, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 430
    const-string v6, "header"

    move-object/from16 v0, v29

    move-object/from16 v1, v24

    invoke-virtual {v0, v6, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 431
    const-string v6, "data"

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    invoke-virtual {v0, v6, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 432
    const-string v6, "contentTypeParameters"

    invoke-virtual/range {v33 .. v33}, Lcom/android/internal/telephony/WspTypeDecoder;->getContentParameters()Ljava/util/HashMap;

    move-result-object v7

    move-object/from16 v0, v29

    invoke-virtual {v0, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 435
    move-object/from16 v0, v40

    move-object/from16 v1, v39

    move-object/from16 v2, v19

    move-object/from16 v3, v29

    invoke-interface {v0, v1, v2, v3}, Lcom/android/internal/telephony/IWapPushManager;->processMessage(Ljava/lang/String;Ljava/lang/String;Landroid/content/Intent;)I

    move-result v36

    .line 436
    .local v36, procRet:I
    const-string v6, "WAP PUSH"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "procRet:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move/from16 v0, v36

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_458
    .catch Landroid/os/RemoteException; {:try_start_3fe .. :try_end_458} :catch_467
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_3fe .. :try_end_458} :catch_3df

    .line 437
    and-int/lit8 v6, v36, 0x1

    if-lez v6, :cond_3c0

    const v6, 0x8000

    and-int v6, v6, v36

    if-nez v6, :cond_3c0

    .line 439
    const/16 v37, 0x0

    goto/16 :goto_3c0

    .line 445
    .end local v29           #intent:Landroid/content/Intent;
    .end local v36           #procRet:I
    .end local v40           #wapPushMan:Lcom/android/internal/telephony/IWapPushManager;
    :catch_467
    move-exception v22

    .line 446
    .local v22, e:Landroid/os/RemoteException;
    :try_start_468
    const-string v6, "WAP PUSH"

    const-string v7, "remote func failed..."

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 449
    .end local v19           #contentType:Ljava/lang/String;
    .end local v22           #e:Landroid/os/RemoteException;
    .end local v37           #processFurther:Z
    .end local v39           #wapAppId:Ljava/lang/String;
    :cond_46f
    const-string v6, "WAP PUSH"

    const-string v7, "fall back to existing handler"

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 451
    if-nez v31, :cond_482

    .line 452
    const-string v6, "WAP PUSH"

    const-string v7, "Header Content-Type error."

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 453
    const/4 v6, 0x2

    goto/16 :goto_b3

    .line 459
    :cond_482
    const-string v6, "application/vnd.wap.mms-message"

    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_539

    .line 460
    const-string v35, "android.permission.RECEIVE_MMS"

    .line 461
    .local v35, permission:Ljava/lang/String;
    const/16 v15, 0x12

    .line 467
    .local v15, appOp:I
    :goto_490
    new-instance v29, Landroid/content/Intent;

    const-string v6, "android.provider.Telephony.WAP_PUSH_DELIVER"

    move-object/from16 v0, v29

    invoke-direct {v0, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 468
    .restart local v29       #intent:Landroid/content/Intent;
    move-object/from16 v0, v29

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 469
    const-string v6, "transactionId"

    move-object/from16 v0, v29

    move/from16 v1, v38

    invoke-virtual {v0, v6, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 470
    const-string v6, "pduType"

    move-object/from16 v0, v29

    move/from16 v1, v34

    invoke-virtual {v0, v6, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 471
    const-string v6, "header"

    move-object/from16 v0, v29

    move-object/from16 v1, v24

    invoke-virtual {v0, v6, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 472
    const-string v6, "data"

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    invoke-virtual {v0, v6, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[B)Landroid/content/Intent;

    .line 473
    const-string v6, "contentTypeParameters"

    invoke-virtual/range {v33 .. v33}, Lcom/android/internal/telephony/WspTypeDecoder;->getContentParameters()Ljava/util/HashMap;

    move-result-object v7

    move-object/from16 v0, v29

    invoke-virtual {v0, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 475
    const-string v6, "simSlot"

    invoke-virtual/range {p3 .. p3}, Lcom/android/internal/telephony/InboundSmsHandler;->getPhone()Lcom/android/internal/telephony/PhoneBase;

    move-result-object v7

    invoke-virtual {v7}, Lcom/android/internal/telephony/PhoneBase;->getSimSlot()I

    move-result v7

    move-object/from16 v0, v29

    invoke-virtual {v0, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 477
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/internal/telephony/WapPushOverSms;->mPushOrigAddr:Ljava/lang/String;

    if-eqz v6, :cond_4ef

    .line 478
    const-string v6, "origaddr"

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/android/internal/telephony/WapPushOverSms;->mPushOrigAddr:Ljava/lang/String;

    move-object/from16 v0, v29

    invoke-virtual {v0, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 484
    :cond_4ef
    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/android/internal/telephony/WapPushOverSms;->mContext:Landroid/content/Context;

    const/4 v7, 0x1

    invoke-static {v6, v7}, Lcom/android/internal/telephony/SmsApplication;->getDefaultMmsApplication(Landroid/content/Context;Z)Landroid/content/ComponentName;

    move-result-object v18

    .line 485
    .local v18, componentName:Landroid/content/ComponentName;
    if-eqz v18, :cond_52b

    .line 487
    move-object/from16 v0, v29

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 488
    const-string v6, "WAP PUSH"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Delivering MMS to: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual/range {v18 .. v18}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual/range {v18 .. v18}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 492
    :cond_52b
    move-object/from16 v0, p3

    move-object/from16 v1, v29

    move-object/from16 v2, v35

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v15, v3}, Lcom/android/internal/telephony/InboundSmsHandler;->dispatchIntent(Landroid/content/Intent;Ljava/lang/String;ILandroid/content/BroadcastReceiver;)V

    .line 493
    const/4 v6, -0x1

    goto/16 :goto_b3

    .line 463
    .end local v15           #appOp:I
    .end local v18           #componentName:Landroid/content/ComponentName;
    .end local v29           #intent:Landroid/content/Intent;
    .end local v35           #permission:Ljava/lang/String;
    :cond_539
    const-string v35, "android.permission.RECEIVE_WAP_PUSH"
    :try_end_53b
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_468 .. :try_end_53b} :catch_3df

    .line 464
    .restart local v35       #permission:Ljava/lang/String;
    const/16 v15, 0x13

    .restart local v15       #appOp:I
    goto/16 :goto_490

    .line 494
    .end local v11           #headerLength:I
    .end local v15           #appOp:I
    .end local v16           #binaryContentType:J
    .end local v21           #dispatchedByApplication:Z
    .end local v24           #header:[B
    .end local v25           #headerStartIndex:I
    .end local v26           #iBinaryContentType:I
    .end local v27           #index:I
    .end local v30           #intentData:[B
    .end local v31           #mimeType:Ljava/lang/String;
    .end local v33           #pduDecoder:Lcom/android/internal/telephony/WspTypeDecoder;
    .end local v34           #pduType:I
    .end local v35           #permission:Ljava/lang/String;
    .end local v38           #transactionId:I
    .restart local v28       #index:I
    :catch_53f
    move-exception v14

    move/from16 v27, v28

    .end local v28           #index:I
    .restart local v27       #index:I
    goto/16 :goto_3e0

    .line 204
    :sswitch_data_544
    .sparse-switch
        0x2e -> :sswitch_16d
        0x30 -> :sswitch_170
        0x32 -> :sswitch_173
        0x36 -> :sswitch_185
        0x3e -> :sswitch_176
        0x42 -> :sswitch_188
        0x43 -> :sswitch_18b
        0x44 -> :sswitch_17f
        0x4a -> :sswitch_13d
        0x4b -> :sswitch_16a
        0x4e -> :sswitch_182
        0xce -> :sswitch_182
        0x30a -> :sswitch_18e
        0x310 -> :sswitch_17c
        0x312 -> :sswitch_179
    .end sparse-switch

    .line 340
    :sswitch_data_582
    .sparse-switch
        0x2e -> :sswitch_30b
        0x32 -> :sswitch_2d3
        0x36 -> :sswitch_30b
        0x3e -> :sswitch_2e7
        0x42 -> :sswitch_30b
        0x43 -> :sswitch_30b
        0x44 -> :sswitch_2fb
        0x4e -> :sswitch_30e
        0xce -> :sswitch_30e
    .end sparse-switch
.end method

.method public dispatchWapPushAddress(Ljava/lang/String;)V
    .registers 3
    .parameter "OrigAddr"

    .prologue
    .line 504
    if-eqz p1, :cond_5

    .line 505
    iput-object p1, p0, Lcom/android/internal/telephony/WapPushOverSms;->mPushOrigAddr:Ljava/lang/String;

    .line 509
    :goto_4
    return-void

    .line 507
    :cond_5
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/telephony/WapPushOverSms;->mPushOrigAddr:Ljava/lang/String;

    goto :goto_4
.end method

.method dispose()V
    .registers 3

    .prologue
    .line 106
    iget-object v0, p0, Lcom/android/internal/telephony/WapPushOverSms;->mWapPushManager:Lcom/android/internal/telephony/IWapPushManager;

    if-eqz v0, :cond_11

    .line 107
    const-string v0, "WAP PUSH"

    const-string v1, "dispose: unbind wappush manager"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    iget-object v0, p0, Lcom/android/internal/telephony/WapPushOverSms;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p0}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 112
    :goto_10
    return-void

    .line 110
    :cond_11
    const-string v0, "WAP PUSH"

    const-string v1, "dispose: not bound to a wappush manager"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_10
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .registers 6
    .parameter "name"
    .parameter "service"

    .prologue
    .line 79
    invoke-static {p2}, Lcom/android/internal/telephony/IWapPushManager$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/IWapPushManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/telephony/WapPushOverSms;->mWapPushManager:Lcom/android/internal/telephony/IWapPushManager;

    .line 80
    const-string v0, "WAP PUSH"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "wappush manager connected to "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .registers 4
    .parameter "name"

    .prologue
    .line 85
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/telephony/WapPushOverSms;->mWapPushManager:Lcom/android/internal/telephony/IWapPushManager;

    .line 86
    const-string v0, "WAP PUSH"

    const-string v1, "wappush manager disconnected."

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    return-void
.end method

.method public setWpaPushAddressTimeStamp(Ljava/lang/String;J)V
    .registers 5
    .parameter "wapPushAddress"
    .parameter "wapPushTimeStamp"

    .prologue
    .line 641
    iput-object p1, p0, Lcom/android/internal/telephony/WapPushOverSms;->mWapPushAddress:Ljava/lang/String;

    .line 642
    invoke-static {p2, p3}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/telephony/WapPushOverSms;->mWapPushTimeStamp:Ljava/lang/String;

    .line 643
    return-void
.end method
