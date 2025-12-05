import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nimbus/presentation/pages/home/sections/statistics_section.dart';
import 'package:nimbus/presentation/widgets/buttons/social_button.dart';
import 'package:nimbus/presentation/widgets/buttons/social_button_2.dart';
import 'package:nimbus/presentation/widgets/nimbus_card.dart';
import 'package:nimbus/presentation/widgets/project_item.dart';
import 'package:nimbus/presentation/widgets/skill_card.dart';
import 'package:nimbus/presentation/widgets/skill_level.dart';

part 'colors.dart';
part 'borders.dart';
part 'images.dart';
part 'sizes.dart';
part 'strings.dart';
part 'styles.dart';
part 'data.dart';
part 'gradients.dart';
part 'decoration.dart';
part 'shadows.dart';
part 'radius.dart';
part 'text_theme_legacy.dart';


class WorkExperienceData {
  final String company;
  final String position;
  final String duration;
  final List<String> responsibilities;
  final IconData icon;

  WorkExperienceData({
    required this.company,
    required this.position,
    required this.duration,
    required this.responsibilities,
    required this.icon,
  });
}

class EducationData {
  final String degree;
  final String institution;
  final String duration;
  final String? specialization;
  final IconData icon;

  EducationData({
    required this.degree,
    required this.institution,
    required this.duration,
    this.specialization,
    required this.icon,
  });
}

class AwardItemData {
  final String title;
  final IconData icon;
  final Color iconColor;
  final String? url;

  AwardItemData({
    required this.title,
    required this.icon,
    required this.iconColor,
    this.url,
  });
}