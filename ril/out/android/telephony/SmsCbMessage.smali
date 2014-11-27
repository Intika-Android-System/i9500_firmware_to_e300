.class public Landroid/telephony/SmsCbMessage;
.super Ljava/lang/Object;
.source "SmsCbMessage.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Landroid/telephony/SmsCbMessage;",
            ">;"
        }
    .end annotation
.end field

.field public static final GEOGRAPHICAL_SCOPE_CELL_WIDE:I = 0x3

.field public static final GEOGRAPHICAL_SCOPE_CELL_WIDE_IMMEDIATE:I = 0x0

.field public static final GEOGRAPHICAL_SCOPE_LA_WIDE:I = 0x2

.field public static final GEOGRAPHICAL_SCOPE_PLMN_WIDE:I = 0x1

.field protected static final LOG_TAG:Ljava/lang/String; = "SMSCB"

.field public static final MESSAGE_FORMAT_3GPP:I = 0x1

.field public static final MESSAGE_FORMAT_3GPP2:I = 0x2

.field public static final MESSAGE_PRIORITY_EMERGENCY:I = 0x3

.field public static final MESSAGE_PRIORITY_INTERACTIVE:I = 0x1

.field public static final MESSAGE_PRIORITY_NORMAL:I = 0x0

.field public static final MESSAGE_PRIORITY_URGENT:I = 0x2


# instance fields
.field private final mBody:Ljava/lang/String;

.field private final mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

.field private final mEtwsWarningInfo:Landroid/telephony/SmsCbEtwsInfo;

.field private final mGeographicalScope:I

.field private final mLanguage:Ljava/lang/String;

.field private final mLocation:Landroid/telephony/SmsCbLocation;

.field private final mMessageFormat:I

.field private final mPriority:I

.field private final mSerialNumber:I

.field private final mServiceCategory:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 222
    new-instance v0, Landroid/telephony/SmsCbMessage$1;

    invoke-direct {v0}, Landroid/telephony/SmsCbMessage$1;-><init>()V

    sput-object v0, Landroid/telephony/SmsCbMessage;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(IIILandroid/telephony/SmsCbLocation;ILjava/lang/String;Ljava/lang/String;ILandroid/telephony/SmsCbEtwsInfo;Landroid/telephony/SmsCbCmasInfo;)V
    .registers 11
    .parameter "messageFormat"
    .parameter "geographicalScope"
    .parameter "serialNumber"
    .parameter "location"
    .parameter "serviceCategory"
    .parameter "language"
    .parameter "body"
    .parameter "priority"
    .parameter "etwsWarningInfo"
    .parameter "cmasWarningInfo"

    .prologue
    .line 149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 150
    iput p1, p0, Landroid/telephony/SmsCbMessage;->mMessageFormat:I

    .line 151
    iput p2, p0, Landroid/telephony/SmsCbMessage;->mGeographicalScope:I

    .line 152
    iput p3, p0, Landroid/telephony/SmsCbMessage;->mSerialNumber:I

    .line 153
    iput-object p4, p0, Landroid/telephony/SmsCbMessage;->mLocation:Landroid/telephony/SmsCbLocation;

    .line 154
    iput p5, p0, Landroid/telephony/SmsCbMessage;->mServiceCategory:I

    .line 155
    iput-object p6, p0, Landroid/telephony/SmsCbMessage;->mLanguage:Ljava/lang/String;

    .line 156
    iput-object p7, p0, Landroid/telephony/SmsCbMessage;->mBody:Ljava/lang/String;

    .line 157
    iput p8, p0, Landroid/telephony/SmsCbMessage;->mPriority:I

    .line 158
    iput-object p9, p0, Landroid/telephony/SmsCbMessage;->mEtwsWarningInfo:Landroid/telephony/SmsCbEtwsInfo;

    .line 159
    iput-object p10, p0, Landroid/telephony/SmsCbMessage;->mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

    .line 160
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .registers 5
    .parameter "in"

    .prologue
    const/4 v2, 0x0

    .line 163
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 164
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Landroid/telephony/SmsCbMessage;->mMessageFormat:I

    .line 165
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Landroid/telephony/SmsCbMessage;->mGeographicalScope:I

    .line 166
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Landroid/telephony/SmsCbMessage;->mSerialNumber:I

    .line 167
    new-instance v1, Landroid/telephony/SmsCbLocation;

    invoke-direct {v1, p1}, Landroid/telephony/SmsCbLocation;-><init>(Landroid/os/Parcel;)V

    iput-object v1, p0, Landroid/telephony/SmsCbMessage;->mLocation:Landroid/telephony/SmsCbLocation;

    .line 168
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Landroid/telephony/SmsCbMessage;->mServiceCategory:I

    .line 169
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/telephony/SmsCbMessage;->mLanguage:Ljava/lang/String;

    .line 170
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Landroid/telephony/SmsCbMessage;->mBody:Ljava/lang/String;

    .line 171
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    iput v1, p0, Landroid/telephony/SmsCbMessage;->mPriority:I

    .line 172
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 173
    .local v0, type:I
    packed-switch v0, :pswitch_data_56

    .line 187
    :pswitch_3c
    iput-object v2, p0, Landroid/telephony/SmsCbMessage;->mEtwsWarningInfo:Landroid/telephony/SmsCbEtwsInfo;

    .line 188
    iput-object v2, p0, Landroid/telephony/SmsCbMessage;->mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

    .line 190
    :goto_40
    return-void

    .line 176
    :pswitch_41
    new-instance v1, Landroid/telephony/SmsCbEtwsInfo;

    invoke-direct {v1, p1}, Landroid/telephony/SmsCbEtwsInfo;-><init>(Landroid/os/Parcel;)V

    iput-object v1, p0, Landroid/telephony/SmsCbMessage;->mEtwsWarningInfo:Landroid/telephony/SmsCbEtwsInfo;

    .line 177
    iput-object v2, p0, Landroid/telephony/SmsCbMessage;->mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

    goto :goto_40

    .line 182
    :pswitch_4b
    iput-object v2, p0, Landroid/telephony/SmsCbMessage;->mEtwsWarningInfo:Landroid/telephony/SmsCbEtwsInfo;

    .line 183
    new-instance v1, Landroid/telephony/SmsCbCmasInfo;

    invoke-direct {v1, p1}, Landroid/telephony/SmsCbCmasInfo;-><init>(Landroid/os/Parcel;)V

    iput-object v1, p0, Landroid/telephony/SmsCbMessage;->mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

    goto :goto_40

    .line 173
    nop

    :pswitch_data_56
    .packed-switch 0x43
        :pswitch_4b
        :pswitch_3c
        :pswitch_41
    .end packed-switch
