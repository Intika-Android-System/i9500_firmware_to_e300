.class Landroid/telephony/SmsMessage$PduFormatChecker;
.super Ljava/lang/Object;
.source "SmsMessage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/telephony/SmsMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PduFormatChecker"
.end annotation


# static fields
.field private static file:Ljava/io/File;

.field private static fileInputStream:Ljava/io/FileInputStream;

.field private static fileOutputStream:Ljava/io/FileOutputStream;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 1356
    new-instance v0, Ljava/io/File;

    const-string v1, "/data/misc/radio/fmt"

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    sput-object v0, Landroid/telephony/SmsMessage$PduFormatChecker;->file:Ljava/io/File;

    .line 1358
    sput-object v2, Landroid/telephony/SmsMessage$PduFormatChecker;->fileInputStream:Ljava/io/FileInputStream;

    .line 1359
    sput-object v2, Landroid/telephony/SmsMessage$PduFormatChecker;->fileOutputStream:Ljava/io/FileOutputStream;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .prologue
    .line 1355
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Ljava/lang/String;)V
    .registers 1
    .parameter "x0"

    .prologue
    .line 1355
    invoke-static {p0}, Landroid/telephony/SmsMessage$PduFormatChecker;->write(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100()Ljava/lang/String;
    .registers 1

    .prologue
    .line 1355
    invoke-static {}, Landroid/telephony/SmsMessage$PduFormatChecker;->read()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static read()Ljava/lang/String;
    .registers 5

    .prologue
    .line 1362
    sget-object v3, Landroid/telephony/SmsMessage$PduFormatChecker;->file:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v3

    if-nez v3, :cond_a

    const/4 v3, 0x0

    .line 1383
    .local v1, stringBuilder:Ljava/lang/StringBuilder;
    :goto_9
    return-object v3

    .line 1364
    .end local v1           #stringBuilder:Ljava/lang/StringBuilder;
    :cond_a
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 1368
    .restart local v1       #stringBuilder:Ljava/lang/StringBuilder;
    :try_start_f
    new-instance v3, Ljava/io/FileInputStream;

    sget-object v4, Landroid/telephony/SmsMessage$PduFormatChecker;->file:Ljava/io/File;

    invoke-direct {v3, v4}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    sput-object v3, Landroid/telephony/SmsMessage$PduFormatChecker;->fileInputStream:Ljava/io/FileInputStream;

    .line 1369
    :goto_18
    sget-object v3, Landroid/telephony/SmsMessage$PduFormatChecker;->fileInputStream:Ljava/io/FileInputStream;

    invoke-virtual {v3}, Ljava/io/FileInputStream;->read()I

    move-result v2

    .local v2, temp:I
    const/4 v3, -0x1

    if-eq v2, v3, :cond_2e

    .line 1370
    int-to-char v3, v2

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_25} :catch_26

    goto :goto_18

    .line 1371
    .end local v2           #temp:I
    :catch_26
    move-exception v0

    .line 1372
    .local v0, e:Ljava/io/IOException;
    const-string v3, "SmsMessage"

    const-string v4, "[PduFormatChecker] faile to read"

    invoke-static {v3, v4}, Landroid/util/secutil/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1376
    .end local v0           #e:Ljava/io/IOException;
    :cond_2e
    :try_start_2e
    sget-object v3, Landroid/telephony/SmsMessage$PduFormatChecker;->fileInputStream:Ljava/io/FileInputStream;

    if-eqz v3, :cond_37

    .line 1377
    sget-object v3, Landroid/telephony/SmsMessage$PduFormatChecker;->fileInputStream:Ljava/io/FileInputStream;

    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_37
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_37} :catch_3c

    .line 1383
    :cond_37
    :goto_37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_9

    .line 1379
    :catch_3c
    move-exception v0

    .line 1380
    .restart local v0       #e:Ljava/io/IOException;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_37
.end method

.method private static write(Ljava/lang/String;)V
    .registers 6
    .parameter "pduFormat"

    .prologue
    .line 1387
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 1390
    .local v0, bData:[B
    :try_start_4
    sget-object v2, Landroid/telephony/SmsMessage$PduFormatChecker;->file:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_18

    .line 1391
    sget-object v2, Landroid/telephony/SmsMessage$PduFormatChecker;->file:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z

    .line 1392
    sget-object v2, Landroid/telephony/SmsMessage$PduFormatChecker;->file:Ljava/io/File;

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Ljava/io/File;->setReadable(ZZ)Z

    .line 1395
    :cond_18
    new-instance v2, Ljava/io/FileOutputStream;

    sget-object v3, Landroid/telephony/SmsMessage$PduFormatChecker;->file:Ljava/io/File;

    invoke-direct {v2, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    sput-object v2, Landroid/telephony/SmsMessage$PduFormatChecker;->fileOutputStream:Ljava/io/FileOutputStream;

    .line 1396
    sget-object v2, Landroid/telephony/SmsMessage$PduFormatChecker;->fileOutputStream:Ljava/io/FileOutputStream;

    invoke-virtual {v2, v0}, Ljava/io/OutputStream;->write([B)V
    :try_end_26
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_26} :catch_35

    .line 1399
    :try_start_26
    sget-object v2, Landroid/telephony/SmsMessage$PduFormatChecker;->fileOutputStream:Ljava/io/FileOutputStream;

    if-eqz v2, :cond_2f

    .line 1400
    sget-object v2, Landroid/telephony/SmsMessage$PduFormatChecker;->fileOutputStream:Ljava/io/FileOutputStream;

    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_2f
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_2f} :catch_30

    .line 1408
    :cond_2f
    :goto_2f
    return-void

    .line 1402
    :catch_30
    move-exception v1

    .line 1403
    .local v1, e:Ljava/io/IOException;
    :try_start_31
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_34
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_34} :catch_35

    goto :goto_2f

    .line 1405
    .end local v1           #e:Ljava/io/IOException;
    :catch_35
    move-exception v1

    .line 1406
    .restart local v1       #e:Ljava/io/IOException;
    const-string v2, "SmsMessage"

    const-string v3, "[PduFormatChecker] faile to write"

    invoke-static {v2, v3}, Landroid/util/secutil/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2f
.end method
