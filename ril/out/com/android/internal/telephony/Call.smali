.class public abstract Lcom/android/internal/telephony/Call;
.super Ljava/lang/Object;
.source "Call.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/Call$CallType;,
        Lcom/android/internal/telephony/Call$State;
    }
.end annotation


# instance fields
.field protected final LOG_TAG:Ljava/lang/String;

.field public mConnections:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/telephony/Connection;",
            ">;"
        }
    .end annotation
.end field

.field protected mIsGeneric:Z

.field public mState:Lcom/android/internal/telephony/Call$State;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const-string v0, "Call"

    iput-object v0, p0, Lcom/android/internal/telephony/Call;->LOG_TAG:Ljava/lang/String;

    .line 63
    sget-object v0, Lcom/android/internal/telephony/Call$State;->IDLE:Lcom/android/internal/telephony/Call$State;

    iput-object v0, p0, Lcom/android/internal/telephony/Call;->mState:Lcom/android/internal/telephony/Call$State;

    .line 65
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/Call;->mConnections:Ljava/util/ArrayList;

    .line 73
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/Call;->mIsGeneric:Z

    return-void
.end method


# virtual methods
.method public abstract fallbackHangupVTCall()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation
.end method

.method public getCallDetails()Lcom/android/internal/telephony/CallDetails;
    .registers 3

    .prologue
    .line 319
    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->getEarliestConnection()Lcom/android/internal/telephony/Connection;

    move-result-object v0

    .line 320
    .local v0, conn:Lcom/android/internal/telephony/Connection;
    if-nez v0, :cond_8

    .line 321
    const/4 v1, 0x0

    .line 324
    :goto_7
    return-object v1

    :cond_8
    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->getCallDetails()Lcom/android/internal/telephony/CallDetails;

    move-result-object v1

    goto :goto_7
.end method

.method public getCallRadioTech()Ljava/lang/String;
    .registers 3

    .prologue
    .line 328
    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->getCallDetails()Lcom/android/internal/telephony/CallDetails;

    move-result-object v0

    .line 329
    .local v0, callDetails:Lcom/android/internal/telephony/CallDetails;
    if-nez v0, :cond_8

    .line 330
    const/4 v1, 0x0

    .line 333
    :goto_7
    return-object v1

    :cond_8
    const-string v1, "radiotech"

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/CallDetails;->getExtraValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_7
.end method

.method public getCallType()Lcom/android/internal/telephony/Call$CallType;
    .registers 3

    .prologue
    .line 293
    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->getCallDetails()Lcom/android/internal/telephony/CallDetails;

    move-result-object v0

    .line 294
    .local v0, details:Lcom/android/internal/telephony/CallDetails;
    if-nez v0, :cond_9

    .line 295
    sget-object v1, Lcom/android/internal/telephony/Call$CallType;->CS_CALL_VOICE:Lcom/android/internal/telephony/Call$CallType;

    .line 298
    :goto_8
    return-object v1

    :cond_9
    invoke-virtual {v0}, Lcom/android/internal/telephony/CallDetails;->toCallType()Lcom/android/internal/telephony/Call$CallType;

    move-result-object v1

    goto :goto_8
.end method

.method public getCdmaCwActiveConnection()Lcom/android/internal/telephony/Connection;
    .registers 7

    .prologue
    .line 339
    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->getConnections()Ljava/util/List;

    move-result-object v3

    .line 340
    .local v3, l:Ljava/util/List;
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    if-nez v5, :cond_c

    .line 341
    const/4 v1, 0x0

    .line 352
    :cond_b
    return-object v1

    .line 344
    :cond_c
    const/4 v1, 0x0

    .line 345
    .local v1, cwActive:Lcom/android/internal/telephony/Connection;
    const/4 v2, 0x0

    .local v2, i:I
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    .local v4, s:I
    :goto_12
    if-ge v2, v4, :cond_b

    .line 346
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Connection;

    .line 347
    .local v0, c:Lcom/android/internal/telephony/Connection;
    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->isCdmaCwActive()Z

    move-result v5

    if-eqz v5, :cond_21

    .line 348
    move-object v1, v0

    .line 345
    :cond_21
    add-int/lit8 v2, v2, 0x1

    goto :goto_12
.end method

.method public getCdmaCwHoldingConnection()Lcom/android/internal/telephony/Connection;
    .registers 7

    .prologue
    .line 359
    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->getConnections()Ljava/util/List;

    move-result-object v3

    .line 360
    .local v3, l:Ljava/util/List;
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    if-nez v5, :cond_c

    .line 361
    const/4 v1, 0x0

    .line 372
    :cond_b
    return-object v1

    .line 364
    :cond_c
    const/4 v1, 0x0

    .line 365
    .local v1, cwHolding:Lcom/android/internal/telephony/Connection;
    const/4 v2, 0x0

    .local v2, i:I
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    .local v4, s:I
    :goto_12
    if-ge v2, v4, :cond_b

    .line 366
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Connection;

    .line 367
    .local v0, c:Lcom/android/internal/telephony/Connection;
    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->isCdmaCwHolding()Z

    move-result v5

    if-eqz v5, :cond_21

    .line 368
    move-object v1, v0

    .line 365
    :cond_21
    add-int/lit8 v2, v2, 0x1

    goto :goto_12
