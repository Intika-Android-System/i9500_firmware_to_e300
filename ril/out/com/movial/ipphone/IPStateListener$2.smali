.class Lcom/movial/ipphone/IPStateListener$2;
.super Landroid/os/Handler;
.source "IPStateListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/movial/ipphone/IPStateListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/movial/ipphone/IPStateListener;


# direct methods
.method constructor <init>(Lcom/movial/ipphone/IPStateListener;)V
    .registers 2
    .parameter

    .prologue
    .line 64
    iput-object p1, p0, Lcom/movial/ipphone/IPStateListener$2;->this$0:Lcom/movial/ipphone/IPStateListener;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 5
    .parameter "msg"

    .prologue
    const/4 v0, 0x1

    .line 67
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_22

    .line 75
    :goto_6
    return-void

    .line 69
    :pswitch_7
    iget-object v1, p0, Lcom/movial/ipphone/IPStateListener$2;->this$0:Lcom/movial/ipphone/IPStateListener;

    iget v2, p1, Landroid/os/Message;->arg1:I

    if-ne v2, v0, :cond_13

    :goto_d
    iget v2, p1, Landroid/os/Message;->arg2:I

    invoke-virtual {v1, v0, v2}, Lcom/movial/ipphone/IPStateListener;->onRegisteredStateChanged(ZI)V

    goto :goto_6

    :cond_13
    const/4 v0, 0x0

    goto :goto_d

    .line 72
    :pswitch_15
    iget-object v1, p0, Lcom/movial/ipphone/IPStateListener$2;->this$0:Lcom/movial/ipphone/IPStateListener;

    iget v2, p1, Landroid/os/Message;->arg1:I

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v2, v0}, Lcom/movial/ipphone/IPStateListener;->onWifiCallStateChanged(ILjava/lang/String;)V

    goto :goto_6

    .line 67
    nop

    :pswitch_data_22
    .packed-switch 0x1
        :pswitch_7
        :pswitch_15
    .end packed-switch
.end method
