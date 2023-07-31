part of '../home.dart';

class _Mobile extends StatelessWidget {
  const _Mobile();

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Screen(
      keyboardHandler: false,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const AppNavBar(),
              Space.y.t30,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Make plans with your\nnext ',
                      style: AppText.h3 + FontWeight.w400,
                    ),
                    TextSpan(
                      text: ' group ',
                      style: AppText.h3,
                    ),
                    TextSpan(
                      text: 'of customers',
                      style: AppText.h3 + FontWeight.w400,
                    ),
                  ],
                ),
              ),
              Space.y.t30,
              Padding(
                padding: Space.h.t20,
                child: Text(
                  'Groups come to Leaf to make plans with the\npeople and places they love, including businesses like yours.',
                  style: AppText.s1,
                  textAlign: TextAlign.center,
                ),
              ),
              Space.y.t30,
              AppButton(
                width: 100.un(),
                height: 16.un(),
                label: 'Promote Your Business',
                onPressed: () =>
                    locator<WebRouter>().navigateTo(AppRoutes.searchBussiness),
              ),
              Space.y.t30,
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    StaticAssets.promotion,
                    height: 450,
                    width: 450,
                  ),
                  Image.asset(
                    StaticAssets.phone,
                    height: 450,
                    width: 450,
                  ),
                ],
              ),
              Space.y.t30,
              Padding(
                padding: Space.h.t20,
                child: Text(
                  'Maximize your advertising ROI by reaching groups at the moment they plan to go out. ',
                  style: AppText.s1,
                  textAlign: TextAlign.center,
                ),
              ),
              Space.y.t20,
              AppButton(
                width: 100.un(),
                height: 16.un(),
                label: 'Promote Your Business',
                onPressed: () =>
                    locator<WebRouter>().navigateTo(AppRoutes.searchBussiness),
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
