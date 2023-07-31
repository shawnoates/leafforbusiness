part of 'cubit.dart';

@immutable
class OrderFetchState extends Equatable {
  static bool match(OrderState a, OrderState b) => a.fetch != b.fetch;

  final order.Order? data;
  final String? message;

  const OrderFetchState({
    this.data,
    this.message,
  });

  @override
  List<Object?> get props => [
        data,
        message,
      ];
}

@immutable
class OrderFetchDefault extends OrderFetchState {}

@immutable
class OrderFetchLoading extends OrderFetchState {}

@immutable
class OrderFetchSuccess extends OrderFetchState {
  const OrderFetchSuccess({required order.Order data}) : super(data: data);
}

@immutable
class OrderFetchFailed extends OrderFetchState {
  const OrderFetchFailed({String? message}) : super(message: message);
}

// root-state
@immutable
class OrderState extends Equatable {
  final OrderFetchState fetch;

  const OrderState({
    required this.fetch,
  });

  @override
  List<Object> get props => [
        // root-state-props
        fetch,
      ];

  OrderState copyWith({
    OrderFetchState? fetch,
  }) {
    return OrderState(
      fetch: fetch ?? this.fetch,
    );
  }
}

@immutable
class OrderStateDefault extends OrderState {
  const OrderStateDefault()
      : super(
          // root-state-init
          fetch: const OrderFetchState(),
        );
}
