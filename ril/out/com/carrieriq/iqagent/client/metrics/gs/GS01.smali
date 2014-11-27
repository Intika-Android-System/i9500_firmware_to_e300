.class public Lcom/carrieriq/iqagent/client/metrics/gs/GS01;
.super Lcom/carrieriq/iqagent/client/Metric;
.source "GS01.java"


# static fields
.field public static final ID:I


# instance fields
.field public dwCallId:I

.field public szNumber:Ljava/lang/String;

.field public ucCallAttr:B

.field public ucCallState:B


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 9
    const-string v0, "GS01"

    invoke-static {v0}, Lcom/carrieriq/iqagent/client/metrics/gs/GS01;->idFromString(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/carrieriq/iqagent/client/metrics/gs/GS01;->ID:I

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 17
    sget v0, Lcom/carrieriq/iqagent/client/metrics/gs/GS01;->ID:I

    invoke-direct {p0, v0}, Lcom/carrieriq/iqagent/client/Metric;-><init>(I)V

    .line 18
    return-void
.end method

.method public constructor <init>(IBLjava/lang/String;)V
    .registers 5
    .parameter "callId"
    .parameter "callState"
    .parameter "number"

    .prologue
    .line 33
    sget v0, Lcom/carrieriq/iqagent/client/metrics/gs/GS01;->ID:I

    invoke-direct {p0, v0}, Lcom/carrieriq/iqagent/client/Metric;-><init>(I)V

    .line 34
    return-void
.end method


# virtual methods
.method public serialize(Ljava/nio/ByteBuffer;)I
    .registers 3
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/BufferOverflowException;
        }
    .end annotation

    .prologue
    .line 38
    const/4 v0, -0x1

    return v0
.end method

.method public setOriginated()V
    .registers 1

    .prologue
    .line 24
    return-void
.end method

.method public setTerminated()V
    .registers 1

    .prologue
    .line 21
    return-void
.end method

.method public setVideo()V
    .registers 1

    .prologue
    .line 30
    return-void
.end method

.method public setVoice()V
    .registers 1

    .prologue
    .line 27
    return-void
.end method
