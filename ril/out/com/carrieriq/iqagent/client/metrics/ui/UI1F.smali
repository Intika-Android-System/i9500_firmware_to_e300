.class public Lcom/carrieriq/iqagent/client/metrics/ui/UI1F;
.super Lcom/carrieriq/iqagent/client/Metric;
.source "UI1F.java"


# static fields
.field public static final ID:I


# instance fields
.field public dwDuration:I

.field public dwRunAppID:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 9
    const-string v0, "UI1F"

    invoke-static {v0}, Lcom/carrieriq/iqagent/client/metrics/ui/UI1F;->idFromString(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/carrieriq/iqagent/client/metrics/ui/UI1F;->ID:I

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 15
    sget v0, Lcom/carrieriq/iqagent/client/metrics/ui/UI1F;->ID:I

    invoke-direct {p0, v0}, Lcom/carrieriq/iqagent/client/Metric;-><init>(I)V

    .line 16
    return-void
.end method

.method public constructor <init>(II)V
    .registers 4
    .parameter "appInstanceId"
    .parameter "duration"

    .prologue
    .line 19
    sget v0, Lcom/carrieriq/iqagent/client/metrics/ui/UI1F;->ID:I

    invoke-direct {p0, v0}, Lcom/carrieriq/iqagent/client/Metric;-><init>(I)V

    .line 20
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
    .line 23
    const/4 v0, -0x1

    return v0
.end method
