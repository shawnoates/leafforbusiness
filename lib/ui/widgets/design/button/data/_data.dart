part of '../button.dart';

Map<AppButtonStyle, _AppButtonModel> _mapPropsToData(BuildContext context) {
  return {
    AppButtonStyle.green: _green(),
    AppButtonStyle.white: _white(),
    AppButtonStyle.danger: _danger(context),
  };
}
