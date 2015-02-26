#!/bin/bash
rm -rf ril port
mkdir port ril
mv -f *.zip port/
cd port
unzip *.zip
cd ../

## SYSTEM ##
\cp -rf files/system/* port/system/
cp -rf files/boot.img port/boot.img

## RIL-RELATED CODES ##
cp -rf port/system/framework/telephony-common.jar ril/telephony-common.jar
cd ril

## DECOMPILE ## 
jar -xvf telephony-common.jar
java -jar ../tool/baksmali.jar classes.dex -o out
cp -f ../smali/RIL* out/com/android/internal/telephony/
java -jar ../tool/smali.jar out -o classes.dex
jar -cvf telephony-common.jar META-INF classes.dex 
cp -f telephony-common.jar ../port/system/framework/telephony-common.jar
cd ../

## BUILD zip ## 
sed -i 's/GT-I9500/SHV-E300S/g' port/system/build.prop
sed -i 's/i9500/e300s/g' port/system/build.prop
sed -i 's/ja3gxx/jalteskt/g' port/system/build.prop
sed -i 's/ja3g/jalteskt/g' port/system/build.prop
gedit port/META-INF/com/google/android/updater-script
echo "Almost done... Please modify updater-script and press ENTER."
read
cd port
rm -rf system/*~
rm -rf META-INF/com/google/android/*~
zip -r ROM.zip META-INF system boot.img 
mv ROM.zip ../ROM.zip
cd ../
rm -rf port
echo Done! Modifiy ROM.zip to your favorite name!
read