.end method


# virtual methods
.method public describeContents()I
    .registers 2

    .prologue
    .line 496
    const/4 v0, 0x0

    return v0
.end method

.method public getCmasAlertHandling()I
    .registers 4

    .prologue
    .line 425
    :try_start_0
    iget-object v1, p0, Landroid/telephony/SmsCbMessage;->mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

    invoke-virtual {v1}, Landroid/telephony/SmsCbCmasInfo;->getAlertHandling()I
    :try_end_5
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    .line 428
    :goto_6
    return v1

    .line 426
    :catch_7
    move-exception v0

    .line 427
    .local v0, e:Ljava/lang/NullPointerException;
    const-string v1, "SMSCB"

    const-string v2, "Null pointer exception in getCmasAlertHandling"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 428
    const/4 v1, 0x0

    goto :goto_6
.end method

.method public getCmasCategory()I
    .registers 4

    .prologue
    .line 372
    :try_start_0
    iget-object v1, p0, Landroid/telephony/SmsCbMessage;->mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

    invoke-virtual {v1}, Landroid/telephony/SmsCbCmasInfo;->getCategory()I
    :try_end_5
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    .line 375
    :goto_6
    return v1

    .line 373
    :catch_7
    move-exception v0

    .line 374
    .local v0, e:Ljava/lang/NullPointerException;
    const-string v1, "SMSCB"

    const-string v2, "Null pointer exception in getCmasCategory"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 375
    const/4 v1, 0x0

    goto :goto_6
.end method

.method public getCmasCertainty()I
    .registers 4

    .prologue
    .line 404
    :try_start_0
    iget-object v1, p0, Landroid/telephony/SmsCbMessage;->mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

    invoke-virtual {v1}, Landroid/telephony/SmsCbCmasInfo;->getCertainty()I
    :try_end_5
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    .line 407
    :goto_6
    return v1

    .line 405
    :catch_7
    move-exception v0

    .line 406
    .local v0, e:Ljava/lang/NullPointerException;
    const-string v1, "SMSCB"

    const-string v2, "Null pointer exception in getCmasCertainty"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 407
    const/4 v1, 0x0

    goto :goto_6
