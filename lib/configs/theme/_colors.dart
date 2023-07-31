part of '../configs.dart';

abstract class AppTheme {
  static const green = ColorRef(Color(0xff667f66), id: 'green');
  static const grey = ColorRef(Color(0xff9A9A9A), id: 'grey');
  static const lightGrey = ColorRef(Color(0xffD5D7DC), id: 'lightGrey');
  static const darkGrey = ColorRef(Color(0xff2C2C2C), id: 'darkGrey');
  static const danger = ColorRef(Color(0xffE74C3C), id: 'danger');

  static ThemeData lightTheme(BuildContext context) => ThemeData(
        useMaterial3: false,
        primaryColor: green,
        primarySwatch: Colors.green,
        highlightColor: Colors.grey.withOpacity(0.1),
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black,
              displayColor: Colors.black,
            ),
      );
}
