part of '../search_business.dart';

class _Desktop extends StatelessWidget {
  const _Desktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final screenState = _ScreenState.s(context, true);

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
      ],
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: Responsive.isMobile() ? Space.h.t30 : Space.a.t30,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Space.yf(Responsive.isTablet() ? 10 : 20),
                    Text(
                      'Let\'s get going!',
                      style:
                          (!Responsive.isDesktop() ? AppText.h2 : AppText.h1),
                      textAlign: TextAlign.center,
                    ),
                    Space.y.t15,
                    Text(
                      'Search and select your brick and mortar business.',
                      style:
                          (!Responsive.isDesktop() ? AppText.b1 : AppText.h3),
                      textAlign: TextAlign.center,
                    ),
                    Space.y.t60,
                    const _LocationField(),
                    if (screenState.noCityFound) ...[
                      Space.y.t10,
                      Text(
                        'No city matching your keywords. Try something different!',
                        style: AppText.s1 + AppTheme.danger + FontWeight.w700,
                      )
                    ],
                    Space.y.t30,
                    const _BusinessField(),
                    if (screenState.noResultsFound) ...[
                      Space.y.t10,
                      Text(
                        'No matching bussiness found, please try with different name/location',
                        style: AppText.s1 + AppTheme.danger + FontWeight.w700,
                      )
                    ],
                    Space.y.t60,
                    AppButton(
                      state: screenState.loading ||
                              screenState.cityLoading ||
                              screenState.query == null ||
                              screenState.query!.length < 3
                          ? AppButtonState.disabled
                          : AppButtonState.elevated,
                      width: 100.un(),
                      label: 'Get Started',
                      onPressed: () {
                        final isValid =
                            screenState.formKey.currentState!.saveAndValidate();

                        if (!isValid) return;
                        final form = screenState.formKey.currentState!;
                        final data = form.value;
                        final location = data[_FormKeys.location] as City;
                        final business =
                            data[_FormKeys.searchBusiness] as Business;

                        locator<WebRouter>().navigateTo(
                          AppRoutes.createPromotion,
                          queryParams: {
                            'location': location.city,
                            'business': business.toJson(),
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              Space.yf(10),
              Footer(
                type: Responsive.isMobile()
                    ? FooterType.mobile
                    : FooterType.desktop,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
