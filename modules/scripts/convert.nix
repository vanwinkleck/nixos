{ pkgs }: 

pkgs.writeShellScriptBin "convert" ''
input=$1
quality=$2
output=$3

if [ ! -f "$1" ] || [ "$1" = '-h' ] || [ "$1" = '-help' ] || [ "$1" = '--help' ];then
  echo '
Convert a video file to a twitter/discord/etc usable mp4

Usage:

<inputFileName.webm> <quality value (20-32 is a good range)> <outputFileName.mp4>'
  exit 1
fi

(ffmpeg -nostdin -i $input -c:v libx264 -crf $quality -preset slow -vf format=yuv420p -c:a aac -movflags +faststart $output)
''



