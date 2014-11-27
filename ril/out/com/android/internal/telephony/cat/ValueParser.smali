.class abstract Lcom/android/internal/telephony/cat/ValueParser;
.super Ljava/lang/Object;
.source "ValueParser.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static retrieveAddress(Lcom/android/internal/telephony/cat/ComprehensionTlv;)Ljava/lang/String;
    .registers 7
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    .line 321
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v2

    .line 322
    .local v2, rawValue:[B
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v3

    .line 323
    .local v3, valueIndex:I
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getLength()I

    move-result v1

    .line 324
    .local v1, length:I
    if-eqz v1, :cond_1c

    .line 326
    :try_start_e
    invoke-static {v2, v3, v1}, Lcom/android/internal/telephony/uicc/IccUtils;->SetupCallbcdToString([BII)Ljava/lang/String;
    :try_end_11
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_e .. :try_end_11} :catch_13

    move-result-object v4

    .line 332
    :goto_12
    return-object v4

    .line 328
    :catch_13
    move-exception v0

    .line 329
    .local v0, e:Ljava/lang/IndexOutOfBoundsException;
    new-instance v4, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v5, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v4, v5}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v4

    .line 332
    .end local v0           #e:Ljava/lang/IndexOutOfBoundsException;
    :cond_1c
    const/4 v4, 0x0

    goto :goto_12
.end method

.method static retrieveAlphaId(Lcom/android/internal/telephony/cat/ComprehensionTlv;)Ljava/lang/String;
    .registers 11
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 285
    if-eqz p0, :cond_38

    .line 286
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v3

    .line 287
    .local v3, rawValue:[B
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v5

    .line 288
    .local v5, valueIndex:I
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getLength()I

    move-result v1

    .line 289
    .local v1, length:I
    if-eqz v1, :cond_1f

    .line 291
    :try_start_11
    invoke-static {v3, v5, v1}, Lcom/android/internal/telephony/uicc/IccUtils;->adnStringFieldToString([BII)Ljava/lang/String;
    :try_end_14
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_11 .. :try_end_14} :catch_16

    move-result-object v6

    .line 314
    .end local v1           #length:I
    .end local v3           #rawValue:[B
    .end local v5           #valueIndex:I
    :cond_15
    :goto_15
    return-object v6

    .line 293
    .restart local v1       #length:I
    .restart local v3       #rawValue:[B
    .restart local v5       #valueIndex:I
    :catch_16
    move-exception v0

    .line 294
    .local v0, e:Ljava/lang/IndexOutOfBoundsException;
    new-instance v6, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v7, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v6, v7}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v6

    .line 297
    .end local v0           #e:Ljava/lang/IndexOutOfBoundsException;
    :cond_1f
    const-string v7, "ValueParser"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Alpha Id length="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_15

    .line 306
    .end local v1           #length:I
    .end local v3           #rawValue:[B
    .end local v5           #valueIndex:I
    :cond_38
    const/4 v2, 0x0

    .line 307
    .local v2, noAlphaUsrCnf:Z
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v4

    .line 309
    .local v4, resource:Landroid/content/res/Resources;
    const v7, 0x1110065

    :try_start_40
    invoke-virtual {v4, v7}, Landroid/content/res/Resources;->getBoolean(I)Z
    :try_end_43
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_40 .. :try_end_43} :catch_49

    move-result v2

    .line 314
    :goto_44
    if-nez v2, :cond_15

    const-string v6, "Default Message"

    goto :goto_15

    .line 311
    :catch_49
    move-exception v0

    .line 312
    .local v0, e:Landroid/content/res/Resources$NotFoundException;
    const/4 v2, 0x0

    goto :goto_44
.end method

.method static retrieveBearerDescription(Lcom/android/internal/telephony/cat/ComprehensionTlv;)Lcom/android/internal/telephony/cat/BearerDescription;
    .registers 11
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 729
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v3

    .line 730
    .local v3, rawValue:[B
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v4

    .line 731
    .local v4, valueIndex:I
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getLength()I

    move-result v2

    .line 733
    .local v2, length:I
    new-instance v0, Lcom/android/internal/telephony/cat/BearerDescription;

    invoke-direct {v0}, Lcom/android/internal/telephony/cat/BearerDescription;-><init>()V

    .line 735
    .local v0, bearerDesc:Lcom/android/internal/telephony/cat/BearerDescription;
    add-int/lit8 v5, v4, 0x1

    .end local v4           #valueIndex:I
    .local v5, valueIndex:I
    :try_start_14
    aget-byte v7, v3, v4

    iput-byte v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerType:B

    .line 736
    const-string v7, "ValueParser"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "retrieveBearerDescription: Bearer Type = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-byte v9, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerType:B

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 737
    iget-byte v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerType:B

    packed-switch v7, :pswitch_data_122

    .line 781
    :pswitch_37
    const-string v7, "ValueParser"

    const-string v8, "retrieveBearerDescription: Bearer Type not Supported"

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 782
    const-string v7, "ValueParser"

    const-string v8, "retrieveBearerDescription: BearerDescription is not among the five"

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    move v4, v5

    .line 793
    .end local v0           #bearerDesc:Lcom/android/internal/telephony/cat/BearerDescription;
    .end local v5           #valueIndex:I
    .restart local v4       #valueIndex:I
    :goto_46
    return-object v0

    .line 739
    .end local v4           #valueIndex:I
    .restart local v0       #bearerDesc:Lcom/android/internal/telephony/cat/BearerDescription;
    .restart local v5       #valueIndex:I
    :pswitch_47
    new-instance v7, Lcom/android/internal/telephony/cat/BearerCSD;

    invoke-direct {v7}, Lcom/android/internal/telephony/cat/BearerCSD;-><init>()V

    iput-object v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerCSD:Lcom/android/internal/telephony/cat/BearerCSD;

    .line 740
    iget-object v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerCSD:Lcom/android/internal/telephony/cat/BearerCSD;
    :try_end_50
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_14 .. :try_end_50} :catch_11d
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_50} :catch_10f

    add-int/lit8 v4, v5, 0x1

    .end local v5           #valueIndex:I
    .restart local v4       #valueIndex:I
    :try_start_52
    aget-byte v8, v3, v5

    iput v8, v7, Lcom/android/internal/telephony/cat/BearerCSD;->dataRate:I

    .line 741
    iget-object v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerCSD:Lcom/android/internal/telephony/cat/BearerCSD;
    :try_end_58
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_52 .. :try_end_58} :catch_74
    .catch Ljava/lang/Exception; {:try_start_52 .. :try_end_58} :catch_11b

    add-int/lit8 v5, v4, 0x1

    .end local v4           #valueIndex:I
    .restart local v5       #valueIndex:I
    :try_start_5a
    aget-byte v8, v3, v4

    iput v8, v7, Lcom/android/internal/telephony/cat/BearerCSD;->bearerService:I

    .line 742
    iget-object v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerCSD:Lcom/android/internal/telephony/cat/BearerCSD;
    :try_end_60
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_5a .. :try_end_60} :catch_11d
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_60} :catch_10f

    add-int/lit8 v4, v5, 0x1

    .end local v5           #valueIndex:I
    .restart local v4       #valueIndex:I
    :try_start_62
    aget-byte v8, v3, v5

    iput v8, v7, Lcom/android/internal/telephony/cat/BearerCSD;->connectionElement:I

    .line 743
    const/4 v7, 0x0

    iput-object v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerGPRS:Lcom/android/internal/telephony/cat/BearerGPRS;

    .line 744
    const/4 v7, 0x0

    iput-boolean v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerDefault:Z

    .line 745
    const-string v7, "ValueParser"

    const-string v8, "retrieveBearerDescription: Bearer Type = CSD"

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_73
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_62 .. :try_end_73} :catch_74
    .catch Ljava/lang/Exception; {:try_start_62 .. :try_end_73} :catch_11b

    goto :goto_46

    .line 787
    :catch_74
    move-exception v1

    .line 788
    .local v1, e:Ljava/lang/IndexOutOfBoundsException;
    :goto_75
    const-string v6, "ValueParser"

    const-string v7, "ResultException: retrieveBearerDescription"

    invoke-static {v6, v7}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 789
    new-instance v6, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v7, Lcom/android/internal/telephony/cat/ResultCode;->REQUIRED_VALUES_MISSING:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v6, v7}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v6

    .line 748
    .end local v1           #e:Ljava/lang/IndexOutOfBoundsException;
    .end local v4           #valueIndex:I
    .restart local v5       #valueIndex:I
    :pswitch_84
    :try_start_84
    new-instance v7, Lcom/android/internal/telephony/cat/BearerGPRS;

    invoke-direct {v7}, Lcom/android/internal/telephony/cat/BearerGPRS;-><init>()V

    iput-object v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerGPRS:Lcom/android/internal/telephony/cat/BearerGPRS;

    .line 749
    iget-object v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerGPRS:Lcom/android/internal/telephony/cat/BearerGPRS;
    :try_end_8d
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_84 .. :try_end_8d} :catch_11d
    .catch Ljava/lang/Exception; {:try_start_84 .. :try_end_8d} :catch_10f

    add-int/lit8 v4, v5, 0x1

    .end local v5           #valueIndex:I
    .restart local v4       #valueIndex:I
    :try_start_8f
    aget-byte v8, v3, v5

    iput v8, v7, Lcom/android/internal/telephony/cat/BearerGPRS;->precedenceClass:I

    .line 750
    iget-object v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerGPRS:Lcom/android/internal/telephony/cat/BearerGPRS;
    :try_end_95
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_8f .. :try_end_95} :catch_74
    .catch Ljava/lang/Exception; {:try_start_8f .. :try_end_95} :catch_11b

    add-int/lit8 v5, v4, 0x1

    .end local v4           #valueIndex:I
    .restart local v5       #valueIndex:I
    :try_start_97
    aget-byte v8, v3, v4

    iput v8, v7, Lcom/android/internal/telephony/cat/BearerGPRS;->delayClass:I

    .line 751
    iget-object v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerGPRS:Lcom/android/internal/telephony/cat/BearerGPRS;
    :try_end_9d
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_97 .. :try_end_9d} :catch_11d
    .catch Ljava/lang/Exception; {:try_start_97 .. :try_end_9d} :catch_10f

    add-int/lit8 v4, v5, 0x1

    .end local v5           #valueIndex:I
    .restart local v4       #valueIndex:I
    :try_start_9f
    aget-byte v8, v3, v5

    iput v8, v7, Lcom/android/internal/telephony/cat/BearerGPRS;->reliabilityClass:I

    .line 752
    iget-object v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerGPRS:Lcom/android/internal/telephony/cat/BearerGPRS;
    :try_end_a5
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_9f .. :try_end_a5} :catch_74
    .catch Ljava/lang/Exception; {:try_start_9f .. :try_end_a5} :catch_11b

    add-int/lit8 v5, v4, 0x1

    .end local v4           #valueIndex:I
    .restart local v5       #valueIndex:I
    :try_start_a7
    aget-byte v8, v3, v4

    iput v8, v7, Lcom/android/internal/telephony/cat/BearerGPRS;->peakThroughputClass:I

    .line 753
    iget-object v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerGPRS:Lcom/android/internal/telephony/cat/BearerGPRS;
    :try_end_ad
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_a7 .. :try_end_ad} :catch_11d
    .catch Ljava/lang/Exception; {:try_start_a7 .. :try_end_ad} :catch_10f

    add-int/lit8 v4, v5, 0x1

    .end local v5           #valueIndex:I
    .restart local v4       #valueIndex:I
    :try_start_af
    aget-byte v8, v3, v5

    iput v8, v7, Lcom/android/internal/telephony/cat/BearerGPRS;->meanThroughputClass:I

    .line 754
    iget-object v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerGPRS:Lcom/android/internal/telephony/cat/BearerGPRS;
    :try_end_b5
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_af .. :try_end_b5} :catch_74
    .catch Ljava/lang/Exception; {:try_start_af .. :try_end_b5} :catch_11b

    add-int/lit8 v5, v4, 0x1

    .end local v4           #valueIndex:I
    .restart local v5       #valueIndex:I
    :try_start_b7
    aget-byte v8, v3, v4

    iput v8, v7, Lcom/android/internal/telephony/cat/BearerGPRS;->packetDataProtocolType:I

    .line 755
    const/4 v7, 0x0

    iput-object v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerCSD:Lcom/android/internal/telephony/cat/BearerCSD;

    .line 756
    const/4 v7, 0x0

    iput-boolean v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerDefault:Z

    .line 757
    const-string v7, "ValueParser"

    const-string v8, "retrieveBearerDescription: Bearer Type = GPRS"

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    move v4, v5

    .line 758
    .end local v5           #valueIndex:I
    .restart local v4       #valueIndex:I
    goto/16 :goto_46

    .line 760
    .end local v4           #valueIndex:I
    .restart local v5       #valueIndex:I
    :pswitch_cb
    const/4 v7, 0x3

    iput-byte v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerType:B

    .line 761
    const/4 v7, 0x0

    iput-object v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerGPRS:Lcom/android/internal/telephony/cat/BearerGPRS;

    .line 762
    const/4 v7, 0x0

    iput-object v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerCSD:Lcom/android/internal/telephony/cat/BearerCSD;

    .line 763
    const/4 v7, 0x1

    iput-boolean v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerDefault:Z

    .line 764
    const-string v7, "ValueParser"

    const-string v8, "retrieveBearerDescription: Bearer Type = Default"

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    move v4, v5

    .line 765
    .end local v5           #valueIndex:I
    .restart local v4       #valueIndex:I
    goto/16 :goto_46

    .line 767
    .end local v4           #valueIndex:I
    .restart local v5       #valueIndex:I
    :pswitch_e1
    const/16 v7, 0xb

    iput-byte v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerType:B

    .line 768
    const/4 v7, 0x0

    iput-object v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerGPRS:Lcom/android/internal/telephony/cat/BearerGPRS;

    .line 769
    const/4 v7, 0x0

    iput-object v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerCSD:Lcom/android/internal/telephony/cat/BearerCSD;

    .line 770
    const/4 v7, 0x0

    iput-boolean v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerDefault:Z

    .line 771
    const-string v7, "ValueParser"

    const-string v8, "retrieveBearerDescription: Bearer Type = BEARER_E_UTRAN"

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    move v4, v5

    .line 772
    .end local v5           #valueIndex:I
    .restart local v4       #valueIndex:I
    goto/16 :goto_46

    .line 774
    .end local v4           #valueIndex:I
    .restart local v5       #valueIndex:I
    :pswitch_f8
    const/16 v7, 0x8

    iput-byte v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerType:B

    .line 775
    const/4 v7, 0x0

    iput-object v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerGPRS:Lcom/android/internal/telephony/cat/BearerGPRS;

    .line 776
    const/4 v7, 0x0

    iput-object v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerCSD:Lcom/android/internal/telephony/cat/BearerCSD;

    .line 777
    const/4 v7, 0x0

    iput-boolean v7, v0, Lcom/android/internal/telephony/cat/BearerDescription;->bearerDefault:Z

    .line 778
    const-string v7, "ValueParser"

    const-string v8, "retrieveBearerDescription: Bearer Type = BEARER_CDMA"

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_10c
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_b7 .. :try_end_10c} :catch_11d
    .catch Ljava/lang/Exception; {:try_start_b7 .. :try_end_10c} :catch_10f

    move v4, v5

    .line 779
    .end local v5           #valueIndex:I
    .restart local v4       #valueIndex:I
    goto/16 :goto_46

    .line 790
    .end local v4           #valueIndex:I
    .restart local v5       #valueIndex:I
    :catch_10f
    move-exception v1

    move v4, v5

    .line 791
    .end local v5           #valueIndex:I
    .local v1, e:Ljava/lang/Exception;
    .restart local v4       #valueIndex:I
    :goto_111
    const-string v7, "ValueParser"

    const-string v8, "Unknown ResultException in retrieveBearerDescription: "

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v6

    .line 793
    goto/16 :goto_46

    .line 790
    .end local v1           #e:Ljava/lang/Exception;
    :catch_11b
    move-exception v1

    goto :goto_111

    .line 787
    .end local v4           #valueIndex:I
    .restart local v5       #valueIndex:I
    :catch_11d
    move-exception v1

    move v4, v5

    .end local v5           #valueIndex:I
    .restart local v4       #valueIndex:I
    goto/16 :goto_75

    .line 737
    nop

    :pswitch_data_122
    .packed-switch 0x1
        :pswitch_47
        :pswitch_84
        :pswitch_cb
        :pswitch_37
        :pswitch_37
        :pswitch_37
        :pswitch_37
        :pswitch_f8
        :pswitch_37
        :pswitch_37
        :pswitch_e1
    .end packed-switch
