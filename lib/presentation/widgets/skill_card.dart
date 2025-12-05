import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/circular_container.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';

class SkillCardData {
  final String title;
  final String description;
  final IconData iconData;

  SkillCardData({required this.title, required this.iconData,required this.description});
}

class SkillCard extends StatefulWidget {
  SkillCard({
    this.title = "",
    this.description = "",
    this.titleStyle,
    this.descriptionStyle,
    this.width,
    this.height,
    this.iconSize = 40,
    this.elevation = Sizes.ELEVATION_4,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.backgroundColor = AppColors.white,
    this.iconData = Icons.phone,
    this.iconColor = AppColors.white,
    this.iconBackgroundColor = AppColors.black,
    this.child,
    this.onHoverChild,
  });

  final String title;
  final String description;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final double? width;
  final double? height;
  final double iconSize;
  final double elevation;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color iconColor;
  final Color iconBackgroundColor;
  final IconData iconData;
  final Widget? child;
  final Widget? onHoverChild;

  @override
  _SkillCardState createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius,
      ),
      child: defaultChild(),
    );
  }

  Widget defaultChild() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      color: widget.backgroundColor,
      elevation: widget.elevation,
      shape: RoundedRectangleBorder(borderRadius: widget.borderRadius),
      child: Container(
        key: Key("default"),
        child: widget.child ??
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularContainer(
                      backgroundColor: widget.iconBackgroundColor,
                      padding: const EdgeInsets.all(16),
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      iconData: widget.iconData,
                      iconColor: widget.iconColor,
                      iconSize: widget.iconSize,
                    ),
                    SpaceH12(),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: constraints.maxWidth),
                          child: Text(
                            widget.title,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            maxLines: 2,
                            // overflow: TextOverflow.ellipsis,
                            style: widget.titleStyle ?? textTheme.subtitle1,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget onHoverChild() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return widget.onHoverChild ??
        Stack(
          children: [
            ClipRRect(
              borderRadius: widget.borderRadius,
              child: Opacity(
                opacity: 0.9,
                child: Image.asset(
                  ImagePath.ICON_BOX,
                  width: widget.width,
                  height: widget.height,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: widget.titleStyle ??
                          textTheme.subtitle1?.copyWith(
                            color: AppColors.white,
                          ),
                    ),
                  ),
                  SpaceH8(),
                  Flexible(
                    child: Text(
                      widget.description,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: widget.descriptionStyle ??
                          textTheme.bodyText2?.copyWith(
                            color: AppColors.primaryText1,
                          ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
    // Container(
    //   key: Key("onHover"),
    //   child: Stack(
    //     children: [
    //       Image.asset(
    //         ImagePath.ICON_BOX,
    //         fit: BoxFit.fill,
    //       ),
    //     ],
    //   ),
    // );
  }
}
