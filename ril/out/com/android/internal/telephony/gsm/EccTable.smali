.class public final Lcom/android/internal/telephony/gsm/EccTable;
.super Ljava/lang/Object;
.source "EccTable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/gsm/EccTable$EccEntry;
    }
.end annotation


# static fields
.field static final FILE_ECC_LIST:Ljava/lang/String; = "/data/csc/ecclists.dat"

.field private static final LOCAL_DEBUG:Z = false

.field static final LOG_TAG:Ljava/lang/String; = "GSM"

.field static table:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/telephony/gsm/EccTable$EccEntry;",
            ">;"
        }
    .end annotation
.end field

.field static updated:Z


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v2, 0x0

    .line 77
    sput-boolean v2, Lcom/android/internal/telephony/gsm/EccTable;->updated:Z

    .line 602
    new-instance v3, Ljava/util/ArrayList;

    const/16 v4, 0x64

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    sput-object v3, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    .line 633
    const-string v3, "ro.csc.sales_code"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 635
    .local v1, salesCode:Ljava/lang/String;
    const-string v3, "LYS"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2a

    const-string v3, "MID"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2a

    const-string v3, "MRT"

    invoke-virtual {v3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2b

    :cond_2a
    const/4 v2, 0x1

    :cond_2b
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 636
    .local v0, isLYSMIDMRT:Ljava/lang/Boolean;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_4cb

    .line 637
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, ""

    const-string v5, "08,112,911"

    const-string v6, "112,911,999,000,08,110,118,119,120,122"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 645
    :goto_45
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "450"

    const-string v5, "112,911,119"

    const-string v6, "112,911,999,000,08,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 651
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "234"

    const-string v5, "112,911,999"

    const-string v6, "112,911,999,000,08,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 653
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "235"

    const-string v5, "112,911,999"

    const-string v6, "112,911,999,000,08,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 655
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "272"

    const-string v5, "112,911,999"

    const-string v6, "112,911,999,000,08,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 661
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "204"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,08,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 666
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "724"

    const-string v5, "112,911,190"

    const-string v6, "112,911,999,000,08,110,118,119,190"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 672
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "33402"

    const-string v5, "112,911,060"

    const-string v6, "112,911,999,000,08,110,118,119,060"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 674
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "334020"

    const-string v5, "112,911,060"

    const-string v6, "112,911,999,000,08,110,118,119,060"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 676
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "33403"

    const-string v5, "112,911,066"

    const-string v6, "112,911,999,000,08,110,118,119,066"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 678
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "334050"

    const-string v5, "112,911,066"

    const-string v6, "112,911,999,000,08,110,118,119,066"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 680
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "33405"

    const-string v5, "112,911,066"

    const-string v6, "112,911,999,000,08,110,118,119,066"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 686
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "748"

    const-string v5, "112,911,104,109"

    const-string v6, "112,911,999,000,08,110,118,119,104,109"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 692
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "732101"

    const-string v5, "112,911"

    const-string v6, "112,911"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 694
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "732123"

    const-string v5, "112,123"

    const-string v6, "112,123"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 696
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "73212"

    const-string v5, "112,123"

    const-string v6, "112,123"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 698
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "732103"

    const-string v5, "112,123"

    const-string v6, "112,123"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 700
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "732111"

    const-string v5, "112,123"

    const-string v6, "112,123"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 706
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "730"

    const-string v5, "112,911,133"

    const-string v6, "112,911,999,000,08,110,118,119,133"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 712
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "736"

    const-string v5, "112,911,110"

    const-string v6, "112,911,999,000,08,110,118,119,110"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 718
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "71606"

    const-string v5, "112,911,105"

    const-string v6, "112,911,999,000,08,110,118,119,105"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 726
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "73406"

    const-string v5, "112,911,*1,*171,171"

    const-string v6, "112,911,999,000,08,110,118,119,*1,*171,171"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 728
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "73401"

    const-string v5, "112,911,171"

    const-string v6, "112,911,999,000,08,110,118,119,*1,*171,171"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 729
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "73402"

    const-string v5, "112,911,171"

    const-string v6, "112,911,999,000,08,110,118,119,*1,*171,171"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 730
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "73403"

    const-string v5, "112,911,171"

    const-string v6, "112,911,999,000,08,110,118,119,*1,*171,171"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 732
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "73404"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,08,110,118,119,*1,*171,171"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 738
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "70403"

    const-string v5, "112,911,122"

    const-string v6, "112,911,999,000,08,110,118,119,122"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 748
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "70604"

    const-string v5, "112,911,122"

    const-string v6, "112,911,999,000,08,110,118,119,122"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 760
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "71030"

    const-string v5, "112,911,122"

    const-string v6, "112,911,999,000,08,110,118,119,122"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 762
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "710300"

    const-string v5, "112,911,122"

    const-string v6, "112,911,999,000,08,110,118,119,122"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 772
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "71401"

    const-string v5, "112,911,104"

    const-string v6, "112,911,999,000,08,110,118,119,104"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 780
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "310026"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 782
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "310160"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 784
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "310170"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 786
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "310200"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 788
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "310210"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 790
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "310220"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 792
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "310230"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 794
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "310240"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 796
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "310250"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 798
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "310260"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 800
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "310270"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 802
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "310280"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 804
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "310290"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 806
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "310310"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 808
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "310330"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 810
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "310490"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 812
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "310580"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 814
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "310660"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 816
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "310800"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 818
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "310026"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 820
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "310026"

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 826
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "454"

    const-string v5, "112,911,999"

    const-string v6, "112,911,999,000,08,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 832
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "505"

    const-string v5, "112,911,000"

    const-string v6, "112,911,999,000,08,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 840
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "530"

    const-string v5, "112,911,000,111"

    const-string v6, "112,911,999,000,08,110,118,119,111"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 844
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "460"

    const-string v5, "112,911,999,000,08,110,118,119,120,122"

    const-string v6, "112,911,999,000,08,110,118,119,120,122"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 847
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "466"

    const-string v5, "112,911,110,119"

    const-string v6, "112,911,999,000,08,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 852
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "440"

    const-string v5, "112,911,110,118,119"

    const-string v6, "112,911,999,000,08,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 858
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "441"

    const-string v5, "112,911,110,118,119"

    const-string v6, "112,911,999,000,08,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 864
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "424"

    const-string v5, "112,911,999"

    const-string v6, "112,911,999,000,08,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 866
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "430"

    const-string v5, "112,911,999"

    const-string v6, "112,911,999,000,08,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 868
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "431"

    const-string v5, "112,911,999"

    const-string v6, "112,911,999,000,08,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 874
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "42501"

    const-string v5, "112,911,100"

    const-string v6, "112,911,100"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 876
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "42502"

    const-string v5, "112,911"

    const-string v6, "112,911"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 878
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "42503"

    const-string v5, "112,911,100"

    const-string v6, "112,911,100"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 884
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "42505"

    const-string v5, "112,911,08"

    const-string v6, "112,911"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 886
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "42506"

    const-string v5, "112,911,08"

    const-string v6, "112,911"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 889
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "416"

    const-string v5, "112,911,08"

    const-string v6, "112,911,999,000,08,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 892
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "415"

    const-string v5, "112,911,08"

    const-string v6, "112,911,999,000,08,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 895
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "418"

    const-string v5, "112,911,08"

    const-string v6, "112,911,999,000,08,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 898
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "609"

    const-string v5, "112,911,08"

    const-string v6, "112,911,999,000,08,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 901
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "606"

    const-string v5, "112,911,08"

    const-string v6, "112,911,999,000,08,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 907
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, "620"

    const-string v5, "112,911,999"

    const-string v6, "112,911,999,000,08,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1097
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    invoke-static {v2}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 1099
    return-void

    .line 639
    :cond_4cb
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v3, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    const-string v4, ""

    const-string v5, "112,911"

    const-string v6, "112,911,999,000,08,110,118,119"

    invoke-direct {v3, v4, v5, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_45
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    return-void
.end method

.method public static emergencyNumbersForPLMN(Ljava/lang/String;Z)Ljava/lang/String;
    .registers 4
    .parameter "plmn"
    .parameter "withSIM"

    .prologue
    .line 197
    invoke-static {p0}, Lcom/android/internal/telephony/gsm/EccTable;->entryForPLMN(Ljava/lang/String;)Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    move-result-object v0

    .line 201
    .local v0, entry:Lcom/android/internal/telephony/gsm/EccTable$EccEntry;
    if-nez v0, :cond_9

    .line 203
    const-string v1, ""

    .line 213
    :goto_8
    return-object v1

    .line 207
    :cond_9
    if-eqz p1, :cond_e

    .line 209
    iget-object v1, v0, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;->emergencyNumberWithSIM:Ljava/lang/String;

    goto :goto_8

    .line 213
    :cond_e
    iget-object v1, v0, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;->emergencyNumberWithoutSIM:Ljava/lang/String;

    goto :goto_8
.end method

.method private static entryForPLMN(Ljava/lang/String;)Lcom/android/internal/telephony/gsm/EccTable$EccEntry;
    .registers 6
    .parameter "plmn"

    .prologue
    const/4 v4, 0x3

    const/4 v3, 0x0

    .line 127
    const/4 v0, 0x0

    .line 135
    .local v0, index:I
    if-eqz p0, :cond_2b

    .line 137
    new-instance v1, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    invoke-direct {v1, p0, v3, v3}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    .local v1, m:Lcom/android/internal/telephony/gsm/EccTable$EccEntry;
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    invoke-static {v2, v1}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;)I

    move-result v0

    .line 145
    if-gez v0, :cond_2b

    .line 147
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-le v2, v4, :cond_28

    .line 149
    new-instance v1, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    .end local v1           #m:Lcom/android/internal/telephony/gsm/EccTable$EccEntry;
    const/4 v2, 0x0

    invoke-virtual {p0, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v3, v3}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    .restart local v1       #m:Lcom/android/internal/telephony/gsm/EccTable$EccEntry;
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    invoke-static {v2, v1}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;)I

    move-result v0

    .line 159
    :cond_28
    if-gez v0, :cond_2b

    .line 161
    const/4 v0, 0x0

    .line 171
    .end local v1           #m:Lcom/android/internal/telephony/gsm/EccTable$EccEntry;
    :cond_2b
    sget-object v2, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    return-object v2
