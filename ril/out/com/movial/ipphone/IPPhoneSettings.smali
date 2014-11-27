.class public Lcom/movial/ipphone/IPPhoneSettings;
.super Ljava/lang/Object;
.source "IPPhoneSettings.java"


# static fields
.field public static final CELL_ONLY:Ljava/lang/String; = "CELL_ONLY"

.field public static final CLIP:Ljava/lang/String; = "CLIP"

.field public static final CONTENT_URI:Landroid/net/Uri; = null

.field public static final CSS_ENABLE:Ljava/lang/String; = "CSS_ENABLE"

.field public static final ECM:Ljava/lang/String; = "ECM"

.field public static final FIRST_WIFI_CALL:Ljava/lang/String; = "FIRST_WIFI_CALL"

.field public static final GBA_INIT:Ljava/lang/String; = "GBA_INIT"

.field public static final PREFERRED_OPTION:Ljava/lang/String; = "PREFERRED_OPTION"

.field public static final ROVE_IN:Ljava/lang/String; = "ROVE_IN"

.field public static final ROVE_OUT:Ljava/lang/String; = "ROVE_OUT"

.field public static final ROVE_THRESHOLD:Ljava/lang/String; = "ROVE_THRESHOLD"

.field private static TAG:Ljava/lang/String; = null

.field public static final WIFI_FIRST_TURNON:Ljava/lang/String; = "WIFI_FIRST_TURNON"

.field public static final WIFI_SETTINGS_FIRST_LAUNCHED:Ljava/lang/String; = "WIFI_SETTINGS_FIRST_LAUNCHED"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 51
    const-string v0, "IPPhoneSettings"

    sput-object v0, Lcom/movial/ipphone/IPPhoneSettings;->TAG:Ljava/lang/String;

    .line 53
    const-string v0, "content://ipprovider/ipphonesettings"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/movial/ipphone/IPPhoneSettings;->CONTENT_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z
    .registers 6
    .parameter "resolver"
    .parameter "name"
    .parameter "value"

    .prologue
    const/4 v1, 0x1

    const/4 v2, -0x1

    .line 124
    invoke-static {p0, p1, v2}, Lcom/movial/ipphone/IPPhoneSettings;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v0

    .line 125
    .local v0, i:I
    if-ne v0, v2, :cond_9

    .line 126
    .end local p2
    :goto_8
    return p2

    .restart local p2
    :cond_9
    if-ne v0, v1, :cond_d

    :goto_b
    move p2, v1

    goto :goto_8

    :cond_d
    const/4 v1, 0x0

    goto :goto_b
.end method

.method public static getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I
    .registers 5
    .parameter "resolver"
    .parameter "name"
    .parameter "value"

    .prologue
    .line 112
    const/4 v1, 0x0

    invoke-static {p0, p1, v1}, Lcom/movial/ipphone/IPPhoneSettings;->getString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 113
    .local v0, s:Ljava/lang/String;
    if-nez v0, :cond_8

    .line 116
    .end local p2
    :goto_7
    return p2

    .restart local p2
    :cond_8
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p2

    goto :goto_7
.end method

.method public static getString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 12
    .parameter "resolver"
    .parameter "name"
    .parameter "value"

    .prologue
    .line 86
    const/4 v6, 0x0

    .line 87
    .local v6, bFound:Z
    const/4 v7, 0x0

    .line 89
    .local v7, c:Landroid/database/Cursor;
    :try_start_2
    sget-object v1, Lcom/movial/ipphone/IPPhoneSettings;->CONTENT_URI:Landroid/net/Uri;

    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v3, "value"

    aput-object v3, v2, v0

    const-string v3, "name = ?"

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    aput-object p1, v4, v0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 90
    if-eqz v7, :cond_50

    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_50

    .line 92
    const/4 v0, 0x0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    .line 93
    const/4 v6, 0x1

    .line 94
    sget-object v0, Lcom/movial/ipphone/IPPhoneSettings;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getString("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_50
    .catchall {:try_start_2 .. :try_end_50} :catchall_8d
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_50} :catch_80

    .line 99
    :cond_50
    if-eqz v7, :cond_55

    :goto_52
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 101
    :cond_55
    if-nez v6, :cond_7f

    .line 102
    sget-object v0, Lcom/movial/ipphone/IPPhoneSettings;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getString("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ") = (default)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    :cond_7f
    return-object p2

    .line 96
    :catch_80
    move-exception v8

    .line 97
    .local v8, e:Ljava/lang/Exception;
    :try_start_81
    sget-object v0, Lcom/movial/ipphone/IPPhoneSettings;->TAG:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_8a
    .catchall {:try_start_81 .. :try_end_8a} :catchall_8d

    .line 99
    if-eqz v7, :cond_55

    goto :goto_52

    .end local v8           #e:Ljava/lang/Exception;
    :catchall_8d
    move-exception v0

    if-eqz v7, :cond_93

    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    :cond_93
    throw v0
.end method

.method public static putBoolean(Landroid/content/ContentResolver;Ljava/lang/String;Z)Z
    .registers 4
    .parameter "resolver"
    .parameter "name"
    .parameter "value"

    .prologue
    .line 120
    if-eqz p2, :cond_8

    const/4 v0, 0x1

    :goto_3
    invoke-static {p0, p1, v0}, Lcom/movial/ipphone/IPPhoneSettings;->putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z

    move-result v0

    return v0

    :cond_8
    const/4 v0, 0x0

    goto :goto_3
.end method

.method public static putInt(Landroid/content/ContentResolver;Ljava/lang/String;I)Z
    .registers 4
    .parameter "resolver"
    .parameter "name"
    .parameter "value"

    .prologue
    .line 108
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, p1, v0}, Lcom/movial/ipphone/IPPhoneSettings;->putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public static putString(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 8
    .parameter "resolver"
    .parameter "name"
    .parameter "value"

    .prologue
    .line 71
    sget-object v2, Lcom/movial/ipphone/IPPhoneSettings;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "putString("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ")"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 73
    :try_start_28
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 74
    .local v1, values:Landroid/content/ContentValues;
    const-string v2, "name"

    invoke-virtual {v1, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    const-string v2, "value"

    invoke-virtual {v1, v2, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    sget-object v2, Lcom/movial/ipphone/IPPhoneSettings;->CONTENT_URI:Landroid/net/Uri;

    invoke-virtual {p0, v2, v1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_3c} :catch_3e

    .line 78
    const/4 v2, 0x1

    .line 81
    .end local v1           #values:Landroid/content/ContentValues;
    :goto_3d
    return v2

    .line 79
    :catch_3e
    move-exception v0

    .line 80
    .local v0, e:Ljava/lang/Exception;
    sget-object v2, Lcom/movial/ipphone/IPPhoneSettings;->TAG:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    const/4 v2, 0x0

    goto :goto_3d
.end method
