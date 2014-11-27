.class Lcom/android/internal/telephony/Am$InstrumentationWatcher;
.super Landroid/app/IInstrumentationWatcher$Stub;
.source "Am.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/Am;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InstrumentationWatcher"
.end annotation


# instance fields
.field private mFinished:Z

.field private mRawMode:Z

.field final synthetic this$0:Lcom/android/internal/telephony/Am;


# direct methods
.method private constructor <init>(Lcom/android/internal/telephony/Am;)V
    .registers 3
    .parameter

    .prologue
    const/4 v0, 0x0

    .line 1368
    iput-object p1, p0, Lcom/android/internal/telephony/Am$InstrumentationWatcher;->this$0:Lcom/android/internal/telephony/Am;

    invoke-direct {p0}, Landroid/app/IInstrumentationWatcher$Stub;-><init>()V

    .line 1369
    iput-boolean v0, p0, Lcom/android/internal/telephony/Am$InstrumentationWatcher;->mFinished:Z

    .line 1370
    iput-boolean v0, p0, Lcom/android/internal/telephony/Am$InstrumentationWatcher;->mRawMode:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/internal/telephony/Am;Lcom/android/internal/telephony/Am$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 1368
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/Am$InstrumentationWatcher;-><init>(Lcom/android/internal/telephony/Am;)V

    return-void
.end method


# virtual methods
.method public instrumentationFinished(Landroid/content/ComponentName;ILandroid/os/Bundle;)V
    .registers 10
    .parameter "name"
    .parameter "resultCode"
    .parameter "results"

    .prologue
    .line 1405
    monitor-enter p0

    .line 1407
    const/4 v2, 0x0

    .line 1408
    .local v2, pretty:Ljava/lang/String;
    :try_start_2
    iget-boolean v3, p0, Lcom/android/internal/telephony/Am$InstrumentationWatcher;->mRawMode:Z

    if-nez v3, :cond_e

    if-eqz p3, :cond_e

    .line 1409
    const-string v3, "stream"

    invoke-virtual {p3, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1411
    :cond_e
    if-eqz v2, :cond_1d

    .line 1412
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v3, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 1422
    :goto_15
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/android/internal/telephony/Am$InstrumentationWatcher;->mFinished:Z

    .line 1423
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 1424
    monitor-exit p0

    .line 1425
    return-void

    .line 1414
    :cond_1d
    if-eqz p3, :cond_5d

    .line 1415
    invoke-virtual {p3}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_27
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1416
    .local v1, key:Ljava/lang/String;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "INSTRUMENTATION_RESULT: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p3, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_27

    .line 1424
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #key:Ljava/lang/String;
    :catchall_5a
    move-exception v3

    monitor-exit p0
    :try_end_5c
    .catchall {:try_start_2 .. :try_end_5c} :catchall_5a

    throw v3

    .line 1420
    :cond_5d
    :try_start_5d
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "INSTRUMENTATION_CODE: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_75
    .catchall {:try_start_5d .. :try_end_75} :catchall_5a

    goto :goto_15
.end method

.method public instrumentationStatus(Landroid/content/ComponentName;ILandroid/os/Bundle;)V
    .registers 10
    .parameter "name"
    .parameter "resultCode"
    .parameter "results"

    .prologue
    .line 1382
    monitor-enter p0

    .line 1384
    const/4 v2, 0x0

    .line 1385
    .local v2, pretty:Ljava/lang/String;
    :try_start_2
    iget-boolean v3, p0, Lcom/android/internal/telephony/Am$InstrumentationWatcher;->mRawMode:Z

    if-nez v3, :cond_e

    if-eqz p3, :cond_e

    .line 1386
    const-string v3, "stream"

    invoke-virtual {p3, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 1388
    :cond_e
    if-eqz v2, :cond_1a

    .line 1389
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v3, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 1399
    :goto_15
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 1400
    monitor-exit p0

    .line 1401
    return-void

    .line 1391
    :cond_1a
    if-eqz p3, :cond_5a

    .line 1392
    invoke-virtual {p3}, Landroid/os/Bundle;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :goto_24
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1393
    .local v1, key:Ljava/lang/String;
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "INSTRUMENTATION_STATUS: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p3, v1}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_24

    .line 1400
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #key:Ljava/lang/String;
    :catchall_57
    move-exception v3

    monitor-exit p0
    :try_end_59
    .catchall {:try_start_2 .. :try_end_59} :catchall_57

    throw v3

    .line 1397
    :cond_5a
    :try_start_5a
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "INSTRUMENTATION_STATUS_CODE: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_72
    .catchall {:try_start_5a .. :try_end_72} :catchall_57

    goto :goto_15
.end method

.method public setRawOutput(Z)V
    .registers 2
    .parameter "rawMode"

    .prologue
    .line 1378
    iput-boolean p1, p0, Lcom/android/internal/telephony/Am$InstrumentationWatcher;->mRawMode:Z

    .line 1379
    return-void
.end method

.method public waitForFinish()Z
    .registers 4

    .prologue
    .line 1428
    monitor-enter p0

    .line 1429
    :goto_1
    :try_start_1
    iget-boolean v1, p0, Lcom/android/internal/telephony/Am$InstrumentationWatcher;->mFinished:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_25

    if-nez v1, :cond_28

    .line 1431
    :try_start_5
    iget-object v1, p0, Lcom/android/internal/telephony/Am$InstrumentationWatcher;->this$0:Lcom/android/internal/telephony/Am;

    #getter for: Lcom/android/internal/telephony/Am;->mAm:Landroid/app/IActivityManager;
    invoke-static {v1}, Lcom/android/internal/telephony/Am;->access$200(Lcom/android/internal/telephony/Am;)Landroid/app/IActivityManager;

    move-result-object v1

    invoke-interface {v1}, Landroid/app/IActivityManager;->asBinder()Landroid/os/IBinder;

    move-result-object v1

    invoke-interface {v1}, Landroid/os/IBinder;->pingBinder()Z
    :try_end_12
    .catchall {:try_start_5 .. :try_end_12} :catchall_25
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_12} :catch_1e

    move-result v1

    if-nez v1, :cond_18

    .line 1432
    const/4 v1, 0x0

    :try_start_16
    monitor-exit p0
    :try_end_17
    .catchall {:try_start_16 .. :try_end_17} :catchall_25

    .line 1440
    :goto_17
    return v1

    .line 1434
    :cond_18
    const-wide/16 v1, 0x3e8

    :try_start_1a
    invoke-virtual {p0, v1, v2}, Ljava/lang/Object;->wait(J)V
    :try_end_1d
    .catchall {:try_start_1a .. :try_end_1d} :catchall_25
    .catch Ljava/lang/InterruptedException; {:try_start_1a .. :try_end_1d} :catch_1e

    goto :goto_1

    .line 1435
    :catch_1e
    move-exception v0

    .line 1436
    .local v0, e:Ljava/lang/InterruptedException;
    :try_start_1f
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 1439
    .end local v0           #e:Ljava/lang/InterruptedException;
    :catchall_25
    move-exception v1

    monitor-exit p0
    :try_end_27
    .catchall {:try_start_1f .. :try_end_27} :catchall_25

    throw v1

    :cond_28
    :try_start_28
    monitor-exit p0
    :try_end_29
    .catchall {:try_start_28 .. :try_end_29} :catchall_25

    .line 1440
    const/4 v1, 0x1

    goto :goto_17
.end method