.end method

.method static retrieveBufferSize(Lcom/android/internal/telephony/cat/ComprehensionTlv;)I
    .registers 11
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    .line 807
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v3

    .line 808
    .local v3, rawValue:[B
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v6

    .line 809
    .local v6, valueIndex:I
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getLength()I

    move-result v2

    .line 810
    .local v2, length:I
    const-string v7, "ValueParser"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "retrieveBufferSize: valueIndex , Length = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " , "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 812
    :try_start_2e
    aget-byte v7, v3, v6

    and-int/lit16 v1, v7, 0xff

    .line 813
    .local v1, firstByte:I
    add-int/lit8 v7, v6, 0x1

    aget-byte v7, v3, v7

    and-int/lit16 v5, v7, 0xff

    .line 814
    .local v5, secondByte:I
    shl-int/lit8 v7, v1, 0x8

    or-int v4, v7, v5

    .line 815
    .local v4, resultByte:I
    const-string v7, "ValueParser"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "retrieveBufferSize: buffer size = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_54
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_2e .. :try_end_54} :catch_55
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_54} :catch_65

    .line 824
    .end local v1           #firstByte:I
    .end local v4           #resultByte:I
    .end local v5           #secondByte:I
    :goto_54
    return v4

    .line 818
    :catch_55
    move-exception v0

    .line 819
    .local v0, e:Ljava/lang/IndexOutOfBoundsException;
    const-string v7, "ValueParser"

    const-string v8, "ResultException: retrieveBufferSize"

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 820
    new-instance v7, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v8, Lcom/android/internal/telephony/cat/ResultCode;->REQUIRED_VALUES_MISSING:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v7, v8}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v7

    .line 821
    .end local v0           #e:Ljava/lang/IndexOutOfBoundsException;
    :catch_65
    move-exception v0

    .line 822
    .local v0, e:Ljava/lang/Exception;
    const-string v7, "ValueParser"

    const-string v8, "Unknown ResultException in retrieveBufferSize: "

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 824
    const/4 v4, -0x1

    goto :goto_54
.end method

.method static retrieveChannelData(Lcom/android/internal/telephony/cat/ComprehensionTlv;)[B
    .registers 11
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    .line 993
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v3

    .line 994
    .local v3, rawValue:[B
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v5

    .line 995
    .local v5, valueIndex:I
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getLength()I

    move-result v2

    .line 997
    .local v2, length:I
    const-string v7, "ValueParser"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "retrieveChannelData : value Index , length "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " , "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 999
    :try_start_2e
    const-string v7, "ValueParser"

    const-string v8, "retrieveChannelData: beginning Byte array copy"

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1000
    new-array v4, v2, [B

    .line 1001
    .local v4, tempChannelData:[B
    const/4 v1, 0x0

    .local v1, i:I
    move v6, v5

    .end local v5           #valueIndex:I
    .local v6, valueIndex:I
    :goto_39
    if-ge v1, v2, :cond_45

    .line 1002
    add-int/lit8 v5, v6, 0x1

    .end local v6           #valueIndex:I
    .restart local v5       #valueIndex:I
    aget-byte v7, v3, v6

    aput-byte v7, v4, v1
    :try_end_41
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_2e .. :try_end_41} :catch_69
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_41} :catch_79

    .line 1001
    add-int/lit8 v1, v1, 0x1

    move v6, v5

    .end local v5           #valueIndex:I
    .restart local v6       #valueIndex:I
    goto :goto_39

    .line 1005
    :cond_45
    :try_start_45
    const-string v7, "ValueParser"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "retrieveChannelData: tempChannelData = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v4}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " Byte Array Copy Complete"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_67
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_45 .. :try_end_67} :catch_86
    .catch Ljava/lang/Exception; {:try_start_45 .. :try_end_67} :catch_83

    move v5, v6

    .line 1013
    .end local v1           #i:I
    .end local v4           #tempChannelData:[B
    .end local v6           #valueIndex:I
    .restart local v5       #valueIndex:I
    :goto_68
    return-object v4

    .line 1007
    :catch_69
    move-exception v0

    .line 1008
    .local v0, e:Ljava/lang/IndexOutOfBoundsException;
    :goto_6a
    const-string v7, "ValueParser"

    const-string v8, "ResultException: retrieveChannelData"

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1009
    new-instance v7, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v8, Lcom/android/internal/telephony/cat/ResultCode;->REQUIRED_VALUES_MISSING:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v7, v8}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v7

    .line 1010
    .end local v0           #e:Ljava/lang/IndexOutOfBoundsException;
    :catch_79
    move-exception v0

    .line 1011
    .local v0, e:Ljava/lang/Exception;
    :goto_7a
    const-string v7, "ValueParser"

    const-string v8, "Unknown ResultException in retrieveChannelData: "

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 1013
    const/4 v4, 0x0

    goto :goto_68

    .line 1010
    .end local v0           #e:Ljava/lang/Exception;
    .end local v5           #valueIndex:I
    .restart local v1       #i:I
    .restart local v4       #tempChannelData:[B
    .restart local v6       #valueIndex:I
    :catch_83
    move-exception v0

    move v5, v6

    .end local v6           #valueIndex:I
    .restart local v5       #valueIndex:I
    goto :goto_7a

    .line 1007
    .end local v5           #valueIndex:I
    .restart local v6       #valueIndex:I
    :catch_86
    move-exception v0

    move v5, v6

    .end local v6           #valueIndex:I
    .restart local v5       #valueIndex:I
    goto :goto_6a
.end method

