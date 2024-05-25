#!/usr/bin/env bash

# 出错退出
# 出错退出
# set -e

export HOME="$(cd "`dirname "$0"`"/..; pwd)"

echo ""
echo "test replace resources ...."
# <string name="pref_source_related_mangas">相关推荐</string>
# <string name="pref_source_related_mangas_summary">查看详情时显示相关推荐</string>
# <string name="related_mangas_more">查看更多相关推荐</string>
t_file="i18n-sy/src/commonMain/resources/MR/zh-rCN/strings.xml"
if test -f $t_file ; then
  # delete  </resources>
  sed -i '/<\/resources>/d' $t_file

  find_txt="pref_source_related_mangas"
  match=`grep "$find_txt" $t_file`
  if [ -z "$match" ]; then
    echo '<string name="pref_source_related_mangas">相关推荐</string>' >> $t_file
  fi

  find_txt="pref_source_related_mangas_summary"
  match=`grep "$find_txt" $t_file`
  if [ -z "$match" ]; then
    echo '<string name="pref_source_related_mangas_summary">查看详情时显示相关推荐</string>' >> $t_file
  fi

  find_txt="related_mangas_more"
  match=`grep "$find_txt" $t_file`
  if [ -z "$match" ]; then
    echo '<string name="related_mangas_more">查看更多相关推荐</string>' >> $t_file
  fi


  # replace </resources>
  echo "</resources>" >> $t_file

  echo ""
  echo "Fix file: $t_file"
  tail -n 20 $t_file
  echo ""
fi

exit 0