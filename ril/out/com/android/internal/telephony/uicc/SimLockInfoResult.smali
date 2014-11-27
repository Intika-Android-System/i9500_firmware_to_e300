.class public Lcom/android/internal/telephony/uicc/SimLockInfoResult;
.super Ljava/lang/Object;
.source "SimLockInfoResult.java"


# static fields
.field private static final LOCK_ACL:I = 0xb

.field private static final LOCK_CORP_PERS:I = 0x8

.field private static final LOCK_FD:I = 0x4

.field private static final LOCK_NETWORK_PERS:I = 0x5

.field private static final LOCK_NETWORK_SUBSET_PERS:I = 0x6

.field private static final LOCK_PH_FSIM:I = 0x2

.field private static final LOCK_PH_SIM:I = 0x1

.field private static final LOCK_PIN2:I = 0x9

.field private static final LOCK_PUK2:I = 0xa

.field private static final LOCK_READY:I = 0x0

.field private static final LOCK_SIM:I = 0x3

.field private static final LOCK_SP_PERS:I = 0x7

.field static final LOG_TAG:Ljava/lang/String; = "SimLockInfoResult"

.field private static final NOT_NEED:I = 0x0

.field private static final NO_SIM:I = 0x80

.field private static final PERM_BLOCKED:I = 0x5

.field public static final PIN:I = 0x1

.field public static final PIN2:I = 0x3

.field private static final PIN2_DISABLE:I = 0x6

.field public static final PUK:I = 0x2

.field public static final PUK2:I = 0x4

.field static Pin2_Retry:I

.field static Pin_Retry:I

.field static Puk2_Retry:I

.field static Puk_Retry:I

.field static isPermBlocked:I

.field static lockKey:I

.field static lockPin2Key:I

.field static lockPinKey:I

.field static lockType:I

.field static numRetry:I

.field static num_lock_type:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    const/4 v0, 0x0

    .line 43
    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->num_lock_type:I

    .line 44
    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockType:I

    .line 45
    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockKey:I

    .line 46
    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockPinKey:I

    .line 47
    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockPin2Key:I

    .line 48
    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->numRetry:I

    .line 49
    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin_Retry:I

    .line 50
    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin2_Retry:I

    .line 51
    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Puk_Retry:I

    .line 52
    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Puk2_Retry:I

    .line 53
    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->isPermBlocked:I

    return-void
.end method

.method public constructor <init>(IIII)V
    .registers 9
    .parameter "num_lock_type"
    .parameter "lockType"
    .parameter "lockKey"
    .parameter "numRetry"

    .prologue
    const/4 v3, 0x0

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    sput p1, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->num_lock_type:I

    .line 58
    sput p2, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockType:I

    .line 59
    sput p3, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockKey:I

    .line 60
    sput p4, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->numRetry:I

    .line 61
    const-string v0, "SimLockInfoResult"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "num:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", lockType:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", lock_key:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", numRetry:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    const/16 v0, 0xa

    if-ne p2, v0, :cond_49

    .line 64
    sput p4, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Puk2_Retry:I

    .line 121
    :goto_48
    return-void

    .line 67
    :cond_49
    packed-switch p3, :pswitch_data_10a

    goto :goto_48

    .line 70
    :pswitch_4d
    sput p4, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin_Retry:I

    .line 71
    sput p3, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockPinKey:I

    .line 72
    const-string v0, "SimLockInfoResult"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "NOT_NEED numRetry: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin_Retry:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_48

    .line 76
    :pswitch_6c
    sput p4, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin_Retry:I

    .line 77
    sput p3, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockPinKey:I

    .line 78
    const-string v0, "SimLockInfoResult"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "PIN numRetry: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin_Retry:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_48

    .line 83
    :pswitch_8b
    const/4 v0, 0x3

    if-ne p2, v0, :cond_9f

    .line 84
    sput v3, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin_Retry:I

    .line 85
    sput v3, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Puk_Retry:I

    .line 86
    const/4 v0, 0x1

    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->isPermBlocked:I

    .line 87
    sput p3, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockPinKey:I

    .line 95
    :cond_97
    :goto_97
    const-string v0, "SimLockInfoResult"

    const-string v1, "Permernet blocked"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_48

    .line 89
    :cond_9f
    const/16 v0, 0x9

    if-ne p2, v0, :cond_97

    .line 90
    sput v3, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin2_Retry:I

    .line 91
    sput v3, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Puk2_Retry:I

    .line 92
    sput p3, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockPin2Key:I

    goto :goto_97

    .line 99
    :pswitch_aa
    sput p4, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Puk_Retry:I

    .line 100
    sput p3, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockPinKey:I

    .line 101
    const-string v0, "SimLockInfoResult"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "PUK numRetry: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Puk_Retry:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_48

    .line 106
    :pswitch_c9
    sput p4, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin2_Retry:I

    .line 107
    sput p3, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockPin2Key:I

    .line 108
    const-string v0, "SimLockInfoResult"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "PIN2 numRetry: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin2_Retry:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_48

    .line 112
    :pswitch_e9
    sput p4, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Puk2_Retry:I

    .line 113
    sput p3, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockPin2Key:I

    .line 114
    const-string v0, "SimLockInfoResult"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "PUK2 numRetry: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Puk2_Retry:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_48

    .line 67
    nop

    :pswitch_data_10a
    .packed-switch 0x0
        :pswitch_4d
        :pswitch_6c
        :pswitch_aa
        :pswitch_c9
        :pswitch_e9
        :pswitch_8b
        :pswitch_c9
    .end packed-switch
