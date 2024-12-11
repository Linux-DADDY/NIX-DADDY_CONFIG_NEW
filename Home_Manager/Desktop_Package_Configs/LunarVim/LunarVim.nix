{pkgs, ...}: {
  home.packages = with pkgs; [
    lunarvim
    # Install Missing Packages
    gnumake
    python3
    nodejs
    cargo
    lazygit
    wget
    stylua
    code-minimap
    gcc
    ripgrep
    fd
    prettierd
    eslint_d
    nodePackages_latest.live-server
    nodePackages_latest.pnpm
    typescript
    # nil
    nixpkgs-fmt
    nodePackages_latest.typescript-language-server
    python311Packages.json5
    python311Packages.pip
    # deno
    # imagemagick
    luajitPackages.magick
    luajitPackages.luarocks-nix
    rust-analyzer
    python311Packages.pynvim
    lua-language-server
    # bottom

    # Nix Formatter
    alejandra
  ];

  # Config
  home.file.".config/lvim/config.lua".text = builtins.readFile ./lvim/config.lua;
  # home.file.".config/lvim/lazy-lock.json".text = builtins.readFile ./lvim/lazy-lock.json;

  # Lua/user
  home.file.".config/lvim/lua/user/lsp.lua".text = builtins.readFile ./lvim/lua/user/lsp.lua;
  home.file.".config/lvim/lua/user/kind.lua".text = builtins.readFile ./lvim/lua/user/kind.lua;
  home.file.".config/lvim/lua/user/octo.lua".text = builtins.readFile ./lvim/lua/user/octo.lua;
  home.file.".config/lvim/lua/user/noice.lua".text = builtins.readFile ./lvim/lua/user/noice.lua;
  home.file.".config/lvim/lua/user/banners.lua".text = builtins.readFile ./lvim/lua/user/banners.lua;
  home.file.".config/lvim/lua/user/keymaps.lua".text = builtins.readFile ./lvim/lua/user/keymaps.lua;
  home.file.".config/lvim/lua/user/neogen.lua".text = builtins.readFile ./lvim/lua/user/neotree.lua;
  home.file.".config/lvim/lua/user/options.lua".text = builtins.readFile ./lvim/lua/user/options.lua;
  home.file.".config/lvim/lua/user/outline.lua".text = builtins.readFile ./lvim/lua/user/outline.lua;
  home.file.".config/lvim/lua/user/plugins.lua".text = builtins.readFile ./lvim/lua/user/plugins.lua;
  home.file.".config/lvim/lua/user/rainbow.lua".text = builtins.readFile ./lvim/lua/user/rainbow.lua;
  home.file.".config/lvim/lua/user/autocmds.lua".text = builtins.readFile ./lvim/lua/user/autocmds.lua;
  home.file.".config/lvim/lua/user/masonLSP.lua".text = builtins.readFile ./lvim/lua/user/masonLSP.lua;
  home.file.".config/lvim/lua/user/obsidian.lua".text = builtins.readFile ./lvim/lua/user/obsidian.lua;
  home.file.".config/lvim/lua/user/dashboard.lua".text = builtins.readFile ./lvim/lua/user/dashboard.lua;
  home.file.".config/lvim/lua/user/which-key.lua".text = builtins.readFile ./lvim/lua/user/which-key.lua;
  home.file.".config/lvim/lua/user/statusline.lua".text = builtins.readFile ./lvim/lua/user/statusline.lua;
  home.file.".config/lvim/lua/user/telekasten.lua".text = builtins.readFile ./lvim/lua/user/telekasten.lua;
  home.file.".config/lvim/lua/user/colorscheme.lua".text = builtins.readFile ./lvim/lua/user/colorscheme.lua;
  home.file.".config/lvim/lua/user/inlay-hints.lua".text = builtins.readFile ./lvim/lua/user/inlay-hints.lua;
  home.file.".config/lvim/lua/user/windowpicker.lua".text = builtins.readFile ./lvim/lua/user/windowpicker.lua;

  # FTPLUGIN
  home.file.".config/lvim/ftplugin/sh.lua".text = builtins.readFile ./lvim/ftplugin/sh.lua;
  home.file.".config/lvim/ftplugin/lua.lua".text = builtins.readFile ./lvim/ftplugin/lua.lua;
  home.file.".config/lvim/ftplugin/python.lua".text = builtins.readFile ./lvim/ftplugin/python.lua;
  home.file.".config/lvim/ftplugin/javascript.lua".text = builtins.readFile ./lvim/ftplugin/javascript.lua;
  home.file.".config/lvim/ftplugin/typescript.lua".text = builtins.readFile ./lvim/ftplugin/typescript.lua;

  # LSP Settings
  home.file.".config/lvim/lsp-settings/jsonls.json".text = builtins.readFile ./lvim/lsp-settings/jsonls.json;

  # Plugins
  home.file.".config/lvim/plugin/keymaps.lua".text = builtins.readFile ./lvim/plugin/keymaps.lua;
  home.file.".config/lvim/plugin/util.lua".text = builtins.readFile ./lvim/plugin/util.lua;

  # Snippets
  home.file.".config/lvim/snippets/package.json".text = builtins.readFile ./lvim/snippets/package.json;
  home.file.".config/lvim/snippets/typescript.json".text = builtins.readFile ./lvim/snippets/typescript.json;
}
