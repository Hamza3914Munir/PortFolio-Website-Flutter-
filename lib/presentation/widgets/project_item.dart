import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nimbus/presentation/layout/adaptive.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/utils/functions.dart';
import 'package:nimbus/values/values.dart';
import 'package:url_launcher/link.dart';

import 'animated_indicator.dart';

class ProjectData {
  final String projectCoverUrl;
  final String title;
  final String category;
  final double width;
  final double height;
  final double mobileWidth;
  final double mobileHeight;
  final bool isLive;
  final String? githubUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;

  ProjectData({
    required this.projectCoverUrl,
    required this.title,
    required this.category,
    required this.width,
    this.mobileHeight = 0.5,
    this.mobileWidth = 1.0,
    this.height = 0.4,
    this.isLive = false,
    this.githubUrl,
    this.playStoreUrl,
    this.appStoreUrl,
  });
}

class ProjectItem extends StatefulWidget {
  const ProjectItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.width,
    required this.height,
    this.bannerHeight,
    this.titleStyle,
    this.subtitleStyle,
    this.textColor = AppColors.white,
    this.bannerColor,
    this.isLive = false,
    this.githubUrl,
    this.playStoreUrl,
    this.appStoreUrl,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final String imageUrl;
  final Color? bannerColor;
  final Color textColor;
  final double width;
  final double height;
  final double? bannerHeight;
  final bool isLive;
  final String? githubUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;