.end method


# virtual methods
.method public getLockPin2Key()I
    .registers 2

    .prologue
    .line 247
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockPin2Key:I

    return v0
.end method

.method public getLockPinKey()I
    .registers 2

    .prologue
    .line 243
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockPinKey:I

    return v0
.end method

.method public getPin2Retry()I
    .registers 2

    .prologue
    .line 256
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin2_Retry:I

    return v0
.end method

.method public getPinRetry()I
    .registers 2

    .prologue
    .line 251
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin_Retry:I

    return v0
.end method

.method public getPuk2Retry()I
    .registers 2

    .prologue
    .line 266
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Puk2_Retry:I

    return v0
.end method

.method public getPukRetry()I
    .registers 2

    .prologue
    .line 261
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Puk_Retry:I

    return v0
.end method

.method public isSimBlocked()I
    .registers 2

    .prologue
    .line 272
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->isPermBlocked:I

    return v0
.end method

.method public setLockInfoResult(IIII)V
    .registers 9
    .parameter "Pin_Retry"
    .parameter "Puk_Retry"
    .parameter "Pin2_Retry"
    .parameter "Puk2_Retry"

    .prologue
    const/4 v3, -0x1

    .line 191
    const-string v0, "SimLockInfoResult"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Pin_Retry:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", Puk_Retry:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", Pin2_Retry:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", Puk2_Retry:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    if-eq p1, v3, :cond_3b

    .line 195
    sput p1, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin_Retry:I

    .line 198
    :cond_3b
    if-eq p2, v3, :cond_3f

    .line 200
    sput p2, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Puk_Retry:I

    .line 203
    :cond_3f
    if-eq p3, v3, :cond_43

    .line 205
    sput p3, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin2_Retry:I

    .line 208
    :cond_43
    if-eq p4, v3, :cond_47

    .line 210
    sput p4, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Puk2_Retry:I

    .line 212
    :cond_47
    return-void
.end method

.method public setLockInfoResult(IIIIII)V
    .registers 11
    .parameter "Pin_Retry"
    .parameter "Puk_Retry"
    .parameter "Pin2_Retry"
    .parameter "Puk2_Retry"
    .parameter "lockKey"
    .parameter "lockKey2"

    .prologue
    const/4 v3, -0x1

    .line 216
    const-string v0, "SimLockInfoResult"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Pin_Retry:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", Puk_Retry:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", Pin2_Retry:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", Puk2_Retry:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", lockKey:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", lockKey2:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 218
    if-eq p1, v3, :cond_4f

    .line 220
    sput p1, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin_Retry:I

    .line 223
    :cond_4f
    if-eq p2, v3, :cond_53

    .line 225
    sput p2, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Puk_Retry:I

    .line 228
    :cond_53
    if-eq p3, v3, :cond_57

    .line 230
    sput p3, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin2_Retry:I

    .line 233
    :cond_57
    if-eq p4, v3, :cond_5b

    .line 235
    sput p4, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Puk2_Retry:I

    .line 237
    :cond_5b
    sput p5, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockPinKey:I

    .line 238
    sput p6, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockPin2Key:I

    .line 239
    return-void
