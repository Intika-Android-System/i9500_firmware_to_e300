.class synthetic Lcom/movial/ipphone/IPCallTracker$2;
.super Ljava/lang/Object;
.source "IPCallTracker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/movial/ipphone/IPCallTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$android$internal$telephony$Call$State:[I

.field static final synthetic $SwitchMap$com$movial$ipphone$SessionCall$State:[I


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 525
    invoke-static {}, Lcom/android/internal/telephony/Call$State;->values()[Lcom/android/internal/telephony/Call$State;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/movial/ipphone/IPCallTracker$2;->$SwitchMap$com$android$internal$telephony$Call$State:[I

    :try_start_9
    sget-object v0, Lcom/movial/ipphone/IPCallTracker$2;->$SwitchMap$com$android$internal$telephony$Call$State:[I

    sget-object v1, Lcom/android/internal/telephony/Call$State;->WAITING:Lcom/android/internal/telephony/Call$State;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_14} :catch_6c

    :goto_14
    :try_start_14
    sget-object v0, Lcom/movial/ipphone/IPCallTracker$2;->$SwitchMap$com$android$internal$telephony$Call$State:[I

    sget-object v1, Lcom/android/internal/telephony/Call$State;->INCOMING:Lcom/android/internal/telephony/Call$State;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_1f} :catch_6a

    .line 500
    :goto_1f
    invoke-static {}, Lcom/movial/ipphone/SessionCall$State;->values()[Lcom/movial/ipphone/SessionCall$State;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/movial/ipphone/IPCallTracker$2;->$SwitchMap$com$movial$ipphone$SessionCall$State:[I

    :try_start_28
    sget-object v0, Lcom/movial/ipphone/IPCallTracker$2;->$SwitchMap$com$movial$ipphone$SessionCall$State:[I

    sget-object v1, Lcom/movial/ipphone/SessionCall$State;->HOLDING:Lcom/movial/ipphone/SessionCall$State;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_33
    .catch Ljava/lang/NoSuchFieldError; {:try_start_28 .. :try_end_33} :catch_68

    :goto_33
    :try_start_33
    sget-object v0, Lcom/movial/ipphone/IPCallTracker$2;->$SwitchMap$com$movial$ipphone$SessionCall$State:[I

    sget-object v1, Lcom/movial/ipphone/SessionCall$State;->DISCONNECTED:Lcom/movial/ipphone/SessionCall$State;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_3e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_33 .. :try_end_3e} :catch_66

    :goto_3e
    :try_start_3e
    sget-object v0, Lcom/movial/ipphone/IPCallTracker$2;->$SwitchMap$com$movial$ipphone$SessionCall$State:[I

    sget-object v1, Lcom/movial/ipphone/SessionCall$State;->INCOMING:Lcom/movial/ipphone/SessionCall$State;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_49
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3e .. :try_end_49} :catch_64

    :goto_49
    :try_start_49
    sget-object v0, Lcom/movial/ipphone/IPCallTracker$2;->$SwitchMap$com$movial$ipphone$SessionCall$State:[I

    sget-object v1, Lcom/movial/ipphone/SessionCall$State;->WAITING:Lcom/movial/ipphone/SessionCall$State;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_54
    .catch Ljava/lang/NoSuchFieldError; {:try_start_49 .. :try_end_54} :catch_62

    :goto_54
    :try_start_54
    sget-object v0, Lcom/movial/ipphone/IPCallTracker$2;->$SwitchMap$com$movial$ipphone$SessionCall$State:[I

    sget-object v1, Lcom/movial/ipphone/SessionCall$State;->ACTIVE:Lcom/movial/ipphone/SessionCall$State;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_5f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_54 .. :try_end_5f} :catch_60

    :goto_5f
    return-void

    :catch_60
    move-exception v0

    goto :goto_5f

    :catch_62
    move-exception v0

    goto :goto_54

    :catch_64
    move-exception v0

    goto :goto_49

    :catch_66
    move-exception v0

    goto :goto_3e

    :catch_68
    move-exception v0

    goto :goto_33

    .line 525
    :catch_6a
    move-exception v0

    goto :goto_1f

    :catch_6c
    move-exception v0

    goto :goto_14
.end method
