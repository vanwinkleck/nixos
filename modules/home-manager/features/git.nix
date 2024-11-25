{ ... }: {
  
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "vanwinkleck";
    userEmail = "vanwinkleck@protonmail.com";
    extraConfig = {
      init.defaultBranch = "master";
    };
  };

}
