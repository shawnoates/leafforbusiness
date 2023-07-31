import 'package:leaf_for_business/ui/screens/order_confirmation/order_confirmation.dart';
import 'package:leaf_for_business/models/business.dart';
import 'package:leaf_for_business/ui/screens/create_promotion/create_promotion.dart';
import 'package:leaf_for_business/ui/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:leaf_for_business/configs/configs.dart';
import 'package:leaf_for_business/router/routes.dart';
import 'package:leaf_for_business/ui/screens/search_business/search_business.dart';

class WebRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final data = settings.name!.getRoutingData;

    switch (data.route) {
      // web-route-start
      case AppRoutes.orderConfirmation:
        final orderId = data['orderId'] as String;
        return _FadeRoute(
          child: OrderConfirmationScreen(orderId: orderId),
          settings: settings,
        );
      case AppRoutes.searchBussiness:
        return _FadeRoute(
          child: const SearchBusinessScreen(),
          settings: settings,
        );
      case AppRoutes.createPromotion:
        final business = Business.fromJson(data['business']);
        return _FadeRoute(
          child: CreatePromotionScreen(
            business: business,
          ),
          settings: settings,
        );
      case AppRoutes.home:
        return _FadeRoute(
          child: const HomeScreen(),
          settings: settings,
        );

      // web-route-end

      default:
        return _FadeRoute(
          child: const HomeScreen(),
          settings: settings,
        );
    }
  }

  Future<dynamic> navigateTo(String route,
      {Map<String, dynamic>? queryParams}) {
    if (queryParams != null) {
      route = Uri(path: route, queryParameters: queryParams).toString();
    }

    return navigatorKey.currentState!.pushNamed(route, arguments: queryParams);
  }
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  @override
  final RouteSettings settings;

  _FadeRoute({required this.child, required this.settings})
      : super(
          settings: settings,
          pageBuilder: (context, ani1, ani2) => child,
          transitionsBuilder: (context, ani1, ani2, child) {
            return FadeTransition(
              opacity: ani1,
              child: child,
            );
          },
        );
}
