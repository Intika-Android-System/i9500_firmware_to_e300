.class Lcom/android/internal/telephony/uicc/IsimUiccRecords$EfIsimIstLoaded;
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
    name = "EfIsimIstLoaded"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/telephony/uicc/IsimUiccRecords;


# direct methods
.method private constructor <init>(Lcom/android/internal/telephony/uicc/IsimUiccRecords;)V
    .registers 2
    .parameter

    .prologue
    .line 297
    iput-object p1, p0, Lcom/android/internal/telephony/uicc/IsimUiccRecords$EfIsimIstLoaded;->this$0:Lcom/android/internal/telephony/uicc/IsimUiccRecords;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/internal/telephony/uicc/IsimUiccRecords;Lcom/android/internal/telephony/uicc/IsimUiccRecords$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 297
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/uicc/IsimUiccRecords$EfIsimIstLoaded;-><init>(Lcom/android/internal/telephony/uicc/IsimUiccRecords;)V

    return-void
.end method


# virtual methods
.method public getEfName()Ljava/lang/String;
    .registers 2

    .prologue
    .line 299
    const-string v0, "EF_ISIM_IST"

    return-object v0
.end method

.method public onRecordLoaded(Landroid/os/AsyncResult;)V
    .registers 5
    .parameter "ar"

    .prologue
    const/4 v1, 0x0

    .line 309
    iget-object v2, p0, Lcom/android/internal/telephony/uicc/IsimUiccRecords$EfIsimIstLoaded;->this$0:Lcom/android/internal/telephony/uicc/IsimUiccRecords;

    iget-object v0, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v0, [B

    check-cast v0, [B

    aget-byte v0, v0, v1

    and-int/lit8 v0, v0, 0x2

    if-eqz v0, :cond_14

    const/4 v0, 0x1

    :goto_10
    #setter for: Lcom/android/internal/telephony/uicc/IsimUiccRecords;->mIsGbaSupported:Z
    invoke-static {v2, v0}, Lcom/android/internal/telephony/uicc/IsimUiccRecords;->access$1102(Lcom/android/internal/telephony/uicc/IsimUiccRecords;Z)Z

    .line 314
    return-void

    :cond_14
    move v0, v1

    .line 309
    goto :goto_10
.end method
