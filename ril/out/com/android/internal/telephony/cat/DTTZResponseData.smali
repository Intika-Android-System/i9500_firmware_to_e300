.class Lcom/android/internal/telephony/cat/DTTZResponseData;
.super Lcom/android/internal/telephony/cat/ResponseData;
.source "ResponseData.java"


# instance fields
.field private mCalendar:Ljava/util/Calendar;


# direct methods
.method public constructor <init>(Ljava/util/Calendar;)V
    .registers 2
    .parameter "cal"

    .prologue
    .line 241
    invoke-direct {p0}, Lcom/android/internal/telephony/cat/ResponseData;-><init>()V

    .line 242
    iput-object p1, p0, Lcom/android/internal/telephony/cat/DTTZResponseData;->mCalendar:Ljava/util/Calendar;

    .line 243
    return-void
.end method

.method private byteToBCD(I)B
    .registers 4
    .parameter "value"

    .prologue
    .line 295
    if-gez p1, :cond_24

    const/16 v0, 0x63

    if-le p1, v0, :cond_24

    .line 296
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Err: byteToBCD conversion Value is "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " Value has to be between 0 and 99"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/android/internal/telephony/cat/CatLog;->d(Ljava/lang/Object;Ljava/lang/String;)V

    .line 298
    const/4 v0, 0x0

    .line 301
    :goto_23
    return v0

    :cond_24
    div-int/lit8 v0, p1, 0xa

    rem-int/lit8 v1, p1, 0xa

    shl-int/lit8 v1, v1, 0x4

    or-int/2addr v0, v1

    int-to-byte v0, v0

    goto :goto_23
.end method

.method private getTZOffSetByte(J)B
    .registers 11
    .parameter "offSetVal"

    .prologue
    const/4 v5, 0x1

    .line 305
    const-wide/16 v6, 0x0

    cmp-long v6, p1, v6

    if-gez v6, :cond_1e

    move v2, v5

    .line 313
    .local v2, isNegative:Z
    :goto_8
    const-wide/32 v6, 0xdbba0

    div-long v3, p1, v6

    .line 314
    .local v3, tzOffset:J
    if-eqz v2, :cond_10

    const/4 v5, -0x1

    :cond_10
    int-to-long v5, v5

    mul-long/2addr v3, v5

    .line 315
    long-to-int v5, v3

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/cat/DTTZResponseData;->byteToBCD(I)B

    move-result v0

    .line 317
    .local v0, bcdVal:B
    if-eqz v2, :cond_20

    or-int/lit8 v5, v0, 0x8

    int-to-byte v0, v5

    move v1, v0

    .end local v0           #bcdVal:B
    .local v1, bcdVal:B
    :goto_1d
    return v0

    .line 305
    .end local v1           #bcdVal:B
    .end local v2           #isNegative:Z
    .end local v3           #tzOffset:J
    :cond_1e
    const/4 v2, 0x0

    goto :goto_8

    .restart local v0       #bcdVal:B
    .restart local v2       #isNegative:Z
    .restart local v3       #tzOffset:J
    :cond_20
    move v1, v0

    .line 317
    .end local v0           #bcdVal:B
    .restart local v1       #bcdVal:B
    goto :goto_1d
.end method


