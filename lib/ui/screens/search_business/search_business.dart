import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:leaf_for_business/cubits/cities/cubit.dart';
import 'package:leaf_for_business/models/city.dart';
import 'package:leaf_for_business/ui/widgets/design/footer/footer.dart';
import 'package:leaf_for_business/ui/widgets/design/nav_bar/app_nav_bar.dart';
import 'package:provider/provider.dart';

import 'package:leaf_for_business/configs/configs.dart';
import 'package:leaf_for_business/models/business.dart';
import 'package:leaf_for_business/models/business_search_response.dart';
import 'package:leaf_for_business/router/routes.dart';
import 'package:leaf_for_business/router/web_router.dart';
import 'package:leaf_for_business/services/api.dart';
import 'package:leaf_for_business/services/locator.dart';
import 'package:leaf_for_business/services/responsive.dart';
import 'package:leaf_for_business/ui/widgets/core/screen/screen.dart';
import 'package:leaf_for_business/ui/widgets/design/button/button.dart';
import 'package:leaf_for_business/ui/widgets/design/input/app_input_field.dart';

part '_state.dart';

part 'static/_form_data.dart';
part 'static/_form_keys.dart';

part 'views/_desktop.dart';

part 'widgets/_business_field.dart';
part 'widgets/_location_field.dart';

class SearchBusinessScreen extends StatefulWidget {
  const SearchBusinessScreen({Key? key}) : super(key: key);

  @override
  State<SearchBusinessScreen> createState() => _SearchBusinessScreenState();
}

class _SearchBusinessScreenState extends State<SearchBusinessScreen> {
  @override
  void initState() {
    super.initState();
    final cubit = CitiesCubit.cubit(context);
    if (cubit.state.data == null) {
      cubit.get();
    }
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const Responsive(
        mobile: _Desktop(),
        tablet: _Desktop(),
        desktop: _Desktop(),
      ),
    );
  }
}
