.class Lcom/android/internal/telephony/TelephonyPropertiesEdit$1;
.super Landroid/content/BroadcastReceiver;
.source "TelephonyPropertiesEdit.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/TelephonyPropertiesEdit;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/telephony/TelephonyPropertiesEdit;


# direct methods
.method constructor <init>(Lcom/android/internal/telephony/TelephonyPropertiesEdit;)V
    .registers 2
    .parameter

    .prologue
    .line 46
    iput-object p1, p0, Lcom/android/internal/telephony/TelephonyPropertiesEdit$1;->this$0:Lcom/android/internal/telephony/TelephonyPropertiesEdit;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .registers 24
    .parameter "context"
    .parameter "intent"

    .prologue
    .line 49
    const-string v18, "TelephonyPropertiesEdit"

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "onReceive : "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v18 .. v19}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v18

    const-string v19, "NEW_CARD_CHECK"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_44

    .line 51
    const-string v18, "slotWitch"

    const/16 v19, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v17

    .line 52
    .local v17, slot:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/TelephonyPropertiesEdit$1;->this$0:Lcom/android/internal/telephony/TelephonyPropertiesEdit;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move/from16 v1, v17

    #calls: Lcom/android/internal/telephony/TelephonyPropertiesEdit;->setPropertyNewCard(I)V
    invoke-static {v0, v1}, Lcom/android/internal/telephony/TelephonyPropertiesEdit;->access$000(Lcom/android/internal/telephony/TelephonyPropertiesEdit;I)V

    .line 130
    .end local v17           #slot:I
    :cond_43
    :goto_43
    return-void

    .line 53
    :cond_44
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v18

    const-string v19, "ACTION_REGCARD_ICON_CHANGED"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_84

    .line 54
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v8

    .line 56
    .local v8, extras:Landroid/os/Bundle;
    const-string v18, "CDMA01_ICON_INDEX"

    const-string v19, "6"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v8, v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 57
    .local v6, cdmaIcon:Ljava/lang/String;
    const-string v18, "GSM_ICON_INDEX"

    const-string v19, "7"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v8, v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 58
    .local v10, gsm01Icon:Ljava/lang/String;
    const-string v18, "GSM02_ICON_INDEX"

    const-string v19, "8"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v8, v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 60
    .local v13, gsm02Icon:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/TelephonyPropertiesEdit$1;->this$0:Lcom/android/internal/telephony/TelephonyPropertiesEdit;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    #calls: Lcom/android/internal/telephony/TelephonyPropertiesEdit;->setPropertyIcon(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, v6, v10, v13}, Lcom/android/internal/telephony/TelephonyPropertiesEdit;->access$100(Lcom/android/internal/telephony/TelephonyPropertiesEdit;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_43

    .line 61
    .end local v6           #cdmaIcon:Ljava/lang/String;
    .end local v8           #extras:Landroid/os/Bundle;
    .end local v10           #gsm01Icon:Ljava/lang/String;
    .end local v13           #gsm02Icon:Ljava/lang/String;
    :cond_84
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v18

    const-string v19, "ACTION_REGCARD_CARDNAME_CHANGED"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_c4

    .line 62
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v8

    .line 64
    .restart local v8       #extras:Landroid/os/Bundle;
    const-string v18, "CDMA01_CARDNAME"

    const-string v19, "Slot 1"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v8, v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 65
    .local v7, cdmaName:Ljava/lang/String;
    const-string v18, "GSM_CARDNAME"

    const-string v19, "Slot 2"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v8, v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 66
    .local v11, gsm01Name:Ljava/lang/String;
    const-string v18, "GSM02_CARDNAME"

    const-string v19, "Slot 1"

    move-object/from16 v0, v18

    move-object/from16 v1, v19

    invoke-virtual {v8, v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 68
    .local v14, gsm02Name:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/TelephonyPropertiesEdit$1;->this$0:Lcom/android/internal/telephony/TelephonyPropertiesEdit;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    #calls: Lcom/android/internal/telephony/TelephonyPropertiesEdit;->setPropertyCardname(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, v7, v11, v14}, Lcom/android/internal/telephony/TelephonyPropertiesEdit;->access$200(Lcom/android/internal/telephony/TelephonyPropertiesEdit;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_43

    .line 69
    .end local v7           #cdmaName:Ljava/lang/String;
    .end local v8           #extras:Landroid/os/Bundle;
    .end local v11           #gsm01Name:Ljava/lang/String;
    .end local v14           #gsm02Name:Ljava/lang/String;
    :cond_c4
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v18

    const-string v19, "ACTION_NETWORK_ACTIVATE_STATE"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_f9

    .line 70
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v8

    .line 72
    .restart local v8       #extras:Landroid/os/Bundle;
    const-string v18, "CARDTYPE_CDMA01"

    move-object/from16 v0, v18

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 73
    .local v5, cdmaAct:Ljava/lang/String;
    const-string v18, "CARDTYPE_GSM"

    move-object/from16 v0, v18

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 74
    .local v9, gsm01Act:Ljava/lang/String;
    const-string v18, "CARDTYPE_GSM02"

    move-object/from16 v0, v18

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 76
    .local v12, gsm02Act:Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/TelephonyPropertiesEdit$1;->this$0:Lcom/android/internal/telephony/TelephonyPropertiesEdit;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    #calls: Lcom/android/internal/telephony/TelephonyPropertiesEdit;->setPropertyActivity(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v0, v5, v9, v12}, Lcom/android/internal/telephony/TelephonyPropertiesEdit;->access$300(Lcom/android/internal/telephony/TelephonyPropertiesEdit;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_43

    .line 77
    .end local v5           #cdmaAct:Ljava/lang/String;
    .end local v8           #extras:Landroid/os/Bundle;
    .end local v9           #gsm01Act:Ljava/lang/String;
    .end local v12           #gsm02Act:Ljava/lang/String;
    :cond_f9
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v18

    const-string v19, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_122

    .line 78
    const-string v18, "simSlot"

    const/16 v19, 0x0

    move-object/from16 v0, p2

    move-object/from16 v1, v18

    move/from16 v2, v19

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v17

    .line 79
    .restart local v17       #slot:I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/TelephonyPropertiesEdit$1;->this$0:Lcom/android/internal/telephony/TelephonyPropertiesEdit;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move/from16 v1, v17

    #calls: Lcom/android/internal/telephony/TelephonyPropertiesEdit;->setPropertyState(I)V
    invoke-static {v0, v1}, Lcom/android/internal/telephony/TelephonyPropertiesEdit;->access$400(Lcom/android/internal/telephony/TelephonyPropertiesEdit;I)V

    goto/16 :goto_43

    .line 85
    .end local v17           #slot:I
    :cond_122
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v18

    const-string v19, "ACTION_PLMN_UPDATE"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_161

    .line 86
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v8

    .line 88
    .restart local v8       #extras:Landroid/os/Bundle;
    const-string v18, "slot1"

    move-object/from16 v0, v18

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 89
    .local v15, sSwitchStateC:Ljava/lang/String;
    const-string v18, "slot2"

    move-object/from16 v0, v18

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 90
    .local v16, sSwitchStateG:Ljava/lang/String;
    const-string v18, "slot1State"

    move-object/from16 v0, v18

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    .line 91
    .local v3, bSwitchImgViewC:Z
    const-string v18, "slot2State"

    move-object/from16 v0, v18

    invoke-virtual {v8, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    .line 92
    .local v4, bSwitchImgViewG:Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/TelephonyPropertiesEdit$1;->this$0:Lcom/android/internal/telephony/TelephonyPropertiesEdit;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v16

    #calls: Lcom/android/internal/telephony/TelephonyPropertiesEdit;->setPropertyPLMN(Ljava/lang/String;Ljava/lang/String;ZZ)V
    invoke-static {v0, v15, v1, v3, v4}, Lcom/android/internal/telephony/TelephonyPropertiesEdit;->access$500(Lcom/android/internal/telephony/TelephonyPropertiesEdit;Ljava/lang/String;Ljava/lang/String;ZZ)V

    goto/16 :goto_43

    .line 93
    .end local v3           #bSwitchImgViewC:Z
    .end local v4           #bSwitchImgViewG:Z
    .end local v8           #extras:Landroid/os/Bundle;
    .end local v15           #sSwitchStateC:Ljava/lang/String;
    .end local v16           #sSwitchStateG:Ljava/lang/String;
    :cond_161
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v18

    const-string v19, "com.samsung.intent.action.Slot1OffCompleted"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_189

    .line 94
    const-string v18, "gsm.sim.active"

    const/16 v19, 0x0

    invoke-static/range {v18 .. v19}, Lcom/android/internal/telephony/MultiSimManager;->appendPropertySimSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v18

    const-string v19, "0"

    invoke-static/range {v18 .. v19}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    const-string v18, "gsm.sim.currentcardstatus"

    const/16 v19, 0x0

    invoke-static/range {v18 .. v19}, Lcom/android/internal/telephony/MultiSimManager;->appendPropertySimSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v18

    const-string v19, "2"

    invoke-static/range {v18 .. v19}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_43

    .line 102
    :cond_189
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v18

    const-string v19, "com.samsung.intent.action.Slot1OnCompleted"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_1b1

    .line 103
    const-string v18, "gsm.sim.active"

    const/16 v19, 0x0

    invoke-static/range {v18 .. v19}, Lcom/android/internal/telephony/MultiSimManager;->appendPropertySimSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v18

    const-string v19, "0"

    invoke-static/range {v18 .. v19}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    const-string v18, "gsm.sim.currentcardstatus"

    const/16 v19, 0x0

    invoke-static/range {v18 .. v19}, Lcom/android/internal/telephony/MultiSimManager;->appendPropertySimSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v18

    const-string v19, "3"

    invoke-static/range {v18 .. v19}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_43

    .line 111
    :cond_1b1
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v18

    const-string v19, "com.samsung.intent.action.Slot2OffCompleted"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_1d9

    .line 112
    const-string v18, "gsm.sim.active"

    const/16 v19, 0x1

    invoke-static/range {v18 .. v19}, Lcom/android/internal/telephony/MultiSimManager;->appendPropertySimSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v18

    const-string v19, "0"

    invoke-static/range {v18 .. v19}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    const-string v18, "gsm.sim.currentcardstatus"

    const/16 v19, 0x1

    invoke-static/range {v18 .. v19}, Lcom/android/internal/telephony/MultiSimManager;->appendPropertySimSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v18

    const-string v19, "2"

    invoke-static/range {v18 .. v19}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_43

    .line 120
    :cond_1d9
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v18

    const-string v19, "com.samsung.intent.action.Slot2OnCompleted"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v18

    if-eqz v18, :cond_43

    .line 121
    const-string v18, "gsm.sim.active"

    const/16 v19, 0x1

    invoke-static/range {v18 .. v19}, Lcom/android/internal/telephony/MultiSimManager;->appendPropertySimSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v18

    const-string v19, "0"

    invoke-static/range {v18 .. v19}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 122
    const-string v18, "gsm.sim.currentcardstatus"

    const/16 v19, 0x1

    invoke-static/range {v18 .. v19}, Lcom/android/internal/telephony/MultiSimManager;->appendPropertySimSlot(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v18

    const-string v19, "3"

    invoke-static/range {v18 .. v19}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_43
.end method
