.class public Lcom/carrieriq/iqagent/client/IQClient;
.super Ljava/lang/Object;
.source "IQClient.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public checkSMS(Ljava/lang/String;)Z
    .registers 3
    .parameter "s"

    .prologue
    .line 10
    const/4 v0, 0x0

    return v0
.end method

.method public checkWAPPush([B)Z
    .registers 3
    .parameter "b"

    .prologue
    .line 6
    const/4 v0, 0x0

    return v0
.end method

.method public submitMetric(IJ[BII)I
    .registers 8
    .parameter "metricID"
    .parameter "timestamp"
    .parameter "payloadBytes"
    .parameter "payloadOffs"
    .parameter "payloadLen"

    .prologue
    .line 18
    const/4 v0, -0x1

    return v0
.end method

.method public submitMetric(Lcom/carrieriq/iqagent/client/Metric;)I
    .registers 3
    .parameter "metric"

    .prologue
    .line 14
    const/4 v0, -0x1

    return v0
.end method
