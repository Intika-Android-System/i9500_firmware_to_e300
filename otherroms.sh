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

## BUILD zip ## 
gedit port/system/build.prop port/META-INF/com/google/android/updater-script
echo "If this rom has additional apks or packages.. copy and paste it"
echo "Almost done... Please modify build.prop and updater-script(refer to README) and press ENTER."
read
cd port
rm -rf system/*~
rm -rf META-INF/com/google/android/*~
rm -rf META-INF/com/google/android/aroma*          ## Removes aroma installer-related files
rm -rf META-INF/com/google/android/update-binary-installer
cp -f ../binary/update-binary META-INF/com/google/android/update-binary  ## Replaces aroma installer updater binary

zip -r ROM.zip META-INF system boot.img 
mv ROM.zip ../ROM.zip
cd ../
rm -rf port
echo Done! Modifiy ROM.zip to your favorite name!
read

