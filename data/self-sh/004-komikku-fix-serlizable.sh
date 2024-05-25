#!/usr/bin/env bash

# 出错退出
# 出错退出
# set -e

export HOME="$(cd "`dirname "$0"`"/..; pwd)"

t_file="app/src/main/java/eu/kanade/tachiyomi/ui/browse/RelatedMangasScreen.kt"
if test -f $t_file ; then
  # find_txt=": MetadataSource.GetMangaId"
  # match=`grep "$find_txt" $t_file`
  # if [ -n "$match" ]; then
    # sed -i "s/: MetadataSource.GetMangaId/: MetadataSource.GetMangaId, java.io.Serializable/g" $t_file
    sed -i "s/    private val getManga:/    @Transient private val getManga:/g" $t_file
    sed -i "s/    private val sourcePreferences:/    @Transient private val sourcePreferences:/g" $t_file
    sed -i "s/    private val libraryPreferences:/    @Transient private val libraryPreferences:/g" $t_file

    # sed -i "s/interface MangaRepository {/interface MangaRepository: java.io.Serializable {/g" domain/src/main/java/tachiyomi/domain/manga/repository/MangaRepository.kt
    echo ""
    echo "Fix file: $t_file"
    head -n 75 $t_file
    echo ""
  # fi
fi



exit 0