  @override
  _ProjectItemState createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem>
    with TickerProviderStateMixin {
  late AnimationController _slideFadeController;
  late AnimationController _indicatorController;
  late Animation<double> _indicatorAnimation;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideAnimation;
  bool _hovering = false;

  @override
  void initState() {
    super.initState();
    _indicatorController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideFadeController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _indicatorAnimation = Tween(
      begin: 100.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _indicatorController,
        curve: Curves.easeIn,
      ),
    );
    _fadeInAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _slideFadeController,
        curve: Curves.easeIn,
      ),
    );
    _slideAnimation =
        Tween<Offset>(begin: Offset(0, -0.1), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: _slideFadeController,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _slideFadeController.dispose();
    _indicatorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = !isDisplayDesktop(context);
    
    // On mobile, always show the cover (icons need to be visible)
    if (isMobile && _fadeInAnimation.value == 0.0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _slideFadeController.value = 1.0;
          _indicatorController.value = 1.0;
        }
      });
    }
    
    return MouseRegion(
      onEnter: isMobile ? null : (e) => _mouseEnter(true),
      onExit: isMobile ? null : (e) => _mouseEnter(false),
      child: Container(
        child: Stack(
          children: [
            Image.asset(
              widget.imageUrl,
              width: widget.width,
              height: widget.height,
              fit: BoxFit.fill,
            ),
            Positioned(
              bottom: 0,
              child: isMobile 
                ? ProjectCover(
                    animation: _indicatorAnimation,
                    color: widget.bannerColor ?? Colors.black.withOpacity(0.8),
                    width: widget.width,
                    height: widget.bannerHeight ?? widget.height / 3,
                    title: widget.title,
                    subtitle: widget.subtitle,
                    titleStyle: widget.titleStyle,
                    subtitleStyle: widget.subtitleStyle,
                    isHover: true,
                    isLive: widget.isLive,
                    githubUrl: widget.githubUrl,
                    playStoreUrl: widget.playStoreUrl,
                    appStoreUrl: widget.appStoreUrl,
                  )
                : FadeTransition(
                    opacity: _fadeInAnimation,
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: ProjectCover(
                        animation: _indicatorAnimation,
                        color: widget.bannerColor ?? Colors.black.withOpacity(0.8),
                        width: widget.width,
                        height: widget.bannerHeight ?? widget.height / 3,
                        title: widget.title,
                        subtitle: widget.subtitle,
                        titleStyle: widget.titleStyle,
                        subtitleStyle: widget.subtitleStyle,
                        isHover: _hovering,
                        isLive: widget.isLive,
                        githubUrl: widget.githubUrl,
                        playStoreUrl: widget.playStoreUrl,
                        appStoreUrl: widget.appStoreUrl,
                      ),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    if (!isDisplayDesktop(context)) return; // Only handle hover on desktop
    
    setState(() {
      _hovering = hovering;
    });
    if (_hovering) {
      _slideFadeController.forward();
      _indicatorController.forward();
    } else {
      _slideFadeController.reverse();
      _indicatorController.reset();
    }
  }
}

class ProjectCover extends StatelessWidget {
  const ProjectCover({
    Key? key,
    required this.width,
    required this.height,
    required this.title,
    required this.subtitle,
    required this.animation,
    this.indicatorColor = AppColors.white,
    this.color,
    this.subtitleStyle,
    this.titleStyle,
    this.isHover = false,
    this.isLive = false,
    this.githubUrl,
    this.playStoreUrl,
    this.appStoreUrl,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final double width;
  final double height;
  final Color? color;
  final Color indicatorColor;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  final Animation<double> animation;

  final bool isHover;
  final bool isLive;
  final String? githubUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: width,
      height: height,
      color: color ?? Colors.black.withOpacity(0.8),
      padding: EdgeInsets.symmetric(horizontal: Sizes.PADDING_16, vertical: Sizes.PADDING_12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // AnimatedHoverIndicator2(
          //   animation: animation,
          //   indicatorColor: indicatorColor,
          // ),
          SpaceW16(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Text(
                    title,
                    style: titleStyle ??
                        textTheme.headline6?.copyWith(
                          color: AppColors.white,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SpaceH8(),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        subtitle,
                        style: subtitleStyle ??
                            textTheme.subtitle2?.copyWith(
                              color: AppColors.white,
                              fontSize: Sizes.TEXT_SIZE_16,
                            ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if ((githubUrl != null && githubUrl!.isNotEmpty) || 
                        (playStoreUrl != null && playStoreUrl!.isNotEmpty) ||
                        (appStoreUrl != null && appStoreUrl!.isNotEmpty)) ...[
                      SpaceW8(),
                      _buildIconLinks(context),
                    ],
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildIconLinks(BuildContext context) {
    List<Widget> icons = [];
    
    // Always show GitHub if available
    if (githubUrl != null && githubUrl!.isNotEmpty) {
      icons.add(_buildIconButton(
        context,
        FontAwesomeIcons.github,
        githubUrl!,
        'GitHub',
      ));
    }
    
    // For live projects, also show Play Store and App Store
    if (isLive) {
      if (playStoreUrl != null && playStoreUrl!.isNotEmpty) {
        icons.add(_buildIconButton(
          context,
          FontAwesomeIcons.googlePlay,
          playStoreUrl!,
          'Play Store',
        ));
      }
      
      if (appStoreUrl != null && appStoreUrl!.isNotEmpty) {
        icons.add(_buildIconButton(
          context,
          FontAwesomeIcons.appStore,
          appStoreUrl!,
          'App Store',
        ));
      }
    }
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: icons,
    );
  }

  Widget _buildIconButton(BuildContext context, IconData icon, String url, String tooltip) {
    return _ProjectIconButton(
      icon: icon,
      url: url,
      tooltip: tooltip,
    );
  }
}

class _ProjectIconButton extends StatefulWidget {
  final IconData icon;
  final String url;
  final String tooltip;

  const _ProjectIconButton({
    Key? key,
    required this.icon,
    required this.url,
    required this.tooltip,
  }) : super(key: key);

  @override
  _ProjectIconButtonState createState() => _ProjectIconButtonState();
}

class _ProjectIconButtonState extends State<_ProjectIconButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: Tooltip(
        message: widget.tooltip,
        child: Link(
          uri: Uri.parse(widget.url),
          target: LinkTarget.blank,
          builder: (context, followLink) {
            return GestureDetector(
              onTap: followLink,
                child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                margin: EdgeInsets.only(left: responsiveSize(context, Sizes.PADDING_4, Sizes.PADDING_8)),
                padding: EdgeInsets.all(responsiveSize(context, Sizes.PADDING_4, Sizes.PADDING_6)),
                decoration: BoxDecoration(
                  color: _isHovering 
                      ? Colors.white.withOpacity(0.2)
                      : Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(Sizes.RADIUS_4),
                  border: Border.all(
                    color: _isHovering
                        ? Colors.white.withOpacity(0.4)
                        : Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Icon(
                  widget.icon,
                  size: responsiveSize(context, Sizes.TEXT_SIZE_14, Sizes.TEXT_SIZE_16),
                  color: AppColors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
