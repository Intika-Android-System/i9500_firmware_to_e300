.class Lcom/android/internal/telephony/cat/SelectItemParams;
.super Lcom/android/internal/telephony/cat/CommandParams;
.source "CommandParams.java"


# instance fields
.field mLoadTitleIcon:Z

.field mMenu:Lcom/android/internal/telephony/cat/Menu;


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/cat/CommandDetails;Lcom/android/internal/telephony/cat/Menu;Z)V
    .registers 5
    .parameter "cmdDet"
    .parameter "menu"
    .parameter "loadTitleIcon"

    .prologue
    .line 181
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/cat/CommandParams;-><init>(Lcom/android/internal/telephony/cat/CommandDetails;)V

    .line 177
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/telephony/cat/SelectItemParams;->mMenu:Lcom/android/internal/telephony/cat/Menu;

    .line 178
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/cat/SelectItemParams;->mLoadTitleIcon:Z

    .line 182
    iput-object p2, p0, Lcom/android/internal/telephony/cat/SelectItemParams;->mMenu:Lcom/android/internal/telephony/cat/Menu;

    .line 183
    iput-boolean p3, p0, Lcom/android/internal/telephony/cat/SelectItemParams;->mLoadTitleIcon:Z

    .line 184
    return-void
.end method

.method constructor <init>(Lcom/android/internal/telephony/cat/CommandDetails;Lcom/android/internal/telephony/cat/Menu;ZZ)V
    .registers 5
    .parameter "cmdDet"
    .parameter "menu"
    .parameter "loadTitleIcon"
    .parameter "hasIcon"

    .prologue
    .line 188
    invoke-direct {p0, p1, p2, p3}, Lcom/android/internal/telephony/cat/SelectItemParams;-><init>(Lcom/android/internal/telephony/cat/CommandDetails;Lcom/android/internal/telephony/cat/Menu;Z)V

    .line 189
    invoke-virtual {p0, p4}, Lcom/android/internal/telephony/cat/CommandParams;->setHasIconTag(Z)V

    .line 190
    return-void
.end method


# virtual methods
.method setIcon(Landroid/graphics/Bitmap;)Z
    .registers 5
    .parameter "icon"

    .prologue
    .line 195
    if-eqz p1, :cond_31

    iget-object v2, p0, Lcom/android/internal/telephony/cat/SelectItemParams;->mMenu:Lcom/android/internal/telephony/cat/Menu;

    if-eqz v2, :cond_31

    .line 196
    iget-boolean v2, p0, Lcom/android/internal/telephony/cat/SelectItemParams;->mLoadTitleIcon:Z

    if-eqz v2, :cond_16

    iget-object v2, p0, Lcom/android/internal/telephony/cat/SelectItemParams;->mMenu:Lcom/android/internal/telephony/cat/Menu;

    iget-object v2, v2, Lcom/android/internal/telephony/cat/Menu;->titleIcon:Landroid/graphics/Bitmap;

    if-nez v2, :cond_16

    .line 197
    iget-object v2, p0, Lcom/android/internal/telephony/cat/SelectItemParams;->mMenu:Lcom/android/internal/telephony/cat/Menu;

    iput-object p1, v2, Lcom/android/internal/telephony/cat/Menu;->titleIcon:Landroid/graphics/Bitmap;

    .line 207
    :cond_14
    :goto_14
    const/4 v2, 0x1

    .line 209
    :goto_15
    return v2

    .line 199
    :cond_16
    iget-object v2, p0, Lcom/android/internal/telephony/cat/SelectItemParams;->mMenu:Lcom/android/internal/telephony/cat/Menu;

    iget-object v2, v2, Lcom/android/internal/telephony/cat/Menu;->items:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, i$:Ljava/util/Iterator;
    :cond_1e
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_14

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/cat/Item;

    .line 200
    .local v1, item:Lcom/android/internal/telephony/cat/Item;
    iget-object v2, v1, Lcom/android/internal/telephony/cat/Item;->icon:Landroid/graphics/Bitmap;

    if-nez v2, :cond_1e

    .line 203
    iput-object p1, v1, Lcom/android/internal/telephony/cat/Item;->icon:Landroid/graphics/Bitmap;

    goto :goto_14

    .line 209
    .end local v0           #i$:Ljava/util/Iterator;
    .end local v1           #item:Lcom/android/internal/telephony/cat/Item;
    :cond_31
    const/4 v2, 0x0

    goto :goto_15
.end method
