part of 'cubit.dart';

@immutable
class CheckoutState extends Equatable {
  static bool match(PaymentState a, PaymentState b) => a.checkout != b.checkout;

  final String? url;
  final String? message;

  const CheckoutState({
    this.message,
    this.url,
  });

  @override
  List<Object?> get props => [
        message,
        url,
      ];
}

@immutable
class CheckoutDefault extends CheckoutState {}

@immutable
class CheckoutLoading extends CheckoutState {
  const CheckoutLoading() : super();
}

@immutable
class CheckoutSuccess extends CheckoutState {
  const CheckoutSuccess({String? url}) : super(url: url);
}

@immutable
class CheckoutFailed extends CheckoutState {
  const CheckoutFailed({String? message}) : super(message: message);
}

// root-state
@immutable
class PaymentState extends Equatable {
  final CheckoutState checkout;

  const PaymentState({
    required this.checkout,
  });

  @override
  List<Object> get props => [
        checkout,
      ];

  PaymentState copyWith({
    CheckoutState? checkout,
  }) {
    return PaymentState(
      checkout: checkout ?? this.checkout,
    );
  }
}

@immutable
class PaymentStateDefault extends PaymentState {
  const PaymentStateDefault()
      : super(
          checkout: const CheckoutState(),
        );
}
