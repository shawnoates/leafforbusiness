import 'package:flutter/material.dart';
import 'package:leaf_for_business/cubits/cities/cubit.dart';
import 'package:leaf_for_business/ui/widgets/design/footer/footer.dart';
import 'package:provider/provider.dart';

import 'package:leaf_for_business/configs/configs.dart';
import 'package:leaf_for_business/router/routes.dart';
import 'package:leaf_for_business/router/web_router.dart';
import 'package:leaf_for_business/services/locator.dart';
import 'package:leaf_for_business/services/responsive.dart';
import 'package:leaf_for_business/ui/widgets/core/screen/screen.dart';
import 'package:leaf_for_business/ui/widgets/design/button/button.dart';
import 'package:leaf_for_business/ui/widgets/design/nav_bar/app_nav_bar.dart';
import 'package:leaf_for_business/utils/assets.dart';

part '_state.dart';

part 'views/_desktop.dart';
part 'views/_mobile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    CitiesCubit.cubit(context).get();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const Responsive(
        mobile: _Mobile(),
        tablet: _Desktop(),
        desktop: _Desktop(),
      ),
    );
  }
}
