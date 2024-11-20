{ pkgs, ... }: {
  fonts.packages = with pkgs; [
	noto-fonts
  	noto-fonts-cjk-sans
  	noto-fonts-emoji
  	liberation_ttf
  	fira-code
  	fira-code-symbols
  	mplus-outline-fonts.githubRelease
  	proggyfonts
	cherry
	nerdfonts
	cozette
  ];
}
