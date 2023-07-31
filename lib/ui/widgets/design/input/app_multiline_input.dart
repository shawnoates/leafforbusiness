import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:leaf_for_business/configs/configs.dart';

class AppMultilineInputField extends StatelessWidget {
  final String name;
  final String? hint;
  final String? label;
  final String? subtitle;
  final int maxLines;
  final int? maxLength;
  final bool autoFocus;
  final bool? enabled;
  final FocusNode? node;

  final bool isPass;
  final Widget? prefixIcon;
  final String? initialValue;

  final bool readOnly;
  final TextInputType? textInputType;

  final String? errorText;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;

  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const AppMultilineInputField({
    Key? key,
    required this.name,
    this.maxLines = 5,
    this.node,
    this.hint,
    this.label,
    this.subtitle,
    this.maxLength,
    this.enabled,
    this.validator,
    this.onChanged,
    this.errorText,
    this.prefixIcon,
    this.initialValue,
    this.textInputType,
    this.isPass = false,
    this.autoFocus = false,
    this.inputFormatters,
    this.readOnly = false,
    this.textCapitalization = TextCapitalization.sentences,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (label != null) ...[
            Text(
              label!,
              style: AppText.b3 + AppTheme.green,
            ),
            if (subtitle != null) ...[
              Space.y.t05,
              Text(
                subtitle!,
                style: AppText.s1 + AppTheme.grey,
              ),
            ],
            Space.y.t15,
          ],
          FormBuilderTextField(
            name: name,
            readOnly: readOnly,
            textCapitalization: textCapitalization,
            enabled: enabled ?? true,
            initialValue: initialValue,
            autofocus: autoFocus,
            maxLines: maxLines,
            maxLength: maxLength,
            textInputAction: TextInputAction.newline,
            keyboardType: textInputType,
            focusNode: node,
            cursorColor: AppTheme.green,
            inputFormatters: inputFormatters,
            style: AppText.b2,
            decoration: InputDecoration(
              errorText: errorText,
              filled: true,
              hintText: hint,
              hintStyle: AppText.b3.copyWith(
                color: AppTheme.grey,
                fontStyle: FontStyle.italic,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(
                  width: 0,
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: AppTheme.green,
                  width: .5.un(),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.red.withAlpha(200),
                  width: .5.un(),
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.red.withAlpha(200),
                  width: .5.un(),
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  width: .5.un(),
                  color: Colors.transparent,
                ),
              ),
            ),
            validator: validator,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
