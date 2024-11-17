{ config, inputs, pkgs, ... }:
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
		#rnix-lsp

		xclip
		wl-clipboard

		luajitPackages.lua-lsp
	];

	viAlias = true;
	vimAlias = true;
	vimdiffAlias = true;

	extraLuaConfig = ''

	${builtins.readFile ./features/nvim/options.lua}

	'';

	plugins = with pkgs.vimPlugins; [
	 {
        plugin = nvim-lspconfig;
        config = toLuaFile ./features/nvim/plugin/lsp.lua;
      }

      {
        plugin = comment-nvim;
        config = toLua "require(\"Comment\").setup()";
      }

      {
        plugin = tokyonight-nvim;
        config = "colorscheme tokyonight-night";
      }

      neodev-nvim

      mason-nvim
      mason-lspconfig-nvim

      nvim-cmp 
      {
        plugin = nvim-cmp;
        config = toLuaFile ./features/nvim/plugin/cmp.lua;
      }

      {
        plugin = telescope-nvim;
        config = toLuaFile ./features/nvim/plugin/telescope.lua;
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
      #clang_complete

      zig-vim 

        {
          plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-json
          p.tree-sitter-zig
          ]));
         config = toLuaFile ./features/nvim/plugin/treesitter.lua;
        }

      vim-nix

	];

    };
}