.method static retrieveChannelDataLength(Lcom/android/internal/telephony/cat/ComprehensionTlv;)B
    .registers 8
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    .line 968
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v2

    .line 969
    .local v2, rawValue:[B
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v3

    .line 970
    .local v3, valueIndex:I
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getLength()I

    move-result v1

    .line 971
    .local v1, length:I
    const-string v4, "ValueParser"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "retrieveChannelDataLength: valueIndex , Length = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " , "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 973
    :try_start_2e
    aget-byte v4, v2, v3
    :try_end_30
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_2e .. :try_end_30} :catch_34
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_30} :catch_44

    and-int/lit16 v4, v4, 0xff

    int-to-byte v4, v4

    .line 980
    :goto_33
    return v4

    .line 974
    :catch_34
    move-exception v0

    .line 975
    .local v0, e:Ljava/lang/IndexOutOfBoundsException;
    const-string v4, "ValueParser"

    const-string v5, " ResultException: retrieveChannelDataLength"

    invoke-static {v4, v5}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 976
    new-instance v4, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v5, Lcom/android/internal/telephony/cat/ResultCode;->REQUIRED_VALUES_MISSING:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v4, v5}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v4

    .line 977
    .end local v0           #e:Ljava/lang/IndexOutOfBoundsException;
    :catch_44
    move-exception v0

    .line 978
    .local v0, e:Ljava/lang/Exception;
    const-string v4, "ValueParser"

    const-string v5, "Unknown ResultException in retrieveChannelDataLength: "

    invoke-static {v4, v5}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 980
    const/4 v4, 0x0

    goto :goto_33
.end method

.method static retrieveCommandDetails(Lcom/android/internal/telephony/cat/ComprehensionTlv;)Lcom/android/internal/telephony/cat/CommandDetails;
    .registers 7
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    .line 49
    new-instance v0, Lcom/android/internal/telephony/cat/CommandDetails;

    invoke-direct {v0}, Lcom/android/internal/telephony/cat/CommandDetails;-><init>()V

    .line 50
    .local v0, cmdDet:Lcom/android/internal/telephony/cat/CommandDetails;
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v2

    .line 51
    .local v2, rawValue:[B
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v3

    .line 53
    .local v3, valueIndex:I
    :try_start_d
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->isComprehensionRequired()Z

    move-result v4

    iput-boolean v4, v0, Lcom/android/internal/telephony/cat/CommandDetails;->compRequired:Z

    .line 54
    aget-byte v4, v2, v3

    and-int/lit16 v4, v4, 0xff

    iput v4, v0, Lcom/android/internal/telephony/cat/CommandDetails;->commandNumber:I

    .line 55
    add-int/lit8 v4, v3, 0x1

    aget-byte v4, v2, v4

    and-int/lit16 v4, v4, 0xff

    iput v4, v0, Lcom/android/internal/telephony/cat/CommandDetails;->typeOfCommand:I

    .line 56
    add-int/lit8 v4, v3, 0x2

    aget-byte v4, v2, v4

    and-int/lit16 v4, v4, 0xff

    iput v4, v0, Lcom/android/internal/telephony/cat/CommandDetails;->commandQualifier:I
    :try_end_29
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_d .. :try_end_29} :catch_2a

    .line 57
    return-object v0

    .line 58
    :catch_2a
    move-exception v1

    .line 59
    .local v1, e:Ljava/lang/IndexOutOfBoundsException;
    new-instance v4, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v5, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v4, v5}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v4
.end method