.end method

.method setLockInfoResult(Lcom/android/internal/telephony/uicc/SimLockInfoResult;)V
    .registers 6
    .parameter "simLockInfoResult"

    .prologue
    const/4 v3, 0x0

    .line 125
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->num_lock_type:I

    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->num_lock_type:I

    .line 126
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockType:I

    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockType:I

    .line 127
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockKey:I

    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockKey:I

    .line 128
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->numRetry:I

    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->numRetry:I

    .line 129
    const-string v0, "SimLockInfoResult"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "num:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->num_lock_type:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", lockType:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockType:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", lock_key:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockKey:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", numRetry:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->numRetry:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockType:I

    const/16 v1, 0xa

    if-ne v0, v1, :cond_5a

    .line 132
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->numRetry:I

    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Puk2_Retry:I

    .line 187
    :goto_59
    return-void

    .line 135
    :cond_5a
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockKey:I

    packed-switch v0, :pswitch_data_13a

    goto :goto_59

    .line 138
    :pswitch_60
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->numRetry:I

    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin_Retry:I

    .line 139
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockKey:I

    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockPinKey:I

    .line 140
    const-string v0, "SimLockInfoResult"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "NOT_NEED numRetry: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin_Retry:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_59

    .line 144
    :pswitch_83
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->numRetry:I

    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin_Retry:I

    .line 145
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockKey:I

    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockPinKey:I

    .line 146
    const-string v0, "SimLockInfoResult"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "PIN numRetry: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin_Retry:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_59

    .line 150
    :pswitch_a6
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockType:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_be

    .line 151
    sput v3, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin_Retry:I

    .line 152
    sput v3, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Puk_Retry:I

    .line 153
    const/4 v0, 0x1

    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->isPermBlocked:I

    .line 154
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockKey:I

    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockPinKey:I

    .line 162
    :cond_b6
    :goto_b6
    const-string v0, "SimLockInfoResult"

    const-string v1, "Permernet blocked"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_59

    .line 156
    :cond_be
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockType:I

    const/16 v1, 0x9

    if-ne v0, v1, :cond_b6

    .line 157
    sput v3, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin2_Retry:I

    .line 158
    sput v3, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Puk2_Retry:I

    .line 159
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockKey:I

    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockPin2Key:I

    goto :goto_b6

    .line 165
    :pswitch_cd
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->numRetry:I

    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Puk_Retry:I

    .line 166
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockKey:I

    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockPinKey:I

    .line 167
    const-string v0, "SimLockInfoResult"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "PUK numRetry: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Puk_Retry:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_59

    .line 172
    :pswitch_f1
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockKey:I

    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockPin2Key:I

    .line 173
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->numRetry:I

    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin2_Retry:I

    .line 174
    const-string v0, "SimLockInfoResult"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "PIN2 numRetry: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Pin2_Retry:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_59

    .line 178
    :pswitch_115
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->numRetry:I

    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Puk2_Retry:I

    .line 179
    sget v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockKey:I

    sput v0, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->lockPin2Key:I

    .line 180
    const-string v0, "SimLockInfoResult"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "PUK2 numRetry: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/android/internal/telephony/uicc/SimLockInfoResult;->Puk2_Retry:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_59

    .line 135
    nop

    :pswitch_data_13a
    .packed-switch 0x0
        :pswitch_60
        :pswitch_83
        :pswitch_cd
        :pswitch_f1
        :pswitch_115
        :pswitch_a6
        :pswitch_f1
    .end packed-switch
.end method
