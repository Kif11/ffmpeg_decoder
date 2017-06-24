exec_path="bin/main"

if [[ ! -d "bin" ]]; then
  mkdir bin
fi

# Grab the first version of ffmpeg in the brew directory
ffmpeg_versions=$(ls /usr/local/Cellar/ffmpeg)
ffmpeg_version=$(echo $ffmpeg_versions | cut -d " " -f 1)

# Compile
gcc main.cpp -o ${exec_path} -I/usr/local/Cellar/ffmpeg/${ffmpeg_version}/include -L/usr/local/Cellar/ffmpeg/${ffmpeg_version}/lib -lavcodec

echo "Run: mkdir output && $exec_path samples/no_container.h264 output/img.pgm"
