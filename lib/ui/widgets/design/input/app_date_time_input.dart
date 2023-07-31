import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:leaf_for_business/configs/configs.dart';

class AppDateTimeInput extends StatelessWidget {
  final String name;
  final String? label;
  final String? hint;
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime? initialDate;

  const AppDateTimeInput({
    Key? key,
    this.hint,
    this.label,
    this.initialDate,
    required this.name,
    required this.firstDate,
    required this.lastDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: AppText.b3 + AppTheme.green,
          ),
          Space.y.t10,
        ],
        FormBuilderDateTimePicker(
          name: name,
          format: DateFormat('dd/MM/yyyy'),
          lastDate: lastDate,
          firstDate: firstDate,
          inputType: InputType.date,
          initialDate: initialDate ?? DateTime(1998, 1, 1),
          style: AppText.b2,
          decoration: InputDecoration(
            errorStyle: AppText.s1 + Colors.red,
            filled: true,
            hintText: hint,
            prefixIcon: const Icon(Icons.calendar_month),
            hintStyle: AppText.b2 + AppTheme.grey,
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
          validator: FormBuilderValidators.required(
            errorText: 'Date of Birth is required',
          ),
        ),
      ],
    );
  }
}
