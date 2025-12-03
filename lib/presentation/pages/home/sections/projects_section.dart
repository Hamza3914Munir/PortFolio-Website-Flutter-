import 'package:flutter/material.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/content_area.dart';
import 'package:nimbus/presentation/widgets/nimbus_info_section.dart';
import 'package:nimbus/presentation/widgets/project_item.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProjectsSection extends StatefulWidget {
  ProjectsSection({Key? key});

  @override
  _ProjectsSectionState createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _projectController;
  late Animation<double> _projectScaleAnimation;

  @override
  void initState() {
    super.initState();
    _projectController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _projectScaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _projectController,
        curve: Curves.fastOutSlowIn,
      ),
    );
    // Start animation immediately so projects are visible
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _playProjectAnimation();
      }
    });
  }

  @override
  void dispose() {
    _projectController.dispose();
    super.dispose();
  }

  Future<void> _playProjectAnimation() async {
    try {
      await _projectController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context) - (getSidePadding(context) * 2);
    double contentAreaWidth = screenWidth;
    return VisibilityDetector(
      key: Key('project-section'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 20) {
          _playProjectAnimation();
        }
      },
      child: ResponsiveBuilder(
        refinedBreakpoints: RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          if (screenWidth < (RefinedBreakpoints().tabletLarge)) {
            return Container(
              padding:
                  EdgeInsets.symmetric(horizontal: getSidePadding(context)),
              child: ContentArea(
                width: contentAreaWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNimbusInfoSectionSm(),
                    SpaceH40(),
                    _buildLiveProjectsSection(isMobile: true),
                    SpaceH60(),
                    _buildOfflineProjectsSection(isMobile: true),
                  ],
                ),
              ),
            );
          } else {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: getSidePadding(context),
                  ),
                  child: ContentArea(
                    width: contentAreaWidth,
                    child: _buildNimbusInfoSectionLg(),
                  ),
                ),
                SpaceH40(),
                _buildLiveProjectsSection(isMobile: false),
                SpaceH60(),
                _buildOfflineProjectsSection(isMobile: false),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildNimbusInfoSectionSm() {
    return NimbusInfoSection2(
      sectionTitle: StringConst.MY_WORKS,
      title1: StringConst.MEET_MY_PROJECTS,
      hasTitle2: false,
      body: StringConst.PROJECTS_DESC,
    );
  }

  Widget _buildNimbusInfoSectionLg() {
    return NimbusInfoSection1(
      sectionTitle: StringConst.MY_WORKS,
      title1: StringConst.MEET_MY_PROJECTS,
      hasTitle2: false,
      body: StringConst.PROJECTS_DESC,
    );
  }

  Widget _buildLiveProjectsSection({required bool isMobile}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getSidePadding(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConst.LIVE_PROJECTS_TITLE,
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
          ),
          SpaceH20(),
          Text(
            StringConst.LIVE_PROJECTS_DESC,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: AppColors.grey350,
                ),
          ),
          SpaceH40(),
          Wrap(
            spacing: isMobile ? 16.0 : assignWidth(context, 0.025),
            runSpacing: isMobile ? assignHeight(context, 0.05) : assignWidth(context, 0.025),
            children: _buildProjects(Data.liveProjects, isMobile: isMobile),
          ),
        ],
      ),
    );
  }

  Widget _buildOfflineProjectsSection({required bool isMobile}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: getSidePadding(context)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConst.OFFLINE_PROJECTS_TITLE,
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
          ),
          SpaceH20(),
          Text(
            StringConst.OFFLINE_PROJECTS_DESC,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                  color: AppColors.grey350,
                ),
          ),
          SpaceH40(),
          Wrap(
            spacing: isMobile ? 16.0 : assignWidth(context, 0.025),
            runSpacing: isMobile ? assignHeight(context, 0.05) : assignWidth(context, 0.025),
            children: _buildProjects(Data.offlineProjects, isMobile: isMobile),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildProjects(List<ProjectData> data, {bool isMobile = false}) {
    List<Widget> items = [];
    double screenWidth = widthOfScreen(context) - (getSidePadding(context) * 2);
    
    for (int index = 0; index < data.length; index++) {
      double projectWidth;
      if (isMobile) {
        // Mobile: use mobileWidth (typically 1.0 for full width)
        projectWidth = assignWidth(context, data[index].mobileWidth);
      } else {
        // Desktop/Web: calculate width to show 2 projects per row
        // Account for spacing between projects - use same spacing as Wrap widget
        double spacing = assignWidth(context, 0.025);
        // Available width is screenWidth (which already accounts for side padding)
        // For 2 items per row: (availableWidth - spacing) / 2
        projectWidth = (screenWidth - spacing) / 2;
      }
      
      items.add(
        ScaleTransition(
          scale: _projectScaleAnimation,
          child: ProjectItem(
            width: projectWidth,
            height: isMobile
                ? assignHeight(context, data[index].mobileHeight)
                : assignHeight(context, data[index].height),
            bannerHeight: isMobile
                ? assignHeight(context, data[index].mobileHeight) / 2
                : assignHeight(context, data[index].height) / 3,
            title: data[index].title,
            subtitle: data[index].category,
            imageUrl: data[index].projectCoverUrl,
            isLive: data[index].isLive,
            githubUrl: data[index].githubUrl,
            playStoreUrl: data[index].playStoreUrl,
            appStoreUrl: data[index].appStoreUrl,
          ),
        ),
      );
    }

    return items;
  }
}
