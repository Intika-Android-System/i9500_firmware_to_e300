.class Lcom/movial/ipphone/WifiCallSwitchPreference$4;
.super Ljava/lang/Object;
.source "WifiCallSwitchPreference.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/movial/ipphone/WifiCallSwitchPreference;->onBindView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/movial/ipphone/WifiCallSwitchPreference;


# direct methods
.method constructor <init>(Lcom/movial/ipphone/WifiCallSwitchPreference;)V
    .registers 2
    .parameter

    .prologue
    .line 153
    iput-object p1, p0, Lcom/movial/ipphone/WifiCallSwitchPreference$4;->this$0:Lcom/movial/ipphone/WifiCallSwitchPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .registers 5
    .parameter "buttonView"
    .parameter "isChecked"

    .prologue
    .line 156
    iget-object v0, p0, Lcom/movial/ipphone/WifiCallSwitchPreference$4;->this$0:Lcom/movial/ipphone/WifiCallSwitchPreference;

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    #calls: Landroid/preference/Preference;->callChangeListener(Ljava/lang/Object;)Z
    invoke-static {v0, v1}, Lcom/movial/ipphone/WifiCallSwitchPreference;->access$100(Lcom/movial/ipphone/WifiCallSwitchPreference;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    .line 157
    if-nez p2, :cond_13

    const/4 v0, 0x1

    :goto_f
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 162
    :goto_12
    return-void

    .line 157
    :cond_13
    const/4 v0, 0x0

    goto :goto_f

    .line 160
    :cond_15
    iget-object v0, p0, Lcom/movial/ipphone/WifiCallSwitchPreference$4;->this$0:Lcom/movial/ipphone/WifiCallSwitchPreference;

    invoke-virtual {v0, p2}, Landroid/preference/TwoStatePreference;->setChecked(Z)V

    .line 161
    iget-object v0, p0, Lcom/movial/ipphone/WifiCallSwitchPreference$4;->this$0:Lcom/movial/ipphone/WifiCallSwitchPreference;

    invoke-virtual {v0}, Lcom/movial/ipphone/WifiCallSwitchPreference;->onSwitchClicked()V

    goto :goto_12
.end method
