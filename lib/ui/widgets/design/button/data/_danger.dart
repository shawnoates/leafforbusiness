part of '../button.dart';

_AppButtonModel _danger(BuildContext context) {
  return _AppButtonModel(
    text: {
      AppButtonState.elevated: Colors.white,
      AppButtonState.plain: Colors.white,
      AppButtonState.disabled: Colors.grey[200]!,
    },
    backgroundColor: {
      AppButtonState.elevated: AppTheme.danger,
      AppButtonState.plain: AppTheme.danger,
      AppButtonState.disabled: Colors.grey,
    },
  );
}
