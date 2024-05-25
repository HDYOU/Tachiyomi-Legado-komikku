#!/usr/bin/env bash

# 出错退出
# 出错退出
# set -e

export HOME="$(cd "`dirname "$0"`"/..; pwd)"

t_file="domain/src/main/java/tachiyomi/domain/manga/interactor/GetManga.kt"
if test -f $t_file ; then
  find_txt=": MetadataSource.GetMangaId"
  match=`grep "$find_txt" $t_file`
  if [ -n "$match" ]; then
    sed -i "s/: MetadataSource.GetMangaId/: MetadataSource.GetMangaId, java.io.Serializable/g" $t_file
    echo ""
    echo "Fix file: $t_file"
    head -n 75 $t_file
    echo ""
  fi
fi

exit 0