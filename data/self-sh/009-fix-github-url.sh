#!/usr/bin/env bash

# 出错退出
# 出错退出
# set -e

export HOME="$(cd "`dirname "$0"`"/..; pwd)"

echo "fix github url"
t_file="data/src/main/java/tachiyomi/data/release/ReleaseServiceImpl.kt"
if test -f $t_file ; then

    #sed -i "s/https:\/\/api.github.com/https:\/\/down.npee.cn\/?https:\/\/api.github.com/g" $t_file

    echo ""
    echo "Fix file: $t_file"
    cat $t_file
    echo ""
fi

t_file="domain/src/main/java/tachiyomi/domain/release/model/Release.kt"
if test -f $t_file ; then

    sed -i 's/assets.find/"https:\/\/down.npee.cn\/?" + assets.find/g' $t_file

    echo ""
    echo "Fix file: $t_file"
    cat $t_file
    echo ""
fi



exit 0
