.class Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;
.super Ljava/lang/Object;
.source "AppDirectedSMS.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/AppDirectedSMS;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MatchInfo"
.end annotation


# instance fields
.field public mAppPrefix:Ljava/lang/String;

.field public mComponentName:Landroid/content/ComponentName;

.field public mParameter:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/internal/telephony/AppDirectedSMS;


# direct methods
.method private constructor <init>(Lcom/android/internal/telephony/AppDirectedSMS;)V
    .registers 3
    .parameter

    .prologue
    const/4 v0, 0x0

    .line 81
    iput-object p1, p0, Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;->this$0:Lcom/android/internal/telephony/AppDirectedSMS;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 83
    iput-object v0, p0, Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;->mComponentName:Landroid/content/ComponentName;

    .line 84
    iput-object v0, p0, Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;->mAppPrefix:Ljava/lang/String;

    .line 85
    iput-object v0, p0, Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;->mParameter:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/internal/telephony/AppDirectedSMS;Lcom/android/internal/telephony/AppDirectedSMS$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 81
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;-><init>(Lcom/android/internal/telephony/AppDirectedSMS;)V

    return-void
.end method
