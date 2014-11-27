.class Lcom/android/internal/telephony/test/SimulatedGsmCallState;
.super Landroid/os/Handler;
.source "SimulatedGsmCallState.java"


# static fields
.field static final CONNECTING_PAUSE_MSEC:I = 0x1f4

.field static final EVENT_PROGRESS_CALL_STATE:I = 0x1

.field static final MAX_CALLS:I = 0x7


# instance fields
.field private mAutoProgressConnecting:Z

.field mCalls:[Lcom/android/internal/telephony/test/CallInfo;

.field private mNextDialFailImmediately:Z


# direct methods
.method public constructor <init>(Landroid/os/Looper;)V
    .registers 3
    .parameter "looper"

    .prologue
    .line 155
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 135
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/android/internal/telephony/test/CallInfo;

    iput-object v0, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    .line 137
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mAutoProgressConnecting:Z

    .line 156
    return-void
.end method

.method private countActiveLines()I
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/test/InvalidStateEx;
        }
    .end annotation

    .prologue
    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 767
    const/4 v4, 0x0

    .line 768
    .local v4, hasMpty:Z
    const/4 v3, 0x0

    .line 769
    .local v3, hasHeld:Z
    const/4 v1, 0x0

    .line 770
    .local v1, hasActive:Z
    const/4 v2, 0x0

    .line 771
    .local v2, hasConnecting:Z
    const/4 v5, 0x0

    .line 772
    .local v5, hasRinging:Z
    const/4 v7, 0x0

    .line 774
    .local v7, mptyIsHeld:Z
    const/4 v6, 0x0

    .local v6, i:I
    :goto_9
    iget-object v11, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v11, v11

    if-ge v6, v11, :cond_7b

    .line 775
    iget-object v11, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v11, v6

    .line 777
    .local v0, call:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v0, :cond_3e

    .line 778
    if-nez v4, :cond_43

    iget-boolean v11, v0, Lcom/android/internal/telephony/test/CallInfo;->mIsMpty:Z

    if-eqz v11, :cond_43

    .line 779
    iget-object v11, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v12, Lcom/android/internal/telephony/test/CallInfo$State;->HOLDING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-ne v11, v12, :cond_41

    move v7, v9

    .line 792
    :cond_21
    :goto_21
    iget-boolean v11, v0, Lcom/android/internal/telephony/test/CallInfo;->mIsMpty:Z

    or-int/2addr v4, v11

    .line 793
    iget-object v11, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v12, Lcom/android/internal/telephony/test/CallInfo$State;->HOLDING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-ne v11, v12, :cond_77

    move v11, v9

    :goto_2b
    or-int/2addr v3, v11

    .line 794
    iget-object v11, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v12, Lcom/android/internal/telephony/test/CallInfo$State;->ACTIVE:Lcom/android/internal/telephony/test/CallInfo$State;

    if-ne v11, v12, :cond_79

    move v11, v9

    :goto_33
    or-int/2addr v1, v11

    .line 795
    invoke-virtual {v0}, Lcom/android/internal/telephony/test/CallInfo;->isConnecting()Z

    move-result v11

    or-int/2addr v2, v11

    .line 796
    invoke-virtual {v0}, Lcom/android/internal/telephony/test/CallInfo;->isRinging()Z

    move-result v11

    or-int/2addr v5, v11

    .line 774
    :cond_3e
    add-int/lit8 v6, v6, 0x1

    goto :goto_9

    :cond_41
    move v7, v10

    .line 779
    goto :goto_21

    .line 780
    :cond_43
    iget-boolean v11, v0, Lcom/android/internal/telephony/test/CallInfo;->mIsMpty:Z

    if-eqz v11, :cond_5c

    if-eqz v7, :cond_5c

    iget-object v11, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v12, Lcom/android/internal/telephony/test/CallInfo$State;->ACTIVE:Lcom/android/internal/telephony/test/CallInfo$State;

    if-ne v11, v12, :cond_5c

    .line 783
    const-string v9, "ModelInterpreter"

    const-string v10, "Invalid state"

    invoke-static {v9, v10}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 784
    new-instance v9, Lcom/android/internal/telephony/test/InvalidStateEx;

    invoke-direct {v9}, Lcom/android/internal/telephony/test/InvalidStateEx;-><init>()V

    throw v9

    .line 785
    :cond_5c
    iget-boolean v11, v0, Lcom/android/internal/telephony/test/CallInfo;->mIsMpty:Z

    if-nez v11, :cond_21

    if-eqz v4, :cond_21

    if-eqz v7, :cond_21

    iget-object v11, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v12, Lcom/android/internal/telephony/test/CallInfo$State;->HOLDING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-ne v11, v12, :cond_21

    .line 788
    const-string v9, "ModelInterpreter"

    const-string v10, "Invalid state"

    invoke-static {v9, v10}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 789
    new-instance v9, Lcom/android/internal/telephony/test/InvalidStateEx;

    invoke-direct {v9}, Lcom/android/internal/telephony/test/InvalidStateEx;-><init>()V

    throw v9

    :cond_77
    move v11, v10

    .line 793
    goto :goto_2b

    :cond_79
    move v11, v10

    .line 794
    goto :goto_33

    .line 800
    .end local v0           #call:Lcom/android/internal/telephony/test/CallInfo;
    :cond_7b
    const/4 v8, 0x0

    .line 802
    .local v8, ret:I
    if-eqz v3, :cond_80

    add-int/lit8 v8, v8, 0x1

    .line 803
    :cond_80
    if-eqz v1, :cond_84

    add-int/lit8 v8, v8, 0x1

    .line 804
    :cond_84
    if-eqz v2, :cond_88

    add-int/lit8 v8, v8, 0x1

    .line 805
    :cond_88
    if-eqz v5, :cond_8c

    add-int/lit8 v8, v8, 0x1

    .line 807
    :cond_8c
    return v8
