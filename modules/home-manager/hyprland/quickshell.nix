{ lib, inputs, ... }:
{
  home.activation.copyQuickshell = lib.mkAfter ''
    rm -rf $HOME/.config/quickshell
    cp -r ${inputs.dots-hyprland}/dots/.config/quickshell $HOME/.config/quickshell
    chmod -R u+w $HOME/.config/quickshell
    rm -rf $HOME/.config/quickshell/ii/modules/common/widgets/shapes
    cp -r ${inputs.rounded-polygon-qmljs} $HOME/.config/quickshell/ii/modules/common/widgets/shapes
    chmod -R u+w $HOME/.config/quickshell/ii/modules/common/widgets/shapes
  '';
}
