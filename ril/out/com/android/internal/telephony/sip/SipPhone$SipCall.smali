.class Lcom/android/internal/telephony/sip/SipPhone$SipCall;
.super Lcom/android/internal/telephony/sip/SipCallBase;
.source "SipPhone.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/sip/SipPhone;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SipCall"
.end annotation


# static fields
.field private static final SC_DBG:Z = true

.field private static final SC_TAG:Ljava/lang/String; = "SipCall"

.field private static final SC_VDBG:Z


# instance fields
.field final synthetic this$0:Lcom/android/internal/telephony/sip/SipPhone;


# direct methods
.method private constructor <init>(Lcom/android/internal/telephony/sip/SipPhone;)V
    .registers 2
    .parameter

    .prologue
    .line 458
    iput-object p1, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->this$0:Lcom/android/internal/telephony/sip/SipPhone;

    invoke-direct {p0}, Lcom/android/internal/telephony/sip/SipCallBase;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/internal/telephony/sip/SipPhone;Lcom/android/internal/telephony/sip/SipPhone$1;)V
    .registers 3
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 458
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;-><init>(Lcom/android/internal/telephony/sip/SipPhone;)V

    return-void
.end method

.method static synthetic access$1600(Lcom/android/internal/telephony/sip/SipPhone$SipCall;)Landroid/net/rtp/AudioGroup;
    .registers 2
    .parameter "x0"

    .prologue
    .line 458
    invoke-direct {p0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->getAudioGroup()Landroid/net/rtp/AudioGroup;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1700(Lcom/android/internal/telephony/sip/SipPhone$SipCall;Lcom/android/internal/telephony/sip/SipPhone$SipConnection;)V
    .registers 2
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 458
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->add(Lcom/android/internal/telephony/sip/SipPhone$SipConnection;)V

    return-void
.end method

.method private add(Lcom/android/internal/telephony/sip/SipPhone$SipConnection;)V
    .registers 4
    .parameter "conn"

    .prologue
    .line 655
    const-string v1, "add:"

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    .line 656
    invoke-virtual {p1}, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;->getCall()Lcom/android/internal/telephony/sip/SipPhone$SipCall;

    move-result-object v0

    .line 657
    .local v0, call:Lcom/android/internal/telephony/sip/SipPhone$SipCall;
    if-ne v0, p0, :cond_c

    .line 662
    :goto_b
    return-void

    .line 658
    :cond_c
    if-eqz v0, :cond_13

    iget-object v1, v0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 660
    :cond_13
    iget-object v1, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 661
    invoke-virtual {p1, p0}, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;->changeOwner(Lcom/android/internal/telephony/sip/SipPhone$SipCall;)V

    goto :goto_b
.end method

.method private convertDtmf(C)I
    .registers 6
    .parameter "c"

    .prologue
    .line 675
    add-int/lit8 v0, p1, -0x30

    .line 676
    .local v0, code:I
    if-ltz v0, :cond_8

    const/16 v1, 0x9

    if-le v0, v1, :cond_26

    .line 677
    :cond_8
    sparse-switch p1, :sswitch_data_36

    .line 685
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "invalid DTMF char: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 678
    :sswitch_24
    const/16 v0, 0xa

    .line 689
    .end local v0           #code:I
    :cond_26
    :goto_26
    return v0

    .line 679
    .restart local v0       #code:I
    :sswitch_27
    const/16 v0, 0xb

    goto :goto_26

    .line 680
    :sswitch_2a
    const/16 v0, 0xc

    goto :goto_26

    .line 681
    :sswitch_2d
    const/16 v0, 0xd

    goto :goto_26

    .line 682
    :sswitch_30
    const/16 v0, 0xe

    goto :goto_26

    .line 683
    :sswitch_33
    const/16 v0, 0xf

    goto :goto_26

    .line 677
    :sswitch_data_36
    .sparse-switch
        0x23 -> :sswitch_27
        0x2a -> :sswitch_24
        0x41 -> :sswitch_2a
        0x42 -> :sswitch_2d
        0x43 -> :sswitch_30
        0x44 -> :sswitch_33
    .end sparse-switch
.end method

.method private getAudioGroup()Landroid/net/rtp/AudioGroup;
    .registers 3

    .prologue
    .line 740
    iget-object v0, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 v0, 0x0

    .line 741
    :goto_9
    return-object v0

    :cond_a
    iget-object v0, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;

    invoke-virtual {v0}, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;->getAudioGroup()Landroid/net/rtp/AudioGroup;

    move-result-object v0

    goto :goto_9
.end method

.method private isSpeakerOn()Z
    .registers 4

    .prologue
    .line 577
    iget-object v1, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->this$0:Lcom/android/internal/telephony/sip/SipPhone;

    #getter for: Lcom/android/internal/telephony/sip/SipPhone;->mContext:Landroid/content/Context;
    invoke-static {v1}, Lcom/android/internal/telephony/sip/SipPhone;->access$400(Lcom/android/internal/telephony/sip/SipPhone;)Landroid/content/Context;

    move-result-object v1

    const-string v2, "audio"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/media/AudioManager;

    invoke-virtual {v1}, Landroid/media/AudioManager;->isSpeakerphoneOn()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 580
    .local v0, ret:Ljava/lang/Boolean;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    return v1
.end method

.method private log(Ljava/lang/String;)V
    .registers 3
    .parameter "s"

    .prologue
    .line 745
    const-string v0, "SipCall"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 746
    return-void
.end method

.method private takeOver(Lcom/android/internal/telephony/sip/SipPhone$SipCall;)V
    .registers 5
    .parameter "that"

    .prologue
    .line 480
    const-string v2, "takeOver"

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    .line 481
    iget-object v2, p1, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    iput-object v2, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    .line 482
    iget-object v2, p1, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mState:Lcom/android/internal/telephony/Call$State;

    iput-object v2, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mState:Lcom/android/internal/telephony/Call$State;

    .line 483
    iget-object v2, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_13
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_25

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Connection;

    .line 484
    .local v0, c:Lcom/android/internal/telephony/Connection;
    check-cast v0, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;

    .end local v0           #c:Lcom/android/internal/telephony/Connection;
    invoke-virtual {v0, p0}, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;->changeOwner(Lcom/android/internal/telephony/sip/SipPhone$SipCall;)V

    goto :goto_13

    .line 486
    :cond_25
    return-void
.end method


# virtual methods
.method acceptCall()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 566
    const-string v0, "acceptCall: accepting"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    .line 567
    iget-object v0, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->this$0:Lcom/android/internal/telephony/sip/SipPhone;

    #getter for: Lcom/android/internal/telephony/sip/SipPhone;->mRingingCall:Lcom/android/internal/telephony/sip/SipPhone$SipCall;
    invoke-static {v0}, Lcom/android/internal/telephony/sip/SipPhone;->access$300(Lcom/android/internal/telephony/sip/SipPhone;)Lcom/android/internal/telephony/sip/SipPhone$SipCall;

    move-result-object v0

    if-eq p0, v0, :cond_15

    .line 568
    new-instance v0, Lcom/android/internal/telephony/CallStateException;

    const-string v1, "acceptCall() in a non-ringing call"

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/CallStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 570
    :cond_15
    iget-object v0, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_26

    .line 571
    new-instance v0, Lcom/android/internal/telephony/CallStateException;

    const-string v1, "acceptCall() in a conf call"

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/CallStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 573
    :cond_26
    iget-object v0, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;

    invoke-virtual {v0}, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;->acceptCall()V

    .line 574
    return-void
.end method

.method dial(Ljava/lang/String;)Lcom/android/internal/telephony/Connection;
    .registers 10
    .parameter "originalNumber"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/net/sip/SipException;
        }
    .end annotation

    .prologue
    .line 503
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "dial: num="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "xxx"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v5}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    .line 505
    move-object v2, p1

    .line 506
    .local v2, calleeSipUri:Ljava/lang/String;
    const-string v5, "@"

    invoke-virtual {v2, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_63

    .line 507
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->this$0:Lcom/android/internal/telephony/sip/SipPhone;

    #getter for: Lcom/android/internal/telephony/sip/SipPhone;->mProfile:Landroid/net/sip/SipProfile;
    invoke-static {v6}, Lcom/android/internal/telephony/sip/SipPhone;->access$100(Lcom/android/internal/telephony/sip/SipPhone;)Landroid/net/sip/SipProfile;

    move-result-object v6

    invoke-virtual {v6}, Landroid/net/sip/SipProfile;->getUserName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "@"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/util/regex/Pattern;->quote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 508
    .local v4, replaceStr:Ljava/lang/String;
    iget-object v5, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->this$0:Lcom/android/internal/telephony/sip/SipPhone;

    #getter for: Lcom/android/internal/telephony/sip/SipPhone;->mProfile:Landroid/net/sip/SipProfile;
    invoke-static {v5}, Lcom/android/internal/telephony/sip/SipPhone;->access$100(Lcom/android/internal/telephony/sip/SipPhone;)Landroid/net/sip/SipProfile;

    move-result-object v5

    invoke-virtual {v5}, Landroid/net/sip/SipProfile;->getUriString()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "@"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v4, v6}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 512
    .end local v4           #replaceStr:Ljava/lang/String;
    :cond_63
    :try_start_63
    new-instance v5, Landroid/net/sip/SipProfile$Builder;

    invoke-direct {v5, v2}, Landroid/net/sip/SipProfile$Builder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Landroid/net/sip/SipProfile$Builder;->build()Landroid/net/sip/SipProfile;

    move-result-object v1

    .line 514
    .local v1, callee:Landroid/net/sip/SipProfile;
    new-instance v0, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;

    iget-object v5, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->this$0:Lcom/android/internal/telephony/sip/SipPhone;

    invoke-direct {v0, v5, p0, v1, p1}, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;-><init>(Lcom/android/internal/telephony/sip/SipPhone;Lcom/android/internal/telephony/sip/SipPhone$SipCall;Landroid/net/sip/SipProfile;Ljava/lang/String;)V

    .line 516
    .local v0, c:Lcom/android/internal/telephony/sip/SipPhone$SipConnection;
    invoke-virtual {v0}, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;->dial()V

    .line 517
    iget-object v5, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 518
    sget-object v5, Lcom/android/internal/telephony/Call$State;->DIALING:Lcom/android/internal/telephony/Call$State;

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->setState(Lcom/android/internal/telephony/Call$State;)V
    :try_end_80
    .catch Ljava/text/ParseException; {:try_start_63 .. :try_end_80} :catch_81

    .line 519
    return-object v0

    .line 520
    .end local v0           #c:Lcom/android/internal/telephony/sip/SipPhone$SipConnection;
    .end local v1           #callee:Landroid/net/sip/SipProfile;
    :catch_81
    move-exception v3

    .line 521
    .local v3, e:Ljava/text/ParseException;
    new-instance v5, Landroid/net/sip/SipException;

    const-string v6, "dial"

    invoke-direct {v5, v6, v3}, Landroid/net/sip/SipException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method

