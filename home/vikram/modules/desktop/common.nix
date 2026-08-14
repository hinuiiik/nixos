{ ... }:

{
  services.hyprpolkitagent.enable = true;

  home.hyprdynamicmonitors = {
    enable = true;
    configPath = ".config/hyprdynamicmonitors/config.toml";
  };

}
