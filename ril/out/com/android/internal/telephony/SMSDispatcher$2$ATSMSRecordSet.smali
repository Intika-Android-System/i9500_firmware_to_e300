.class Lcom/android/internal/telephony/SMSDispatcher$2$ATSMSRecordSet;
.super Ljava/lang/Object;
.source "SMSDispatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/SMSDispatcher$2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ATSMSRecordSet"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/SMSDispatcher$2$ATSMSRecordSet$ATSMSRecord;
    }
.end annotation


# instance fields
.field private final FILTER_SIZE:I

.field mHistory:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/telephony/SMSDispatcher$2$ATSMSRecordSet$ATSMSRecord;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$1:Lcom/android/internal/telephony/SMSDispatcher$2;


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/SMSDispatcher$2;)V
    .registers 3
    .parameter

    .prologue
    .line 2186
    iput-object p1, p0, Lcom/android/internal/telephony/SMSDispatcher$2$ATSMSRecordSet;->this$1:Lcom/android/internal/telephony/SMSDispatcher$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2168
    const/16 v0, 0xa

    iput v0, p0, Lcom/android/internal/telephony/SMSDispatcher$2$ATSMSRecordSet;->FILTER_SIZE:I

    .line 2187
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/android/internal/telephony/SMSDispatcher$2$ATSMSRecordSet;->mHistory:Ljava/util/ArrayList;

    .line 2188
    return-void
.end method


# virtual methods
.method public addMessage(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)I
    .registers 12
    .parameter "type"
    .parameter "pdu"
    .parameter "address"
    .parameter "mBody"

    .prologue
    .line 2191
    iget-object v0, p0, Lcom/android/internal/telephony/SMSDispatcher$2$ATSMSRecordSet;->mHistory:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/16 v1, 0xa

    if-lt v0, v1, :cond_10

    .line 2192
    iget-object v0, p0, Lcom/android/internal/telephony/SMSDispatcher$2$ATSMSRecordSet;->mHistory:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 2194
    :cond_10
    iget-object v6, p0, Lcom/android/internal/telephony/SMSDispatcher$2$ATSMSRecordSet;->mHistory:Ljava/util/ArrayList;

    new-instance v0, Lcom/android/internal/telephony/SMSDispatcher$2$ATSMSRecordSet$ATSMSRecord;

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/telephony/SMSDispatcher$2$ATSMSRecordSet$ATSMSRecord;-><init>(Lcom/android/internal/telephony/SMSDispatcher$2$ATSMSRecordSet;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2195
    iget-object v0, p0, Lcom/android/internal/telephony/SMSDispatcher$2$ATSMSRecordSet;->mHistory:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method
