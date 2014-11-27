.class public final Lcom/android/internal/telephony/uicc/CsimFileHandler;
.super Lcom/android/internal/telephony/uicc/IccFileHandler;
.source "CsimFileHandler.java"

# interfaces
.implements Lcom/android/internal/telephony/uicc/IccConstants;


# static fields
.field static final LOG_TAG:Ljava/lang/String; = "CsimFH"


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
    sparse-switch p1, :sswitch_data_10

    .line 56
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/uicc/IccFileHandler;->getCommonIccEFPath(I)Ljava/lang/String;

    move-result-object v0

    .line 57
    .local v0, path:Ljava/lang/String;
    if-nez v0, :cond_b

    .line 61
    const-string v0, "3F007F105F3A"

    .line 63
    .end local v0           #path:Ljava/lang/String;
    :cond_b
    :goto_b
    return-object v0

    .line 54
    :sswitch_c
    const-string v0, "3F007FFF"

    goto :goto_b

    .line 36
    nop

    :sswitch_data_10
    .sparse-switch
        0x6f22 -> :sswitch_c
        0x6f28 -> :sswitch_c
        0x6f31 -> :sswitch_c
        0x6f32 -> :sswitch_c
        0x6f3a -> :sswitch_c
        0x6f3b -> :sswitch_c
        0x6f3c -> :sswitch_c
        0x6f40 -> :sswitch_c
        0x6f41 -> :sswitch_c
        0x6f44 -> :sswitch_c
        0x6f4c -> :sswitch_c
        0x6f4d -> :sswitch_c
        0x6f57 -> :sswitch_c
        0x6f5a -> :sswitch_c
        0x6f74 -> :sswitch_c
    .end sparse-switch
.end method

.method protected logd(Ljava/lang/String;)V
    .registers 3
    .parameter "msg"

    .prologue
    .line 68
    const-string v0, "CsimFH"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    return-void
.end method

.method protected loge(Ljava/lang/String;)V
    .registers 3
    .parameter "msg"

    .prologue
    .line 73
    const-string v0, "CsimFH"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    return-void
.end method