.method static retrieveDTMFstring(Lcom/android/internal/telephony/cat/ComprehensionTlv;)[B
    .registers 9
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    .line 392
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v3

    .line 393
    .local v3, rawValue:[B
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v4

    .line 394
    .local v4, valueIndex:I
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getLength()I

    move-result v2

    .line 396
    .local v2, length:I
    if-eqz v2, :cond_28

    .line 397
    add-int/lit8 v6, v2, 0x1

    new-array v0, v6, [B

    .line 398
    .local v0, dtmfString:[B
    const/4 v6, 0x0

    int-to-byte v7, v2

    aput-byte v7, v0, v6

    .line 399
    const/4 v1, 0x0

    .local v1, i:I
    move v5, v4

    .end local v4           #valueIndex:I
    .local v5, valueIndex:I
    :goto_18
    if-ge v1, v2, :cond_26

    .line 400
    add-int/lit8 v6, v1, 0x1

    add-int/lit8 v4, v5, 0x1

    .end local v5           #valueIndex:I
    .restart local v4       #valueIndex:I
    aget-byte v7, v3, v5

    aput-byte v7, v0, v6

    .line 399
    add-int/lit8 v1, v1, 0x1

    move v5, v4

    .end local v4           #valueIndex:I
    .restart local v5       #valueIndex:I
    goto :goto_18

    :cond_26
    move v4, v5

    .line 404
    .end local v0           #dtmfString:[B
    .end local v1           #i:I
    .end local v5           #valueIndex:I
    .restart local v4       #valueIndex:I
    :goto_27
    return-object v0

    :cond_28
    const/4 v0, 0x0

    goto :goto_27
.end method

.method static retrieveDataDestinationAddress(Lcom/android/internal/telephony/cat/ComprehensionTlv;)Lcom/android/internal/telephony/cat/DataDestinationAddress;
    .registers 14
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x0

    .line 868
    new-instance v1, Lcom/android/internal/telephony/cat/DataDestinationAddress;

    invoke-direct {v1}, Lcom/android/internal/telephony/cat/DataDestinationAddress;-><init>()V

    .line 869
    .local v1, dataDestinationAddress:Lcom/android/internal/telephony/cat/DataDestinationAddress;
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v5

    .line 870
    .local v5, rawValue:[B
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v7

    .line 871
    .local v7, valueIndex:I
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getLength()I

    move-result v10

    add-int/lit8 v4, v10, -0x1

    .line 872
    .local v4, length:I
    const-string v10, "ValueParser"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "retrieveDataDestinationAddress: valueIndex , Length = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " , "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 873
    if-gtz v4, :cond_41

    .line 874
    const-string v10, "ValueParser"

    const-string v11, "retrieveDataDestinationAddress: Length is 00. Supply Dynamic IP"

    invoke-static {v10, v11}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    move-object v1, v9

    .line 902
    .end local v1           #dataDestinationAddress:Lcom/android/internal/telephony/cat/DataDestinationAddress;
    :goto_40
    return-object v1

    .line 878
    .restart local v1       #dataDestinationAddress:Lcom/android/internal/telephony/cat/DataDestinationAddress;
    :cond_41
    add-int/lit8 v8, v7, 0x1

    .end local v7           #valueIndex:I
    .local v8, valueIndex:I
    :try_start_43
    aget-byte v10, v5, v7

    iput-byte v10, v1, Lcom/android/internal/telephony/cat/DataDestinationAddress;->addressType:B

    .line 879
    const-string v10, "ValueParser"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "retrieveDataDestinationAddress: Address Type = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    iget-byte v12, v1, Lcom/android/internal/telephony/cat/DataDestinationAddress;->addressType:B

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " beginning Byte array copy"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 880
    new-array v6, v4, [B
    :try_end_69
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_43 .. :try_end_69} :catch_c6
    .catch Ljava/net/UnknownHostException; {:try_start_43 .. :try_end_69} :catch_d7
    .catch Ljava/lang/Exception; {:try_start_43 .. :try_end_69} :catch_e8

    .line 882
    .local v6, tempDataDestAddress:[B
    const/4 v3, 0x0

    .local v3, i:I
    :goto_6a
    if-ge v3, v4, :cond_90

    .line 883
    add-int/lit8 v7, v8, 0x1

    .end local v8           #valueIndex:I
    .restart local v7       #valueIndex:I
    :try_start_6e
    aget-byte v10, v5, v8

    aput-byte v10, v6, v3

    .line 884
    const-string v10, "ValueParser"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, " "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    aget-byte v12, v6, v3

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_8c
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_6e .. :try_end_8c} :catch_f8
    .catch Ljava/net/UnknownHostException; {:try_start_6e .. :try_end_8c} :catch_f6
    .catch Ljava/lang/Exception; {:try_start_6e .. :try_end_8c} :catch_f4

    .line 882
    add-int/lit8 v3, v3, 0x1

    move v8, v7

    .end local v7           #valueIndex:I
    .restart local v8       #valueIndex:I
    goto :goto_6a

    .line 886
    :cond_90
    :try_start_90
    const-string v10, "ValueParser"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "retrieveDataDestinationAddress: tempDataDestAddress = "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {v6}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " Byte array copy complete"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 888
    invoke-static {v6}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v0

    .line 889
    .local v0, add:Ljava/net/InetAddress;
    const-string v10, "ValueParser"

    const-string v11, "retrieveDataDestinationAddress : InetAddress retrieved "

    invoke-static {v10, v11}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 890
    invoke-virtual {v0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v10

    iput-object v10, v1, Lcom/android/internal/telephony/cat/DataDestinationAddress;->address:[B
    :try_end_c3
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_90 .. :try_end_c3} :catch_c6
    .catch Ljava/net/UnknownHostException; {:try_start_90 .. :try_end_c3} :catch_d7
    .catch Ljava/lang/Exception; {:try_start_90 .. :try_end_c3} :catch_e8

    move v7, v8

    .line 892
    .end local v8           #valueIndex:I
    .restart local v7       #valueIndex:I
    goto/16 :goto_40

    .line 893
    .end local v0           #add:Ljava/net/InetAddress;
    .end local v3           #i:I
    .end local v6           #tempDataDestAddress:[B
    .end local v7           #valueIndex:I
    .restart local v8       #valueIndex:I
    :catch_c6
    move-exception v2

    move v7, v8

    .line 894
    .end local v8           #valueIndex:I
    .local v2, e:Ljava/lang/IndexOutOfBoundsException;
    .restart local v7       #valueIndex:I
    :goto_c8
    const-string v9, "ValueParser"

    const-string v10, " ResultException: retrieveDataDestinationAddress - IndexOutOfBoundsException"

    invoke-static {v9, v10}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 895
    new-instance v9, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v10, Lcom/android/internal/telephony/cat/ResultCode;->REQUIRED_VALUES_MISSING:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v9, v10}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v9

    .line 896
    .end local v2           #e:Ljava/lang/IndexOutOfBoundsException;
    .end local v7           #valueIndex:I
    .restart local v8       #valueIndex:I
    :catch_d7
    move-exception v2

    move v7, v8

    .line 897
    .end local v8           #valueIndex:I
    .local v2, e:Ljava/net/UnknownHostException;
    .restart local v7       #valueIndex:I
    :goto_d9
    const-string v9, "ValueParser"

    const-string v10, " ResultException: retrieveDataDestinationAddress - UnknownHostException"

    invoke-static {v9, v10}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 898
    new-instance v9, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v10, Lcom/android/internal/telephony/cat/ResultCode;->REQUIRED_VALUES_MISSING:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v9, v10}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v9

    .line 899
    .end local v2           #e:Ljava/net/UnknownHostException;
    .end local v7           #valueIndex:I
    .restart local v8       #valueIndex:I
    :catch_e8
    move-exception v2

    move v7, v8

    .line 900
    .end local v8           #valueIndex:I
    .local v2, e:Ljava/lang/Exception;
    .restart local v7       #valueIndex:I
    :goto_ea
    const-string v10, "ValueParser"

    const-string v11, "Unknown ResultException in retrieveDataDestinationAddress: "

    invoke-static {v10, v11}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    move-object v1, v9

    .line 902
    goto/16 :goto_40

    .line 899
    .end local v2           #e:Ljava/lang/Exception;
    .restart local v3       #i:I
    .restart local v6       #tempDataDestAddress:[B
    :catch_f4
    move-exception v2

    goto :goto_ea

    .line 896
    :catch_f6
    move-exception v2

    goto :goto_d9

    .line 893
    :catch_f8
    move-exception v2

    goto :goto_c8
.end method

.method static retrieveDeviceIdentities(Lcom/android/internal/telephony/cat/ComprehensionTlv;)Lcom/android/internal/telephony/cat/DeviceIdentities;
    .registers 7
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    .line 74
    new-instance v0, Lcom/android/internal/telephony/cat/DeviceIdentities;

    invoke-direct {v0}, Lcom/android/internal/telephony/cat/DeviceIdentities;-><init>()V

    .line 75
    .local v0, devIds:Lcom/android/internal/telephony/cat/DeviceIdentities;
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v2

    .line 76
    .local v2, rawValue:[B
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v3

    .line 78
    .local v3, valueIndex:I
    :try_start_d
    aget-byte v4, v2, v3

    and-int/lit16 v4, v4, 0xff

    iput v4, v0, Lcom/android/internal/telephony/cat/DeviceIdentities;->sourceId:I

    .line 79
    add-int/lit8 v4, v3, 0x1

    aget-byte v4, v2, v4

    and-int/lit16 v4, v4, 0xff

    iput v4, v0, Lcom/android/internal/telephony/cat/DeviceIdentities;->destinationId:I
    :try_end_1b
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_d .. :try_end_1b} :catch_1c

    .line 80
    return-object v0

    .line 81
    :catch_1c
    move-exception v1

    .line 82
    .local v1, e:Ljava/lang/IndexOutOfBoundsException;
    new-instance v4, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v5, Lcom/android/internal/telephony/cat/ResultCode;->REQUIRED_VALUES_MISSING:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v4, v5}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v4
.end method

.method static retrieveDuration(Lcom/android/internal/telephony/cat/ComprehensionTlv;)Lcom/android/internal/telephony/cat/Duration;
    .registers 8
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    .line 95
    const/4 v2, 0x0

    .line 96
    .local v2, timeInterval:I
    sget-object v3, Lcom/android/internal/telephony/cat/Duration$TimeUnit;->SECOND:Lcom/android/internal/telephony/cat/Duration$TimeUnit;

    .line 98
    .local v3, timeUnit:Lcom/android/internal/telephony/cat/Duration$TimeUnit;
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v1

    .line 99
    .local v1, rawValue:[B
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v4

    .line 102
    .local v4, valueIndex:I
    :try_start_b
    invoke-static {}, Lcom/android/internal/telephony/cat/Duration$TimeUnit;->values()[Lcom/android/internal/telephony/cat/Duration$TimeUnit;

    move-result-object v5

    aget-byte v6, v1, v4

    and-int/lit16 v6, v6, 0xff

    aget-object v3, v5, v6

    .line 103
    add-int/lit8 v5, v4, 0x1

    aget-byte v5, v1, v5
    :try_end_19
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_b .. :try_end_19} :catch_21

    and-int/lit16 v2, v5, 0xff

    .line 107
    new-instance v5, Lcom/android/internal/telephony/cat/Duration;

    invoke-direct {v5, v2, v3}, Lcom/android/internal/telephony/cat/Duration;-><init>(ILcom/android/internal/telephony/cat/Duration$TimeUnit;)V

    return-object v5

    .line 104
    :catch_21
    move-exception v0

    .line 105
    .local v0, e:Ljava/lang/IndexOutOfBoundsException;
    new-instance v5, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v6, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v5, v6}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v5
.end method

.method static retrieveIconId(Lcom/android/internal/telephony/cat/ComprehensionTlv;)Lcom/android/internal/telephony/cat/IconId;
    .registers 8
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    .line 170
    new-instance v1, Lcom/android/internal/telephony/cat/IconId;

    invoke-direct {v1}, Lcom/android/internal/telephony/cat/IconId;-><init>()V

    .line 172
    .local v1, id:Lcom/android/internal/telephony/cat/IconId;
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v2

    .line 173
    .local v2, rawValue:[B
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v3

    .line 175
    .local v3, valueIndex:I
    add-int/lit8 v4, v3, 0x1

    .end local v3           #valueIndex:I
    .local v4, valueIndex:I
    :try_start_f
    aget-byte v5, v2, v3

    and-int/lit16 v5, v5, 0xff

    if-nez v5, :cond_1f

    const/4 v5, 0x1

    :goto_16
    iput-boolean v5, v1, Lcom/android/internal/telephony/cat/IconId;->selfExplanatory:Z

    .line 176
    aget-byte v5, v2, v4

    and-int/lit16 v5, v5, 0xff

    iput v5, v1, Lcom/android/internal/telephony/cat/IconId;->recordNumber:I
    :try_end_1e
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_f .. :try_end_1e} :catch_21

    .line 181
    return-object v1

    .line 175
    :cond_1f
    const/4 v5, 0x0

    goto :goto_16

    .line 177
    :catch_21
    move-exception v0

    .line 178
    .local v0, e:Ljava/lang/IndexOutOfBoundsException;
    new-instance v5, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v6, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v5, v6}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v5
.end method

.method static retrieveItem(Lcom/android/internal/telephony/cat/ComprehensionTlv;)Lcom/android/internal/telephony/cat/Item;
    .registers 11
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    .line 118
    const/4 v2, 0x0

    .line 120
    .local v2, item:Lcom/android/internal/telephony/cat/Item;
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v4

    .line 121
    .local v4, rawValue:[B
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v7

    .line 122
    .local v7, valueIndex:I
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getLength()I

    move-result v3

    .line 124
    .local v3, length:I
    if-eqz v3, :cond_20

    .line 125
    add-int/lit8 v6, v3, -0x1

    .line 128
    .local v6, textLen:I
    :try_start_11
    aget-byte v8, v4, v7

    and-int/lit16 v1, v8, 0xff

    .line 129
    .local v1, id:I
    add-int/lit8 v8, v7, 0x1

    invoke-static {v4, v8, v6}, Lcom/android/internal/telephony/uicc/IccUtils;->adnStringFieldToString([BII)Ljava/lang/String;

    move-result-object v5

    .line 131
    .local v5, text:Ljava/lang/String;
    new-instance v2, Lcom/android/internal/telephony/cat/Item;

    .end local v2           #item:Lcom/android/internal/telephony/cat/Item;
    invoke-direct {v2, v1, v5}, Lcom/android/internal/telephony/cat/Item;-><init>(ILjava/lang/String;)V
    :try_end_20
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_11 .. :try_end_20} :catch_21

    .line 137
    .end local v1           #id:I
    .end local v5           #text:Ljava/lang/String;
    .end local v6           #textLen:I
    .restart local v2       #item:Lcom/android/internal/telephony/cat/Item;
    :cond_20
    return-object v2

    .line 132
    .end local v2           #item:Lcom/android/internal/telephony/cat/Item;
    .restart local v6       #textLen:I
    :catch_21
    move-exception v0

    .line 133
    .local v0, e:Ljava/lang/IndexOutOfBoundsException;
    new-instance v8, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v9, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v8, v9}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v8
.end method

.method static retrieveItemId(Lcom/android/internal/telephony/cat/ComprehensionTlv;)I
    .registers 7
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    .line 148
    const/4 v1, 0x0

    .line 150
    .local v1, id:I
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v2

    .line 151
    .local v2, rawValue:[B
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v3

    .line 154
    .local v3, valueIndex:I
    :try_start_9
    aget-byte v4, v2, v3
    :try_end_b
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_9 .. :try_end_b} :catch_e

    and-int/lit16 v1, v4, 0xff

    .line 159
    return v1

    .line 155
    :catch_e
    move-exception v0

    .line 156
    .local v0, e:Ljava/lang/IndexOutOfBoundsException;
    new-instance v4, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v5, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v4, v5}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v4
.end method

.method static retrieveItemsIconId(Lcom/android/internal/telephony/cat/ComprehensionTlv;)Lcom/android/internal/telephony/cat/ItemsIconId;
    .registers 11
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    .line 194
    const-string v8, "ValueParser"

    const-string v9, "retrieveItemsIconId:"

    invoke-static {v8, v9}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    new-instance v1, Lcom/android/internal/telephony/cat/ItemsIconId;

    invoke-direct {v1}, Lcom/android/internal/telephony/cat/ItemsIconId;-><init>()V

    .line 197
    .local v1, id:Lcom/android/internal/telephony/cat/ItemsIconId;
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v5

    .line 198
    .local v5, rawValue:[B
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v6

    .line 199
    .local v6, valueIndex:I
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getLength()I

    move-result v8

    add-int/lit8 v4, v8, -0x1

    .line 200
    .local v4, numOfItems:I
    new-array v8, v4, [I

    iput-object v8, v1, Lcom/android/internal/telephony/cat/ItemsIconId;->recordNumbers:[I

    .line 204
    add-int/lit8 v7, v6, 0x1

    .end local v6           #valueIndex:I
    .local v7, valueIndex:I
    :try_start_20
    aget-byte v8, v5, v6

    and-int/lit16 v8, v8, 0xff

    if-nez v8, :cond_3a

    const/4 v8, 0x1

    :goto_27
    iput-boolean v8, v1, Lcom/android/internal/telephony/cat/ItemsIconId;->selfExplanatory:Z

    .line 206
    const/4 v2, 0x0

    .local v2, index:I
    move v3, v2

    .end local v2           #index:I
    .local v3, index:I
    :goto_2b
    if-ge v3, v4, :cond_46

    .line 207
    iget-object v8, v1, Lcom/android/internal/telephony/cat/ItemsIconId;->recordNumbers:[I
    :try_end_2f
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_20 .. :try_end_2f} :catch_3c

    add-int/lit8 v2, v3, 0x1

    .end local v3           #index:I
    .restart local v2       #index:I
    add-int/lit8 v6, v7, 0x1

    .end local v7           #valueIndex:I
    .restart local v6       #valueIndex:I
    :try_start_33
    aget-byte v9, v5, v7

    aput v9, v8, v3
    :try_end_37
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_33 .. :try_end_37} :catch_47

    move v3, v2

    .end local v2           #index:I
    .restart local v3       #index:I
    move v7, v6

    .end local v6           #valueIndex:I
    .restart local v7       #valueIndex:I
    goto :goto_2b

    .line 204
    .end local v3           #index:I
    :cond_3a
    const/4 v8, 0x0

    goto :goto_27

    .line 209
    :catch_3c
    move-exception v0

    move v6, v7

    .line 210
    .end local v7           #valueIndex:I
    .local v0, e:Ljava/lang/IndexOutOfBoundsException;
    .restart local v6       #valueIndex:I
    :goto_3e
    new-instance v8, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v9, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v8, v9}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v8

    .line 212
    .end local v0           #e:Ljava/lang/IndexOutOfBoundsException;
    .end local v6           #valueIndex:I
    .restart local v3       #index:I
    .restart local v7       #valueIndex:I
    :cond_46
    return-object v1

    .line 209
    .end local v3           #index:I
    .end local v7           #valueIndex:I
    .restart local v2       #index:I
    .restart local v6       #valueIndex:I
    :catch_47
    move-exception v0

    goto :goto_3e
.end method

.method static retrieveLanguage(Lcom/android/internal/telephony/cat/ComprehensionTlv;)Ljava/lang/String;
    .registers 5
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    .line 709
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v1

    .line 710
    .local v1, rawValue:[B
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v2

    .line 711
    .local v2, valueIndex:I
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getLength()I

    move-result v0

    .line 712
    .local v0, length:I
    if-eqz v0, :cond_14

    .line 713
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v1, v2, v0}, Ljava/lang/String;-><init>([BII)V

    .line 715
    :goto_13
    return-object v3

    :cond_14
    const/4 v3, 0x0

    goto :goto_13
.end method

.method static retrieveNetworkAccessName(Lcom/android/internal/telephony/cat/ComprehensionTlv;)Ljava/lang/String;
    .registers 15
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    .line 916
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v5

    .line 917
    .local v5, rawValue:[B
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v8

    .line 918
    .local v8, valueIndex:I
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getLength()I

    move-result v4

    .line 920
    .local v4, length:I
    const-string v11, "ValueParser"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "retrieveNetworkAccessName: valueIndex , Length = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " , "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 922
    :try_start_2e
    new-array v7, v4, [B

    .line 923
    .local v7, tempNetworkAccessName:[B
    const-string v11, "ValueParser"

    const-string v12, "retrieveNetworkAccessName: beginning Byte array copy"

    invoke-static {v11, v12}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 925
    const/4 v2, 0x0

    .line 927
    .local v2, idx:I
    aget-byte v9, v5, v8

    .line 928
    .local v9, wordLen:I
    add-int/lit8 v10, v9, 0x1

    .line 930
    .local v10, wordLenIdx:I
    const/4 v1, 0x1

    .local v1, i:I
    move v3, v2

    .end local v2           #idx:I
    .local v3, idx:I
    :goto_3e
    if-ge v1, v4, :cond_6c

    .line 931
    if-ne v1, v10, :cond_53

    .line 932
    add-int/lit8 v2, v3, 0x1

    .end local v3           #idx:I
    .restart local v2       #idx:I
    const/16 v11, 0x2e

    aput-byte v11, v7, v3

    .line 934
    add-int v11, v8, v1

    aget-byte v9, v5, v11

    .line 935
    add-int/lit8 v11, v9, 0x1

    add-int/2addr v10, v11

    .line 930
    :goto_4f
    add-int/lit8 v1, v1, 0x1

    move v3, v2

    .end local v2           #idx:I
    .restart local v3       #idx:I
    goto :goto_3e

    .line 937
    :cond_53
    add-int/lit8 v2, v3, 0x1

    .end local v3           #idx:I
    .restart local v2       #idx:I
    add-int v11, v8, v1

    aget-byte v11, v5, v11

    aput-byte v11, v7, v3
    :try_end_5b
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_2e .. :try_end_5b} :catch_5c
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2e .. :try_end_5b} :catch_94
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_5b} :catch_a4

    goto :goto_4f

    .line 945
    .end local v1           #i:I
    .end local v2           #idx:I
    .end local v7           #tempNetworkAccessName:[B
    .end local v9           #wordLen:I
    .end local v10           #wordLenIdx:I
    :catch_5c
    move-exception v0

    .line 946
    .local v0, e:Ljava/lang/IndexOutOfBoundsException;
    const-string v11, "ValueParser"

    const-string v12, " ResultException: retrieveNetworkAccessName - IndexOutOfBoundsException"

    invoke-static {v11, v12}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 947
    new-instance v11, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v12, Lcom/android/internal/telephony/cat/ResultCode;->REQUIRED_VALUES_MISSING:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v11, v12}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v11

    .line 940
    .end local v0           #e:Ljava/lang/IndexOutOfBoundsException;
    .restart local v1       #i:I
    .restart local v3       #idx:I
    .restart local v7       #tempNetworkAccessName:[B
    .restart local v9       #wordLen:I
    .restart local v10       #wordLenIdx:I
    :cond_6c
    :try_start_6c
    const-string v11, "ValueParser"

    const-string v12, "retrieveNetworkAccessName: array copy complete"

    invoke-static {v11, v12}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 942
    new-instance v6, Ljava/lang/String;

    const/4 v11, 0x0

    const-string v12, "UTF-8"

    invoke-direct {v6, v7, v11, v3, v12}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .line 943
    .local v6, tempName:Ljava/lang/String;
    const-string v11, "ValueParser"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "retrieveNetworkAccessName: tempName = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_93
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_6c .. :try_end_93} :catch_5c
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_6c .. :try_end_93} :catch_94
    .catch Ljava/lang/Exception; {:try_start_6c .. :try_end_93} :catch_a4

    .line 955
    .end local v1           #i:I
    .end local v3           #idx:I
    .end local v6           #tempName:Ljava/lang/String;
    .end local v7           #tempNetworkAccessName:[B
    .end local v9           #wordLen:I
    .end local v10           #wordLenIdx:I
    :goto_93
    return-object v6

    .line 948
    :catch_94
    move-exception v0

    .line 949
    .local v0, e:Ljava/io/UnsupportedEncodingException;
    const-string v11, "ValueParser"

    const-string v12, " ResultException: retrieveNetworkAccessName - UnsupportedEncodingException"

    invoke-static {v11, v12}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 950
    new-instance v11, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v12, Lcom/android/internal/telephony/cat/ResultCode;->REQUIRED_VALUES_MISSING:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v11, v12}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v11

    .line 951
    .end local v0           #e:Ljava/io/UnsupportedEncodingException;
    :catch_a4
    move-exception v0

    .line 952
    .local v0, e:Ljava/lang/Exception;
    const-string v11, "ValueParser"

    const-string v12, "Unknown ResultException in retrieveNetworkAccessName: "

    invoke-static {v11, v12}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 955
    const/4 v6, 0x0

    goto :goto_93
