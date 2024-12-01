{ pkgs, ... }: {
  fonts.packages = with pkgs; [
	noto-fonts
  	noto-fonts-cjk-sans
  	noto-fonts-emoji
  	liberation_ttf
  	fira-code
  	fira-code-symbols
  	mplus-outline-fonts.githubRelease
	cherry
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
	cozette
  ];
}
