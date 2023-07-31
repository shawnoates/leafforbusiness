part of '../create_promotion.dart';

class _Desktop extends StatelessWidget {
  const _Desktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final screenState = _ScreenState.s(context, true);

    double formWidth = AppMedia.width * .35;
    double templateSize = 250.un();

    if (AppMedia.width <= AppBreakpoints.xmd) {
      templateSize = 170.un();
      formWidth = AppMedia.width * .45;
    } else if (AppMedia.width <= AppBreakpoints.lg) {
      formWidth = AppMedia.width * .42;
      templateSize = 200.un();
    } else if (AppMedia.width <= AppBreakpoints.xl) {
      formWidth = AppMedia.width * .4;
    }

    return Screen(
      keyboardHandler: true,
      formKey: screenState.formKey,
      initialFormValue: _FormData.initialValues(),
      overlayBuilders: const [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppNavBar(),
        ),
        _PaymentListener(),
      ],
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: Space.a.t30,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Space.y.t60,
                    Text(
                      'Create Promotion',
                      style: AppText.h1,
                    ),
                    Space.y.t60,
                    Padding(
                      padding:
                          Responsive.isDesktop() ? Space.h.t100 : Space.h.t20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: templateSize,
                            width: templateSize / 2,
                            child: const _PromotionTemplate(),
                          ),
                          SizedBox(
                            width: formWidth,
                            child: const _PromotionForm(),
                          ),
                        ],
                      ),
                    ),
                    Space.y.t100,
                  ],
                ),
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
