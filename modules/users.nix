{
  config,
  lib,
  pkgs,
  ...
}:

{
  users.users.vikram = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "i2c" ]; # Enable ‘sudo’ for the user.
    hashedPasswordFile = config.age.secrets.vikram-pass.path;
	openssh.authorizedKeys.keys = [
	"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDQO9meBPy8jEBR4IiG6PlApvqe+mnLpgCeHBYf1JfcZMSJBKB+IBOE8555cxU64T9amFohQcZXmy9bszpYAkjh6p8rkiLS8QXd2PvX1rwnbJWU+znq6LRScKjckPVZMjUKugx6xnfQ3LuXWaze6M9zQqMY3DA8YDoi67eebFto3VLodSAXmyjaB9HqQXCOzidE4bx7cb1ERReEMCcUD8jwjEAMhc2F3vJd/33d+lqogfh3VIidhFsc+mk+teLnWRevx27oQb5U0cCUj4a8sDmSmt90/1w+dXMNZqaYLecaTClY43PYZCI9E1fKdPnfuq8Q/2j1MFUCJP8sKUW7146dvHw8ShE09DBY9odJP17QOp1uapYRBWndbkYBJJ+m/cKq89Hr5JQCZrKupqtgV6ZJ+gmyICC8rHbkQ7IPFZsoA9DkROz3iCTuQLsLOy2jPkWlcFWpwR6ouc7VnliHZMBJeYs/C/mUSIF3ug0KSWWDFhsYOm8JVVU0reTrrp357sk= vikram@arch"
];
  };
}
