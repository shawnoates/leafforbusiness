part of '../button.dart';

_AppButtonModel _green() {
  return _AppButtonModel(
    text: {
      AppButtonState.elevated: Colors.white,
      AppButtonState.plain: Colors.white,
      AppButtonState.disabled: Colors.grey[200]!,
    },
    backgroundColor: {
      AppButtonState.elevated: AppTheme.green,
      AppButtonState.plain: AppTheme.green,
      AppButtonState.disabled: Colors.grey,
    },
  );
}