.end method

.method public static printEccTable()V
    .registers 0

    .prologue
    .line 596
    return-void
.end method

.method public static declared-synchronized updateEccTable(Ljava/lang/String;)V
    .registers 15
    .parameter "customerSpec"

    .prologue
    .line 366
    const-class v10, Lcom/android/internal/telephony/gsm/EccTable;

    monitor-enter v10

    const/4 v6, 0x0

    .line 368
    .local v6, reader:Ljava/io/BufferedReader;
    const/4 v8, 0x0

    .line 370
    .local v8, str:Ljava/lang/String;
    const/4 v5, 0x0

    .line 372
    .local v5, plmn:Ljava/lang/String;
    const/4 v2, 0x0

    .line 374
    .local v2, emergencyNumberWithSIM:Ljava/lang/String;
    const/4 v3, 0x0

    .line 382
    .local v3, emergencyNumberWithoutSIM:Ljava/lang/String;
    :try_start_8
    sget-boolean v9, Lcom/android/internal/telephony/gsm/EccTable;->updated:Z
    :try_end_a
    .catchall {:try_start_8 .. :try_end_a} :catchall_c1
    .catch Ljava/io/FileNotFoundException; {:try_start_8 .. :try_end_a} :catch_13e
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_a} :catch_86

    if-nez v9, :cond_e

    if-nez p0, :cond_13

    .line 542
    :cond_e
    if-eqz v6, :cond_11

    .line 544
    :try_start_10
    throw v6
    :try_end_11
    .catchall {:try_start_10 .. :try_end_11} :catchall_83
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_11} :catch_e2

    .line 558
    :cond_11
    :goto_11
    monitor-exit v10

    return-void

    .line 396
    :cond_13
    :try_start_13
    new-instance v7, Ljava/io/BufferedReader;

    new-instance v9, Ljava/io/StringReader;

    invoke-direct {v9, p0}, Ljava/io/StringReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v7, v9}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_1d
    .catchall {:try_start_13 .. :try_end_1d} :catchall_c1
    .catch Ljava/io/FileNotFoundException; {:try_start_13 .. :try_end_1d} :catch_13e
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_1d} :catch_86

    .line 398
    .end local v6           #reader:Ljava/io/BufferedReader;
    .local v7, reader:Ljava/io/BufferedReader;
    if-nez v7, :cond_26

    .line 542
    if-eqz v7, :cond_24

    .line 544
    :try_start_21
    invoke-virtual {v7}, Ljava/io/BufferedReader;->close()V
    :try_end_24
    .catchall {:try_start_21 .. :try_end_24} :catchall_118
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_24} :catch_fd

    :cond_24
    :goto_24
    move-object v6, v7

    .line 400
    .end local v7           #reader:Ljava/io/BufferedReader;
    .restart local v6       #reader:Ljava/io/BufferedReader;
    goto :goto_11

    .line 406
    .end local v6           #reader:Ljava/io/BufferedReader;
    .restart local v7       #reader:Ljava/io/BufferedReader;
    :cond_26
    :try_start_26
    const-string v9, "\n"

    const/4 v11, 0x3

    invoke-virtual {p0, v9, v11}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    .line 408
    .local v0, conventionalSpec:[Ljava/lang/String;
    array-length v9, v0

    const/4 v11, 0x2

    if-ne v9, v11, :cond_46

    .line 412
    const/4 v9, 0x0

    aget-object v2, v0, v9

    .line 414
    const/4 v9, 0x1

    aget-object v3, v0, v9

    .line 416
    const-string v9, ""

    invoke-static {v9, v2, v3}, Lcom/android/internal/telephony/gsm/EccTable;->updateEmergencyNumbersForPLMN(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 504
    :cond_3c
    const/4 v9, 0x1

    sput-boolean v9, Lcom/android/internal/telephony/gsm/EccTable;->updated:Z
    :try_end_3f
    .catchall {:try_start_26 .. :try_end_3f} :catchall_137
    .catch Ljava/io/FileNotFoundException; {:try_start_26 .. :try_end_3f} :catch_61
    .catch Ljava/io/IOException; {:try_start_26 .. :try_end_3f} :catch_13a

    .line 542
    if-eqz v7, :cond_44

    .line 544
    :try_start_41
    invoke-virtual {v7}, Ljava/io/BufferedReader;->close()V
    :try_end_44
    .catchall {:try_start_41 .. :try_end_44} :catchall_118
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_44} :catch_11c

    :cond_44
    :goto_44
    move-object v6, v7

    .line 556
    .end local v7           #reader:Ljava/io/BufferedReader;
    .restart local v6       #reader:Ljava/io/BufferedReader;
    goto :goto_11

    .line 422
    .end local v6           #reader:Ljava/io/BufferedReader;
    .restart local v7       #reader:Ljava/io/BufferedReader;
    :cond_46
    :goto_46
    :try_start_46
    invoke-virtual {v7}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_3c

    .line 424
    const/4 v2, 0x0

    .line 426
    const/4 v3, 0x0

    .line 432
    move-object v5, v8

    .line 446
    invoke-virtual {v7}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v8

    .line 448
    if-eqz v8, :cond_56

    .line 452
    move-object v2, v8

    .line 468
    :cond_56
    invoke-virtual {v7}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v8

    .line 470
    if-eqz v8, :cond_5d

    .line 474
    move-object v3, v8

    .line 488
    :cond_5d
    invoke-static {v5, v2, v3}, Lcom/android/internal/telephony/gsm/EccTable;->updateEmergencyNumbersForPLMN(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_60
    .catchall {:try_start_46 .. :try_end_60} :catchall_137
    .catch Ljava/io/FileNotFoundException; {:try_start_46 .. :try_end_60} :catch_61
    .catch Ljava/io/IOException; {:try_start_46 .. :try_end_60} :catch_13a

    goto :goto_46

    .line 510
    .end local v0           #conventionalSpec:[Ljava/lang/String;
    :catch_61
    move-exception v9

    move-object v6, v7

    .line 542
    .end local v7           #reader:Ljava/io/BufferedReader;
    .restart local v6       #reader:Ljava/io/BufferedReader;
    :goto_63
    if-eqz v6, :cond_11

    .line 544
    :try_start_65
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_68
    .catchall {:try_start_65 .. :try_end_68} :catchall_83
    .catch Ljava/lang/Exception; {:try_start_65 .. :try_end_68} :catch_69

    goto :goto_11

    .line 548
    :catch_69
    move-exception v1

    .line 552
    .local v1, e:Ljava/lang/Exception;
    :try_start_6a
    const-string v9, "GSM"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "updateEccTable() Exception : "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_82
    .catchall {:try_start_6a .. :try_end_82} :catchall_83

    goto :goto_11

    .line 366
    .end local v1           #e:Ljava/lang/Exception;
    :catchall_83
    move-exception v9

    :goto_84
    monitor-exit v10

    throw v9

    .line 524
    :catch_86
    move-exception v4

    .line 528
    .local v4, ioe:Ljava/io/IOException;
    :goto_87
    :try_start_87
    const-string v9, "GSM"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "updateEccTable() IOException : "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_9f
    .catchall {:try_start_87 .. :try_end_9f} :catchall_c1

    .line 542
    if-eqz v6, :cond_11

    .line 544
    :try_start_a1
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_a4
    .catchall {:try_start_a1 .. :try_end_a4} :catchall_83
    .catch Ljava/lang/Exception; {:try_start_a1 .. :try_end_a4} :catch_a6

    goto/16 :goto_11

    .line 548
    :catch_a6
    move-exception v1

    .line 552
    .restart local v1       #e:Ljava/lang/Exception;
    :try_start_a7
    const-string v9, "GSM"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "updateEccTable() Exception : "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_bf
    .catchall {:try_start_a7 .. :try_end_bf} :catchall_83

    goto/16 :goto_11

    .line 538
    .end local v1           #e:Ljava/lang/Exception;
    .end local v4           #ioe:Ljava/io/IOException;
    :catchall_c1
    move-exception v9

    .line 542
    :goto_c2
    if-eqz v6, :cond_c7

    .line 544
    :try_start_c4
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_c7
    .catchall {:try_start_c4 .. :try_end_c7} :catchall_83
    .catch Ljava/lang/Exception; {:try_start_c4 .. :try_end_c7} :catch_c8

    .line 538
    :cond_c7
    :goto_c7
    :try_start_c7
    throw v9

    .line 548
    :catch_c8
    move-exception v1

    .line 552
    .restart local v1       #e:Ljava/lang/Exception;
    const-string v11, "GSM"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "updateEccTable() Exception : "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_c7

    .line 548
    .end local v1           #e:Ljava/lang/Exception;
    :catch_e2
    move-exception v1

    .line 552
    .restart local v1       #e:Ljava/lang/Exception;
    const-string v9, "GSM"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "updateEccTable() Exception : "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_fb
    .catchall {:try_start_c7 .. :try_end_fb} :catchall_83

    goto/16 :goto_11

    .line 548
    .end local v1           #e:Ljava/lang/Exception;
    .end local v6           #reader:Ljava/io/BufferedReader;
    .restart local v7       #reader:Ljava/io/BufferedReader;
    :catch_fd
    move-exception v1

    .line 552
    .restart local v1       #e:Ljava/lang/Exception;
    :try_start_fe
    const-string v9, "GSM"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "updateEccTable() Exception : "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_24

    .line 366
    .end local v1           #e:Ljava/lang/Exception;
    :catchall_118
    move-exception v9

    move-object v6, v7

    .end local v7           #reader:Ljava/io/BufferedReader;
    .restart local v6       #reader:Ljava/io/BufferedReader;
    goto/16 :goto_84

    .line 548
    .end local v6           #reader:Ljava/io/BufferedReader;
    .restart local v0       #conventionalSpec:[Ljava/lang/String;
    .restart local v7       #reader:Ljava/io/BufferedReader;
    :catch_11c
    move-exception v1

    .line 552
    .restart local v1       #e:Ljava/lang/Exception;
    const-string v9, "GSM"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "updateEccTable() Exception : "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v11}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_135
    .catchall {:try_start_fe .. :try_end_135} :catchall_118

    goto/16 :goto_44

    .line 538
    .end local v0           #conventionalSpec:[Ljava/lang/String;
    .end local v1           #e:Ljava/lang/Exception;
    :catchall_137
    move-exception v9

    move-object v6, v7

    .end local v7           #reader:Ljava/io/BufferedReader;
    .restart local v6       #reader:Ljava/io/BufferedReader;
    goto :goto_c2

    .line 524
    .end local v6           #reader:Ljava/io/BufferedReader;
    .restart local v7       #reader:Ljava/io/BufferedReader;
    :catch_13a
    move-exception v4

    move-object v6, v7

    .end local v7           #reader:Ljava/io/BufferedReader;
    .restart local v6       #reader:Ljava/io/BufferedReader;
    goto/16 :goto_87

    .line 510
    :catch_13e
    move-exception v9

    goto/16 :goto_63
.end method

.method public static updateEmergencyNumbersForPLMN(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 11
    .parameter "plmn"
    .parameter "emergencyNumberWithSIM"
    .parameter "emergencyNumberWithoutSIM"

    .prologue
    const/4 v7, 0x3

    const/4 v5, 0x0

    const/4 v6, 0x0

    .line 237
    if-nez p0, :cond_7

    move v4, v5

    .line 351
    :goto_6
    return v4

    .line 243
    :cond_7
    new-instance v2, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    invoke-direct {v2, p0, v6, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    .local v2, m:Lcom/android/internal/telephony/gsm/EccTable$EccEntry;
    sget-object v4, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    invoke-static {v4, v2}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;)I

    move-result v3

    .line 249
    .local v3, updateIndex:I
    const/4 v0, 0x0

    .line 251
    .local v0, defaultIndex:I
    if-lez v3, :cond_46

    .line 253
    move v0, v3

    .line 271
    :cond_16
    :goto_16
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_5f

    .line 273
    sget-object v4, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    iget-object p1, v4, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;->emergencyNumberWithSIM:Ljava/lang/String;

    .line 285
    :goto_26
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_81

    .line 287
    sget-object v4, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    iget-object p2, v4, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;->emergencyNumberWithoutSIM:Ljava/lang/String;

    .line 315
    :goto_36
    if-gez v3, :cond_b5

    .line 317
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_44

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_a3

    :cond_44
    move v4, v5

    .line 319
    goto :goto_6

    .line 255
    :cond_46
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    if-le v4, v7, :cond_16

    .line 257
    new-instance v2, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    .end local v2           #m:Lcom/android/internal/telephony/gsm/EccTable$EccEntry;
    invoke-virtual {p0, v5, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4, v6, v6}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 259
    .restart local v2       #m:Lcom/android/internal/telephony/gsm/EccTable$EccEntry;
    sget-object v4, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    invoke-static {v4, v2}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;)I

    move-result v0

    .line 263
    if-gez v0, :cond_16

    .line 265
    const/4 v0, 0x0

    goto :goto_16

    .line 279
    :cond_5f
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    iget-object v4, v4, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;->emergencyNumberWithSIM:Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ","

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_26

    .line 293
    :cond_81
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    iget-object v4, v4, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;->emergencyNumberWithoutSIM:Ljava/lang/String;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ","

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_36

    .line 323
    :cond_a3
    sget-object v4, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    new-instance v5, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    invoke-direct {v5, p0, p1, p2}, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 327
    sget-object v4, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    invoke-static {v4}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    .line 351
    :goto_b2
    const/4 v4, 0x1

    goto/16 :goto_6

    .line 331
    :cond_b5
    sget-object v4, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;

    .line 335
    .local v1, entry:Lcom/android/internal/telephony/gsm/EccTable$EccEntry;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_c5

    .line 337
    iput-object p1, v1, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;->emergencyNumberWithSIM:Ljava/lang/String;

    .line 339
    :cond_c5
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_cd

    .line 341
    iput-object p2, v1, Lcom/android/internal/telephony/gsm/EccTable$EccEntry;->emergencyNumberWithoutSIM:Ljava/lang/String;

    .line 345
    :cond_cd
    sget-object v4, Lcom/android/internal/telephony/gsm/EccTable;->table:Ljava/util/ArrayList;

    invoke-virtual {v4, v3, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_b2
.end method
