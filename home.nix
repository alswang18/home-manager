{ lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  programs.vscode = {
    enable = true;
    # Optionally, specify extensions:
    extensions = with pkgs.vscode-extensions; [ 
      bbenoist.nix
    ];
  };

  programs.git = {
    enable = true;
    extraConfig = {
        user.name = "alswang18";
        user.email = "alec.sy.wang@gmail.com";
        init.defaultBranch = "main";
      };
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
      hm-switch = "home-manager switch --flake /home/alecwang/git/home-manager#myprofile";
    };
    initExtra = ''
      export ZSH="${pkgs.oh-my-zsh}/share/oh-my-zsh"
      ZSH_THEME="bureau"
      plugins=(z git)
      source $ZSH/oh-my-zsh.sh
    '';
  };

  home = {
    packages = with pkgs; [
      hello
    ];

    # This needs to actually be set to your username
    username = "alecwang";
    homeDirectory = "/home/alecwang";

    # You do not need to change this if you're reading this in the future.
    # Don't ever change this after the first build.  Don't ask questions.
    stateVersion = "24.11";
  };
}