.end method

.method public getCmasMessageID()I
    .registers 4

    .prologue
    .line 416
    :try_start_0
    iget-object v1, p0, Landroid/telephony/SmsCbMessage;->mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

    invoke-virtual {v1}, Landroid/telephony/SmsCbCmasInfo;->getMessageID()I
    :try_end_5
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    .line 419
    :goto_6
    return v1

    .line 417
    :catch_7
    move-exception v0

    .line 418
    .local v0, e:Ljava/lang/NullPointerException;
    const-string v1, "SMSCB"

    const-string v2, "Null pointer exception in getCmasMessageID"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 419
    const/4 v1, 0x0

    goto :goto_6
.end method

.method public getCmasMsgExpires()J
    .registers 4

    .prologue
    .line 434
    :try_start_0
    iget-object v1, p0, Landroid/telephony/SmsCbMessage;->mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

    invoke-virtual {v1}, Landroid/telephony/SmsCbCmasInfo;->getMsgExpires()J
    :try_end_5
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_5} :catch_7

    move-result-wide v1

    .line 437
    :goto_6
    return-wide v1

    .line 435
    :catch_7
    move-exception v0

    .line 436
    .local v0, e:Ljava/lang/NullPointerException;
    const-string v1, "SMSCB"

    const-string v2, "Null pointer exception in getCmasMsgExpires"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 437
    const-wide/16 v1, 0x0

    goto :goto_6
.end method

.method public getCmasRecordTypeFirstExists()Z
    .registers 4

    .prologue
    .line 455
    :try_start_0
    iget-object v1, p0, Landroid/telephony/SmsCbMessage;->mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

    invoke-virtual {v1}, Landroid/telephony/SmsCbCmasInfo;->getCMASRecordTypeFirstExists()Z
    :try_end_5
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    .line 458
    :goto_6
    return v1

    .line 456
    :catch_7
    move-exception v0

    .line 457
    .local v0, e:Ljava/lang/NullPointerException;
    const-string v1, "SMSCB"

    const-string v2, "Null pointer exception in getCmasRecordTypeFirstExists"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 458
    const/4 v1, 0x0

    goto :goto_6
.end method

.method public getCmasRecordTypeSecondExists()Z
    .registers 4

    .prologue
    .line 464
    :try_start_0
    iget-object v1, p0, Landroid/telephony/SmsCbMessage;->mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

    invoke-virtual {v1}, Landroid/telephony/SmsCbCmasInfo;->getCMASRecordTypeSecondExists()Z
    :try_end_5
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    .line 467
    :goto_6
    return v1

    .line 465
    :catch_7
    move-exception v0

    .line 466
    .local v0, e:Ljava/lang/NullPointerException;
    const-string v1, "SMSCB"

    const-string v2, "Null pointer exception in getCmasRecordTypeSecondExists"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 467
    const/4 v1, 0x0

    goto :goto_6
.end method

.method public getCmasRecordTypeThirdExists()Z
    .registers 4

    .prologue
    .line 473
    :try_start_0
    iget-object v1, p0, Landroid/telephony/SmsCbMessage;->mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

    invoke-virtual {v1}, Landroid/telephony/SmsCbCmasInfo;->getCMASRecordTypeThirdExists()Z
    :try_end_5
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    .line 476
    :goto_6
    return v1

    .line 474
    :catch_7
    move-exception v0

    .line 475
    .local v0, e:Ljava/lang/NullPointerException;
    const-string v1, "SMSCB"

    const-string v2, "Null pointer exception in getCmasRecordTypeThirdExists"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 476
    const/4 v1, 0x0

    goto :goto_6
.end method

.method public getCmasRecordTypeZeroExists()Z
    .registers 4

    .prologue
    .line 446
    :try_start_0
    iget-object v1, p0, Landroid/telephony/SmsCbMessage;->mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

    invoke-virtual {v1}, Landroid/telephony/SmsCbCmasInfo;->getCMASRecordTypeZeroExists()Z
    :try_end_5
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    .line 449
    :goto_6
    return v1

    .line 447
    :catch_7
    move-exception v0

    .line 448
    .local v0, e:Ljava/lang/NullPointerException;
    const-string v1, "SMSCB"

    const-string v2, "Null pointer exception in getCmasRecordTypeZeroExists"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 449
    const/4 v1, 0x0

    goto :goto_6
