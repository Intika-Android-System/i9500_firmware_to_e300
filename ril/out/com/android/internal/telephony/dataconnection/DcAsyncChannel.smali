.class public Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
.super Lcom/android/internal/util/AsyncChannel;
.source "DcAsyncChannel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/dataconnection/DcAsyncChannel$LinkPropertyChangeAction;
    }
.end annotation


# static fields
.field public static final BASE:I = 0x41000

.field private static final CMD_TO_STRING_COUNT:I = 0xe

.field private static final DBG:Z = false

.field public static final REQ_GET_APNSETTING:I = 0x41004

.field public static final REQ_GET_CID:I = 0x41002

.field public static final REQ_GET_LINK_CAPABILITIES:I = 0x4100a

.field public static final REQ_GET_LINK_PROPERTIES:I = 0x41006

.field public static final REQ_IS_INACTIVE:I = 0x41000

.field public static final REQ_RESET:I = 0x4100c

.field public static final REQ_SET_LINK_PROPERTIES_HTTP_PROXY:I = 0x41008

.field public static final RSP_GET_APNSETTING:I = 0x41005

.field public static final RSP_GET_CID:I = 0x41003

.field public static final RSP_GET_LINK_CAPABILITIES:I = 0x4100b

.field public static final RSP_GET_LINK_PROPERTIES:I = 0x41007

.field public static final RSP_IS_INACTIVE:I = 0x41001

.field public static final RSP_RESET:I = 0x4100d

.field public static final RSP_SET_LINK_PROPERTIES_HTTP_PROXY:I = 0x41009

