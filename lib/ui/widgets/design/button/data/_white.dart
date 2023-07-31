part of '../button.dart';

_AppButtonModel _white() {
  return _AppButtonModel(
    text: {
      AppButtonState.elevated: AppTheme.darkGrey,
      AppButtonState.plain: AppTheme.darkGrey,
      AppButtonState.disabled: Colors.grey[200]!,
    },
    backgroundColor: {
      AppButtonState.elevated: Colors.white,
      AppButtonState.plain: Colors.white,
      AppButtonState.disabled: Colors.grey,
    },
  );
}
