.class final Lcom/android/internal/telephony/SmsApplication$SmsPackageMonitor;
.super Lcom/android/internal/content/PackageMonitor;
.source "SmsApplication.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/SmsApplication;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SmsPackageMonitor"
.end annotation


# instance fields
.field final mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .parameter "context"

    .prologue
    .line 498
    invoke-direct {p0}, Lcom/android/internal/content/PackageMonitor;-><init>()V

    .line 499
    iput-object p1, p0, Lcom/android/internal/telephony/SmsApplication$SmsPackageMonitor;->mContext:Landroid/content/Context;

    .line 500
    return-void
.end method

.method private onPackageChanged(Ljava/lang/String;)V
    .registers 7
    .parameter "packageName"

    .prologue
    .line 519
    iget-object v3, p0, Lcom/android/internal/telephony/SmsApplication$SmsPackageMonitor;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/sec/android/emergencymode/EmergencyManager;->getInstance(Landroid/content/Context;)Lcom/sec/android/emergencymode/EmergencyManager;

    move-result-object v1

    .line 520
    .local v1, emMgr:Lcom/sec/android/emergencymode/EmergencyManager;
    invoke-virtual {v1}, Lcom/sec/android/emergencymode/EmergencyManager;->isEmergencyMode()Z

    move-result v3

    if-eqz v3, :cond_d

    .line 530
    :cond_c
    :goto_c
    return-void

    .line 524
    :cond_d
    iget-object v3, p0, Lcom/android/internal/telephony/SmsApplication$SmsPackageMonitor;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    .line 526
    .local v2, packageManager:Landroid/content/pm/PackageManager;
    iget-object v3, p0, Lcom/android/internal/telephony/SmsApplication$SmsPackageMonitor;->mContext:Landroid/content/Context;

    const/4 v4, 0x1

    invoke-static {v3, v4}, Lcom/android/internal/telephony/SmsApplication;->getDefaultSendToApplication(Landroid/content/Context;Z)Landroid/content/ComponentName;

    move-result-object v0

    .line 527
    .local v0, componentName:Landroid/content/ComponentName;
    if-eqz v0, :cond_c

    .line 528
    #calls: Lcom/android/internal/telephony/SmsApplication;->configurePreferredActivity(Landroid/content/pm/PackageManager;Landroid/content/ComponentName;)V
    invoke-static {v2, v0}, Lcom/android/internal/telephony/SmsApplication;->access$000(Landroid/content/pm/PackageManager;Landroid/content/ComponentName;)V

    goto :goto_c
.end method


# virtual methods
.method public onPackageAppeared(Ljava/lang/String;I)V
    .registers 3
    .parameter "packageName"
    .parameter "reason"

    .prologue
    .line 509
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/SmsApplication$SmsPackageMonitor;->onPackageChanged(Ljava/lang/String;)V

    .line 510
    return-void
.end method

.method public onPackageDisappeared(Ljava/lang/String;I)V
    .registers 3
    .parameter "packageName"
    .parameter "reason"

    .prologue
    .line 504
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/SmsApplication$SmsPackageMonitor;->onPackageChanged(Ljava/lang/String;)V

    .line 505
    return-void
.end method

.method public onPackageModified(Ljava/lang/String;)V
    .registers 2
    .parameter "packageName"

    .prologue
    .line 514
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/SmsApplication$SmsPackageMonitor;->onPackageChanged(Ljava/lang/String;)V

    .line 515
    return-void
.end method
