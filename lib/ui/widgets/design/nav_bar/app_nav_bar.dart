// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:leaf_for_business/configs/configs.dart';
import 'package:leaf_for_business/router/routes.dart';
import 'package:leaf_for_business/router/web_router.dart';
import 'package:leaf_for_business/services/locator.dart';
import 'package:leaf_for_business/utils/assets.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Container(
      padding: Space.a.t25,
      child: Row(
        children: [
          InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => locator<WebRouter>().navigateTo(AppRoutes.home),
            child: Image.asset(
              StaticAssets.logo,
              height: 15.un(),
            ),
          ),
          Space.xm,
          TextButton(
              onPressed: () => js.context
                  .callMethod('open', ['https://www.joinleaf.com/blog']),
              child: Text(
                'Blog',
                style: AppText.b1,
              )),
          Space.x.t100,
        ],
      ),
    );
  }
}
