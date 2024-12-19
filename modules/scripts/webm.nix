{ pkgs }: 

pkgs.writeShellScriptBin "convert2Webm" ''
input=$1
output=$2

  if [ ! -f "$1" ] || [ "$1" = '-h' ] || [ "$1" = '-help' ] || [ "$1" = '--help' ];then
  echo '
Convert a video file into a high quality .webm file. Outputs a .webm and log file. 

Usage:

<inputFileName> <outputFileName (do not include .webm)>'
  exit 1
fi

(ffmpeg -nostdin -i $input -c:v libvpx-vp9 -b:v 2M -pass 1 -an -f null /dev/null && \
 ffmpeg -i $input -c:v libvpx-vp9 -b:v 2M -pass 2 -c:a libopus $output.webm)
''



