import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:nimbus/presentation/widgets/spaces.dart';
import 'package:nimbus/values/values.dart';

class NavSectionMobile extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const NavSectionMobile({required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.HEIGHT_100,
      decoration: BoxDecoration(
        color: AppColors.black100,
      ),
      child: Row(
        children: [
          SpaceW30(),
          IconButton(
            icon: Icon(
              FeatherIcons.menu,
              color: AppColors.white,
              size: Sizes.ICON_SIZE_26,
            ),
            onPressed: () {
              if (scaffoldKey.currentState!.isEndDrawerOpen) {
                scaffoldKey.currentState?.openEndDrawer();
              } else {
                scaffoldKey.currentState?.openDrawer();
              }
            },
          ),
          Spacer(),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'HM',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
