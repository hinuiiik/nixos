{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  environment.systemPackages = [
    inputs.agenix.packages."${pkgs.stdenv.hostPlatform.system}".default
  ];
  age.secrets = {
    vikram-pass = {
      file = ../../secrets/vikram-pass.age;
    };
  };
}
