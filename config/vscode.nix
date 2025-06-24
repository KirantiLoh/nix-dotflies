{ pkgs, ... }:
{
programs.vscode = {
  enable = true;
  extensions = with pkgs.vscode-extensions; [
    vscodevim.vim

    vue.vscode-typescript-vue-plugin
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
