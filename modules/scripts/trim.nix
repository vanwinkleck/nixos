{ pkgs }: 

pkgs.writeShellScriptBin "trim" ''
input=$1
startTime=$2
endTime=$3
output=$4

if [ ! -f "$1" ] || [ "$1" = '-h' ] || [ "$1" = '-help' ] || [ "$1" = '--help' ];then
  echo '
Trim a video file

Usage:

<inputFileName.mp4> <startTime 00:00:00.0> <endTime 00:00:00.0> <outputFileName.mp4>'
  exit 1
fi

(${pkgs.ffmpeg}/bin/ffmpeg -nostdin -i "$input" -ss $startTime -to $endTime -c copy $output)
''



