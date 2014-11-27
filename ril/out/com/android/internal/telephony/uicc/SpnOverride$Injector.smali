.class Lcom/android/internal/telephony/uicc/SpnOverride$Injector;
.super Ljava/lang/Object;
.source "SpnOverride.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/uicc/SpnOverride;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Injector"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static closeSpnReader(Ljava/io/FileReader;)V
    .registers 2
    .parameter "spnReader"

    .prologue
    .line 40
    if-eqz p0, :cond_5

    .line 42
    :try_start_2
    invoke-virtual {p0}, Ljava/io/FileReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_5} :catch_6

    .line 46
    :cond_5
    :goto_5
    return-void

    .line 43
    :catch_6
    move-exception v0

    goto :goto_5
.end method
