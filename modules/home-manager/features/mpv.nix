{ pkgs, config, ... }:
{
 programs.mpv = {
  enable = true;

  config = {
 	profile = "high-quality";
	yt-dl-format = "bestvideo+bestaudio";
 };
  
 
};

}
