part of '../home.dart';

class _Desktop extends StatelessWidget {
  const _Desktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    App.init(context);

    double hPadding = 25.sp();
    double mockUpSize = 220.un();

    if (AppMedia.width < 1150) {
      hPadding = 5.sp();
      mockUpSize = 190.un();
    } else if (AppMedia.width < 1450) {
      hPadding = 10.sp();
    }

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Space.y.t60,
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Make plans with your\nnext ',
                      style: (AppMedia.width < 750 ? AppText.h2 : AppText.h1) +
                          FontWeight.w400,
                    ),
                    TextSpan(
                      text: ' group ',
                      style: (AppMedia.width < 750 ? AppText.h2 : AppText.h1),
                    ),
                    TextSpan(
                      text: 'of customers',
                      style: (AppMedia.width < 750 ? AppText.h2 : AppText.h1) +
                          FontWeight.w400,
                    ),
                  ],
                ),
              ),
              Space.y.t30,
              Text(
                'Groups come to Leaf to make plans with the\npeople and places they love, including businesses like yours.',
                style: AppText.b3,
                textAlign: TextAlign.center,
              ),
              Space.y.t30,
              Space.y.t20,
              AppButton(
                width: 100.un(),
                height: 16.un(),
                label: 'Promote Your Business',
                onPressed: () =>
                    locator<WebRouter>().navigateTo(AppRoutes.searchBussiness),
              ),
              Space.y.t30,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(width: hPadding),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Set it and forget it',
                          style: AppText.b1 + FontWeight.w700,
                        ),
                        Space.y.t20,
                        Text(
                          'There’s no keyword research or design work needed. Give us a few details and we’ll take it from there.\n\nWe’ll create, launch, and optimize your promotion within the app.',
                          style: AppText.b3,
                        ),
                        Space.y.t60,
                        Text(
                          'Pay what you want',
                          style: AppText.b1 + FontWeight.w700,
                        ),
                        Space.y.t20,
                        Text(
                          'Have better certainty about your marketing spend with fixed-priced promotions.\n\nUpfront pricing starts at as little as \$5.00 a day. ',
                          style: AppText.b3,
                        ),
                      ],
                    ),
                  ),
                  Space.x.t30,
                  Expanded(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          StaticAssets.promotion,
                          height: mockUpSize,
                          width: mockUpSize,
                        ),
                        Image.asset(
                          StaticAssets.phone,
                          height: mockUpSize,
                          width: mockUpSize,
                        ),
                      ],
                    ),
                  ),
                  Space.x.t30,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Increase your foot traffic',
                          style: AppText.b1 + FontWeight.w700,
                        ),
                        Space.y.t20,
                        Text(
                          '​​Attract groups to your physical location right when they are making plans to go out.\n\nGenerate more sales from the increased foot traffic.',
                          style: AppText.b3,
                        ),
                        Space.y.t60,
                        Text(
                          'Get data you care about',
                          style: AppText.b1 + FontWeight.w700,
                        ),
                        Space.y.t20,
                        Text(
                          'Receive weekly emails about the status of your promotion and better understand how groups interact with your business',
                          style: AppText.b3,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: hPadding),
                ],
              ),
              Space.y.t30,
              Text(
                'Maximize your advertising ROI by reaching groups at the moment they plan to go out. ',
                style: AppText.b3,
                textAlign: TextAlign.center,
              ),
              Space.y.t20,
              AppButton(
                width: 100.un(),
                height: 16.un(),
                label: 'Promote Your Business',
                onPressed: () =>
                    locator<WebRouter>().navigateTo(AppRoutes.searchBussiness),
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
