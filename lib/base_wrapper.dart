import 'package:flutter/material.dart';
import 'package:leaf_for_business/configs/configs.dart';
import 'package:leaf_for_business/ui/widgets/core/screen/screen.dart';

class BaseWrapper extends StatelessWidget {
  final Widget child;
  const BaseWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Screen(child: child);
  }
}
