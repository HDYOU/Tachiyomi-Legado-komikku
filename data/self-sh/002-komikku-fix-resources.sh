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