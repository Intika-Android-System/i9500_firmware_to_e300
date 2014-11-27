.class public Lcom/carrieriq/iqagent/client/Metric;
.super Ljava/lang/Object;
.source "Metric.java"


# static fields
.field public static final CURRENT_TIME:J = -0x1L


# instance fields
.field public metricID:I

.field public timestamp:J


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .parameter "_metricID"

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    return-void
.end method

.method public constructor <init>(IJ)V
    .registers 4
    .parameter "_metricID"
    .parameter "_ts"

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    return-void
.end method

.method public static idFromString(Ljava/lang/String;)I
    .registers 2
    .parameter "_id"

    .prologue
    .line 14
    const/4 v0, -0x1

    return v0
.end method

.method public static idToBytes(I[BI)V
    .registers 3
    .parameter "_id"
    .parameter "array"
    .parameter "offset"

    .prologue
    .line 18
    return-void
.end method

.method public static idToString(I)Ljava/lang/String;
    .registers 2
    .parameter "_id"

    .prologue
    .line 21
    const/4 v0, 0x0

    return-object v0
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
    .line 40
    const/4 v0, 0x0

    return v0
.end method

.method public setTimestamp(J)V
    .registers 3
    .parameter "_ts"

    .prologue
    .line 31
    return-void
.end method

.method public szStringOut(Ljava/nio/ByteBuffer;Ljava/lang/String;)V
    .registers 3
    .parameter "out"
    .parameter "iString"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/BufferOverflowException;
        }
    .end annotation

    .prologue
    .line 34
    return-void
.end method

.method public szStringOutPadToWord(Ljava/nio/ByteBuffer;Ljava/lang/String;)V
    .registers 3
    .parameter "out"
    .parameter "aString"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/BufferOverflowException;
        }
    .end annotation

    .prologue
    .line 37
    return-void
.end method