.end method


# virtual methods
.method public conference()Z
    .registers 6

    .prologue
    const/4 v3, 0x1

    .line 608
    const/4 v1, 0x0

    .line 611
    .local v1, countCalls:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_3
    iget-object v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v4, v4

    if-ge v2, v4, :cond_1b

    .line 612
    iget-object v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v4, v2

    .line 614
    .local v0, c:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v0, :cond_18

    .line 615
    add-int/lit8 v1, v1, 0x1

    .line 617
    invoke-virtual {v0}, Lcom/android/internal/telephony/test/CallInfo;->isConnecting()Z

    move-result v4

    if-eqz v4, :cond_18

    .line 618
    const/4 v3, 0x0

    .line 633
    .end local v0           #c:Lcom/android/internal/telephony/test/CallInfo;
    :cond_17
    return v3

    .line 611
    .restart local v0       #c:Lcom/android/internal/telephony/test/CallInfo;
    :cond_18
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 622
    .end local v0           #c:Lcom/android/internal/telephony/test/CallInfo;
    :cond_1b
    const/4 v2, 0x0

    :goto_1c
    iget-object v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v4, v4

    if-ge v2, v4, :cond_17

    .line 623
    iget-object v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v4, v2

    .line 625
    .restart local v0       #c:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v0, :cond_2f

    .line 626
    sget-object v4, Lcom/android/internal/telephony/test/CallInfo$State;->ACTIVE:Lcom/android/internal/telephony/test/CallInfo$State;

    iput-object v4, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    .line 627
    if-lez v1, :cond_2f

    .line 628
    iput-boolean v3, v0, Lcom/android/internal/telephony/test/CallInfo;->mIsMpty:Z

    .line 622
    :cond_2f
    add-int/lit8 v2, v2, 0x1

    goto :goto_1c
.end method

.method public explicitCallTransfer()Z
    .registers 5

    .prologue
    .line 638
    const/4 v1, 0x0

    .line 641
    .local v1, countCalls:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_2
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v3, v3

    if-ge v2, v3, :cond_1a

    .line 642
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v3, v2

    .line 644
    .local v0, c:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v0, :cond_17

    .line 645
    add-int/lit8 v1, v1, 0x1

    .line 647
    invoke-virtual {v0}, Lcom/android/internal/telephony/test/CallInfo;->isConnecting()Z

    move-result v3

    if-eqz v3, :cond_17

    .line 648
    const/4 v3, 0x0

    .line 654
    .end local v0           #c:Lcom/android/internal/telephony/test/CallInfo;
    :goto_16
    return v3

    .line 641
    .restart local v0       #c:Lcom/android/internal/telephony/test/CallInfo;
    :cond_17
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 654
    .end local v0           #c:Lcom/android/internal/telephony/test/CallInfo;
    :cond_1a
    invoke-virtual {p0}, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->triggerHangupAll()Z

    move-result v3

    goto :goto_16
.end method

.method public getClccLines()Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 752
    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v3, v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 754
    .local v2, ret:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .local v1, i:I
    :goto_9
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v3, v3

    if-ge v1, v3, :cond_20

    .line 755
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v3, v1

    .line 757
    .local v0, c:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v0, :cond_1d

    .line 758
    add-int/lit8 v3, v1, 0x1

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/test/CallInfo;->toCLCCLine(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 754
    :cond_1d
    add-int/lit8 v1, v1, 0x1

    goto :goto_9

    .line 762
    .end local v0           #c:Lcom/android/internal/telephony/test/CallInfo;
    :cond_20
    return-object v2
.end method

.method public getDriverCalls()Ljava/util/List;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/telephony/DriverCall;",
            ">;"
        }
    .end annotation

    .prologue
    .line 732
    new-instance v3, Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v4, v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 734
    .local v3, ret:Ljava/util/ArrayList;,"Ljava/util/ArrayList<Lcom/android/internal/telephony/DriverCall;>;"
    const/4 v2, 0x0

    .local v2, i:I
    :goto_9
    iget-object v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v4, v4

    if-ge v2, v4, :cond_20

    .line 735
    iget-object v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v4, v2

    .line 737
    .local v0, c:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v0, :cond_1d

    .line 740
    add-int/lit8 v4, v2, 0x1

    invoke-virtual {v0, v4}, Lcom/android/internal/telephony/test/CallInfo;->toDriverCall(I)Lcom/android/internal/telephony/DriverCall;

    move-result-object v1

    .line 741
    .local v1, dc:Lcom/android/internal/telephony/DriverCall;
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 734
    .end local v1           #dc:Lcom/android/internal/telephony/DriverCall;
    :cond_1d
    add-int/lit8 v2, v2, 0x1

    goto :goto_9

    .line 745
    .end local v0           #c:Lcom/android/internal/telephony/test/CallInfo;
    :cond_20
    const-string v4, "GSM"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SC< getDriverCalls "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 747
    return-object v3
.end method

.method public handleMessage(Landroid/os/Message;)V
    .registers 3
    .parameter "msg"

    .prologue
    .line 161
    monitor-enter p0

    :try_start_1
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_10

    .line 168
    :goto_6
    monitor-exit p0

    .line 169
    return-void

    .line 166
    :pswitch_8
    invoke-virtual {p0}, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->progressConnectingCallState()V

    goto :goto_6

    .line 168
    :catchall_c
    move-exception v0

    monitor-exit p0
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_c

    throw v0

    .line 161
    nop

    :pswitch_data_10
    .packed-switch 0x1
        :pswitch_8
    .end packed-switch
