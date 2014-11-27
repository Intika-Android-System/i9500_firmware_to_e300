.class public final Lcom/movial/ipphone/IPMmiCode;
.super Landroid/os/Handler;
.source "IPMmiCode.java"

# interfaces
.implements Lcom/android/internal/telephony/MmiCode;


# static fields
.field static final ACTION_ACTIVATE:Ljava/lang/String; = "*"

.field static final ACTION_DEACTIVATE:Ljava/lang/String; = "#"

.field static final ACTION_ERASURE:Ljava/lang/String; = "##"

.field static final ACTION_INTERROGATE:Ljava/lang/String; = "*#"

.field static final ACTION_REGISTER:Ljava/lang/String; = "**"

.field static final EVENT_GET_CLIR_COMPLETE:I = 0x2

.field static final EVENT_QUERY_CF_COMPLETE:I = 0x3

.field static final EVENT_QUERY_COMPLETE:I = 0x5

.field static final EVENT_SET_CFF_COMPLETE:I = 0x6

.field static final EVENT_SET_COMPLETE:I = 0x1

.field static final EVENT_USSD_CANCEL_COMPLETE:I = 0x7

.field static final EVENT_USSD_COMPLETE:I = 0x4

.field static final LOG_TAG:Ljava/lang/String; = "IPMmiCode"

.field static final MATCH_GROUP_ACTION:I = 0x2

.field static final MATCH_GROUP_DIALING_NUMBER:I = 0xc

.field static final MATCH_GROUP_GLOBALDEV_DIALNUM:I = 0x5

.field static final MATCH_GROUP_GLOBALDEV_DIALPREFIX:I = 0x4

.field static final MATCH_GROUP_POUND_STRING:I = 0x1

.field static final MATCH_GROUP_PWD_CONFIRM:I = 0xb

.field static final MATCH_GROUP_SERVICE_CODE:I = 0x3

.field static final MATCH_GROUP_SIA:I = 0x5

.field static final MATCH_GROUP_SIB:I = 0x7

.field static final MATCH_GROUP_SIC:I = 0x9

.field static final SC_BAIC:Ljava/lang/String; = "35"

.field static final SC_BAICr:Ljava/lang/String; = "351"

.field static final SC_BAOC:Ljava/lang/String; = "33"

.field static final SC_BAOIC:Ljava/lang/String; = "331"

.field static final SC_BAOICxH:Ljava/lang/String; = "332"

.field static final SC_BA_ALL:Ljava/lang/String; = "330"

.field static final SC_BA_MO:Ljava/lang/String; = "333"

.field static final SC_BA_MT:Ljava/lang/String; = "353"

.field static final SC_CFB:Ljava/lang/String; = "67"

.field static final SC_CFNR:Ljava/lang/String; = "62"

.field static final SC_CFNRy:Ljava/lang/String; = "61"

.field static final SC_CFU:Ljava/lang/String; = "21"

.field static final SC_CF_All:Ljava/lang/String; = "002"

.field static final SC_CF_All_Conditional:Ljava/lang/String; = "004"

.field static final SC_CLIP:Ljava/lang/String; = "30"

.field static final SC_CLIR:Ljava/lang/String; = "31"

.field static final SC_GLOBALDEV_CLIR_INVK:Ljava/lang/String; = "67"

.field static final SC_GLOBALDEV_CLIR_SUPP:Ljava/lang/String; = "82"

.field static final SC_PIN:Ljava/lang/String; = "04"

.field static final SC_PIN2:Ljava/lang/String; = "042"

.field static final SC_PUK:Ljava/lang/String; = "05"

.field static final SC_PUK2:Ljava/lang/String; = "052"

.field static final SC_PWD:Ljava/lang/String; = "03"

.field static final SC_WAIT:Ljava/lang/String; = "43"

.field static sPatternSuppService:Ljava/util/regex/Pattern;

.field static sPatternSuppServiceGlobalDev:Ljava/util/regex/Pattern;


# instance fields
.field action:Ljava/lang/String;

.field context:Landroid/content/Context;

.field dialingNumber:Ljava/lang/String;

.field private isPendingUSSD:Z

.field private isUssdRequest:Z

.field message:Ljava/lang/CharSequence;

.field phone:Lcom/movial/ipphone/IPPhone;

.field poundString:Ljava/lang/String;

.field pwd:Ljava/lang/String;

.field sc:Ljava/lang/String;

.field sia:Ljava/lang/String;

.field sib:Ljava/lang/String;

.field sic:Ljava/lang/String;

.field state:Lcom/android/internal/telephony/MmiCode$State;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 171
    const-string v0, "((\\*)(\\d{2})(\\+{0,1})(\\d{0,}))"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/movial/ipphone/IPMmiCode;->sPatternSuppServiceGlobalDev:Ljava/util/regex/Pattern;

    .line 186
    const-string v0, "((\\*|#|\\*#|\\*\\*|##)(\\d{2,3})(\\*([^*#]*)(\\*([^*#]*)(\\*([^*#]*)(\\*([^*#]*))?)?)?)?#)(.*)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/movial/ipphone/IPMmiCode;->sPatternSuppService:Ljava/util/regex/Pattern;

    return-void
.end method

.method constructor <init>(Lcom/movial/ipphone/IPPhone;)V
    .registers 3
    .parameter "phone"

    .prologue
    .line 452
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 166
    sget-object v0, Lcom/android/internal/telephony/MmiCode$State;->PENDING:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    .line 457
    iput-object p1, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    .line 458
    invoke-virtual {p1}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    .line 459
    return-void
.end method

