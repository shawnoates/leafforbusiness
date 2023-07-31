part of '../create_promotion.dart';

class _Mobile extends StatelessWidget {
  const _Mobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final screenState = _ScreenState.s(context, true);

    return Screen(
      keyboardHandler: true,
      formKey: screenState.formKey,
      initialFormValue: _FormData.initialValues(),
      overlayBuilders: const [_PaymentListener()],
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const AppNavBar(),
              Space.y.t30,
              Padding(
                padding: Space.h.t20,
                child: const _PromotionForm(),
              ),
              Space.y.t100,
              const _PromotionTemplate(
                isMobileView: true,
              ),
              const Footer(
                type: FooterType.mobile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
