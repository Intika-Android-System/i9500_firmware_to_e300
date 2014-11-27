.class public Lcom/android/internal/telephony/MultiSimPhoneFactory;
.super Lcom/android/internal/telephony/PhoneFactory;
.source "MultiSimPhoneFactory.java"


# static fields
.field static final LOG_TAG:Ljava/lang/String; = "MULTISIMPHONE"

.field static final SOCKET_OPEN_MAX_RETRY:I = 0x3

.field static final SOCKET_OPEN_RETRY_MILLIS:I = 0x7d0

.field private static mCardSubscriptionManager:Lcom/android/internal/telephony/CardSubscriptionManager;

.field private static mSubscriptionManager:Lcom/android/internal/telephony/SubscriptionManager;

.field private static sCommandsInterface:[Lcom/android/internal/telephony/CommandsInterface;

.field private static sPhoneNotifier:[Lcom/android/internal/telephony/PhoneNotifier;

.field private static sProxyPhone:[Lcom/android/internal/telephony/Phone;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    const/4 v0, 0x0

    .line 50
    sput-object v0, Lcom/android/internal/telephony/MultiSimPhoneFactory;->sProxyPhone:[Lcom/android/internal/telephony/Phone;

    .line 51
    sput-object v0, Lcom/android/internal/telephony/MultiSimPhoneFactory;->sCommandsInterface:[Lcom/android/internal/telephony/CommandsInterface;

    .line 61
    invoke-static {}, Lcom/android/internal/telephony/MultiSimManager;->getSimSlotCount()I

    move-result v0

    new-array v0, v0, [Lcom/android/internal/telephony/Phone;

    sput-object v0, Lcom/android/internal/telephony/MultiSimPhoneFactory;->sProxyPhone:[Lcom/android/internal/telephony/Phone;

    .line 62
    invoke-static {}, Lcom/android/internal/telephony/MultiSimManager;->getSimSlotCount()I

    move-result v0

    new-array v0, v0, [Lcom/android/internal/telephony/CommandsInterface;

    sput-object v0, Lcom/android/internal/telephony/MultiSimPhoneFactory;->sCommandsInterface:[Lcom/android/internal/telephony/CommandsInterface;

    .line 63
    invoke-static {}, Lcom/android/internal/telephony/MultiSimManager;->getSimSlotCount()I

    move-result v0

    new-array v0, v0, [Lcom/android/internal/telephony/PhoneNotifier;

    sput-object v0, Lcom/android/internal/telephony/MultiSimPhoneFactory;->sPhoneNotifier:[Lcom/android/internal/telephony/PhoneNotifier;

    .line 64
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Lcom/android/internal/telephony/PhoneFactory;-><init>()V

    return-void
.end method

.method public static getCdmaPhone(I)Lcom/android/internal/telephony/Phone;
    .registers 2
    .parameter "simSlot"

    .prologue
    .line 234
    invoke-static {}, Lcom/android/internal/telephony/PhoneFactory;->getCdmaPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    return-object v0
.end method

.method public static getDefaultPhone(I)Lcom/android/internal/telephony/Phone;
    .registers 2
    .parameter "simSlot"

    .prologue
    .line 218
    invoke-static {}, Lcom/android/internal/telephony/PhoneFactory;->getDefaultPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    return-object v0
.end method

.method public static getGsmPhone(I)Lcom/android/internal/telephony/Phone;
    .registers 2
    .parameter "simSlot"

    .prologue
    .line 257
    invoke-static {}, Lcom/android/internal/telephony/PhoneFactory;->getGsmPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v0

    return-object v0
.end method

.method public static makeDefaultPhone(Landroid/content/Context;)V
    .registers 1
    .parameter "context"

    .prologue
    .line 81
    invoke-static {p0}, Lcom/android/internal/telephony/PhoneFactory;->makeDefaultPhone(Landroid/content/Context;)V

    .line 208
    return-void
.end method

.method public static makeDefaultPhones(Landroid/content/Context;)V
    .registers 1
    .parameter "context"

    .prologue
    .line 69
    invoke-static {p0}, Lcom/android/internal/telephony/PhoneFactory;->makeDefaultPhones(Landroid/content/Context;)V

    .line 73
    return-void
.end method

.method private static setDefaultPhone()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 211
    sget-object v0, Lcom/android/internal/telephony/MultiSimPhoneFactory;->sProxyPhone:[Lcom/android/internal/telephony/Phone;

    aget-object v0, v0, v1

    sput-object v0, Lcom/android/internal/telephony/PhoneFactory;->sProxyPhone:Lcom/android/internal/telephony/Phone;

    .line 212
    sget-object v0, Lcom/android/internal/telephony/MultiSimPhoneFactory;->sCommandsInterface:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v0, v0, v1

    sput-object v0, Lcom/android/internal/telephony/PhoneFactory;->sCommandsInterface:Lcom/android/internal/telephony/CommandsInterface;

    .line 213
    sget-object v0, Lcom/android/internal/telephony/MultiSimPhoneFactory;->sPhoneNotifier:[Lcom/android/internal/telephony/PhoneNotifier;

    aget-object v0, v0, v1

    sput-object v0, Lcom/android/internal/telephony/PhoneFactory;->sPhoneNotifier:Lcom/android/internal/telephony/PhoneNotifier;

    .line 214
    return-void
.end method
