.class public Lcom/android/internal/telephony/uicc/IccUtils;
.super Ljava/lang/Object;
.source "IccUtils.java"


# static fields
.field static final LOG_TAG:Ljava/lang/String; = "IccUtils"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static ICCIDbcdToString([BII)Ljava/lang/String;
    .registers 8
    .parameter "data"
    .parameter "offset"
    .parameter "length"

    .prologue
    const/16 v4, 0x9

    .line 917
    new-instance v1, Ljava/lang/StringBuilder;

    mul-int/lit8 v3, p2, 0x2

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 919
    .local v1, ret:Ljava/lang/StringBuilder;
    move v0, p1

    .local v0, i:I
    :goto_a
    add-int v3, p1, p2

    if-ge v0, v3, :cond_39

    .line 922
    aget-byte v3, p0, v0

    and-int/lit8 v2, v3, 0xf

    .line 923
    .local v2, v:I
    if-le v2, v4, :cond_2b

    .line 924
    add-int/lit8 v3, v2, 0x57

    int-to-char v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 929
    :goto_1a
    aget-byte v3, p0, v0

    shr-int/lit8 v3, v3, 0x4

    and-int/lit8 v2, v3, 0xf

    .line 931
    if-le v2, v4, :cond_32

    .line 932
    add-int/lit8 v3, v2, 0x57

    int-to-char v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 919
    :goto_28
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 926
    :cond_2b
    add-int/lit8 v3, v2, 0x30

    int-to-char v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1a

    .line 934
    :cond_32
    add-int/lit8 v3, v2, 0x30

    int-to-char v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_28

    .line 938
    .end local v2           #v:I
    :cond_39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static MccMncConvert(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .parameter "s"

    .prologue
    const/4 v4, 0x2

    .line 678
    const/4 v0, 0x0

    .line 680
    .local v0, MCC:I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 682
    .local v1, ret:Ljava/lang/StringBuilder;
    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 683
    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 684
    const/4 v2, 0x3

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 686
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "fff"

    invoke-virtual {v2, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-nez v2, :cond_38

    .line 687
    const-string v2, "IccUtils"

    const-string v3, "[MccMncConvert] MCC Value is invalid(\'fff\')!"

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 688
    const/4 v2, 0x0

    .line 720
    :goto_37
    return-object v2

    .line 691
    :cond_38
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "ddd"

    invoke-virtual {v2, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v2

    if-eqz v2, :cond_4c

    .line 692
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 696
    :cond_4c
    const/4 v2, 0x5

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 697
    const/4 v2, 0x4

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 699
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x46

    if-eq v2, v3, :cond_6c

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x66

    if-ne v2, v3, :cond_9a

    .line 706
    :cond_6c
    const/16 v2, 0x136

    if-lt v0, v2, :cond_79

    const/16 v2, 0x13c

    if-gt v0, v2, :cond_79

    .line 708
    const-string v2, "0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 718
    :cond_79
    :goto_79
    const-string v2, "IccUtils"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[MccMncConvert] Convert Result :"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 720
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_37

    .line 715
    :cond_9a
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_79
.end method

.method public static SSbcdToString([BII)Ljava/lang/String;
    .registers 13
    .parameter "data"
    .parameter "offset"
    .parameter "length"

    .prologue
    const/16 v9, 0x23

    const/16 v8, 0xb

    const/16 v7, 0xa

    const/16 v6, 0x9

    const/4 v5, 0x1

    .line 105
    new-instance v1, Ljava/lang/StringBuilder;

    mul-int/lit8 v4, p2, 0x2

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 107
    .local v1, ret:Ljava/lang/StringBuilder;
    aget-byte v4, p0, p1

    and-int/lit16 v2, v4, 0xff

    .line 109
    .local v2, ton:I
    add-int/lit8 v0, p1, 0x1

    .local v0, i:I
    :goto_16
    add-int v4, p1, p2

    if-ge v0, v4, :cond_5d

    .line 112
    aget-byte v4, p0, v0

    and-int/lit8 v3, v4, 0xf

    .line 113
    .local v3, v:I
    if-ne v3, v7, :cond_55

    .line 114
    const/16 v4, 0x2a

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 115
    const/16 v4, 0x91

    if-ne v2, v4, :cond_35

    add-int/lit8 v4, p1, 0x1

    sub-int v4, v0, v4

    if-le v4, v5, :cond_35

    .line 116
    const/4 v2, 0x0

    .line 117
    const/16 v4, 0x2b

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 126
    :cond_35
    :goto_35
    aget-byte v4, p0, v0

    shr-int/lit8 v4, v4, 0x4

    and-int/lit8 v3, v4, 0xf

    .line 127
    if-ne v3, v7, :cond_69

    .line 128
    const/16 v4, 0x2a

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 129
    const/16 v4, 0x91

    if-ne v2, v4, :cond_52

    add-int/lit8 v4, p1, 0x1

    sub-int v4, v0, v4

    if-le v4, v5, :cond_52

    .line 130
    const/4 v2, 0x0

    .line 131
    const/16 v4, 0x2b

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 109
    :cond_52
    :goto_52
    add-int/lit8 v0, v0, 0x1

    goto :goto_16

    .line 119
    :cond_55
    if-ne v3, v8, :cond_5b

    .line 120
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_35

    .line 122
    :cond_5b
    if-le v3, v6, :cond_62

    .line 142
    .end local v3           #v:I
    :cond_5d
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 123
    .restart local v3       #v:I
    :cond_62
    add-int/lit8 v4, v3, 0x30

    int-to-char v4, v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_35

    .line 133
    :cond_69
    if-ne v3, v8, :cond_6f

    .line 134
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_52

    .line 136
    :cond_6f
    if-gt v3, v6, :cond_5d

    .line 137
    add-int/lit8 v4, v3, 0x30

    int-to-char v4, v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_52
.end method

.method public static SetupCallbcdToString([BII)Ljava/lang/String;
    .registers 13
    .parameter "data"
    .parameter "offset"
    .parameter "length"

    .prologue
    const/16 v9, 0x23

    const/16 v8, 0xc

    const/16 v7, 0xb

    const/16 v6, 0xa

    const/16 v5, 0x9

    .line 68
    new-instance v1, Ljava/lang/StringBuilder;

    mul-int/lit8 v4, p2, 0x2

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 70
    .local v1, ret:Ljava/lang/StringBuilder;
    aget-byte v4, p0, p1

    and-int/lit16 v2, v4, 0xff

    .line 71
    .local v2, ton:I
    const/16 v4, 0x91

    if-ne v2, v4, :cond_1e

    const/16 v4, 0x2b

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 73
    :cond_1e
    add-int/lit8 v0, p1, 0x1

    .local v0, i:I
    :goto_20
    add-int v4, p1, p2

    if-ge v0, v4, :cond_4f

    .line 76
    aget-byte v4, p0, v0

    and-int/lit8 v3, v4, 0xf

    .line 77
    .local v3, v:I
    if-ne v3, v6, :cond_3f

    .line 78
    const/16 v4, 0x2a

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 88
    :goto_2f
    aget-byte v4, p0, v0

    shr-int/lit8 v4, v4, 0x4

    and-int/lit8 v3, v4, 0xf

    .line 89
    if-ne v3, v6, :cond_5b

    .line 90
    const/16 v4, 0x2a

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 73
    :goto_3c
    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    .line 79
    :cond_3f
    if-ne v3, v7, :cond_45

    .line 80
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2f

    .line 81
    :cond_45
    if-ne v3, v8, :cond_4d

    .line 82
    const/16 v4, 0x2c

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2f

    .line 84
    :cond_4d
    if-le v3, v5, :cond_54

    .line 100
    .end local v3           #v:I
    :cond_4f
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 85
    .restart local v3       #v:I
    :cond_54
    add-int/lit8 v4, v3, 0x30

    int-to-char v4, v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2f

    .line 91
    :cond_5b
    if-ne v3, v7, :cond_61

    .line 92
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3c

    .line 93
    :cond_61
    if-ne v3, v8, :cond_69

    .line 94
    const/16 v4, 0x2c

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3c

    .line 96
    :cond_69
    if-gt v3, v5, :cond_4f

    .line 97
    add-int/lit8 v4, v3, 0x30

    int-to-char v4, v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_3c
.end method

.method public static SetupIMSIbcdToString([BII)Ljava/lang/String;
    .registers 12
    .parameter "data"
    .parameter "offset"
    .parameter "length"

    .prologue
    const/16 v8, 0x2a

    const/16 v7, 0x23

    const/16 v6, 0xc

    const/16 v5, 0xb

    const/16 v4, 0xa

    .line 884
    new-instance v1, Ljava/lang/StringBuilder;

    mul-int/lit8 v3, p2, 0x2

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 886
    .local v1, ret:Ljava/lang/StringBuilder;
    add-int/lit8 v0, p1, 0x1

    .local v0, i:I
    :goto_13
    add-int v3, p1, p2

    if-ge v0, v3, :cond_61

    .line 889
    aget-byte v3, p0, v0

    and-int/lit8 v2, v3, 0xf

    .line 890
    .local v2, v:I
    if-ne v2, v4, :cond_2e

    .line 891
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 900
    :goto_20
    aget-byte v3, p0, v0

    shr-int/lit8 v3, v3, 0x4

    and-int/lit8 v2, v3, 0xf

    .line 901
    if-ne v2, v4, :cond_43

    .line 902
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 886
    :goto_2b
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 892
    :cond_2e
    if-ne v2, v5, :cond_34

    .line 893
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_20

    .line 894
    :cond_34
    if-ne v2, v6, :cond_3c

    .line 895
    const/16 v3, 0x50

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_20

    .line 897
    :cond_3c
    add-int/lit8 v3, v2, 0x30

    int-to-char v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_20

    .line 903
    :cond_43
    if-ne v2, v5, :cond_49

    .line 904
    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2b

    .line 905
    :cond_49
    if-ne v2, v6, :cond_51

    .line 906
    const/16 v3, 0x50

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2b

    .line 907
    :cond_51
    const/16 v3, 0xf

    if-ne v2, v3, :cond_5a

    .line 908
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2b

    .line 910
    :cond_5a
    add-int/lit8 v3, v2, 0x30

    int-to-char v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2b

    .line 913
    .end local v2           #v:I
    :cond_61
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static SetupMDNbcdToString([BII)Ljava/lang/String;
    .registers 12
    .parameter "data"
    .parameter "offset"
    .parameter "length"

    .prologue
    const/16 v8, 0x23

    const/16 v7, 0xc

    const/16 v6, 0xb

    const/16 v5, 0xa

    const/16 v4, 0x9

    .line 843
    new-instance v1, Ljava/lang/StringBuilder;

    mul-int/lit8 v3, p2, 0x2

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 845
    .local v1, ret:Ljava/lang/StringBuilder;
    add-int/lit8 v0, p1, 0x1

    .local v0, i:I
    :goto_13
    add-int v3, p1, p2

    if-ge v0, v3, :cond_42

    .line 848
    aget-byte v3, p0, v0

    and-int/lit8 v2, v3, 0xf

    .line 849
    .local v2, v:I
    if-ne v2, v5, :cond_32

    .line 850
    const/16 v3, 0x30

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 860
    :goto_22
    aget-byte v3, p0, v0

    shr-int/lit8 v3, v3, 0x4

    and-int/lit8 v2, v3, 0xf

    .line 861
    if-ne v2, v5, :cond_5d

    .line 862
    const/16 v3, 0x30

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 845
    :goto_2f
    add-int/lit8 v0, v0, 0x1

    goto :goto_13

    .line 851
    :cond_32
    if-ne v2, v6, :cond_3a

    .line 852
    const/16 v3, 0x2a

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_22

    .line 853
    :cond_3a
    if-ne v2, v7, :cond_40

    .line 854
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_22

    .line 856
    :cond_40
    if-le v2, v4, :cond_56

    .line 874
    .end local v2           #v:I
    :cond_42
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-le v3, p2, :cond_74

    .line 875
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 877
    :goto_55
    return-object v3

    .line 857
    .restart local v2       #v:I
    :cond_56
    add-int/lit8 v3, v2, 0x30

    int-to-char v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_22

    .line 863
    :cond_5d
    if-ne v2, v6, :cond_65

    .line 864
    const/16 v3, 0x2a

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2f

    .line 865
    :cond_65
    if-ne v2, v7, :cond_6b

    .line 866
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2f

    .line 868
    :cond_6b
    if-gt v2, v4, :cond_42

    .line 869
    add-int/lit8 v3, v2, 0x30

    int-to-char v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2f

    .line 877
    .end local v2           #v:I
    :cond_74
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_55
.end method

.method public static adnStringFieldToString([BII)Ljava/lang/String;
    .registers 16
    .parameter "data"
    .parameter "offset"
    .parameter "length"

    .prologue
    .line 288
    if-nez p2, :cond_5

    .line 289
    const-string v10, ""

    .line 374
    :goto_4
    return-object v10

    .line 291
    :cond_5
    const/4 v10, 0x1

    if-lt p2, v10, :cond_44

    .line 292
    aget-byte v10, p0, p1

    const/16 v11, -0x80

    if-ne v10, v11, :cond_44

    .line 293
    add-int/lit8 v10, p2, -0x1

    div-int/lit8 v9, v10, 0x2

    .line 294
    .local v9, ucslen:I
    const/4 v7, 0x0

    .line 297
    .local v7, ret:Ljava/lang/String;
    :try_start_13
    new-instance v8, Ljava/lang/String;

    add-int/lit8 v10, p1, 0x1

    mul-int/lit8 v11, v9, 0x2

    const-string v12, "utf-16be"

    invoke-direct {v8, p0, v10, v11, v12}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_1e
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_13 .. :try_end_1e} :catch_35

    .end local v7           #ret:Ljava/lang/String;
    .local v8, ret:Ljava/lang/String;
    move-object v7, v8

    .line 303
    .end local v8           #ret:Ljava/lang/String;
    .restart local v7       #ret:Ljava/lang/String;
    :goto_1f
    if-eqz v7, :cond_44

    .line 306
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v9

    .line 307
    :goto_25
    if-lez v9, :cond_3e

    add-int/lit8 v10, v9, -0x1

    invoke-virtual {v7, v10}, Ljava/lang/String;->charAt(I)C

    move-result v10

    const v11, 0xffff

    if-ne v10, v11, :cond_3e

    .line 308
    add-int/lit8 v9, v9, -0x1

    goto :goto_25

    .line 298
    :catch_35
    move-exception v3

    .line 299
    .local v3, ex:Ljava/io/UnsupportedEncodingException;
    const-string v10, "IccUtils"

    const-string v11, "implausible UnsupportedEncodingException"

    invoke-static {v10, v11, v3}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1f

    .line 310
    .end local v3           #ex:Ljava/io/UnsupportedEncodingException;
    :cond_3e
    const/4 v10, 0x0

    invoke-virtual {v7, v10, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    goto :goto_4

    .line 315
    .end local v7           #ret:Ljava/lang/String;
    .end local v9           #ucslen:I
    :cond_44
    const/4 v4, 0x0

    .line 316
    .local v4, isucs2:Z
    const/4 v0, 0x0

    .line 317
    .local v0, base:C
    const/4 v5, 0x0

    .line 319
    .local v5, len:I
    const/4 v10, 0x3

    if-lt p2, v10, :cond_8e

    aget-byte v10, p0, p1

    const/16 v11, -0x7f

    if-ne v10, v11, :cond_8e

    .line 320
    add-int/lit8 v10, p1, 0x1

    aget-byte v10, p0, v10

    and-int/lit16 v5, v10, 0xff

    .line 321
    add-int/lit8 v10, p2, -0x3

    if-le v5, v10, :cond_5c

    .line 322
    add-int/lit8 v5, p2, -0x3

    .line 324
    :cond_5c
    add-int/lit8 v10, p1, 0x2

    aget-byte v10, p0, v10

    and-int/lit16 v10, v10, 0xff

    shl-int/lit8 v10, v10, 0x7

    int-to-char v0, v10

    .line 325
    add-int/lit8 p1, p1, 0x3

    .line 326
    const/4 v4, 0x1

    .line 338
    :cond_68
    :goto_68
    if-eqz v4, :cond_c7

    .line 339
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 341
    .local v7, ret:Ljava/lang/StringBuilder;
    :goto_6f
    if-lez v5, :cond_c1

    .line 344
    aget-byte v10, p0, p1

    if-gez v10, :cond_82

    .line 345
    aget-byte v10, p0, p1

    and-int/lit8 v10, v10, 0x7f

    add-int/2addr v10, v0

    int-to-char v10, v10

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 346
    add-int/lit8 p1, p1, 0x1

    .line 347
    add-int/lit8 v5, v5, -0x1

    .line 352
    :cond_82
    const/4 v1, 0x0

    .line 353
    .local v1, count:I
    :goto_83
    if-ge v1, v5, :cond_b7

    add-int v10, p1, v1

    aget-byte v10, p0, v10

    if-ltz v10, :cond_b7

    .line 354
    add-int/lit8 v1, v1, 0x1

    goto :goto_83

    .line 327
    .end local v1           #count:I
    .end local v7           #ret:Ljava/lang/StringBuilder;
    :cond_8e
    const/4 v10, 0x4

    if-lt p2, v10, :cond_68

    aget-byte v10, p0, p1

    const/16 v11, -0x7e

    if-ne v10, v11, :cond_68

    .line 328
    add-int/lit8 v10, p1, 0x1

    aget-byte v10, p0, v10

    and-int/lit16 v5, v10, 0xff

    .line 329
    add-int/lit8 v10, p2, -0x4

    if-le v5, v10, :cond_a3

    .line 330
    add-int/lit8 v5, p2, -0x4

    .line 332
    :cond_a3
    add-int/lit8 v10, p1, 0x2

    aget-byte v10, p0, v10

    and-int/lit16 v10, v10, 0xff

    shl-int/lit8 v10, v10, 0x8

    add-int/lit8 v11, p1, 0x3

    aget-byte v11, p0, v11

    and-int/lit16 v11, v11, 0xff

    or-int/2addr v10, v11

    int-to-char v0, v10

    .line 334
    add-int/lit8 p1, p1, 0x4

    .line 335
    const/4 v4, 0x1

    goto :goto_68

    .line 356
    .restart local v1       #count:I
    .restart local v7       #ret:Ljava/lang/StringBuilder;
    :cond_b7
    invoke-static {p0, p1, v1}, Lcom/android/internal/telephony/GsmAlphabet;->gsm8BitUnpackedToString([BII)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 359
    add-int/2addr p1, v1

    .line 360
    sub-int/2addr v5, v1

    .line 361
    goto :goto_6f

    .line 363
    .end local v1           #count:I
    :cond_c1
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    goto/16 :goto_4

    .line 366
    .end local v7           #ret:Ljava/lang/StringBuilder;
    :cond_c7
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v6

    .line 367
    .local v6, resource:Landroid/content/res/Resources;
    const-string v2, ""

    .line 369
    .local v2, defaultCharset:Ljava/lang/String;
    const v10, 0x1040061

    :try_start_d0
    invoke-virtual {v6, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;
    :try_end_d3
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_d0 .. :try_end_d3} :catch_de

    move-result-object v2

    .line 374
    :goto_d4
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    invoke-static {p0, p1, p2, v10}, Lcom/android/internal/telephony/GsmAlphabet;->gsm8BitUnpackedToString([BIILjava/lang/String;)Ljava/lang/String;

    move-result-object v10

    goto/16 :goto_4

    .line 371
    :catch_de
    move-exception v10

    goto :goto_d4
.end method

.method public static bcdToString([BII)Ljava/lang/String;
    .registers 8
    .parameter "data"
    .parameter "offset"
    .parameter "length"

    .prologue
    const/16 v4, 0x9

    .line 46
    new-instance v1, Ljava/lang/StringBuilder;

    mul-int/lit8 v3, p2, 0x2

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 48
    .local v1, ret:Ljava/lang/StringBuilder;
    move v0, p1

    .local v0, i:I
    :goto_a
    add-int v3, p1, p2

    if-ge v0, v3, :cond_14

    .line 52
    aget-byte v3, p0, v0

    and-int/lit8 v2, v3, 0xf

    .line 53
    .local v2, v:I
    if-le v2, v4, :cond_19

    .line 63
    .end local v2           #v:I
    :cond_14
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 54
    .restart local v2       #v:I
    :cond_19
    add-int/lit8 v3, v2, 0x30

    int-to-char v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 56
    aget-byte v3, p0, v0

    shr-int/lit8 v3, v3, 0x4

    and-int/lit8 v2, v3, 0xf

    .line 58
    const/16 v3, 0xf

    if-ne v2, v3, :cond_2c

    .line 48
    :goto_29
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 59
    :cond_2c
    if-gt v2, v4, :cond_14

    .line 60
    add-int/lit8 v3, v2, 0x30

    int-to-char v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_29
.end method

.method private static bitToRGB(I)I
    .registers 2
    .parameter "bit"

    .prologue
    .line 551
    const/4 v0, 0x1

    if-ne p0, v0, :cond_5

    .line 552
    const/4 v0, -0x1

    .line 554
    :goto_4
    return v0

    :cond_5
    const/high16 v0, -0x100

    goto :goto_4
.end method

.method public static byteToHexString(B)Ljava/lang/String;
    .registers 4
    .parameter "a"

    .prologue
    .line 451
    new-instance v1, Ljava/lang/StringBuilder;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 456
    .local v1, ret:Ljava/lang/StringBuilder;
    shr-int/lit8 v2, p0, 0x4

    and-int/lit8 v0, v2, 0xf

    .line 458
    .local v0, b:I
    const-string v2, "0123456789abcdef"

    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 460
    and-int/lit8 v0, p0, 0xf

    .line 462
    const-string v2, "0123456789abcdef"

    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 465
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method public static bytesToHexString([B)Ljava/lang/String;
    .registers 5
    .parameter "bytes"

    .prologue
    .line 424
    if-nez p0, :cond_4

    const/4 v3, 0x0

    .line 440
    :goto_3
    return-object v3

    .line 426
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    array-length v3, p0

    mul-int/lit8 v3, v3, 0x2

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 428
    .local v2, ret:Ljava/lang/StringBuilder;
    const/4 v1, 0x0

    .local v1, i:I
    :goto_d
    array-length v3, p0

    if-ge v1, v3, :cond_2f

    .line 431
    aget-byte v3, p0, v1

    shr-int/lit8 v3, v3, 0x4

    and-int/lit8 v0, v3, 0xf

    .line 433
    .local v0, b:I
    const-string v3, "0123456789abcdef"

    invoke-virtual {v3, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 435
    aget-byte v3, p0, v1

    and-int/lit8 v0, v3, 0xf

    .line 437
    const-string v3, "0123456789abcdef"

    invoke-virtual {v3, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 428
    add-int/lit8 v1, v1, 0x1

    goto :goto_d

    .line 440
    .end local v0           #b:I
    :cond_2f
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_3
.end method

.method public static cdmaBcdByteToInt(B)I
    .registers 4
    .parameter "b"

    .prologue
    .line 207
    const/4 v0, 0x0

    .line 210
    .local v0, ret:I
    and-int/lit16 v1, p0, 0xf0

    const/16 v2, 0x90

    if-gt v1, v2, :cond_d

    .line 211
    shr-int/lit8 v1, p0, 0x4

    and-int/lit8 v1, v1, 0xf

    mul-int/lit8 v0, v1, 0xa

    .line 214
    :cond_d
    and-int/lit8 v1, p0, 0xf

    const/16 v2, 0x9

    if-gt v1, v2, :cond_16

    .line 215
    and-int/lit8 v1, p0, 0xf

    add-int/2addr v0, v1

    .line 218
    :cond_16
    return v0
.end method

.method public static cdmaBcdToString([BII)Ljava/lang/String;
    .registers 9
    .parameter "data"
    .parameter "offset"
    .parameter "length"

    .prologue
    const/16 v5, 0x9

    .line 150
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 152
    .local v2, ret:Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .line 153
    .local v0, count:I
    move v1, p1

    .local v1, i:I
    :goto_9
    if-ge v0, p2, :cond_1c

    .line 155
    aget-byte v4, p0, v1

    and-int/lit8 v3, v4, 0xf

    .line 156
    .local v3, v:I
    if-le v3, v5, :cond_12

    const/4 v3, 0x0

    .line 157
    :cond_12
    add-int/lit8 v4, v3, 0x30

    int-to-char v4, v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 159
    add-int/lit8 v0, v0, 0x1

    if-ne v0, p2, :cond_21

    .line 166
    .end local v3           #v:I
    :cond_1c
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4

    .line 161
    .restart local v3       #v:I
    :cond_21
    aget-byte v4, p0, v1

    shr-int/lit8 v4, v4, 0x4

    and-int/lit8 v3, v4, 0xf

    .line 162
    if-le v3, v5, :cond_2a

    const/4 v3, 0x0

    .line 163
    :cond_2a
    add-int/lit8 v4, v3, 0x30

    int-to-char v4, v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 164
    add-int/lit8 v0, v0, 0x1

    .line 153
    add-int/lit8 v1, v1, 0x1

    goto :goto_9
.end method

.method public static cdmaHexByteToInt(B)I
    .registers 4
    .parameter "b"

    .prologue
    .line 223
    const/4 v0, 0x0

    .line 226
    .local v0, ret:I
    and-int/lit16 v1, p0, 0xf0

    const/16 v2, 0xf0

    if-gt v1, v2, :cond_d

    .line 227
    shr-int/lit8 v1, p0, 0x4

    and-int/lit8 v1, v1, 0xf

    mul-int/lit8 v0, v1, 0x10

    .line 230
    :cond_d
    and-int/lit8 v1, p0, 0xf

    const/16 v2, 0xf

    if-gt v1, v2, :cond_16

    .line 231
    and-int/lit8 v1, p0, 0xf

    add-int/2addr v0, v1

    .line 234
    :cond_16
    return v0
.end method

.method public static cdmaIntToBcdByte(I)B
    .registers 4
    .parameter "i"

    .prologue
    .line 239
    const/4 v0, 0x0

    .line 240
    .local v0, ret:B
    div-int/lit8 v1, p0, 0xa

    int-to-byte v1, v1

    and-int/lit16 v1, v1, 0xf0

    const/16 v2, 0x90

    if-gt v1, v2, :cond_f

    .line 241
    div-int/lit8 v1, p0, 0xa

    shl-int/lit8 v1, v1, 0x4

    int-to-byte v0, v1

    .line 244
    :cond_f
    rem-int/lit8 v1, p0, 0xa

    int-to-byte v1, v1

    and-int/lit8 v1, v1, 0xf

    const/16 v2, 0x9

    if-gt v1, v2, :cond_1c

    .line 245
    rem-int/lit8 v1, p0, 0xa

    add-int/2addr v1, v0

    int-to-byte v0, v1

    .line 248
    :cond_1c
    return v0
.end method

.method public static extractIMSI([B)Ljava/lang/String;
    .registers 14
    .parameter "imsi"

    .prologue
    const/16 v12, 0x8

    .line 806
    const-string v8, "IccUtils"

    const-string v9, "Enter extractIMSI"

    invoke-static {v8, v9}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 813
    const/4 v8, 0x5

    aget-byte v8, p0, v8

    invoke-static {v8}, Lcom/android/internal/telephony/uicc/IccUtils;->unsigned32(B)J

    move-result-wide v8

    const/16 v10, 0x10

    shl-long/2addr v8, v10

    const/4 v10, 0x4

    aget-byte v10, p0, v10

    invoke-static {v10}, Lcom/android/internal/telephony/uicc/IccUtils;->unsigned32(B)J

    move-result-wide v10

    shl-long/2addr v10, v12

    or-long/2addr v8, v10

    const/4 v10, 0x3

    aget-byte v10, p0, v10

    invoke-static {v10}, Lcom/android/internal/telephony/uicc/IccUtils;->unsigned32(B)J

    move-result-wide v10

    or-long v2, v8, v10

    .line 814
    .local v2, min1:J
    const/4 v8, 0x2

    aget-byte v8, p0, v8

    invoke-static {v8}, Lcom/android/internal/telephony/uicc/IccUtils;->unsigned32(B)J

    move-result-wide v8

    shl-long/2addr v8, v12

    const/4 v10, 0x1

    aget-byte v10, p0, v10

    invoke-static {v10}, Lcom/android/internal/telephony/uicc/IccUtils;->unsigned32(B)J

    move-result-wide v10

    or-long v4, v8, v10

    .line 815
    .local v4, min2:J
    const/4 v8, 0x6

    aget-byte v8, p0, v8

    invoke-static {v8}, Lcom/android/internal/telephony/uicc/IccUtils;->unsigned32(B)J

    move-result-wide v6

    .line 816
    .local v6, mnc:J
    const/16 v8, 0x9

    aget-byte v8, p0, v8

    invoke-static {v8}, Lcom/android/internal/telephony/uicc/IccUtils;->unsigned32(B)J

    move-result-wide v8

    shl-long/2addr v8, v12

    aget-byte v10, p0, v12

    invoke-static {v10}, Lcom/android/internal/telephony/uicc/IccUtils;->unsigned32(B)J

    move-result-wide v10

    or-long v0, v8, v10

    .line 818
    .local v0, mcc:J
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v0, v1}, Lcom/android/internal/telephony/uicc/IccUtils;->getStringMCC(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v6, v7}, Lcom/android/internal/telephony/uicc/IccUtils;->getStringMNC(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v4, v5}, Lcom/android/internal/telephony/uicc/IccUtils;->getStringMIN2(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {v2, v3}, Lcom/android/internal/telephony/uicc/IccUtils;->getStringMIN1(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    return-object v8
.end method

.method private static getCLUT([BII)[I
    .registers 12
    .parameter "rawData"
    .parameter "offset"
    .parameter "number"

    .prologue
    .line 647
    if-nez p0, :cond_4

    .line 648
    const/4 v4, 0x0

    .line 662
    :cond_3
    return-object v4

    .line 651
    :cond_4
    new-array v4, p2, [I

    .line 652
    .local v4, result:[I
    mul-int/lit8 v7, p2, 0x3

    add-int v3, p1, v7

    .line 653
    .local v3, endIndex:I
    move v5, p1

    .line 654
    .local v5, valueIndex:I
    const/4 v1, 0x0

    .line 655
    .local v1, colorIndex:I
    const/high16 v0, -0x100

    .line 657
    .local v0, alpha:I
    :goto_e
    add-int/lit8 v2, v1, 0x1

    .end local v1           #colorIndex:I
    .local v2, colorIndex:I
    add-int/lit8 v6, v5, 0x1

    .end local v5           #valueIndex:I
    .local v6, valueIndex:I
    aget-byte v7, p0, v5

    and-int/lit16 v7, v7, 0xff

    shl-int/lit8 v7, v7, 0x10

    or-int/2addr v7, v0

    add-int/lit8 v5, v6, 0x1

    .end local v6           #valueIndex:I
    .restart local v5       #valueIndex:I
    aget-byte v8, p0, v6

    and-int/lit16 v8, v8, 0xff

    shl-int/lit8 v8, v8, 0x8

    or-int/2addr v7, v8

    add-int/lit8 v6, v5, 0x1

    .end local v5           #valueIndex:I
    .restart local v6       #valueIndex:I
    aget-byte v8, p0, v5

    and-int/lit16 v8, v8, 0xff

    or-int/2addr v7, v8

    aput v7, v4, v1

    .line 661
    if-ge v6, v3, :cond_3

    move v1, v2

    .end local v2           #colorIndex:I
    .restart local v1       #colorIndex:I
    move v5, v6

    .end local v6           #valueIndex:I
    .restart local v5       #valueIndex:I
    goto :goto_e
.end method

.method private static getStringMCC(J)Ljava/lang/String;
    .registers 15
    .parameter "mcc"

    .prologue
    const-wide/16 v11, 0x64

    const-wide/16 v9, 0x31

    const-wide/16 v3, 0x30

    const-wide/16 v7, 0x9

    const-wide/16 v5, 0xa

    .line 730
    new-instance v0, Ljava/lang/StringBuilder;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 732
    .local v0, strMCC:Ljava/lang/StringBuilder;
    const-wide/16 v1, 0x3e8

    rem-long/2addr p0, v1

    .line 733
    div-long v1, p0, v11

    cmp-long v1, v1, v7

    if-nez v1, :cond_3c

    move-wide v1, v3

    :goto_1a
    long-to-int v1, v1

    int-to-char v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 734
    rem-long/2addr p0, v11

    .line 735
    div-long v1, p0, v5

    cmp-long v1, v1, v7

    if-nez v1, :cond_40

    move-wide v1, v3

    :goto_27
    long-to-int v1, v1

    int-to-char v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 736
    rem-long v1, p0, v5

    cmp-long v1, v1, v7

    if-nez v1, :cond_44

    :goto_32
    long-to-int v1, v3

    int-to-char v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 738
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 733
    :cond_3c
    div-long v1, p0, v11

    add-long/2addr v1, v9

    goto :goto_1a

    .line 735
    :cond_40
    div-long v1, p0, v5

    add-long/2addr v1, v9

    goto :goto_27

    .line 736
    :cond_44
    rem-long v1, p0, v5

    add-long v3, v1, v9

    goto :goto_32
.end method

.method private static getStringMIN1(J)Ljava/lang/String;
    .registers 9
    .parameter "min1"

    .prologue
    .line 755
    new-instance v2, Ljava/lang/StringBuilder;

    const/4 v3, 0x7

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 758
    .local v2, strMIN1:Ljava/lang/StringBuilder;
    const-wide/16 v3, 0x0

    cmp-long v3, p0, v3

    if-nez v3, :cond_1d

    .line 759
    const-wide/16 v0, 0x0

    .local v0, i:J
    :goto_e
    const-wide/16 v3, 0x7

    cmp-long v3, v0, v3

    if-gez v3, :cond_af

    .line 760
    const/16 v3, 0x30

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 759
    const-wide/16 v3, 0x1

    add-long/2addr v0, v3

    goto :goto_e

    .line 765
    .end local v0           #i:J
    :cond_1d
    const/16 v3, 0xe

    shr-long v0, p0, v3

    .line 766
    .restart local v0       #i:J
    const-wide/16 v3, 0x3e8

    rem-long/2addr v0, v3

    .line 767
    const-wide/16 v3, 0x64

    div-long v3, v0, v3

    const-wide/16 v5, 0x9

    cmp-long v3, v3, v5

    if-nez v3, :cond_b4

    const-wide/16 v3, 0x30

    :goto_30
    long-to-int v3, v3

    int-to-char v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 768
    const-wide/16 v3, 0x64

    rem-long/2addr v0, v3

    .line 769
    const-wide/16 v3, 0xa

    div-long v3, v0, v3

    const-wide/16 v5, 0x9

    cmp-long v3, v3, v5

    if-nez v3, :cond_bd

    const-wide/16 v3, 0x30

    :goto_44
    long-to-int v3, v3

    int-to-char v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 770
    const-wide/16 v3, 0xa

    rem-long v3, v0, v3

    const-wide/16 v5, 0x9

    cmp-long v3, v3, v5

    if-nez v3, :cond_c5

    const-wide/16 v3, 0x30

    :goto_55
    long-to-int v3, v3

    int-to-char v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 772
    const-wide/16 v3, 0x3fff

    and-long/2addr p0, v3

    .line 774
    const/16 v3, 0xa

    shr-long v3, p0, v3

    const-wide/16 v5, 0xf

    and-long v0, v3, v5

    .line 775
    const-wide/16 v3, 0xa

    cmp-long v3, v0, v3

    if-nez v3, :cond_cd

    const-wide/16 v3, 0x30

    :goto_6d
    long-to-int v3, v3

    int-to-char v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 777
    const-wide/16 v3, 0x3ff

    and-long v0, p0, v3

    .line 778
    const-wide/16 v3, 0x3e8

    rem-long/2addr v0, v3

    .line 779
    const-wide/16 v3, 0x64

    div-long v3, v0, v3

    const-wide/16 v5, 0x9

    cmp-long v3, v3, v5

    if-nez v3, :cond_d1

    const-wide/16 v3, 0x30

    :goto_85
    long-to-int v3, v3

    int-to-char v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 780
    const-wide/16 v3, 0x64

    rem-long/2addr v0, v3

    .line 784
    const-wide/16 v3, 0xa

    div-long v3, v0, v3

    const-wide/16 v5, 0x9

    cmp-long v3, v3, v5

    if-nez v3, :cond_d9

    const-wide/16 v3, 0x30

    :goto_99
    long-to-int v3, v3

    int-to-char v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 785
    const-wide/16 v3, 0xa

    rem-long v3, v0, v3

    const-wide/16 v5, 0x9

    cmp-long v3, v3, v5

    if-nez v3, :cond_e1

    const-wide/16 v3, 0x30

    :goto_aa
    long-to-int v3, v3

    int-to-char v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 788
    :cond_af
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 767
    :cond_b4
    const-wide/16 v3, 0x64

    div-long v3, v0, v3

    const-wide/16 v5, 0x31

    add-long/2addr v3, v5

    goto/16 :goto_30

    .line 769
    :cond_bd
    const-wide/16 v3, 0xa

    div-long v3, v0, v3

    const-wide/16 v5, 0x31

    add-long/2addr v3, v5

    goto :goto_44

    .line 770
    :cond_c5
    const-wide/16 v3, 0xa

    rem-long v3, v0, v3

    const-wide/16 v5, 0x31

    add-long/2addr v3, v5

    goto :goto_55

    .line 775
    :cond_cd
    const-wide/16 v3, 0x30

    add-long/2addr v3, v0

    goto :goto_6d

    .line 779
    :cond_d1
    const-wide/16 v3, 0x64

    div-long v3, v0, v3

    const-wide/16 v5, 0x31

    add-long/2addr v3, v5

    goto :goto_85

    .line 784
    :cond_d9
    const-wide/16 v3, 0xa

    div-long v3, v0, v3

    const-wide/16 v5, 0x31

    add-long/2addr v3, v5

    goto :goto_99

    .line 785
    :cond_e1
    const-wide/16 v3, 0xa

    rem-long v3, v0, v3

    const-wide/16 v5, 0x31

    add-long/2addr v3, v5

    goto :goto_aa
.end method

.method private static getStringMIN2(J)Ljava/lang/String;
    .registers 15
    .parameter "min2"

    .prologue
    const-wide/16 v11, 0x64

    const-wide/16 v9, 0x31

    const-wide/16 v3, 0x30

    const-wide/16 v7, 0x9

    const-wide/16 v5, 0xa

    .line 793
    new-instance v0, Ljava/lang/StringBuilder;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 795
    .local v0, strMIN2:Ljava/lang/StringBuilder;
    const-wide/16 v1, 0x3e8

    rem-long/2addr p0, v1

    .line 796
    div-long v1, p0, v11

    cmp-long v1, v1, v7

    if-nez v1, :cond_3c

    move-wide v1, v3

    :goto_1a
    long-to-int v1, v1

    int-to-char v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 797
    rem-long/2addr p0, v11

    .line 798
    div-long v1, p0, v5

    cmp-long v1, v1, v7

    if-nez v1, :cond_40

    move-wide v1, v3

    :goto_27
    long-to-int v1, v1

    int-to-char v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 799
    rem-long v1, p0, v5

    cmp-long v1, v1, v7

    if-nez v1, :cond_44

    :goto_32
    long-to-int v1, v3

    int-to-char v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 801
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 796
    :cond_3c
    div-long v1, p0, v11

    add-long/2addr v1, v9

    goto :goto_1a

    .line 798
    :cond_40
    div-long v1, p0, v5

    add-long/2addr v1, v9

    goto :goto_27

    .line 799
    :cond_44
    rem-long v1, p0, v5

    add-long v3, v1, v9

    goto :goto_32
.end method

.method private static getStringMNC(J)Ljava/lang/String;
    .registers 13
    .parameter "mnc"

    .prologue
    const-wide/16 v9, 0x31

    const-wide/16 v3, 0x30

    const-wide/16 v7, 0x9

    const-wide/16 v5, 0xa

    .line 743
    new-instance v0, Ljava/lang/StringBuilder;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 745
    .local v0, strMNC:Ljava/lang/StringBuilder;
    const-wide/16 v1, 0x64

    rem-long/2addr p0, v1

    .line 747
    div-long v1, p0, v5

    cmp-long v1, v1, v7

    if-nez v1, :cond_2d

    move-wide v1, v3

    :goto_18
    long-to-int v1, v1

    int-to-char v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 748
    rem-long v1, p0, v5

    cmp-long v1, v1, v7

    if-nez v1, :cond_31

    :goto_23
    long-to-int v1, v3

    int-to-char v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 750
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 747
    :cond_2d
    div-long v1, p0, v5

    add-long/2addr v1, v9

    goto :goto_18

    .line 748
    :cond_31
    rem-long v1, p0, v5

    add-long v3, v1, v9

    goto :goto_23
.end method

.method public static gsmBcdByteToInt(B)I
    .registers 4
    .parameter "b"

    .prologue
    .line 185
    const/4 v0, 0x0

    .line 188
    .local v0, ret:I
    and-int/lit16 v1, p0, 0xf0

    const/16 v2, 0x90

    if-gt v1, v2, :cond_b

    .line 189
    shr-int/lit8 v1, p0, 0x4

    and-int/lit8 v0, v1, 0xf

    .line 192
    :cond_b
    and-int/lit8 v1, p0, 0xf

    const/16 v2, 0x9

    if-gt v1, v2, :cond_16

    .line 193
    and-int/lit8 v1, p0, 0xf

    mul-int/lit8 v1, v1, 0xa

    add-int/2addr v0, v1

    .line 196
    :cond_16
    return v0
.end method

.method static hexCharToInt(C)I
    .registers 4
    .parameter "c"

    .prologue
    .line 379
    const/16 v0, 0x30

    if-lt p0, v0, :cond_b

    const/16 v0, 0x39

    if-gt p0, v0, :cond_b

    add-int/lit8 v0, p0, -0x30

    .line 381
    :goto_a
    return v0

    .line 380
    :cond_b
    const/16 v0, 0x41

    if-lt p0, v0, :cond_18

    const/16 v0, 0x46

    if-gt p0, v0, :cond_18

    add-int/lit8 v0, p0, -0x41

    add-int/lit8 v0, v0, 0xa

    goto :goto_a

    .line 381
    :cond_18
    const/16 v0, 0x61

    if-lt p0, v0, :cond_25

    const/16 v0, 0x66

    if-gt p0, v0, :cond_25

    add-int/lit8 v0, p0, -0x61

    add-int/lit8 v0, v0, 0xa

    goto :goto_a

    .line 383
    :cond_25
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid hex char \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static hexStringToBytes(Ljava/lang/String;)[B
    .registers 7
    .parameter "s"

    .prologue
    .line 400
    if-nez p0, :cond_4

    const/4 v1, 0x0

    .line 411
    :cond_3
    return-object v1

    .line 402
    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 404
    .local v2, sz:I
    div-int/lit8 v3, v2, 0x2

    new-array v1, v3, [B

    .line 406
    .local v1, ret:[B
    const/4 v0, 0x0

    .local v0, i:I
    :goto_d
    if-ge v0, v2, :cond_3

    .line 407
    div-int/lit8 v3, v0, 0x2

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lcom/android/internal/telephony/uicc/IccUtils;->hexCharToInt(C)I

    move-result v4

    shl-int/lit8 v4, v4, 0x4

    add-int/lit8 v5, v0, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lcom/android/internal/telephony/uicc/IccUtils;->hexCharToInt(C)I

    move-result v5

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v1, v3

    .line 406
    add-int/lit8 v0, v0, 0x2

    goto :goto_d
.end method

.method private static mapTo2OrderBitColor([BII[II)[I
    .registers 16
    .parameter "data"
    .parameter "valueIndex"
    .parameter "length"
    .parameter "colorArray"
    .parameter "bits"

    .prologue
    const/16 v10, 0x8

    .line 597
    rem-int v9, v10, p4

    if-eqz v9, :cond_12

    .line 598
    const-string v9, "IccUtils"

    const-string v10, "not event number of color"

    invoke-static {v9, v10}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 599
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/internal/telephony/uicc/IccUtils;->mapToNon2OrderBitColor([BII[II)[I

    move-result-object v2

    .line 630
    :goto_11
    return-object v2

    .line 603
    :cond_12
    const/4 v0, 0x1

    .line 604
    .local v0, mask:I
    packed-switch p4, :pswitch_data_48

    .line 619
    :goto_16
    :pswitch_16
    new-array v2, p2, [I

    .line 620
    .local v2, resultArray:[I
    const/4 v3, 0x0

    .line 621
    .local v3, resultIndex:I
    div-int v5, v10, p4

    .local v5, run:I
    move v8, p1

    .line 622
    .end local p1
    .local v8, valueIndex:I
    :goto_1c
    if-ge v3, p2, :cond_46

    .line 623
    add-int/lit8 p1, v8, 0x1

    .end local v8           #valueIndex:I
    .restart local p1
    aget-byte v7, p0, v8

    .line 624
    .local v7, tempByte:B
    const/4 v6, 0x0

    .local v6, runIndex:I
    move v4, v3

    .end local v3           #resultIndex:I
    .local v4, resultIndex:I
    :goto_24
    if-ge v6, v5, :cond_43

    .line 625
    sub-int v9, v5, v6

    add-int/lit8 v1, v9, -0x1

    .line 626
    .local v1, offset:I
    add-int/lit8 v3, v4, 0x1

    .end local v4           #resultIndex:I
    .restart local v3       #resultIndex:I
    mul-int v9, v1, p4

    shr-int v9, v7, v9

    and-int/2addr v9, v0

    aget v9, p3, v9

    aput v9, v2, v4

    .line 624
    add-int/lit8 v6, v6, 0x1

    move v4, v3

    .end local v3           #resultIndex:I
    .restart local v4       #resultIndex:I
    goto :goto_24

    .line 606
    .end local v1           #offset:I
    .end local v2           #resultArray:[I
    .end local v4           #resultIndex:I
    .end local v5           #run:I
    .end local v6           #runIndex:I
    .end local v7           #tempByte:B
    :pswitch_39
    const/4 v0, 0x1

    .line 607
    goto :goto_16

    .line 609
    :pswitch_3b
    const/4 v0, 0x3

    .line 610
    goto :goto_16

    .line 612
    :pswitch_3d
    const/16 v0, 0xf

    .line 613
    goto :goto_16

    .line 615
    :pswitch_40
    const/16 v0, 0xff

    goto :goto_16

    .restart local v2       #resultArray:[I
    .restart local v4       #resultIndex:I
    .restart local v5       #run:I
    .restart local v6       #runIndex:I
    .restart local v7       #tempByte:B
    :cond_43
    move v3, v4

    .end local v4           #resultIndex:I
    .restart local v3       #resultIndex:I
    move v8, p1

    .line 629
    .end local p1
    .restart local v8       #valueIndex:I
    goto :goto_1c

    .end local v6           #runIndex:I
    .end local v7           #tempByte:B
    :cond_46
    move p1, v8

    .line 630
    .end local v8           #valueIndex:I
    .restart local p1
    goto :goto_11

    .line 604
    :pswitch_data_48
    .packed-switch 0x1
        :pswitch_39
        :pswitch_3b
        :pswitch_16
        :pswitch_3d
        :pswitch_16
        :pswitch_16
        :pswitch_16
        :pswitch_40
    .end packed-switch
.end method

.method private static mapToNon2OrderBitColor([BII[II)[I
    .registers 8
    .parameter "data"
    .parameter "valueIndex"
    .parameter "length"
    .parameter "colorArray"
    .parameter "bits"

    .prologue
    .line 635
    const/16 v1, 0x8

    rem-int/2addr v1, p4

    if-nez v1, :cond_11

    .line 636
    const-string v1, "IccUtils"

    const-string v2, "not odd number of color"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 637
    invoke-static {p0, p1, p2, p3, p4}, Lcom/android/internal/telephony/uicc/IccUtils;->mapTo2OrderBitColor([BII[II)[I

    move-result-object v0

    .line 643
    :goto_10
    return-object v0

    .line 641
    :cond_11
    new-array v0, p2, [I

    .line 643
    .local v0, resultArray:[I
    goto :goto_10
.end method

.method public static networkNameToString([BII)Ljava/lang/String;
    .registers 10
    .parameter "data"
    .parameter "offset"
    .parameter "length"

    .prologue
    .line 477
    aget-byte v4, p0, p1

    and-int/lit16 v4, v4, 0x80

    const/16 v5, 0x80

    if-ne v4, v5, :cond_b

    const/4 v4, 0x1

    if-ge p2, v4, :cond_e

    .line 478
    :cond_b
    const-string v2, ""

    .line 515
    :cond_d
    :goto_d
    return-object v2

    .line 481
    :cond_e
    aget-byte v4, p0, p1

    ushr-int/lit8 v4, v4, 0x4

    and-int/lit8 v4, v4, 0x7

    packed-switch v4, :pswitch_data_4a

    .line 502
    const-string v2, ""

    .line 510
    .local v2, ret:Ljava/lang/String;
    :goto_19
    aget-byte v4, p0, p1

    and-int/lit8 v4, v4, 0x40

    if-eqz v4, :cond_d

    goto :goto_d

    .line 485
    .end local v2           #ret:Ljava/lang/String;
    :pswitch_20
    aget-byte v4, p0, p1

    and-int/lit8 v3, v4, 0x7

    .line 486
    .local v3, unusedBits:I
    add-int/lit8 v4, p2, -0x1

    mul-int/lit8 v4, v4, 0x8

    sub-int/2addr v4, v3

    div-int/lit8 v0, v4, 0x7

    .line 487
    .local v0, countSeptets:I
    add-int/lit8 v4, p1, 0x1

    invoke-static {p0, v4, v0}, Lcom/android/internal/telephony/GsmAlphabet;->gsm7BitPackedToString([BII)Ljava/lang/String;

    move-result-object v2

    .line 488
    .restart local v2       #ret:Ljava/lang/String;
    goto :goto_19

    .line 492
    .end local v0           #countSeptets:I
    .end local v2           #ret:Ljava/lang/String;
    .end local v3           #unusedBits:I
    :pswitch_32
    :try_start_32
    new-instance v2, Ljava/lang/String;

    add-int/lit8 v4, p1, 0x1

    add-int/lit8 v5, p2, -0x1

    const-string v6, "utf-16"

    invoke-direct {v2, p0, v4, v5, v6}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_3d
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_32 .. :try_end_3d} :catch_3e

    .restart local v2       #ret:Ljava/lang/String;
    goto :goto_19

    .line 494
    .end local v2           #ret:Ljava/lang/String;
    :catch_3e
    move-exception v1

    .line 495
    .local v1, ex:Ljava/io/UnsupportedEncodingException;
    const-string v2, ""

    .line 496
    .restart local v2       #ret:Ljava/lang/String;
    const-string v4, "IccUtils"

    const-string v5, "implausible UnsupportedEncodingException"

    invoke-static {v4, v5, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_19

    .line 481
    nop

    :pswitch_data_4a
    .packed-switch 0x0
        :pswitch_20
        :pswitch_32
    .end packed-switch
.end method

.method public static parseIccIdToString([BII)Ljava/lang/String;
    .registers 8
    .parameter "data"
    .parameter "offset"
    .parameter "length"

    .prologue
    const/16 v4, 0x9

    new-instance v1, Ljava/lang/StringBuilder;

    mul-int/lit8 v3, p2, 0x2

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .local v1, ret:Ljava/lang/StringBuilder;
    move v0, p1

    .local v0, i:I
    :goto_a
    add-int v3, p1, p2

    if-ge v0, v3, :cond_41

    aget-byte v3, p0, v0

    and-int/lit8 v2, v3, 0xf

    .local v2, v:I
    if-ltz v2, :cond_2f

    if-gt v2, v4, :cond_2f

    add-int/lit8 v3, v2, 0x30

    int-to-char v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_1c
    aget-byte v3, p0, v0

    shr-int/lit8 v3, v3, 0x4

    and-int/lit8 v2, v3, 0xf

    if-ltz v2, :cond_38

    if-gt v2, v4, :cond_38

    add-int/lit8 v3, v2, 0x30

    int-to-char v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_2c
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    :cond_2f
    add-int/lit8 v3, v2, 0x61

    add-int/lit8 v3, v3, -0xa

    int-to-char v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1c

    :cond_38
    add-int/lit8 v3, v2, 0x61

    add-int/lit8 v3, v3, -0xa

    int-to-char v3, v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2c

    .end local v2           #v:I
    :cond_41
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static parseToBnW([BI)Landroid/graphics/Bitmap;
    .registers 15
    .parameter "data"
    .parameter "length"

    .prologue
    .line 525
    const/4 v8, 0x0

    .line 526
    .local v8, valueIndex:I
    add-int/lit8 v9, v8, 0x1

    .end local v8           #valueIndex:I
    .local v9, valueIndex:I
    aget-byte v11, p0, v8

    and-int/lit16 v10, v11, 0xff

    .line 527
    .local v10, width:I
    add-int/lit8 v8, v9, 0x1

    .end local v9           #valueIndex:I
    .restart local v8       #valueIndex:I
    aget-byte v11, p0, v9

    and-int/lit16 v3, v11, 0xff

    .line 528
    .local v3, height:I
    mul-int v4, v10, v3

    .line 530
    .local v4, numOfPixels:I
    new-array v7, v4, [I

    .line 532
    .local v7, pixels:[I
    const/4 v5, 0x0

    .line 533
    .local v5, pixelIndex:I
    const/4 v0, 0x7

    .line 534
    .local v0, bitIndex:I
    const/4 v2, 0x0

    .local v2, currentByte:B
    move v6, v5

    .end local v5           #pixelIndex:I
    .local v6, pixelIndex:I
    move v9, v8

    .line 535
    .end local v8           #valueIndex:I
    .restart local v9       #valueIndex:I
    :goto_16
    if-ge v6, v4, :cond_33

    .line 537
    rem-int/lit8 v11, v6, 0x8

    if-nez v11, :cond_43

    .line 538
    add-int/lit8 v8, v9, 0x1

    .end local v9           #valueIndex:I
    .restart local v8       #valueIndex:I
    aget-byte v2, p0, v9

    .line 539
    const/4 v0, 0x7

    .line 541
    :goto_21
    add-int/lit8 v5, v6, 0x1

    .end local v6           #pixelIndex:I
    .restart local v5       #pixelIndex:I
    add-int/lit8 v1, v0, -0x1

    .end local v0           #bitIndex:I
    .local v1, bitIndex:I
    shr-int v11, v2, v0

    and-int/lit8 v11, v11, 0x1

    invoke-static {v11}, Lcom/android/internal/telephony/uicc/IccUtils;->bitToRGB(I)I

    move-result v11

    aput v11, v7, v6

    move v0, v1

    .end local v1           #bitIndex:I
    .restart local v0       #bitIndex:I
    move v6, v5

    .end local v5           #pixelIndex:I
    .restart local v6       #pixelIndex:I
    move v9, v8

    .end local v8           #valueIndex:I
    .restart local v9       #valueIndex:I
    goto :goto_16

    .line 544
    :cond_33
    if-eq v6, v4, :cond_3c

    .line 545
    const-string v11, "IccUtils"

    const-string v12, "parse end and size error"

    invoke-static {v11, v12}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 547
    :cond_3c
    sget-object v11, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v7, v10, v3, v11}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v11

    return-object v11

    :cond_43
    move v8, v9

    .end local v9           #valueIndex:I
    .restart local v8       #valueIndex:I
    goto :goto_21
.end method

.method public static parseToRGB([BIZ)Landroid/graphics/Bitmap;
    .registers 14
    .parameter "data"
    .parameter "length"
    .parameter "transparency"

    .prologue
    .line 568
    const/4 v6, 0x0

    .line 569
    .local v6, valueIndex:I
    add-int/lit8 v7, v6, 0x1

    .end local v6           #valueIndex:I
    .local v7, valueIndex:I
    aget-byte v9, p0, v6

    and-int/lit16 v8, v9, 0xff

    .line 570
    .local v8, width:I
    add-int/lit8 v6, v7, 0x1

    .end local v7           #valueIndex:I
    .restart local v6       #valueIndex:I
    aget-byte v9, p0, v7

    and-int/lit16 v4, v9, 0xff

    .line 571
    .local v4, height:I
    add-int/lit8 v7, v6, 0x1

    .end local v6           #valueIndex:I
    .restart local v7       #valueIndex:I
    aget-byte v9, p0, v6

    and-int/lit16 v0, v9, 0xff

    .line 572
    .local v0, bits:I
    add-int/lit8 v6, v7, 0x1

    .end local v7           #valueIndex:I
    .restart local v6       #valueIndex:I
    aget-byte v9, p0, v7

    and-int/lit16 v3, v9, 0xff

    .line 573
    .local v3, colorNumber:I
    add-int/lit8 v7, v6, 0x1

    .end local v6           #valueIndex:I
    .restart local v7       #valueIndex:I
    aget-byte v9, p0, v6

    and-int/lit16 v9, v9, 0xff

    shl-int/lit8 v9, v9, 0x8

    add-int/lit8 v6, v7, 0x1

    .end local v7           #valueIndex:I
    .restart local v6       #valueIndex:I
    aget-byte v10, p0, v7

    and-int/lit16 v10, v10, 0xff

    or-int v1, v9, v10

    .line 575
    .local v1, clutOffset:I
    add-int/lit8 p1, p1, -0x6

    .line 577
    invoke-static {p0, v1, v3}, Lcom/android/internal/telephony/uicc/IccUtils;->getCLUT([BII)[I

    move-result-object v2

    .line 578
    .local v2, colorIndexArray:[I
    const/4 v9, 0x1

    if-ne v9, p2, :cond_37

    .line 579
    add-int/lit8 v9, v3, -0x1

    const/4 v10, 0x0

    aput v10, v2, v9

    .line 582
    :cond_37
    const/4 v5, 0x0

    .line 583
    .local v5, resultArray:[I
    const/16 v9, 0x8

    rem-int/2addr v9, v0

    if-nez v9, :cond_4a

    .line 584
    mul-int v9, v8, v4

    invoke-static {p0, v6, v9, v2, v0}, Lcom/android/internal/telephony/uicc/IccUtils;->mapTo2OrderBitColor([BII[II)[I

    move-result-object v5

    .line 591
    :goto_43
    sget-object v9, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v5, v8, v4, v9}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v9

    return-object v9

    .line 587
    :cond_4a
    mul-int v9, v8, v4

    invoke-static {p0, v6, v9, v2, v0}, Lcom/android/internal/telephony/uicc/IccUtils;->mapToNon2OrderBitColor([BII[II)[I

    move-result-object v5

    goto :goto_43
.end method

.method public static unicode2String([BII)Ljava/lang/String;
    .registers 11
    .parameter "data"
    .parameter "offset"
    .parameter "length"

    .prologue
    .line 823
    const-string v4, "IccUtils"

    const-string v5, "Enter unicode2String"

    invoke-static {v4, v5}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 824
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 825
    .local v3, ret:Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .line 826
    .local v2, len:I
    :goto_d
    if-ge v2, p2, :cond_32

    .line 827
    aget-byte v4, p0, p1

    const/4 v5, -0x1

    if-eq v4, v5, :cond_32

    .line 828
    const-wide/16 v0, 0x0

    .line 829
    .local v0, ch:J
    aget-byte v4, p0, p1

    shl-int/lit8 v4, v4, 0x8

    invoke-static {v4}, Lcom/android/internal/telephony/uicc/IccUtils;->unsigned32(I)J

    move-result-wide v4

    add-int/lit8 v6, p1, 0x1

    aget-byte v6, p0, v6

    invoke-static {v6}, Lcom/android/internal/telephony/uicc/IccUtils;->unsigned32(B)J

    move-result-wide v6

    or-long v0, v4, v6

    .line 830
    long-to-int v4, v0

    int-to-char v4, v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 831
    add-int/lit8 p1, p1, 0x2

    .line 832
    add-int/lit8 v2, v2, 0x2

    .line 833
    goto :goto_d

    .line 837
    .end local v0           #ch:J
    :cond_32
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method private static unsigned32(B)J
    .registers 5
    .parameter "n"

    .prologue
    .line 726
    int-to-long v0, p0

    const-wide/16 v2, 0xff

    and-long/2addr v0, v2

    return-wide v0
.end method

.method private static unsigned32(I)J
    .registers 5
    .parameter "n"

    .prologue
    .line 724
    int-to-long v0, p0

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    return-wide v0
.end method

.method private static unsigned32(S)J
    .registers 5
    .parameter "n"

    .prologue
    .line 725
    int-to-long v0, p0

    const-wide/32 v2, 0xffff

    and-long/2addr v0, v2

    return-wide v0
.end method
