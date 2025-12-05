import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/utils/functions.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AwardsSection extends StatefulWidget {
  AwardsSection({Key? key});
  @override
  _AwardsSectionState createState() => _AwardsSectionState();
}

class _AwardsSectionState extends State<AwardsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    )..repeat();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context) - (getSidePadding(context));
    double contentAreaWidth = responsiveSize(
      context,
      screenWidth,
      screenWidth * 0.9,
      md: screenWidth * 0.85,
    );

    return VisibilityDetector(
      key: Key('awards-section'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 30 && !isVisible) {
          setState(() {
            isVisible = true;
          });
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: getSidePadding(context)),
        child: ResponsiveBuilder(
          refinedBreakpoints: RefinedBreakpoints(),
          builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth <= 1024) {
              return Column(
                children: [
                  _buildNimbusInfoSectionSm(),
                  SpaceH40(),
                ],
              );
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentArea(
                    width: contentAreaWidth,
                    child: _buildNimbusInfoSectionLg(),
                  ),
                  Spacer(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildNimbusInfoSectionSm() {
    return NimbusInfoSection2(
      sectionTitle: StringConst.MY_AWARDS,
      title1: StringConst.AWARDS_TITLE,
      hasTitle2: false,
      body: StringConst.AWARDS_DESC,
      child: Column(
        children: [
          _buildAwards1(),
          SpaceH40(),
          _buildAwards2(),
        ],
      ),
    );
  }

  Widget _buildNimbusInfoSectionLg() {
    return NimbusInfoSection1(
      sectionTitle: StringConst.MY_AWARDS,
      title1: StringConst.AWARDS_TITLE,
      hasTitle2: false,
      body: StringConst.AWARDS_DESC,
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildAwards1(),
            ),
            SpaceW40(),
            Expanded(
              child: _buildAwards2(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAwards1() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.emoji_events,
              color: AppColors.primaryColor,
              size: responsiveSize(context, 24, 28, md: 26),
            ),
            SpaceW12(),
            Text(
              StringConst.AWARDS_TYPE_TITLE_1,
              style: textTheme.headline6?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText2,
              ),
            ),
          ],
        ),
        SpaceH24(),
        ..._buildAwardItems(Data.awards1),
      ],
    );
  }

  Widget _buildAwards2() {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.verified,
              color: AppColors.primaryColor,
              size: responsiveSize(context, 24, 28, md: 26),
            ),
            SpaceW12(),
            Text(
              StringConst.AWARDS_TYPE_TITLE_2,
              style: textTheme.headline6?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText2,
              ),
            ),
          ],
        ),
        SpaceH24(),
        ..._buildAwardItems(Data.awards2),
      ],
    );
  }

  List<Widget> _buildAwardItems(List<AwardItemData> awards) {
    List<Widget> items = [];
    for (int index = 0; index < awards.length; index++) {
      items.add(
        _buildAwardCard(awards[index], index),
      );
      if (index < awards.length - 1) {
        items.add(SpaceH16());
      }
    }
    return items;
  }

  Widget _buildAwardCard(AwardItemData award, int index) {
    return _AwardCardWidget(award: award);
  }
}

class _AwardCardWidget extends StatefulWidget {
  final AwardItemData award;

  const _AwardCardWidget({required this.award});

  @override
  _AwardCardWidgetState createState() => _AwardCardWidgetState();
}

class _AwardCardWidgetState extends State<_AwardCardWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    bool hasLink = widget.award.url != null;

    Widget cardContent = AnimatedContainer(
      duration: Duration(milliseconds: 200),
      padding: EdgeInsets.all(responsiveSize(context, 16, 20, md: 18)),
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(Sizes.RADIUS_12),
        border: Border.all(
          color: _isHovered && hasLink
              ? widget.award.iconColor
              : AppColors.grey100,
          width: _isHovered && hasLink ? 2 : 1,
        ),
        boxShadow: _isHovered && hasLink
            ? [
                BoxShadow(
                  color: widget.award.iconColor.withOpacity(0.2),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ]
            : hasLink
                ? [
                    BoxShadow(
                      color: widget.award.iconColor.withOpacity(0.1),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ]
                : null,
      ),
      transform: Matrix4.identity()
        ..scale(_isHovered && hasLink ? 1.02 : 1.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: responsiveSize(context, 48, 56, md: 52),
            height: responsiveSize(context, 48, 56, md: 52),
            decoration: BoxDecoration(
              color: widget.award.iconColor.withOpacity(
                  _isHovered && hasLink ? 0.2 : 0.1),
              borderRadius: BorderRadius.circular(Sizes.RADIUS_12),
            ),
            child: Icon(
              widget.award.icon,
              color: widget.award.iconColor,
              size: responsiveSize(context, 24, 28, md: 26),
            ),
          ),
          SpaceW16(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.award.title,
                  style: textTheme.bodyText1?.copyWith(
                    color: AppColors.primaryText2,
                    fontWeight: FontWeight.w500,
                    fontSize: responsiveSize(context, 14, 16, md: 15),
                  ),
                ),
                if (hasLink) ...[
                  SpaceH4(),
                  Row(
                    children: [
                      Icon(
                        Icons.link,
                        size: 12,
                        color: AppColors.primaryColor,
                      ),
                      SpaceW4(),
                      Text(
                        "View Details",
                        style: textTheme.caption?.copyWith(
                          color: AppColors.primaryColor,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          if (hasLink)
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              transform: Matrix4.identity()
                ..translate(_isHovered ? 4.0 : 0.0, 0.0),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.primaryColor,
              ),
            ),
        ],
      ),
    );

    Widget card = MouseRegion(
      cursor: hasLink ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) {
        if (hasLink) {
          setState(() {
            _isHovered = true;
          });
        }
      },
      onExit: (_) {
        if (hasLink) {
          setState(() {
            _isHovered = false;
          });
        }
      },
      child: hasLink
          ? InkWell(
              onTap: () {
                openUrlLink(widget.award.url!);
              },
              borderRadius: BorderRadius.circular(Sizes.RADIUS_12),
              child: cardContent,
            )
          : cardContent,
    );

    return card;
  }
}
