part of 'footer.dart';

class _Desktop extends StatelessWidget {
  final bool topSpace;
  final FooterType? type;
  const _Desktop({
    required this.topSpace,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final isMobile = type == FooterType.mobile;

    return Container(
      padding: Space.v.t60,
      width: double.infinity,
      margin: topSpace ? (Space.t.t100 + Space.t.t20) : Space.z,
      color: Colors.black,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Leaf for Business',
            style: (isMobile ? AppText.h3 : AppText.h2) +
                FontWeight.w500 +
                Colors.white,
          ),
          Space.y.t30,
          Text(
            'Groups come to Leaf to make plans with the people and places\nthey love, including businesses like yours.',
            style: (isMobile ? AppText.s1 : AppText.b3) + Colors.white,
            textAlign: TextAlign.center,
          ),
          Space.y.t30,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () => html.window.open(Constants.facebook, '_blank'),
                icon: const Icon(
                  Icons.facebook,
                  color: Colors.white,
                ),
              ),
              Space.x.t10,
              IconButton(
                onPressed: () =>
                    html.window.open(Constants.instagram, '_blank'),
                icon: const Icon(
                  FontAwesomeIcons.instagram,
                  color: Colors.white,
                ),
              ),
              Space.x.t10,
              IconButton(
                onPressed: () =>
                    html.window.open(Constants.contactEmail, '_blank'),
                icon: const Icon(
                  Icons.email,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
