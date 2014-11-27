.class public Landroid/telephony/MultiSimSmsManager;
.super Ljava/lang/Object;
.source "MultiSimSmsManager.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "MultiSimSmsManager"

.field private static sInstance:[Landroid/telephony/SmsManager;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 61
    const/4 v1, 0x0

    sput-object v1, Landroid/telephony/MultiSimSmsManager;->sInstance:[Landroid/telephony/SmsManager;

    .line 65
    invoke-static {}, Lcom/android/internal/telephony/MultiSimManager;->getSimSlotCount()I

    move-result v1

    new-array v1, v1, [Landroid/telephony/SmsManager;

    sput-object v1, Landroid/telephony/MultiSimSmsManager;->sInstance:[Landroid/telephony/SmsManager;

    .line 66
    const/4 v0, 0x0

    .local v0, simSlotNum:I
    :goto_c
    sget-object v1, Landroid/telephony/MultiSimSmsManager;->sInstance:[Landroid/telephony/SmsManager;

    array-length v1, v1

    if-ge v0, v1, :cond_2a

    .line 67
    sget-object v1, Landroid/telephony/MultiSimSmsManager;->sInstance:[Landroid/telephony/SmsManager;

    new-instance v2, Landroid/telephony/SmsManager;

    invoke-direct {v2}, Landroid/telephony/SmsManager;-><init>()V

    aput-object v2, v1, v0

    .line 68
    sget-object v1, Landroid/telephony/MultiSimSmsManager;->sInstance:[Landroid/telephony/SmsManager;

    aget-object v1, v1, v0

    const-string v2, "isms"

    invoke-static {v2, v0}, Lcom/android/internal/telephony/MultiSimManager;->appendSimSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/telephony/SmsManager;->SetServiceName(Ljava/lang/String;)V

    .line 66
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 70
    :cond_2a
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDefault()Landroid/telephony/SmsManager;
    .registers 2

    .prologue
    .line 78
    sget-object v0, Landroid/telephony/MultiSimSmsManager;->sInstance:[Landroid/telephony/SmsManager;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    return-object v0
.end method

.method public static getDefault(I)Landroid/telephony/SmsManager;
    .registers 3
    .parameter "simSlot"

    .prologue
    .line 85
    sget-object v0, Landroid/telephony/MultiSimSmsManager;->sInstance:[Landroid/telephony/SmsManager;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    return-object v0
.end method