.method private createQueryCallBarringResultMessage(I)Ljava/lang/CharSequence;
    .registers 6
    .parameter "serviceClass"

    .prologue
    .line 1338
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v3, 0x104012f

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1340
    .local v1, sb:Ljava/lang/StringBuilder;
    const/4 v0, 0x1

    .line 1341
    .local v0, classMask:I
    :goto_f
    const/16 v2, 0x80

    if-gt v0, v2, :cond_28

    .line 1344
    and-int v2, v0, p1

    if-eqz v2, :cond_25

    .line 1345
    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1346
    and-int v2, v0, p1

    invoke-direct {p0, v2}, Lcom/movial/ipphone/IPMmiCode;->serviceClassToCFString(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 1342
    :cond_25
    shl-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 1349
    :cond_28
    return-object v1
.end method

.method private createQueryCallWaitingResultMessage(I)Ljava/lang/CharSequence;
    .registers 6
    .parameter "serviceClass"

    .prologue
    .line 1321
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v3, 0x104012f

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1324
    .local v1, sb:Ljava/lang/StringBuilder;
    const/4 v0, 0x1

    .line 1325
    .local v0, classMask:I
    :goto_f
    const/16 v2, 0x80

    if-gt v0, v2, :cond_28

    .line 1328
    and-int v2, v0, p1

    if-eqz v2, :cond_25

    .line 1329
    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1330
    and-int v2, v0, p1

    invoke-direct {p0, v2}, Lcom/movial/ipphone/IPMmiCode;->serviceClassToCFString(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 1326
    :cond_25
    shl-int/lit8 v0, v0, 0x1

    goto :goto_f

    .line 1333
    :cond_28
    return-object v1
.end method

.method private getScString()Ljava/lang/CharSequence;
    .registers 3

    .prologue
    .line 964
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    if-eqz v0, :cond_88

    .line 965
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    invoke-static {v0}, Lcom/movial/ipphone/IPMmiCode;->isServiceCodeCallBarring(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_16

    .line 966
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v1, 0x1040149

    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    .line 982
    :goto_15
    return-object v0

    .line 967
    :cond_16
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    invoke-static {v0}, Lcom/movial/ipphone/IPMmiCode;->isServiceCodeCallForwarding(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_28

    .line 968
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v1, 0x1040147

    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_15

    .line 969
    :cond_28
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    const-string v1, "30"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    .line 970
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v1, 0x1040143

    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_15

    .line 971
    :cond_3c
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    const-string v1, "31"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_50

    .line 972
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v1, 0x1040144

    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_15

    .line 973
    :cond_50
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    const-string v1, "03"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_64

    .line 974
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v1, 0x104014a

    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_15

    .line 975
    :cond_64
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    const-string v1, "43"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_78

    .line 976
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v1, 0x1040148

    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_15

    .line 977
    :cond_78
    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isPinCommand()Z

    move-result v0

    if-eqz v0, :cond_88

    .line 978
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v1, 0x104014b

    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_15

    .line 982
    :cond_88
    const-string v0, ""

    goto :goto_15
.end method

.method private handlePasswordError(I)V
    .registers 4
    .parameter "res"

    .prologue
    .line 824
    sget-object v1, Lcom/android/internal/telephony/MmiCode$State;->FAILED:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v1, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    .line 825
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/movial/ipphone/IPMmiCode;->getScString()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 826
    .local v0, sb:Ljava/lang/StringBuilder;
    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 827
    iget-object v1, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    invoke-virtual {v1, p1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 828
    iput-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->message:Ljava/lang/CharSequence;

    .line 829
    iget-object v1, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v1, p0}, Lcom/movial/ipphone/IPPhone;->onMMIDone(Lcom/movial/ipphone/IPMmiCode;)V

    .line 830
    return-void
.end method

.method private static isEmptyOrNull(Ljava/lang/CharSequence;)Z
    .registers 2
    .parameter "s"

    .prologue
    .line 325
    if-eqz p0, :cond_8

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_a

    :cond_8
    const/4 v0, 0x1

    :goto_9
    return v0

    :cond_a
    const/4 v0, 0x0

    goto :goto_9
.end method

.method static isServiceCodeCallBarring(Ljava/lang/String;)Z
    .registers 2
    .parameter "sc"

    .prologue
    .line 412
    if-eqz p0, :cond_44

    const-string v0, "33"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_42

    const-string v0, "331"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_42

    const-string v0, "332"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_42

    const-string v0, "35"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_42

    const-string v0, "351"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_42

    const-string v0, "330"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_42

    const-string v0, "333"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_42

    const-string v0, "353"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_44

    :cond_42
    const/4 v0, 0x1

    :goto_43
    return v0

    :cond_44
    const/4 v0, 0x0

    goto :goto_43
.end method

.method static isServiceCodeCallForwarding(Ljava/lang/String;)Z
    .registers 2
    .parameter "sc"

    .prologue
    .line 403
    if-eqz p0, :cond_34

    const-string v0, "21"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_32

    const-string v0, "67"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_32

    const-string v0, "61"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_32

    const-string v0, "62"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_32

    const-string v0, "002"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_32

    const-string v0, "004"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_34

    :cond_32
    const/4 v0, 0x1

    :goto_33
    return v0

    :cond_34
    const/4 v0, 0x0

    goto :goto_33
.end method

.method private static isShortCode(Ljava/lang/String;Lcom/movial/ipphone/IPPhone;)Z
    .registers 5
    .parameter "dialString"
    .parameter "phone"

    .prologue
    const/4 v2, 0x2

    const/4 v0, 0x0

    .line 538
    if-eqz p0, :cond_35

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-gt v1, v2, :cond_35

    invoke-static {p0}, Landroid/telephony/PhoneNumberUtils;->isEmergencyNumber(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_35

    invoke-virtual {p1}, Lcom/movial/ipphone/IPPhone;->isInCall()Z

    move-result v1

    if-nez v1, :cond_34

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ne v1, v2, :cond_24

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x31

    if-eq v1, v2, :cond_35

    :cond_24
    const-string v1, "0"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_35

    const-string v1, "00"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_35

    :cond_34
    const/4 v0, 0x1

    :cond_35
    return v0
.end method

.method private makeCFQueryResultMessage(Lcom/android/internal/telephony/CallForwardInfo;I)Ljava/lang/CharSequence;
    .registers 12
    .parameter "info"
    .parameter "serviceClassMask"

    .prologue
    const/4 v7, 0x3

    const/4 v8, 0x2

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 1175
    new-array v2, v7, [Ljava/lang/String;

    const-string v6, "{0}"

    aput-object v6, v2, v5

    const-string v6, "{1}"

    aput-object v6, v2, v4

    const-string v6, "{2}"

    aput-object v6, v2, v8

    .line 1176
    .local v2, sources:[Ljava/lang/String;
    new-array v0, v7, [Ljava/lang/CharSequence;

    .line 1182
    .local v0, destinations:[Ljava/lang/CharSequence;
    iget v6, p1, Lcom/android/internal/telephony/CallForwardInfo;->reason:I

    if-ne v6, v8, :cond_55

    move v1, v4

    .line 1185
    .local v1, needTimeTemplate:Z
    :goto_19
    iget v6, p1, Lcom/android/internal/telephony/CallForwardInfo;->status:I

    if-ne v6, v4, :cond_61

    .line 1186
    if-eqz v1, :cond_57

    .line 1187
    iget-object v6, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v7, 0x104019e

    invoke-virtual {v6, v7}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    .line 1214
    .local v3, template:Ljava/lang/CharSequence;
    :goto_28
    iget v6, p1, Lcom/android/internal/telephony/CallForwardInfo;->serviceClass:I

    and-int/2addr v6, p2

    invoke-direct {p0, v6}, Lcom/movial/ipphone/IPMmiCode;->serviceClassToCFString(I)Ljava/lang/CharSequence;

    move-result-object v6

    aput-object v6, v0, v5

    .line 1215
    iget-object v5, p1, Lcom/android/internal/telephony/CallForwardInfo;->number:Ljava/lang/String;

    iget v6, p1, Lcom/android/internal/telephony/CallForwardInfo;->toa:I

    invoke-static {v5, v6}, Landroid/telephony/PhoneNumberUtils;->stringFromStringAndTOA(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v0, v4

    .line 1216
    iget v5, p1, Lcom/android/internal/telephony/CallForwardInfo;->timeSeconds:I

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v0, v8

    .line 1218
    iget v5, p1, Lcom/android/internal/telephony/CallForwardInfo;->reason:I

    if-nez v5, :cond_50

    iget v5, p1, Lcom/android/internal/telephony/CallForwardInfo;->serviceClass:I

    and-int/2addr v5, p2

    if-ne v5, v4, :cond_50

    .line 1221
    iget v5, p1, Lcom/android/internal/telephony/CallForwardInfo;->status:I

    if-ne v5, v4, :cond_50

    .line 1226
    :cond_50
    invoke-static {v3, v2, v0}, Landroid/text/TextUtils;->replace(Ljava/lang/CharSequence;[Ljava/lang/String;[Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v4

    return-object v4

    .end local v1           #needTimeTemplate:Z
    .end local v3           #template:Ljava/lang/CharSequence;
    :cond_55
    move v1, v5

    .line 1182
    goto :goto_19

    .line 1190
    .restart local v1       #needTimeTemplate:Z
    :cond_57
    iget-object v6, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v7, 0x104019d

    invoke-virtual {v6, v7}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    .restart local v3       #template:Ljava/lang/CharSequence;
    goto :goto_28

    .line 1193
    .end local v3           #template:Ljava/lang/CharSequence;
    :cond_61
    iget v6, p1, Lcom/android/internal/telephony/CallForwardInfo;->status:I

    if-nez v6, :cond_77

    iget-object v6, p1, Lcom/android/internal/telephony/CallForwardInfo;->number:Ljava/lang/String;

    invoke-static {v6}, Lcom/movial/ipphone/IPMmiCode;->isEmptyOrNull(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_77

    .line 1194
    iget-object v6, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v7, 0x104019c

    invoke-virtual {v6, v7}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    .restart local v3       #template:Ljava/lang/CharSequence;
    goto :goto_28

    .line 1200
    .end local v3           #template:Ljava/lang/CharSequence;
    :cond_77
    if-eqz v1, :cond_83

    .line 1201
    iget-object v6, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v7, 0x10401a0

    invoke-virtual {v6, v7}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    .restart local v3       #template:Ljava/lang/CharSequence;
    goto :goto_28

    .line 1204
    .end local v3           #template:Ljava/lang/CharSequence;
    :cond_83
    iget-object v6, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v7, 0x104019f

    invoke-virtual {v6, v7}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    .restart local v3       #template:Ljava/lang/CharSequence;
    goto :goto_28
.end method

.method private static makeEmptyNull(Ljava/lang/String;)Ljava/lang/String;
    .registers 2
    .parameter "s"

    .prologue
    .line 317
    if-eqz p0, :cond_9

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_9

    const/4 p0, 0x0

    .line 319
    .end local p0
    :cond_9
    return-object p0
.end method

.method static newFromDialString(Ljava/lang/String;Lcom/movial/ipphone/IPPhone;)Lcom/movial/ipphone/IPMmiCode;
    .registers 12
    .parameter "dialString"
    .parameter "phone"

    .prologue
    const/4 v9, 0x5

    const/4 v8, 0x3

    .line 230
    const/4 v5, 0x0

    .line 233
    .local v5, ret:Lcom/movial/ipphone/IPMmiCode;
    sget-object v6, Lcom/movial/ipphone/IPMmiCode;->sPatternSuppServiceGlobalDev:Ljava/util/regex/Pattern;

    invoke-virtual {v6, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    .line 234
    .local v3, gm:Ljava/util/regex/Matcher;
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->matches()Z

    move-result v6

    if-eqz v6, :cond_45

    .line 235
    invoke-virtual {v3, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/movial/ipphone/IPMmiCode;->makeEmptyNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 236
    .local v0, DialCode:Ljava/lang/String;
    const/4 v6, 0x4

    invoke-virtual {v3, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    .line 237
    .local v2, DialPrefix:Ljava/lang/String;
    invoke-virtual {v3, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/movial/ipphone/IPMmiCode;->makeEmptyNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 238
    .local v1, DialNumber:Ljava/lang/String;
    const-string v6, "67"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_b0

    if-eqz v1, :cond_b0

    .line 240
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "#31#"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 249
    .end local v0           #DialCode:Ljava/lang/String;
    .end local v1           #DialNumber:Ljava/lang/String;
    .end local v2           #DialPrefix:Ljava/lang/String;
    :cond_45
    :goto_45
    sget-object v6, Lcom/movial/ipphone/IPMmiCode;->sPatternSuppService:Ljava/util/regex/Pattern;

    invoke-virtual {v6, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    .line 252
    .local v4, m:Ljava/util/regex/Matcher;
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    move-result v6

    if-eqz v6, :cond_d3

    .line 253
    new-instance v5, Lcom/movial/ipphone/IPMmiCode;

    .end local v5           #ret:Lcom/movial/ipphone/IPMmiCode;
    invoke-direct {v5, p1}, Lcom/movial/ipphone/IPMmiCode;-><init>(Lcom/movial/ipphone/IPPhone;)V

    .line 254
    .restart local v5       #ret:Lcom/movial/ipphone/IPMmiCode;
    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/movial/ipphone/IPMmiCode;->makeEmptyNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/movial/ipphone/IPMmiCode;->poundString:Ljava/lang/String;

    .line 255
    const/4 v6, 0x2

    invoke-virtual {v4, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/movial/ipphone/IPMmiCode;->makeEmptyNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/movial/ipphone/IPMmiCode;->action:Ljava/lang/String;

    .line 256
    invoke-virtual {v4, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/movial/ipphone/IPMmiCode;->makeEmptyNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    .line 257
    invoke-virtual {v4, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/movial/ipphone/IPMmiCode;->makeEmptyNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/movial/ipphone/IPMmiCode;->sia:Ljava/lang/String;

    .line 258
    const/4 v6, 0x7

    invoke-virtual {v4, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/movial/ipphone/IPMmiCode;->makeEmptyNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/movial/ipphone/IPMmiCode;->sib:Ljava/lang/String;

    .line 259
    const/16 v6, 0x9

    invoke-virtual {v4, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/movial/ipphone/IPMmiCode;->makeEmptyNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/movial/ipphone/IPMmiCode;->sic:Ljava/lang/String;

    .line 260
    const/16 v6, 0xb

    invoke-virtual {v4, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/movial/ipphone/IPMmiCode;->makeEmptyNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/movial/ipphone/IPMmiCode;->pwd:Ljava/lang/String;

    .line 261
    const/16 v6, 0xc

    invoke-virtual {v4, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/movial/ipphone/IPMmiCode;->makeEmptyNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iput-object v6, v5, Lcom/movial/ipphone/IPMmiCode;->dialingNumber:Ljava/lang/String;

    .line 276
    :cond_af
    :goto_af
    return-object v5

    .line 242
    .end local v4           #m:Ljava/util/regex/Matcher;
    .restart local v0       #DialCode:Ljava/lang/String;
    .restart local v1       #DialNumber:Ljava/lang/String;
    .restart local v2       #DialPrefix:Ljava/lang/String;
    :cond_b0
    const-string v6, "82"

    invoke-virtual {v0, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_45

    if-eqz v1, :cond_45

    .line 244
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "*31#"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto/16 :goto_45

    .line 263
    .end local v0           #DialCode:Ljava/lang/String;
    .end local v1           #DialNumber:Ljava/lang/String;
    .end local v2           #DialPrefix:Ljava/lang/String;
    .restart local v4       #m:Ljava/util/regex/Matcher;
    :cond_d3
    const-string v6, "#"

    invoke-virtual {p0, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_e3

    .line 268
    new-instance v5, Lcom/movial/ipphone/IPMmiCode;

    .end local v5           #ret:Lcom/movial/ipphone/IPMmiCode;
    invoke-direct {v5, p1}, Lcom/movial/ipphone/IPMmiCode;-><init>(Lcom/movial/ipphone/IPPhone;)V

    .line 269
    .restart local v5       #ret:Lcom/movial/ipphone/IPMmiCode;
    iput-object p0, v5, Lcom/movial/ipphone/IPMmiCode;->poundString:Ljava/lang/String;

    goto :goto_af

    .line 270
    :cond_e3
    invoke-static {p0, p1}, Lcom/movial/ipphone/IPMmiCode;->isShortCode(Ljava/lang/String;Lcom/movial/ipphone/IPPhone;)Z

    move-result v6

    if-eqz v6, :cond_af

    .line 272
    new-instance v5, Lcom/movial/ipphone/IPMmiCode;

    .end local v5           #ret:Lcom/movial/ipphone/IPMmiCode;
    invoke-direct {v5, p1}, Lcom/movial/ipphone/IPMmiCode;-><init>(Lcom/movial/ipphone/IPPhone;)V

    .line 273
    .restart local v5       #ret:Lcom/movial/ipphone/IPMmiCode;
    iput-object p0, v5, Lcom/movial/ipphone/IPMmiCode;->dialingNumber:Ljava/lang/String;

    goto :goto_af
.end method

.method static newFromUssdUserInput(Ljava/lang/String;Lcom/movial/ipphone/IPPhone;)Lcom/movial/ipphone/IPMmiCode;
    .registers 4
    .parameter "ussdMessge"
    .parameter "phone"

    .prologue
    .line 301
    new-instance v0, Lcom/movial/ipphone/IPMmiCode;

    invoke-direct {v0, p1}, Lcom/movial/ipphone/IPMmiCode;-><init>(Lcom/movial/ipphone/IPPhone;)V

    .line 303
    .local v0, ret:Lcom/movial/ipphone/IPMmiCode;
    iput-object p0, v0, Lcom/movial/ipphone/IPMmiCode;->message:Ljava/lang/CharSequence;

    .line 304
    sget-object v1, Lcom/android/internal/telephony/MmiCode$State;->PENDING:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v1, v0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    .line 305
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/movial/ipphone/IPMmiCode;->isPendingUSSD:Z

    .line 307
    return-object v0
.end method

.method static newNetworkInitiatedUssd(Ljava/lang/String;ZLcom/movial/ipphone/IPPhone;)Lcom/movial/ipphone/IPMmiCode;
    .registers 5
    .parameter "ussdMessage"
    .parameter "isUssdRequest"
    .parameter "phone"

    .prologue
    .line 284
    new-instance v0, Lcom/movial/ipphone/IPMmiCode;

    invoke-direct {v0, p2}, Lcom/movial/ipphone/IPMmiCode;-><init>(Lcom/movial/ipphone/IPPhone;)V

    .line 286
    .local v0, ret:Lcom/movial/ipphone/IPMmiCode;
    iput-object p0, v0, Lcom/movial/ipphone/IPMmiCode;->message:Ljava/lang/CharSequence;

    .line 287
    iput-boolean p1, v0, Lcom/movial/ipphone/IPMmiCode;->isUssdRequest:Z

    .line 290
    if-eqz p1, :cond_13

    .line 291
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/movial/ipphone/IPMmiCode;->isPendingUSSD:Z

    .line 292
    sget-object v1, Lcom/android/internal/telephony/MmiCode$State;->PENDING:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v1, v0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    .line 297
    :goto_12
    return-object v0

    .line 294
    :cond_13
    sget-object v1, Lcom/android/internal/telephony/MmiCode$State;->COMPLETE:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v1, v0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    goto :goto_12
.end method

.method private onGetClirComplete(Landroid/os/AsyncResult;)V
    .registers 9
    .parameter "ar"

    .prologue
    const v6, 0x1040158

    const v5, 0x1040155

    const v4, 0x1040125

    const/4 v3, 0x0

    .line 1061
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/movial/ipphone/IPMmiCode;->getScString()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1062
    .local v1, sb:Ljava/lang/StringBuilder;
    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1064
    iget-object v2, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v2, :cond_31

    .line 1065
    sget-object v2, Lcom/android/internal/telephony/MmiCode$State;->FAILED:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    .line 1066
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    invoke-virtual {v2, v4}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 1136
    :goto_29
    iput-object v1, p0, Lcom/movial/ipphone/IPMmiCode;->message:Ljava/lang/CharSequence;

    .line 1137
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v2, p0}, Lcom/movial/ipphone/IPPhone;->onMMIDone(Lcom/movial/ipphone/IPMmiCode;)V

    .line 1138
    return-void

    .line 1070
    :cond_31
    iget-object v2, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v2, [I

    move-object v0, v2

    check-cast v0, [I

    .line 1073
    .local v0, clirArgs:[I
    const/4 v2, 0x1

    aget v2, v0, v2

    packed-switch v2, :pswitch_data_c4

    goto :goto_29

    .line 1075
    :pswitch_3f
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v3, 0x1040159

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 1077
    sget-object v2, Lcom/android/internal/telephony/MmiCode$State;->COMPLETE:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    goto :goto_29

    .line 1081
    :pswitch_50
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v3, 0x104015a

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 1083
    sget-object v2, Lcom/android/internal/telephony/MmiCode$State;->COMPLETE:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    goto :goto_29

    .line 1087
    :pswitch_61
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    invoke-virtual {v2, v4}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 1089
    sget-object v2, Lcom/android/internal/telephony/MmiCode$State;->FAILED:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    goto :goto_29

    .line 1095
    :pswitch_6f
    aget v2, v0, v3

    packed-switch v2, :pswitch_data_d2

    .line 1098
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    invoke-virtual {v2, v5}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 1110
    :goto_7d
    sget-object v2, Lcom/android/internal/telephony/MmiCode$State;->COMPLETE:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    goto :goto_29

    .line 1102
    :pswitch_82
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    invoke-virtual {v2, v5}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_7d

    .line 1106
    :pswitch_8c
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v3, 0x1040156

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_7d

    .line 1115
    :pswitch_99
    aget v2, v0, v3

    packed-switch v2, :pswitch_data_da

    .line 1118
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    invoke-virtual {v2, v6}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 1131
    :goto_a7
    sget-object v2, Lcom/android/internal/telephony/MmiCode$State;->COMPLETE:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    goto/16 :goto_29

    .line 1122
    :pswitch_ad
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v3, 0x1040157

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_a7

    .line 1126
    :pswitch_ba
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    invoke-virtual {v2, v6}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_a7

    .line 1073
    :pswitch_data_c4
    .packed-switch 0x0
        :pswitch_3f
        :pswitch_50
        :pswitch_61
        :pswitch_6f
        :pswitch_99
    .end packed-switch

    .line 1095
    :pswitch_data_d2
    .packed-switch 0x1
        :pswitch_82
        :pswitch_8c
    .end packed-switch

    .line 1115
    :pswitch_data_da
    .packed-switch 0x1
        :pswitch_ad
        :pswitch_ba
    .end packed-switch
.end method

.method private onQueryCfComplete(Landroid/os/AsyncResult;)V
    .registers 10
    .parameter "ar"

    .prologue
    .line 1232
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/movial/ipphone/IPMmiCode;->getScString()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1233
    .local v3, sb:Ljava/lang/StringBuilder;
    const-string v6, "\n"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1235
    iget-object v6, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v6, :cond_2a

    .line 1236
    sget-object v6, Lcom/android/internal/telephony/MmiCode$State;->FAILED:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v6, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    .line 1237
    iget-object v6, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v7, 0x1040125

    invoke-virtual {v6, v7}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 1278
    :goto_22
    iput-object v3, p0, Lcom/movial/ipphone/IPMmiCode;->message:Ljava/lang/CharSequence;

    .line 1279
    iget-object v6, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v6, p0}, Lcom/movial/ipphone/IPPhone;->onMMIDone(Lcom/movial/ipphone/IPMmiCode;)V

    .line 1281
    return-void

    .line 1241
    :cond_2a
    iget-object v6, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v6, [Lcom/android/internal/telephony/CallForwardInfo;

    move-object v1, v6

    check-cast v1, [Lcom/android/internal/telephony/CallForwardInfo;

    .line 1243
    .local v1, infos:[Lcom/android/internal/telephony/CallForwardInfo;
    array-length v6, v1

    if-nez v6, :cond_45

    .line 1245
    iget-object v6, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v7, 0x1040130

    invoke-virtual {v6, v7}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 1275
    :goto_40
    sget-object v6, Lcom/android/internal/telephony/MmiCode$State;->COMPLETE:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v6, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    goto :goto_22

    .line 1252
    :cond_45
    new-instance v5, Landroid/text/SpannableStringBuilder;

    invoke-direct {v5}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 1260
    .local v5, tb:Landroid/text/SpannableStringBuilder;
    const/4 v4, 0x1

    .line 1261
    .local v4, serviceClassMask:I
    :goto_4b
    const/16 v6, 0x80

    if-gt v4, v6, :cond_6e

    .line 1264
    const/4 v0, 0x0

    .local v0, i:I
    array-length v2, v1

    .local v2, s:I
    :goto_51
    if-ge v0, v2, :cond_6b

    .line 1265
    aget-object v6, v1, v0

    iget v6, v6, Lcom/android/internal/telephony/CallForwardInfo;->serviceClass:I

    and-int/2addr v6, v4

    if-eqz v6, :cond_68

    .line 1266
    aget-object v6, v1, v0

    invoke-direct {p0, v6, v4}, Lcom/movial/ipphone/IPMmiCode;->makeCFQueryResultMessage(Lcom/android/internal/telephony/CallForwardInfo;I)Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1268
    const-string v6, "\n"

    invoke-virtual {v5, v6}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 1264
    :cond_68
    add-int/lit8 v0, v0, 0x1

    goto :goto_51

    .line 1262
    :cond_6b
    shl-int/lit8 v4, v4, 0x1

    goto :goto_4b

    .line 1272
    .end local v0           #i:I
    .end local v2           #s:I
    :cond_6e
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_40
.end method

.method private onQueryComplete(Landroid/os/AsyncResult;)V
    .registers 9
    .parameter "ar"

    .prologue
    const/4 v6, 0x1

    const v5, 0x1040125

    const/4 v4, 0x0

    .line 1285
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/movial/ipphone/IPMmiCode;->getScString()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 1286
    .local v1, sb:Ljava/lang/StringBuilder;
    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1288
    iget-object v2, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v2, :cond_2c

    .line 1289
    sget-object v2, Lcom/android/internal/telephony/MmiCode$State;->FAILED:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    .line 1290
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    invoke-virtual {v2, v5}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 1315
    :goto_24
    iput-object v1, p0, Lcom/movial/ipphone/IPMmiCode;->message:Ljava/lang/CharSequence;

    .line 1316
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v2, p0}, Lcom/movial/ipphone/IPPhone;->onMMIDone(Lcom/movial/ipphone/IPMmiCode;)V

    .line 1317
    return-void

    .line 1292
    :cond_2c
    iget-object v2, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v2, [I

    move-object v0, v2

    check-cast v0, [I

    .line 1294
    .local v0, ints:[I
    array-length v2, v0

    if-eqz v2, :cond_8c

    .line 1295
    aget v2, v0, v4

    if-nez v2, :cond_4b

    .line 1296
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v3, 0x1040130

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 1312
    :goto_46
    sget-object v2, Lcom/android/internal/telephony/MmiCode$State;->COMPLETE:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    goto :goto_24

    .line 1297
    :cond_4b
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    const-string v3, "43"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5f

    .line 1299
    aget v2, v0, v6

    invoke-direct {p0, v2}, Lcom/movial/ipphone/IPMmiCode;->createQueryCallWaitingResultMessage(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_46

    .line 1300
    :cond_5f
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    invoke-static {v2}, Lcom/movial/ipphone/IPMmiCode;->isServiceCodeCallBarring(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_71

    .line 1302
    aget v2, v0, v4

    invoke-direct {p0, v2}, Lcom/movial/ipphone/IPMmiCode;->createQueryCallBarringResultMessage(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_46

    .line 1303
    :cond_71
    aget v2, v0, v4

    if-ne v2, v6, :cond_82

    .line 1305
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v3, 0x104012e

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_46

    .line 1307
    :cond_82
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    invoke-virtual {v2, v5}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_46

    .line 1310
    :cond_8c
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    invoke-virtual {v2, v5}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_46
.end method

.method private onSetComplete(Landroid/os/AsyncResult;)V
    .registers 7
    .parameter "ar"

    .prologue
    const v4, 0x1040135

    const v3, 0x1040125

    .line 987
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/movial/ipphone/IPMmiCode;->getScString()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 988
    .local v1, sb:Ljava/lang/StringBuilder;
    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 990
    iget-object v2, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v2, :cond_a8

    .line 991
    sget-object v2, Lcom/android/internal/telephony/MmiCode$State;->FAILED:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    .line 992
    iget-object v2, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    instance-of v2, v2, Lcom/android/internal/telephony/CommandException;

    if-eqz v2, :cond_9e

    .line 993
    iget-object v2, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    check-cast v2, Lcom/android/internal/telephony/CommandException;

    check-cast v2, Lcom/android/internal/telephony/CommandException;

    invoke-virtual {v2}, Lcom/android/internal/telephony/CommandException;->getCommandError()Lcom/android/internal/telephony/CommandException$Error;

    move-result-object v0

    .line 994
    .local v0, err:Lcom/android/internal/telephony/CommandException$Error;
    sget-object v2, Lcom/android/internal/telephony/CommandException$Error;->PASSWORD_INCORRECT:Lcom/android/internal/telephony/CommandException$Error;

    if-ne v0, v2, :cond_75

    .line 995
    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isPinCommand()Z

    move-result v2

    if-eqz v2, :cond_68

    .line 998
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    const-string v3, "05"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4a

    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    const-string v3, "052"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5e

    .line 999
    :cond_4a
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v3, 0x1040137

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 1055
    .end local v0           #err:Lcom/android/internal/telephony/CommandException$Error;
    :cond_56
    :goto_56
    iput-object v1, p0, Lcom/movial/ipphone/IPMmiCode;->message:Ljava/lang/CharSequence;

    .line 1056
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v2, p0}, Lcom/movial/ipphone/IPPhone;->onMMIDone(Lcom/movial/ipphone/IPMmiCode;)V

    .line 1057
    return-void

    .line 1002
    .restart local v0       #err:Lcom/android/internal/telephony/CommandException$Error;
    :cond_5e
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    invoke-virtual {v2, v4}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_56

    .line 1006
    :cond_68
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v3, 0x1040133

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_56

    .line 1009
    :cond_75
    sget-object v2, Lcom/android/internal/telephony/CommandException$Error;->SIM_PUK2:Lcom/android/internal/telephony/CommandException$Error;

    if-ne v0, v2, :cond_94

    .line 1010
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    invoke-virtual {v2, v4}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 1012
    const-string v2, "\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1013
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v3, 0x104013d

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_56

    .line 1016
    :cond_94
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_56

    .line 1020
    .end local v0           #err:Lcom/android/internal/telephony/CommandException$Error;
    :cond_9e
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto :goto_56

    .line 1023
    :cond_a8
    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isActivate()Z

    move-result v2

    if-eqz v2, :cond_c9

    .line 1024
    sget-object v2, Lcom/android/internal/telephony/MmiCode$State;->COMPLETE:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    .line 1025
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v3, 0x104012e

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 1028
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    const-string v3, "31"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_56

    goto :goto_56

    .line 1032
    :cond_c9
    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isDeactivate()Z

    move-result v2

    if-eqz v2, :cond_eb

    .line 1033
    sget-object v2, Lcom/android/internal/telephony/MmiCode$State;->COMPLETE:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    .line 1034
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v3, 0x1040130

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 1037
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    const-string v3, "31"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_56

    goto/16 :goto_56

    .line 1041
    :cond_eb
    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isRegister()Z

    move-result v2

    if-eqz v2, :cond_103

    .line 1042
    sget-object v2, Lcom/android/internal/telephony/MmiCode$State;->COMPLETE:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    .line 1043
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v3, 0x1040131

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto/16 :goto_56

    .line 1045
    :cond_103
    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isErasure()Z

    move-result v2

    if-eqz v2, :cond_11b

    .line 1046
    sget-object v2, Lcom/android/internal/telephony/MmiCode$State;->COMPLETE:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    .line 1047
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v3, 0x1040132

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto/16 :goto_56

    .line 1050
    :cond_11b
    sget-object v2, Lcom/android/internal/telephony/MmiCode$State;->FAILED:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    .line 1051
    iget-object v2, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    invoke-virtual {v2, v3}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    goto/16 :goto_56
.end method

.method static scToBarringFacility(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .parameter "sc"

    .prologue
    .line 425
    if-nez p0, :cond_a

    .line 426
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "invalid call barring sc"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 429
    :cond_a
    const-string v0, "33"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 430
    const-string v0, "AO"

    .line 444
    :goto_14
    return-object v0

    .line 431
    :cond_15
    const-string v0, "331"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    .line 432
    const-string v0, "OI"

    goto :goto_14

    .line 433
    :cond_20
    const-string v0, "332"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2b

    .line 434
    const-string v0, "OX"

    goto :goto_14

    .line 435
    :cond_2b
    const-string v0, "35"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_36

    .line 436
    const-string v0, "AI"

    goto :goto_14

    .line 437
    :cond_36
    const-string v0, "351"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_41

    .line 438
    const-string v0, "IR"

    goto :goto_14

    .line 439
    :cond_41
    const-string v0, "330"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    .line 440
    const-string v0, "AB"

    goto :goto_14

    .line 441
    :cond_4c
    const-string v0, "333"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_57

    .line 442
    const-string v0, "AG"

    goto :goto_14

    .line 443
    :cond_57
    const-string v0, "353"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_62

    .line 444
    const-string v0, "AC"

    goto :goto_14

    .line 446
    :cond_62
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "invalid call barring sc"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static scToCallForwardReason(Ljava/lang/String;)I
    .registers 3
    .parameter "sc"

    .prologue
    .line 331
    if-nez p0, :cond_a

    .line 332
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "invalid call forward sc"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 335
    :cond_a
    const-string v0, "002"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 336
    const/4 v0, 0x4

    .line 346
    :goto_13
    return v0

    .line 337
    :cond_14
    const-string v0, "21"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 338
    const/4 v0, 0x0

    goto :goto_13

    .line 339
    :cond_1e
    const-string v0, "67"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    .line 340
    const/4 v0, 0x1

    goto :goto_13

    .line 341
    :cond_28
    const-string v0, "62"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    .line 342
    const/4 v0, 0x3

    goto :goto_13

    .line 343
    :cond_32
    const-string v0, "61"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    .line 344
    const/4 v0, 0x2

    goto :goto_13

    .line 345
    :cond_3c
    const-string v0, "004"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_46

    .line 346
    const/4 v0, 0x5

    goto :goto_13

    .line 348
    :cond_46
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "invalid call forward sc"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private serviceClassToCFString(I)Ljava/lang/CharSequence;
    .registers 4
    .parameter "serviceClass"

    .prologue
    .line 1148
    sparse-switch p1, :sswitch_data_56

    .line 1166
    const/4 v0, 0x0

    :goto_4
    return-object v0

    .line 1150
    :sswitch_5
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v1, 0x1040164

    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_4

    .line 1152
    :sswitch_f
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v1, 0x1040165

    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_4

    .line 1154
    :sswitch_19
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v1, 0x1040166

    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_4

    .line 1156
    :sswitch_23
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v1, 0x1040167

    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_4

    .line 1158
    :sswitch_2d
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v1, 0x1040169

    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_4

    .line 1160
    :sswitch_37
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v1, 0x1040168

    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_4

    .line 1162
    :sswitch_41
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v1, 0x104016a

    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_4

    .line 1164
    :sswitch_4b
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v1, 0x104016b

    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    goto :goto_4

    .line 1148
    nop

    :sswitch_data_56
    .sparse-switch
        0x1 -> :sswitch_5
        0x2 -> :sswitch_f
        0x4 -> :sswitch_19
        0x8 -> :sswitch_23
        0x10 -> :sswitch_2d
        0x20 -> :sswitch_37
        0x40 -> :sswitch_41
        0x80 -> :sswitch_4b
    .end sparse-switch
.end method

.method private static siToServiceClass(Ljava/lang/String;)I
    .registers 5
    .parameter "si"

    .prologue
    .line 354
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_a

    .line 355
    :cond_8
    const/4 v1, 0x0

    .line 383
    :goto_9
    return v1

    .line 358
    :cond_a
    const/16 v1, 0xa

    invoke-static {p0, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    .line 360
    .local v0, serviceCode:I
    sparse-switch v0, :sswitch_data_50

    .line 386
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "unsupported MMI service code "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 361
    :sswitch_2c
    const/16 v1, 0xd

    goto :goto_9

    .line 362
    :sswitch_2f
    const/4 v1, 0x1

    goto :goto_9

    .line 363
    :sswitch_31
    const/16 v1, 0xc

    goto :goto_9

    .line 364
    :sswitch_34
    const/4 v1, 0x4

    goto :goto_9

    .line 366
    :sswitch_36
    const/16 v1, 0x8

    goto :goto_9

    .line 368
    :sswitch_39
    const/4 v1, 0x5

    goto :goto_9

    .line 376
    :sswitch_3b
    const/16 v1, 0x30

    goto :goto_9

    .line 378
    :sswitch_3e
    const/16 v1, 0xa0

    goto :goto_9

    .line 379
    :sswitch_41
    const/16 v1, 0x50

    goto :goto_9

    .line 380
    :sswitch_44
    const/16 v1, 0x10

    goto :goto_9

    .line 381
    :sswitch_47
    const/16 v1, 0x20

    goto :goto_9

    .line 382
    :sswitch_4a
    const/16 v1, 0x11

    goto :goto_9

    .line 383
    :sswitch_4d
    const/16 v1, 0x40

    goto :goto_9

    .line 360
    :sswitch_data_50
    .sparse-switch
        0xa -> :sswitch_2c
        0xb -> :sswitch_2f
        0xc -> :sswitch_31
        0xd -> :sswitch_34
        0x10 -> :sswitch_36
        0x13 -> :sswitch_39
        0x14 -> :sswitch_3b
        0x15 -> :sswitch_3e
        0x16 -> :sswitch_41
        0x18 -> :sswitch_44
        0x19 -> :sswitch_47
        0x1a -> :sswitch_4a
        0x63 -> :sswitch_4d
    .end sparse-switch
.end method

.method private static siToTime(Ljava/lang/String;)I
    .registers 2
    .parameter "si"

    .prologue
    .line 393
    if-eqz p0, :cond_8

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_a

    .line 394
    :cond_8
    const/4 v0, 0x0

    .line 397
    :goto_9
    return v0

    :cond_a
    const/16 v0, 0xa

    invoke-static {p0, v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v0

    goto :goto_9
.end method


# virtual methods
.method public cancel()V
    .registers 3

    .prologue
    .line 482
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    sget-object v1, Lcom/android/internal/telephony/MmiCode$State;->COMPLETE:Lcom/android/internal/telephony/MmiCode$State;

    if-eq v0, v1, :cond_c

    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    sget-object v1, Lcom/android/internal/telephony/MmiCode$State;->FAILED:Lcom/android/internal/telephony/MmiCode$State;

    if-ne v0, v1, :cond_d

    .line 507
    :cond_c
    :goto_c
    return-void

    .line 486
    :cond_d
    sget-object v0, Lcom/android/internal/telephony/MmiCode$State;->CANCELLED:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    .line 488
    iget-boolean v0, p0, Lcom/movial/ipphone/IPMmiCode;->isPendingUSSD:Z

    if-eqz v0, :cond_20

    .line 493
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    const/4 v1, 0x7

    invoke-virtual {p0, v1, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/movial/ipphone/IPPhone;->cancelPendingUssd(Landroid/os/Message;)V

    goto :goto_c

    .line 504
    :cond_20
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v0, p0}, Lcom/movial/ipphone/IPPhone;->onMMIDone(Lcom/movial/ipphone/IPMmiCode;)V

    goto :goto_c
.end method

.method getCLIRMode()I
    .registers 3

    .prologue
    .line 576
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    const-string v1, "31"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 577
    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isActivate()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 578
    const/4 v0, 0x2

    .line 584
    :goto_15
    return v0

    .line 579
    :cond_16
    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isDeactivate()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 580
    const/4 v0, 0x1

    goto :goto_15

    .line 584
    :cond_1e
    const/4 v0, 0x0

    goto :goto_15
.end method

.method public getDialString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1364
    const/4 v0, 0x0

    return-object v0
.end method

.method public getMessage()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 470
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->message:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getPhone()Lcom/android/internal/telephony/Phone;
    .registers 2

    .prologue
    .line 475
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    return-object v0
.end method

.method public getState()Lcom/android/internal/telephony/MmiCode$State;
    .registers 2

    .prologue
    .line 465
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    return-object v0
.end method

.method public getUssdCode()Ljava/lang/CharSequence;
    .registers 2

    .prologue
    .line 1360
    const/4 v0, 0x0

    return-object v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .registers 7
    .parameter "msg"

    .prologue
    const/4 v4, 0x1

    .line 893
    iget v3, p1, Landroid/os/Message;->what:I

    packed-switch v3, :pswitch_data_86

    .line 960
    :cond_6
    :goto_6
    return-void

    .line 895
    :pswitch_7
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object v1, v3

    check-cast v1, Landroid/os/AsyncResult;

    .line 897
    .local v1, ar:Landroid/os/AsyncResult;
    invoke-direct {p0, v1}, Lcom/movial/ipphone/IPMmiCode;->onSetComplete(Landroid/os/AsyncResult;)V

    goto :goto_6

    .line 901
    .end local v1           #ar:Landroid/os/AsyncResult;
    :pswitch_12
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object v1, v3

    check-cast v1, Landroid/os/AsyncResult;

    .line 907
    .restart local v1       #ar:Landroid/os/AsyncResult;
    iget-object v3, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v3, :cond_39

    iget v3, p1, Landroid/os/Message;->arg1:I

    if-ne v3, v4, :cond_39

    .line 908
    iget v3, p1, Landroid/os/Message;->arg2:I

    if-ne v3, v4, :cond_3d

    move v2, v4

    .line 914
    .local v2, cffEnabled:Z
    :goto_26
    iget-object v3, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-static {v3}, Lcom/android/internal/telephony/uicc/UiccController;->getInstance(Lcom/android/internal/telephony/PhoneBase;)Lcom/android/internal/telephony/uicc/UiccController;

    move-result-object v3

    invoke-virtual {v3, v4}, Lcom/android/internal/telephony/uicc/UiccController;->getUiccCardApplication(I)Lcom/android/internal/telephony/uicc/UiccCardApplication;

    move-result-object v0

    .line 915
    .local v0, app:Lcom/android/internal/telephony/uicc/UiccCardApplication;
    if-eqz v0, :cond_39

    .line 916
    invoke-virtual {v0}, Lcom/android/internal/telephony/uicc/UiccCardApplication;->getIccRecords()Lcom/android/internal/telephony/uicc/IccRecords;

    move-result-object v3

    invoke-virtual {v3, v4, v2}, Lcom/android/internal/telephony/uicc/IccRecords;->setVoiceCallForwardingFlag(IZ)V

    .line 920
    .end local v0           #app:Lcom/android/internal/telephony/uicc/UiccCardApplication;
    .end local v2           #cffEnabled:Z
    :cond_39
    invoke-direct {p0, v1}, Lcom/movial/ipphone/IPMmiCode;->onSetComplete(Landroid/os/AsyncResult;)V

    goto :goto_6

    .line 908
    :cond_3d
    const/4 v2, 0x0

    goto :goto_26

    .line 924
    .end local v1           #ar:Landroid/os/AsyncResult;
    :pswitch_3f
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object v1, v3

    check-cast v1, Landroid/os/AsyncResult;

    .line 925
    .restart local v1       #ar:Landroid/os/AsyncResult;
    invoke-direct {p0, v1}, Lcom/movial/ipphone/IPMmiCode;->onGetClirComplete(Landroid/os/AsyncResult;)V

    goto :goto_6

    .line 929
    .end local v1           #ar:Landroid/os/AsyncResult;
    :pswitch_4a
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object v1, v3

    check-cast v1, Landroid/os/AsyncResult;

    .line 930
    .restart local v1       #ar:Landroid/os/AsyncResult;
    invoke-direct {p0, v1}, Lcom/movial/ipphone/IPMmiCode;->onQueryCfComplete(Landroid/os/AsyncResult;)V

    goto :goto_6

    .line 934
    .end local v1           #ar:Landroid/os/AsyncResult;
    :pswitch_55
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object v1, v3

    check-cast v1, Landroid/os/AsyncResult;

    .line 935
    .restart local v1       #ar:Landroid/os/AsyncResult;
    invoke-direct {p0, v1}, Lcom/movial/ipphone/IPMmiCode;->onQueryComplete(Landroid/os/AsyncResult;)V

    goto :goto_6

    .line 939
    .end local v1           #ar:Landroid/os/AsyncResult;
    :pswitch_60
    iget-object v3, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v3, Landroid/os/AsyncResult;

    move-object v1, v3

    check-cast v1, Landroid/os/AsyncResult;

    .line 941
    .restart local v1       #ar:Landroid/os/AsyncResult;
    iget-object v3, v1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v3, :cond_6

    .line 942
    sget-object v3, Lcom/android/internal/telephony/MmiCode$State;->FAILED:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v3, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    .line 943
    iget-object v3, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v4, 0x1040125

    invoke-virtual {v3, v4}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v3

    iput-object v3, p0, Lcom/movial/ipphone/IPMmiCode;->message:Ljava/lang/CharSequence;

    .line 946
    iget-object v3, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v3, p0}, Lcom/movial/ipphone/IPPhone;->onMMIDone(Lcom/movial/ipphone/IPMmiCode;)V

    goto :goto_6

    .line 957
    .end local v1           #ar:Landroid/os/AsyncResult;
    :pswitch_80
    iget-object v3, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v3, p0}, Lcom/movial/ipphone/IPPhone;->onMMIDone(Lcom/movial/ipphone/IPMmiCode;)V

    goto :goto_6

    .line 893
    :pswitch_data_86
    .packed-switch 0x1
        :pswitch_7
        :pswitch_3f
        :pswitch_4a
        :pswitch_60
        :pswitch_55
        :pswitch_12
        :pswitch_80
    .end packed-switch
.end method

.method isActivate()Z
    .registers 3

    .prologue
    .line 588
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->action:Ljava/lang/String;

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->action:Ljava/lang/String;

    const-string v1, "*"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method public isCancelable()Z
    .registers 2

    .prologue
    .line 511
    iget-boolean v0, p0, Lcom/movial/ipphone/IPMmiCode;->isPendingUSSD:Z

    return v0
.end method

.method isDeactivate()Z
    .registers 3

    .prologue
    .line 592
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->action:Ljava/lang/String;

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->action:Ljava/lang/String;

    const-string v1, "#"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method isErasure()Z
    .registers 3

    .prologue
    .line 604
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->action:Ljava/lang/String;

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->action:Ljava/lang/String;

    const-string v1, "##"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method isInterrogate()Z
    .registers 3

    .prologue
    .line 596
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->action:Ljava/lang/String;

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->action:Ljava/lang/String;

    const-string v1, "*#"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method isMMI()Z
    .registers 2

    .prologue
    .line 519
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->poundString:Ljava/lang/String;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public isPendingUSSD()Z
    .registers 2

    .prologue
    .line 612
    iget-boolean v0, p0, Lcom/movial/ipphone/IPMmiCode;->isPendingUSSD:Z

    return v0
.end method

.method isPinCommand()Z
    .registers 3

    .prologue
    .line 552
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    if-eqz v0, :cond_2e

    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    const-string v1, "04"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2c

    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    const-string v1, "042"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2c

    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    const-string v1, "05"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2c

    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    const-string v1, "052"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2e

    :cond_2c
    const/4 v0, 0x1

    :goto_2d
    return v0

    :cond_2e
    const/4 v0, 0x0

    goto :goto_2d
.end method

.method isRegister()Z
    .registers 3

    .prologue
    .line 600
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->action:Ljava/lang/String;

    if-eqz v0, :cond_10

    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->action:Ljava/lang/String;

    const-string v1, "**"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    :goto_f
    return v0

    :cond_10
    const/4 v0, 0x0

    goto :goto_f
.end method

.method isShortCode()Z
    .registers 3

    .prologue
    .line 525
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->poundString:Ljava/lang/String;

    if-nez v0, :cond_13

    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->dialingNumber:Ljava/lang/String;

    if-eqz v0, :cond_13

    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->dialingNumber:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x2

    if-gt v0, v1, :cond_13

    const/4 v0, 0x1

    :goto_12
    return v0

    :cond_13
    const/4 v0, 0x0

    goto :goto_12
.end method

.method isTemporaryModeCLIR()Z
    .registers 3

    .prologue
    .line 566
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    if-eqz v0, :cond_20

    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    const-string v1, "31"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->dialingNumber:Ljava/lang/String;

    if-eqz v0, :cond_20

    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isActivate()Z

    move-result v0

    if-nez v0, :cond_1e

    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isDeactivate()Z

    move-result v0

    if-eqz v0, :cond_20

    :cond_1e
    const/4 v0, 0x1

    :goto_1f
    return v0

    :cond_20
    const/4 v0, 0x0

    goto :goto_1f
.end method

.method public isUssdRequest()Z
    .registers 2

    .prologue
    .line 616
    iget-boolean v0, p0, Lcom/movial/ipphone/IPMmiCode;->isUssdRequest:Z

    return v0
.end method

.method onUssdFinished(Ljava/lang/String;Z)V
    .registers 5
    .parameter "ussdMessage"
    .parameter "isUssdRequest"

    .prologue
    .line 843
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    sget-object v1, Lcom/android/internal/telephony/MmiCode$State;->PENDING:Lcom/android/internal/telephony/MmiCode$State;

    if-ne v0, v1, :cond_20

    .line 844
    if-nez p1, :cond_21

    .line 845
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v1, 0x1040134

    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->message:Ljava/lang/CharSequence;

    .line 849
    :goto_13
    iput-boolean p2, p0, Lcom/movial/ipphone/IPMmiCode;->isUssdRequest:Z

    .line 851
    if-nez p2, :cond_1b

    .line 852
    sget-object v0, Lcom/android/internal/telephony/MmiCode$State;->COMPLETE:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    .line 855
    :cond_1b
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v0, p0}, Lcom/movial/ipphone/IPPhone;->onMMIDone(Lcom/movial/ipphone/IPMmiCode;)V

    .line 857
    :cond_20
    return-void

    .line 847
    :cond_21
    iput-object p1, p0, Lcom/movial/ipphone/IPMmiCode;->message:Ljava/lang/CharSequence;

    goto :goto_13
.end method

.method onUssdFinishedError()V
    .registers 3

    .prologue
    .line 867
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    sget-object v1, Lcom/android/internal/telephony/MmiCode$State;->PENDING:Lcom/android/internal/telephony/MmiCode$State;

    if-ne v0, v1, :cond_1a

    .line 868
    sget-object v0, Lcom/android/internal/telephony/MmiCode$State;->FAILED:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    .line 869
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v1, 0x1040125

    invoke-virtual {v0, v1}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->message:Ljava/lang/CharSequence;

    .line 871
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v0, p0}, Lcom/movial/ipphone/IPPhone;->onMMIDone(Lcom/movial/ipphone/IPMmiCode;)V

    .line 873
    :cond_1a
    return-void
.end method

.method processCode()V
    .registers 13

    .prologue
    const/4 v7, 0x0

    const/4 v0, 0x1

    .line 623
    :try_start_2
    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isShortCode()Z

    move-result v5

    if-eqz v5, :cond_15

    .line 624
    const-string v0, "IPMmiCode"

    const-string v5, "isShortCode"

    invoke-static {v0, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 626
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->dialingNumber:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/movial/ipphone/IPMmiCode;->sendUssd(Ljava/lang/String;)V

    .line 821
    :goto_14
    return-void

    .line 627
    :cond_15
    iget-object v5, p0, Lcom/movial/ipphone/IPMmiCode;->dialingNumber:Ljava/lang/String;

    if-eqz v5, :cond_37

    .line 629
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v5, "Invalid or Unsupported MMI Code"

    invoke-direct {v0, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_21
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_21} :catch_21

    .line 816
    :catch_21
    move-exception v6

    .line 817
    .local v6, exc:Ljava/lang/RuntimeException;
    sget-object v0, Lcom/android/internal/telephony/MmiCode$State;->FAILED:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    .line 818
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v5, 0x1040125

    invoke-virtual {v0, v5}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->message:Ljava/lang/CharSequence;

    .line 819
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v0, p0}, Lcom/movial/ipphone/IPPhone;->onMMIDone(Lcom/movial/ipphone/IPMmiCode;)V

    goto :goto_14

    .line 630
    .end local v6           #exc:Ljava/lang/RuntimeException;
    :cond_37
    :try_start_37
    iget-object v5, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    if-eqz v5, :cond_d3

    iget-object v5, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    const-string v11, "30"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_d3

    .line 631
    const-string v0, "IPMmiCode"

    const-string v5, "is CLIP"

    invoke-static {v0, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 632
    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isInterrogate()Z

    move-result v0

    if-eqz v0, :cond_5a

    .line 635
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v5, "Invalid or Unsupported MMI Code"

    invoke-direct {v0, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 636
    :cond_5a
    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isActivate()Z

    move-result v0

    if-eqz v0, :cond_92

    .line 637
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v5, "CLIP"

    const/4 v11, 0x1

    invoke-static {v0, v5, v11}, Lcom/movial/ipphone/IPPhoneSettings;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 638
    sget-object v0, Lcom/android/internal/telephony/MmiCode$State;->COMPLETE:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    .line 639
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/movial/ipphone/IPMmiCode;->getScString()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-direct {v9, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 640
    .local v9, sb:Ljava/lang/StringBuilder;
    const-string v0, "\n"

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 641
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v5, 0x104012e

    invoke-virtual {v0, v5}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 642
    iput-object v9, p0, Lcom/movial/ipphone/IPMmiCode;->message:Ljava/lang/CharSequence;

    .line 643
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v0, p0}, Lcom/movial/ipphone/IPPhone;->onMMIDone(Lcom/movial/ipphone/IPMmiCode;)V

    goto :goto_14

    .line 644
    .end local v9           #sb:Ljava/lang/StringBuilder;
    :cond_92
    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isDeactivate()Z

    move-result v0

    if-eqz v0, :cond_cb

    .line 645
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v5, "CLIP"

    const/4 v11, 0x0

    invoke-static {v0, v5, v11}, Lcom/movial/ipphone/IPPhoneSettings;->putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    .line 646
    sget-object v0, Lcom/android/internal/telephony/MmiCode$State;->COMPLETE:Lcom/android/internal/telephony/MmiCode$State;

    iput-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->state:Lcom/android/internal/telephony/MmiCode$State;

    .line 647
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/movial/ipphone/IPMmiCode;->getScString()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-direct {v9, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 648
    .restart local v9       #sb:Ljava/lang/StringBuilder;
    const-string v0, "\n"

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 649
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->context:Landroid/content/Context;

    const v5, 0x1040130

    invoke-virtual {v0, v5}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 650
    iput-object v9, p0, Lcom/movial/ipphone/IPMmiCode;->message:Ljava/lang/CharSequence;

    .line 651
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {v0, p0}, Lcom/movial/ipphone/IPPhone;->onMMIDone(Lcom/movial/ipphone/IPMmiCode;)V

    goto/16 :goto_14

    .line 653
    .end local v9           #sb:Ljava/lang/StringBuilder;
    :cond_cb
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v5, "Invalid or Unsupported MMI Code"

    invoke-direct {v0, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 655
    :cond_d3
    iget-object v5, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    if-eqz v5, :cond_128

    iget-object v5, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    const-string v11, "31"

    invoke-virtual {v5, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_128

    .line 656
    const-string v0, "IPMmiCode"

    const-string v5, "is CLIR"

    invoke-static {v0, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 657
    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isActivate()Z

    move-result v0

    if-eqz v0, :cond_fb

    .line 658
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    const/4 v5, 0x1

    const/4 v11, 0x1

    invoke-virtual {p0, v11, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v11

    invoke-virtual {v0, v5, v11}, Lcom/movial/ipphone/IPPhone;->setOutgoingCallerIdDisplay(ILandroid/os/Message;)V

    goto/16 :goto_14

    .line 660
    :cond_fb
    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isDeactivate()Z

    move-result v0

    if-eqz v0, :cond_10e

    .line 661
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    const/4 v5, 0x2

    const/4 v11, 0x1

    invoke-virtual {p0, v11, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v11

    invoke-virtual {v0, v5, v11}, Lcom/movial/ipphone/IPPhone;->setOutgoingCallerIdDisplay(ILandroid/os/Message;)V

    goto/16 :goto_14

    .line 663
    :cond_10e
    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isInterrogate()Z

    move-result v0

    if-eqz v0, :cond_120

    .line 664
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    const/4 v5, 0x1

    invoke-virtual {p0, v5, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/movial/ipphone/IPPhone;->getOutgoingCallerIdDisplay(Landroid/os/Message;)V

    goto/16 :goto_14

    .line 667
    :cond_120
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v5, "Invalid or Unsupported MMI Code"

    invoke-direct {v0, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 669
    :cond_128
    iget-object v5, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    invoke-static {v5}, Lcom/movial/ipphone/IPMmiCode;->isServiceCodeCallForwarding(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1a7

    .line 670
    const-string v5, "IPMmiCode"

    const-string v11, "is CF"

    invoke-static {v5, v11}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 672
    iget-object v3, p0, Lcom/movial/ipphone/IPMmiCode;->sia:Ljava/lang/String;

    .line 673
    .local v3, dialingNumber:Ljava/lang/String;
    iget-object v5, p0, Lcom/movial/ipphone/IPMmiCode;->sib:Ljava/lang/String;

    invoke-static {v5}, Lcom/movial/ipphone/IPMmiCode;->siToServiceClass(Ljava/lang/String;)I

    move-result v10

    .line 674
    .local v10, serviceClass:I
    iget-object v5, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    invoke-static {v5}, Lcom/movial/ipphone/IPMmiCode;->scToCallForwardReason(Ljava/lang/String;)I

    move-result v2

    .line 675
    .local v2, reason:I
    iget-object v5, p0, Lcom/movial/ipphone/IPMmiCode;->sic:Ljava/lang/String;

    invoke-static {v5}, Lcom/movial/ipphone/IPMmiCode;->siToTime(Ljava/lang/String;)I

    move-result v4

    .line 677
    .local v4, time:I
    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isInterrogate()Z

    move-result v5

    if-eqz v5, :cond_159

    .line 681
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v5, "Invalid or Unsupported MMI Code"

    invoke-direct {v0, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 685
    :cond_159
    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isActivate()Z

    move-result v5

    if-eqz v5, :cond_185

    .line 686
    const/4 v1, 0x1

    .line 697
    .local v1, cfAction:I
    :goto_160
    if-eqz v2, :cond_165

    const/4 v5, 0x4

    if-ne v2, v5, :cond_1a5

    :cond_165
    and-int/lit8 v5, v10, 0x1

    if-nez v5, :cond_16b

    if-nez v10, :cond_1a5

    :cond_16b
    move v8, v0

    .line 703
    .local v8, isSettingUnconditionalVoice:I
    :goto_16c
    if-eq v1, v0, :cond_171

    const/4 v5, 0x3

    if-ne v1, v5, :cond_172

    :cond_171
    move v7, v0

    .line 707
    .local v7, isEnableDesired:I
    :cond_172
    const-string v0, "IPMmiCode"

    const-string v5, "is CF setCallForward"

    invoke-static {v0, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 708
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    const/4 v5, 0x6

    invoke-virtual {p0, v5, v8, v7, p0}, Landroid/os/Handler;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lcom/movial/ipphone/IPPhone;->setCallForwardingOption(IILjava/lang/String;ILandroid/os/Message;)V

    goto/16 :goto_14

    .line 687
    .end local v1           #cfAction:I
    .end local v7           #isEnableDesired:I
    .end local v8           #isSettingUnconditionalVoice:I
    :cond_185
    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isDeactivate()Z

    move-result v5

    if-eqz v5, :cond_18d

    .line 688
    const/4 v1, 0x0

    .restart local v1       #cfAction:I
    goto :goto_160

    .line 689
    .end local v1           #cfAction:I
    :cond_18d
    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isRegister()Z

    move-result v5

    if-eqz v5, :cond_195

    .line 690
    const/4 v1, 0x3

    .restart local v1       #cfAction:I
    goto :goto_160

    .line 691
    .end local v1           #cfAction:I
    :cond_195
    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isErasure()Z

    move-result v5

    if-eqz v5, :cond_19d

    .line 692
    const/4 v1, 0x4

    .restart local v1       #cfAction:I
    goto :goto_160

    .line 694
    .end local v1           #cfAction:I
    :cond_19d
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v5, "invalid action"

    invoke-direct {v0, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .restart local v1       #cfAction:I
    :cond_1a5
    move v8, v7

    .line 697
    goto :goto_16c

    .line 761
    .end local v1           #cfAction:I
    .end local v2           #reason:I
    .end local v3           #dialingNumber:Ljava/lang/String;
    .end local v4           #time:I
    .end local v10           #serviceClass:I
    :cond_1a7
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    if-eqz v0, :cond_1ed

    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->sc:Ljava/lang/String;

    const-string v5, "43"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1ed

    .line 763
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->sia:Ljava/lang/String;

    invoke-static {v0}, Lcom/movial/ipphone/IPMmiCode;->siToServiceClass(Ljava/lang/String;)I

    move-result v10

    .line 765
    .restart local v10       #serviceClass:I
    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isActivate()Z

    move-result v0

    if-nez v0, :cond_1c7

    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isDeactivate()Z

    move-result v0

    if-eqz v0, :cond_1d7

    .line 766
    :cond_1c7
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isActivate()Z

    move-result v5

    const/4 v11, 0x1

    invoke-virtual {p0, v11, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v11

    invoke-virtual {v0, v5, v11}, Lcom/movial/ipphone/IPPhone;->setCallWaiting(ZLandroid/os/Message;)V

    goto/16 :goto_14

    .line 767
    :cond_1d7
    invoke-virtual {p0}, Lcom/movial/ipphone/IPMmiCode;->isInterrogate()Z

    move-result v0

    if-eqz v0, :cond_1e5

    .line 770
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v5, "Invalid or Unsupported MMI Code"

    invoke-direct {v0, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 772
    :cond_1e5
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v5, "Invalid or Unsupported MMI Code"

    invoke-direct {v0, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 811
    .end local v10           #serviceClass:I
    :cond_1ed
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->poundString:Ljava/lang/String;

    if-eqz v0, :cond_1f8

    .line 812
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->poundString:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/movial/ipphone/IPMmiCode;->sendUssd(Ljava/lang/String;)V

    goto/16 :goto_14

    .line 814
    :cond_1f8
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v5, "Invalid or Unsupported MMI Code"

    invoke-direct {v0, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_200
    .catch Ljava/lang/RuntimeException; {:try_start_37 .. :try_end_200} :catch_21
.end method

.method sendUssd(Ljava/lang/String;)V
    .registers 4
    .parameter "ussdMessage"

    .prologue
    .line 877
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/movial/ipphone/IPMmiCode;->isPendingUSSD:Z

    .line 884
    iget-object v0, p0, Lcom/movial/ipphone/IPMmiCode;->phone:Lcom/movial/ipphone/IPPhone;

    const/4 v1, 0x4

    invoke-virtual {p0, v1, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/movial/ipphone/IPPhone;->sendUSSD(Ljava/lang/String;Landroid/os/Message;)V

    .line 886
    return-void
.end method
