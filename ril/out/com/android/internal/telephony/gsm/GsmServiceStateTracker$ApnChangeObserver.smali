.class Lcom/android/internal/telephony/gsm/GsmServiceStateTracker$ApnChangeObserver;
.super Landroid/database/ContentObserver;
.source "GsmServiceStateTracker.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ApnChangeObserver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;


# direct methods
.method public constructor <init>(Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;)V
    .registers 3
    .parameter
    .parameter "gsmSST"

    .prologue
    .line 157
    iput-object p1, p0, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker$ApnChangeObserver;->this$0:Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;

    .line 158
    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 159
    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .registers 3
    .parameter "selfChange"

    .prologue
    .line 163
    iget-object v0, p0, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker$ApnChangeObserver;->this$0:Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;

    invoke-virtual {v0}, Lcom/android/internal/telephony/gsm/GsmServiceStateTracker;->checkApnInfo()V

    .line 164
    return-void
.end method
