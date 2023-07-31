import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leaf_for_business/router/routes.dart';
import 'package:leaf_for_business/services/app_env.dart';
import 'package:leaf_for_business/services/locator.dart';
import 'package:navigation_history_observer/navigation_history_observer.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

import 'base_wrapper.dart';
import 'configs/configs.dart';
import 'firebase_options.dart';
import 'router/web_router.dart';

// bloc-imports-start
import 'cubits/order/cubit.dart';
import 'cubits/cities/cubit.dart';
import 'cubits/payment/cubit.dart';
// bloc-imports-end

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// @important: Disabled for now, can be used for debugging, also change urls.dart file if uncommenting
  /// this code below.
  // if (kDebugMode) {
  //   FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  // }

  // removes the '#' in the URL for web
  setPathUrlStrategy();

  // routing service get_it
  setUpLocator();

  //
  AppEnv.init(flavor: kDebugMode ? Env.local : Env.prod);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // bloc-initiate-start
        BlocProvider(create: (_) => OrderCubit()),
        BlocProvider(create: (_) => CitiesCubit()),
        BlocProvider(create: (_) => PaymentCubit()),
        // bloc-initiate-end
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Leaf for Business',
        themeMode: ThemeMode.light,
        theme: AppTheme.lightTheme(context),
        navigatorObservers: [
          NavigationHistoryObserver(),
        ],
        builder: (context, child) => BaseWrapper(child: child!),
        initialRoute: AppRoutes.home,
        navigatorKey: WebRouter.navigatorKey,
        onGenerateRoute: WebRouter.onGenerateRoute,
      ),
    );
  }
}
