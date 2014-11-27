.class public Lcom/android/internal/telephony/dataconnection/DataCallResponse;
.super Ljava/lang/Object;
.source "DataCallResponse.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/dataconnection/DataCallResponse$SetupResult;
    }
.end annotation


# instance fields
.field private final DBG:Z

.field private final LOG_TAG:Ljava/lang/String;

.field public active:I

.field public addresses:[Ljava/lang/String;

.field public cid:I

.field public dnses:[Ljava/lang/String;

.field public gateways:[Ljava/lang/String;

.field public ifname:Ljava/lang/String;

.field public status:I

.field public suggestedRetryTime:I

.field public type:Ljava/lang/String;

.field public version:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    const/4 v1, 0x0

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->DBG:Z

    .line 38
    const-string v0, "DataCallResponse"

    iput-object v0, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->LOG_TAG:Ljava/lang/String;

    .line 40
    iput v1, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->version:I

    .line 41
    iput v1, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->status:I

    .line 42
    iput v1, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->cid:I

    .line 43
    iput v1, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->active:I

    .line 44
    const-string v0, ""

    iput-object v0, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->type:Ljava/lang/String;

    .line 45
    const-string v0, ""

    iput-object v0, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->ifname:Ljava/lang/String;

    .line 46
    new-array v0, v1, [Ljava/lang/String;

    iput-object v0, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->addresses:[Ljava/lang/String;

    .line 47
    new-array v0, v1, [Ljava/lang/String;

    iput-object v0, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->dnses:[Ljava/lang/String;

    .line 48
    new-array v0, v1, [Ljava/lang/String;

    iput-object v0, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->gateways:[Ljava/lang/String;

    .line 49
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->suggestedRetryTime:I

    .line 54
    return-void
.end method


# virtual methods
.method public setLinkProperties(Landroid/net/LinkProperties;Z)Lcom/android/internal/telephony/dataconnection/DataCallResponse$SetupResult;
    .registers 21
    .parameter "linkProperties"
    .parameter "okToUseSystemPropertyDns"

    .prologue
    .line 113
    if-nez p1, :cond_61

    .line 114
    new-instance p1, Landroid/net/LinkProperties;

    .end local p1
    invoke-direct/range {p1 .. p1}, Landroid/net/LinkProperties;-><init>()V

    .line 118
    .restart local p1
    :goto_7
    move-object/from16 v0, p0

    iget v15, v0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->status:I

    sget-object v16, Lcom/android/internal/telephony/dataconnection/DcFailCause;->NONE:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    invoke-virtual/range {v16 .. v16}, Lcom/android/internal/telephony/dataconnection/DcFailCause;->getErrorCode()I

    move-result v16

    move/from16 v0, v16

    if-ne v15, v0, :cond_2a6

    .line 119
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "net."

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->ifname:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "."

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    .line 123
    .local v12, propertyPrefix:Ljava/lang/String;
    :try_start_34
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->ifname:Ljava/lang/String;

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Landroid/net/LinkProperties;->setInterfaceName(Ljava/lang/String;)V

    .line 126
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->addresses:[Ljava/lang/String;

    if-eqz v15, :cond_134

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->addresses:[Ljava/lang/String;

    array-length v15, v15

    if-lez v15, :cond_134

    .line 127
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->addresses:[Ljava/lang/String;

    .local v4, arr$:[Ljava/lang/String;
    array-length v11, v4

    .local v11, len$:I
    const/4 v8, 0x0

    .local v8, i$:I
    :goto_50
    if-ge v8, v11, :cond_153

    aget-object v1, v4, v8

    .line 128
    .local v1, addr:Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 129
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z
    :try_end_5b
    .catch Ljava/net/UnknownHostException; {:try_start_34 .. :try_end_5b} :catch_bf

    move-result v15

    if-eqz v15, :cond_65

    .line 127
    :cond_5e
    :goto_5e
    add-int/lit8 v8, v8, 0x1

    goto :goto_50

    .line 116
    .end local v1           #addr:Ljava/lang/String;
    .end local v4           #arr$:[Ljava/lang/String;
    .end local v8           #i$:I
    .end local v11           #len$:I
    .end local v12           #propertyPrefix:Ljava/lang/String;
    :cond_61
    invoke-virtual/range {p1 .. p1}, Landroid/net/LinkProperties;->clear()V

    goto :goto_7

    .line 133
    .restart local v1       #addr:Ljava/lang/String;
    .restart local v4       #arr$:[Ljava/lang/String;
    .restart local v8       #i$:I
    .restart local v11       #len$:I
    .restart local v12       #propertyPrefix:Ljava/lang/String;
    :cond_65
    :try_start_65
    const-string v15, "/"

    invoke-virtual {v1, v15}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 134
    .local v3, ap:[Ljava/lang/String;
    array-length v15, v3

    const/16 v16, 0x2

    move/from16 v0, v16

    if-ne v15, v0, :cond_111

    .line 135
    const/4 v15, 0x0

    aget-object v1, v3, v15

    .line 136
    const/4 v15, 0x1

    aget-object v15, v3, v15

    invoke-static {v15}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_7b
    .catch Ljava/net/UnknownHostException; {:try_start_65 .. :try_end_7b} :catch_bf

    move-result v2

    .line 142
    .local v2, addrPrefixLen:I
    :goto_7c
    :try_start_7c
    invoke-static {v1}, Landroid/net/NetworkUtils;->numericToInetAddress(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_7f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_7c .. :try_end_7f} :catch_114
    .catch Ljava/net/UnknownHostException; {:try_start_7c .. :try_end_7f} :catch_bf

    move-result-object v9

    .line 146
    .local v9, ia:Ljava/net/InetAddress;
    :try_start_80
    invoke-virtual {v9}, Ljava/net/InetAddress;->isAnyLocalAddress()Z

    move-result v15

    if-nez v15, :cond_5e

    .line 147
    if-nez v2, :cond_8e

    .line 149
    instance-of v15, v9, Ljava/net/Inet4Address;

    if-eqz v15, :cond_130

    const/16 v2, 0x20

    .line 151
    :cond_8e
    :goto_8e
    const-string v15, "DataCallResponse"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "addr/pl="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "/"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    new-instance v10, Landroid/net/LinkAddress;

    invoke-direct {v10, v9, v2}, Landroid/net/LinkAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 153
    .local v10, la:Landroid/net/LinkAddress;
    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Landroid/net/LinkProperties;->addLinkAddress(Landroid/net/LinkAddress;)Z
    :try_end_be
    .catch Ljava/net/UnknownHostException; {:try_start_80 .. :try_end_be} :catch_bf

    goto :goto_5e

    .line 219
    .end local v1           #addr:Ljava/lang/String;
    .end local v2           #addrPrefixLen:I
    .end local v3           #ap:[Ljava/lang/String;
    .end local v4           #arr$:[Ljava/lang/String;
    .end local v8           #i$:I
    .end local v9           #ia:Ljava/net/InetAddress;
    .end local v10           #la:Landroid/net/LinkAddress;
    .end local v11           #len$:I
    :catch_bf
    move-exception v7

    .line 220
    .local v7, e:Ljava/net/UnknownHostException;
    const-string v15, "DataCallResponse"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "setLinkProperties: UnknownHostException "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    invoke-virtual {v7}, Ljava/lang/Throwable;->printStackTrace()V

    .line 222
    sget-object v13, Lcom/android/internal/telephony/dataconnection/DataCallResponse$SetupResult;->ERR_UnacceptableParameter:Lcom/android/internal/telephony/dataconnection/DataCallResponse$SetupResult;

    .line 233
    .end local v7           #e:Ljava/net/UnknownHostException;
    .end local v12           #propertyPrefix:Ljava/lang/String;
    .local v13, result:Lcom/android/internal/telephony/dataconnection/DataCallResponse$SetupResult;
    :goto_df
    sget-object v15, Lcom/android/internal/telephony/dataconnection/DataCallResponse$SetupResult;->SUCCESS:Lcom/android/internal/telephony/dataconnection/DataCallResponse$SetupResult;

    if-eq v13, v15, :cond_110

    .line 235
    const-string v15, "DataCallResponse"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "setLinkProperties: error clearing LinkProperties status="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget v0, v0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->status:I

    move/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " result="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 238
    invoke-virtual/range {p1 .. p1}, Landroid/net/LinkProperties;->clear()V

    .line 241
    :cond_110
    return-object v13

    .line 138
    .end local v13           #result:Lcom/android/internal/telephony/dataconnection/DataCallResponse$SetupResult;
    .restart local v1       #addr:Ljava/lang/String;
    .restart local v3       #ap:[Ljava/lang/String;
    .restart local v4       #arr$:[Ljava/lang/String;
    .restart local v8       #i$:I
    .restart local v11       #len$:I
    .restart local v12       #propertyPrefix:Ljava/lang/String;
    :cond_111
    const/4 v2, 0x0

    .restart local v2       #addrPrefixLen:I
    goto/16 :goto_7c

    .line 143
    :catch_114
    move-exception v7

    .line 144
    .local v7, e:Ljava/lang/IllegalArgumentException;
    :try_start_115
    new-instance v15, Ljava/net/UnknownHostException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Non-numeric ip addr="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 149
    .end local v7           #e:Ljava/lang/IllegalArgumentException;
    .restart local v9       #ia:Ljava/net/InetAddress;
    :cond_130
    const/16 v2, 0x80

    goto/16 :goto_8e

    .line 157
    .end local v1           #addr:Ljava/lang/String;
    .end local v2           #addrPrefixLen:I
    .end local v3           #ap:[Ljava/lang/String;
    .end local v4           #arr$:[Ljava/lang/String;
    .end local v8           #i$:I
    .end local v9           #ia:Ljava/net/InetAddress;
    .end local v11           #len$:I
    :cond_134
    new-instance v15, Ljava/net/UnknownHostException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "no address for ifname="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->ifname:Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 161
    .restart local v4       #arr$:[Ljava/lang/String;
    .restart local v8       #i$:I
    .restart local v11       #len$:I
    :cond_153
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->dnses:[Ljava/lang/String;

    if-eqz v15, :cond_1a3

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->dnses:[Ljava/lang/String;

    array-length v15, v15

    if-lez v15, :cond_1a3

    .line 162
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->dnses:[Ljava/lang/String;

    array-length v11, v4

    const/4 v8, 0x0

    :goto_166
    if-ge v8, v11, :cond_228

    aget-object v1, v4, v8

    .line 163
    .restart local v1       #addr:Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 164
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z
    :try_end_171
    .catch Ljava/net/UnknownHostException; {:try_start_115 .. :try_end_171} :catch_bf

    move-result v15

    if-eqz v15, :cond_177

    .line 162
    :cond_174
    :goto_174
    add-int/lit8 v8, v8, 0x1

    goto :goto_166

    .line 167
    :cond_177
    :try_start_177
    invoke-static {v1}, Landroid/net/NetworkUtils;->numericToInetAddress(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_17a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_177 .. :try_end_17a} :catch_187
    .catch Ljava/net/UnknownHostException; {:try_start_177 .. :try_end_17a} :catch_bf

    move-result-object v9

    .line 171
    .restart local v9       #ia:Ljava/net/InetAddress;
    :try_start_17b
    invoke-virtual {v9}, Ljava/net/InetAddress;->isAnyLocalAddress()Z

    move-result v15

    if-nez v15, :cond_174

    .line 172
    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Landroid/net/LinkProperties;->addDns(Ljava/net/InetAddress;)V

    goto :goto_174

    .line 168
    .end local v9           #ia:Ljava/net/InetAddress;
    :catch_187
    move-exception v7

    .line 169
    .restart local v7       #e:Ljava/lang/IllegalArgumentException;
    new-instance v15, Ljava/net/UnknownHostException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Non-numeric dns addr="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 175
    .end local v1           #addr:Ljava/lang/String;
    .end local v7           #e:Ljava/lang/IllegalArgumentException;
    :cond_1a3
    if-eqz p2, :cond_220

    .line 176
    const/4 v15, 0x2

    new-array v6, v15, [Ljava/lang/String;

    .line 177
    .local v6, dnsServers:[Ljava/lang/String;
    const/4 v15, 0x0

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "dns1"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    aput-object v16, v6, v15

    .line 178
    const/4 v15, 0x1

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v16

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, "dns2"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v16 .. v16}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    aput-object v16, v6, v15

    .line 179
    move-object v4, v6

    array-length v11, v4

    const/4 v8, 0x0

    :goto_1e3
    if-ge v8, v11, :cond_228

    aget-object v5, v4, v8

    .line 180
    .local v5, dnsAddr:Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    .line 181
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z
    :try_end_1ee
    .catch Ljava/net/UnknownHostException; {:try_start_17b .. :try_end_1ee} :catch_bf

    move-result v15

    if-eqz v15, :cond_1f4

    .line 179
    :cond_1f1
    :goto_1f1
    add-int/lit8 v8, v8, 0x1

    goto :goto_1e3

    .line 184
    :cond_1f4
    :try_start_1f4
    invoke-static {v5}, Landroid/net/NetworkUtils;->numericToInetAddress(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_1f7
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1f4 .. :try_end_1f7} :catch_204
    .catch Ljava/net/UnknownHostException; {:try_start_1f4 .. :try_end_1f7} :catch_bf

    move-result-object v9

    .line 188
    .restart local v9       #ia:Ljava/net/InetAddress;
    :try_start_1f8
    invoke-virtual {v9}, Ljava/net/InetAddress;->isAnyLocalAddress()Z

    move-result v15

    if-nez v15, :cond_1f1

    .line 189
    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Landroid/net/LinkProperties;->addDns(Ljava/net/InetAddress;)V

    goto :goto_1f1

    .line 185
    .end local v9           #ia:Ljava/net/InetAddress;
    :catch_204
    move-exception v7

    .line 186
    .restart local v7       #e:Ljava/lang/IllegalArgumentException;
    new-instance v15, Ljava/net/UnknownHostException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Non-numeric dns addr="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 193
    .end local v5           #dnsAddr:Ljava/lang/String;
    .end local v6           #dnsServers:[Ljava/lang/String;
    .end local v7           #e:Ljava/lang/IllegalArgumentException;
    :cond_220
    new-instance v15, Ljava/net/UnknownHostException;

    const-string v16, "Empty dns response and no system default dns"

    invoke-direct/range {v15 .. v16}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 197
    :cond_228
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->gateways:[Ljava/lang/String;

    if-eqz v15, :cond_235

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->gateways:[Ljava/lang/String;

    array-length v15, v15

    if-nez v15, :cond_258

    .line 198
    :cond_235
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "gw"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 199
    .local v14, sysGateways:Ljava/lang/String;
    if-eqz v14, :cond_26f

    .line 200
    const-string v15, " "

    invoke-virtual {v14, v15}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->gateways:[Ljava/lang/String;

    .line 205
    .end local v14           #sysGateways:Ljava/lang/String;
    :cond_258
    :goto_258
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->gateways:[Ljava/lang/String;

    array-length v11, v4

    const/4 v8, 0x0

    :goto_25e
    if-ge v8, v11, :cond_2a2

    aget-object v1, v4, v8

    .line 206
    .restart local v1       #addr:Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 207
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v15

    if-eqz v15, :cond_277

    .line 205
    :goto_26c
    add-int/lit8 v8, v8, 0x1

    goto :goto_25e

    .line 202
    .end local v1           #addr:Ljava/lang/String;
    .restart local v14       #sysGateways:Ljava/lang/String;
    :cond_26f
    const/4 v15, 0x0

    new-array v15, v15, [Ljava/lang/String;

    move-object/from16 v0, p0

    iput-object v15, v0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->gateways:[Ljava/lang/String;
    :try_end_276
    .catch Ljava/net/UnknownHostException; {:try_start_1f8 .. :try_end_276} :catch_bf

    goto :goto_258

    .line 210
    .end local v14           #sysGateways:Ljava/lang/String;
    .restart local v1       #addr:Ljava/lang/String;
    :cond_277
    :try_start_277
    invoke-static {v1}, Landroid/net/NetworkUtils;->numericToInetAddress(Ljava/lang/String;)Ljava/net/InetAddress;
    :try_end_27a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_277 .. :try_end_27a} :catch_286
    .catch Ljava/net/UnknownHostException; {:try_start_277 .. :try_end_27a} :catch_bf

    move-result-object v9

    .line 215
    .restart local v9       #ia:Ljava/net/InetAddress;
    :try_start_27b
    new-instance v15, Landroid/net/RouteInfo;

    invoke-direct {v15, v9}, Landroid/net/RouteInfo;-><init>(Ljava/net/InetAddress;)V

    move-object/from16 v0, p1

    invoke-virtual {v0, v15}, Landroid/net/LinkProperties;->addRoute(Landroid/net/RouteInfo;)V

    goto :goto_26c

    .line 211
    .end local v9           #ia:Ljava/net/InetAddress;
    :catch_286
    move-exception v7

    .line 212
    .restart local v7       #e:Ljava/lang/IllegalArgumentException;
    new-instance v15, Ljava/net/UnknownHostException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "Non-numeric gateway addr="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 218
    .end local v1           #addr:Ljava/lang/String;
    .end local v7           #e:Ljava/lang/IllegalArgumentException;
    :cond_2a2
    sget-object v13, Lcom/android/internal/telephony/dataconnection/DataCallResponse$SetupResult;->SUCCESS:Lcom/android/internal/telephony/dataconnection/DataCallResponse$SetupResult;
    :try_end_2a4
    .catch Ljava/net/UnknownHostException; {:try_start_27b .. :try_end_2a4} :catch_bf

    .restart local v13       #result:Lcom/android/internal/telephony/dataconnection/DataCallResponse$SetupResult;
    goto/16 :goto_df

    .line 225
    .end local v4           #arr$:[Ljava/lang/String;
    .end local v8           #i$:I
    .end local v11           #len$:I
    .end local v12           #propertyPrefix:Ljava/lang/String;
    .end local v13           #result:Lcom/android/internal/telephony/dataconnection/DataCallResponse$SetupResult;
    :cond_2a6
    move-object/from16 v0, p0

    iget v15, v0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->version:I

    const/16 v16, 0x4

    move/from16 v0, v16

    if-ge v15, v0, :cond_2b4

    .line 226
    sget-object v13, Lcom/android/internal/telephony/dataconnection/DataCallResponse$SetupResult;->ERR_GetLastErrorFromRil:Lcom/android/internal/telephony/dataconnection/DataCallResponse$SetupResult;

    .restart local v13       #result:Lcom/android/internal/telephony/dataconnection/DataCallResponse$SetupResult;
    goto/16 :goto_df

    .line 228
    .end local v13           #result:Lcom/android/internal/telephony/dataconnection/DataCallResponse$SetupResult;
    :cond_2b4
    sget-object v13, Lcom/android/internal/telephony/dataconnection/DataCallResponse$SetupResult;->ERR_RilError:Lcom/android/internal/telephony/dataconnection/DataCallResponse$SetupResult;

    .restart local v13       #result:Lcom/android/internal/telephony/dataconnection/DataCallResponse$SetupResult;
    goto/16 :goto_df
.end method

.method public toString()Ljava/lang/String;
    .registers 8

    .prologue
    .line 76
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 77
    .local v4, sb:Ljava/lang/StringBuffer;
    const-string v5, "DataCallResponse: {"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "version="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget v6, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->version:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " status="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget v6, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->status:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " retry="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget v6, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->suggestedRetryTime:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " cid="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget v6, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->cid:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " active="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget v6, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->active:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, " type="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->type:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    const-string v6, "\' ifname=\'"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v5

    iget-object v6, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->ifname:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 85
    const-string v5, "\' addresses=["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 86
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->addresses:[Ljava/lang/String;

    .local v1, arr$:[Ljava/lang/String;
    array-length v3, v1

    .local v3, len$:I
    const/4 v2, 0x0

    .local v2, i$:I
    :goto_67
    if-ge v2, v3, :cond_76

    aget-object v0, v1, v2

    .line 87
    .local v0, addr:Ljava/lang/String;
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 88
    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 86
    add-int/lit8 v2, v2, 0x1

    goto :goto_67

    .line 90
    .end local v0           #addr:Ljava/lang/String;
    :cond_76
    iget-object v5, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->addresses:[Ljava/lang/String;

    array-length v5, v5

    if-lez v5, :cond_84

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->deleteCharAt(I)Ljava/lang/StringBuffer;

    .line 91
    :cond_84
    const-string v5, "] dnses=["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 92
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->dnses:[Ljava/lang/String;

    array-length v3, v1

    const/4 v2, 0x0

    :goto_8d
    if-ge v2, v3, :cond_9c

    aget-object v0, v1, v2

    .line 93
    .restart local v0       #addr:Ljava/lang/String;
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 94
    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 92
    add-int/lit8 v2, v2, 0x1

    goto :goto_8d

    .line 96
    .end local v0           #addr:Ljava/lang/String;
    :cond_9c
    iget-object v5, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->dnses:[Ljava/lang/String;

    array-length v5, v5

    if-lez v5, :cond_aa

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->deleteCharAt(I)Ljava/lang/StringBuffer;

    .line 97
    :cond_aa
    const-string v5, "] gateways=["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 98
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->gateways:[Ljava/lang/String;

    array-length v3, v1

    const/4 v2, 0x0

    :goto_b3
    if-ge v2, v3, :cond_c2

    aget-object v0, v1, v2

    .line 99
    .restart local v0       #addr:Ljava/lang/String;
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 100
    const-string v5, ","

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 98
    add-int/lit8 v2, v2, 0x1

    goto :goto_b3

    .line 102
    .end local v0           #addr:Ljava/lang/String;
    :cond_c2
    iget-object v5, p0, Lcom/android/internal/telephony/dataconnection/DataCallResponse;->gateways:[Ljava/lang/String;

    array-length v5, v5

    if-lez v5, :cond_d0

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->deleteCharAt(I)Ljava/lang/StringBuffer;

    .line 103
    :cond_d0
    const-string v5, "]}"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 104
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method
