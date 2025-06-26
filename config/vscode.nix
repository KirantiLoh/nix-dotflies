{ pkgs, ... }:
{
programs.vscode = {
  enable = true;
  profiles.default.extensions = with pkgs.vscode-extensions; [
    vscodevim.vim

    vue.volar
    dbaeumer.vscode-eslint

    # Error Related
    usernamehw.errorlens
    yoavbls.pretty-ts-errors

    # Theme
    catppuccin.catppuccin-vsc
    catppuccin.catppuccin-vsc-icons

    # Misc
    yzhang.markdown-all-in-one
  ];
};

}