.end method

.method public abstract getConnections()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/android/internal/telephony/Connection;",
            ">;"
        }
    .end annotation
.end method

.method public getEarliestConnectTime()J
    .registers 11

    .prologue
    .line 194
    const-wide v6, 0x7fffffffffffffffL

    .line 195
    .local v6, time:J
    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->getConnections()Ljava/util/List;

    move-result-object v2

    .line 197
    .local v2, l:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Connection;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_12

    .line 198
    const-wide/16 v8, 0x0

    .line 210
    :goto_11
    return-wide v8

    .line 201
    :cond_12
    const/4 v1, 0x0

    .local v1, i:I
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    .local v3, s:I
    :goto_17
    if-ge v1, v3, :cond_2b

    .line 202
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Connection;

    .line 205
    .local v0, c:Lcom/android/internal/telephony/Connection;
    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->getConnectTime()J

    move-result-wide v4

    .line 207
    .local v4, t:J
    cmp-long v8, v4, v6

    if-gez v8, :cond_28

    move-wide v6, v4

    .line 201
    :cond_28
    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    .end local v0           #c:Lcom/android/internal/telephony/Connection;
    .end local v4           #t:J
    :cond_2b
    move-wide v8, v6

    .line 210
    goto :goto_11
.end method

.method public getEarliestConnection()Lcom/android/internal/telephony/Connection;
    .registers 11

    .prologue
    .line 144
    const-wide v7, 0x7fffffffffffffffL

    .line 146
    .local v7, time:J
    const/4 v1, 0x0

    .line 148
    .local v1, earliest:Lcom/android/internal/telephony/Connection;
    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->getConnections()Ljava/util/List;

    move-result-object v3

    .line 150
    .local v3, l:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Connection;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v9

    if-nez v9, :cond_12

    .line 151
    const/4 v9, 0x0

    .line 166
    :goto_11
    return-object v9

    .line 154
    :cond_12
    const/4 v2, 0x0

    .local v2, i:I
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    .local v4, s:I
    :goto_17
    if-ge v2, v4, :cond_2c

    .line 155
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Connection;

    .line 158
    .local v0, c:Lcom/android/internal/telephony/Connection;
    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->getCreateTime()J

    move-result-wide v5

    .line 160
    .local v5, t:J
    cmp-long v9, v5, v7

    if-gez v9, :cond_29

    .line 161
    move-object v1, v0

    .line 162
    move-wide v7, v5

    .line 154
    :cond_29
    add-int/lit8 v2, v2, 0x1

    goto :goto_17

    .end local v0           #c:Lcom/android/internal/telephony/Connection;
    .end local v5           #t:J
    :cond_2c
    move-object v9, v1

    .line 166
    goto :goto_11
.end method

.method public getEarliestCreateTime()J
    .registers 11

    .prologue
    .line 172
    const-wide v6, 0x7fffffffffffffffL

    .line 174
    .local v6, time:J
    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->getConnections()Ljava/util/List;

    move-result-object v2

    .line 176
    .local v2, l:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Connection;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v8

    if-nez v8, :cond_12

    .line 177
    const-wide/16 v8, 0x0

    .line 189
    :goto_11
    return-wide v8

    .line 180
    :cond_12
    const/4 v1, 0x0

    .local v1, i:I
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    .local v3, s:I
    :goto_17
    if-ge v1, v3, :cond_2b

    .line 181
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Connection;

    .line 184
    .local v0, c:Lcom/android/internal/telephony/Connection;
    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->getCreateTime()J

    move-result-wide v4

    .line 186
    .local v4, t:J
    cmp-long v8, v4, v6

    if-gez v8, :cond_28

    move-wide v6, v4

    .line 180
    :cond_28
    add-int/lit8 v1, v1, 0x1

    goto :goto_17

    .end local v0           #c:Lcom/android/internal/telephony/Connection;
    .end local v4           #t:J
    :cond_2b
    move-wide v8, v6

    .line 189
    goto :goto_11
.end method

.method public getLatestConnection()Lcom/android/internal/telephony/Connection;
    .registers 11

    .prologue
    .line 230
    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->getConnections()Ljava/util/List;

    move-result-object v2

    .line 231
    .local v2, l:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Connection;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v9

    if-nez v9, :cond_c

    .line 232
    const/4 v3, 0x0

    .line 247
    :cond_b
    return-object v3

    .line 235
    :cond_c
    const-wide/16 v7, 0x0

    .line 236
    .local v7, time:J
    const/4 v3, 0x0

    .line 237
    .local v3, latest:Lcom/android/internal/telephony/Connection;
    const/4 v1, 0x0

    .local v1, i:I
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    .local v4, s:I
    :goto_14
    if-ge v1, v4, :cond_b

    .line 238
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/Connection;

    .line 239
    .local v0, c:Lcom/android/internal/telephony/Connection;
    invoke-virtual {v0}, Lcom/android/internal/telephony/Connection;->getCreateTime()J

    move-result-wide v5

    .line 241
    .local v5, t:J
    cmp-long v9, v5, v7

    if-lez v9, :cond_26

    .line 242
    move-object v3, v0

    .line 243
    move-wide v7, v5

    .line 237
    :cond_26
    add-int/lit8 v1, v1, 0x1

    goto :goto_14
