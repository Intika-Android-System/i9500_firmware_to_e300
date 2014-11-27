.class Lcom/android/internal/telephony/dataconnection/DcTrackerBase$LteRoamingEnableObserver;
.super Landroid/database/ContentObserver;
.source "DcTrackerBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/dataconnection/DcTrackerBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LteRoamingEnableObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/telephony/dataconnection/DcTrackerBase;


# direct methods
.method public constructor <init>(Lcom/android/internal/telephony/dataconnection/DcTrackerBase;Landroid/os/Handler;)V
    .registers 3
    .parameter
    .parameter "h"

    .prologue
    .line 620
    iput-object p1, p0, Lcom/android/internal/telephony/dataconnection/DcTrackerBase$LteRoamingEnableObserver;->this$0:Lcom/android/internal/telephony/dataconnection/DcTrackerBase;

    .line 621
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 622
    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .registers 4
    .parameter "selfChange"

    .prologue
    .line 630
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTrackerBase$LteRoamingEnableObserver;->this$0:Lcom/android/internal/telephony/dataconnection/DcTrackerBase;

    const-string v1, "Do not support LTE Roaming"

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/dataconnection/DcTrackerBase;->log(Ljava/lang/String;)V

    .line 632
    return-void
.end method
