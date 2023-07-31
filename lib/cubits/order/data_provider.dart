part of 'cubit.dart';

class _OrderProvider {
  static Future<order.Order> fetch(String id) async {
    try {
      final data = await FirebaseFirestore.instance //
          .collection('orders')
          .doc(id)
          .get();
      return order.Order.fromMap(data.data()!);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
