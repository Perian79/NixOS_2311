# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./nvidia.nix
      ./tuxedo.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-e5957f8b-8cc8-4a92-a12a-2fbd3615979f".device = "/dev/disk/by-uuid/e5957f8b-8cc8-4a92-a12a-2fbd3615979f";
  networking.hostName = "pjrtk-nb-998"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "de_DE.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "de";
    xkbVariant = "nodeadkeys";
  };

  # Configure console keymap
  console.keyMap = "de-latin1-nodeadkeys";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };

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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sruecker = {
    isNormalUser = true;
    description = "Stefan Rücker";
    extraGroups = [ "networkmanager" "wheel" "cups" "libvirtd" ];
    packages = with pkgs; [
      aria
      cantor
      chromium
      digikam
      discord
      eclipses.eclipse-java
      firefox
      fishPlugins.bobthefish
      fishPlugins.done
      fishPlugins.fzf-fish
      fishPlugins.forgit
      fishPlugins.grc
      freemind
      gitkraken
      grc
      handbrake
      helix
      inkscape-with-extensions
      kate
      libsForQt5.kblocks
      libsForQt5.kbreakout
      libsForQt5.kcolorpicker
      libsForQt5.kcolorchooser
      libsForQt5.kmahjongg
      libsForQt5.kmines
      libsForQt5.knetwalk
      libsForQt5.knotes
      libsForQt5.kpat
      krita
      libsForQt5.ksudoku
      lunarvim
      lyx
      maxima
      obs-studio
      obsidian
      qalculate-qt
      remmina
      sage
      sagetex
      scanmem
      scribus
      shotcut
      libsForQt5.skanpage
      smplayer
      speechd
      teams-for-linux
      teamviewer
      texliveFull
      thunderbird
      tidal-hifi
      todoist-electron
      uget
      uget-integrator
      vorta
      wireshark
      yt-dlp
      yubikey-manager
      yubikey-personalization
      yubikey-personalization-gui
    ];
    shell = pkgs.fish;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    libsForQt5.akonadi
    libsForQt5.akonadi-calendar
    libsForQt5.akonadi-calendar-tools
    libsForQt5.akonadi-contacts
    libsForQt5.akonadi-import-wizard
    libsForQt5.akonadi-mime
    libsForQt5.akonadi-notes
    libsForQt5.akonadi-search
    libsForQt5.akonadiconsole
    libsForQt5.akregator
    arp-scan
    aspell
    aspellDicts.de
    aspellDicts.en
    bat
    borgbackup
    bup
    btop
    clamtk
    curl
    eza
    fd
    libsForQt5.filelight
    foomatic-db-ppds-withNonfreeDb
    freerdp
    fzf
    gcc
    libsForQt5.ghostwriter
    ghostscript
    gimp-with-plugins
    git
    gnumake
    hunspell
    hunspellDicts.de_DE
    hunspellDicts.en_US
    htop
    imagemagick
    java-language-server
    jdk
    libsForQt5.kaddressbook
    libsForQt5.kalarm
    libsForQt5.kcalc
    libsForQt5.kcharselect
    kchmviewer
    libsForQt5.kdepim-addons
    libsForQt5.kdepim-runtime
    keepassxc
    libsForQt5.kfind
    libsForQt5.kget
    kleopatra
    libsForQt5.kmag
    libsForQt5.kmail
    libsForQt5.kompare
    libsForQt5.kontact
    libsForQt5.korganizer
    libsForQt5.krecorder
    krename
    krusader
    libsForQt5.ksystemlog
    libsForQt5.ktimer
    ktimetracker
    libsForQt5.ktorrent
    kup
    lazygit
    libreoffice-qt
    libsecret
    logseq
    lshw
    lua
    luajit
    luajitPackages.jsregexp
    luajitPackages.luarocks
    lua-language-server
    luckybackup
    marksman
    mc
    libsForQt5.merkuro
    nerdfonts
    nettools
    neofetch
    nil
    nmap
    nodejs
    octaveFull
    okteta
    openfortivpn
    p7zip
    partition-manager
    pciutils
    libsForQt5.plasma-vault
    powershell
    python3Full
    python311Packages.pynvim
    ranger
    ripgrep
    rustup
    rust-analyzer
    stacer
    starship
    stylua
    tmux
    tmuxPlugins.tmux-fzf
    tree-sitter
    unrar
    unzip
    usbutils
    veracrypt
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    vlc
    wget
    wireguard-tools
    xclip
    xsel
    yaml-language-server
    libsForQt5.yakuake
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = with vscode-extensions; [
        bbenoist.nix
        ms-python.python
        ms-ceintl.vscode-language-pack-de
        ritwickdey.liveserver
        bierner.markdown-mermaid
        yzhang.markdown-all-in-one
        esbenp.prettier-vscode
        davidanson.vscode-markdownlint
        ms-azuretools.vscode-docker
      ];
    })
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
   services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall = { 
    enable = true;
    allowedTCPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];  
    allowedUDPPortRanges = [ 
      { from = 1714; to = 1764; } # KDE Connect
    ];  
  };  
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  networking.nftables.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  programs.fish.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;
    withPython3 = true;
  };

  services.thermald.enable = true;

  environment.shellAliases = {
    ls = "eza --color=always --group-directories-first --icons";
    ll = "eza -la --icons --octal-permissions --group-directories-first";
    l = "eza -bGF --header --git --color=always --group-directories-first --icons";
    llm = "eza -lbGd --header --git --sort=modified --color=always --group-directories-first --icons";
    la = "eza --long --all --group --group-directories-first";
    lx = "eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --color=always --group-directories-first --icons";

    lS = "eza -1 --color=always --group-directories-first --icons";
    lt = "eza --tree --level=2 --color=always --group-directories-first --icons";
    lh = "eza -a | grep -E '^\.'";
  };

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  programs.kdeconnect.enable = true;

  boot.supportedFilesystems = [ "btrfs" "exfat" "ntfs" ];

  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot

  services = {
    clamav = {
      daemon. enable = true;
      updater.enable = true;
    };
  };

  services.locate.enable = true;
  services.locate.package = pkgs.mlocate;
  services.locate.localuser = null;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

}