.end method

.method static retrieveSMSCaddress(Lcom/android/internal/telephony/cat/ComprehensionTlv;)Ljava/lang/String;
    .registers 9
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    .line 457
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v3

    .line 458
    .local v3, rawValue:[B
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v5

    .line 460
    .local v5, valueIndex:I
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getLength()I

    move-result v2

    .line 462
    .local v2, length:I
    add-int/lit8 v6, v2, 0x1

    new-array v4, v6, [B

    .line 465
    .local v4, rawValueSmscaddress:[B
    const/4 v1, 0x0

    .local v1, i:I
    :goto_11
    add-int/lit8 v6, v2, 0x1

    if-ge v1, v6, :cond_28

    .line 466
    add-int/lit8 v6, v5, -0x1

    add-int/2addr v6, v1

    :try_start_18
    aget-byte v6, v3, v6

    aput-byte v6, v4, v1
    :try_end_1c
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_18 .. :try_end_1c} :catch_1f

    .line 465
    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    .line 468
    :catch_1f
    move-exception v0

    .line 469
    .local v0, e:Ljava/lang/IndexOutOfBoundsException;
    new-instance v6, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v7, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v6, v7}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v6

    .line 471
    .end local v0           #e:Ljava/lang/IndexOutOfBoundsException;
    :cond_28
    if-eqz v2, :cond_2f

    .line 472
    invoke-static {v4}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v6

    return-object v6

    .line 474
    :cond_2f
    new-instance v6, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v7, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v6, v7}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v6
.end method

