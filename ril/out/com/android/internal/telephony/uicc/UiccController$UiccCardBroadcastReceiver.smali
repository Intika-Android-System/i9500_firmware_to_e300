.class Lcom/android/internal/telephony/uicc/UiccController$UiccCardBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "UiccController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/uicc/UiccController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "UiccCardBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/telephony/uicc/UiccController;


# direct methods
.method private constructor <init>(Lcom/android/internal/telephony/uicc/UiccController;)V
    .registers 2
    .parameter

    .prologue
    .line 326
    iput-object p1, p0, Lcom/android/internal/telephony/uicc/UiccController$UiccCardBroadcastReceiver;->this$0:Lcom/android/internal/telephony/uicc/UiccController;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/internal/telephony/uicc/UiccController;Lcom/android/internal/telephony/uicc/UiccController$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 326
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/uicc/UiccController$UiccCardBroadcastReceiver;-><init>(Lcom/android/internal/telephony/uicc/UiccController;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 8
    .parameter "context"
    .parameter "intent"

    .prologue
    const/4 v4, 0x0

    .line 329
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 330
    .local v0, action:Ljava/lang/String;
    const-string v2, "com.samsung.intent.action.ICC_CARD_STATE_CHANGED"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3c

    .line 331
    const-string v2, "status"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 332
    .local v1, iccStatus:Ljava/lang/String;
    const-string v2, "UiccController"

    const-string v3, "Receive com.samsung.intent.action.ICC_CARD_STATE_CHANGED"

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 333
    const-string v2, "INSERTED"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3d

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController$UiccCardBroadcastReceiver;->this$0:Lcom/android/internal/telephony/uicc/UiccController;

    #getter for: Lcom/android/internal/telephony/uicc/UiccController;->updateFlag:Z
    invoke-static {v2}, Lcom/android/internal/telephony/uicc/UiccController;->access$100(Lcom/android/internal/telephony/uicc/UiccController;)Z

    move-result v2

    if-eqz v2, :cond_3d

    .line 334
    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController$UiccCardBroadcastReceiver;->this$0:Lcom/android/internal/telephony/uicc/UiccController;

    #setter for: Lcom/android/internal/telephony/uicc/UiccController;->updateFlag:Z
    invoke-static {v2, v4}, Lcom/android/internal/telephony/uicc/UiccController;->access$102(Lcom/android/internal/telephony/uicc/UiccController;Z)Z

    .line 335
    const-string v2, "UiccController"

    const-string v3, "Receive ICC_CARD_STATE_CHANGED INSERTED"

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 336
    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController$UiccCardBroadcastReceiver;->this$0:Lcom/android/internal/telephony/uicc/UiccController;

    const/4 v3, 0x1

    #calls: Lcom/android/internal/telephony/uicc/UiccController;->onIccSwap(Z)V
    invoke-static {v2, v3}, Lcom/android/internal/telephony/uicc/UiccController;->access$200(Lcom/android/internal/telephony/uicc/UiccController;Z)V

    .line 343
    .end local v1           #iccStatus:Ljava/lang/String;
    :cond_3c
    :goto_3c
    return-void

    .line 337
    .restart local v1       #iccStatus:Ljava/lang/String;
    :cond_3d
    const-string v2, "REMOVED"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3c

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController$UiccCardBroadcastReceiver;->this$0:Lcom/android/internal/telephony/uicc/UiccController;

    #getter for: Lcom/android/internal/telephony/uicc/UiccController;->updateFlag:Z
    invoke-static {v2}, Lcom/android/internal/telephony/uicc/UiccController;->access$100(Lcom/android/internal/telephony/uicc/UiccController;)Z

    move-result v2

    if-eqz v2, :cond_3c

    .line 338
    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController$UiccCardBroadcastReceiver;->this$0:Lcom/android/internal/telephony/uicc/UiccController;

    #setter for: Lcom/android/internal/telephony/uicc/UiccController;->updateFlag:Z
    invoke-static {v2, v4}, Lcom/android/internal/telephony/uicc/UiccController;->access$102(Lcom/android/internal/telephony/uicc/UiccController;Z)Z

    .line 339
    const-string v2, "UiccController"

    const-string v3, "Receive ICC_CARD_STATE_CHANGED REMOVED"

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 340
    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController$UiccCardBroadcastReceiver;->this$0:Lcom/android/internal/telephony/uicc/UiccController;

    #calls: Lcom/android/internal/telephony/uicc/UiccController;->onIccSwap(Z)V
    invoke-static {v2, v4}, Lcom/android/internal/telephony/uicc/UiccController;->access$200(Lcom/android/internal/telephony/uicc/UiccController;Z)V

    goto :goto_3c
.end method
