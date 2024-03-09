{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/nvme0n1";
  boot.loader.grub.useOSProber = true;

	# Define your hostname.
  networking.hostName = "nixos";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = false;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  services.pipewire.wireplumber.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.srinath = {
    isNormalUser = true;
    description = "srinath";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ firefox kate ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Installing SystemPackages
  environment.systemPackages = with pkgs; [
    neovim
    hyprland
    htop
    git
		gh
    kitty
    wofi
    waybar
    neofetch
    brightnessctl
    pamixer
    cava
    cmus
    cargo
    mako
    eza
    lf
    swaybg
    ranger
    gcc
		xfce.thunar
		grim
		slurp
    nwg-look
    papirus-icon-theme
    wget
		wl-clipboard
    zsh
    oh-my-zsh
    zsh-completions
    zsh-syntax-highlighting
    zsh-history-search-multi-word
    zsh-powerlevel10k
  ];

  #Hyprland
  programs.hyprland.enable = true;

  #Neovim
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  #Zsh
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };

  system.stateVersion = "23.11"; # Did you read the comment?
}
