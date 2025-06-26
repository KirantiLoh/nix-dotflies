# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
	./pkgs/nbfc
	./pkgs/nvim
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kirantiloh = {
    isNormalUser = true;
    description = "KirantiLoh";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable Hyprland
  programs.hyprland = {
	enable = true;
	xwayland.enable = true;
	withUWSM = true;
  };

  programs.dconf.enable = true;
  services.blueman.enable = true;
  services.displayManager.sddm = {
		package = pkgs.kdePackages.sddm;
		enable = true;
		wayland.enable = true;
		extraPackages = with pkgs; [
			sddm-astronaut
		];
		theme = "sddm-astronaut-theme";
		settings = {
			Theme = {
				Current = "sddm-astronaut-theme";
			};
		};
  };

  users.defaultUserShell = pkgs.zsh;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  environment.sessionVariables = {
	NIXOS_OZONE_WL = "1";
  };

  hardware = {
	graphics.enable = true;
  	bluetooth = {
		enable = true;
		settings = {
			General = {
      				Enable = "Source,Sink,Media,Socket";
				Experimental = true;
    			};
    		};
	};
  };

  virtualisation.docker = {
    enable = true;
  };


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  	vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	lf
	pkgs.kitty
	pkgs.kitty-themes

	pkgs.waybar
	pkgs.dunst
	libnotify
	pkgs.networkmanagerapplet
	pkgs.brightnessctl
	sddm-astronaut

	swww
	wofi
	btop
	wl-clipboard

	firefox
	(discord.override {
      		# withOpenASAR = true; # can do this here too
      		withVencord = true;
    	})
  ];

  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono font-awesome ];

  xdg.portal = {
	enable = true;
	extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
