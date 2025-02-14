{pkgs, lib, ...}: {

  vim = {
    theme = {
      enable = true;
      name = "tokyonight";
      style = "storm";
    };

      filetree.nvimTree.setupOpts.view.number = true;
      filetree.nvimTree.setupOpts.view.relative.number = true;

      options = {
        tabstop = 2;
        shiftwidth = 2;
        updatetime = 300;
        termguicolors = true;
        mouse = "a";

      };

    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;

    languages = {
      enableLSP = true;
      enableTreesitter = true;

      nix.enable = true;
      lua.enable = true;
      ts.enable = true;
      bash.enable = true;
      clang.enable = true;
      php.enable = true;
      zig.enable = true;
      python.enable = true;
      sql.enable = true;
    };

  };

}
