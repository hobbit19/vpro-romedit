#
# VMOS/Pro ROM Editing tools
#

# Export Config
export workdir="$START_DIR/romcache/"
export version="1.0.1-beta"
#
# Main
#
version(){
    echo "EditingTools Service"
    echo "当前版本:$version"
    exit
}
unrom(){
echo "正在解ROM包 $romzip"
mkdir $workdir/
unzip $romzip -d $workdir/
echo "解压完成"
exit
}
zrom(){
echo "正在打ROM包 到$zromzip2/"
cd $workdir/
pwd
zip -r $zromzip2/ROM.zip ./
echo "打包完成 $zromzip2/ROM.zip"
exit
}
addxp(){
echo "正在添加Xposed... $zromzip"
unzip $TOOLKIT/$sdk/xp.zip -d $workdir/
echo "完成!"
exit
}
dellauncher(){
echo "正在移除官方桌面"
rm -rf $workdir/system/app/lawnchair
echo "完成!"
exit
}
fastdel_l(){
echo "正在一键精简ROM (安卓5精简方案)"
rm -rf $workdir/system/media/
rm -rf $workdir/res/
echo "完成!"
exit
}
addv4a(){
echo "正在添加蝰蛇音效... (卡住超过10秒就可退出了,已经安装成功)"
unzip $TOOLKIT/$sdk/v4a.zip -d $workdir/
echo "完成!"
exit
}
addgsans(){
echo "正在添加GoogleSans... (卡住超过10秒就可退出了,已经安装成功)"
unzip $TOOLKIT/all/gsans.zip -d $workdir/
echo "完成!"
exit
}
addbootmedia(){
echo "正在添加$bootmedia 开机动画... $zromzip"
cp $bootmedia $workdir/system/media/
echo "完成!"
exit
}
addapk(){
echo "正在添加$addapk/目录下的所有APK... $zromzip"
cp -R $addapk/* $workdir/system/app/
echo "完成!"
exit
}
delxp(){
echo "10秒后将移除ROM中的自带XP框架(对于97%的ROM会导致无法开机,后果自负)"
sleep 10
echo "继续?后悔可以退出。"
sleep 3
echo "正在移除 Xposed框架..."
rm -rf $workdir/system/xposed.prop
rm -rf $workdir/system/lib/libxposed_art.so
rm -rf $workdir/system/lib64/libxposed_art.so
rm -rf $workdir/system/framework/XposedBridge.jar
rm -rf $workdir/system/bin/app_process32
rm -rf $workdir/system/bin/app_process64
mv $workdir/system/bin/app_process32_bk $workdir/system/bin/app_process32
mv $workdir/system/bin/app_process64_bk $workdir/system/bin/app_process64
echo "完成"
exit
}
addwallpaper(){
echo "正在添加 $wallpaper 默认壁纸 到ROM"
rm -rf $workdir/data/system/users/0/
mkdir $workdir/data/
mkdir $workdir/data/system/
mkdir $workdir/data/system/users/
mkdir $workdir/data/system/users/0/
cp $wallpaper $workdir/data/system/users/0/wallpaper
echo "添加完成"
echo "你可能还需要干掉官方桌面才能使用默认壁纸"
echo "别问我怎么知道的。。。。"
echo
exit
}
addroot(){
echo a
}
delroot(){
echo "此操作将会删除ROM包中ROOT相关文件?3秒后继续，后悔现在可以退出"
sleep 3
echo "正在移除ROOT.."
rm -rf $workdir/system/xbin/daemonsu
rm -rf $workdir/system/xbin/su
rm -rf $workdir/system/app/Superuser/
rm -rf $workdir/system/app/superuser
rm -rf $workdir/system/app/supersu
echo "完成"
exit
}
#
# Run This Script Options
#
$@
exit