.end method

.method public getCmasResponseType()I
    .registers 4

    .prologue
    .line 380
    :try_start_0
    iget-object v1, p0, Landroid/telephony/SmsCbMessage;->mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

    invoke-virtual {v1}, Landroid/telephony/SmsCbCmasInfo;->getResponseType()I
    :try_end_5
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    .line 383
    :goto_6
    return v1

    .line 381
    :catch_7
    move-exception v0

    .line 382
    .local v0, e:Ljava/lang/NullPointerException;
    const-string v1, "SMSCB"

    const-string v2, "Null pointer exception in getCmasResponseType"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 383
    const/4 v1, 0x0

    goto :goto_6
.end method

.method public getCmasSeverity()I
    .registers 4

    .prologue
    .line 388
    :try_start_0
    iget-object v1, p0, Landroid/telephony/SmsCbMessage;->mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

    invoke-virtual {v1}, Landroid/telephony/SmsCbCmasInfo;->getSeverity()I
    :try_end_5
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    .line 391
    :goto_6
    return v1

    .line 389
    :catch_7
    move-exception v0

    .line 390
    .local v0, e:Ljava/lang/NullPointerException;
    const-string v1, "SMSCB"

    const-string v2, "Null pointer exception in getCmasSeverity"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 391
    const/4 v1, 0x0

    goto :goto_6
.end method

.method public getCmasUrgency()I
    .registers 4

    .prologue
    .line 396
    :try_start_0
    iget-object v1, p0, Landroid/telephony/SmsCbMessage;->mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

    invoke-virtual {v1}, Landroid/telephony/SmsCbCmasInfo;->getUrgency()I
    :try_end_5
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_5} :catch_7

    move-result v1

    .line 399
    :goto_6
    return v1

    .line 397
    :catch_7
    move-exception v0

    .line 398
    .local v0, e:Ljava/lang/NullPointerException;
    const-string v1, "SMSCB"

    const-string v2, "Null pointer exception in getCmasUrgency"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 399
    const/4 v1, 0x0

    goto :goto_6
.end method

.method public getCmasWarningInfo()Landroid/telephony/SmsCbCmasInfo;
    .registers 2

    .prologue
    .line 340
    iget-object v0, p0, Landroid/telephony/SmsCbMessage;->mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

    return-object v0
.end method

.method public getEtwsWarningInfo()Landroid/telephony/SmsCbEtwsInfo;
    .registers 2

    .prologue
    .line 326
    iget-object v0, p0, Landroid/telephony/SmsCbMessage;->mEtwsWarningInfo:Landroid/telephony/SmsCbEtwsInfo;

    return-object v0
.end method

.method public getGeographicalScope()I
    .registers 2

    .prologue
    .line 241
    iget v0, p0, Landroid/telephony/SmsCbMessage;->mGeographicalScope:I

    return v0
.end method

.method public getLanguageCode()Ljava/lang/String;
    .registers 2

    .prologue
    .line 286
    iget-object v0, p0, Landroid/telephony/SmsCbMessage;->mLanguage:Ljava/lang/String;

    return-object v0
.end method

.method public getLocation()Landroid/telephony/SmsCbLocation;
    .registers 2

    .prologue
    .line 265
    iget-object v0, p0, Landroid/telephony/SmsCbMessage;->mLocation:Landroid/telephony/SmsCbLocation;

    return-object v0
.end method

.method public getMessageBody()Ljava/lang/String;
    .registers 2

    .prologue
    .line 295
    iget-object v0, p0, Landroid/telephony/SmsCbMessage;->mBody:Ljava/lang/String;

    return-object v0
.end method

.method public getMessageFormat()I
    .registers 2

    .prologue
    .line 303
    iget v0, p0, Landroid/telephony/SmsCbMessage;->mMessageFormat:I

    return v0
.end method

.method public getMessagePriority()I
    .registers 2

    .prologue
    .line 313
    iget v0, p0, Landroid/telephony/SmsCbMessage;->mPriority:I

    return v0
.end method

.method public getSerialNumber()I
    .registers 2

    .prologue
    .line 252
    iget v0, p0, Landroid/telephony/SmsCbMessage;->mSerialNumber:I

    return v0
.end method

.method public getServiceCategory()I
    .registers 2

    .prologue
    .line 277
    iget v0, p0, Landroid/telephony/SmsCbMessage;->mServiceCategory:I

    return v0
.end method

