{ ... }:

{
  services.hyprpolkitagent.enable = true;

  hyprdynamicmonitors = {
    enable = true;
	configPath = ".config/hyprdynamicmonitors/config.toml";
  };

}
