import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:leaf_for_business/configs/configs.dart';

class AppDateRangePicker extends StatelessWidget {
  final String name;
  final DateTime lastDate;
  final DateTime firstDate;
  final String? hint;
  final String? Function(DateTimeRange?)? validator;
  final void Function(DateTimeRange?)? onChanged;
  final String? label;
  final Color? labelColor;

  const AppDateRangePicker({
    super.key,
    required this.name,
    required this.lastDate,
    required this.firstDate,
    this.hint,
    this.validator,
    this.onChanged,
    this.label,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: AppText.b3 + (labelColor ?? AppTheme.green),
          ),
          Space.y.t10,
        ],
        FormBuilderDateRangePicker(
          name: name,
          format: DateFormat('dd MMM, yyyy'),
          lastDate: lastDate,
          firstDate: firstDate,
          style: AppText.b2,
          decoration: InputDecoration(
            errorStyle: AppText.s1 + Colors.red,
            filled: true,
            hintText: hint,
            prefixIcon: const Icon(Icons.calendar_month),
            hintStyle: AppText.b3.copyWith(
              color: AppTheme.grey,
              fontStyle: FontStyle.italic,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                width: .5.un(),
                color: Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                width: .5.un(),
                color: AppTheme.green,
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
          ),
          validator: validator,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
