import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:leaf_for_business/configs/configs.dart';
import 'package:leaf_for_business/constants/constants.dart';
import 'package:universal_html/html.dart' as html;

part '_desktop.dart';

enum FooterType {
  desktop,
  mobile,
}

class Footer extends StatelessWidget {
  final FooterType? type;
  final bool topSpace;
  const Footer({
    super.key,
    this.topSpace = true,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return _Desktop(
      topSpace: topSpace,
      type: type,
    );
  }
}
