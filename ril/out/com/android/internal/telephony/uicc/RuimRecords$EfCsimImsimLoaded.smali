.class Lcom/android/internal/telephony/uicc/RuimRecords$EfCsimImsimLoaded;
.super Ljava/lang/Object;
.source "RuimRecords.java"

# interfaces
.implements Lcom/android/internal/telephony/uicc/IccRecords$IccRecordLoaded;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/uicc/RuimRecords;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EfCsimImsimLoaded"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/telephony/uicc/RuimRecords;


# direct methods
.method private constructor <init>(Lcom/android/internal/telephony/uicc/RuimRecords;)V
    .registers 2
    .parameter

    .prologue
    .line 494
    iput-object p1, p0, Lcom/android/internal/telephony/uicc/RuimRecords$EfCsimImsimLoaded;->this$0:Lcom/android/internal/telephony/uicc/RuimRecords;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/internal/telephony/uicc/RuimRecords;Lcom/android/internal/telephony/uicc/RuimRecords$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 494
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/uicc/RuimRecords$EfCsimImsimLoaded;-><init>(Lcom/android/internal/telephony/uicc/RuimRecords;)V

    return-void
.end method


# virtual methods
.method public getEfName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 497
    const-string v0, "EF_CSIM_IMSIM"

    return-object v0
.end method

