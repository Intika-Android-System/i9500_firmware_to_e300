.class public final Lcom/android/internal/telephony/uicc/IsimFileHandler;
.super Lcom/android/internal/telephony/uicc/IccFileHandler;
.source "IsimFileHandler.java"

# interfaces
.implements Lcom/android/internal/telephony/uicc/IccConstants;


# static fields
.field static final LOG_TAG:Ljava/lang/String; = "IsimFH"


# direct methods
.method public constructor <init>(Lcom/android/internal/telephony/uicc/UiccCardApplication;Ljava/lang/String;Lcom/android/internal/telephony/CommandsInterface;)V
    .registers 4
    .parameter "app"
    .parameter "aid"
    .parameter "ci"

    .prologue
    .line 31
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/telephony/uicc/IccFileHandler;-><init>(Lcom/android/internal/telephony/uicc/UiccCardApplication;Ljava/lang/String;Lcom/android/internal/telephony/CommandsInterface;)V

    .line 32
    return-void
.end method


# virtual methods
.method protected getEFPath(I)Ljava/lang/String;
    .registers 3
    .parameter "efid"

    .prologue
    .line 36
    sparse-switch p1, :sswitch_data_c

    .line 47
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getCommonIccEFPath(I)Ljava/lang/String;

    move-result-object v0

    .line 48
    :goto_7
    return-object v0

    .line 45
    :sswitch_8
    const-string v0, "3F007FFF"

    goto :goto_7

    .line 36
    nop

    :sswitch_data_c
    .sparse-switch
        0x6f02 -> :sswitch_8
        0x6f03 -> :sswitch_8
        0x6f04 -> :sswitch_8
        0x6f07 -> :sswitch_8
        0x6f09 -> :sswitch_8
        0x6fd5 -> :sswitch_8
    .end sparse-switch
.end method

.method protected logd(Ljava/lang/String;)V
    .registers 3
    .parameter "msg"

    .prologue
    .line 53
    const-string v0, "IsimFH"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    return-void
.end method

.method protected loge(Ljava/lang/String;)V
    .registers 3
    .parameter "msg"

    .prologue
    .line 58
    const-string v0, "IsimFH"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    return-void
.end method
