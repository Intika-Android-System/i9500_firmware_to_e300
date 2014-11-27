.class Lcom/movial/ipphone/IPConnection$MyHandler;
.super Landroid/os/Handler;
.source "IPConnection.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/movial/ipphone/IPConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/movial/ipphone/IPConnection;


# direct methods
.method constructor <init>(Lcom/movial/ipphone/IPConnection;Landroid/os/Looper;)V
    .registers 3
    .parameter
    .parameter "l"

    .prologue
    .line 134
    iput-object p1, p0, Lcom/movial/ipphone/IPConnection$MyHandler;->this$0:Lcom/movial/ipphone/IPConnection;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .registers 3
    .parameter "msg"

    .prologue
    .line 139
    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_12

    .line 149
    :goto_5
    return-void

    .line 143
    :pswitch_6
    iget-object v0, p0, Lcom/movial/ipphone/IPConnection$MyHandler;->this$0:Lcom/movial/ipphone/IPConnection;

    #calls: Lcom/movial/ipphone/IPConnection;->processNextPostDialChar()V
    invoke-static {v0}, Lcom/movial/ipphone/IPConnection;->access$000(Lcom/movial/ipphone/IPConnection;)V

    goto :goto_5

    .line 146
    :pswitch_c
    iget-object v0, p0, Lcom/movial/ipphone/IPConnection$MyHandler;->this$0:Lcom/movial/ipphone/IPConnection;

    #calls: Lcom/movial/ipphone/IPConnection;->releaseWakeLock()V
    invoke-static {v0}, Lcom/movial/ipphone/IPConnection;->access$100(Lcom/movial/ipphone/IPConnection;)V

    goto :goto_5

    .line 139
    :pswitch_data_12
    .packed-switch 0x1
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_c
    .end packed-switch
.end method
