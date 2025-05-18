{ ... }: {

  vim = {
    theme = {
      enable = true;
      name = "tokyonight";
      style = "moon";
    };

      filetree.nvimTree.setupOpts.view.number = true;
      filetree.nvimTree.setupOpts.view.relative.number = true;

      options = {
        tabstop = 2;
        shiftwidth = 2;
        updatetime = 300;
        termguicolors = true;
        mouse = "a";
       # clipboard.append = "wl-clipboard";
      };
      
    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
    
    lsp.enable = true;

    languages = {
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
