part of '../create_promotion.dart';

class _PromotionTemplate extends StatelessWidget {
  final bool isMobileView;
  const _PromotionTemplate({
    this.isMobileView = false,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final screenState = _ScreenState.s(context, true);
    double phoneSize = 250.un();
    double? templateWidgetsHeight;
    double? templateWidgetsWidth;

    if (isMobileView) {
      templateWidgetsHeight = 100.un();
      templateWidgetsWidth = AppMedia.width * 0.8;

      if (AppMedia.width > 450) {
        templateWidgetsWidth = AppMedia.width * 0.5;
      }

      if (AppMedia.width > 650) {
        templateWidgetsWidth = AppMedia.width * 0.40;
      }

      if (AppMedia.width > 750) {
        templateWidgetsWidth = AppMedia.width * 0.3;
      }
    }

    if (AppMedia.width <= AppBreakpoints.xmd) {
      phoneSize = 170.un();
    } else if (AppMedia.width <= AppBreakpoints.lg) {
      phoneSize = 200.un();
    } else if (AppMedia.width <= AppBreakpoints.xl) {}

    return Column(
      children: [
        Text(
          'Preview',
          style: AppText.b1 + FontWeight.w700,
        ),
        Space.y.t15,
        Expanded(
          flex: isMobileView ? 0 : 1,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                child: Image.asset(
                  StaticAssets.phone,
                ),
              ),
              SingleChildScrollView(
                padding: isMobileView ? Space.z : Space.h.t30 + Space.h.t05,
                child: Column(
                  children: [
                    Space.y.t60,
                    Space.y.t25,
                    Image.asset(
                      StaticAssets.logoLeaf,
                      height: 17.un(),
                    ),
                    Space.y.t25,
                    Container(
                      height: templateWidgetsHeight ?? 70.un(),
                      width: templateWidgetsWidth ?? phoneSize / 2.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(4.un()),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                            screenState.image != null
                                ? screenState.image!.path
                                : screenState.business.imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: templateWidgetsWidth ?? phoneSize / 2.25,
                      padding: Space.a.t25,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppTheme.green,
                            AppTheme.green.withOpacity(.7),
                          ],
                        ),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(4.un()),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  screenState.business.name.sentenceCase,
                                  style: AppText.b1 + Colors.white,
                                ),
                              ),
                              Space.x.t10,
                              Container(
                                padding: Space.a.t05 + Space.h.t05,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: 4.radius(),
                                ),
                                child: Text(
                                  'Promoted',
                                  style: AppText.s2 + AppTheme.green,
                                ),
                              )
                            ],
                          ),
                          if (screenState.headline != null &&
                              screenState.headline!.isNotEmpty) ...[
                            Space.y.t20,
                            Text(
                              screenState.headline!,
                              style: AppText.s1 + Colors.white,
                            ),
                          ],
                          if (screenState.notes != null &&
                              screenState.notes!.isNotEmpty) ...[
                            Space.y.t10,
                            Text(
                              'Location Notes',
                              style: AppText.s2 + AppTheme.lightGrey,
                            ),
                            Space.y.t05,
                            Text(
                              screenState.notes!,
                              style: AppText.s1 + Colors.white,
                            ),
                          ],
                        ],
                      ),
                    ),
                    Space.y.t15,
                    Container(
                      width: templateWidgetsWidth ?? phoneSize / 2.25,
                      height: 50.un(),
                      padding: Space.a.t30,
                      decoration: BoxDecoration(
                        borderRadius: 8.radius(),
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey,
                            Colors.grey[200]!,
                          ],
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.image_outlined,
                          size: 20.un(),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Space.y.t15,
                    Container(
                      width: templateWidgetsWidth ?? phoneSize / 2.25,
                      padding: Space.a.t30,
                      decoration: BoxDecoration(
                        borderRadius: 8.radius(),
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey,
                            Colors.grey[200]!,
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
