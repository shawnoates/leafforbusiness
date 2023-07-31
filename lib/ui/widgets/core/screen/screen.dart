import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '/ui/widgets/headless/focus_handler.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.child,
    this.padding = EdgeInsets.zero,
    this.keyboardHandler = false,
    this.renderSettings = true,
    this.floatingActionButton,
    this.scaffoldBackgroundColor,
    this.belowBuilders,
    this.overlayBuilders,
    this.initialFormValue,
    this.formKey,
    this.onBackPressed,
  });

  final Widget child;
  final EdgeInsets padding;
  final bool keyboardHandler;
  final bool renderSettings;
  final Widget? floatingActionButton;
  final Color? scaffoldBackgroundColor;
  final List<Widget>? belowBuilders;
  final List<Widget>? overlayBuilders;
  final Map<String, dynamic>? initialFormValue;
  final GlobalKey<FormBuilderState>? formKey;
  final Future<bool> Function()? onBackPressed;

  @override
  Widget build(BuildContext context) {
    Widget body = child;

    if (formKey != null) {
      body = FormBuilder(
        key: formKey,
        initialValue: initialFormValue ?? {},
        child: body,
      );
    }

    if (keyboardHandler) {
      body = FocusHandler(child: body);
    }

    body = Padding(padding: padding, child: body);

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor ?? Colors.grey[100],
      floatingActionButton: floatingActionButton,
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (belowBuilders != null) ...belowBuilders!,
          Positioned.fill(child: body),
          if (overlayBuilders != null) ...overlayBuilders!,
        ],
      ),
    );
  }
}
