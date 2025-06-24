{ config, pkgs, ... }:

{
  imports = [
	./config/hyprland
	./config/git.nix
	./config/kitty.nix
	./config/vscode.nix
	./config/dunst.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "kirantiloh";
  home.homeDirectory = "/home/kirantiloh";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    pkgs.fastfetch

    pkgs.swappy
    pkgs.grim
    pkgs.slurp

    pkgs.nodejs_20
    pkgs.typescript
    pkgs.typescript-language-server
    pkgs.pnpm
  ];

  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.macchiatoDark;
    name = "Catppuccin-Macchiato-Dark-Cursors";
    size = 40;
    gtk.enable = true;
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = (pkgs.catppuccin-papirus-folders.override { flavor = "macchiato"; accent = "sapphire"; });
      name  = "Papirus-Dark";
    };
    theme = {
      package = (pkgs.catppuccin-gtk.override { accents = [ "sapphire" ]; size = "standard"; variant = "macchiato"; });
      name = "Catppuccin-Macchiato-Standard-Sapphire-Dark";
    };
    gtk3.extraConfig = {
      "gtk-application-prefer-dark-theme" = true;
    };
    gtk4.extraConfig = {
      "gtk-application-prefer-dark-theme" = true;
    };
  };

  home.sessionVariables.GTK_THEME = "Catppuccin-Macchiato-Standard-Sapphire-Dark";

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/kirantiloh/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  services.mpris-proxy.enable = true;

  
  programs.zsh = {
	enable = true;
	autosuggestion = {
		enable = true;
	};
	defaultKeymap = "viins";
	localVariables = {
		PROMPT="%F{33}i%f%F{39}a%f%F{38}n%f%F{44}pan%f%F{50}@%f%F{43}ar%f%F{44}ch%f%F{38}:%1~/%f %F{44}%#%f";
	};
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
