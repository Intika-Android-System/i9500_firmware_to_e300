.class public final enum Lcom/android/internal/telephony/AppDirectedSMS;
.super Ljava/lang/Enum;
.source "AppDirectedSMS.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/AppDirectedSMS$1;,
        Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;,
        Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/android/internal/telephony/AppDirectedSMS;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/android/internal/telephony/AppDirectedSMS; = null

.field private static final BUA_APP_PREFIX:Ljava/lang/String; = "BUA-ADS"

.field private static final BUA_SMS_PREFIX:Ljava/lang/String; = "//F1"

.field private static final COLON:Ljava/lang/String; = ":"

.field private static final DIRECTED_SMS_ACTION:Ljava/lang/String; = "verizon.intent.action.DIRECTED_SMS_RECEIVED"

.field private static final DIRECTED_SMS_META_DATA_NAME:Ljava/lang/String; = "com.verizon.directedAppSMS"

.field private static final DIRECTED_SMS_PERMISSION_NAME:Ljava/lang/String; = "com.verizon.permissions.appdirectedsms"

.field private static final EMAIL_SMS_NMN:Ljava/lang/String; = "VZWNMN:"

.field private static final EMAIL_SMS_PIN:Ljava/lang/String; = "VZWPIN:"

.field private static final EMAIL_SMS_PREFIX:Ljava/lang/String; = "VZW"

.field private static final EMAIL_SMS_RSC:Ljava/lang/String; = "VZWRSC:"

.field private static final EMAIL_SMS_UEP:Ljava/lang/String; = "VZWUEP:"

.field public static final enum INSTANCE:Lcom/android/internal/telephony/AppDirectedSMS; = null

.field private static final TAG:Ljava/lang/String; = "AppDirectedSMS"

.field private static final VZW_SMS_PREFIX:Ljava/lang/String; = "//VZW"


