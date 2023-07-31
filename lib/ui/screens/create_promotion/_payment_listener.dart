part of 'create_promotion.dart';

class _PaymentListener extends StatelessWidget {
  const _PaymentListener();

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentCubit, PaymentState>(
      listenWhen: CheckoutState.match,
      listener: (context, state) async {
        if (state.checkout is CheckoutSuccess) {
          html.window.location.href = state.checkout.url!;
        } else if (state.checkout is CheckoutFailed) {
          final msg = state.checkout.message!.split(': ').last;
          final snackBar = SnackBar(
            content: Text(msg),
            backgroundColor: AppTheme.danger,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
