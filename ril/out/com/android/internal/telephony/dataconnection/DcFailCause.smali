.class public final enum Lcom/android/internal/telephony/dataconnection/DcFailCause;
.super Ljava/lang/Enum;
.source "DcFailCause.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/android/internal/telephony/dataconnection/DcFailCause;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum ACTIVATION_REJECT_GGSN:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum ACTIVATION_REJECT_UNSPECIFIED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum APN_TYPE_CONFLICT:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum CONNECTION_TO_DATACONNECTIONAC_BROKEN:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum ERROR_UNSPECIFIED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum GPRS_REGISTRATION_FAIL:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum INSUFFICIENT_RESOURCES:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum LOST_CONNECTION:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum MISSING_UNKNOWN_APN:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum NONE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum NSAPI_IN_USE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum ONLY_IPV4_ALLOWED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum ONLY_IPV6_ALLOWED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum ONLY_SINGLE_BEARER_ALLOWED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum OPERATOR_BARRED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum PREF_RADIO_TECH_CHANGED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum PROTOCOL_ERRORS:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum RADIO_NOT_AVAILABLE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum RADIO_POWER_OFF:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum REGISTRATION_FAIL:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum REGULAR_DEACTIVATION:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum RESET_BY_FRAMEWORK:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum SERVICE_OPTION_NOT_SUBSCRIBED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum SERVICE_OPTION_NOT_SUPPORTED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum SERVICE_OPTION_OUT_OF_ORDER:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum SIGNAL_LOST:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum TETHERED_CALL_ACTIVE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum UNACCEPTABLE_NETWORK_PARAMETER:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum UNKNOWN:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum UNKNOWN_PDP_ADDRESS_TYPE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field public static final enum USER_AUTHENTICATION:Lcom/android/internal/telephony/dataconnection/DcFailCause;

.field private static final sErrorCodeToFailCauseMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/android/internal/telephony/dataconnection/DcFailCause;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mErrorCode:I


