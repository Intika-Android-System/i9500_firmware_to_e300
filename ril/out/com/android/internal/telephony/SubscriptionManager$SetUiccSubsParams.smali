.class Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;
.super Ljava/lang/Object;
.source "SubscriptionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/SubscriptionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SetUiccSubsParams"
.end annotation


# instance fields
.field public subId:I

.field public subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

.field final synthetic this$0:Lcom/android/internal/telephony/SubscriptionManager;


# direct methods
.method public constructor <init>(Lcom/android/internal/telephony/SubscriptionManager;ILcom/android/internal/telephony/Subscription$SubscriptionStatus;)V
    .registers 4
    .parameter
    .parameter "sub"
    .parameter "status"

    .prologue
    .line 83
    iput-object p1, p0, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->this$0:Lcom/android/internal/telephony/SubscriptionManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    iput p2, p0, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subId:I

    .line 85
    iput-object p3, p0, Lcom/android/internal/telephony/SubscriptionManager$SetUiccSubsParams;->subStatus:Lcom/android/internal/telephony/Subscription$SubscriptionStatus;

    .line 86
    return-void
.end method
