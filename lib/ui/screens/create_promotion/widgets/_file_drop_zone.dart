part of '../create_promotion.dart';

class _FileDropZone extends StatefulWidget {
  final String label;

  const _FileDropZone({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  State<_FileDropZone> createState() => __FileDropZoneState();
}

class __FileDropZoneState extends State<_FileDropZone> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final screenState = _ScreenState.s(context, true);

    return InkWell(
      onHover: (value) {
        setState(() {
          hover = value;
        });
      },
      onTap: screenState.uploadImage,
      child: screenState.image != null
          ? Container(
              width: 150,
              height: 70.un(),
              decoration: BoxDecoration(
                borderRadius: 10.radius(),
                image: DecorationImage(
                  image: NetworkImage(
                    screenState.image!.path,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  IconButton(
                    onPressed: () => screenState.resetImage(),
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            )
          : AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 150,
              height: 70.un(),
              decoration: BoxDecoration(
                borderRadius: 10.radius(),
                color: hover ? Colors.white : AppTheme.lightGrey,
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.upload_file,
                          color: hover ? AppTheme.green : AppTheme.grey,
                          size: 22.un(),
                        ),
                        Space.y.t10,
                        Text(
                          widget.label,
                          style: AppText.s1 +
                              (hover ? AppTheme.green : AppTheme.grey),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
