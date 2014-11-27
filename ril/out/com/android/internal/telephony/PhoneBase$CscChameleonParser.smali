.class Lcom/android/internal/telephony/PhoneBase$CscChameleonParser;
.super Ljava/lang/Object;
.source "PhoneBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/PhoneBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CscChameleonParser"
.end annotation


# static fields
.field private static final CSC_CHAMELEON_FILE:Ljava/lang/String; = "/carrier/chameleon.xml"


# instance fields
.field private final PATH_OPERATORS_BRANDALPHA:Ljava/lang/String;

.field private final PATH_OPERATORS_NETWORKCODE:Ljava/lang/String;

.field private isFileExist:Z

.field private mDoc:Lorg/w3c/dom/Document;

.field private mRoot:Lorg/w3c/dom/Node;

.field final synthetic this$0:Lcom/android/internal/telephony/PhoneBase;


# direct methods
.method public constructor <init>(Lcom/android/internal/telephony/PhoneBase;)V
    .registers 5
    .parameter

    .prologue
    .line 2005
    iput-object p1, p0, Lcom/android/internal/telephony/PhoneBase$CscChameleonParser;->this$0:Lcom/android/internal/telephony/PhoneBase;

    .line 2006
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1997
    const-string v1, "Operators.BrandAlpha"

    iput-object v1, p0, Lcom/android/internal/telephony/PhoneBase$CscChameleonParser;->PATH_OPERATORS_BRANDALPHA:Ljava/lang/String;

    .line 1998
    const-string v1, "Operators.AndroidOperatorNetworkCode"

    iput-object v1, p0, Lcom/android/internal/telephony/PhoneBase$CscChameleonParser;->PATH_OPERATORS_NETWORKCODE:Ljava/lang/String;

    .line 2003
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/android/internal/telephony/PhoneBase$CscChameleonParser;->isFileExist:Z

    .line 2008
    const-string v1, "PhoneBase"

    const-string v2, "[PhoneBase CscChameleonParser] init"

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2011
    :try_start_17
    const-string v1, "/carrier/chameleon.xml"

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/PhoneBase$CscChameleonParser;->update(Ljava/lang/String;)V
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_1c} :catch_1d

    .line 2016
    :goto_1c
    return-void

    .line 2013
    :catch_1d
    move-exception v0

    .line 2014
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_1c
.end method

.method private isFileExists()Z
    .registers 4

    .prologue
    .line 2019
    const-string v0, "PhoneBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "isFileExists : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/internal/telephony/PhoneBase$CscChameleonParser;->isFileExist:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2020
    iget-boolean v0, p0, Lcom/android/internal/telephony/PhoneBase$CscChameleonParser;->isFileExist:Z

    return v0
.end method

