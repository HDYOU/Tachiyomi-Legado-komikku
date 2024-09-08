#!/usr/bin/env bash

# 出错退出
# 出错退出
# set -e

export HOME="$(cd "`dirname "$0"`"/..; pwd)"

echo "fix ext icon load ...."

t_file="app/src/main/java/eu/kanade/tachiyomi/extension/ExtensionManager.kt"
if test -f $t_file ; then

sed -i 's/return getAppIconForSource(source.id)/return _installedExtensionsFlow.value.find { ext -> ext.sources.any { it.id == source.id } }?.icon/g' $t_file

 echo "fix succ."
 echo ""
 echo ""
 head -n 100 $t_file
 echo ""
fi
exit 0