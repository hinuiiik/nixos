{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };

  # programs.uwsm = {
  #   enable = true;
  #   waylandCompositors = {
  #     hyprland = {
  #       prettyName = "Hyprland (Correct)";
  #       comment = "Hyprland compositor managed by UWSM";
  #       binPath = "/run/current-system/sw/bin/Hyprland";
  #     };
  #   };
  # };
  #   services.greetd = {
  #     enable = true;
  #
  #     settings = {
  #
  #       default_session = {
  #         command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-session --asterisks";
  #         user = "greeter";
  #       };
  #     };
  #   };
  security.polkit.enable = true;
  services.dbus.enable = true;
  #environment.systemPackages = [
  #pkgs.kitty
  #];

  # Wayland-friendly Electron apps
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Good defaults for Wayland portals (important later)
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [
    pkgs.xdg-desktop-portal-hyprland
    pkgs.kdePackages.xdg-desktop-portal-kde
  ];
  xdg.portal.config = {
    hyprland = {
      default = [
        "hyprland"
        "gtk"
      ];
      "org.freedesktop.impl.portal.FileChooser" = [ "kde" ];
    };
  };
}
