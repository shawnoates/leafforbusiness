part of 'cubit.dart';

class PaymentDataProvider {
  static final dio = Dio();

  ///
  static Future<String> checkout(Map<String, dynamic> payload) async {
    try {
      final resp = await Api.ins.post(
        '/stripe-checkout',
        queryParameters: {
          'env': AppEnv.env.name,
          'amount': payload['amount'],
        },
        data: payload,
      );
      final data = resp.data as Map<String, dynamic>;

      return data['redirect_url'] as String;
    } catch (e) {
      debugPrint('---- Checkout Exception ----');
      debugPrint(e.toString());
      debugPrint('----------------------------');
      throw Exception('Something went wrong with Stripe payment!');
    }
  }
}
