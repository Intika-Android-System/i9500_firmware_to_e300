.class public Lcom/android/internal/telephony/gsm/SsData;
.super Ljava/lang/Object;
.source "SsData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;,
        Lcom/android/internal/telephony/gsm/SsData$RequestType;,
        Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    }
.end annotation


# instance fields
.field public mCfInfo:[Lcom/android/internal/telephony/CallForwardInfo;

.field public mRequestType:Lcom/android/internal/telephony/gsm/SsData$RequestType;

.field public mResult:I

.field public mServiceClass:I

.field public mServiceType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;

.field public mSsInfo:[I

.field public mTeleserviceType:Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public RequestTypeFromRILInt(I)Lcom/android/internal/telephony/gsm/SsData$RequestType;
    .registers 6
    .parameter "type"

    .prologue
    .line 150
    packed-switch p1, :pswitch_data_2c

    .line 157
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unrecognized SS RequestType "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 151
    :pswitch_1c
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$RequestType;->SS_ACTIVATION:Lcom/android/internal/telephony/gsm/SsData$RequestType;

    .line 161
    .local v0, newType:Lcom/android/internal/telephony/gsm/SsData$RequestType;
    :goto_1e
    return-object v0

    .line 152
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$RequestType;
    :pswitch_1f
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$RequestType;->SS_DEACTIVATION:Lcom/android/internal/telephony/gsm/SsData$RequestType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$RequestType;
    goto :goto_1e

    .line 153
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$RequestType;
    :pswitch_22
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$RequestType;->SS_INTERROGATION:Lcom/android/internal/telephony/gsm/SsData$RequestType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$RequestType;
    goto :goto_1e

    .line 154
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$RequestType;
    :pswitch_25
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$RequestType;->SS_REGISTRATION:Lcom/android/internal/telephony/gsm/SsData$RequestType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$RequestType;
    goto :goto_1e

    .line 155
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$RequestType;
    :pswitch_28
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$RequestType;->SS_ERASURE:Lcom/android/internal/telephony/gsm/SsData$RequestType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$RequestType;
    goto :goto_1e

    .line 150
    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_1f
        :pswitch_22
        :pswitch_25
        :pswitch_28
    .end packed-switch
.end method

.method public ServiceTypeFromRILInt(I)Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    .registers 6
    .parameter "type"

    .prologue
    .line 119
    packed-switch p1, :pswitch_data_56

    .line 140
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unrecognized SS ServiceType "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 120
    :pswitch_1c
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$ServiceType;->SS_CFU:Lcom/android/internal/telephony/gsm/SsData$ServiceType;

    .line 144
    .local v0, newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    :goto_1e
    return-object v0

    .line 121
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    :pswitch_1f
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$ServiceType;->SS_CF_BUSY:Lcom/android/internal/telephony/gsm/SsData$ServiceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    goto :goto_1e

    .line 122
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    :pswitch_22
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$ServiceType;->SS_CF_NO_REPLY:Lcom/android/internal/telephony/gsm/SsData$ServiceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    goto :goto_1e

    .line 123
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    :pswitch_25
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$ServiceType;->SS_CF_NOT_REACHABLE:Lcom/android/internal/telephony/gsm/SsData$ServiceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    goto :goto_1e

    .line 124
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    :pswitch_28
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$ServiceType;->SS_CF_ALL:Lcom/android/internal/telephony/gsm/SsData$ServiceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    goto :goto_1e

    .line 125
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    :pswitch_2b
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$ServiceType;->SS_CF_ALL_CONDITIONAL:Lcom/android/internal/telephony/gsm/SsData$ServiceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    goto :goto_1e

    .line 126
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    :pswitch_2e
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$ServiceType;->SS_CLIP:Lcom/android/internal/telephony/gsm/SsData$ServiceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    goto :goto_1e

    .line 127
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    :pswitch_31
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$ServiceType;->SS_CLIR:Lcom/android/internal/telephony/gsm/SsData$ServiceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    goto :goto_1e

    .line 128
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    :pswitch_34
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$ServiceType;->SS_COLP:Lcom/android/internal/telephony/gsm/SsData$ServiceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    goto :goto_1e

    .line 129
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    :pswitch_37
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$ServiceType;->SS_COLR:Lcom/android/internal/telephony/gsm/SsData$ServiceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    goto :goto_1e

    .line 130
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    :pswitch_3a
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$ServiceType;->SS_WAIT:Lcom/android/internal/telephony/gsm/SsData$ServiceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    goto :goto_1e

    .line 131
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    :pswitch_3d
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$ServiceType;->SS_BAOC:Lcom/android/internal/telephony/gsm/SsData$ServiceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    goto :goto_1e

    .line 132
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    :pswitch_40
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$ServiceType;->SS_BAOIC:Lcom/android/internal/telephony/gsm/SsData$ServiceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    goto :goto_1e

    .line 133
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    :pswitch_43
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$ServiceType;->SS_BAOIC_EXC_HOME:Lcom/android/internal/telephony/gsm/SsData$ServiceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    goto :goto_1e

    .line 134
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    :pswitch_46
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$ServiceType;->SS_BAIC:Lcom/android/internal/telephony/gsm/SsData$ServiceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    goto :goto_1e

    .line 135
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    :pswitch_49
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$ServiceType;->SS_BAIC_ROAMING:Lcom/android/internal/telephony/gsm/SsData$ServiceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    goto :goto_1e

    .line 136
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    :pswitch_4c
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$ServiceType;->SS_ALL_BARRING:Lcom/android/internal/telephony/gsm/SsData$ServiceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    goto :goto_1e

    .line 137
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    :pswitch_4f
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$ServiceType;->SS_OUTGOING_BARRING:Lcom/android/internal/telephony/gsm/SsData$ServiceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    goto :goto_1e

    .line 138
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    :pswitch_52
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$ServiceType;->SS_INCOMING_BARRING:Lcom/android/internal/telephony/gsm/SsData$ServiceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;
    goto :goto_1e

    .line 119
    nop

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_1f
        :pswitch_22
        :pswitch_25
        :pswitch_28
        :pswitch_2b
        :pswitch_2e
        :pswitch_31
        :pswitch_34
        :pswitch_37
        :pswitch_3a
        :pswitch_3d
        :pswitch_40
        :pswitch_43
        :pswitch_46
        :pswitch_49
        :pswitch_4c
        :pswitch_4f
        :pswitch_52
    .end packed-switch
.end method

.method public TeleserviceTypeFromRILInt(I)Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;
    .registers 6
    .parameter "type"

    .prologue
    .line 167
    packed-switch p1, :pswitch_data_2e

    .line 175
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unrecognized SS TeleserviceType "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 168
    :pswitch_1c
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;->SS_ALL_TELE_AND_BEARER_SERVICES:Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;

    .line 179
    .local v0, newType:Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;
    :goto_1e
    return-object v0

    .line 169
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;
    :pswitch_1f
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;->SS_ALL_TELESEVICES:Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;
    goto :goto_1e

    .line 170
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;
    :pswitch_22
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;->SS_TELEPHONY:Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;
    goto :goto_1e

    .line 171
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;
    :pswitch_25
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;->SS_ALL_DATA_TELESERVICES:Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;
    goto :goto_1e

    .line 172
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;
    :pswitch_28
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;->SS_SMS_SERVICES:Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;
    goto :goto_1e

    .line 173
    .end local v0           #newType:Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;
    :pswitch_2b
    sget-object v0, Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;->SS_ALL_TELESERVICES_EXCEPT_SMS:Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;

    .restart local v0       #newType:Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;
    goto :goto_1e

    .line 167
    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_1c
        :pswitch_1f
        :pswitch_22
        :pswitch_25
        :pswitch_28
        :pswitch_2b
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 183
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "[SsData] ServiceType: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/gsm/SsData;->mServiceType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " RequestType: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/gsm/SsData;->mRequestType:Lcom/android/internal/telephony/gsm/SsData$RequestType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " TeleserviceType: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/gsm/SsData;->mTeleserviceType:Lcom/android/internal/telephony/gsm/SsData$TeleserviceType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " ServiceClass: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/gsm/SsData;->mServiceClass:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " Result: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/gsm/SsData;->mResult:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " Is Service Type CF: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/gsm/SsData;->mServiceType:Lcom/android/internal/telephony/gsm/SsData$ServiceType;

    invoke-virtual {v1}, Lcom/android/internal/telephony/gsm/SsData$ServiceType;->isTypeCF()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