.end method

.method public onAnswer()Z
    .registers 5

    .prologue
    .line 359
    monitor-enter p0

    .line 360
    const/4 v1, 0x0

    .local v1, i:I
    :goto_2
    :try_start_2
    iget-object v2, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v2, v2

    if-ge v1, v2, :cond_22

    .line 361
    iget-object v2, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v2, v1

    .line 363
    .local v0, call:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v0, :cond_1f

    iget-object v2, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v3, Lcom/android/internal/telephony/test/CallInfo$State;->INCOMING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-eq v2, v3, :cond_19

    iget-object v2, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v3, Lcom/android/internal/telephony/test/CallInfo$State;->WAITING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-ne v2, v3, :cond_1f

    .line 367
    :cond_19
    invoke-virtual {p0}, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->switchActiveAndHeldOrWaiting()Z

    move-result v2

    monitor-exit p0

    .line 372
    .end local v0           #call:Lcom/android/internal/telephony/test/CallInfo;
    :goto_1e
    return v2

    .line 360
    .restart local v0       #call:Lcom/android/internal/telephony/test/CallInfo;
    :cond_1f
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 370
    .end local v0           #call:Lcom/android/internal/telephony/test/CallInfo;
    :cond_22
    monitor-exit p0

    .line 372
    const/4 v2, 0x0

    goto :goto_1e

    .line 370
    :catchall_25
    move-exception v2

    monitor-exit p0
    :try_end_27
    .catchall {:try_start_2 .. :try_end_27} :catchall_25

    throw v2
.end method

.method public onChld(CC)Z
    .registers 7
    .parameter "c0"
    .parameter "c1"

    .prologue
    .line 394
    const/4 v0, 0x0

    .line 396
    .local v0, callIndex:I
    if-eqz p2, :cond_e

    .line 397
    add-int/lit8 v0, p2, -0x31

    .line 399
    if-ltz v0, :cond_c

    iget-object v2, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v2, v2

    if-lt v0, v2, :cond_e

    .line 400
    :cond_c
    const/4 v1, 0x0

    .line 444
    :goto_d
    return v1

    .line 404
    :cond_e
    packed-switch p1, :pswitch_data_46

    .line 440
    const/4 v1, 0x0

    .local v1, ret:Z
    goto :goto_d

    .line 406
    .end local v1           #ret:Z
    :pswitch_13
    invoke-virtual {p0}, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->releaseHeldOrUDUB()Z

    move-result v1

    .line 407
    .restart local v1       #ret:Z
    goto :goto_d

    .line 409
    .end local v1           #ret:Z
    :pswitch_18
    if-gtz p2, :cond_1f

    .line 410
    invoke-virtual {p0}, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->releaseActiveAcceptHeldOrWaiting()Z

    move-result v1

    .restart local v1       #ret:Z
    goto :goto_d

    .line 412
    .end local v1           #ret:Z
    :cond_1f
    iget-object v2, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v2, v2, v0

    if-nez v2, :cond_27

    .line 413
    const/4 v1, 0x0

    .restart local v1       #ret:Z
    goto :goto_d

    .line 415
    .end local v1           #ret:Z
    :cond_27
    iget-object v2, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    const/4 v3, 0x0

    aput-object v3, v2, v0

    .line 416
    const/4 v1, 0x1

    .line 419
    .restart local v1       #ret:Z
    goto :goto_d

    .line 421
    .end local v1           #ret:Z
    :pswitch_2e
    if-gtz p2, :cond_35

    .line 422
    invoke-virtual {p0}, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->switchActiveAndHeldOrWaiting()Z

    move-result v1

    .restart local v1       #ret:Z
    goto :goto_d

    .line 424
    .end local v1           #ret:Z
    :cond_35
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->separateCall(I)Z

    move-result v1

    .line 426
    .restart local v1       #ret:Z
    goto :goto_d

    .line 428
    .end local v1           #ret:Z
    :pswitch_3a
    invoke-virtual {p0}, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->conference()Z

    move-result v1

    .line 429
    .restart local v1       #ret:Z
    goto :goto_d

    .line 431
    .end local v1           #ret:Z
    :pswitch_3f
    invoke-virtual {p0}, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->explicitCallTransfer()Z

    move-result v1

    .line 432
    .restart local v1       #ret:Z
    goto :goto_d

    .line 436
    .end local v1           #ret:Z
    :pswitch_44
    const/4 v1, 0x0

    .line 438
    .restart local v1       #ret:Z
    goto :goto_d

    .line 404
    :pswitch_data_46
    .packed-switch 0x30
        :pswitch_13
        :pswitch_18
        :pswitch_2e
        :pswitch_3a
        :pswitch_3f
        :pswitch_44
    .end packed-switch
.end method

