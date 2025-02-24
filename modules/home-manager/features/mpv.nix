{ ... }:
{
 programs.mpv = {
  enable = true;

  config = {
 	profile = "high-quality";
    #yt-dl-format = "bestvideo+bestaudio";
	#Always open the video player in full screen
	fullscreen= "yes";

	#Don't close the player after finishing the video
	keep-open = "yes";

	#The last position of your video is saved when quitting mpv
	save-position-on-quit = "yes";

	#Start mpv with a % smaller resolution of your screen
	#autofit=50%

	#Force seeking (if seeking doesn't work)
	force-seekable= "yes";

	#Cursor hide in ms
	cursor-autohide= "100";

	#Generate a playlist from same files in the same directory
	autocreate-playlist= "same";
	
	#Turns on software rendering for screenshots
	#Faster, but might lack stuff like HDR
  #screenshot-sw= "yes";

	#Output format of screenshots
	screenshot-format = "png";

	#Same output bitdepth as the video
	#Set it "no" if you want to save disc space
	screenshot-high-bit-depth = "yes";

	#Compression of the PNG picture (1-9)
	#Higher value means better compression, but takes more time
	screenshot-png-compression = "1";

	#Quality of JPG pictures (0-100)
	#Higher value means better quality
	screenshot-jpeg-quality = "95";

	#Output directory
	screenshot-dir="/home/rip/Pictures/Screenshots/mpv";

	#Name format you want to save the pictures
	screenshot-template="%f-%wH.%wM.%wS.%wT-#%#00n";

	#Audio language priority
	alang="ja,jp,jpn,en,eng";

	#Subtitle language priority
	slang="en,eng";
 };
  
 
};

}
