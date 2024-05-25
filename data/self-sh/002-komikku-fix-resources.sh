#!/usr/bin/env bash

# 出错退出
# 出错退出
# set -e

export HOME="$(cd "`dirname "$0"`"/..; pwd)"

echo ""
echo "test replace i18n-sy base resources ...."
# i18n/src/commonMain/resources/MR/zh-rCN/strings.xml
tmp_file="tmp_myfile.txt"
cat << EOF > $tmp_file
<string name="pref_source_related_mangas">相关推荐</string>
<string name="pref_source_related_mangas_summary">查看详情时显示相关推荐</string>
<string name="related_mangas_more">查看更多相关推荐</string>

# 同步数据
<string name="sync_error">同步书架失败</string>
<string name="sync_complete">同步书架完成</string>
<string name="sync_in_progress">同步已在进行中</string>
<string name="pref_sync_host">服务器</string>
<string name="pref_sync_host_summ">输入同步书架的服务器地址</string>
<string name="pref_sync_api_key">API密钥</string>
<string name="pref_sync_api_key_summ">输入API密钥以同步书架</string>
<string name="pref_sync_now_group_title">同步操作</string>
<string name="pref_sync_now">立即同步</string>
<string name="pref_sync_now_subtitle">立即启动数据同步</string>
<string name="pref_sync_service">服务</string>
<string name="pref_sync_service_category">同步</string>
<string name="pref_sync_automatic_category">自动同步</string>
<string name="pref_sync_interval">同步频率</string>
<string name="pref_choose_what_to_sync">选择要同步的内容</string>
<string name="syncyomi">SyncYomi</string>
<string name="last_synchronization">上次同步: %1$s</string>
<string name="google_drive">Google云盘</string>
<string name="pref_google_drive_sign_in">登录</string>
<string name="pref_google_drive_purge_sync_data">清除Google云盘中的同步数据</string>
<string name="google_drive_sync_data_purged">同步从Google Drive清除的数据</string>
<string name="google_drive_sync_data_not_found">在Google Drive中找不到同步数据</string>
<string name="google_drive_sync_data_purge_error">从Google Drive清除同步数据时出错，请尝试重新登录。</string>
<string name="google_drive_login_success">已登录Google Drive</string>
<string name="google_drive_login_failed">无法登录Google Drive: %s</string>
<string name="google_drive_not_signed_in">未登录Google Drive</string>
<string name="error_uploading_sync_data">将同步数据上传到Google Drive时出错</string>
<string name="error_deleting_google_drive_lock_file">删除Google云盘锁定同步文件时出错</string>
<string name="error_before_sync_gdrive">同步前出错: %s</string>
<string name="pref_purge_confirmation_title">清除确认</string>
<string name="pref_purge_confirmation_message">清除同步数据操作将从Google Drive中删除所有同步数据。你确定要继续吗？</string>
<string name="pref_sync_options">创建同步触发器</string>
<string name="pref_sync_options_summ">可用于设置同步触发器</string>
<string name="sync_on_chapter_read">阅读章节时同步</string>
<string name="sync_on_chapter_open">打开章节时同步</string>
<string name="sync_on_app_start">在应用程序启动时同步</string>
<string name="sync_on_app_resume">在应用程序恢复时同步</string>
<string name="sync_library">同步书架</string>

EOF
sed -i '/^$/d' $tmp_file
sed -i '/^#/d' $tmp_file
cat $tmp_file

t_file="i18n-sy/src/commonMain/resources/MR/zh-rCN/strings.xml"
if test -f $t_file ; then
  

  cat $tmp_file | while read line
    do   
    fix_txt="$line"
    echo "fix_txt: $fix_txt"
    find_txt=`echo "$fix_txt" | awk -F '\"' '{ print $2 }'`
    echo "find_txt: $find_txt"
    match=`grep "$find_txt" $t_file`
    if [ -z "$match" ]; then
      echo "$fix_txt" >> $t_file
    fi
  done

  # delete  </resources>
  sed -i '/<\/resources>/d' $t_file
  # replace </resources>
  echo "</resources>" >> $t_file

  echo ""
  echo "Fix file: $t_file"
  tail -n 50 $t_file
  echo ""
fi
rm -f $tmp_file
exit 0