# virtual methods
.method public format(Ljava/io/ByteArrayOutputStream;)V
    .registers 16
    .parameter "buf"

    .prologue
    const/4 v13, 0x5

    const/4 v11, 0x2

    const/4 v10, 0x1

    const/4 v12, 0x7

    .line 247
    if-nez p1, :cond_7

    .line 292
    :cond_6
    return-void

    .line 252
    :cond_7
    sget-object v9, Lcom/android/internal/telephony/cat/AppInterface$CommandType;->PROVIDE_LOCAL_INFORMATION:Lcom/android/internal/telephony/cat/AppInterface$CommandType;

    invoke-virtual {v9}, Lcom/android/internal/telephony/cat/AppInterface$CommandType;->value()I

    move-result v9

    or-int/lit16 v5, v9, 0x80

    .line 253
    .local v5, tag:I
    invoke-virtual {p1, v5}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 255
    const/16 v9, 0x8

    new-array v2, v9, [B

    .line 257
    .local v2, data:[B
    const/4 v9, 0x0

    aput-byte v12, v2, v9

    .line 259
    iget-object v9, p0, Lcom/android/internal/telephony/cat/DTTZResponseData;->mCalendar:Ljava/util/Calendar;

    if-nez v9, :cond_23

    .line 260
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v9

    iput-object v9, p0, Lcom/android/internal/telephony/cat/DTTZResponseData;->mCalendar:Ljava/util/Calendar;

    .line 263
    :cond_23
    iget-object v9, p0, Lcom/android/internal/telephony/cat/DTTZResponseData;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v9, v10}, Ljava/util/Calendar;->get(I)I

    move-result v9

    rem-int/lit8 v9, v9, 0x64

    invoke-direct {p0, v9}, Lcom/android/internal/telephony/cat/DTTZResponseData;->byteToBCD(I)B

    move-result v9

    aput-byte v9, v2, v10

    .line 266
    iget-object v9, p0, Lcom/android/internal/telephony/cat/DTTZResponseData;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v9, v11}, Ljava/util/Calendar;->get(I)I

    move-result v9

    add-int/lit8 v9, v9, 0x1

    invoke-direct {p0, v9}, Lcom/android/internal/telephony/cat/DTTZResponseData;->byteToBCD(I)B

    move-result v9

    aput-byte v9, v2, v11

    .line 269
    const/4 v9, 0x3

    iget-object v10, p0, Lcom/android/internal/telephony/cat/DTTZResponseData;->mCalendar:Ljava/util/Calendar;

    invoke-virtual {v10, v13}, Ljava/util/Calendar;->get(I)I

    move-result v10

    invoke-direct {p0, v10}, Lcom/android/internal/telephony/cat/DTTZResponseData;->byteToBCD(I)B

    move-result v10

    aput-byte v10, v2, v9

    .line 272
    const/4 v9, 0x4

    iget-object v10, p0, Lcom/android/internal/telephony/cat/DTTZResponseData;->mCalendar:Ljava/util/Calendar;

    const/16 v11, 0xb

    invoke-virtual {v10, v11}, Ljava/util/Calendar;->get(I)I

    move-result v10

    invoke-direct {p0, v10}, Lcom/android/internal/telephony/cat/DTTZResponseData;->byteToBCD(I)B

    move-result v10

    aput-byte v10, v2, v9

    .line 275
    iget-object v9, p0, Lcom/android/internal/telephony/cat/DTTZResponseData;->mCalendar:Ljava/util/Calendar;

    const/16 v10, 0xc

    invoke-virtual {v9, v10}, Ljava/util/Calendar;->get(I)I

    move-result v9

    invoke-direct {p0, v9}, Lcom/android/internal/telephony/cat/DTTZResponseData;->byteToBCD(I)B

    move-result v9

    aput-byte v9, v2, v13

    .line 278
    const/4 v9, 0x6

    iget-object v10, p0, Lcom/android/internal/telephony/cat/DTTZResponseData;->mCalendar:Ljava/util/Calendar;

    const/16 v11, 0xd

    invoke-virtual {v10, v11}, Ljava/util/Calendar;->get(I)I

    move-result v10

    invoke-direct {p0, v10}, Lcom/android/internal/telephony/cat/DTTZResponseData;->byteToBCD(I)B

    move-result v10

    aput-byte v10, v2, v9

    .line 280
    const-string v9, "persist.sys.timezone"

    const-string v10, ""

    invoke-static {v9, v10}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 281
    .local v6, tz:Ljava/lang/String;
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-eqz v9, :cond_96

    .line 282
    const/4 v9, -0x1

    aput-byte v9, v2, v12

    .line 289
    :goto_89
    move-object v0, v2

    .local v0, arr$:[B
    array-length v4, v0

    .local v4, len$:I
    const/4 v3, 0x0

    .local v3, i$:I
    :goto_8c
    if-ge v3, v4, :cond_6

    aget-byte v1, v0, v3

    .line 290
    .local v1, b:B
    invoke-virtual {p1, v1}, Ljava/io/ByteArrayOutputStream;->write(I)V

    .line 289
    add-int/lit8 v3, v3, 0x1

    goto :goto_8c

    .line 284
    .end local v0           #arr$:[B
    .end local v1           #b:B
    .end local v3           #i$:I
    .end local v4           #len$:I
    :cond_96
    invoke-static {v6}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v7

    .line 285
    .local v7, zone:Ljava/util/TimeZone;
    invoke-virtual {v7}, Ljava/util/TimeZone;->getRawOffset()I

    move-result v9

    invoke-virtual {v7}, Ljava/util/TimeZone;->getDSTSavings()I

    move-result v10

    add-int v8, v9, v10

    .line 286
    .local v8, zoneOffset:I
    int-to-long v9, v8

    invoke-direct {p0, v9, v10}, Lcom/android/internal/telephony/cat/DTTZResponseData;->getTZOffSetByte(J)B

    move-result v9

    aput-byte v9, v2, v12

    goto :goto_89
.end method