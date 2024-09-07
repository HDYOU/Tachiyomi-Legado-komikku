#!/usr/bin/env bash

# 出错退出
# 出错退出
# set -e

export HOME="$(cd "`dirname "$0"`"/..; pwd)"

echo "fix ext load ...."


# t_file="app/build.gradle.kts"
# sed -i '/dependencies {/a \    implementation("io.arrow-kt:arrow-stack:1.2.4")' $t_file
# sed -i '/dependencies {/a \    implementation("io.arrow-kt:arrow-fx-coroutines:1.2.4")' $t_file

echo ""
echo ""
cat -n $t_file
echo ""

t_file="app/src/main/java/eu/kanade/tachiyomi/extension/util/ExtensionLoader.kt"
if test -f $t_file ; then

sed -i 's/?: emptySequence()/?: emptyList()/g' $t_file

sed -i 's/privateExtPkgs = getPrivateExtensionDir(context)/privateExtPkgs =  runBlocking { val privateExtPkgs22 = getPrivateExtensionDir(context)/g'  $t_file

sed -i 's/it.setReadOnly()/async { it.setReadOnly()/g'  $t_file

sed -i '/?.filter { isPackageAnExtension(it) }/i \ }'  $t_file

sed -i '/?.filter { isPackageAnExtension(it) }/i \ privateExtPkgs22?.toList()?.awaitAll()?.filterNotNull()}'  $t_file

  echo "fix succ."
 echo ""
 echo ""
 cat -n $t_file
 echo ""
fi
exit 0