# instance fields
.field private mcontext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 21
    new-instance v0, Lcom/android/internal/telephony/AppDirectedSMS;

    const-string v1, "INSTANCE"

    invoke-direct {v0, v1, v2}, Lcom/android/internal/telephony/AppDirectedSMS;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/android/internal/telephony/AppDirectedSMS;->INSTANCE:Lcom/android/internal/telephony/AppDirectedSMS;

    .line 19
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/android/internal/telephony/AppDirectedSMS;

    sget-object v1, Lcom/android/internal/telephony/AppDirectedSMS;->INSTANCE:Lcom/android/internal/telephony/AppDirectedSMS;

    aput-object v1, v0, v2

    sput-object v0, Lcom/android/internal/telephony/AppDirectedSMS;->$VALUES:[Lcom/android/internal/telephony/AppDirectedSMS;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 81
    return-void
.end method

.method private findAppDirectedSMSPackage(Ljava/lang/String;)Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;
    .registers 16
    .parameter "message"

    .prologue
    const/4 v11, 0x0

    .line 200
    const/4 v0, 0x0

    .line 201
    .local v0, appMessage:Ljava/lang/String;
    const/4 v6, 0x0

    .line 202
    .local v6, packageName:Ljava/lang/String;
    const/4 v2, 0x0

    .line 203
    .local v2, componentName:Landroid/content/ComponentName;
    const/4 v1, 0x0

    .line 204
    .local v1, bundle:Landroid/os/Bundle;
    const/4 v10, 0x0

    .line 206
    .local v10, ri:Landroid/content/pm/ResolveInfo;
    new-instance v9, Landroid/content/Intent;

    invoke-direct {v9}, Landroid/content/Intent;-><init>()V

    .line 207
    .local v9, resolveIntent:Landroid/content/Intent;
    const-string v12, "verizon.intent.action.DIRECTED_SMS_RECEIVED"

    invoke-virtual {v9, v12}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 209
    const-string v12, "//VZW"

    invoke-virtual {p1, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_42

    .line 210
    const-string v12, "//VZW"

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v12

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v13

    invoke-virtual {p1, v12, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 215
    :goto_26
    iget-object v12, p0, Lcom/android/internal/telephony/AppDirectedSMS;->mcontext:Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v7

    .line 216
    .local v7, pm:Landroid/content/pm/PackageManager;
    const/4 v12, 0x0

    invoke-virtual {v7, v9, v12}, Landroid/content/pm/PackageManager;->queryBroadcastReceivers(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v8

    .line 218
    .local v8, queryResults:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    if-eqz v8, :cond_39

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v12

    if-gtz v12, :cond_44

    .line 219
    :cond_39
    const-string v12, "AppDirectedSMS"

    const-string v13, "findAppDirectedSMSPackage| queryResult is null or size is zero"

    invoke-static {v12, v13}, Landroid/util/secutil/Log;->secI(Ljava/lang/String;Ljava/lang/String;)I

    move-object v5, v11

    .line 248
    :cond_41
    return-object v5

    .line 212
    .end local v7           #pm:Landroid/content/pm/PackageManager;
    .end local v8           #queryResults:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    :cond_42
    move-object v0, p1

    goto :goto_26

    .line 222
    .restart local v7       #pm:Landroid/content/pm/PackageManager;
    .restart local v8       #queryResults:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    :cond_44
    new-instance v5, Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;

    invoke-direct {v5, p0, v11}, Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;-><init>(Lcom/android/internal/telephony/AppDirectedSMS;Lcom/android/internal/telephony/AppDirectedSMS$1;)V

    .line 223
    .local v5, matchInfo:Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;
    const/4 v4, 0x0

    .local v4, i:I
    :goto_4a
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v11

    if-ge v4, v11, :cond_41

    .line 224
    invoke-interface {v8, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    .end local v10           #ri:Landroid/content/pm/ResolveInfo;
    check-cast v10, Landroid/content/pm/ResolveInfo;

    .line 226
    .restart local v10       #ri:Landroid/content/pm/ResolveInfo;
    iget-object v11, v10, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v6, v11, Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;

    .line 227
    iget-object v11, v10, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v11, v11, Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;

    invoke-direct {p0, v11}, Lcom/android/internal/telephony/AppDirectedSMS;->verifyVZWAPPSignature(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_67

    .line 223
    :goto_64
    add-int/lit8 v4, v4, 0x1

    goto :goto_4a

    .line 231
    :cond_67
    new-instance v2, Landroid/content/ComponentName;

    .end local v2           #componentName:Landroid/content/ComponentName;
    iget-object v11, v10, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v11, v11, Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;

    iget-object v12, v10, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v12, v12, Landroid/content/pm/PackageItemInfo;->name:Ljava/lang/String;

    invoke-direct {v2, v11, v12}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 233
    .restart local v2       #componentName:Landroid/content/ComponentName;
    const/16 v11, 0x80

    :try_start_76
    invoke-virtual {v7, v2, v11}, Landroid/content/pm/PackageManager;->getReceiverInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v11

    iget-object v1, v11, Landroid/content/pm/PackageItemInfo;->metaData:Landroid/os/Bundle;

    .line 234
    invoke-direct {p0, v1, v0, v2, v5}, Lcom/android/internal/telephony/AppDirectedSMS;->startsWithMetaData(Landroid/os/Bundle;Ljava/lang/String;Landroid/content/ComponentName;Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;)V
    :try_end_7f
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_76 .. :try_end_7f} :catch_97

    .line 241
    :goto_7f
    const/16 v11, 0x80

    :try_start_81
    invoke-virtual {v7, v6, v11}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v11

    iget-object v1, v11, Landroid/content/pm/PackageItemInfo;->metaData:Landroid/os/Bundle;

    .line 242
    invoke-direct {p0, v1, v0, v2, v5}, Lcom/android/internal/telephony/AppDirectedSMS;->startsWithMetaData(Landroid/os/Bundle;Ljava/lang/String;Landroid/content/ComponentName;Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;)V
    :try_end_8a
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_81 .. :try_end_8a} :catch_8b

    goto :goto_64

    .line 243
    :catch_8b
    move-exception v3

    .line 244
    .local v3, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 245
    const-string v11, "AppDirectedSMS"

    const-string v12, "findAppDirectedSMSPackage| ApplicationInfo NameNotFoundException"

    invoke-static {v11, v12}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_64

    .line 235
    .end local v3           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_97
    move-exception v3

    .line 236
    .restart local v3       #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 237
    const-string v11, "AppDirectedSMS"

    const-string v12, "findAppDirectedSMSPackage| ReceiverInfo NameNotFoundException"

    invoke-static {v11, v12}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_7f
.end method

.method private findAppDirectedSMSPackageWithPrefix(Ljava/lang/String;)Landroid/content/ComponentName;
    .registers 16
    .parameter "appPrefix"

    .prologue
    const/4 v10, 0x0

    .line 147
    const/4 v9, 0x0

    .line 148
    .local v9, ri:Landroid/content/pm/ResolveInfo;
    const/4 v5, 0x0

    .line 149
    .local v5, packageName:Ljava/lang/String;
    const/4 v1, 0x0

    .line 150
    .local v1, componentName:Landroid/content/ComponentName;
    const/4 v0, 0x0

    .line 152
    .local v0, bundle:Landroid/os/Bundle;
    new-instance v8, Landroid/content/Intent;

    invoke-direct {v8}, Landroid/content/Intent;-><init>()V

    .line 153
    .local v8, resolveIntent:Landroid/content/Intent;
    const-string v11, "verizon.intent.action.DIRECTED_SMS_RECEIVED"

    invoke-virtual {v8, v11}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 155
    iget-object v11, p0, Lcom/android/internal/telephony/AppDirectedSMS;->mcontext:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    .line 156
    .local v6, pm:Landroid/content/pm/PackageManager;
    const/4 v11, 0x0

    invoke-virtual {v6, v8, v11}, Landroid/content/pm/PackageManager;->queryBroadcastReceivers(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v7

    .line 157
    .local v7, queryResults:Ljava/util/List;,"Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    if-eqz v7, :cond_22

    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v11

    if-gtz v11, :cond_2b

    .line 158
    :cond_22
    const-string v11, "AppDirectedSMS"

    const-string v12, "queryResult is null or size is zero"

    invoke-static {v11, v12}, Landroid/util/secutil/Log;->secI(Ljava/lang/String;Ljava/lang/String;)I

    move-object v2, v10

    .line 196
    :goto_2a
    return-object v2

    .line 162
    :cond_2b
    const/4 v4, 0x0

    .local v4, i:I
    :goto_2c
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v11

    if-ge v4, v11, :cond_f1

    .line 163
    invoke-interface {v7, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    .end local v9           #ri:Landroid/content/pm/ResolveInfo;
    check-cast v9, Landroid/content/pm/ResolveInfo;

    .line 164
    .restart local v9       #ri:Landroid/content/pm/ResolveInfo;
    iget-object v11, v9, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v5, v11, Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;

    .line 165
    iget-object v11, v9, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v11, v11, Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;

    invoke-direct {p0, v11}, Lcom/android/internal/telephony/AppDirectedSMS;->verifyVZWAPPSignature(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_49

    .line 162
    :cond_46
    :goto_46
    add-int/lit8 v4, v4, 0x1

    goto :goto_2c

    .line 170
    :cond_49
    :try_start_49
    new-instance v2, Landroid/content/ComponentName;

    iget-object v11, v9, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v11, v11, Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;

    iget-object v12, v9, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v12, v12, Landroid/content/pm/PackageItemInfo;->name:Ljava/lang/String;

    invoke-direct {v2, v11, v12}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_56
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_49 .. :try_end_56} :catch_d8

    .line 171
    .end local v1           #componentName:Landroid/content/ComponentName;
    .local v2, componentName:Landroid/content/ComponentName;
    const/16 v11, 0x80

    :try_start_58
    invoke-virtual {v6, v2, v11}, Landroid/content/pm/PackageManager;->getReceiverInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;

    move-result-object v11

    iget-object v0, v11, Landroid/content/pm/PackageItemInfo;->metaData:Landroid/os/Bundle;

    .line 173
    invoke-direct {p0, v0, p1}, Lcom/android/internal/telephony/AppDirectedSMS;->matchesMetaData(Landroid/os/Bundle;Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_96

    .line 174
    const-string v11, "AppDirectedSMS"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "findAppDirectedSMSPackageWithPrefix| package is found from receiver!!![package]="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, v9, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v13, v13, Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " [receiver]="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, v9, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v13, v13, Landroid/content/pm/PackageItemInfo;->name:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_94
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_58 .. :try_end_94} :catch_f4

    move-object v1, v2

    .line 176
    .end local v2           #componentName:Landroid/content/ComponentName;
    .restart local v1       #componentName:Landroid/content/ComponentName;
    goto :goto_2a

    .end local v1           #componentName:Landroid/content/ComponentName;
    .restart local v2       #componentName:Landroid/content/ComponentName;
    :cond_96
    move-object v1, v2

    .line 184
    .end local v2           #componentName:Landroid/content/ComponentName;
    .restart local v1       #componentName:Landroid/content/ComponentName;
    :goto_97
    const/16 v11, 0x80

    :try_start_99
    invoke-virtual {v6, v5, v11}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    move-result-object v11

    iget-object v0, v11, Landroid/content/pm/PackageItemInfo;->metaData:Landroid/os/Bundle;

    .line 185
    invoke-direct {p0, v0, p1}, Lcom/android/internal/telephony/AppDirectedSMS;->matchesMetaData(Landroid/os/Bundle;Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_46

    .line 186
    const-string v11, "AppDirectedSMS"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "findAppDirectedSMSPackageWithPrefix| package is found from application !!! [package]="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, v9, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v13, v13, Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, " [receiver]="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    iget-object v13, v9, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v13, v13, Landroid/content/pm/PackageItemInfo;->name:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v11, v12}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_d5
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_99 .. :try_end_d5} :catch_e4

    move-object v2, v1

    .line 188
    goto/16 :goto_2a

    .line 178
    :catch_d8
    move-exception v3

    .line 179
    .local v3, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :goto_d9
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 180
    const-string v11, "AppDirectedSMS"

    const-string v12, "findAppDirectedSMSPackageWithPrefix| ReceiverInfo NameNotFoundException"

    invoke-static {v11, v12}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_97

    .line 190
    .end local v3           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :catch_e4
    move-exception v3

    .line 191
    .restart local v3       #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v3}, Ljava/lang/Throwable;->printStackTrace()V

    .line 192
    const-string v11, "AppDirectedSMS"

    const-string v12, "findAppDirectedSMSPackageWithPrefix| ApplicationInfo NameNotFoundException"

    invoke-static {v11, v12}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_46

    .end local v3           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_f1
    move-object v2, v10

    .line 196
    goto/16 :goto_2a

    .line 178
    .end local v1           #componentName:Landroid/content/ComponentName;
    .restart local v2       #componentName:Landroid/content/ComponentName;
    :catch_f4
    move-exception v3

    move-object v1, v2

    .end local v2           #componentName:Landroid/content/ComponentName;
    .restart local v1       #componentName:Landroid/content/ComponentName;
    goto :goto_d9
.end method

.method private matchesMetaData(Landroid/os/Bundle;Ljava/lang/String;)Z
    .registers 5
    .parameter "bundle"
    .parameter "appPrefix"

    .prologue
    .line 324
    const/4 v0, 0x0

    .line 325
    .local v0, metaData:Ljava/lang/String;
    if-nez p1, :cond_5

    .line 326
    const/4 v1, 0x0

    .line 329
    :goto_4
    return v1

    .line 328
    :cond_5
    const-string v1, "com.verizon.directedAppSMS"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 329
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_4
.end method

.method private setBestMatchResult(Ljava/lang/String;Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;)V
    .registers 7
    .parameter "message"
    .parameter "msgInfo"

    .prologue
    .line 133
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/AppDirectedSMS;->findAppDirectedSMSPackage(Ljava/lang/String;)Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;

    move-result-object v0

    .line 135
    .local v0, matchInfo:Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;
    if-eqz v0, :cond_14

    iget-object v1, v0, Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;->mComponentName:Landroid/content/ComponentName;

    if-eqz v1, :cond_14

    .line 136
    iget-object v1, v0, Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;->mComponentName:Landroid/content/ComponentName;

    iget-object v2, v0, Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;->mParameter:Ljava/lang/String;

    iget-object v3, v0, Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;->mAppPrefix:Ljava/lang/String;

    invoke-virtual {p2, v1, v2, v3}, Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;->setSuccesfulResult(Landroid/content/ComponentName;Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    :cond_13
    :goto_13
    return-void

    .line 140
    :cond_14
    const-string v1, "//VZW"

    invoke-virtual {p1, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_13

    .line 141
    invoke-virtual {p2}, Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;->setNoRegisteredComponent()V

    .line 142
    const-string v1, "AppDirectedSMS"

    const-string v2, "setBestMatchResult| no component"

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->secI(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_13
.end method

.method private setResult(Ljava/lang/String;Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;Ljava/lang/String;)V
    .registers 7
    .parameter "parameter"
    .parameter "msgInfo"
    .parameter "appPrefix"

    .prologue
    .line 118
    invoke-direct {p0, p3}, Lcom/android/internal/telephony/AppDirectedSMS;->findAppDirectedSMSPackageWithPrefix(Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object v0

    .line 119
    .local v0, componentName:Landroid/content/ComponentName;
    if-eqz v0, :cond_a

    .line 120
    invoke-virtual {p2, v0, p1, p3}, Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;->setSuccesfulResult(Landroid/content/ComponentName;Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    :goto_9
    return-void

    .line 122
    :cond_a
    invoke-virtual {p2}, Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;->setNoRegisteredComponent()V

    .line 123
    const-string v1, "AppDirectedSMS"

    const-string v2, "setResult| no component"

    invoke-static {v1, v2}, Landroid/util/secutil/Log;->secI(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9
.end method

.method private startsWithMetaData(Landroid/os/Bundle;Ljava/lang/String;Landroid/content/ComponentName;Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;)V
    .registers 10
    .parameter "bundle"
    .parameter "appMessage"
    .parameter "component"
    .parameter "matchInfo"

    .prologue
    const/4 v4, 0x1

    .line 299
    const/4 v0, 0x0

    .line 300
    .local v0, metaData:Ljava/lang/String;
    const/4 v1, 0x0

    .line 301
    .local v1, parameter:Ljava/lang/String;
    if-eqz p1, :cond_87

    .line 302
    const-string v2, "com.verizon.directedAppSMS"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 303
    if-eqz v0, :cond_87

    .line 304
    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_87

    .line 305
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p2, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 306
    iget-object v2, p4, Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;->mAppPrefix:Ljava/lang/String;

    if-eqz v2, :cond_33

    iget-object v2, p4, Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;->mAppPrefix:Ljava/lang/String;

    if-eqz v2, :cond_87

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    iget-object v3, p4, Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;->mAppPrefix:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-le v2, v3, :cond_87

    .line 309
    :cond_33
    if-eqz v1, :cond_4b

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v2, v4, :cond_4b

    const-string v2, ":"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4b

    .line 310
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {v1, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 312
    :cond_4b
    iput-object v1, p4, Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;->mParameter:Ljava/lang/String;

    .line 313
    iput-object p3, p4, Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;->mComponentName:Landroid/content/ComponentName;

    .line 314
    iput-object v0, p4, Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;->mAppPrefix:Ljava/lang/String;

    .line 315
    const-string v2, "AppDirectedSMS"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "startsWithMetaData| match found [componentName]="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p4, Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;->mComponentName:Landroid/content/ComponentName;

    invoke-virtual {v4}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " [parameter]="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p4, Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;->mParameter:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " [appPrefix]="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p4, Lcom/android/internal/telephony/AppDirectedSMS$MatchInfo;->mAppPrefix:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/secutil/Log;->secD(Ljava/lang/String;Ljava/lang/String;)I

    .line 321
    :cond_87
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/android/internal/telephony/AppDirectedSMS;
    .registers 2
    .parameter "name"

    .prologue
    .line 19
    const-class v0, Lcom/android/internal/telephony/AppDirectedSMS;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/AppDirectedSMS;

    return-object v0
.end method

.method public static values()[Lcom/android/internal/telephony/AppDirectedSMS;
    .registers 1

    .prologue
    .line 19
    sget-object v0, Lcom/android/internal/telephony/AppDirectedSMS;->$VALUES:[Lcom/android/internal/telephony/AppDirectedSMS;

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/internal/telephony/AppDirectedSMS;

    return-object v0
.end method

.method private verifyVZWAPPSignature(Ljava/lang/String;)Z
    .registers 16
    .parameter "packageName"

    .prologue
    const/4 v10, 0x1

    const/4 v11, 0x0

    .line 252
    const/4 v0, 0x0

    .line 253
    .local v0, callingPackageInfo:Landroid/content/pm/PackageInfo;
    const/4 v8, 0x0

    .line 255
    .local v8, permissionPackageInfo:Landroid/content/pm/PackageInfo;
    iget-object v12, p0, Lcom/android/internal/telephony/AppDirectedSMS;->mcontext:Landroid/content/Context;

    invoke-virtual {v12}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v5

    .line 258
    .local v5, mPackageManager:Landroid/content/pm/PackageManager;
    const/16 v12, 0x40

    :try_start_c
    invoke-virtual {v5, p1, v12}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_f
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_c .. :try_end_f} :catch_19

    move-result-object v0

    .line 266
    iget-object v12, v0, Landroid/content/pm/PackageInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    iget v12, v12, Landroid/content/pm/ApplicationInfo;->flags:I

    and-int/lit8 v12, v12, 0x1

    if-eqz v12, :cond_26

    .line 295
    :goto_18
    return v10

    .line 260
    :catch_19
    move-exception v2

    .line 261
    .local v2, e:Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 262
    const-string v10, "AppDirectedSMS"

    const-string v12, "verifyVZWAPPSignature| calling pacakge NameNotFoundException"

    invoke-static {v10, v12}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    move v10, v11

    .line 263
    goto :goto_18

    .line 270
    .end local v2           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    :cond_26
    :try_start_26
    const-string v12, "com.verizon.permissions.appdirectedsms"

    const/16 v13, 0x40

    invoke-virtual {v5, v12, v13}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_2d
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_26 .. :try_end_2d} :catch_4e

    move-result-object v8

    .line 277
    iget-object v1, v0, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 278
    .local v1, callingPackageSignatures:[Landroid/content/pm/Signature;
    if-eqz v1, :cond_61

    .line 280
    iget-object v9, v8, Landroid/content/pm/PackageInfo;->signatures:[Landroid/content/pm/Signature;

    .line 282
    .local v9, permissionPackageSignatures:[Landroid/content/pm/Signature;
    array-length v6, v1

    .line 283
    .local v6, numberOfCallingPackageSignatures:I
    array-length v7, v9

    .line 285
    .local v7, numberOfPermissionPackageSignatures:I
    const/4 v3, 0x0

    .local v3, i:I
    :goto_37
    if-ge v3, v6, :cond_61

    .line 286
    const/4 v4, 0x0

    .local v4, j:I
    :goto_3a
    if-ge v4, v7, :cond_5e

    .line 287
    aget-object v12, v1, v3

    aget-object v13, v9, v4

    invoke-virtual {v12, v13}, Landroid/content/pm/Signature;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_5b

    .line 288
    const-string v11, "AppDirectedSMS"

    const-string v12, "verifyVZWAPPSignature| Signature of the application matched with verizon provided signatures"

    invoke-static {v11, v12}, Landroid/util/secutil/Log;->secI(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_18

    .line 271
    .end local v1           #callingPackageSignatures:[Landroid/content/pm/Signature;
    .end local v3           #i:I
    .end local v4           #j:I
    .end local v6           #numberOfCallingPackageSignatures:I
    .end local v7           #numberOfPermissionPackageSignatures:I
    .end local v9           #permissionPackageSignatures:[Landroid/content/pm/Signature;
    :catch_4e
    move-exception v2

    .line 272
    .restart local v2       #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 273
    const-string v10, "AppDirectedSMS"

    const-string v12, "verifyVZWAPPSignature| permission package NameNotFoundException"

    invoke-static {v10, v12}, Landroid/util/secutil/Log;->secE(Ljava/lang/String;Ljava/lang/String;)I

    move v10, v11

    .line 274
    goto :goto_18

    .line 286
    .end local v2           #e:Landroid/content/pm/PackageManager$NameNotFoundException;
    .restart local v1       #callingPackageSignatures:[Landroid/content/pm/Signature;
    .restart local v3       #i:I
    .restart local v4       #j:I
    .restart local v6       #numberOfCallingPackageSignatures:I
    .restart local v7       #numberOfPermissionPackageSignatures:I
    .restart local v9       #permissionPackageSignatures:[Landroid/content/pm/Signature;
    :cond_5b
    add-int/lit8 v4, v4, 0x1

    goto :goto_3a

    .line 285
    :cond_5e
    add-int/lit8 v3, v3, 0x1

    goto :goto_37

    .line 294
    .end local v3           #i:I
    .end local v4           #j:I
    .end local v6           #numberOfCallingPackageSignatures:I
    .end local v7           #numberOfPermissionPackageSignatures:I
    .end local v9           #permissionPackageSignatures:[Landroid/content/pm/Signature;
    :cond_61
    const-string v10, "AppDirectedSMS"

    const-string v12, "verifyVZWAPPSignature| app with no correct signature"

    invoke-static {v10, v12}, Landroid/util/secutil/Log;->secI(Ljava/lang/String;Ljava/lang/String;)I

    move v10, v11

    .line 295
    goto :goto_18
.end method


# virtual methods
.method public checkIfAppDirSMS(Landroid/content/Context;Ljava/lang/String;)Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;
    .registers 9
    .parameter "context"
    .parameter "message"

    .prologue
    .line 91
    iput-object p1, p0, Lcom/android/internal/telephony/AppDirectedSMS;->mcontext:Landroid/content/Context;

    .line 92
    new-instance v2, Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;

    invoke-direct {v2, p0}, Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;-><init>(Lcom/android/internal/telephony/AppDirectedSMS;)V

    .line 93
    .local v2, msgInfo:Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;
    const-string v4, "//F1"

    invoke-virtual {p2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1c

    .line 94
    const-string v4, "AppDirectedSMS"

    const-string v5, "checkIfAppDirSMS| BUA Message"

    invoke-static {v4, v5}, Landroid/util/secutil/Log;->secI(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    const-string v4, "BUA-ADS"

    invoke-direct {p0, p2, v2, v4}, Lcom/android/internal/telephony/AppDirectedSMS;->setResult(Ljava/lang/String;Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;Ljava/lang/String;)V

    .line 108
    :goto_1b
    return-object v2

    .line 97
    :cond_1c
    const-string v4, "VZWPIN:"

    invoke-virtual {p2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3c

    const-string v4, "VZWNMN:"

    invoke-virtual {p2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3c

    const-string v4, "VZWRSC:"

    invoke-virtual {p2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3c

    const-string v4, "VZWUEP:"

    invoke-virtual {p2, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_61

    .line 99
    :cond_3c
    const-string v4, "AppDirectedSMS"

    const-string v5, "checkIfAppDirSMS| Email Message"

    invoke-static {v4, v5}, Landroid/util/secutil/Log;->secI(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    const-string v4, ":"

    invoke-virtual {p2, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 101
    .local v1, colonOffset:I
    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {p2, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 102
    .local v3, parameter:Ljava/lang/String;
    const-string v4, "VZW"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    invoke-virtual {p2, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 103
    .local v0, appPrefix:Ljava/lang/String;
    invoke-direct {p0, v3, v2, v0}, Lcom/android/internal/telephony/AppDirectedSMS;->setResult(Ljava/lang/String;Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;Ljava/lang/String;)V

    goto :goto_1b

    .line 105
    .end local v0           #appPrefix:Ljava/lang/String;
    .end local v1           #colonOffset:I
    .end local v3           #parameter:Ljava/lang/String;
    :cond_61
    const-string v4, "AppDirectedSMS"

    const-string v5, "checkIfAppDirSMS| Not Email/BUA"

    invoke-static {v4, v5}, Landroid/util/secutil/Log;->secI(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    invoke-direct {p0, p2, v2}, Lcom/android/internal/telephony/AppDirectedSMS;->setBestMatchResult(Ljava/lang/String;Lcom/android/internal/telephony/AppDirectedSMS$AppMessageInfo;)V

    goto :goto_1b
.end method
