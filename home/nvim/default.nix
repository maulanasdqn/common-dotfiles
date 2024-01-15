{ pkgs, ... }:

{
  home.file.".config/nvim/settings.lua".source = ./lua/settings.lua;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      {
        plugin = vim-nix;
        type = "lua";
      }
      {
        plugin = vim-nixhash;
        type = "lua";
      }
      {
        plugin = cmp-path;
        type = "lua";
      }
      {
        plugin = cmp-vsnip;
        type = "lua";
      }
      {
        plugin = cmp-nvim-lsp;
        type = "lua";
      }
      {
        plugin = vim-vsnip;
        type = "lua";
      }
      {
        plugin = auto-pairs;
        type = "lua";
      }
      {
        plugin = plenary-nvim;
        type = "lua";
      }
      {
        plugin = blamer-nvim;
        type = "lua";
      }
      {
        plugin = codeium-vim;
        type = "lua";
      }
      {
        plugin = neoformat;
        type = "lua";
      }
      {
        plugin = nvim-web-devicons;
        type = "lua";
      }
      {
        plugin = rose-pine;
        type = "lua";
      }
      {
        plugin = nvim-notify;
        type = "lua";
      }
      {
        plugin = nui-nvim;
        type = "lua";
      }

      {
        plugin = noice-nvim;
        type = "lua";
        config = "${builtins.readFile ./lua/config/noice.lua}";
      }
      #{
      #  plugin = lualine-nvim;
      #  type = "lua";
      #  config = "${builtins.readFile ./lua/config/lualine.lua}";
      #}
      {
        plugin = lspsaga-nvim;
        type = "lua";
        config = "${builtins.readFile ./lua/config/lspsaga.lua}";
      }
      {
        plugin = lazy-lsp-nvim;
        type = "lua";
        config = "${builtins.readFile ./lua/config/lazy.lua}";
      }
      {
        plugin = nvim-treesitter;
        type = "lua";
        config = "${builtins.readFile ./lua/config/treesitter.lua}";
      }
      {
        plugin = nvim-tree-lua;
        type = "lua";
        config = "${builtins.readFile ./lua/config/tree.lua}";
      }
      {
        plugin = nvim-cmp;
        type = "lua";
        config = "${builtins.readFile ./lua/config/cmp.lua}";
      }
      {
        plugin = lspkind-nvim;
        type = "lua";
        config = "${builtins.readFile ./lua/config/lspkind.lua}";
      }
      {
        plugin = telescope-nvim;
        type = "lua";
        config = "${builtins.readFile ./lua/config/telescope.lua}";
      }
      {
        plugin = telescope-file-browser-nvim;
        type = "lua";
      }
      {
        plugin = indent-blankline-nvim;
        type = "lua";
        config = "${builtins.readFile ./lua/config/indent.lua}";
      }
      {
        plugin = nvim-lspconfig;
        type = "lua";
        config = "${builtins.readFile ./lua/config/lsp.lua}";
      }
      #{
      #  plugin = bufferline-nvim;
      #  type = "lua";
      #  config = "${builtins.readFile ./lua/config/bufferline.lua}";
      #}
    ];

    extraLuaConfig = ''
      ${builtins.readFile ./lua/maps.lua}
      ${builtins.readFile ./lua/settings.lua}
    '';

    extraPackages = with pkgs; [
      zig
      nixfmt
      ripgrep
      fd
      golangci-lint
      eza
      rnix-lsp
      prettierd
      emmet-ls
      luajitPackages.lua-lsp
      nodePackages.npm
      nodePackages.pnpm
      nodePackages.yarn
      nodePackages."typescript"
      nodePackages."pyright"
      nodePackages."typescript-language-server"
      nodePackages."vscode-langservers-extracted"
      nodePackages."@tailwindcss/language-server"
      nodePackages."live-server"
    ];
  };
}
