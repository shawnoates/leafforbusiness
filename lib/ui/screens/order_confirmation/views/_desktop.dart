part of '../order_confirmation.dart';

class _Desktop extends StatelessWidget {
  const _Desktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final format = DateFormat('MM/dd/yyyy hh:mm');
    final currentTime = DateTime.now();

    final screenState = _ScreenState.s(context, true);

    return Screen(
      keyboardHandler: true,
      overlayBuilders: const [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppNavBar(),
        ),
      ],
      child: SafeArea(
        child: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            if (state.fetch is OrderFetchLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.fetch is OrderFetchSuccess) {
              final order = state.fetch.data!;

              return SingleChildScrollView(
                padding: Space.h.t100,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Space.y.t100,
                    Space.y.t30,
                    Image.asset(
                      StaticAssets.logoLeaf,
                      height: 40.un(),
                    ),
                    Text(
                      'Thank You!',
                      style:
                          (!Responsive.isDesktop() ? AppText.h2 : AppText.h1) +
                              FontWeight.w400,
                    ),
                    Space.y.t30,
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: (!Responsive.isDesktop()
                                ? AppText.b1
                                : AppText.h3) +
                            FontWeight.w400 +
                            Colors.black,
                        children: [
                          const TextSpan(
                            text: 'Your order ',
                          ),
                          TextSpan(
                              text: ' #${order.orderNumber} ',
                              style: (!Responsive.isDesktop()
                                      ? AppText.b1
                                      : AppText.h3) +
                                  FontWeight.w700),
                          const TextSpan(text: 'has been placed!'),
                        ],
                      ),
                    ),
                    Space.y.t30,
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: AppText.b3 + FontWeight.w400 + Colors.black,
                        children: [
                          const TextSpan(
                            text: 'We sent and email to ',
                          ),
                          TextSpan(
                              text: ' ${order.customerEmail} ',
                              style: AppText.b3 + FontWeight.w700),
                          const TextSpan(
                            text:
                                'with your order confirmation and receipt.\nIf the email hasn\'t arrived within two minutes, please check your spam folder to see if the email was routed there.',
                          ),
                        ],
                      ),
                    ),
                    Space.y.t60,
                    if (Responsive.isDesktop())
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.timer_outlined,
                            color: AppTheme.green,
                          ),
                          Space.x.t05,
                          Text(
                            'Time Placed: ',
                            style: AppText.b3 + FontWeight.w700,
                          ),
                          Space.x.t05,
                          Text(
                            '${format.format(currentTime)} ${currentTime.timeZoneName}',
                            style: AppText.b3,
                          )
                        ],
                      )
                    else
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.timer_outlined,
                                color: AppTheme.green,
                              ),
                              Space.x.t05,
                              Text(
                                'Time Placed: ',
                                style: AppText.b3 + FontWeight.w700,
                              ),
                            ],
                          ),
                          Space.y.t15,
                          Text(
                            '${format.format(currentTime)} ${currentTime.timeZoneName}',
                            style: AppText.b3,
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    Space.y.t60,
                    if (Responsive.isDesktop())
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const _BillingDetails(),
                            VerticalDivider(
                              width: 25.un(),
                            ),
                            Expanded(
                              flex: Responsive.isDesktop() ? 0 : 1,
                              child: const IntrinsicWidth(
                                child: _OrderSummary(),
                              ),
                            ),
                          ],
                        ),
                      )
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const _BillingDetails(),
                          Divider(
                            height: 15.un(),
                          ),
                          const _OrderSummary(),
                        ],
                      ),
                    Space.y.t100,
                    AppButton(
                      width: 100.un(),
                      height: 16.un(),
                      label: 'Continue Shopping',
                      onPressed: () =>
                          locator<WebRouter>().navigateTo(AppRoutes.home),
                    ),
                    Space.y.t30,
                  ],
                ),
              );
            } else if (state.fetch is OrderFetchFailed) {
              final message = state.fetch.message!.split(': ').last;

              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      message,
                      style: AppText.b1 + AppTheme.danger,
                      textAlign: TextAlign.center,
                    ),
                    Space.y.t30,
                    AppButton(
                      width: 70.un(),
                      onPressed: () =>
                          OrderCubit.c(context).fetch(screenState.id),
                      label: 'Try Again',
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Something went wrong!',
                    style: AppText.b1 + AppTheme.danger,
                  ),
                  Space.y.t30,
                  AppButton(
                    width: 70.un(),
                    onPressed: () =>
                        OrderCubit.c(context).fetch(screenState.id),
                    label: 'Try Again',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _BillingDetails extends StatelessWidget {
  const _BillingDetails();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final orderCubit = OrderCubit.c(context, true);
    final order = orderCubit.state.fetch.data;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.credit_card,
          color: AppTheme.green,
        ),
        Space.y.t10,
        Text(
          'Billing Details',
          style: AppText.b3 + FontWeight.w700,
        ),
        Space.y.t20,
        Text(order!.customerName.titleCase),
        Text(order.customerEmail)
      ],
    );
  }
}

class _OrderSummary extends StatelessWidget {
  const _OrderSummary();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final orderCubit = OrderCubit.c(context, true);
    final order = orderCubit.state.fetch.data;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.business,
          color: AppTheme.green,
        ),
        Space.y.t10,
        Text(
          'Order Summary',
          style: AppText.b3 + FontWeight.w700,
        ),
        Space.y.t20,
        SelectableText('Order Number: ${order!.orderNumber}'),
        Space.y.t10,
        Text('Starting Date: ${order.startDate}'),
        Text('Ending Date: ${order.endDate}'),
        Divider(
          height: 15.un(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total',
              style: AppText.b1,
            ),
            Text(
              '\$${order.amount}.00',
              style: AppText.b1,
            )
          ],
        ),
      ],
    );
  }
}
