#!/bin/sh
CONFIG_ROOT_PATH="/Users/jc/Desktop/yourproject/"
#循环数组
CHANNELID=("aaa" "bbb" "ccc")
for ((i=0;i<${#CHANNELID[@]};i++))
do
#删除
rm -rf "/Users/jc/Desktop/yourproject/build/"
#清除
  xcodebuild -target woMusic clean
    #修改plist
    /usr/libexec/PlistBuddy -c "set :CHANNELID ${CHANNELID[$i]}" /Users/jc/Desktop/yourproject/woMusic/AppConfig.plist
#打包
    xcodebuild -target woMusic -configuration Distribution -sdk iphoneos build
    #生成ipa
    xcrun -sdk iphoneos PackageApplication -v "/Users/jc/Desktop/yourproject/build/Release-iphoneos/yourapp.app" -o "/Users/jc/Desktop/yourproject/yourappname_${CHANNELID[$i]}.ipa"
done
