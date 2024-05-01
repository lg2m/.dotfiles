{
  # Don't allow mutation of users outside the config.
  users.mutableUsers = false;

  users.groups = {
    zmeyer = {};
    docker = {};
  };
  
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.zmeyer = {
    home = "/home/zmeyer";
    isNormalUser = true;
    description = "Zachary Meyer";
    extraGroups = [ "zmeyer" "users" "networkmanager" "wheel" "docker" ];
  };
}