.method public onRecordLoaded(Landroid/os/AsyncResult;)V
    .registers 15
    .parameter "ar"

    .prologue
    const/4 v12, 0x4

    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 502
    iget-object v7, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v7, [B

    move-object v1, v7

    check-cast v1, [B

    .line 503
    .local v1, data:[B
    const-string v7, "CRI"

    const-string v10, "OPEN"

    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_38

    .line 504
    iget-object v7, p0, Lcom/android/internal/telephony/uicc/RuimRecords$EfCsimImsimLoaded;->this$0:Lcom/android/internal/telephony/uicc/RuimRecords;

    #setter for: Lcom/android/internal/telephony/uicc/RuimRecords;->mImsiMdata:[B
    invoke-static {v7, v1}, Lcom/android/internal/telephony/uicc/RuimRecords;->access$502(Lcom/android/internal/telephony/uicc/RuimRecords;[B)[B

    .line 505
    iget-object v7, p0, Lcom/android/internal/telephony/uicc/RuimRecords$EfCsimImsimLoaded;->this$0:Lcom/android/internal/telephony/uicc/RuimRecords;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "CSIM_IMSI_M mImsiMdata Length="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/android/internal/telephony/uicc/RuimRecords$EfCsimImsimLoaded;->this$0:Lcom/android/internal/telephony/uicc/RuimRecords;

    #getter for: Lcom/android/internal/telephony/uicc/RuimRecords;->mImsiMdata:[B
    invoke-static {v11}, Lcom/android/internal/telephony/uicc/RuimRecords;->access$500(Lcom/android/internal/telephony/uicc/RuimRecords;)[B

    move-result-object v11

    array-length v11, v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Lcom/android/internal/telephony/uicc/RuimRecords;->log(Ljava/lang/String;)V

    .line 507
    :cond_38
    invoke-static {}, Lcom/android/internal/telephony/uicc/RuimRecords;->access$100()Z

    move-result v7

    if-nez v7, :cond_5a

    iget-object v7, p0, Lcom/android/internal/telephony/uicc/RuimRecords$EfCsimImsimLoaded;->this$0:Lcom/android/internal/telephony/uicc/RuimRecords;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "CSIM_IMSIM="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-static {v1}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Lcom/android/internal/telephony/uicc/RuimRecords;->log(Ljava/lang/String;)V

    .line 510
    :cond_5a
    const/4 v7, 0x7

    aget-byte v7, v1, v7

    and-int/lit16 v7, v7, 0x80

    const/16 v10, 0x80

    if-ne v7, v10, :cond_12a

    move v5, v8

    .line 512
    .local v5, provisioned:Z
    :goto_64
    if-eqz v5, :cond_12d

    .line 513
    const/4 v7, 0x2

    aget-byte v7, v1, v7

    and-int/lit8 v7, v7, 0x3

    shl-int/lit8 v7, v7, 0x8

    aget-byte v10, v1, v8

    and-int/lit16 v10, v10, 0xff

    add-int v3, v7, v10

    .line 514
    .local v3, first3digits:I
    const/4 v7, 0x5

    aget-byte v7, v1, v7

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x8

    aget-byte v10, v1, v12

    and-int/lit16 v10, v10, 0xff

    or-int/2addr v7, v10

    shr-int/lit8 v6, v7, 0x6

    .line 515
    .local v6, second3digits:I
    aget-byte v7, v1, v12

    shr-int/lit8 v7, v7, 0x2

    and-int/lit8 v2, v7, 0xf

    .line 516
    .local v2, digit7:I
    const/16 v7, 0x9

    if-le v2, v7, :cond_8c

    const/4 v2, 0x0

    .line 517
    :cond_8c
    aget-byte v7, v1, v12

    and-int/lit8 v7, v7, 0x3

    shl-int/lit8 v7, v7, 0x8

    const/4 v10, 0x3

    aget-byte v10, v1, v10

    and-int/lit16 v10, v10, 0xff

    or-int v4, v7, v10

    .line 518
    .local v4, last3digits:I
    iget-object v7, p0, Lcom/android/internal/telephony/uicc/RuimRecords$EfCsimImsimLoaded;->this$0:Lcom/android/internal/telephony/uicc/RuimRecords;

    #calls: Lcom/android/internal/telephony/uicc/RuimRecords;->adjstMinDigits(I)I
    invoke-static {v7, v3}, Lcom/android/internal/telephony/uicc/RuimRecords;->access$600(Lcom/android/internal/telephony/uicc/RuimRecords;I)I

    move-result v3

    .line 519
    iget-object v7, p0, Lcom/android/internal/telephony/uicc/RuimRecords$EfCsimImsimLoaded;->this$0:Lcom/android/internal/telephony/uicc/RuimRecords;

    #calls: Lcom/android/internal/telephony/uicc/RuimRecords;->adjstMinDigits(I)I
    invoke-static {v7, v6}, Lcom/android/internal/telephony/uicc/RuimRecords;->access$600(Lcom/android/internal/telephony/uicc/RuimRecords;I)I

    move-result v6

    .line 520
    iget-object v7, p0, Lcom/android/internal/telephony/uicc/RuimRecords$EfCsimImsimLoaded;->this$0:Lcom/android/internal/telephony/uicc/RuimRecords;

    #calls: Lcom/android/internal/telephony/uicc/RuimRecords;->adjstMinDigits(I)I
    invoke-static {v7, v4}, Lcom/android/internal/telephony/uicc/RuimRecords;->access$600(Lcom/android/internal/telephony/uicc/RuimRecords;I)I

    move-result v4

    .line 522
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 523
    .local v0, builder:Ljava/lang/StringBuilder;
    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "%03d"

    new-array v11, v8, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v9

    invoke-static {v7, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 524
    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "%03d"

    new-array v11, v8, [Ljava/lang/Object;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v9

    invoke-static {v7, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 525
    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "%d"

    new-array v11, v8, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v9

    invoke-static {v7, v10, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 526
    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v10, "%03d"

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v8, v9

    invoke-static {v7, v10, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 527
    iget-object v7, p0, Lcom/android/internal/telephony/uicc/RuimRecords$EfCsimImsimLoaded;->this$0:Lcom/android/internal/telephony/uicc/RuimRecords;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    #setter for: Lcom/android/internal/telephony/uicc/RuimRecords;->mMin:Ljava/lang/String;
    invoke-static {v7, v8}, Lcom/android/internal/telephony/uicc/RuimRecords;->access$702(Lcom/android/internal/telephony/uicc/RuimRecords;Ljava/lang/String;)Ljava/lang/String;

    .line 528
    invoke-static {}, Lcom/android/internal/telephony/uicc/RuimRecords;->access$100()Z

    move-result v7

    if-nez v7, :cond_129

    iget-object v7, p0, Lcom/android/internal/telephony/uicc/RuimRecords$EfCsimImsimLoaded;->this$0:Lcom/android/internal/telephony/uicc/RuimRecords;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "min present="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/internal/telephony/uicc/RuimRecords$EfCsimImsimLoaded;->this$0:Lcom/android/internal/telephony/uicc/RuimRecords;

    #getter for: Lcom/android/internal/telephony/uicc/RuimRecords;->mMin:Ljava/lang/String;
    invoke-static {v9}, Lcom/android/internal/telephony/uicc/RuimRecords;->access$700(Lcom/android/internal/telephony/uicc/RuimRecords;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/android/internal/telephony/uicc/RuimRecords;->log(Ljava/lang/String;)V

    .line 535
    .end local v0           #builder:Ljava/lang/StringBuilder;
    .end local v2           #digit7:I
    .end local v3           #first3digits:I
    .end local v4           #last3digits:I
    .end local v6           #second3digits:I
    :cond_129
    :goto_129
    return-void

    .end local v5           #provisioned:Z
    :cond_12a
    move v5, v9

    .line 510
    goto/16 :goto_64

    .line 530
    .restart local v5       #provisioned:Z
    :cond_12d
    iget-object v7, p0, Lcom/android/internal/telephony/uicc/RuimRecords$EfCsimImsimLoaded;->this$0:Lcom/android/internal/telephony/uicc/RuimRecords;

    const-string v8, "min not present"

    invoke-virtual {v7, v8}, Lcom/android/internal/telephony/uicc/RuimRecords;->log(Ljava/lang/String;)V

    .line 531
    const-string v7, "USC"

    const-string v8, "OPEN"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_129

    .line 532
    iget-object v7, p0, Lcom/android/internal/telephony/uicc/RuimRecords$EfCsimImsimLoaded;->this$0:Lcom/android/internal/telephony/uicc/RuimRecords;

    const-string v8, "1111110111"

    #setter for: Lcom/android/internal/telephony/uicc/RuimRecords;->mMin:Ljava/lang/String;
    invoke-static {v7, v8}, Lcom/android/internal/telephony/uicc/RuimRecords;->access$702(Lcom/android/internal/telephony/uicc/RuimRecords;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_129
.end method