.field private static sCmdToString:[Ljava/lang/String;


# instance fields
.field private mDc:Lcom/android/internal/telephony/dataconnection/DataConnection;

.field private mDcThreadId:J

.field private mLogTag:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    .line 63
    const/16 v0, 0xe

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->sCmdToString:[Ljava/lang/String;

    .line 65
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->sCmdToString:[Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "REQ_IS_INACTIVE"

    aput-object v2, v0, v1

    .line 66
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->sCmdToString:[Ljava/lang/String;

    const/4 v1, 0x1

    const-string v2, "RSP_IS_INACTIVE"

    aput-object v2, v0, v1

    .line 67
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->sCmdToString:[Ljava/lang/String;

    const/4 v1, 0x2

    const-string v2, "REQ_GET_CID"

    aput-object v2, v0, v1

    .line 68
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->sCmdToString:[Ljava/lang/String;

    const/4 v1, 0x3

    const-string v2, "RSP_GET_CID"

    aput-object v2, v0, v1

    .line 69
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->sCmdToString:[Ljava/lang/String;

    const/4 v1, 0x4

    const-string v2, "REQ_GET_APNSETTING"

    aput-object v2, v0, v1

    .line 70
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->sCmdToString:[Ljava/lang/String;

    const/4 v1, 0x5

    const-string v2, "RSP_GET_APNSETTING"

    aput-object v2, v0, v1

    .line 71
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->sCmdToString:[Ljava/lang/String;

    const/4 v1, 0x6

    const-string v2, "REQ_GET_LINK_PROPERTIES"

    aput-object v2, v0, v1

    .line 72
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->sCmdToString:[Ljava/lang/String;

    const/4 v1, 0x7

    const-string v2, "RSP_GET_LINK_PROPERTIES"

    aput-object v2, v0, v1

    .line 73
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->sCmdToString:[Ljava/lang/String;

    const/16 v1, 0x8

    const-string v2, "REQ_SET_LINK_PROPERTIES_HTTP_PROXY"

    aput-object v2, v0, v1

    .line 75
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->sCmdToString:[Ljava/lang/String;

    const/16 v1, 0x9

    const-string v2, "RSP_SET_LINK_PROPERTIES_HTTP_PROXY"

    aput-object v2, v0, v1

    .line 77
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->sCmdToString:[Ljava/lang/String;

    const/16 v1, 0xa

    const-string v2, "REQ_GET_LINK_CAPABILITIES"

    aput-object v2, v0, v1

    .line 78
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->sCmdToString:[Ljava/lang/String;

    const/16 v1, 0xb

    const-string v2, "RSP_GET_LINK_CAPABILITIES"

    aput-object v2, v0, v1

    .line 79
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->sCmdToString:[Ljava/lang/String;

    const/16 v1, 0xc

    const-string v2, "REQ_RESET"

    aput-object v2, v0, v1

    .line 80
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->sCmdToString:[Ljava/lang/String;

    const/16 v1, 0xd

    const-string v2, "RSP_RESET"

    aput-object v2, v0, v1

    .line 81
    return-void
.end method

.method public constructor <init>(Lcom/android/internal/telephony/dataconnection/DataConnection;Ljava/lang/String;)V
    .registers 5
    .parameter "dc"
    .parameter "logTag"

    .prologue
    .line 113
    invoke-direct {p0}, Lcom/android/internal/util/AsyncChannel;-><init>()V

    .line 114
    iput-object p1, p0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->mDc:Lcom/android/internal/telephony/dataconnection/DataConnection;

    .line 115
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->mDc:Lcom/android/internal/telephony/dataconnection/DataConnection;

    invoke-virtual {v0}, Lcom/android/internal/util/StateMachine;->getHandler()Landroid/os/Handler;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->mDcThreadId:J

    .line 116
    iput-object p2, p0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->mLogTag:Ljava/lang/String;

    .line 117
    return-void
.end method

.method protected static cmdToString(I)Ljava/lang/String;
    .registers 3
    .parameter "cmd"

    .prologue
    const v1, 0x41000

    .line 85
    sub-int/2addr p0, v1

    .line 86
    if-ltz p0, :cond_10

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->sCmdToString:[Ljava/lang/String;

    array-length v0, v0

    if-ge p0, v0, :cond_10

    .line 87
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->sCmdToString:[Ljava/lang/String;

    aget-object v0, v0, p0

    .line 89
    :goto_f
    return-object v0

    :cond_10
    add-int v0, p0, v1

    invoke-static {v0}, Lcom/android/internal/util/AsyncChannel;->cmdToString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_f
.end method

.method private isCallerOnDifferentThread()Z
    .registers 6

    .prologue
    .line 424
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getId()J

    move-result-wide v0

    .line 425
    .local v0, curThreadId:J
    iget-wide v3, p0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->mDcThreadId:J

    cmp-long v3, v3, v0

    if-eqz v3, :cond_10

    const/4 v2, 0x1

    .line 427
    .local v2, value:Z
    :goto_f
    return v2

    .line 425
    .end local v2           #value:Z
    :cond_10
    const/4 v2, 0x0

    goto :goto_f
.end method

.method private log(Ljava/lang/String;)V
    .registers 5
    .parameter "s"

    .prologue
    .line 431
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->mLogTag:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "DataConnectionAc "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 432
    return-void
.end method


# virtual methods
.method public bringUp(Lcom/android/internal/telephony/dataconnection/ApnContext;IIILandroid/os/Message;)V
    .registers 13
    .parameter "apnContext"
    .parameter "initialMaxRetry"
    .parameter "profileId"
    .parameter "rilRadioTechnology"
    .parameter "onCompletedMsg"

    .prologue
    .line 377
    const/high16 v6, 0x4

    new-instance v0, Lcom/android/internal/telephony/dataconnection/DataConnection$ConnectionParams;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/telephony/dataconnection/DataConnection$ConnectionParams;-><init>(Lcom/android/internal/telephony/dataconnection/ApnContext;IIILandroid/os/Message;)V

    invoke-virtual {p0, v6, v0}, Lcom/android/internal/util/AsyncChannel;->sendMessage(ILjava/lang/Object;)V

    .line 380
    return-void
.end method

.method public getApnSettingSync()Lcom/android/internal/telephony/dataconnection/ApnSetting;
    .registers 5

    .prologue
    .line 227
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->isCallerOnDifferentThread()Z

    move-result v2

    if-eqz v2, :cond_33

    .line 228
    const v2, 0x41004

    invoke-virtual {p0, v2}, Lcom/android/internal/util/AsyncChannel;->sendMessageSynchronously(I)Landroid/os/Message;

    move-result-object v0

    .line 229
    .local v0, response:Landroid/os/Message;
    if-eqz v0, :cond_1b

    iget v2, v0, Landroid/os/Message;->what:I

    const v3, 0x41005

    if-ne v2, v3, :cond_1b

    .line 230
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->rspApnSetting(Landroid/os/Message;)Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v1

    .line 238
    .end local v0           #response:Landroid/os/Message;
    .local v1, value:Lcom/android/internal/telephony/dataconnection/ApnSetting;
    :goto_1a
    return-object v1

    .line 232
    .end local v1           #value:Lcom/android/internal/telephony/dataconnection/ApnSetting;
    .restart local v0       #response:Landroid/os/Message;
    :cond_1b
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getApnSetting error response="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->log(Ljava/lang/String;)V

    .line 233
    const/4 v1, 0x0

    .restart local v1       #value:Lcom/android/internal/telephony/dataconnection/ApnSetting;
    goto :goto_1a

    .line 236
    .end local v0           #response:Landroid/os/Message;
    .end local v1           #value:Lcom/android/internal/telephony/dataconnection/ApnSetting;
    :cond_33
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->mDc:Lcom/android/internal/telephony/dataconnection/DataConnection;

    invoke-virtual {v2}, Lcom/android/internal/telephony/dataconnection/DataConnection;->getApnSetting()Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v1

    .restart local v1       #value:Lcom/android/internal/telephony/dataconnection/ApnSetting;
    goto :goto_1a
.end method

.method public getCidSync()I
    .registers 5

    .prologue
    .line 185
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->isCallerOnDifferentThread()Z

    move-result v2

    if-eqz v2, :cond_33

    .line 186
    const v2, 0x41002

    invoke-virtual {p0, v2}, Lcom/android/internal/util/AsyncChannel;->sendMessageSynchronously(I)Landroid/os/Message;

    move-result-object v0

    .line 187
    .local v0, response:Landroid/os/Message;
    if-eqz v0, :cond_1b

    iget v2, v0, Landroid/os/Message;->what:I

    const v3, 0x41003

    if-ne v2, v3, :cond_1b

    .line 188
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->rspCid(Landroid/os/Message;)I

    move-result v1

    .line 196
    .end local v0           #response:Landroid/os/Message;
    .local v1, value:I
    :goto_1a
    return v1

    .line 190
    .end local v1           #value:I
    .restart local v0       #response:Landroid/os/Message;
    :cond_1b
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "rspCid error response="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->log(Ljava/lang/String;)V

    .line 191
    const/4 v1, -0x1

    .restart local v1       #value:I
    goto :goto_1a

    .line 194
    .end local v0           #response:Landroid/os/Message;
    .end local v1           #value:I
    :cond_33
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->mDc:Lcom/android/internal/telephony/dataconnection/DataConnection;

    invoke-virtual {v2}, Lcom/android/internal/telephony/dataconnection/DataConnection;->getCid()I

    move-result v1

    .restart local v1       #value:I
    goto :goto_1a
.end method

.method public getDataConnectionIdSync()I
    .registers 2

    .prologue
    .line 415
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->mDc:Lcom/android/internal/telephony/dataconnection/DataConnection;

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/DataConnection;->getDataConnectionId()I

    move-result v0

    return v0
.end method

.method public getLinkCapabilitiesSync()Landroid/net/LinkCapabilities;
    .registers 5

    .prologue
    .line 337
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->isCallerOnDifferentThread()Z

    move-result v2

    if-eqz v2, :cond_1d

    .line 338
    const v2, 0x4100a

    invoke-virtual {p0, v2}, Lcom/android/internal/util/AsyncChannel;->sendMessageSynchronously(I)Landroid/os/Message;

    move-result-object v0

    .line 339
    .local v0, response:Landroid/os/Message;
    if-eqz v0, :cond_1b

    iget v2, v0, Landroid/os/Message;->what:I

    const v3, 0x4100b

    if-ne v2, v3, :cond_1b

    .line 340
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->rspLinkCapabilities(Landroid/os/Message;)Landroid/net/LinkCapabilities;

    move-result-object v1

    .line 347
    .end local v0           #response:Landroid/os/Message;
    .local v1, value:Landroid/net/LinkCapabilities;
    :goto_1a
    return-object v1

    .line 342
    .end local v1           #value:Landroid/net/LinkCapabilities;
    .restart local v0       #response:Landroid/os/Message;
    :cond_1b
    const/4 v1, 0x0

    .restart local v1       #value:Landroid/net/LinkCapabilities;
    goto :goto_1a

    .line 345
    .end local v0           #response:Landroid/os/Message;
    .end local v1           #value:Landroid/net/LinkCapabilities;
    :cond_1d
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->mDc:Lcom/android/internal/telephony/dataconnection/DataConnection;

    invoke-virtual {v2}, Lcom/android/internal/telephony/dataconnection/DataConnection;->getCopyLinkCapabilities()Landroid/net/LinkCapabilities;

    move-result-object v1

    .restart local v1       #value:Landroid/net/LinkCapabilities;
    goto :goto_1a
.end method

.method public getLinkPropertiesSync()Landroid/net/LinkProperties;
    .registers 5

    .prologue
    .line 269
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->isCallerOnDifferentThread()Z

    move-result v2

    if-eqz v2, :cond_33

    .line 270
    const v2, 0x41006

    invoke-virtual {p0, v2}, Lcom/android/internal/util/AsyncChannel;->sendMessageSynchronously(I)Landroid/os/Message;

    move-result-object v0

    .line 271
    .local v0, response:Landroid/os/Message;
    if-eqz v0, :cond_1b

    iget v2, v0, Landroid/os/Message;->what:I

    const v3, 0x41007

    if-ne v2, v3, :cond_1b

    .line 272
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->rspLinkProperties(Landroid/os/Message;)Landroid/net/LinkProperties;

    move-result-object v1

    .line 280
    .end local v0           #response:Landroid/os/Message;
    .local v1, value:Landroid/net/LinkProperties;
    :goto_1a
    return-object v1

    .line 274
    .end local v1           #value:Landroid/net/LinkProperties;
    .restart local v0       #response:Landroid/os/Message;
    :cond_1b
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getLinkProperties error response="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->log(Ljava/lang/String;)V

    .line 275
    const/4 v1, 0x0

    .restart local v1       #value:Landroid/net/LinkProperties;
    goto :goto_1a

    .line 278
    .end local v0           #response:Landroid/os/Message;
    .end local v1           #value:Landroid/net/LinkProperties;
    :cond_33
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->mDc:Lcom/android/internal/telephony/dataconnection/DataConnection;

    invoke-virtual {v2}, Lcom/android/internal/telephony/dataconnection/DataConnection;->getCopyLinkProperties()Landroid/net/LinkProperties;

    move-result-object v1

    .restart local v1       #value:Landroid/net/LinkProperties;
    goto :goto_1a
.end method

.method public isInactiveSync()Z
    .registers 5

    .prologue
    .line 145
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->isCallerOnDifferentThread()Z

    move-result v2

    if-eqz v2, :cond_33

    .line 146
    const v2, 0x41000

    invoke-virtual {p0, v2}, Lcom/android/internal/util/AsyncChannel;->sendMessageSynchronously(I)Landroid/os/Message;

    move-result-object v0

    .line 147
    .local v0, response:Landroid/os/Message;
    if-eqz v0, :cond_1b

    iget v2, v0, Landroid/os/Message;->what:I

    const v3, 0x41001

    if-ne v2, v3, :cond_1b

    .line 148
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->rspIsInactive(Landroid/os/Message;)Z

    move-result v1

    .line 156
    .end local v0           #response:Landroid/os/Message;
    .local v1, value:Z
    :goto_1a
    return v1

    .line 150
    .end local v1           #value:Z
    .restart local v0       #response:Landroid/os/Message;
    :cond_1b
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "rspIsInactive error response="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->log(Ljava/lang/String;)V

    .line 151
    const/4 v1, 0x0

    .restart local v1       #value:Z
    goto :goto_1a

    .line 154
    .end local v0           #response:Landroid/os/Message;
    .end local v1           #value:Z
    :cond_33
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->mDc:Lcom/android/internal/telephony/dataconnection/DataConnection;

    invoke-virtual {v2}, Lcom/android/internal/telephony/dataconnection/DataConnection;->getIsInactive()Z

    move-result v1

    .restart local v1       #value:Z
    goto :goto_1a
.end method

.method public reqApnSetting()V
    .registers 2

    .prologue
    .line 204
    const v0, 0x41004

    invoke-virtual {p0, v0}, Lcom/android/internal/util/AsyncChannel;->sendMessage(I)V

    .line 206
    return-void
.end method

.method public reqCid()V
    .registers 2

    .prologue
    .line 164
    const v0, 0x41002

    invoke-virtual {p0, v0}, Lcom/android/internal/util/AsyncChannel;->sendMessage(I)V

    .line 166
    return-void
.end method

.method public reqIsInactive()V
    .registers 2

    .prologue
    .line 124
    const v0, 0x41000

    invoke-virtual {p0, v0}, Lcom/android/internal/util/AsyncChannel;->sendMessage(I)V

    .line 126
    return-void
.end method

.method public reqLinkCapabilities()V
    .registers 2

    .prologue
    .line 314
    const v0, 0x4100a

    invoke-virtual {p0, v0}, Lcom/android/internal/util/AsyncChannel;->sendMessage(I)V

    .line 316
    return-void
.end method

.method public reqLinkProperties()V
    .registers 2

    .prologue
    .line 246
    const v0, 0x41006

    invoke-virtual {p0, v0}, Lcom/android/internal/util/AsyncChannel;->sendMessage(I)V

    .line 248
    return-void
.end method

.method public reqReset()V
    .registers 2

    .prologue
    .line 355
    const v0, 0x4100c

    invoke-virtual {p0, v0}, Lcom/android/internal/util/AsyncChannel;->sendMessage(I)V

    .line 357
    return-void
.end method

.method public reqSetLinkPropertiesHttpProxy(Landroid/net/ProxyProperties;)V
    .registers 3
    .parameter "proxy"

    .prologue
    .line 288
    const v0, 0x41008

    invoke-virtual {p0, v0, p1}, Lcom/android/internal/util/AsyncChannel;->sendMessage(ILjava/lang/Object;)V

    .line 290
    return-void
.end method

.method public rspApnSetting(Landroid/os/Message;)Lcom/android/internal/telephony/dataconnection/ApnSetting;
    .registers 3
    .parameter "response"

    .prologue
    .line 215
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;

    .line 217
    .local v0, retVal:Lcom/android/internal/telephony/dataconnection/ApnSetting;
    return-object v0
.end method

.method public rspCid(Landroid/os/Message;)I
    .registers 3
    .parameter "response"

    .prologue
    .line 175
    iget v0, p1, Landroid/os/Message;->arg1:I

    .line 177
    .local v0, retVal:I
    return v0
.end method

.method public rspIsInactive(Landroid/os/Message;)Z
    .registers 4
    .parameter "response"

    .prologue
    const/4 v0, 0x1

    .line 134
    iget v1, p1, Landroid/os/Message;->arg1:I

    if-ne v1, v0, :cond_6

    .line 136
    .local v0, retVal:Z
    :goto_5
    return v0

    .line 134
    .end local v0           #retVal:Z
    :cond_6
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public rspLinkCapabilities(Landroid/os/Message;)Landroid/net/LinkCapabilities;
    .registers 3
    .parameter "response"

    .prologue
    .line 325
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/net/LinkCapabilities;

    .line 327
    .local v0, retVal:Landroid/net/LinkCapabilities;
    return-object v0
.end method

.method public rspLinkProperties(Landroid/os/Message;)Landroid/net/LinkProperties;
    .registers 3
    .parameter "response"

    .prologue
    .line 257
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/net/LinkProperties;

    .line 259
    .local v0, retVal:Landroid/net/LinkProperties;
    return-object v0
.end method

.method public setLinkPropertiesHttpProxySync(Landroid/net/ProxyProperties;)V
    .registers 5
    .parameter "proxy"

    .prologue
    .line 296
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->isCallerOnDifferentThread()Z

    move-result v1

    if-eqz v1, :cond_2e

    .line 297
    const v1, 0x41008

    invoke-virtual {p0, v1, p1}, Lcom/android/internal/util/AsyncChannel;->sendMessageSynchronously(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 299
    .local v0, response:Landroid/os/Message;
    if-eqz v0, :cond_17

    iget v1, v0, Landroid/os/Message;->what:I

    const v2, 0x41009

    if-ne v1, v2, :cond_17

    .line 307
    .end local v0           #response:Landroid/os/Message;
    :goto_16
    return-void

    .line 302
    .restart local v0       #response:Landroid/os/Message;
    :cond_17
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setLinkPropertiesHttpPoxy error response="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->log(Ljava/lang/String;)V

    goto :goto_16

    .line 305
    .end local v0           #response:Landroid/os/Message;
    :cond_2e
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->mDc:Lcom/android/internal/telephony/dataconnection/DataConnection;

    invoke-virtual {v1, p1}, Lcom/android/internal/telephony/dataconnection/DataConnection;->setLinkPropertiesHttpProxy(Landroid/net/ProxyProperties;)V

    goto :goto_16
.end method

.method public tearDown(Lcom/android/internal/telephony/dataconnection/ApnContext;Ljava/lang/String;Landroid/os/Message;)V
    .registers 6
    .parameter "apnContext"
    .parameter "reason"
    .parameter "onCompletedMsg"

    .prologue
    .line 393
    const v0, 0x40004

    new-instance v1, Lcom/android/internal/telephony/dataconnection/DataConnection$DisconnectParams;

    invoke-direct {v1, p1, p2, p3}, Lcom/android/internal/telephony/dataconnection/DataConnection$DisconnectParams;-><init>(Lcom/android/internal/telephony/dataconnection/ApnContext;Ljava/lang/String;Landroid/os/Message;)V

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/util/AsyncChannel;->sendMessage(ILjava/lang/Object;)V

    .line 395
    return-void
.end method

.method public tearDownAll(Ljava/lang/String;Landroid/os/Message;)V
    .registers 6
    .parameter "reason"
    .parameter "onCompletedMsg"

    .prologue
    .line 406
    const v0, 0x40006

    new-instance v1, Lcom/android/internal/telephony/dataconnection/DataConnection$DisconnectParams;

    const/4 v2, 0x0

    invoke-direct {v1, v2, p1, p2}, Lcom/android/internal/telephony/dataconnection/DataConnection$DisconnectParams;-><init>(Lcom/android/internal/telephony/dataconnection/ApnContext;Ljava/lang/String;Landroid/os/Message;)V

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/util/AsyncChannel;->sendMessage(ILjava/lang/Object;)V

    .line 408
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 420
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->mDc:Lcom/android/internal/telephony/dataconnection/DataConnection;

    invoke-virtual {v0}, Lcom/android/internal/util/StateMachine;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
