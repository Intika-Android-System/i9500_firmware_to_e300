.class public Lcom/android/internal/telephony/uicc/SimPBEntryResult;
.super Ljava/lang/Object;
.source "SimPBEntryResult.java"


# static fields
.field private static final GSM_TEXT_ENC_ASCII:I = 0x1

.field private static final GSM_TEXT_ENC_GSM7BIT:I = 0x2

.field private static final GSM_TEXT_ENC_HEX:I = 0x4

.field private static final GSM_TEXT_ENC_UCS2:I = 0x3

.field public static final INDEX_ANR:I = 0x1

.field public static final INDEX_ANRA:I = 0x2

.field public static final INDEX_ANRB:I = 0x3

.field public static final INDEX_ANRC:I = 0x4

.field public static final INDEX_EMAIL:I = 0x2

.field public static final INDEX_NAME:I = 0x0

.field public static final INDEX_NUMBER:I = 0x0

.field public static final INDEX_SNE:I = 0x1

.field static final LOG_TAG:Ljava/lang/String; = "GSM"

.field public static final NUM_OF_ALPHA:I = 0x3

.field public static final NUM_OF_NUMBER:I = 0x5


# instance fields
.field public alphaTags:[Ljava/lang/String;

.field public dataTypeAlphas:[I

.field public dataTypeNumbers:[I

.field public lengthAlphas:[I

.field public lengthNumbers:[I

.field public nextIndex:I

.field public numbers:[Ljava/lang/String;

.field public recordIndex:I


# direct methods
.method public constructor <init>([I[I[Ljava/lang/String;[I[I[Ljava/lang/String;II)V
    .registers 18
    .parameter "lengthAlphas"
    .parameter "dataTypeAlphas"
    .parameter "alphaTags"
    .parameter "lengthNumbers"
    .parameter "dataTypeNumbers"
    .parameter "numbers"
    .parameter "recordIndex"
    .parameter "nextIndex"

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    const/4 v4, 0x3

    new-array v4, v4, [I

    iput-object v4, p0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->lengthAlphas:[I

    .line 57
    const/4 v4, 0x3

    new-array v4, v4, [I

    iput-object v4, p0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->dataTypeAlphas:[I

    .line 58
    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/String;

    iput-object v4, p0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->alphaTags:[Ljava/lang/String;

    .line 60
    const/4 v4, 0x5

    new-array v4, v4, [I

    iput-object v4, p0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->lengthNumbers:[I

    .line 61
    const/4 v4, 0x5

    new-array v4, v4, [I

    iput-object v4, p0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->dataTypeNumbers:[I

    .line 62
    const/4 v4, 0x5

    new-array v4, v4, [Ljava/lang/String;

    iput-object v4, p0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->numbers:[Ljava/lang/String;

    .line 64
    const/4 v3, 0x0

    .local v3, i:I
    :goto_22
    const/4 v4, 0x3

    if-ge v3, v4, :cond_92

    .line 66
    iget-object v4, p0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->lengthAlphas:[I

    aget v5, p1, v3

    aput v5, v4, v3

    .line 67
    iget-object v4, p0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->dataTypeAlphas:[I

    aget v5, p2, v3

    aput v5, v4, v3

    .line 69
    aget-object v4, p3, v3

    invoke-static {v4}, Lcom/android/internal/telephony/IccUtils;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v1

    .line 71
    .local v1, alphaTagByte:[B
    aget v4, p2, v3

    packed-switch v4, :pswitch_data_c4

    .line 95
    iget-object v4, p0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->alphaTags:[Ljava/lang/String;

    const-string v5, ""

    aput-object v5, v4, v3

    .line 96
    const-string v4, "GSM"

    const-string v5, "SimPBEntryResult: default Unknown type"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    :goto_49
    add-int/lit8 v3, v3, 0x1

    goto :goto_22

    .line 74
    :pswitch_4c
    iget-object v4, p0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->alphaTags:[Ljava/lang/String;

    const-string v5, ""

    aput-object v5, v4, v3

    .line 75
    const-string v4, "GSM"

    const-string v5, "Not supported encoding type"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_49

    .line 78
    :pswitch_5a
    iget-object v4, p0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->alphaTags:[Ljava/lang/String;

    const/4 v5, 0x0

    aget v6, p1, v3

    invoke-static {v1, v5, v6}, Lcom/android/internal/telephony/GsmAlphabet;->gsm8BitUnpackedToString([BII)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v3

    goto :goto_49

    .line 83
    :pswitch_66
    :try_start_66
    iget-object v4, p0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->alphaTags:[Ljava/lang/String;

    new-instance v5, Ljava/lang/String;

    const/4 v6, 0x0

    aget v7, p1, v3

    const-string v8, "UTF-16"

    invoke-direct {v5, v1, v6, v7, v8}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    aput-object v5, v4, v3
    :try_end_74
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_66 .. :try_end_74} :catch_75

    goto :goto_49

    .line 85
    :catch_75
    move-exception v2

    .line 86
    .local v2, ex:Ljava/io/UnsupportedEncodingException;
    iget-object v4, p0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->alphaTags:[Ljava/lang/String;

    const-string v5, ""

    aput-object v5, v4, v3

    .line 87
    const-string v4, "GSM"

    const-string v5, "SimPBEntryResult - implausible UnsupportedEncodingException"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_49

    .line 91
    .end local v2           #ex:Ljava/io/UnsupportedEncodingException;
    :pswitch_84
    iget-object v4, p0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->alphaTags:[Ljava/lang/String;

    const-string v5, ""

    aput-object v5, v4, v3

    .line 92
    const-string v4, "GSM"

    const-string v5, "Not supported encoding type"

    invoke-static {v4, v5}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_49

    .line 103
    .end local v1           #alphaTagByte:[B
    :cond_92
    const/4 v3, 0x0

    :goto_93
    const/4 v4, 0x5

    if-ge v3, v4, :cond_ba

    .line 104
    iget-object v4, p0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->lengthNumbers:[I

    aget v5, p4, v3

    aput v5, v4, v3

    .line 105
    iget-object v4, p0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->dataTypeNumbers:[I

    aget v5, p5, v3

    aput v5, v4, v3

    .line 107
    aget v4, p4, v3

    if-eqz v4, :cond_aa

    aget-object v4, p6, v3

    if-nez v4, :cond_b3

    .line 108
    :cond_aa
    iget-object v4, p0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->numbers:[Ljava/lang/String;

    const-string v5, ""

    aput-object v5, v4, v3

    .line 103
    :goto_b0
    add-int/lit8 v3, v3, 0x1

    goto :goto_93

    .line 110
    :cond_b3
    iget-object v4, p0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->numbers:[Ljava/lang/String;

    aget-object v5, p6, v3

    aput-object v5, v4, v3

    goto :goto_b0

    .line 113
    :cond_ba
    move/from16 v0, p7

    iput v0, p0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->recordIndex:I

    .line 114
    move/from16 v0, p8

    iput v0, p0, Lcom/android/internal/telephony/uicc/SimPBEntryResult;->nextIndex:I

    .line 116
    return-void

    .line 71
    nop

    :pswitch_data_c4
    .packed-switch 0x1
        :pswitch_4c
        :pswitch_5a
        :pswitch_66
        :pswitch_84
    .end packed-switch
.end method
