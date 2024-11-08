# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
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
  time.timeZone = "America/Vancouver";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

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
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # flatpak
  services.flatpak.enable = true;
  # $```flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo```

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.vulbyte = {
    isNormalUser = true;
    description = "vulbyte";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kate
      qpwgraph
      thunderbird
      vulkan-tools
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # install steam
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  # proton optimization cluster
  # environment.systemPackages = with pkgss; [
  # ];

  # helps perf
  # IN GENERAL UNDER STEAM, ADD LAUNCH OPTION:
  # ```gamemoderun %command%```
  programs.gamemode.enable = true;

  # open gl for stuff
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia.modesetting.enable = true;

  #sync mode gpu for high perf bad energy savings <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
  #hardware.nvidia.prime.nvidiaBusId = "0000:10:00.0"; # lspci | grep -i vga
  # ALL THIS IS FUCKEY WUCKEY 
  # to find pci: $ ```lspci -a | grep -i ' VGA '```
  #     hardware.nvidia.prime = {
  #     # UNCOMMENT HERE FOR SNYC (GPU ALWAYS RUNNING)
  #       sync.enable = true;
  #       # note: only semi-colon the last
  #               # tip: "lspci | grep ' VGA '"
  #       # integrated
  #       # amdgpuBusId = "PCI::30:00";
  #               # intelBusId = "PCI:0:0.0"
  #       # dedicated
  #       nvidiaBusId = "PCI:10:0:0";


  #       UNCOMMENT HERE FOR OFFLOAD (better batt, worse perf)
  #	offload = {
  #		enable = true;
  # 		enableOffloadCmd = true;
# 		};
#     };


  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bottles				# bottles
    git					# $ ```git```
    # heroic				# for epic games stuff
    pkgs.libgccjit			# $ ```gcc``` and gang
    lshw				#
    pciutils				# lspci and gang
    protonup				# $ ```protonup``` (comments #2024-11-01-afd is the dir)
    stow				# $ ```stow```
    lutris				# $ ```lutris```
    mangohud				# steam > general > launch options > ```mangohud %command%```
    neovim				# $ ```nvim```
    pkgs.nodePackages_latest.nodejs 	# $ ```node```
    vim 				# $ ```vim```
    wezterm 				# $ ```wezterm```
    wget				# $ ```wget```
  ];

#2024-11-01-afd
  environment.sessionVariables = {
	STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/user/.steam/root/compatibilitytools.d";
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
  system.stateVersion = "23.11"; # Did you read the comment?

}
