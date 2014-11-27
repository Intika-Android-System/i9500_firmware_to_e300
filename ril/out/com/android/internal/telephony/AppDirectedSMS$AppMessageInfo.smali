.class public Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;
.super Ljava/lang/Object;
.source "AppDirectedSMS.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/AppDirectedSMS;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AppMessageInfo"
.end annotation


# static fields
.field private static final APPDIR_SMS_NO_COMPONENT:I = 0x2

.field private static final APPDIR_SMS_TRUE:I = 0x1


# instance fields
.field private mAppDirSmsStatus:I

.field private mAppPrefix:Ljava/lang/String;

.field private mComponentname:Landroid/content/ComponentName;

.field private mParameter:Ljava/lang/String;

.field final synthetic this$0:Lcom/android/internal/telephony/AppDirectedSMS;


# direct methods
.method public constructor <init>(Lcom/android/internal/telephony/AppDirectedSMS;)V
    .registers 4
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 38
    iput-object p1, p0, Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;->this$0:Lcom/android/internal/telephony/AppDirectedSMS;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;->mAppDirSmsStatus:I

    .line 44
    iput-object v1, p0, Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;->mComponentname:Landroid/content/ComponentName;

    .line 45
    iput-object v1, p0, Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;->mParameter:Ljava/lang/String;

    .line 46
    iput-object v1, p0, Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;->mAppPrefix:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public checkifcomponentpresent()Z
    .registers 2

    .prologue
    .line 77
    iget-object v0, p0, Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;->mComponentname:Landroid/content/ComponentName;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    :goto_5
    return v0

    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public getAppPrefix()Ljava/lang/String;
    .registers 2

    .prologue
    .line 73
    iget-object v0, p0, Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;->mAppPrefix:Ljava/lang/String;

    return-object v0
.end method

.method public getappMsgBody()Ljava/lang/String;
    .registers 2

    .prologue
    .line 69
    iget-object v0, p0, Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;->mParameter:Ljava/lang/String;

    return-object v0
.end method

.method public getappdirsmsstatus()Z
    .registers 4

    .prologue
    const/4 v0, 0x1

    .line 50
    iget v1, p0, Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;->mAppDirSmsStatus:I

    if-eq v1, v0, :cond_a

    iget v1, p0, Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;->mAppDirSmsStatus:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_b

    :cond_a
    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method public getcomponentnameDirectedSms()Landroid/content/ComponentName;
    .registers 2

    .prologue
    .line 65
    iget-object v0, p0, Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;->mComponentname:Landroid/content/ComponentName;

    return-object v0
.end method

.method public setNoRegisteredComponent()V
    .registers 2

    .prologue
    .line 61
    const/4 v0, 0x2

    iput v0, p0, Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;->mAppDirSmsStatus:I

    .line 62
    return-void
.end method

.method public setSuccesfulResult(Landroid/content/ComponentName;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5
    .parameter "componentname"
    .parameter "parameter"
    .parameter "appPrefix"

    .prologue
    .line 54
    iput-object p1, p0, Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;->mComponentname:Landroid/content/ComponentName;

    .line 55
    const/4 v0, 0x1

    iput v0, p0, Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;->mAppDirSmsStatus:I

    .line 56
    iput-object p2, p0, Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;->mParameter:Ljava/lang/String;

    .line 57
    iput-object p3, p0, Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;->mAppPrefix:Ljava/lang/String;

    .line 58
    return-void
.end method