.end method

.method public abstract getPhone()Lcom/android/internal/telephony/Phone;
.end method

.method public getState()Lcom/android/internal/telephony/Call$State;
    .registers 2

    .prologue
    .line 124
    iget-object v0, p0, Lcom/android/internal/telephony/Call;->mState:Lcom/android/internal/telephony/Call$State;

    return-object v0
.end method

.method public abstract hangup()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation
.end method

.method public hangupDueToLowBattery()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/internal/telephony/CallStateException;
        }
    .end annotation

    .prologue
    .line 91
    new-instance v0, Lcom/android/internal/telephony/CallStateException;

    const-string v1, "hangupAllCalls: Unsupported Action"

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/CallStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hangupIfAlive()V
    .registers 5

    .prologue
    .line 269
    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v1

    if-eqz v1, :cond_d

    .line 271
    :try_start_a
    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->hangup()V
    :try_end_d
    .catch Lcom/android/internal/telephony/CallStateException; {:try_start_a .. :try_end_d} :catch_e

    .line 276
    :cond_d
    :goto_d
    return-void

    .line 272
    :catch_e
    move-exception v0

    .line 273
    .local v0, ex:Lcom/android/internal/telephony/CallStateException;
    const-string v1, "Call"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " hangupIfActive: caught "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_d
.end method

.method public hasConnection(Lcom/android/internal/telephony/Connection;)Z
    .registers 3
    .parameter "c"

    .prologue
    .line 102
    invoke-virtual {p1}, Lcom/android/internal/telephony/Connection;->getCall()Lcom/android/internal/telephony/Call;

    move-result-object v0

    if-ne v0, p0, :cond_8

    const/4 v0, 0x1

    :goto_7
    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_7
.end method

.method public hasConnections()Z
    .registers 4

    .prologue
    const/4 v1, 0x0

    .line 110
    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->getConnections()Ljava/util/List;

    move-result-object v0

    .line 112
    .local v0, connections:Ljava/util/List;,"Ljava/util/List<Lcom/android/internal/telephony/Connection;>;"
    if-nez v0, :cond_8

    .line 116
    :cond_7
    :goto_7
    return v1

    :cond_8
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_7

    const/4 v1, 0x1

    goto :goto_7
.end method

.method public isDialingOrAlerting()Z
    .registers 2

    .prologue
    .line 216
    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call$State;->isDialing()Z

    move-result v0

    return v0
.end method

.method public isGeneric()Z
    .registers 2

    .prologue
    .line 255
    iget-boolean v0, p0, Lcom/android/internal/telephony/Call;->mIsGeneric:Z

    return v0
.end method

.method public isIdle()Z
    .registers 2

    .prologue
    .line 134
    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call$State;->isAlive()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_b
    return v0

    :cond_c
    const/4 v0, 0x0

    goto :goto_b
.end method

.method public isImsCall()Z
    .registers 5

    .prologue
    const/4 v1, 0x0

    .line 310
    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->getCallDetails()Lcom/android/internal/telephony/CallDetails;

    move-result-object v0

    .line 311
    .local v0, details:Lcom/android/internal/telephony/CallDetails;
    if-nez v0, :cond_8

    .line 315
    :cond_7
    :goto_7
    return v1

    :cond_8
    iget v2, v0, Lcom/android/internal/telephony/CallDetails;->call_domain:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_7

    const/4 v1, 0x1

    goto :goto_7
.end method

.method public abstract isMultiparty()Z
.end method

.method public isRinging()Z
    .registers 2

    .prologue
    .line 221
    invoke-virtual {p0}, Lcom/android/internal/telephony/Call;->getState()Lcom/android/internal/telephony/Call$State;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/Call$State;->isRinging()Z

    move-result v0

    return v0
.end method

.method public abstract isVideoCall()Z
.end method

.method public setCallType(Lcom/android/internal/telephony/Call$CallType;)V
    .registers 4
    .parameter "type"

    .prologue
    .line 306
    const-string v0, "Call"

    const-string v1, "setCallType() is deprecated."

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 307
    return-void
.end method

.method public setGeneric(Z)V
    .registers 2
    .parameter "generic"

    .prologue
    .line 262
    iput-boolean p1, p0, Lcom/android/internal/telephony/Call;->mIsGeneric:Z

    .line 263
    return-void
.end method
