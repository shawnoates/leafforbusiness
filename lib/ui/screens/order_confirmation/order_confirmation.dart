import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:leaf_for_business/cubits/order/cubit.dart';
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

class OrderConfirmationScreen extends StatefulWidget {
  final String orderId;
  const OrderConfirmationScreen({
    Key? key,
    required this.orderId,
  }) : super(key: key);

  @override
  State<OrderConfirmationScreen> createState() =>
      _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  @override
  void initState() {
    super.initState();
    OrderCubit.c(context).fetch(widget.orderId);
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(orderId: widget.orderId),
      child: const Responsive(
        mobile: _Desktop(),
        tablet: _Desktop(),
        desktop: _Desktop(),
      ),
    );
  }
}