# direct methods
.method static constructor <clinit>()V
    .registers 13

    .prologue
    const/16 v12, 0x1c

    const/16 v11, 0x1b

    const/16 v10, 0x1a

    const/16 v9, 0x8

    const/4 v8, 0x0

    .line 25
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "NONE"

    invoke-direct {v4, v5, v8, v8}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->NONE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 29
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "OPERATOR_BARRED"

    const/4 v6, 0x1

    invoke-direct {v4, v5, v6, v9}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->OPERATOR_BARRED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 30
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "INSUFFICIENT_RESOURCES"

    const/4 v6, 0x2

    invoke-direct {v4, v5, v6, v10}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->INSUFFICIENT_RESOURCES:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 31
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "MISSING_UNKNOWN_APN"

    const/4 v6, 0x3

    invoke-direct {v4, v5, v6, v11}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->MISSING_UNKNOWN_APN:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 32
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "UNKNOWN_PDP_ADDRESS_TYPE"

    const/4 v6, 0x4

    invoke-direct {v4, v5, v6, v12}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->UNKNOWN_PDP_ADDRESS_TYPE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 33
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "USER_AUTHENTICATION"

    const/4 v6, 0x5

    const/16 v7, 0x1d

    invoke-direct {v4, v5, v6, v7}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->USER_AUTHENTICATION:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 34
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "ACTIVATION_REJECT_GGSN"

    const/4 v6, 0x6

    const/16 v7, 0x1e

    invoke-direct {v4, v5, v6, v7}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ACTIVATION_REJECT_GGSN:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 35
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "ACTIVATION_REJECT_UNSPECIFIED"

    const/4 v6, 0x7

    const/16 v7, 0x1f

    invoke-direct {v4, v5, v6, v7}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ACTIVATION_REJECT_UNSPECIFIED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 36
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "SERVICE_OPTION_NOT_SUPPORTED"

    const/16 v6, 0x20

    invoke-direct {v4, v5, v9, v6}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->SERVICE_OPTION_NOT_SUPPORTED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 37
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "SERVICE_OPTION_NOT_SUBSCRIBED"

    const/16 v6, 0x9

    const/16 v7, 0x21

    invoke-direct {v4, v5, v6, v7}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->SERVICE_OPTION_NOT_SUBSCRIBED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 38
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "SERVICE_OPTION_OUT_OF_ORDER"

    const/16 v6, 0xa

    const/16 v7, 0x22

    invoke-direct {v4, v5, v6, v7}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->SERVICE_OPTION_OUT_OF_ORDER:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 39
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "NSAPI_IN_USE"

    const/16 v6, 0xb

    const/16 v7, 0x23

    invoke-direct {v4, v5, v6, v7}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->NSAPI_IN_USE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 40
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "REGULAR_DEACTIVATION"

    const/16 v6, 0xc

    const/16 v7, 0x24

    invoke-direct {v4, v5, v6, v7}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->REGULAR_DEACTIVATION:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 41
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "ONLY_IPV4_ALLOWED"

    const/16 v6, 0xd

    const/16 v7, 0x32

    invoke-direct {v4, v5, v6, v7}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ONLY_IPV4_ALLOWED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 42
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "ONLY_IPV6_ALLOWED"

    const/16 v6, 0xe

    const/16 v7, 0x33

    invoke-direct {v4, v5, v6, v7}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ONLY_IPV6_ALLOWED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 43
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "ONLY_SINGLE_BEARER_ALLOWED"

    const/16 v6, 0xf

    const/16 v7, 0x34

    invoke-direct {v4, v5, v6, v7}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ONLY_SINGLE_BEARER_ALLOWED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 44
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "PROTOCOL_ERRORS"

    const/16 v6, 0x10

    const/16 v7, 0x6f

    invoke-direct {v4, v5, v6, v7}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->PROTOCOL_ERRORS:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 45
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "APN_TYPE_CONFLICT"

    const/16 v6, 0x11

    const/16 v7, 0x70

    invoke-direct {v4, v5, v6, v7}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->APN_TYPE_CONFLICT:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 49
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "REGISTRATION_FAIL"

    const/16 v6, 0x12

    const/4 v7, -0x1

    invoke-direct {v4, v5, v6, v7}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->REGISTRATION_FAIL:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 50
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "GPRS_REGISTRATION_FAIL"

    const/16 v6, 0x13

    const/4 v7, -0x2

    invoke-direct {v4, v5, v6, v7}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->GPRS_REGISTRATION_FAIL:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 51
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "SIGNAL_LOST"

    const/16 v6, 0x14

    const/4 v7, -0x3

    invoke-direct {v4, v5, v6, v7}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->SIGNAL_LOST:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 52
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "PREF_RADIO_TECH_CHANGED"

    const/16 v6, 0x15

    const/4 v7, -0x4

    invoke-direct {v4, v5, v6, v7}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->PREF_RADIO_TECH_CHANGED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 53
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "RADIO_POWER_OFF"

    const/16 v6, 0x16

    const/4 v7, -0x5

    invoke-direct {v4, v5, v6, v7}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->RADIO_POWER_OFF:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 54
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "TETHERED_CALL_ACTIVE"

    const/16 v6, 0x17

    const/4 v7, -0x6

    invoke-direct {v4, v5, v6, v7}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->TETHERED_CALL_ACTIVE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 55
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "ERROR_UNSPECIFIED"

    const/16 v6, 0x18

    const v7, 0xffff

    invoke-direct {v4, v5, v6, v7}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ERROR_UNSPECIFIED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 59
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "UNKNOWN"

    const/16 v6, 0x19

    const/high16 v7, 0x1

    invoke-direct {v4, v5, v6, v7}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->UNKNOWN:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 60
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "RADIO_NOT_AVAILABLE"

    const v6, 0x10001

    invoke-direct {v4, v5, v10, v6}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->RADIO_NOT_AVAILABLE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 61
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "UNACCEPTABLE_NETWORK_PARAMETER"

    const v6, 0x10002

    invoke-direct {v4, v5, v11, v6}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->UNACCEPTABLE_NETWORK_PARAMETER:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 62
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "CONNECTION_TO_DATACONNECTIONAC_BROKEN"

    const v6, 0x10003

    invoke-direct {v4, v5, v12, v6}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->CONNECTION_TO_DATACONNECTIONAC_BROKEN:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 63
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "LOST_CONNECTION"

    const/16 v6, 0x1d

    const v7, 0x10004

    invoke-direct {v4, v5, v6, v7}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->LOST_CONNECTION:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 64
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    const-string v5, "RESET_BY_FRAMEWORK"

    const/16 v6, 0x1e

    const v7, 0x10005

    invoke-direct {v4, v5, v6, v7}, Lcom/android/internal/telephony/dataconnection/DcFailCause;-><init>(Ljava/lang/String;II)V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->RESET_BY_FRAMEWORK:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 24
    const/16 v4, 0x1f

    new-array v4, v4, [Lcom/android/internal/telephony/dataconnection/DcFailCause;

    sget-object v5, Lcom/android/internal/telephony/dataconnection/DcFailCause;->NONE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v5, v4, v8

    const/4 v5, 0x1

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->OPERATOR_BARRED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/4 v5, 0x2

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->INSUFFICIENT_RESOURCES:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/4 v5, 0x3

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->MISSING_UNKNOWN_APN:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/4 v5, 0x4

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->UNKNOWN_PDP_ADDRESS_TYPE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/4 v5, 0x5

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->USER_AUTHENTICATION:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/4 v5, 0x6

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ACTIVATION_REJECT_GGSN:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/4 v5, 0x7

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ACTIVATION_REJECT_UNSPECIFIED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    sget-object v5, Lcom/android/internal/telephony/dataconnection/DcFailCause;->SERVICE_OPTION_NOT_SUPPORTED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v5, v4, v9

    const/16 v5, 0x9

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->SERVICE_OPTION_NOT_SUBSCRIBED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/16 v5, 0xa

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->SERVICE_OPTION_OUT_OF_ORDER:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/16 v5, 0xb

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->NSAPI_IN_USE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/16 v5, 0xc

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->REGULAR_DEACTIVATION:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/16 v5, 0xd

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ONLY_IPV4_ALLOWED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/16 v5, 0xe

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ONLY_IPV6_ALLOWED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/16 v5, 0xf

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ONLY_SINGLE_BEARER_ALLOWED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/16 v5, 0x10

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->PROTOCOL_ERRORS:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/16 v5, 0x11

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->APN_TYPE_CONFLICT:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/16 v5, 0x12

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->REGISTRATION_FAIL:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/16 v5, 0x13

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->GPRS_REGISTRATION_FAIL:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/16 v5, 0x14

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->SIGNAL_LOST:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/16 v5, 0x15

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->PREF_RADIO_TECH_CHANGED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/16 v5, 0x16

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->RADIO_POWER_OFF:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/16 v5, 0x17

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->TETHERED_CALL_ACTIVE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/16 v5, 0x18

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ERROR_UNSPECIFIED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/16 v5, 0x19

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->UNKNOWN:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    sget-object v5, Lcom/android/internal/telephony/dataconnection/DcFailCause;->RADIO_NOT_AVAILABLE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v5, v4, v10

    sget-object v5, Lcom/android/internal/telephony/dataconnection/DcFailCause;->UNACCEPTABLE_NETWORK_PARAMETER:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v5, v4, v11

    sget-object v5, Lcom/android/internal/telephony/dataconnection/DcFailCause;->CONNECTION_TO_DATACONNECTIONAC_BROKEN:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v5, v4, v12

    const/16 v5, 0x1d

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->LOST_CONNECTION:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    const/16 v5, 0x1e

    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->RESET_BY_FRAMEWORK:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    aput-object v6, v4, v5

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->$VALUES:[Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 69
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    sput-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->sErrorCodeToFailCauseMap:Ljava/util/HashMap;

    .line 70
    invoke-static {}, Lcom/android/internal/telephony/dataconnection/DcFailCause;->values()[Lcom/android/internal/telephony/dataconnection/DcFailCause;

    move-result-object v0

    .local v0, arr$:[Lcom/android/internal/telephony/dataconnection/DcFailCause;
    array-length v3, v0

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_23d
    if-ge v2, v3, :cond_251

    aget-object v1, v0, v2

    .line 71
    .local v1, fc:Lcom/android/internal/telephony/dataconnection/DcFailCause;
    sget-object v4, Lcom/android/internal/telephony/dataconnection/DcFailCause;->sErrorCodeToFailCauseMap:Ljava/util/HashMap;

    invoke-virtual {v1}, Lcom/android/internal/telephony/dataconnection/DcFailCause;->getErrorCode()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    add-int/lit8 v2, v2, 0x1

    goto :goto_23d

    .line 73
    .end local v1           #fc:Lcom/android/internal/telephony/dataconnection/DcFailCause;
    :cond_251
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .registers 4
    .parameter
    .parameter
    .parameter "errorCode"
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 75
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 76
    iput p3, p0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->mErrorCode:I

    .line 77
    return-void
.end method

.method public static fromInt(I)Lcom/android/internal/telephony/dataconnection/DcFailCause;
    .registers 4
    .parameter "errorCode"

    .prologue
    .line 115
    sget-object v1, Lcom/android/internal/telephony/dataconnection/DcFailCause;->sErrorCodeToFailCauseMap:Ljava/util/HashMap;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 116
    .local v0, fc:Lcom/android/internal/telephony/dataconnection/DcFailCause;
    if-nez v0, :cond_10

    .line 117
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->UNKNOWN:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 119
    :cond_10
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/internal/telephony/dataconnection/DcFailCause;
    .registers 2
    .parameter "name"

    .prologue
    .line 24
    const-class v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    return-object v0
.end method

.method public static values()[Lcom/android/internal/telephony/dataconnection/DcFailCause;
    .registers 1

    .prologue
    .line 24
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->$VALUES:[Lcom/android/internal/telephony/dataconnection/DcFailCause;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/internal/telephony/dataconnection/DcFailCause;

    return-object v0
.end method


# virtual methods
.method public getErrorCode()I
    .registers 2

    .prologue
    .line 80
    iget v0, p0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->mErrorCode:I

    return v0
.end method

.method public isDataConnectionErrorFromCp()Z
    .registers 2

    .prologue
    .line 124
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->OPERATOR_BARRED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_40

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->INSUFFICIENT_RESOURCES:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_40

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->MISSING_UNKNOWN_APN:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_40

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->UNKNOWN_PDP_ADDRESS_TYPE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_40

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->USER_AUTHENTICATION:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_40

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ACTIVATION_REJECT_GGSN:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_40

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ACTIVATION_REJECT_UNSPECIFIED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_40

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->SERVICE_OPTION_NOT_SUPPORTED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_40

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->SERVICE_OPTION_NOT_SUBSCRIBED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_40

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->SERVICE_OPTION_OUT_OF_ORDER:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_40

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->NSAPI_IN_USE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_40

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ONLY_IPV4_ALLOWED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_40

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ONLY_IPV6_ALLOWED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_40

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ONLY_SINGLE_BEARER_ALLOWED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_40

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->PROTOCOL_ERRORS:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_40

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->APN_TYPE_CONFLICT:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-ne p0, v0, :cond_42

    :cond_40
    const/4 v0, 0x1

    :goto_41
    return v0

    :cond_42
    const/4 v0, 0x0

    goto :goto_41
.end method

.method public isEventLoggable()Z
    .registers 2

    .prologue
    .line 102
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->OPERATOR_BARRED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_44

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->INSUFFICIENT_RESOURCES:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_44

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->UNKNOWN_PDP_ADDRESS_TYPE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_44

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->USER_AUTHENTICATION:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_44

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ACTIVATION_REJECT_GGSN:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_44

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ACTIVATION_REJECT_UNSPECIFIED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_44

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->SERVICE_OPTION_NOT_SUBSCRIBED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_44

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->SERVICE_OPTION_NOT_SUPPORTED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_44

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->SERVICE_OPTION_OUT_OF_ORDER:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_44

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->NSAPI_IN_USE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_44

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ONLY_IPV4_ALLOWED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_44

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ONLY_IPV6_ALLOWED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_44

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->PROTOCOL_ERRORS:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_44

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->SIGNAL_LOST:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_44

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->RADIO_POWER_OFF:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_44

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->TETHERED_CALL_ACTIVE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_44

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->UNACCEPTABLE_NETWORK_PARAMETER:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-ne p0, v0, :cond_46

    :cond_44
    const/4 v0, 0x1

    :goto_45
    return v0

    :cond_46
    const/4 v0, 0x0

    goto :goto_45
.end method

.method public isPermanentFail()Z
    .registers 2

    .prologue
    .line 89
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->OPERATOR_BARRED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_50

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->INSUFFICIENT_RESOURCES:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_50

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->MISSING_UNKNOWN_APN:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_50

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->UNKNOWN_PDP_ADDRESS_TYPE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_50

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->USER_AUTHENTICATION:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_50

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ACTIVATION_REJECT_GGSN:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_50

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ACTIVATION_REJECT_UNSPECIFIED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_50

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->SERVICE_OPTION_NOT_SUPPORTED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_50

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->SERVICE_OPTION_NOT_SUBSCRIBED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_50

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->SERVICE_OPTION_OUT_OF_ORDER:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_50

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->NSAPI_IN_USE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_50

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ONLY_IPV4_ALLOWED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_50

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ONLY_IPV6_ALLOWED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_50

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ONLY_SINGLE_BEARER_ALLOWED:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_50

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->PROTOCOL_ERRORS:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_50

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->APN_TYPE_CONFLICT:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_50

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->RADIO_POWER_OFF:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_50

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->TETHERED_CALL_ACTIVE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_50

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->RADIO_NOT_AVAILABLE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p0, v0, :cond_50

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->UNACCEPTABLE_NETWORK_PARAMETER:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-ne p0, v0, :cond_52

    :cond_50
    const/4 v0, 0x1

    :goto_51
    return v0

    :cond_52
    const/4 v0, 0x0

    goto :goto_51
.end method

.method public isRestartRadioFail()Z
    .registers 2

    .prologue
    .line 85
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->REGULAR_DEACTIVATION:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-ne p0, v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method
