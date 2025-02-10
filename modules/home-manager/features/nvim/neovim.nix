{ pkgs, ... }:
{
  
  programs.neovim = 
    let
		toLua = str: "lua << EOF\n${str}\nEOF\n";
		toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in
	  {
	  enable = true;

	  extraPackages = with pkgs; [
        lua-language-server
        phpactor
		#rnix-lsp

		xclip
        wl-clipboard
        ripgrep

		luajitPackages.lua-lsp
      ];


      viAlias = true;
	  vimAlias = true;
	  vimdiffAlias = true;

	  extraLuaConfig = ''

	  ${builtins.readFile ./options.lua}

	  '';

      plugins = with pkgs.vimPlugins; [
        {
          plugin = nvim-lspconfig;
          config = toLuaFile ./plugin/lsp.lua;
        }

        {
          plugin = comment-nvim;
          config = toLua "require(\"Comment\").setup()";
        }

        {
          plugin = kanagawa-nvim;
          config = "colorscheme kanagawa";
        }


        neodev-nvim

        mason-nvim
        mason-lspconfig-nvim

        nvim-cmp 

        {
          plugin = nvim-cmp;
          config = toLuaFile ./plugin/cmp.lua;
        }

        {
          plugin = telescope-nvim;
          config = toLuaFile ./plugin/telescope.lua;
        }

        telescope-fzf-native-nvim

        cmp_luasnip
        cmp-nvim-lsp


        luasnip
        friendly-snippets


        lualine-nvim
        nvim-web-devicons

        vim-clang-format
        
        clangd_extensions-nvim

        zig-vim

        phpactor

        coc-tsserver


        {

          plugin = (nvim-treesitter.withPlugins (p: [
            p.tree-sitter-nix
            p.tree-sitter-vim
            p.tree-sitter-bash
            p.tree-sitter-lua
            p.tree-sitter-cpp
            p.tree-sitter-cmake
            p.tree-sitter-javascript
            p.tree-sitter-dockerfile
            p.tree-sitter-php
            p.tree-sitter-python
            p.tree-sitter-json
            p.tree-sitter-zig

          ]));
          config = toLuaFile ./plugin/treesitter.lua;
        }

        vim-nix

	];

    };
}
