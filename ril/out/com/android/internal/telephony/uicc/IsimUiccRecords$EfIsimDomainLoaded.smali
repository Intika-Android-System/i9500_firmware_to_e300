.class Lcom/android/internal/telephony/uicc/IsimUiccRecords$EfIsimDomainLoaded;
.super Ljava/lang/Object;
.source "IsimUiccRecords.java"

# interfaces
.implements Lcom/android/internal/telephony/uicc/IccRecords$IccRecordLoaded;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/uicc/IsimUiccRecords;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "EfIsimDomainLoaded"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/telephony/uicc/IsimUiccRecords;


# direct methods
.method private constructor <init>(Lcom/android/internal/telephony/uicc/IsimUiccRecords;)V
    .registers 2
    .parameter

    .prologue
    .line 268
    iput-object p1, p0, Lcom/android/internal/telephony/uicc/IsimUiccRecords$EfIsimDomainLoaded;->this$0:Lcom/android/internal/telephony/uicc/IsimUiccRecords;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/internal/telephony/uicc/IsimUiccRecords;Lcom/android/internal/telephony/uicc/IsimUiccRecords$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 268
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/uicc/IsimUiccRecords$EfIsimDomainLoaded;-><init>(Lcom/android/internal/telephony/uicc/IsimUiccRecords;)V

    return-void
.end method


# virtual methods
.method public getEfName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 270
    const-string v0, "EF_ISIM_DOMAIN"

    return-object v0
.end method

.method public onRecordLoaded(Landroid/os/AsyncResult;)V
    .registers 5
    .parameter "ar"

    .prologue
    .line 273
    iget-object v1, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v1, [B

    move-object v0, v1

    check-cast v0, [B

    .line 274
    .local v0, data:[B
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/IsimUiccRecords$EfIsimDomainLoaded;->this$0:Lcom/android/internal/telephony/uicc/IsimUiccRecords;

    #calls: Lcom/android/internal/telephony/uicc/IsimUiccRecords;->isimTlvToString([B)Ljava/lang/String;
    invoke-static {v0}, Lcom/android/internal/telephony/uicc/IsimUiccRecords;->access$700([B)Ljava/lang/String;

    move-result-object v2

    #setter for: Lcom/android/internal/telephony/uicc/IsimUiccRecords;->mIsimDomain:Ljava/lang/String;
    invoke-static {v1, v2}, Lcom/android/internal/telephony/uicc/IsimUiccRecords;->access$902(Lcom/android/internal/telephony/uicc/IsimUiccRecords;Ljava/lang/String;)Ljava/lang/String;

    .line 276
    return-void
.end method