.method public fallbackHangupVTCall()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 752
    return-void
.end method

.method public getConnections()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/telephony/Connection;",
            ">;"
        }
    .end annotation

    .prologue
    .line 496
    const-class v1, Lcom/android/internal/telephony/sip/SipPhone;

    monitor-enter v1

    .line 498
    :try_start_3
    iget-object v0, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    monitor-exit v1

    return-object v0

    .line 499
    :catchall_7
    move-exception v0

    monitor-exit v1
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v0
.end method

.method getMute()Z
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 629
    iget-object v1, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_20

    .line 632
    .local v0, ret:Z
    :goto_9
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getMute: ret="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    .line 633
    return v0

    .line 629
    .end local v0           #ret:Z
    :cond_20
    iget-object v1, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;

    invoke-virtual {v1}, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;->getMute()Z

    move-result v0

    goto :goto_9
.end method

.method public getPhone()Lcom/android/internal/telephony/Phone;
    .registers 2

    .prologue
    .line 490
    iget-object v0, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->this$0:Lcom/android/internal/telephony/sip/SipPhone;

    return-object v0
.end method

.method public hangup()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 527
    const-class v5, Lcom/android/internal/telephony/sip/SipPhone;

    monitor-enter v5

    .line 528
    :try_start_3
    iget-object v4, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mState:Lcom/android/internal/telephony/Call$State;

    invoke-virtual {v4}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v4

    if-eqz v4, :cond_62

    .line 529
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "hangup: call "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ": "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " on phone "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    .line 531
    sget-object v4, Lcom/android/internal/telephony/Call$State;->DISCONNECTING:Lcom/android/internal/telephony/Call$State;

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->setState(Lcom/android/internal/telephony/Call$State;)V

    .line 532
    const/4 v2, 0x0

    .line 533
    .local v2, excp:Lcom/android/internal/telephony/CallStateException;
    iget-object v4, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, i$:Ljava/util/Iterator;
    :goto_49
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Connection;
    :try_end_55
    .catchall {:try_start_3 .. :try_end_55} :catchall_5f

    .line 535
    .local v0, c:Lcom/android/internal/telephony/Connection;
    :try_start_55
    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->hangup()V
    :try_end_58
    .catchall {:try_start_55 .. :try_end_58} :catchall_5f
    .catch Lcom/android/internal/telephony/CallStateException; {:try_start_55 .. :try_end_58} :catch_59

    goto :goto_49

    .line 536
    :catch_59
    move-exception v1

    .line 537
    .local v1, e:Lcom/android/internal/telephony/CallStateException;
    move-object v2, v1

    goto :goto_49

    .line 540
    .end local v0           #c:Lcom/android/internal/telephony/Connection;
    .end local v1           #e:Lcom/android/internal/telephony/CallStateException;
    :cond_5c
    if-eqz v2, :cond_94

    :try_start_5e
    throw v2

    .line 545
    .end local v2           #excp:Lcom/android/internal/telephony/CallStateException;
    .end local v3           #i$:Ljava/util/Iterator;
    :catchall_5f
    move-exception v4

    monitor-exit v5
    :try_end_61
    .catchall {:try_start_5e .. :try_end_61} :catchall_5f

    throw v4

    .line 542
    :cond_62
    :try_start_62
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "hangup: dead call "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ": "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, " on phone "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    .line 545
    :cond_94
    monitor-exit v5
    :try_end_95
    .catchall {:try_start_62 .. :try_end_95} :catchall_5f

    .line 546
    return-void