.method public isCmasMessage()Z
    .registers 2

    .prologue
    .line 364
    iget-object v0, p0, Landroid/telephony/SmsCbMessage;->mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isEmergencyMessage()Z
    .registers 3

    .prologue
    .line 348
    iget v0, p0, Landroid/telephony/SmsCbMessage;->mPriority:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_7

    const/4 v0, 0x1

    :goto_6
    return v0

    :cond_7
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public isEtwsMessage()Z
    .registers 2

    .prologue
    .line 356
    iget-object v0, p0, Landroid/telephony/SmsCbMessage;->mEtwsWarningInfo:Landroid/telephony/SmsCbEtwsInfo;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 482
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SmsCbMessage{geographicalScope="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/telephony/SmsCbMessage;->mGeographicalScope:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", serialNumber="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/telephony/SmsCbMessage;->mSerialNumber:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", location="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/telephony/SmsCbMessage;->mLocation:Landroid/telephony/SmsCbLocation;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", serviceCategory="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/telephony/SmsCbMessage;->mServiceCategory:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", language="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/telephony/SmsCbMessage;->mLanguage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", body="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/telephony/SmsCbMessage;->mBody:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", priority="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Landroid/telephony/SmsCbMessage;->mPriority:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Landroid/telephony/SmsCbMessage;->mEtwsWarningInfo:Landroid/telephony/SmsCbEtwsInfo;

    if-eqz v0, :cond_a6

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Landroid/telephony/SmsCbMessage;->mEtwsWarningInfo:Landroid/telephony/SmsCbEtwsInfo;

    invoke-virtual {v2}, Landroid/telephony/SmsCbEtwsInfo;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_76
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v0, p0, Landroid/telephony/SmsCbMessage;->mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

    if-eqz v0, :cond_a9

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Landroid/telephony/SmsCbMessage;->mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

    invoke-virtual {v2}, Landroid/telephony/SmsCbCmasInfo;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_97
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_a6
    const-string v0, ""

    goto :goto_76

    :cond_a9
    const-string v0, ""

    goto :goto_97
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .registers 4
    .parameter "dest"
    .parameter "flags"

    .prologue
    .line 200
    iget v0, p0, Landroid/telephony/SmsCbMessage;->mMessageFormat:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 201
    iget v0, p0, Landroid/telephony/SmsCbMessage;->mGeographicalScope:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 202
    iget v0, p0, Landroid/telephony/SmsCbMessage;->mSerialNumber:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 203
    iget-object v0, p0, Landroid/telephony/SmsCbMessage;->mLocation:Landroid/telephony/SmsCbLocation;

    invoke-virtual {v0, p1, p2}, Landroid/telephony/SmsCbLocation;->writeToParcel(Landroid/os/Parcel;I)V

    .line 204
    iget v0, p0, Landroid/telephony/SmsCbMessage;->mServiceCategory:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 205
    iget-object v0, p0, Landroid/telephony/SmsCbMessage;->mLanguage:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 206
    iget-object v0, p0, Landroid/telephony/SmsCbMessage;->mBody:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 207
    iget v0, p0, Landroid/telephony/SmsCbMessage;->mPriority:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 208
    iget-object v0, p0, Landroid/telephony/SmsCbMessage;->mEtwsWarningInfo:Landroid/telephony/SmsCbEtwsInfo;

    if-eqz v0, :cond_37

    .line 210
    const/16 v0, 0x45

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 211
    iget-object v0, p0, Landroid/telephony/SmsCbMessage;->mEtwsWarningInfo:Landroid/telephony/SmsCbEtwsInfo;

    invoke-virtual {v0, p1, p2}, Landroid/telephony/SmsCbEtwsInfo;->writeToParcel(Landroid/os/Parcel;I)V

    .line 220
    :goto_36
    return-void

    .line 212
    :cond_37
    iget-object v0, p0, Landroid/telephony/SmsCbMessage;->mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

    if-eqz v0, :cond_46

    .line 214
    const/16 v0, 0x43

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 215
    iget-object v0, p0, Landroid/telephony/SmsCbMessage;->mCmasWarningInfo:Landroid/telephony/SmsCbCmasInfo;

    invoke-virtual {v0, p1, p2}, Landroid/telephony/SmsCbCmasInfo;->writeToParcel(Landroid/os/Parcel;I)V

    goto :goto_36

    .line 218
    :cond_46
    const/16 v0, 0x30

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_36
.end method