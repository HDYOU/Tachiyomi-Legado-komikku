#!/usr/bin/env bash

# 出错退出
# 出错退出
# set -e

export HOME="$(cd "`dirname "$0"`"/..; pwd)"

echo ""
echo "test replace base resources ...."
# i18n/src/commonMain/resources/MR/zh-rCN/strings.xml
tmp_file="tmp_myfile.txt"
cat << EOF > $tmp_file
<string name="action_source_search">搜索图源</string> 
<string name="whats_coming">测试版本-更新日志(快)</string> 
<string name="update_check_try_now">现在下载</string> 
<string name="download_cache_renew_interval">下载缓存失效间隔</string> 
<string name="download_cache_renew_interval_manual">手动</string> 
<string name="download_cache_renew_interval_1hour">1 小时</string> 
<string name="download_cache_renew_interval_2hour">2 小时</string> 
<string name="download_cache_renew_interval_6hour">6 小时</string> 
<string name="download_cache_renew_interval_12hour">12 小时</string> 
<string name="download_cache_renew_interval_24hour">1 天</string> 
<string name="download_cache_renew_interval_info">如果设置为"手动"，则需要使用 "高级"->"无效下载索引"选项操作来刷新每个漫画的失效下载缓存</string> 
<string name="pref_clean_invalid_downloads">清除无效下载</string> 
<string name="pref_clean_invalid_downloads_summary">查找并删除书架中未保存的所有下载、文件和文件夹</string> 
<string name="invalid_downloads_cleaned">已清除无效下载</string> 
EOF
sed -i '/^$/d' $tmp_file
sed -i '/^#/d' $tmp_file
cat $tmp_file

t_file="i18n/src/commonMain/resources/MR/zh-rCN/strings.xml"
if test -f $t_file ; then
  

  cat $tmp_file | while read line
    do   
    fix_txt="$line"
    echo "fix_txt: $fix_txt"
    find_txt=`echo "$fix_txt" | awk -F '\"' '{ print $3 }'`
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