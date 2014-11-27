.class Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;
.super Ljava/lang/Object;
.source "SpnOverride.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/uicc/SpnOverride;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "SpnOverrideInfo"
.end annotation


# instance fields
.field private final fake_home_on:[Ljava/lang/String;

.field private final fake_roaming_on:[Ljava/lang/String;

.field private final imsi_subset:Ljava/lang/String;

.field private final numeric:Ljava/lang/String;

.field private final spn:Ljava/lang/String;

.field private final spn_display_rule:Ljava/lang/String;

.field private final spn_override_only_on:[Ljava/lang/String;

.field final synthetic this$0:Lcom/android/internal/telephony/uicc/SpnOverride;


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/uicc/SpnOverride;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 11
    .parameter
    .parameter "numeric"
    .parameter "spn"
    .parameter "spn_display_rule"
    .parameter "spn_override_only_on"
    .parameter "fake_home_on"
    .parameter "imsi_subset"
    .parameter "fake_roaming_on"

    .prologue
    const/4 v1, 0x0

    .line 53
    iput-object p1, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->this$0:Lcom/android/internal/telephony/uicc/SpnOverride;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p2, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->numeric:Ljava/lang/String;

    .line 55
    iput-object p3, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->spn:Ljava/lang/String;

    .line 56
    iput-object p4, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->spn_display_rule:Ljava/lang/String;

    .line 57
    if-eqz p5, :cond_2f

    const-string v0, ","

    invoke-virtual {p5, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    :goto_14
    iput-object v0, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->spn_override_only_on:[Ljava/lang/String;

    .line 58
    if-eqz p6, :cond_31

    const-string v0, ","

    invoke-virtual {p6, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    :goto_1e
    iput-object v0, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->fake_home_on:[Ljava/lang/String;

    .line 59
    if-eqz p7, :cond_33

    .end local p7
    :goto_22
    iput-object p7, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->imsi_subset:Ljava/lang/String;

    .line 60
    if-eqz p8, :cond_2c

    const-string v0, ","

    invoke-virtual {p8, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    :cond_2c
    iput-object v1, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->fake_roaming_on:[Ljava/lang/String;

    .line 61
    return-void

    .restart local p7
    :cond_2f
    move-object v0, v1

    .line 57
    goto :goto_14

    :cond_31
    move-object v0, v1

    .line 58
    goto :goto_1e

    .line 59
    :cond_33
    const-string p7, ""

    goto :goto_22
.end method

.method static synthetic access$000(Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;)Ljava/lang/String;
    .registers 2
    .parameter "x0"

    .prologue
    .line 44
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->numeric:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public getFakeHomeOn()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 80
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->fake_home_on:[Ljava/lang/String;

    return-object v0
.end method

.method public getFakeRoamingOn()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 88
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->fake_roaming_on:[Ljava/lang/String;

    return-object v0
.end method

.method public getImsiSubset()Ljava/lang/String;
    .registers 2

    .prologue
    .line 84
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->imsi_subset:Ljava/lang/String;

    return-object v0
.end method

.method public getNumeric()Ljava/lang/String;
    .registers 2

    .prologue
    .line 64
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->numeric:Ljava/lang/String;

    return-object v0
.end method

.method public getSpn()Ljava/lang/String;
    .registers 2

    .prologue
    .line 68
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->spn:Ljava/lang/String;

    return-object v0
.end method

.method public getSpnDisplayRule()Ljava/lang/String;
    .registers 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->spn_display_rule:Ljava/lang/String;

    return-object v0
.end method

.method public getSpnOverrideOnlyOn()[Ljava/lang/String;
    .registers 2

    .prologue
    .line 76
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->spn_override_only_on:[Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 92
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SpnOverrideInfo [numeric="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->numeric:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", spn="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->spn:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", spn_display_rule="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->spn_display_rule:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", spn_override_only_on="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->spn_override_only_on:[Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", fake_home_on="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->fake_home_on:[Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", imsi_subset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->imsi_subset:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", fake_roaming_on="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/uicc/SpnOverride$SpnOverrideInfo;->fake_roaming_on:[Ljava/lang/String;

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
