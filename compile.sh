#export PATH="/opt/hisi-linux/x86-arm/arm-hisiv500-linux/target/bin:$PATH" 
OUTPUT=$(pwd)/../hisilicon_deps
HIMMP_PATH=$(pwd)/../hi_35xx_sdk/v1/B/mpp2
rm -rf $(OUTPUT)/pj/lib/*
rm -rf $(OUTPUT)/pj/bin/*
rm -rf $(OUTPUT)/pj/pjlib.tar
rm -rf hisilicon
make distclean
make clean

#./configure --enable-shared --disable-static --enable-memalign-hack --target=arm-buildroot-linux-uclibcgnueabi --host=arm-buildroot-linux-uclibcgnueabi --prefix=$(pwd)/hisilicon/ --disable-small-filter --disable-large-filter --disable-speex-aec --disable-g711-codec --disable-l16-codec --disable-g722-codec --disable-g7221-codec --disable-speex-codec --disable-ilbc-codec --disable-sdl --disable-ffmpeg --disable-v4l2 --disable-openh264 --disable-bcg729 --disable-libyuv --disable-libwebrtc
HIMMP_INC="${HIMMP_PATH}/include" HIMMP_LIB="${HIMMP_PATH}/lib" DEST="${OUTPUT}" ./configure-hisi

CHIP_VERSION=1 make -j$(($(nproc)+1))

make install

DEST="${OUTPUT}" ./pack.sh