.method private update(Ljava/lang/String;)V
    .registers 7
    .parameter "fileName"
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/xml/parsers/ParserConfigurationException;,
            Lorg/xml/sax/SAXException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 2024
    invoke-static {}, Ljavax/xml/parsers/DocumentBuilderFactory;->newInstance()Ljavax/xml/parsers/DocumentBuilderFactory;

    move-result-object v1

    .line 2025
    .local v1, factory:Ljavax/xml/parsers/DocumentBuilderFactory;
    invoke-virtual {v1}, Ljavax/xml/parsers/DocumentBuilderFactory;->newDocumentBuilder()Ljavax/xml/parsers/DocumentBuilder;

    move-result-object v0

    .line 2027
    .local v0, builder:Ljavax/xml/parsers/DocumentBuilder;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 2029
    .local v2, fe:Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_31

    .line 2030
    const-string v3, "PhoneBase"

    const-string v4, "CscChameleonParser : update"

    invoke-static {v3, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2031
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljavax/xml/parsers/DocumentBuilder;->parse(Ljava/io/File;)Lorg/w3c/dom/Document;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/telephony/PhoneBase$CscChameleonParser;->mDoc:Lorg/w3c/dom/Document;

    .line 2032
    iget-object v3, p0, Lcom/android/internal/telephony/PhoneBase$CscChameleonParser;->mDoc:Lorg/w3c/dom/Document;

    invoke-interface {v3}, Lorg/w3c/dom/Document;->getDocumentElement()Lorg/w3c/dom/Element;

    move-result-object v3

    iput-object v3, p0, Lcom/android/internal/telephony/PhoneBase$CscChameleonParser;->mRoot:Lorg/w3c/dom/Node;

    .line 2033
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/android/internal/telephony/PhoneBase$CscChameleonParser;->isFileExist:Z

    .line 2038
    :goto_30
    return-void

    .line 2035
    :cond_31
    const-string v3, "PhoneBase"

    const-string v4, "[CscChameleonParser] update(): file not exist"

    invoke-static {v3, v4}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2036
    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/android/internal/telephony/PhoneBase$CscChameleonParser;->isFileExist:Z

    goto :goto_30
.end method


# virtual methods
.method public get(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .parameter "path"

    .prologue
    .line 2051
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/PhoneBase$CscChameleonParser;->search(Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 2053
    .local v0, node:Lorg/w3c/dom/Node;
    if-eqz v0, :cond_f

    .line 2054
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getFirstChild()Lorg/w3c/dom/Node;

    move-result-object v1

    invoke-interface {v1}, Lorg/w3c/dom/Node;->getNodeValue()Ljava/lang/String;

    move-result-object v1

    .line 2057
    :goto_e
    return-object v1

    :cond_f
    const/4 v1, 0x0

    goto :goto_e
.end method

.method public getOperatorAlpha()Ljava/lang/String;
    .registers 4

    .prologue
    .line 2041
    const-string v0, "PhoneBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[CscChameleonParser alpha] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Operators.BrandAlpha"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/PhoneBase$CscChameleonParser;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2042
    const-string v0, "Operators.BrandAlpha"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/PhoneBase$CscChameleonParser;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOperatorNumeric()Ljava/lang/String;
    .registers 4

    .prologue
    .line 2046
    const-string v0, "PhoneBase"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[CscChameleonParser numeric] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "Operators.AndroidOperatorNetworkCode"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/PhoneBase$CscChameleonParser;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 2047
    const-string v0, "Operators.AndroidOperatorNetworkCode"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/PhoneBase$CscChameleonParser;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public search(Ljava/lang/String;)Lorg/w3c/dom/Node;
    .registers 7
    .parameter "path"

    .prologue
    const/4 v3, 0x0

    .line 2061
    if-nez p1, :cond_5

    move-object v0, v3

    .line 2076
    :cond_4
    :goto_4
    return-object v0

    .line 2064
    :cond_5
    iget-object v0, p0, Lcom/android/internal/telephony/PhoneBase$CscChameleonParser;->mRoot:Lorg/w3c/dom/Node;

    .line 2065
    .local v0, node:Lorg/w3c/dom/Node;
    new-instance v2, Ljava/util/StringTokenizer;

    const-string v4, "."

    invoke-direct {v2, p1, v4}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 2067
    .local v2, tokenizer:Ljava/util/StringTokenizer;
    :goto_e
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 2068
    invoke-virtual {v2}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v1

    .line 2070
    .local v1, token:Ljava/lang/String;
    if-nez v0, :cond_1c

    move-object v0, v3

    .line 2071
    goto :goto_4

    .line 2073
    :cond_1c
    invoke-virtual {p0, v0, v1}, Lcom/android/internal/telephony/PhoneBase$CscChameleonParser;->search(Lorg/w3c/dom/Node;Ljava/lang/String;)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 2074
    goto :goto_e
.end method

.method public search(Lorg/w3c/dom/Node;Ljava/lang/String;)Lorg/w3c/dom/Node;
    .registers 9
    .parameter "parent"
    .parameter "name"

    .prologue
    const/4 v4, 0x0

    .line 2080
    if-nez p1, :cond_5

    move-object v0, v4

    .line 2098
    :cond_4
    :goto_4
    return-object v0

    .line 2084
    :cond_5
    invoke-interface {p1}, Lorg/w3c/dom/Node;->getChildNodes()Lorg/w3c/dom/NodeList;

    move-result-object v1

    .line 2086
    .local v1, children:Lorg/w3c/dom/NodeList;
    if-eqz v1, :cond_23

    .line 2087
    invoke-interface {v1}, Lorg/w3c/dom/NodeList;->getLength()I

    move-result v3

    .line 2089
    .local v3, n:I
    const/4 v2, 0x0

    .local v2, i:I
    :goto_10
    if-ge v2, v3, :cond_23

    .line 2090
    invoke-interface {v1, v2}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v0

    .line 2092
    .local v0, child:Lorg/w3c/dom/Node;
    invoke-interface {v0}, Lorg/w3c/dom/Node;->getNodeName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 2089
    add-int/lit8 v2, v2, 0x1

    goto :goto_10

    .end local v0           #child:Lorg/w3c/dom/Node;
    .end local v2           #i:I
    .end local v3           #n:I
    :cond_23
    move-object v0, v4

    .line 2098
    goto :goto_4
.end method
