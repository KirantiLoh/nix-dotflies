{
  config,
  inputs,
  pkgs,
  ...
}: let
  command = "bin/nbfc_service --config-file './nbfc.json'";
in {
  environment.systemPackages = with pkgs; [
    inputs.nbfc-linux.packages.x86_64-linux.default
  ];
  systemd.services.nbfc_service = {
    enable = true;
    description = "NoteBook FanControl service";
    serviceConfig.Type = "simple";
    path = [pkgs.kmod];

    script = "${inputs.nbfc-linux.packages.x86_64-linux.default}/${command}";
   
    wantedBy = ["multi-user.target"];
  };
}
