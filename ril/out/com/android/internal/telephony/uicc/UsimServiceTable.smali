.class public final Lcom/android/internal/telephony/uicc/UsimServiceTable;
.super Lcom/android/internal/telephony/uicc/IccServiceTable;
.source "UsimServiceTable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/uicc/UsimServiceTable$SimService;,
        Lcom/android/internal/telephony/uicc/UsimServiceTable$UsimService;
    }
.end annotation


# direct methods
.method public constructor <init>([B)V
    .registers 2
    .parameter "table"

    .prologue
    .line 193
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/uicc/IccServiceTable;-><init>([B)V

    .line 194
    return-void
.end method


# virtual methods
.method protected getTag()Ljava/lang/String;
    .registers 2

    .prologue
    .line 202
    const-string v0, "UsimServiceTable"

    return-object v0
.end method

.method protected getValues()[Ljava/lang/Object;
    .registers 2

    .prologue
    .line 207
    invoke-static {}, Lcom/android/internal/telephony/uicc/UsimServiceTable$UsimService;->values()[Lcom/android/internal/telephony/uicc/UsimServiceTable$UsimService;

    move-result-object v0

    return-object v0
.end method

.method public isAvailable(Lcom/android/internal/telephony/uicc/UsimServiceTable$UsimService;)Z
    .registers 3
    .parameter "service"

    .prologue
    .line 197
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-super {p0, v0}, Lcom/android/internal/telephony/uicc/IccServiceTable;->isAvailable(I)Z

    move-result v0

    return v0
.end method

.method public isSSTActive(Lcom/android/internal/telephony/uicc/UsimServiceTable$SimService;)Z
    .registers 3
    .parameter "service"

    .prologue
    .line 216
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-super {p0, v0}, Lcom/android/internal/telephony/uicc/IccServiceTable;->isSSTActive(I)Z

    move-result v0

    return v0
.end method

.method public isSSTAvailable(Lcom/android/internal/telephony/uicc/UsimServiceTable$SimService;)Z
    .registers 3
    .parameter "service"

    .prologue
    .line 212
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    invoke-super {p0, v0}, Lcom/android/internal/telephony/uicc/IccServiceTable;->isSSTAvailable(I)Z

    move-result v0

    return v0
.end method
