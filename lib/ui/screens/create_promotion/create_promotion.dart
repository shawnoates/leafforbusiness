import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:leaf_for_business/ui/widgets/design/footer/footer.dart';
import 'package:leaf_for_business/ui/widgets/design/nav_bar/app_nav_bar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:universal_html/html.dart' as html;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_for_web/image_picker_for_web.dart';
import 'package:leaf_for_business/cubits/payment/cubit.dart';
import 'package:leaf_for_business/models/business.dart';
import 'package:leaf_for_business/ui/widgets/design/button/button.dart';
import 'package:leaf_for_business/ui/widgets/design/input/app_input_field.dart';
import 'package:leaf_for_business/ui/widgets/design/input/app_multiline_input.dart';
import 'package:leaf_for_business/utils/assets.dart';
import 'package:leaf_for_business/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:leaf_for_business/services/responsive.dart';
import 'package:leaf_for_business/configs/configs.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:leaf_for_business/ui/widgets/core/screen/screen.dart';

part 'static/_form_data.dart';
part 'static/_form_keys.dart';

part 'views/_desktop.dart';
part 'views/_mobile.dart';

part 'widgets/_promotion_form.dart';
part 'widgets/_promotion_template.dart';
part 'widgets/_file_drop_zone.dart';
part 'widgets/_custom_calendar.dart';

part '_state.dart';
part '_payment_listener.dart';

class CreatePromotionScreen extends StatelessWidget {
  final Business business;
  const CreatePromotionScreen({
    Key? key,
    required this.business,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(bs: business),
      child: const Responsive(
        mobile: _Mobile(),
        tablet: _Mobile(),
        desktop: _Desktop(),
      ),
    );
  }
}
