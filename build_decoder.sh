echo "Beginning Build:"
rm -r dist
mkdir -p dist
cd ../egame-ffmpeg
make clean
# for ffmpeg
#emconfigure ./configure --cc="emcc" --cxx="em++" --ar="emar" --prefix=$(pwd)/../WasmVideoPlayer/dist --enable-cross-compile --target-os=none \
#        --arch=x86_32 --cpu=generic --enable-gpl --disable-avdevice --disable-swresample --disable-postproc --disable-avfilter \
#        --disable-programs --disable-logging --disable-everything --enable-avformat --enable-decoder=hevc --enable-decoder=h264 --enable-decoder=aac \
#        --disable-ffplay --disable-ffprobe --disable-asm --disable-doc --disable-devices --disable-network --disable-hwaccels \
#        --disable-parsers --disable-bsfs --disable-debug --enable-protocol=file --enable-demuxer=mov --disable-indevs --disable-outdevs
# for egame-ffmpeg
emconfigure ./configure --cc="emcc" --cxx="em++" --ar="emar" --prefix=$(pwd)/../WasmVideoPlayer/dist --enable-cross-compile --target-os=none \
        --arch=x86_32 --cpu=generic --enable-gpl --enable-version3 --disable-avdevice --disable-swresample --disable-postproc --disable-avfilter \
        --disable-programs --disable-logging --disable-everything --enable-avformat --enable-decoder=hevc --enable-decoder=h264 --enable-decoder=aac \
        --disable-ffplay --disable-ffprobe --disable-ffserver --disable-asm --disable-doc --disable-devices --disable-network --disable-hwaccels \
        --disable-parsers --disable-bsfs --disable-debug --enable-protocol=file --enable-demuxer=mov --enable-demuxer=flv --enable-demuxer=live_flv --disable-indevs --disable-outdevs \
        --enable-debug --disable-optimizations
echo "Beginning Make:"
make
make install
cd ../WasmVideoPlayer
echo "Beginning Build Wasm:"
./build_decoder_wasm.sh
