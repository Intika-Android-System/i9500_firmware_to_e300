.class Lcom/movial/ipphone/WifiCallSwitchPreference$6;
.super Landroid/database/ContentObserver;
.source "WifiCallSwitchPreference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/movial/ipphone/WifiCallSwitchPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/movial/ipphone/WifiCallSwitchPreference;


# direct methods
.method constructor <init>(Lcom/movial/ipphone/WifiCallSwitchPreference;Landroid/os/Handler;)V
    .registers 3
    .parameter
    .parameter "x0"

    .prologue
    .line 223
    iput-object p1, p0, Lcom/movial/ipphone/WifiCallSwitchPreference$6;->this$0:Lcom/movial/ipphone/WifiCallSwitchPreference;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .registers 5
    .parameter "selfChange"

    .prologue
    const/4 v2, 0x1

    .line 226
    const-string v0, "WifiCallSwitchPreference"

    const-string v1, "ContentObserver onChange"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 227
    iget-object v0, p0, Lcom/movial/ipphone/WifiCallSwitchPreference$6;->this$0:Lcom/movial/ipphone/WifiCallSwitchPreference;

    #getter for: Lcom/movial/ipphone/WifiCallSwitchPreference;->mContext:Landroid/content/Context;
    invoke-static {v0}, Lcom/movial/ipphone/WifiCallSwitchPreference;->access$400(Lcom/movial/ipphone/WifiCallSwitchPreference;)Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const-string v1, "CELL_ONLY"

    invoke-static {v0, v1, v2}, Lcom/movial/ipphone/IPPhoneSettings;->getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_21

    .line 228
    iget-object v0, p0, Lcom/movial/ipphone/WifiCallSwitchPreference$6;->this$0:Lcom/movial/ipphone/WifiCallSwitchPreference;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/preference/TwoStatePreference;->setChecked(Z)V

    .line 232
    :goto_20
    return-void

    .line 230
    :cond_21
    iget-object v0, p0, Lcom/movial/ipphone/WifiCallSwitchPreference$6;->this$0:Lcom/movial/ipphone/WifiCallSwitchPreference;

    invoke-virtual {v0, v2}, Landroid/preference/TwoStatePreference;->setChecked(Z)V

    goto :goto_20
.end method