.method public onDial(Ljava/lang/String;)Z
    .registers 11
    .parameter "address"

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 660
    const/4 v1, -0x1

    .line 662
    .local v1, freeSlot:I
    const-string v6, "GSM"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "SC> dial \'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "\'"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 664
    iget-boolean v6, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mNextDialFailImmediately:Z

    if-eqz v6, :cond_2f

    .line 665
    iput-boolean v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mNextDialFailImmediately:Z

    .line 667
    const-string v5, "GSM"

    const-string v6, "SC< dial fail (per request)"

    invoke-static {v5, v6}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 727
    :goto_2e
    return v4

    .line 671
    :cond_2f
    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->extractNetworkPortion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 673
    .local v3, phNum:Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_41

    .line 674
    const-string v5, "GSM"

    const-string v6, "SC< dial fail (invalid ph num)"

    invoke-static {v5, v6}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2e

    .line 679
    :cond_41
    const-string v6, "*99"

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5a

    const-string v6, "#"

    invoke-virtual {v3, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5a

    .line 680
    const-string v4, "GSM"

    const-string v6, "SC< dial ignored (gprs)"

    invoke-static {v4, v6}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v4, v5

    .line 681
    goto :goto_2e

    .line 687
    :cond_5a
    :try_start_5a
    invoke-direct {p0}, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->countActiveLines()I

    move-result v6

    if-le v6, v5, :cond_71

    .line 688
    const-string v5, "GSM"

    const-string v6, "SC< dial fail (invalid call state)"

    invoke-static {v5, v6}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_67
    .catch Lcom/android/internal/telephony/test/InvalidStateEx; {:try_start_5a .. :try_end_67} :catch_68

    goto :goto_2e

    .line 691
    :catch_68
    move-exception v0

    .line 692
    .local v0, ex:Lcom/android/internal/telephony/test/InvalidStateEx;
    const-string v5, "GSM"

    const-string v6, "SC< dial fail (invalid call state)"

    invoke-static {v5, v6}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2e

    .line 696
    .end local v0           #ex:Lcom/android/internal/telephony/test/InvalidStateEx;
    :cond_71
    const/4 v2, 0x0

    .local v2, i:I
    :goto_72
    iget-object v6, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v6, v6

    if-ge v2, v6, :cond_b3

    .line 697
    if-gez v1, :cond_80

    iget-object v6, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v6, v6, v2

    if-nez v6, :cond_80

    .line 698
    move v1, v2

    .line 701
    :cond_80
    iget-object v6, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v6, v6, v2

    if-eqz v6, :cond_98

    iget-object v6, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v6, v6, v2

    invoke-virtual {v6}, Lcom/android/internal/telephony/test/CallInfo;->isActiveOrHeld()Z

    move-result v6

    if-nez v6, :cond_98

    .line 704
    const-string v5, "GSM"

    const-string v6, "SC< dial fail (invalid call state)"

    invoke-static {v5, v6}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2e

    .line 706
    :cond_98
    iget-object v6, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v6, v6, v2

    if-eqz v6, :cond_b0

    iget-object v6, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v6, v6, v2

    iget-object v6, v6, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v7, Lcom/android/internal/telephony/test/CallInfo$State;->ACTIVE:Lcom/android/internal/telephony/test/CallInfo$State;

    if-ne v6, v7, :cond_b0

    .line 708
    iget-object v6, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v6, v6, v2

    sget-object v7, Lcom/android/internal/telephony/test/CallInfo$State;->HOLDING:Lcom/android/internal/telephony/test/CallInfo$State;

    iput-object v7, v6, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    .line 696
    :cond_b0
    add-int/lit8 v2, v2, 0x1

    goto :goto_72

    .line 712
    :cond_b3
    if-gez v1, :cond_be

    .line 713
    const-string v5, "GSM"

    const-string v6, "SC< dial fail (invalid call state)"

    invoke-static {v5, v6}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2e

    .line 717
    :cond_be
    iget-object v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    invoke-static {v3}, Lcom/android/internal/telephony/test/CallInfo;->createOutgoingCall(Ljava/lang/String;)Lcom/android/internal/telephony/test/CallInfo;

    move-result-object v6

    aput-object v6, v4, v1

    .line 719
    iget-boolean v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mAutoProgressConnecting:Z

    if-eqz v4, :cond_d7

    .line 720
    iget-object v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v4, v4, v1

    invoke-virtual {p0, v5, v4}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v4

    const-wide/16 v6, 0x1f4

    invoke-virtual {p0, v4, v6, v7}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 725
    :cond_d7
    const-string v4, "GSM"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "SC< dial (slot = "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    move v4, v5

    .line 727
    goto/16 :goto_2e
.end method

.method public onHangup()Z
    .registers 6

    .prologue
    .line 377
    const/4 v1, 0x0

    .line 379
    .local v1, found:Z
    const/4 v2, 0x0

    .local v2, i:I
    :goto_2
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v3, v3

    if-ge v2, v3, :cond_1c

    .line 380
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v3, v2

    .line 382
    .local v0, call:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v0, :cond_19

    iget-object v3, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v4, Lcom/android/internal/telephony/test/CallInfo$State;->WAITING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-eq v3, v4, :cond_19

    .line 383
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    const/4 v4, 0x0

    aput-object v4, v3, v2

    .line 384
    const/4 v1, 0x1

    .line 379
    :cond_19
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 388
    .end local v0           #call:Lcom/android/internal/telephony/test/CallInfo;
    :cond_1c
    return v1
.end method

.method public progressConnectingCallState()V
    .registers 6

    .prologue
    .line 220
    monitor-enter p0

    .line 221
    const/4 v1, 0x0

    .local v1, i:I
    :goto_2
    :try_start_2
    iget-object v2, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v2, v2

    if-ge v1, v2, :cond_25

    .line 222
    iget-object v2, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v2, v1

    .line 224
    .local v0, call:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v0, :cond_27

    iget-object v2, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v3, Lcom/android/internal/telephony/test/CallInfo$State;->DIALING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-ne v2, v3, :cond_27

    .line 225
    sget-object v2, Lcom/android/internal/telephony/test/CallInfo$State;->ALERTING:Lcom/android/internal/telephony/test/CallInfo$State;

    iput-object v2, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    .line 227
    iget-boolean v2, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mAutoProgressConnecting:Z

    if-eqz v2, :cond_25

    .line 228
    const/4 v2, 0x1

    invoke-virtual {p0, v2, v0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    const-wide/16 v3, 0x1f4

    invoke-virtual {p0, v2, v3, v4}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 240
    .end local v0           #call:Lcom/android/internal/telephony/test/CallInfo;
    :cond_25
    :goto_25
    monitor-exit p0

    .line 241
    return-void

    .line 233
    .restart local v0       #call:Lcom/android/internal/telephony/test/CallInfo;
    :cond_27
    if-eqz v0, :cond_37

    iget-object v2, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v3, Lcom/android/internal/telephony/test/CallInfo$State;->ALERTING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-ne v2, v3, :cond_37

    .line 236
    sget-object v2, Lcom/android/internal/telephony/test/CallInfo$State;->ACTIVE:Lcom/android/internal/telephony/test/CallInfo$State;

    iput-object v2, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    goto :goto_25

    .line 240
    .end local v0           #call:Lcom/android/internal/telephony/test/CallInfo;
    :catchall_34
    move-exception v2

    monitor-exit p0
    :try_end_36
    .catchall {:try_start_2 .. :try_end_36} :catchall_34

    throw v2

    .line 221
    .restart local v0       #call:Lcom/android/internal/telephony/test/CallInfo;
    :cond_37
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method public progressConnectingToActive()V
    .registers 5

    .prologue
    .line 246
    monitor-enter p0

    .line 247
    const/4 v1, 0x0

    .local v1, i:I
    :goto_2
    :try_start_2
    iget-object v2, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v2, v2

    if-ge v1, v2, :cond_1d

    .line 248
    iget-object v2, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v2, v1

    .line 250
    .local v0, call:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v0, :cond_1f

    iget-object v2, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v3, Lcom/android/internal/telephony/test/CallInfo$State;->DIALING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-eq v2, v3, :cond_19

    iget-object v2, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v3, Lcom/android/internal/telephony/test/CallInfo$State;->ALERTING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-ne v2, v3, :cond_1f

    .line 253
    :cond_19
    sget-object v2, Lcom/android/internal/telephony/test/CallInfo$State;->ACTIVE:Lcom/android/internal/telephony/test/CallInfo$State;

    iput-object v2, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    .line 257
    .end local v0           #call:Lcom/android/internal/telephony/test/CallInfo;
    :cond_1d
    monitor-exit p0

    .line 258
    return-void

    .line 247
    .restart local v0       #call:Lcom/android/internal/telephony/test/CallInfo;
    :cond_1f
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 257
    .end local v0           #call:Lcom/android/internal/telephony/test/CallInfo;
    :catchall_22
    move-exception v2

    monitor-exit p0
    :try_end_24
    .catchall {:try_start_2 .. :try_end_24} :catchall_22

    throw v2
.end method

.method public releaseActiveAcceptHeldOrWaiting()Z
    .registers 9

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 479
    const/4 v2, 0x0

    .line 480
    .local v2, foundHeld:Z
    const/4 v1, 0x0

    .line 482
    .local v1, foundActive:Z
    const/4 v3, 0x0

    .local v3, i:I
    :goto_5
    iget-object v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v4, v4

    if-ge v3, v4, :cond_1e

    .line 483
    iget-object v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v4, v3

    .line 485
    .local v0, c:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v0, :cond_1b

    iget-object v4, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v5, Lcom/android/internal/telephony/test/CallInfo$State;->ACTIVE:Lcom/android/internal/telephony/test/CallInfo$State;

    if-ne v4, v5, :cond_1b

    .line 486
    iget-object v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aput-object v7, v4, v3

    .line 487
    const/4 v1, 0x1

    .line 482
    :cond_1b
    add-int/lit8 v3, v3, 0x1

    goto :goto_5

    .line 491
    .end local v0           #c:Lcom/android/internal/telephony/test/CallInfo;
    :cond_1e
    if-nez v1, :cond_40

    .line 494
    const/4 v3, 0x0

    :goto_21
    iget-object v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v4, v4

    if-ge v3, v4, :cond_40

    .line 495
    iget-object v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v4, v3

    .line 497
    .restart local v0       #c:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v0, :cond_3d

    iget-object v4, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v5, Lcom/android/internal/telephony/test/CallInfo$State;->DIALING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-eq v4, v5, :cond_38

    iget-object v4, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v5, Lcom/android/internal/telephony/test/CallInfo$State;->ALERTING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-ne v4, v5, :cond_3d

    .line 501
    :cond_38
    iget-object v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aput-object v7, v4, v3

    .line 502
    const/4 v1, 0x1

    .line 494
    :cond_3d
    add-int/lit8 v3, v3, 0x1

    goto :goto_21

    .line 507
    .end local v0           #c:Lcom/android/internal/telephony/test/CallInfo;
    :cond_40
    const/4 v3, 0x0

    :goto_41
    iget-object v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v4, v4

    if-ge v3, v4, :cond_5a

    .line 508
    iget-object v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v4, v3

    .line 510
    .restart local v0       #c:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v0, :cond_57

    iget-object v4, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v5, Lcom/android/internal/telephony/test/CallInfo$State;->HOLDING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-ne v4, v5, :cond_57

    .line 511
    sget-object v4, Lcom/android/internal/telephony/test/CallInfo$State;->ACTIVE:Lcom/android/internal/telephony/test/CallInfo$State;

    iput-object v4, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    .line 512
    const/4 v2, 0x1

    .line 507
    :cond_57
    add-int/lit8 v3, v3, 0x1

    goto :goto_41

    .line 516
    .end local v0           #c:Lcom/android/internal/telephony/test/CallInfo;
    :cond_5a
    if-eqz v2, :cond_5d

    .line 529
    :cond_5c
    :goto_5c
    return v6

    .line 520
    :cond_5d
    const/4 v3, 0x0

    :goto_5e
    iget-object v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v4, v4

    if-ge v3, v4, :cond_5c

    .line 521
    iget-object v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v4, v3

    .line 523
    .restart local v0       #c:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v0, :cond_74

    invoke-virtual {v0}, Lcom/android/internal/telephony/test/CallInfo;->isRinging()Z

    move-result v4

    if-eqz v4, :cond_74

    .line 524
    sget-object v4, Lcom/android/internal/telephony/test/CallInfo$State;->ACTIVE:Lcom/android/internal/telephony/test/CallInfo$State;

    iput-object v4, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    goto :goto_5c

    .line 520
    :cond_74
    add-int/lit8 v3, v3, 0x1

    goto :goto_5e
.end method

.method public releaseHeldOrUDUB()Z
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 449
    const/4 v1, 0x0

    .line 451
    .local v1, found:Z
    const/4 v2, 0x0

    .local v2, i:I
    :goto_3
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v3, v3

    if-ge v2, v3, :cond_19

    .line 452
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v3, v2

    .line 454
    .local v0, c:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v0, :cond_35

    invoke-virtual {v0}, Lcom/android/internal/telephony/test/CallInfo;->isRinging()Z

    move-result v3

    if-eqz v3, :cond_35

    .line 455
    const/4 v1, 0x1

    .line 456
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aput-object v5, v3, v2

    .line 461
    .end local v0           #c:Lcom/android/internal/telephony/test/CallInfo;
    :cond_19
    if-nez v1, :cond_38

    .line 462
    const/4 v2, 0x0

    :goto_1c
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v3, v3

    if-ge v2, v3, :cond_38

    .line 463
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v3, v2

    .line 465
    .restart local v0       #c:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v0, :cond_32

    iget-object v3, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v4, Lcom/android/internal/telephony/test/CallInfo$State;->HOLDING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-ne v3, v4, :cond_32

    .line 466
    const/4 v1, 0x1

    .line 467
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aput-object v5, v3, v2

    .line 462
    :cond_32
    add-int/lit8 v2, v2, 0x1

    goto :goto_1c

    .line 451
    :cond_35
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 473
    .end local v0           #c:Lcom/android/internal/telephony/test/CallInfo;
    :cond_38
    const/4 v3, 0x1

    return v3
.end method

.method public separateCall(I)Z
    .registers 12
    .parameter "index"

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 570
    :try_start_2
    iget-object v8, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v8, p1

    .line 572
    .local v0, c:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v0, :cond_14

    invoke-virtual {v0}, Lcom/android/internal/telephony/test/CallInfo;->isConnecting()Z

    move-result v8

    if-nez v8, :cond_14

    invoke-direct {p0}, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->countActiveLines()I

    move-result v8

    if-eq v8, v6, :cond_16

    :cond_14
    move v6, v7

    .line 600
    .end local v0           #c:Lcom/android/internal/telephony/test/CallInfo;
    :cond_15
    :goto_15
    return v6

    .line 576
    .restart local v0       #c:Lcom/android/internal/telephony/test/CallInfo;
    :cond_16
    sget-object v8, Lcom/android/internal/telephony/test/CallInfo$State;->ACTIVE:Lcom/android/internal/telephony/test/CallInfo$State;

    iput-object v8, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    .line 577
    const/4 v8, 0x0

    iput-boolean v8, v0, Lcom/android/internal/telephony/test/CallInfo;->mIsMpty:Z

    .line 579
    const/4 v4, 0x0

    .local v4, i:I
    :goto_1e
    iget-object v8, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v8, v8

    if-ge v4, v8, :cond_15

    .line 580
    const/4 v2, 0x0

    .local v2, countHeld:I
    const/4 v5, 0x0

    .line 582
    .local v5, lastHeld:I
    if-eq v4, p1, :cond_3a

    .line 583
    iget-object v8, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v1, v8, v4

    .line 585
    .local v1, cb:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v1, :cond_3a

    iget-object v8, v1, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v9, Lcom/android/internal/telephony/test/CallInfo$State;->ACTIVE:Lcom/android/internal/telephony/test/CallInfo$State;

    if-ne v8, v9, :cond_3a

    .line 586
    sget-object v8, Lcom/android/internal/telephony/test/CallInfo$State;->HOLDING:Lcom/android/internal/telephony/test/CallInfo$State;

    iput-object v8, v1, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    .line 587
    add-int/lit8 v2, v2, 0x1

    .line 588
    move v5, v4

    .line 592
    .end local v1           #cb:Lcom/android/internal/telephony/test/CallInfo;
    :cond_3a
    if-ne v2, v6, :cond_43

    .line 594
    iget-object v8, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v8, v8, v5

    const/4 v9, 0x0

    iput-boolean v9, v8, Lcom/android/internal/telephony/test/CallInfo;->mIsMpty:Z
    :try_end_43
    .catch Lcom/android/internal/telephony/test/InvalidStateEx; {:try_start_2 .. :try_end_43} :catch_46

    .line 579
    :cond_43
    add-int/lit8 v4, v4, 0x1

    goto :goto_1e

    .line 599
    .end local v0           #c:Lcom/android/internal/telephony/test/CallInfo;
    .end local v2           #countHeld:I
    .end local v4           #i:I
    .end local v5           #lastHeld:I
    :catch_46
    move-exception v3

    .local v3, ex:Lcom/android/internal/telephony/test/InvalidStateEx;
    move v6, v7

    .line 600
    goto :goto_15
.end method

.method public setAutoProgressConnectingCall(Z)V
    .registers 2
    .parameter "b"

    .prologue
    .line 265
    iput-boolean p1, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mAutoProgressConnecting:Z

    .line 266
    return-void
.end method

.method public setNextDialFailImmediately(Z)V
    .registers 2
    .parameter "b"

    .prologue
    .line 270
    iput-boolean p1, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mNextDialFailImmediately:Z

    .line 271
    return-void
.end method

.method public switchActiveAndHeldOrWaiting()Z
    .registers 6

    .prologue
    .line 534
    const/4 v1, 0x0

    .line 537
    .local v1, hasHeld:Z
    const/4 v2, 0x0

    .local v2, i:I
    :goto_2
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v3, v3

    if-ge v2, v3, :cond_14

    .line 538
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v3, v2

    .line 540
    .local v0, c:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v0, :cond_2d

    iget-object v3, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v4, Lcom/android/internal/telephony/test/CallInfo$State;->HOLDING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-ne v3, v4, :cond_2d

    .line 541
    const/4 v1, 0x1

    .line 547
    .end local v0           #c:Lcom/android/internal/telephony/test/CallInfo;
    :cond_14
    const/4 v2, 0x0

    :goto_15
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v3, v3

    if-ge v2, v3, :cond_48

    .line 548
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v3, v2

    .line 550
    .restart local v0       #c:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v0, :cond_2a

    .line 551
    iget-object v3, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v4, Lcom/android/internal/telephony/test/CallInfo$State;->ACTIVE:Lcom/android/internal/telephony/test/CallInfo$State;

    if-ne v3, v4, :cond_30

    .line 552
    sget-object v3, Lcom/android/internal/telephony/test/CallInfo$State;->HOLDING:Lcom/android/internal/telephony/test/CallInfo$State;

    iput-object v3, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    .line 547
    :cond_2a
    :goto_2a
    add-int/lit8 v2, v2, 0x1

    goto :goto_15

    .line 537
    :cond_2d
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 553
    :cond_30
    iget-object v3, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v4, Lcom/android/internal/telephony/test/CallInfo$State;->HOLDING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-ne v3, v4, :cond_3b

    .line 554
    sget-object v3, Lcom/android/internal/telephony/test/CallInfo$State;->ACTIVE:Lcom/android/internal/telephony/test/CallInfo$State;

    iput-object v3, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    goto :goto_2a

    .line 555
    :cond_3b
    if-nez v1, :cond_2a

    invoke-virtual {v0}, Lcom/android/internal/telephony/test/CallInfo;->isRinging()Z

    move-result v3

    if-eqz v3, :cond_2a

    .line 556
    sget-object v3, Lcom/android/internal/telephony/test/CallInfo$State;->ACTIVE:Lcom/android/internal/telephony/test/CallInfo$State;

    iput-object v3, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    goto :goto_2a

    .line 561
    .end local v0           #c:Lcom/android/internal/telephony/test/CallInfo;
    :cond_48
    const/4 v3, 0x1

    return v3
.end method

.method public triggerHangupAll()Z
    .registers 6

    .prologue
    .line 340
    monitor-enter p0

    .line 341
    const/4 v1, 0x0

    .line 343
    .local v1, found:Z
    const/4 v2, 0x0

    .local v2, i:I
    :goto_3
    :try_start_3
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v3, v3

    if-ge v2, v3, :cond_1b

    .line 344
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v3, v2

    .line 346
    .local v0, call:Lcom/android/internal/telephony/test/CallInfo;
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v3, v3, v2

    if-eqz v3, :cond_13

    .line 347
    const/4 v1, 0x1

    .line 350
    :cond_13
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    const/4 v4, 0x0

    aput-object v4, v3, v2

    .line 343
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 353
    .end local v0           #call:Lcom/android/internal/telephony/test/CallInfo;
    :cond_1b
    monitor-exit p0

    return v1

    .line 354
    :catchall_1d
    move-exception v3

    monitor-exit p0
    :try_end_1f
    .catchall {:try_start_3 .. :try_end_1f} :catchall_1d

    throw v3
.end method

.method public triggerHangupBackground()Z
    .registers 6

    .prologue
    .line 318
    monitor-enter p0

    .line 319
    const/4 v1, 0x0

    .line 321
    .local v1, found:Z
    const/4 v2, 0x0

    .local v2, i:I
    :goto_3
    :try_start_3
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v3, v3

    if-ge v2, v3, :cond_1d

    .line 322
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v3, v2

    .line 324
    .local v0, call:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v0, :cond_1a

    iget-object v3, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v4, Lcom/android/internal/telephony/test/CallInfo$State;->HOLDING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-ne v3, v4, :cond_1a

    .line 325
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    const/4 v4, 0x0

    aput-object v4, v3, v2

    .line 326
    const/4 v1, 0x1

    .line 321
    :cond_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 330
    .end local v0           #call:Lcom/android/internal/telephony/test/CallInfo;
    :cond_1d
    monitor-exit p0

    return v1

    .line 331
    :catchall_1f
    move-exception v3

    monitor-exit p0
    :try_end_21
    .catchall {:try_start_3 .. :try_end_21} :catchall_1f

    throw v3
.end method

.method public triggerHangupForeground()Z
    .registers 6

    .prologue
    .line 279
    monitor-enter p0

    .line 282
    const/4 v1, 0x0

    .line 284
    .local v1, found:Z
    const/4 v2, 0x0

    .local v2, i:I
    :goto_3
    :try_start_3
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v3, v3

    if-ge v2, v3, :cond_23

    .line 285
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v3, v2

    .line 287
    .local v0, call:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v0, :cond_20

    iget-object v3, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v4, Lcom/android/internal/telephony/test/CallInfo$State;->INCOMING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-eq v3, v4, :cond_1a

    iget-object v3, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v4, Lcom/android/internal/telephony/test/CallInfo$State;->WAITING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-ne v3, v4, :cond_20

    .line 291
    :cond_1a
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    const/4 v4, 0x0

    aput-object v4, v3, v2

    .line 292
    const/4 v1, 0x1

    .line 284
    :cond_20
    add-int/lit8 v2, v2, 0x1

    goto :goto_3

    .line 296
    .end local v0           #call:Lcom/android/internal/telephony/test/CallInfo;
    :cond_23
    const/4 v2, 0x0

    :goto_24
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v3, v3

    if-ge v2, v3, :cond_4a

    .line 297
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v3, v2

    .line 299
    .restart local v0       #call:Lcom/android/internal/telephony/test/CallInfo;
    if-eqz v0, :cond_47

    iget-object v3, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v4, Lcom/android/internal/telephony/test/CallInfo$State;->DIALING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-eq v3, v4, :cond_41

    iget-object v3, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v4, Lcom/android/internal/telephony/test/CallInfo$State;->ACTIVE:Lcom/android/internal/telephony/test/CallInfo$State;

    if-eq v3, v4, :cond_41

    iget-object v3, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v4, Lcom/android/internal/telephony/test/CallInfo$State;->ALERTING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-ne v3, v4, :cond_47

    .line 304
    :cond_41
    iget-object v3, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    const/4 v4, 0x0

    aput-object v4, v3, v2

    .line 305
    const/4 v1, 0x1

    .line 296
    :cond_47
    add-int/lit8 v2, v2, 0x1

    goto :goto_24

    .line 308
    .end local v0           #call:Lcom/android/internal/telephony/test/CallInfo;
    :cond_4a
    monitor-exit p0

    return v1

    .line 309
    :catchall_4c
    move-exception v3

    monitor-exit p0
    :try_end_4e
    .catchall {:try_start_3 .. :try_end_4e} :catchall_4c

    throw v3
.end method

.method public triggerRing(Ljava/lang/String;)Z
    .registers 9
    .parameter "number"

    .prologue
    const/4 v4, 0x0

    .line 179
    monitor-enter p0

    .line 180
    const/4 v1, -0x1

    .line 181
    .local v1, empty:I
    const/4 v3, 0x0

    .line 184
    .local v3, isCallWaiting:Z
    const/4 v2, 0x0

    .local v2, i:I
    :goto_5
    :try_start_5
    iget-object v5, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    array-length v5, v5

    if-ge v2, v5, :cond_31

    .line 185
    iget-object v5, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v0, v5, v2

    .line 187
    .local v0, call:Lcom/android/internal/telephony/test/CallInfo;
    if-nez v0, :cond_16

    if-gez v1, :cond_16

    .line 188
    move v1, v2

    .line 184
    :cond_13
    :goto_13
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    .line 189
    :cond_16
    if-eqz v0, :cond_2d

    iget-object v5, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v6, Lcom/android/internal/telephony/test/CallInfo$State;->INCOMING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-eq v5, v6, :cond_24

    iget-object v5, v0, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    sget-object v6, Lcom/android/internal/telephony/test/CallInfo$State;->WAITING:Lcom/android/internal/telephony/test/CallInfo$State;

    if-ne v5, v6, :cond_2d

    .line 193
    :cond_24
    const-string v5, "ModelInterpreter"

    const-string v6, "triggerRing failed; phone already ringing"

    invoke-static {v5, v6}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    monitor-exit p0

    .line 214
    .end local v0           #call:Lcom/android/internal/telephony/test/CallInfo;
    :goto_2c
    return v4

    .line 196
    .restart local v0       #call:Lcom/android/internal/telephony/test/CallInfo;
    :cond_2d
    if-eqz v0, :cond_13

    .line 197
    const/4 v3, 0x1

    goto :goto_13

    .line 201
    .end local v0           #call:Lcom/android/internal/telephony/test/CallInfo;
    :cond_31
    if-gez v1, :cond_3f

    .line 202
    const-string v5, "ModelInterpreter"

    const-string v6, "triggerRing failed; all full"

    invoke-static {v5, v6}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    monitor-exit p0

    goto :goto_2c

    .line 213
    :catchall_3c
    move-exception v4

    monitor-exit p0
    :try_end_3e
    .catchall {:try_start_5 .. :try_end_3e} :catchall_3c

    throw v4

    .line 206
    :cond_3f
    :try_start_3f
    iget-object v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    invoke-static {p1}, Landroid/telephony/PhoneNumberUtils;->extractNetworkPortion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/android/internal/telephony/test/CallInfo;->createIncomingCall(Ljava/lang/String;)Lcom/android/internal/telephony/test/CallInfo;

    move-result-object v5

    aput-object v5, v4, v1

    .line 209
    if-eqz v3, :cond_55

    .line 210
    iget-object v4, p0, Lcom/android/internal/telephony/test/SimulatedGsmCallState;->mCalls:[Lcom/android/internal/telephony/test/CallInfo;

    aget-object v4, v4, v1

    sget-object v5, Lcom/android/internal/telephony/test/CallInfo$State;->WAITING:Lcom/android/internal/telephony/test/CallInfo$State;

    iput-object v5, v4, Lcom/android/internal/telephony/test/CallInfo;->mState:Lcom/android/internal/telephony/test/CallInfo$State;

    .line 213
    :cond_55
    monitor-exit p0
    :try_end_56
    .catchall {:try_start_3f .. :try_end_56} :catchall_3c

    .line 214
    const/4 v4, 0x1

    goto :goto_2c
.end method