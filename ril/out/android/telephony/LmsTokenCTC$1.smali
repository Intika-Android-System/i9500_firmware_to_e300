.class final Landroid/telephony/LmsTokenCTC$1;
.super Ljava/lang/Object;
.source "LmsTokenCTC.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/telephony/LmsTokenCTC;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Landroid/telephony/LmsTokenCTC;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Landroid/telephony/LmsTokenCTC;
    .registers 4
    .parameter "in"

    .prologue
    .line 91
    new-instance v0, Landroid/telephony/LmsTokenCTC;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Landroid/telephony/LmsTokenCTC;-><init>(Landroid/os/Parcel;Landroid/telephony/LmsTokenCTC$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .registers 3
    .parameter "x0"

    .prologue
    .line 89
    invoke-virtual {p0, p1}, Landroid/telephony/LmsTokenCTC$1;->createFromParcel(Landroid/os/Parcel;)Landroid/telephony/LmsTokenCTC;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Landroid/telephony/LmsTokenCTC;
    .registers 3
    .parameter "size"

    .prologue
    .line 95
    new-array v0, p1, [Landroid/telephony/LmsTokenCTC;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .registers 3
    .parameter "x0"

    .prologue
    .line 89
    invoke-virtual {p0, p1}, Landroid/telephony/LmsTokenCTC$1;->newArray(I)[Landroid/telephony/LmsTokenCTC;

    move-result-object v0

    return-object v0
.end method