.method static retrieveSMSTPDU(Lcom/android/internal/telephony/cat/ComprehensionTlv;Z)Ljava/lang/String;
    .registers 38
    .parameter "ctlv"
    .parameter "ispacking_req"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    .line 479
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v28

    .line 480
    .local v28, rawValue:[B
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v32

    .line 481
    .local v32, valueIndex:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getLength()I

    move-result v18

    .line 482
    .local v18, length:I
    const/4 v9, 0x0

    .line 483
    .local v9, destaddlen:I
    const/16 v27, 0x0

    .line 486
    .local v27, rawPdu:[B
    add-int/lit8 v33, v32, 0x2

    aget-byte v33, v28, v33

    rem-int/lit8 v33, v33, 0x2

    if-nez v33, :cond_3b

    .line 487
    add-int/lit8 v33, v32, 0x2

    aget-byte v33, v28, v33

    div-int/lit8 v9, v33, 0x2

    .line 491
    :goto_1d
    add-int/lit8 v33, v9, 0x6

    move/from16 v0, v18

    move/from16 v1, v33

    if-ne v0, v1, :cond_44

    .line 492
    add-int/lit8 v33, v18, 0x1

    move/from16 v0, v33

    new-array v0, v0, [B

    move-object/from16 v27, v0

    .line 498
    :goto_2d
    const/4 v14, 0x0

    .local v14, i:I
    :goto_2e
    move/from16 v0, v18

    if-ge v14, v0, :cond_54

    .line 499
    add-int v33, v32, v14

    :try_start_34
    aget-byte v33, v28, v33

    aput-byte v33, v27, v14
    :try_end_38
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_34 .. :try_end_38} :catch_4b

    .line 498
    add-int/lit8 v14, v14, 0x1

    goto :goto_2e

    .line 489
    .end local v14           #i:I
    :cond_3b
    add-int/lit8 v33, v32, 0x2

    aget-byte v33, v28, v33

    add-int/lit8 v33, v33, 0x1

    div-int/lit8 v9, v33, 0x2

    goto :goto_1d

    .line 494
    :cond_44
    move/from16 v0, v18

    new-array v0, v0, [B

    move-object/from16 v27, v0

    goto :goto_2d

    .line 501
    .restart local v14       #i:I
    :catch_4b
    move-exception v11

    .line 502
    .local v11, e:Ljava/lang/IndexOutOfBoundsException;
    new-instance v33, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v34, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct/range {v33 .. v34}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v33

    .line 506
    .end local v11           #e:Ljava/lang/IndexOutOfBoundsException;
    :cond_54
    const/16 v25, 0x0

    .line 507
    .local v25, packingUserDataIndex:I
    const/16 v26, 0x0

    .line 508
    .local v26, packingUserDatalen:I
    const/4 v5, 0x0

    .line 509
    .local v5, adjustedUserDatalen:I
    const/16 v19, 0x0

    .line 510
    .local v19, lengthtoCheck:I
    const/16 v31, 0x0

    .line 511
    .local v31, tpvpvalue:I
    const/16 v30, 0x0

    .line 512
    .local v30, tpvplength:I
    const/4 v10, 0x0

    .line 513
    .local v10, destaddrlen:I
    const/4 v8, 0x0

    .line 515
    .local v8, dcs:I
    const-string v33, "ValueParser"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "rawtpvp:"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    const/16 v35, 0x0

    aget-byte v35, v27, v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 517
    const/16 v33, 0x0

    aget-byte v33, v27, v33

    and-int/lit8 v31, v33, 0x18

    .line 519
    const-string v33, "ValueParser"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "tpvpvalue:"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 521
    if-nez v31, :cond_1d9

    .line 522
    const/16 v30, 0x0

    .line 531
    :cond_a3
    :goto_a3
    const/16 v33, 0x2

    aget-byte v33, v27, v33

    rem-int/lit8 v33, v33, 0x2

    if-nez v33, :cond_1fd

    .line 532
    const/16 v33, 0x2

    aget-byte v33, v27, v33

    div-int/lit8 v10, v33, 0x2

    .line 536
    :goto_b1
    add-int/lit8 v33, v10, 0x3

    add-int/lit8 v33, v33, 0x1

    add-int/lit8 v33, v33, 0x1

    add-int v33, v33, v30

    add-int/lit8 v25, v33, 0x1

    .line 538
    add-int/lit8 v33, v30, 0x1

    sub-int v33, v25, v33

    :try_start_bf
    aget-byte v8, v27, v33
    :try_end_c1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_bf .. :try_end_c1} :catch_207

    .line 542
    const-string v33, "ValueParser"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "SEND SMS DCS = "

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 546
    const-string v33, "gsm.sim.operator.numeric"

    const-string v34, ""

    invoke-static/range {v33 .. v34}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 547
    .local v3, MCCMNC:Ljava/lang/String;
    const-string v33, "ro.csc.sales_code"

    const-string v34, ""

    invoke-static/range {v33 .. v34}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 549
    .local v4, SALES_CODE:Ljava/lang/String;
    const/16 v33, 0x1

    move/from16 v0, p1

    move/from16 v1, v33

    if-ne v0, v1, :cond_40e

    and-int/lit16 v0, v8, 0xf4

    move/from16 v33, v0

    const/16 v34, 0xf0

    move/from16 v0, v33

    move/from16 v1, v34

    if-ne v0, v1, :cond_177

    const-string v33, "XXV"

    move-object/from16 v0, v33

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-nez v33, :cond_177

    const-string v33, "GLB"

    move-object/from16 v0, v33

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-nez v33, :cond_177

    const-string v33, "SMA"

    move-object/from16 v0, v33

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-nez v33, :cond_177

    const-string v33, "XTC"

    move-object/from16 v0, v33

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-nez v33, :cond_177

    const-string v33, "XTE"

    move-object/from16 v0, v33

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-nez v33, :cond_177

    const-string v33, "404"

    move-object/from16 v0, v33

    invoke-virtual {v3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v33

    if-nez v33, :cond_177

    const-string v33, "510"

    move-object/from16 v0, v33

    invoke-virtual {v3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v33

    if-nez v33, :cond_177

    const-string v33, "520"

    move-object/from16 v0, v33

    invoke-virtual {v3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v33

    if-nez v33, :cond_177

    const-string v33, "405"

    move-object/from16 v0, v33

    invoke-virtual {v3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v33

    if-nez v33, :cond_177

    const-string v33, "51503"

    move-object/from16 v0, v33

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-nez v33, :cond_177

    const-string v33, "28602"

    move-object/from16 v0, v33

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-nez v33, :cond_177

    const-string v33, "20620"

    move-object/from16 v0, v33

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v33

    if-eqz v33, :cond_40e

    .line 553
    :cond_177
    :try_start_177
    aget-byte v33, v27, v25
    :try_end_179
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_177 .. :try_end_179} :catch_210

    move/from16 v0, v33

    and-int/lit16 v0, v0, 0xff

    move/from16 v26, v0

    .line 558
    add-int/lit8 v33, v25, 0x1

    sub-int v19, v18, v33

    .line 560
    const-string v33, "ValueParser"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "length to be checked:"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 562
    move/from16 v0, v19

    move/from16 v1, v26

    if-lt v0, v1, :cond_325

    .line 564
    const-string v33, "ValueParser"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "TPUDL_packingUserDatalen:"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 565
    const/16 v29, 0x0

    .line 566
    .local v29, shorten:I
    move/from16 v0, v26

    new-array v0, v0, [B

    move-object/from16 v23, v0

    .line 569
    .local v23, packinUserData:[B
    const/4 v15, 0x0

    .local v15, j:I
    :goto_1ca
    move/from16 v0, v26

    if-ge v15, v0, :cond_222

    .line 570
    add-int/lit8 v33, v25, 0x1

    add-int v33, v33, v15

    :try_start_1d2
    aget-byte v33, v27, v33

    aput-byte v33, v23, v15
    :try_end_1d6
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1d2 .. :try_end_1d6} :catch_219

    .line 569
    add-int/lit8 v15, v15, 0x1

    goto :goto_1ca

    .line 523
    .end local v3           #MCCMNC:Ljava/lang/String;
    .end local v4           #SALES_CODE:Ljava/lang/String;
    .end local v15           #j:I
    .end local v23           #packinUserData:[B
    .end local v29           #shorten:I
    :cond_1d9
    const/16 v33, 0x10

    move/from16 v0, v31

    move/from16 v1, v33

    if-ne v0, v1, :cond_1e5

    .line 524
    const/16 v30, 0x1

    goto/16 :goto_a3

    .line 525
    :cond_1e5
    const/16 v33, 0x8

    move/from16 v0, v31

    move/from16 v1, v33

    if-ne v0, v1, :cond_1f1

    .line 526
    const/16 v30, 0x7

    goto/16 :goto_a3

    .line 527
    :cond_1f1
    const/16 v33, 0x18

    move/from16 v0, v31

    move/from16 v1, v33

    if-ne v0, v1, :cond_a3

    .line 528
    const/16 v30, 0x7

    goto/16 :goto_a3

    .line 534
    :cond_1fd
    const/16 v33, 0x2

    aget-byte v33, v27, v33

    add-int/lit8 v33, v33, 0x1

    div-int/lit8 v10, v33, 0x2

    goto/16 :goto_b1

    .line 539
    :catch_207
    move-exception v11

    .line 540
    .restart local v11       #e:Ljava/lang/IndexOutOfBoundsException;
    new-instance v33, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v34, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct/range {v33 .. v34}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v33

    .line 554
    .end local v11           #e:Ljava/lang/IndexOutOfBoundsException;
    .restart local v3       #MCCMNC:Ljava/lang/String;
    .restart local v4       #SALES_CODE:Ljava/lang/String;
    :catch_210
    move-exception v11

    .line 555
    .restart local v11       #e:Ljava/lang/IndexOutOfBoundsException;
    new-instance v33, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v34, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct/range {v33 .. v34}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v33

    .line 572
    .end local v11           #e:Ljava/lang/IndexOutOfBoundsException;
    .restart local v15       #j:I
    .restart local v23       #packinUserData:[B
    .restart local v29       #shorten:I
    :catch_219
    move-exception v11

    .line 573
    .restart local v11       #e:Ljava/lang/IndexOutOfBoundsException;
    new-instance v33, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v34, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct/range {v33 .. v34}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v33

    .line 577
    .end local v11           #e:Ljava/lang/IndexOutOfBoundsException;
    :cond_222
    const/16 v33, 0x0

    move-object/from16 v0, v23

    move/from16 v1, v33

    move/from16 v2, v26

    invoke-static {v0, v1, v2}, Lcom/android/internal/telephony/GsmAlphabet;->gsm8BitUnpackedToString([BII)Ljava/lang/String;

    move-result-object v24

    .line 580
    .local v24, packinUserDataString:Ljava/lang/String;
    const-string v33, "ValueParser"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "TPUDL_packingUserDatastring:"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 583
    :try_start_24a
    invoke-virtual/range {v24 .. v24}, Ljava/lang/String;->length()I

    move-result v33

    const/16 v34, 0xa0

    move/from16 v0, v33

    move/from16 v1, v34

    if-le v0, v1, :cond_27b

    .line 584
    const/16 v33, 0x0

    const/16 v34, 0x9e

    move-object/from16 v0, v24

    move/from16 v1, v33

    move/from16 v2, v34

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v13

    .line 585
    .local v13, fullSizePackinUserDataString:Ljava/lang/String;
    invoke-virtual/range {v24 .. v24}, Ljava/lang/String;->length()I

    move-result v33

    move/from16 v0, v33

    add-int/lit16 v0, v0, -0x9e

    move/from16 v29, v0

    .line 586
    aget-byte v33, v27, v25

    sub-int v33, v33, v29

    move/from16 v0, v33

    int-to-byte v0, v0

    move/from16 v33, v0

    aput-byte v33, v27, v25

    .line 587
    move-object/from16 v24, v13

    .line 592
    .end local v13           #fullSizePackinUserDataString:Ljava/lang/String;
    :cond_27b
    invoke-static/range {v24 .. v24}, Lcom/android/internal/telephony/GsmAlphabet;->stringToGsm7BitPacked(Ljava/lang/String;)[B

    move-result-object v20

    .line 594
    .local v20, packedUserData:[B
    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v21, v0

    .line 596
    .local v21, packedUserDatalen:I
    const-string v33, "ValueParser"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "TPUDL_Packed user data len:"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2a0
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_24a .. :try_end_2a0} :catch_31c

    .line 599
    const/16 v16, 0x1

    .local v16, k:I
    :goto_2a2
    move/from16 v0, v16

    move/from16 v1, v21

    if-ge v0, v1, :cond_2b1

    .line 600
    add-int v33, v25, v16

    :try_start_2aa
    aget-byte v34, v20, v16

    aput-byte v34, v27, v33

    .line 599
    add-int/lit8 v16, v16, 0x1

    goto :goto_2a2

    .line 603
    :cond_2b1
    add-int/lit8 v33, v21, -0x1

    sub-int v33, v26, v33

    sub-int v5, v18, v33

    .line 605
    const-string v33, "ValueParser"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "TPUDL_Adjusted user data len:"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2d1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_2aa .. :try_end_2d1} :catch_313
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_2aa .. :try_end_2d1} :catch_31c

    .line 664
    .end local v29           #shorten:I
    :goto_2d1
    const-string v33, "ValueParser"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "Data coding scheme:"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    add-int/lit8 v35, v30, 0x1

    sub-int v35, v25, v35

    aget-byte v35, v27, v35

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 667
    const/16 v7, 0xf0

    .line 668
    .local v7, datacodingscheme:I
    const/4 v6, 0x0

    .line 669
    .local v6, datacodingfromsim:I
    add-int/lit8 v33, v30, 0x1

    sub-int v33, v25, v33

    aget-byte v6, v27, v33

    .line 670
    and-int/2addr v6, v7

    .line 671
    add-int/lit8 v33, v30, 0x1

    sub-int v33, v25, v33

    int-to-byte v0, v6

    move/from16 v34, v0

    aput-byte v34, v27, v33

    .line 673
    new-array v0, v5, [B

    move-object/from16 v22, v0

    .line 676
    .local v22, packeddata:[B
    const/16 v17, 0x0

    .local v17, l:I
    :goto_308
    move/from16 v0, v17

    if-ge v0, v5, :cond_3ff

    .line 677
    :try_start_30c
    aget-byte v33, v27, v17

    aput-byte v33, v22, v17
    :try_end_310
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_30c .. :try_end_310} :catch_3f6

    .line 676
    add-int/lit8 v17, v17, 0x1

    goto :goto_308

    .line 607
    .end local v6           #datacodingfromsim:I
    .end local v7           #datacodingscheme:I
    .end local v17           #l:I
    .end local v22           #packeddata:[B
    .restart local v29       #shorten:I
    :catch_313
    move-exception v11

    .line 608
    .restart local v11       #e:Ljava/lang/IndexOutOfBoundsException;
    :try_start_314
    new-instance v33, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v34, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct/range {v33 .. v34}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v33
    :try_end_31c
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_314 .. :try_end_31c} :catch_31c

    .line 610
    .end local v11           #e:Ljava/lang/IndexOutOfBoundsException;
    .end local v16           #k:I
    .end local v20           #packedUserData:[B
    .end local v21           #packedUserDatalen:I
    :catch_31c
    move-exception v12

    .line 611
    .local v12, ex:Lcom/android/internal/telephony/EncodeException;
    new-instance v33, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v34, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct/range {v33 .. v34}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v33

    .line 617
    .end local v12           #ex:Lcom/android/internal/telephony/EncodeException;
    .end local v15           #j:I
    .end local v23           #packinUserData:[B
    .end local v24           #packinUserDataString:Ljava/lang/String;
    .end local v29           #shorten:I
    :cond_325
    add-int/lit8 v26, v19, 0x1

    .line 619
    const-string v33, "ValueParser"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "packingUserDatalen:"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 621
    move/from16 v0, v26

    new-array v0, v0, [B

    move-object/from16 v23, v0

    .line 624
    .restart local v23       #packinUserData:[B
    const/4 v15, 0x0

    .restart local v15       #j:I
    :goto_34a
    move/from16 v0, v26

    if-ge v15, v0, :cond_360

    .line 625
    add-int v33, v25, v15

    :try_start_350
    aget-byte v33, v27, v33

    aput-byte v33, v23, v15
    :try_end_354
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_350 .. :try_end_354} :catch_357

    .line 624
    add-int/lit8 v15, v15, 0x1

    goto :goto_34a

    .line 627
    :catch_357
    move-exception v11

    .line 628
    .restart local v11       #e:Ljava/lang/IndexOutOfBoundsException;
    new-instance v33, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v34, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct/range {v33 .. v34}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v33

    .line 633
    .end local v11           #e:Ljava/lang/IndexOutOfBoundsException;
    :cond_360
    const/16 v33, 0x0

    move-object/from16 v0, v23

    move/from16 v1, v33

    move/from16 v2, v26

    invoke-static {v0, v1, v2}, Lcom/android/internal/telephony/GsmAlphabet;->gsm8BitUnpackedToString([BII)Ljava/lang/String;

    move-result-object v24

    .line 636
    .restart local v24       #packinUserDataString:Ljava/lang/String;
    const-string v33, "ValueParser"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "packingUserDatastring:"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 639
    :try_start_388
    invoke-static/range {v24 .. v24}, Lcom/android/internal/telephony/GsmAlphabet;->stringToGsm7BitPacked(Ljava/lang/String;)[B

    move-result-object v20

    .line 641
    .restart local v20       #packedUserData:[B
    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v21, v0

    .line 643
    .restart local v21       #packedUserDatalen:I
    const-string v33, "ValueParser"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "Packed user data len:"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3ad
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_388 .. :try_end_3ad} :catch_3ed

    .line 646
    const/16 v16, 0x0

    .restart local v16       #k:I
    :goto_3af
    add-int/lit8 v33, v21, -0x1

    move/from16 v0, v16

    move/from16 v1, v33

    if-ge v0, v1, :cond_3c2

    .line 647
    add-int v33, v25, v16

    add-int/lit8 v34, v16, 0x1

    :try_start_3bb
    aget-byte v34, v20, v34

    aput-byte v34, v27, v33

    .line 646
    add-int/lit8 v16, v16, 0x1

    goto :goto_3af

    .line 650
    :cond_3c2
    add-int/lit8 v33, v21, -0x1

    sub-int v33, v26, v33

    sub-int v5, v18, v33

    .line 652
    const-string v33, "ValueParser"

    new-instance v34, Ljava/lang/StringBuilder;

    invoke-direct/range {v34 .. v34}, Ljava/lang/StringBuilder;-><init>()V

    const-string v35, "Adjusted user data len:"

    invoke-virtual/range {v34 .. v35}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v34

    move-object/from16 v0, v34

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v34

    invoke-virtual/range {v34 .. v34}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v34

    invoke-static/range {v33 .. v34}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3e2
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_3bb .. :try_end_3e2} :catch_3e4
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_3bb .. :try_end_3e2} :catch_3ed

    goto/16 :goto_2d1

    .line 654
    :catch_3e4
    move-exception v11

    .line 655
    .restart local v11       #e:Ljava/lang/IndexOutOfBoundsException;
    :try_start_3e5
    new-instance v33, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v34, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct/range {v33 .. v34}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v33
    :try_end_3ed
    .catch Lcom/android/internal/telephony/EncodeException; {:try_start_3e5 .. :try_end_3ed} :catch_3ed

    .line 657
    .end local v11           #e:Ljava/lang/IndexOutOfBoundsException;
    .end local v16           #k:I
    .end local v20           #packedUserData:[B
    .end local v21           #packedUserDatalen:I
    :catch_3ed
    move-exception v12

    .line 658
    .restart local v12       #ex:Lcom/android/internal/telephony/EncodeException;
    new-instance v33, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v34, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct/range {v33 .. v34}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v33

    .line 679
    .end local v12           #ex:Lcom/android/internal/telephony/EncodeException;
    .restart local v6       #datacodingfromsim:I
    .restart local v7       #datacodingscheme:I
    .restart local v16       #k:I
    .restart local v17       #l:I
    .restart local v20       #packedUserData:[B
    .restart local v21       #packedUserDatalen:I
    .restart local v22       #packeddata:[B
    :catch_3f6
    move-exception v11

    .line 680
    .restart local v11       #e:Ljava/lang/IndexOutOfBoundsException;
    new-instance v33, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v34, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct/range {v33 .. v34}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v33

    .line 683
    .end local v11           #e:Ljava/lang/IndexOutOfBoundsException;
    :cond_3ff
    if-eqz v5, :cond_406

    .line 684
    invoke-static/range {v22 .. v22}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v33

    .line 693
    .end local v6           #datacodingfromsim:I
    .end local v7           #datacodingscheme:I
    .end local v15           #j:I
    .end local v16           #k:I
    .end local v17           #l:I
    .end local v20           #packedUserData:[B
    .end local v21           #packedUserDatalen:I
    .end local v22           #packeddata:[B
    .end local v23           #packinUserData:[B
    .end local v24           #packinUserDataString:Ljava/lang/String;
    :goto_405
    return-object v33

    .line 686
    .restart local v6       #datacodingfromsim:I
    .restart local v7       #datacodingscheme:I
    .restart local v15       #j:I
    .restart local v16       #k:I
    .restart local v17       #l:I
    .restart local v20       #packedUserData:[B
    .restart local v21       #packedUserDatalen:I
    .restart local v22       #packeddata:[B
    .restart local v23       #packinUserData:[B
    .restart local v24       #packinUserDataString:Ljava/lang/String;
    :cond_406
    new-instance v33, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v34, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct/range {v33 .. v34}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v33

    .line 692
    .end local v6           #datacodingfromsim:I
    .end local v7           #datacodingscheme:I
    .end local v15           #j:I
    .end local v16           #k:I
    .end local v17           #l:I
    .end local v20           #packedUserData:[B
    .end local v21           #packedUserDatalen:I
    .end local v22           #packeddata:[B
    .end local v23           #packinUserData:[B
    .end local v24           #packinUserDataString:Ljava/lang/String;
    :cond_40e
    if-eqz v18, :cond_415

    .line 693
    invoke-static/range {v27 .. v27}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v33

    goto :goto_405

    .line 695
    :cond_415
    new-instance v33, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v34, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct/range {v33 .. v34}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v33
.end method

.method static retrieveSSstring(Lcom/android/internal/telephony/cat/ComprehensionTlv;)Ljava/lang/String;
    .registers 7
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    .line 344
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v2

    .line 345
    .local v2, rawValue:[B
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v3

    .line 346
    .local v3, valueIndex:I
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getLength()I

    move-result v1

    .line 347
    .local v1, length:I
    if-eqz v1, :cond_1c

    .line 349
    :try_start_e
    invoke-static {v2, v3, v1}, Lcom/android/internal/telephony/uicc/IccUtils;->SSbcdToString([BII)Ljava/lang/String;
    :try_end_11
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_e .. :try_end_11} :catch_13

    move-result-object v4

    .line 355
    :goto_12
    return-object v4

    .line 351
    :catch_13
    move-exception v0

    .line 352
    .local v0, e:Ljava/lang/IndexOutOfBoundsException;
    new-instance v4, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v5, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v4, v5}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v4

    .line 355
    .end local v0           #e:Ljava/lang/IndexOutOfBoundsException;
    :cond_1c
    const/4 v4, 0x0

    goto :goto_12
.end method

.method static retrieveTextAttribute(Lcom/android/internal/telephony/cat/ComprehensionTlv;)Ljava/util/List;
    .registers 25
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/internal/telephony/cat/ComprehensionTlv;",
            ")",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/telephony/cat/TextAttribute;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    .line 225
    new-instance v18, Ljava/util/ArrayList;

    invoke-direct/range {v18 .. v18}, Ljava/util/ArrayList;-><init>()V

    .line 227
    .local v18, lst:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/cat/TextAttribute;>;"
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v19

    .line 228
    .local v19, rawValue:[B
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v21

    .line 229
    .local v21, valueIndex:I
    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getLength()I

    move-result v17

    .line 231
    .local v17, length:I
    if-eqz v17, :cond_84

    .line 233
    div-int/lit8 v16, v17, 0x4

    .line 236
    .local v16, itemCount:I
    const/4 v15, 0x0

    .local v15, i:I
    :goto_16
    move/from16 v0, v16

    if-ge v15, v0, :cond_86

    .line 237
    :try_start_1a
    aget-byte v22, v19, v21

    move/from16 v0, v22

    and-int/lit16 v2, v0, 0xff

    .line 238
    .local v2, start:I
    add-int/lit8 v22, v21, 0x1

    aget-byte v22, v19, v22

    move/from16 v0, v22

    and-int/lit16 v3, v0, 0xff

    .line 239
    .local v3, textLength:I
    add-int/lit8 v22, v21, 0x2

    aget-byte v22, v19, v22

    move/from16 v0, v22

    and-int/lit16 v14, v0, 0xff

    .line 240
    .local v14, format:I
    add-int/lit8 v22, v21, 0x3

    aget-byte v22, v19, v22

    move/from16 v0, v22

    and-int/lit16 v12, v0, 0xff

    .line 242
    .local v12, colorValue:I
    and-int/lit8 v11, v14, 0x3

    .line 243
    .local v11, alignValue:I
    invoke-static {v11}, Lcom/android/internal/telephony/cat/TextAlignment;->fromInt(I)Lcom/android/internal/telephony/cat/TextAlignment;

    move-result-object v4

    .line 245
    .local v4, align:Lcom/android/internal/telephony/cat/TextAlignment;
    shr-int/lit8 v22, v14, 0x2

    and-int/lit8 v20, v22, 0x3

    .line 246
    .local v20, sizeValue:I
    invoke-static/range {v20 .. v20}, Lcom/android/internal/telephony/cat/FontSize;->fromInt(I)Lcom/android/internal/telephony/cat/FontSize;

    move-result-object v5

    .line 247
    .local v5, size:Lcom/android/internal/telephony/cat/FontSize;
    if-nez v5, :cond_4a

    .line 249
    sget-object v5, Lcom/android/internal/telephony/cat/FontSize;->NORMAL:Lcom/android/internal/telephony/cat/FontSize;

    .line 252
    :cond_4a
    and-int/lit8 v22, v14, 0x10

    if-eqz v22, :cond_73

    const/4 v6, 0x1

    .line 253
    .local v6, bold:Z
    :goto_4f
    and-int/lit8 v22, v14, 0x20

    if-eqz v22, :cond_75

    const/4 v7, 0x1

    .line 254
    .local v7, italic:Z
    :goto_54
    and-int/lit8 v22, v14, 0x40

    if-eqz v22, :cond_77

    const/4 v8, 0x1

    .line 255
    .local v8, underlined:Z
    :goto_59
    and-int/lit16 v0, v14, 0x80

    move/from16 v22, v0

    if-eqz v22, :cond_79

    const/4 v9, 0x1

    .line 257
    .local v9, strikeThrough:Z
    :goto_60
    invoke-static {v12}, Lcom/android/internal/telephony/cat/TextColor;->fromInt(I)Lcom/android/internal/telephony/cat/TextColor;

    move-result-object v10

    .line 259
    .local v10, color:Lcom/android/internal/telephony/cat/TextColor;
    new-instance v1, Lcom/android/internal/telephony/cat/TextAttribute;

    invoke-direct/range {v1 .. v10}, Lcom/android/internal/telephony/cat/TextAttribute;-><init>(IILcom/android/internal/telephony/cat/TextAlignment;Lcom/android/internal/telephony/cat/FontSize;ZZZZLcom/android/internal/telephony/cat/TextColor;)V

    .line 262
    .local v1, attr:Lcom/android/internal/telephony/cat/TextAttribute;
    move-object/from16 v0, v18

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_6e
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1a .. :try_end_6e} :catch_7b

    .line 236
    add-int/lit8 v15, v15, 0x1

    add-int/lit8 v21, v21, 0x4

    goto :goto_16

    .line 252
    .end local v1           #attr:Lcom/android/internal/telephony/cat/TextAttribute;
    .end local v6           #bold:Z
    .end local v7           #italic:Z
    .end local v8           #underlined:Z
    .end local v9           #strikeThrough:Z
    .end local v10           #color:Lcom/android/internal/telephony/cat/TextColor;
    :cond_73
    const/4 v6, 0x0

    goto :goto_4f

    .line 253
    .restart local v6       #bold:Z
    :cond_75
    const/4 v7, 0x0

    goto :goto_54

    .line 254
    .restart local v7       #italic:Z
    :cond_77
    const/4 v8, 0x0

    goto :goto_59

    .line 255
    .restart local v8       #underlined:Z
    :cond_79
    const/4 v9, 0x0

    goto :goto_60

    .line 267
    .end local v2           #start:I
    .end local v3           #textLength:I
    .end local v4           #align:Lcom/android/internal/telephony/cat/TextAlignment;
    .end local v5           #size:Lcom/android/internal/telephony/cat/FontSize;
    .end local v6           #bold:Z
    .end local v7           #italic:Z
    .end local v8           #underlined:Z
    .end local v11           #alignValue:I
    .end local v12           #colorValue:I
    .end local v14           #format:I
    .end local v20           #sizeValue:I
    :catch_7b
    move-exception v13

    .line 268
    .local v13, e:Ljava/lang/IndexOutOfBoundsException;
    new-instance v22, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v23, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct/range {v22 .. v23}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v22

    .line 271
    .end local v13           #e:Ljava/lang/IndexOutOfBoundsException;
    .end local v15           #i:I
    .end local v16           #itemCount:I
    :cond_84
    const/16 v18, 0x0

    .end local v18           #lst:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/cat/TextAttribute;>;"
    :cond_86
    return-object v18
.end method

.method static retrieveTextString(Lcom/android/internal/telephony/cat/ComprehensionTlv;)Ljava/lang/String;
    .registers 10
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    .line 417
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v2

    .line 418
    .local v2, rawValue:[B
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v6

    .line 419
    .local v6, valueIndex:I
    const/4 v0, 0x0

    .line 420
    .local v0, codingScheme:B
    const/4 v3, 0x0

    .line 421
    .local v3, text:Ljava/lang/String;
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getLength()I

    move-result v5

    .line 424
    .local v5, textLen:I
    if-nez v5, :cond_12

    move-object v4, v3

    .line 446
    .end local v3           #text:Ljava/lang/String;
    .local v4, text:Ljava/lang/String;
    :goto_11
    return-object v4

    .line 428
    .end local v4           #text:Ljava/lang/String;
    .restart local v3       #text:Ljava/lang/String;
    :cond_12
    add-int/lit8 v5, v5, -0x1

    .line 432
    :try_start_14
    aget-byte v7, v2, v6

    and-int/lit8 v7, v7, 0xc

    int-to-byte v0, v7

    .line 434
    if-nez v0, :cond_27

    .line 435
    add-int/lit8 v7, v6, 0x1

    mul-int/lit8 v8, v5, 0x8

    div-int/lit8 v8, v8, 0x7

    invoke-static {v2, v7, v8}, Lcom/android/internal/telephony/GsmAlphabet;->gsm7BitPackedToString([BII)Ljava/lang/String;

    move-result-object v3

    :goto_25
    move-object v4, v3

    .line 446
    .end local v3           #text:Ljava/lang/String;
    .restart local v4       #text:Ljava/lang/String;
    goto :goto_11

    .line 437
    .end local v4           #text:Ljava/lang/String;
    .restart local v3       #text:Ljava/lang/String;
    :cond_27
    const/4 v7, 0x4

    if-ne v0, v7, :cond_31

    .line 438
    add-int/lit8 v7, v6, 0x1

    invoke-static {v2, v7, v5}, Lcom/android/internal/telephony/GsmAlphabet;->gsm8BitUnpackedToString([BII)Ljava/lang/String;

    move-result-object v3

    goto :goto_25

    .line 440
    :cond_31
    const/16 v7, 0x8

    if-ne v0, v7, :cond_3f

    .line 441
    new-instance v3, Ljava/lang/String;

    .end local v3           #text:Ljava/lang/String;
    add-int/lit8 v7, v6, 0x1

    const-string v8, "UTF-16"

    invoke-direct {v3, v2, v7, v5, v8}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    .restart local v3       #text:Ljava/lang/String;
    goto :goto_25

    .line 443
    :cond_3f
    new-instance v7, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v8, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v7, v8}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v7
    :try_end_47
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_14 .. :try_end_47} :catch_47
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_14 .. :try_end_47} :catch_50

    .line 447
    .end local v3           #text:Ljava/lang/String;
    :catch_47
    move-exception v1

    .line 448
    .local v1, e:Ljava/lang/IndexOutOfBoundsException;
    new-instance v7, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v8, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v7, v8}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v7

    .line 449
    .end local v1           #e:Ljava/lang/IndexOutOfBoundsException;
    :catch_50
    move-exception v1

    .line 451
    .local v1, e:Ljava/io/UnsupportedEncodingException;
    new-instance v7, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v8, Lcom/android/internal/telephony/cat/ResultCode;->CMD_DATA_NOT_UNDERSTOOD:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v7, v8}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v7
.end method

.method static retrieveTransportLevel(Lcom/android/internal/telephony/cat/ComprehensionTlv;)Lcom/android/internal/telephony/cat/TransportLevel;
    .registers 11
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    .line 837
    new-instance v5, Lcom/android/internal/telephony/cat/TransportLevel;

    invoke-direct {v5}, Lcom/android/internal/telephony/cat/TransportLevel;-><init>()V

    .line 838
    .local v5, transportLevel:Lcom/android/internal/telephony/cat/TransportLevel;
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v3

    .line 839
    .local v3, rawValue:[B
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v6

    .line 840
    .local v6, valueIndex:I
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getLength()I

    move-result v2

    .line 841
    .local v2, length:I
    const-string v7, "ValueParser"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "retrieveTransportLevel: valueIndex , Length = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " , "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 843
    :try_start_33
    aget-byte v7, v3, v6

    iput-byte v7, v5, Lcom/android/internal/telephony/cat/TransportLevel;->transportProtocol:B

    .line 844
    add-int/lit8 v7, v6, 0x1

    aget-byte v7, v3, v7

    and-int/lit16 v1, v7, 0xff

    .line 845
    .local v1, firstByte:I
    add-int/lit8 v7, v6, 0x2

    aget-byte v7, v3, v7

    and-int/lit16 v4, v7, 0xff

    .line 846
    .local v4, secondByte:I
    shl-int/lit8 v7, v1, 0x8

    or-int/2addr v7, v4

    iput v7, v5, Lcom/android/internal/telephony/cat/TransportLevel;->portNumber:I

    .line 847
    const-string v7, "ValueParser"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "retrieveTransportLevel: transportProtocol , portNumber = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-byte v9, v5, Lcom/android/internal/telephony/cat/TransportLevel;->transportProtocol:B

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " , "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v5, Lcom/android/internal/telephony/cat/TransportLevel;->portNumber:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6e
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_33 .. :try_end_6e} :catch_6f
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_6e} :catch_7f

    .line 855
    .end local v1           #firstByte:I
    .end local v4           #secondByte:I
    .end local v5           #transportLevel:Lcom/android/internal/telephony/cat/TransportLevel;
    :goto_6e
    return-object v5

    .line 849
    .restart local v5       #transportLevel:Lcom/android/internal/telephony/cat/TransportLevel;
    :catch_6f
    move-exception v0

    .line 850
    .local v0, e:Ljava/lang/IndexOutOfBoundsException;
    const-string v7, "ValueParser"

    const-string v8, "ResultException: retrieveTransportLevel"

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 851
    new-instance v7, Lcom/android/internal/telephony/cat/ResultException;

    sget-object v8, Lcom/android/internal/telephony/cat/ResultCode;->REQUIRED_VALUES_MISSING:Lcom/android/internal/telephony/cat/ResultCode;

    invoke-direct {v7, v8}, Lcom/android/internal/telephony/cat/ResultException;-><init>(Lcom/android/internal/telephony/cat/ResultCode;)V

    throw v7

    .line 852
    .end local v0           #e:Ljava/lang/IndexOutOfBoundsException;
    :catch_7f
    move-exception v0

    .line 853
    .local v0, e:Ljava/lang/Exception;
    const-string v7, "ValueParser"

    const-string v8, "Unknown ResultException in retrieveTransportLevel: "

    invoke-static {v7, v8}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 855
    const/4 v5, 0x0

    goto :goto_6e
.end method

.method static retrieveUSSDstring(Lcom/android/internal/telephony/cat/ComprehensionTlv;)[B
    .registers 10
    .parameter "ctlv"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/cat/ResultException;
        }
    .end annotation

    .prologue
    .line 368
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getRawValue()[B

    move-result-object v4

    .line 369
    .local v4, rawValue:[B
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getValueIndex()I

    move-result v6

    .line 370
    .local v6, valueIndex:I
    invoke-virtual {p0}, Lcom/android/internal/telephony/cat/ComprehensionTlv;->getLength()I

    move-result v3

    .line 371
    .local v3, length:I
    add-int v8, v6, v3

    add-int/lit8 v0, v8, -0x1

    .line 372
    .local v0, endOfUssdString:I
    if-eqz v3, :cond_26

    .line 373
    new-array v5, v3, [B

    .line 374
    .local v5, ussdString:[B
    const/4 v1, 0x0

    .local v1, i:I
    move v2, v1

    .end local v1           #i:I
    .local v2, i:I
    move v7, v6

    .end local v6           #valueIndex:I
    .local v7, valueIndex:I
    :goto_17
    if-gt v7, v0, :cond_24

    .line 375
    add-int/lit8 v1, v2, 0x1

    .end local v2           #i:I
    .restart local v1       #i:I
    add-int/lit8 v6, v7, 0x1

    .end local v7           #valueIndex:I
    .restart local v6       #valueIndex:I
    aget-byte v8, v4, v7

    aput-byte v8, v5, v2

    move v2, v1

    .end local v1           #i:I
    .restart local v2       #i:I
    move v7, v6

    .end local v6           #valueIndex:I
    .restart local v7       #valueIndex:I
    goto :goto_17

    :cond_24
    move v6, v7

    .line 379
    .end local v2           #i:I
    .end local v5           #ussdString:[B
    .end local v7           #valueIndex:I
    .restart local v6       #valueIndex:I
    :goto_25
    return-object v5

    :cond_26
    const/4 v5, 0x0

    goto :goto_25
.end method
