#!/bin/sh

# 出错退出
# set -e

export HOME="$(
    cd "$(dirname "$0")"/..
    pwd
)"

ls /bin/sh -al 

echo "run path: $PWD"

tmp_file="tmp_myfile.txt"
cat << EOF > $tmp_file
build.gradle.kts 
CONTRIBUTING.md 
app/src/main/java/exh/log/CrashlyticsPrinter.kt 
gradle/sy.versions.toml 
app/src/main/java/eu/kanade/tachiyomi/crash/GlobalExceptionHandler.kt 
app/build.gradle.kts 
app/src/main/java/eu/kanade/tachiyomi/App.kt 
gradle/libs.versions.toml 
app/src/main/java/eu/kanade/tachiyomi/ui/main/MainActivity.kt 
app/proguard-rules.pro 
app/src/main/java/eu/kanade/tachiyomi/ui/setting/SettingsAdvancedController.kt 
EOF

sed -i 's/ //g' $tmp_file
sed -i '/^$/d' $tmp_file
sed -i '/^#/d' $tmp_file
cat $tmp_file

cat $tmp_file | while read line
do   
    file_path=`echo $line | sed 's/ //g'`
    if [ -e "$file_path" ]; then
        sed -i '/firebase/d' "$file_path"
        sed -i '/Firebase/d' "$file_path"
    fi
done
rm -rf $tmp_file

file_path="app/src/standard/java/mihon/core/firebase/FirebaseConfig.kt"
    if [ -e "$file_path" ]; then
        sed -i '/firebase/d' "$file_path"
        sed -i '/Firebase/d' "$file_path"
        sed -i '/analytics/d' "$file_path"
        sed -i '/crashlytics/d' "$file_path"
    fi
head $file_path

exit 0
