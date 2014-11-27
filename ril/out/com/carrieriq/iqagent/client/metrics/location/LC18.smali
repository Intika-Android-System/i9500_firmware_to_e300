.class public Lcom/carrieriq/iqagent/client/metrics/location/LC18;
.super Lcom/carrieriq/iqagent/client/Metric;
.source "LC18.java"


# static fields
.field public static final ID:I


# instance fields
.field public lAltitude:I

.field public lHeading:I

.field public lLatitude:I

.field public lLongitude:I

.field public lUncertiantyAint:I

.field public lUncertiantyAltitude:I

.field public lUncertiantyAngle:I

.field public lUncertiantyPerpendicular:I

.field public lVelocityHorizontal:I

.field public lVelocityVertical:I

.field public ucFieldsValid:B

.field public ucGpsRequestType:B

.field public ucGpsResult:B

.field public ucGpsSource:B


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 9
    const-string v0, "LC18"

    invoke-static {v0}, Lcom/carrieriq/iqagent/client/metrics/location/LC18;->idFromString(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/carrieriq/iqagent/client/metrics/location/LC18;->ID:I

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 27
    sget v0, Lcom/carrieriq/iqagent/client/metrics/location/LC18;->ID:I

    invoke-direct {p0, v0}, Lcom/carrieriq/iqagent/client/Metric;-><init>(I)V

    .line 28
    return-void
.end method


# virtual methods
.method public clear()V
    .registers 1

    .prologue
    .line 31
    return-void
.end method

.method public serialize(Ljava/nio/ByteBuffer;)I
    .registers 3
    .parameter "out"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/nio/BufferOverflowException;
        }
    .end annotation

    .prologue
    .line 49
    const/4 v0, -0x1

    return v0
.end method

.method public setAltitude(D)V
    .registers 3
    .parameter "meters"

    .prologue
    .line 40
    return-void
.end method

.method public setBearing(F)V
    .registers 2
    .parameter "degrees"

    .prologue
    .line 46
    return-void
.end method

.method public setLatitude(D)V
    .registers 3
    .parameter "degrees"

    .prologue
    .line 34
    return-void
.end method

.method public setLongitude(D)V
    .registers 3
    .parameter "degrees"

    .prologue
    .line 37
    return-void
.end method

.method public setVelocity(F)V
    .registers 2
    .parameter "meters_per_sec"

    .prologue
    .line 43
    return-void
.end method
