OUTPUT=$(pwd)/../hisilicon_deps

find ./hisilicon/ -name \*.so* -exec cp {} --no-dereference $OUTPUT/pj/lib/ \;
find ${OUTPUT}/opus/lib/ -name \*.so* -exec cp {} --no-dereference $OUTPUT/pj/lib/ \;

cp -r ./hisilicon/include $OUTPUT/pj/
# find ./hisilicon/ -name \*.so.[0-9]* -exec cp {} --no-dereference /tftpboot/pj/lib/ \;

# find ./third_party/ffmpeg/hisilicon/ -name \*.so -exec cp -av {} --no-dereference /tftpboot/pj/lib/ \;
#find ./third_party/ffmpeg/hisilicon/ -name \*.so* -type f -exec cp {} /tftpboot/pj/lib/ \;
# find ./third_party/ffmpeg/hisilicon/ -lname \*.so* -exec cp {} --no-dereference /tftpboot/pj/lib/ \;

#find ./third_party/ffmpeg/hisilicon/ -name \*.so* -type l -exec cp {} --no-dereference /tftpboot/pj/lib/ \;

# find ./third_party/openh264/hisilicon/ -name \*.so* -type f -exec cp {} --no-dereference /tftpboot/pj/lib/ \;
# find ./third_party/openh264/hisilicon/ -name \*.so* -type l -exec cp {} --no-dereference /tftpboot/pj/lib/ \;

# find /home/ussh/work/ARM/CAMERA/hi3518/WRTED/camopenwrt_docker/hi35xx-br/output/build/libopenh264-v1.8.0/ -name \*.so* -type l -exec cp {} --no-dereference /tftpboot/pj/lib/ \;
# find /home/ussh/work/ARM/CAMERA/hi3518/WRTED/camopenwrt_docker/hi35xx-br/output/build/libopenh264-v1.8.0/ -name \*.so* -type f -exec cp {} --no-dereference /tftpboot/pj/lib/ \;

# find . -name \*.so.2 -exec cp {} /tftpboot/pj/lib/ \;
# find . -name \*.so.5* -exec cp {} /tftpboot/pj/lib/ \;
# find . -name \*.so.7* -exec cp {} /tftpboot/pj/lib/ \;
# find . -name \*.so.3* -exec cp {} /tftpboot/pj/lib/ \;
# find . -name \*.so.2 -exec cp {} /tftpboot/pj/lib/ \;
# cp $(pwd)/pjsip-apps/bin/pjsua-arm-buildroot-linux-uclibcgnueabi /tftpboot/pj/bin/pjsua
mkdir $OUTPUT/pj/bin/
cp $(pwd)/pjsip-apps/bin/pjsua-arm-hisiv500-linux-gnu $OUTPUT/pj/bin/pjsua
# cp $(pwd)/third_party/ffmpeg/hisilicon/bin/ffmpeg /tftpboot/pj/bin/
# cp /tftpboot/libx264.so.150 /tftpboot/pj/lib/libx264.so.150

# BINARY_DIR=$(dirname $(echo $(which arm-buildroot-linux-uclibcgnueabi-gcc)))
# STAGING_DIR=$BINARY_DIR/../arm-buildroot-linux-uclibcgnueabi/sysroot
# UC_LIB_DIR=$STAGING_DIR/usr/lib


# find ${UC_LIB_DIR} -name \*libSDL2-2.0.\* -exec cp {} /tftpboot/pj/lib/ \;

# cp ${UC_LIB_DIR}/libSDL-1.2.* /tftpboot/pj/lib/
# cp $(pwd)/pjsip/bin/pjsua2-test-arm-buildroot-linux-uclibcgnueabi /tftpboot/pj/bin/pjsua2

# arm-buildroot-linux-uclibcgnueabi-strip /tftpboot/pj/lib/*
# arm-buildroot-linux-uclibcgnueabi-strip /tftpboot/pj/bin/*

arm-hisiv500-linux-strip $OUTPUT/pj/lib/*
arm-hisiv500-linux-strip $OUTPUT/pj/bin/*

# tar cf /tftpboot/pj/pjlib.tar  -C /tftpboot/pj/ lib bin
tar cf $OUTPUT/pj/pjlib.tar  -C $OUTPUT/pj/ lib bin
