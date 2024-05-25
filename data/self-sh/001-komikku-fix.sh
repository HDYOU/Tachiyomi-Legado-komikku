#!/usr/bin/env bash

# 出错退出
# 出错退出
# set -e

export HOME="$(cd "`dirname "$0"`"/..; pwd)"

echo "test run-self-script ...."
t_file="app/src/main/java/eu/kanade/tachiyomi/extension/api/ExtensionApi.kt"
if[ -f $t_file ]; then
  find_txt="^                getExtensionRepo.getAll()"
  match=`grep "$find_txt" $t_file`
  if [ -n "$match" ]; then
    sed -ir "s/^                getExtensionRepo.getAll()/                addAll(getExtensionRepo.getAll()/" app/build.gradle.kts
    sed -i "s/.flatten()/.flatten())/" app/build.gradle.kts
    echo ""
    echo "Fix file: $t_file"
    cat $t_file
    echo ""
  fi
fi

exit 0