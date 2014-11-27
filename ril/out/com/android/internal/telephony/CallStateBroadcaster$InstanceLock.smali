.class public Lcom/android/internal/telephony/CallStateBroadcaster$InstanceLock;
.super Ljava/lang/Object;
.source "CallStateBroadcaster.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/CallStateBroadcaster;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InstanceLock"
.end annotation


# static fields
.field private static sLockCount:I

.field private static sMutex:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 66
    const/4 v0, 0x0

    sput v0, Lcom/android/internal/telephony/CallStateBroadcaster$InstanceLock;->sLockCount:I

    .line 67
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/internal/telephony/CallStateBroadcaster$InstanceLock;->sMutex:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 5
    .parameter "context"

    .prologue
    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    sget-object v1, Lcom/android/internal/telephony/CallStateBroadcaster$InstanceLock;->sMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 50
    :try_start_6
    sget v0, Lcom/android/internal/telephony/CallStateBroadcaster$InstanceLock;->sLockCount:I

    if-nez v0, :cond_13

    .line 51
    new-instance v0, Lcom/android/internal/telephony/CallStateBroadcaster;

    const/4 v2, 0x0

    invoke-direct {v0, p1, v2}, Lcom/android/internal/telephony/CallStateBroadcaster;-><init>(Landroid/content/Context;Lcom/android/internal/telephony/CallStateBroadcaster$1;)V

    invoke-static {v0}, Lcom/android/internal/telephony/CallStateBroadcaster;->access$002(Lcom/android/internal/telephony/CallStateBroadcaster;)Lcom/android/internal/telephony/CallStateBroadcaster;

    .line 53
    :cond_13
    sget v0, Lcom/android/internal/telephony/CallStateBroadcaster$InstanceLock;->sLockCount:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lcom/android/internal/telephony/CallStateBroadcaster$InstanceLock;->sLockCount:I

    .line 54
    monitor-exit v1

    .line 55
    return-void

    .line 54
    :catchall_1b
    move-exception v0

    monitor-exit v1
    :try_end_1d
    .catchall {:try_start_6 .. :try_end_1d} :catchall_1b

    throw v0
.end method


# virtual methods
.method protected finalize()V
    .registers 3

    .prologue
    .line 59
    sget-object v1, Lcom/android/internal/telephony/CallStateBroadcaster$InstanceLock;->sMutex:Ljava/lang/Object;

    monitor-enter v1

    .line 60
    :try_start_3
    sget v0, Lcom/android/internal/telephony/CallStateBroadcaster$InstanceLock;->sLockCount:I

    add-int/lit8 v0, v0, -0x1

    sput v0, Lcom/android/internal/telephony/CallStateBroadcaster$InstanceLock;->sLockCount:I

    if-nez v0, :cond_f

    .line 61
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/android/internal/telephony/CallStateBroadcaster;->access$002(Lcom/android/internal/telephony/CallStateBroadcaster;)Lcom/android/internal/telephony/CallStateBroadcaster;

    .line 63
    :cond_f
    monitor-exit v1

    .line 64
    return-void

    .line 63
    :catchall_11
    move-exception v0

    monitor-exit v1
    :try_end_13
    .catchall {:try_start_3 .. :try_end_13} :catchall_11

    throw v0
.end method
