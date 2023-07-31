part of 'order_confirmation.dart';

class _ScreenState extends ChangeNotifier {
  _ScreenState({required String orderId}) {
    id = orderId;
  }

  static _ScreenState s(BuildContext context, [listen = false]) =>
      Provider.of<_ScreenState>(context, listen: listen);

  late String id;
}
