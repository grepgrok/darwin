{ pkgs, ... }: {
    users.users.ben.home = "/Users/ben";

    environment = {
        shells = with pkgs; [ zsh bash ];
        systemPackages = [
            pkgs.coreutils
            pkgs.mkvtoolnix
        ];
        systemPath = [ "/usr/local/bin" ];
        pathsToLink = [ "/Applications" ]; # symlinks /run/current-system/sw
    };

    security.pam.services.sudo_local.touchIdAuth = true;

    imports = [ ];

    ##### Technical Details #####
    # Bachwards compatibility
    system.stateVersion = 6;
    nix.settings.experimental-features = "nix-command flakes";
}
