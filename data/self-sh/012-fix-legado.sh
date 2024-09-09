#!/usr/bin/env bash

# 出错退出
# 出错退出
# set -e

export HOME="$(cd "`dirname "$0"`"/..; pwd)"


t_file="mangaLegado/build.gradle"
if test -f $t_file ; then

 sed -i 's/compileOnly(libs.injekt.core)/compileOnly(libs.injekt)/g' $t_file

 echo "fix succ."
 echo ""
 echo ""
 cat -n $t_file
 echo ""
fi
exit 0
