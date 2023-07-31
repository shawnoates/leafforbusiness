part of 'cubit.dart';

class _OrderRepository {
  Future<order.Order> fetch(String id) => _OrderProvider.fetch(id);
}
