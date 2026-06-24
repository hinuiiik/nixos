let
  vikram = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEi7cJMTS7fLv21hm+EZbobaV2/hwiGa0YaMfHHN5+sG";
  vm_root = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGfeGPIh6U3VOq2Sur4qLJ+73hGflaidFc1Ya3ZpcSnA root@nixos";
  users = [ vikram vm_root ];

  vm = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINhK9+iAmMg/MpzEo2RHnjE1vl6MavgOn7oOkXp6Ui8b";
laptop = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILmt76uWS+321o79uD2tODYJlbNNo/2HFywvXyvHoBUr";
  systems = [ vm laptop ];

in
{
  "vikram-pass.age".publicKeys = [
    vikram
    vm_root
    vm
	laptop
  ];
}