.end method

.method hold()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 605
    const-string v2, "hold:"

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    .line 606
    sget-object v2, Lcom/android/internal/telephony/Call$State;->HOLDING:Lcom/android/internal/telephony/Call$State;

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->setState(Lcom/android/internal/telephony/Call$State;)V

    .line 607
    iget-object v2, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_10
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_22

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Connection;

    .local v0, c:Lcom/android/internal/telephony/Connection;
    check-cast v0, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;

    .end local v0           #c:Lcom/android/internal/telephony/Connection;
    invoke-virtual {v0}, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;->hold()V

    goto :goto_10

    .line 608
    :cond_22
    invoke-virtual {p0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->setAudioGroupMode()V

    .line 609
    return-void
.end method

.method initIncomingCall(Landroid/net/sip/SipAudioCall;Z)V
    .registers 7
    .parameter "sipAudioCall"
    .parameter "makeCallWait"

    .prologue
    .line 549
    invoke-virtual {p1}, Landroid/net/sip/SipAudioCall;->getPeerProfile()Landroid/net/sip/SipProfile;

    move-result-object v1

    .line 550
    .local v1, callee:Landroid/net/sip/SipProfile;
    new-instance v0, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;

    iget-object v3, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->this$0:Lcom/android/internal/telephony/sip/SipPhone;

    invoke-direct {v0, v3, p0, v1}, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;-><init>(Lcom/android/internal/telephony/sip/SipPhone;Lcom/android/internal/telephony/sip/SipPhone$SipCall;Landroid/net/sip/SipProfile;)V

    .line 551
    .local v0, c:Lcom/android/internal/telephony/sip/SipPhone$SipConnection;
    iget-object v3, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 553
    if-eqz p2, :cond_20

    sget-object v2, Lcom/android/internal/telephony/Call$State;->WAITING:Lcom/android/internal/telephony/Call$State;

    .line 554
    .local v2, newState:Lcom/android/internal/telephony/Call$State;
    :goto_14
    invoke-virtual {v0, p1, v2}, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;->initIncomingCall(Landroid/net/sip/SipAudioCall;Lcom/android/internal/telephony/Call$State;)V

    .line 556
    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->setState(Lcom/android/internal/telephony/Call$State;)V

    .line 557
    iget-object v3, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->this$0:Lcom/android/internal/telephony/sip/SipPhone;

    #calls: Lcom/android/internal/telephony/sip/SipPhone;->notifyNewRingingConnectionP(Lcom/android/internal/telephony/Connection;)V
    invoke-static {v3, v0}, Lcom/android/internal/telephony/sip/SipPhone;->access$200(Lcom/android/internal/telephony/sip/SipPhone;Lcom/android/internal/telephony/Connection;)V

    .line 558
    return-void

    .line 553
    .end local v2           #newState:Lcom/android/internal/telephony/Call$State;
    :cond_20
    sget-object v2, Lcom/android/internal/telephony/Call$State;->INCOMING:Lcom/android/internal/telephony/Call$State;

    goto :goto_14
.end method

.method public isVideoCall()Z
    .registers 2

    .prologue
    .line 756
    const/4 v0, 0x0

    return v0
.end method

.method merge(Lcom/android/internal/telephony/sip/SipPhone$SipCall;)V
    .registers 11
    .parameter "that"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 637
    const-string v7, "merge:"

    invoke-direct {p0, v7}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    .line 638
    invoke-direct {p0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->getAudioGroup()Landroid/net/rtp/AudioGroup;

    move-result-object v1

    .line 642
    .local v1, audioGroup:Landroid/net/rtp/AudioGroup;
    iget-object v7, p1, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    iget-object v8, p1, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v8, v8, [Lcom/android/internal/telephony/Connection;

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lcom/android/internal/telephony/Connection;

    .line 644
    .local v3, cc:[Lcom/android/internal/telephony/Connection;
    move-object v0, v3

    .local v0, arr$:[Lcom/android/internal/telephony/Connection;
    array-length v6, v0

    .local v6, len$:I
    const/4 v5, 0x0

    .local v5, i$:I
    :goto_1c
    if-ge v5, v6, :cond_34

    aget-object v2, v0, v5

    .local v2, c:Lcom/android/internal/telephony/Connection;
    move-object v4, v2

    .line 645
    check-cast v4, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;

    .line 646
    .local v4, conn:Lcom/android/internal/telephony/sip/SipPhone$SipConnection;
    invoke-direct {p0, v4}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->add(Lcom/android/internal/telephony/sip/SipPhone$SipConnection;)V

    .line 647
    invoke-virtual {v4}, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v7

    sget-object v8, Lcom/android/internal/telephony/Call$State;->HOLDING:Lcom/android/internal/telephony/Call$State;

    if-ne v7, v8, :cond_31

    .line 648
    invoke-virtual {v4, v1}, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;->unhold(Landroid/net/rtp/AudioGroup;)V

    .line 644
    :cond_31
    add-int/lit8 v5, v5, 0x1

    goto :goto_1c

    .line 651
    .end local v2           #c:Lcom/android/internal/telephony/Connection;
    .end local v4           #conn:Lcom/android/internal/telephony/sip/SipPhone$SipConnection;
    :cond_34
    sget-object v7, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    invoke-virtual {p1, v7}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->setState(Lcom/android/internal/telephony/Call$State;)V

    .line 652
    return-void
.end method

.method onConnectionEnded(Lcom/android/internal/telephony/sip/SipPhone$SipConnection;)V
    .registers 7
    .parameter "conn"

    .prologue
    .line 721
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onConnectionEnded: conn="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    .line 722
    iget-object v3, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mState:Lcom/android/internal/telephony/Call$State;

    sget-object v4, Lcom/android/internal/telephony/Call$State;->DISCONNECTED:Lcom/android/internal/telephony/Call$State;

    if-eq v3, v4, :cond_7f

    .line 723
    const/4 v0, 0x1

    .line 724
    .local v0, allConnectionsDisconnected:Z
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "---check connections: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    .line 726
    iget-object v3, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :cond_3f
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_78

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/Connection;

    .line 727
    .local v1, c:Lcom/android/internal/telephony/Connection;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "   state="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lcom/android/internal/telephony/Connection;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    .line 729
    invoke-virtual {v1}, Lcom/android/internal/telephony/Connection;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v3

    sget-object v4, Lcom/android/internal/telephony/Call$State;->DISCONNECTED:Lcom/android/internal/telephony/Call$State;

    if-eq v3, v4, :cond_3f

    .line 730
    const/4 v0, 0x0

    .line 734
    .end local v1           #c:Lcom/android/internal/telephony/Connection;
    :cond_78
    if-eqz v0, :cond_7f

    sget-object v3, Lcom/android/internal/telephony/Call$State;->DISCONNECTED:Lcom/android/internal/telephony/Call$State;

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->setState(Lcom/android/internal/telephony/Call$State;)V

    .line 736
    .end local v0           #allConnectionsDisconnected:Z
    .end local v2           #i$:Ljava/util/Iterator;
    :cond_7f
    iget-object v3, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->this$0:Lcom/android/internal/telephony/sip/SipPhone;

    #calls: Lcom/android/internal/telephony/sip/SipPhone;->notifyDisconnectP(Lcom/android/internal/telephony/Connection;)V
    invoke-static {v3, p1}, Lcom/android/internal/telephony/sip/SipPhone;->access$500(Lcom/android/internal/telephony/sip/SipPhone;Lcom/android/internal/telephony/Connection;)V

    .line 737
    return-void
.end method

.method onConnectionStateChanged(Lcom/android/internal/telephony/sip/SipPhone$SipConnection;)V
    .registers 4
    .parameter "conn"

    .prologue
    .line 713
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onConnectionStateChanged: conn="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    .line 714
    iget-object v0, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mState:Lcom/android/internal/telephony/Call$State;

    sget-object v1, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    if-eq v0, v1, :cond_23

    .line 715
    invoke-virtual {p1}, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->setState(Lcom/android/internal/telephony/Call$State;)V

    .line 717
    :cond_23
    return-void
.end method

.method rejectCall()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 561
    const-string v0, "rejectCall:"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    .line 562
    invoke-virtual {p0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->hangup()V

    .line 563
    return-void
.end method

.method reset()V
    .registers 2

    .prologue
    .line 464
    const-string v0, "reset"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    .line 465
    iget-object v0, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 466
    sget-object v0, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->setState(Lcom/android/internal/telephony/Call$State;)V

    .line 467
    return-void
.end method

.method sendDtmf(C)V
    .registers 5
    .parameter "c"

    .prologue
    .line 665
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sendDtmf: c="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    .line 666
    invoke-direct {p0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->getAudioGroup()Landroid/net/rtp/AudioGroup;

    move-result-object v0

    .line 667
    .local v0, audioGroup:Landroid/net/rtp/AudioGroup;
    if-nez v0, :cond_33

    .line 668
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sendDtmf: audioGroup == null, ignore c="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    .line 672
    :goto_32
    return-void

    .line 671
    :cond_33
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->convertDtmf(C)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/net/rtp/AudioGroup;->sendDtmf(I)V

    goto :goto_32
.end method

.method setAudioGroupMode()V
    .registers 8

    .prologue
    const/4 v4, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 584
    invoke-direct {p0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->getAudioGroup()Landroid/net/rtp/AudioGroup;

    move-result-object v0

    .line 585
    .local v0, audioGroup:Landroid/net/rtp/AudioGroup;
    if-nez v0, :cond_f

    .line 586
    const-string v2, "setAudioGroupMode: audioGroup == null ignore"

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    .line 602
    :goto_e
    return-void

    .line 589
    :cond_f
    invoke-virtual {v0}, Landroid/net/rtp/AudioGroup;->getMode()I

    move-result v1

    .line 590
    .local v1, mode:I
    iget-object v2, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mState:Lcom/android/internal/telephony/Call$State;

    sget-object v3, Lcom/android/internal/telephony/Call$State;->HOLDING:Lcom/android/internal/telephony/Call$State;

    if-ne v2, v3, :cond_38

    .line 591
    invoke-virtual {v0, v5}, Landroid/net/rtp/AudioGroup;->setMode(I)V

    .line 599
    :goto_1c
    const-string v2, "setAudioGroupMode change: %d --> %d"

    new-array v3, v4, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-virtual {v0}, Landroid/net/rtp/AudioGroup;->getMode()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    goto :goto_e

    .line 592
    :cond_38
    invoke-virtual {p0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->getMute()Z

    move-result v2

    if-eqz v2, :cond_42

    .line 593
    invoke-virtual {v0, v6}, Landroid/net/rtp/AudioGroup;->setMode(I)V

    goto :goto_1c

    .line 594
    :cond_42
    invoke-direct {p0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->isSpeakerOn()Z

    move-result v2

    if-eqz v2, :cond_4d

    .line 595
    const/4 v2, 0x3

    invoke-virtual {v0, v2}, Landroid/net/rtp/AudioGroup;->setMode(I)V

    goto :goto_1c

    .line 597
    :cond_4d
    invoke-virtual {v0, v4}, Landroid/net/rtp/AudioGroup;->setMode(I)V

    goto :goto_1c
.end method

.method setMute(Z)V
    .registers 6
    .parameter "muted"

    .prologue
    .line 622
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setMute: muted="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    .line 623
    iget-object v2, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, i$:Ljava/util/Iterator;
    :goto_1c
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Connection;

    .line 624
    .local v0, c:Lcom/android/internal/telephony/Connection;
    check-cast v0, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;

    .end local v0           #c:Lcom/android/internal/telephony/Connection;
    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;->setMute(Z)V

    goto :goto_1c

    .line 626
    :cond_2e
    return-void
.end method

.method protected setState(Lcom/android/internal/telephony/Call$State;)V
    .registers 4
    .parameter "newState"

    .prologue
    .line 694
    iget-object v0, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mState:Lcom/android/internal/telephony/Call$State;

    if-eq v0, p1, :cond_65

    .line 695
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setState: cur state"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mState:Lcom/android/internal/telephony/Call$State;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " --> "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ": on phone "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->getPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    .line 699
    sget-object v0, Lcom/android/internal/telephony/Call$State;->ALERTING:Lcom/android/internal/telephony/Call$State;

    if-ne p1, v0, :cond_66

    .line 700
    iput-object p1, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mState:Lcom/android/internal/telephony/Call$State;

    .line 701
    iget-object v0, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->this$0:Lcom/android/internal/telephony/sip/SipPhone;

    invoke-virtual {v0}, Lcom/android/internal/telephony/sip/SipPhone;->startRingbackTone()V

    .line 705
    :cond_59
    :goto_59
    iput-object p1, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mState:Lcom/android/internal/telephony/Call$State;

    .line 706
    iget-object v0, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->this$0:Lcom/android/internal/telephony/sip/SipPhone;

    invoke-virtual {v0}, Lcom/android/internal/telephony/sip/SipPhone;->updatePhoneState()V

    .line 707
    iget-object v0, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->this$0:Lcom/android/internal/telephony/sip/SipPhone;

    invoke-virtual {v0}, Lcom/android/internal/telephony/sip/SipPhone;->notifyPreciseCallStateChanged()V

    .line 709
    :cond_65
    return-void

    .line 702
    :cond_66
    iget-object v0, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mState:Lcom/android/internal/telephony/Call$State;

    sget-object v1, Lcom/android/internal/telephony/Call$State;->ALERTING:Lcom/android/internal/telephony/Call$State;

    if-ne v0, v1, :cond_59

    .line 703
    iget-object v0, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->this$0:Lcom/android/internal/telephony/sip/SipPhone;

    invoke-virtual {v0}, Lcom/android/internal/telephony/sip/SipPhone;->stopRingbackTone()V

    goto :goto_59
.end method

.method switchWith(Lcom/android/internal/telephony/sip/SipPhone$SipCall;)V
    .registers 5
    .parameter "that"

    .prologue
    .line 470
    const-string v1, "switchWith"

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    .line 471
    const-class v2, Lcom/android/internal/telephony/sip/SipPhone;

    monitor-enter v2

    .line 472
    :try_start_8
    new-instance v0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;

    iget-object v1, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->this$0:Lcom/android/internal/telephony/sip/SipPhone;

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;-><init>(Lcom/android/internal/telephony/sip/SipPhone;)V

    .line 473
    .local v0, tmp:Lcom/android/internal/telephony/sip/SipPhone$SipCall;
    invoke-direct {v0, p0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->takeOver(Lcom/android/internal/telephony/sip/SipPhone$SipCall;)V

    .line 474
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->takeOver(Lcom/android/internal/telephony/sip/SipPhone$SipCall;)V

    .line 475
    invoke-direct {p1, v0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->takeOver(Lcom/android/internal/telephony/sip/SipPhone$SipCall;)V

    .line 476
    monitor-exit v2

    .line 477
    return-void

    .line 476
    .end local v0           #tmp:Lcom/android/internal/telephony/sip/SipPhone$SipCall;
    :catchall_1a
    move-exception v1

    monitor-exit v2
    :try_end_1c
    .catchall {:try_start_8 .. :try_end_1c} :catchall_1a

    throw v1
.end method

.method unhold()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 612
    const-string v3, "unhold:"

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->log(Ljava/lang/String;)V

    .line 613
    sget-object v3, Lcom/android/internal/telephony/Call$State;->ACTIVE:Lcom/android/internal/telephony/Call$State;

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->setState(Lcom/android/internal/telephony/Call$State;)V

    .line 614
    new-instance v0, Landroid/net/rtp/AudioGroup;

    invoke-direct {v0}, Landroid/net/rtp/AudioGroup;-><init>()V

    .line 615
    .local v0, audioGroup:Landroid/net/rtp/AudioGroup;
    iget-object v3, p0, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->mConnections:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, i$:Ljava/util/Iterator;
    :goto_15
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_27

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/Connection;

    .line 616
    .local v1, c:Lcom/android/internal/telephony/Connection;
    check-cast v1, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;

    .end local v1           #c:Lcom/android/internal/telephony/Connection;
    invoke-virtual {v1, v0}, Lcom/android/internal/telephony/sip/SipPhone$SipConnection;->unhold(Landroid/net/rtp/AudioGroup;)V

    goto :goto_15

    .line 618
    :cond_27
    invoke-virtual {p0}, Lcom/android/internal/telephony/sip/SipPhone$SipCall;->setAudioGroupMode()V

    .line 619
    return-void
.end method
