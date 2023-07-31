import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:leaf_for_business/configs/configs.dart';

class AppInputField extends StatefulWidget {
  final String name;
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final String? subtitle;

  final bool? enabled;
  final FocusNode? node;

  final bool isPass;

  final int? maxCharacters;

  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final Color? labelColor;
  final bool readOnly;

  final void Function()? onTap;

  final TextInputType? textInputType;
  final TextInputAction? textInputAction;

  final String? errorText;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;

  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onSubmitted;

  const AppInputField({
    Key? key,
    required this.name,
    this.node,
    this.hint,
    this.label,
    this.subtitle,
    this.enabled,
    this.maxCharacters,
    this.validator,
    this.controller,
    this.onChanged,
    this.labelColor,
    this.suffixIcon,
    this.onSubmitted,
    this.errorText,
    this.prefixIcon,
    this.onTap,
    this.initialValue,
    this.textInputType,
    this.isPass = false,
    this.inputFormatters,
    this.readOnly = false,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  AppInputFieldState createState() => AppInputFieldState();
}

class AppInputFieldState extends State<AppInputField> {
  bool showPass = true;
  void _showPass() {
    setState(() {
      showPass = !showPass;
    });
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.label != null) ...[
            Text(
              widget.label!,
              style: AppText.b3 + (widget.labelColor ?? AppTheme.green),
            ),
            if (widget.subtitle != null) ...[
              Space.y.t05,
              Text(
                widget.subtitle!,
                style: AppText.s1 + AppTheme.grey,
              ),
            ],
            Space.y.t10,
          ],
          FormBuilderTextField(
            name: widget.name,
            onTap: widget.onTap,
            controller: widget.controller,
            readOnly: widget.readOnly,
            textCapitalization: widget.textCapitalization,
            enabled: widget.enabled ?? true,
            initialValue: widget.initialValue,
            autofocus: false,
            obscureText: widget.isPass ? showPass : false,
            textInputAction: widget.textInputAction,
            keyboardType: widget.textInputType,
            focusNode: widget.node,
            cursorColor: AppTheme.green,
            inputFormatters: widget.inputFormatters,
            style: AppText.b2,
            maxLength: widget.maxCharacters,
            decoration: InputDecoration(
              errorStyle: AppText.s1 + Colors.red,
              errorText: widget.errorText,
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon ??
                  (widget.isPass
                      ? IconButton(
                          onPressed: _showPass,
                          icon: showPass
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        )
                      : null),
              filled: true,
              hintText: widget.hint,
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
                  color: Colors.red,
                  width: .5.un(),
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(
                  color: Colors.red,
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
            validator: widget.validator,
            onChanged: widget.onChanged,
            onSubmitted: widget.onSubmitted,
          ),
        ],
      ),
    );
  }
}
