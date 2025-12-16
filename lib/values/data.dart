part of 'values.dart';

class Data {
  static List<SocialButtonData> socialData = [
    SocialButtonData(
      tag: StringConst.GITHUB_URL,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    SocialButtonData(
      tag: StringConst.LINKED_IN_URL,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
    SocialButtonData(
      tag: StringConst.YOUTUBE_URL,
      iconData: FontAwesomeIcons.youtube,
      url: StringConst.YOUTUBE_URL,
    ),
    SocialButtonData(
      tag: StringConst.TWITTER_URL,
      iconData: FontAwesomeIcons.twitter,
      url: StringConst.TWITTER_URL,
    ),
  ];
  static List<SocialButton2Data> socialData2 = [
    SocialButton2Data(
      title: "GitHub",
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
      titleColor: AppColors.blue300,
      buttonColor: AppColors.blue300,
      iconColor: AppColors.white,
    ),
    SocialButton2Data(
      title: "LinkedIn",
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
      titleColor: AppColors.pink300,
      buttonColor: AppColors.pink300,
      iconColor: AppColors.white,
    ),
    SocialButton2Data(
      title: "YouTube",
      iconData: FontAwesomeIcons.youtube,
      url: StringConst.YOUTUBE_URL,
      titleColor: AppColors.yellow300,
      buttonColor: AppColors.yellow300,
      iconColor: AppColors.white,
    ),
  ];

  static List<SkillLevelData> skillLevelData = [
    SkillLevelData(skill: StringConst.TOOLS_1_NAME, level: 90), // Flutter / Dart
    SkillLevelData(skill: StringConst.TOOLS_2_NAME, level: 90), // Firebase & Supabase
    SkillLevelData(skill: StringConst.TOOLS_3_NAME, level: 75), // AI / ML Integration
    SkillLevelData(
        skill: StringConst.TOOLS_4_NAME,
        level: 80), // SQL Databases (MySQL, PostgreSQL, SQLite / Sqflite)
    SkillLevelData(
        skill: StringConst.TOOLS_5_NAME,
        level: 85), // CI/CD Pipeline & Deployment
    SkillLevelData(
        skill: StringConst.TOOLS_6_NAME,
        level: 65), // Django / Django REST Framework (DRF)
    SkillLevelData(skill: StringConst.TOOLS_7_NAME, level: 45), // Kotlin (Android)
    SkillLevelData(skill: StringConst.TOOLS_8_NAME, level: 40), // Swift (iOS)
    SkillLevelData(skill: StringConst.TOOLS_9_NAME, level: 60), // React Native
    SkillLevelData(
        skill: StringConst.TOOLS_10_NAME, level: 90), // Teaching & Research
  ];

  static List<SkillCardData> skillCardData = [
    SkillCardData(
      title: StringConst.SKILLS_1,
      description: StringConst.SKILLS_1_DESC,
      iconData: Icons.phone_android,
    ),
    SkillCardData(
      title: "",
      description: "",
      iconData: Icons.pages_outlined,
    ), //not being used
    SkillCardData(
      title: StringConst.SKILLS_2,
      description: StringConst.SKILLS_2_DESC,
      iconData: FontAwesomeIcons.youtube,
    ),
    SkillCardData(
      title: StringConst.SKILLS_3,
      description: StringConst.SKILLS_3_DESC,
      iconData: Icons.science,
    ),
    SkillCardData(
      title: StringConst.SKILLS_4,
      description: StringConst.SKILLS_4_DESC,
      iconData: Icons.cloud,
    ),
    SkillCardData(
      title: "",
      description: "",
      iconData: Icons.pages_outlined,
    ), //not being used
  ];
  static List<StatItemData> statItemsData = [
    StatItemData(value: 25, subtitle: StringConst.HAPPY_CLIENTS),
    StatItemData(value: 2, subtitle: StringConst.YEARS_OF_EXPERIENCE),
    StatItemData(value: 30, subtitle: StringConst.INCREDIBLE_PROJECTS),
    StatItemData(value: 5, subtitle: StringConst.AWARD_WINNING),
  ];

  // static List<ProjectCategoryData> projectCategories = [
  //   ProjectCategoryData(title: StringConst.ALL, number: 5, isSelected: true),
  //   ProjectCategoryData(title: StringConst.BRANDING, number: 2),
  //   ProjectCategoryData(title: StringConst.PACKAGING, number: 0),
  //   ProjectCategoryData(title: StringConst.PHOTOGRAPHY, number: 1),
  //   ProjectCategoryData(title: StringConst.WEB_DESIGN, number: 2),
  // ];

  static List<AwardItemData> awards1 = [
    AwardItemData(
      title: StringConst.AWARDS_1,
      icon: Icons.emoji_events,
      iconColor: AppColors.yellow400,
      url: null,
    ),
    AwardItemData(
      title: StringConst.AWARDS_2,
      icon: Icons.description,
      iconColor: AppColors.blue300,
      url: "https://github.com/Hamza3914Munir/Research-paper-pakPOL-",
    ),
    AwardItemData(
      title: StringConst.AWARDS_3,
      icon: FontAwesomeIcons.youtube,
      iconColor: AppColors.red300,
      url: StringConst.YOUTUBE_URL,
    ),
    AwardItemData(
      title: StringConst.AWARDS_5,
      icon: Icons.store,
      iconColor: AppColors.purple300,
      url: null,
    ),
  ];
  static List<AwardItemData> awards2 = [
    AwardItemData(
      title: StringConst.AWARDS_4,
      icon: Icons.school,
      iconColor: AppColors.green300,
      url: "https://github.com/Hamza3914Munir/Certificates",
    ),
    AwardItemData(
      title: StringConst.AWARDS_6,
      icon: Icons.phone_android,
      iconColor: AppColors.blue400,
      url: "https://github.com/Hamza3914Munir/Certificates",
    ),
    AwardItemData(
      title: StringConst.AWARDS_7,
      icon: Icons.cloud,
      iconColor: AppColors.orange300,
      url: "https://github.com/Hamza3914Munir/Certificates",
    ),
    AwardItemData(
      title: StringConst.AWARDS_8,
      icon: Icons.psychology,
      iconColor: AppColors.pink300,
      url: "https://github.com/Hamza3914Munir/Certificates",
    ),
  ];

  static List<NimBusCardData> nimbusCardData = [
    NimBusCardData(
      title: "Flutter Developer",
      subtitle: "Cross-platform mobile apps",
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
    ),
    NimBusCardData(
      title: "Content Creator",
      subtitle: "Teaching on YouTube",
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
      circleBgColor: AppColors.yellow100,
    ),
    NimBusCardData(
      title: "Researcher",
      subtitle: "AI/ML & Innovation",
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
      leadingIconColor: AppColors.black,
      circleBgColor: AppColors.grey50,
    ),
  ];

  // Live Projects - Published on Play Store & App Store
  static List<ProjectData> liveProjects = [
    ProjectData(
      title: StringConst.PORTFOLIO_1_TITLE,
      category: "E-Commerce",
      projectCoverUrl: ImagePath.PORTFOLIO_1,
      width: 0.5,
      mobileHeight: 0.3,
      isLive: true,
      githubUrl: "https://github.com/Hamza3914Munir/PG-Mart-Seller",
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.pgmartseller.pgmartseller&pcampaignid=web_share",
      appStoreUrl:
          "https://apps.apple.com/us/app/pgmart-seller-sell-online/id6744322265",
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_2_TITLE,
      category: "AI/ML",
      projectCoverUrl: ImagePath.PORTFOLIO_2,
      width: 0.5,
      mobileHeight: 0.3,
      isLive: true,
      githubUrl: "https://github.com/Hamza3914Munir/Stora-AI",
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=ai.story.generator.imagetostory.textostory&pcampaignid=web_share",
      appStoreUrl:
          "https://apps.apple.com/us/app/stora-ai-image-to-story/id6505105590",
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_3_TITLE,
      category: "Productivity",
      projectCoverUrl: ImagePath.PORTFOLIO_3,
      // Using portfolio_01 as placeholder since portfolio_03 doesn't exist
      width: 0.5,
      mobileHeight: 0.3,
      isLive: true,
      githubUrl: "https://github.com/Hamza3914Munir/Simple-Habit-Tracker-Pro",
      playStoreUrl: "",
      // App not added yet
      appStoreUrl:
          "https://apps.apple.com/us/app/simple-habit-tracker-pro/id6743019181",
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_4_TITLE,
      category: "E-Commerce",
      projectCoverUrl: ImagePath.PORTFOLIO_4,
      width: 0.5,
      mobileHeight: 0.3,
      isLive: true,
      githubUrl: "https://github.com/Hamza3914Munir/PG-Mart-Vendor",
      playStoreUrl:
          "https://play.google.com/store/apps/details?id=com.pgmart.pgmart&pcampaignid=web_share",
      appStoreUrl:
          "https://apps.apple.com/us/app/pgmart-ultimate-shopping/id6744250973",
    ),
  ];

  // Offline / Non-Published Projects
  static List<ProjectData> offlineProjects = [
    ProjectData(
      title: StringConst.PORTFOLIO_5_TITLE,
      category: "Islamic App",
      projectCoverUrl: ImagePath.PORTFOLIO_5,
      width: 0.5,
      mobileHeight: 0.3,
      isLive: false,
      githubUrl:
          "https://github.com/Hamza3914Munir/Prayer-Jammat-Timings-User-App-",
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_6_TITLE,
      category: "IOT App Dashboard",
      projectCoverUrl: ImagePath.PORTFOLIO_6,
      width: 0.5,
      mobileHeight: 0.3,
      isLive: false,
      githubUrl:
          "https://github.com/Hamza3914Munir/Tesla-Charging-Car-Dashboard",
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_7_TITLE,
      category: "AI Fintech App",
      projectCoverUrl: ImagePath.PORTFOLIO_7,
      width: 0.5,
      mobileHeight: 0.3,
      isLive: false,
      githubUrl:
          "https://github.com/Hamza3914Munir/AI-Budget-Tracker-App/tree/master",
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_8_TITLE,
      category: "Banking App",
      projectCoverUrl: ImagePath.PORTFOLIO_8,
      width: 0.5,
      mobileHeight: 0.3,
      isLive: false,
      githubUrl:
          "https://github.com/Hamza3914Munir/Duesify-Banking-App/tree/master",
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_9_TITLE,
      category: "Advance IOT App",
      projectCoverUrl: ImagePath.PORTFOLIO_9,
      width: 0.5,
      mobileHeight: 0.3,
      isLive: false,
      githubUrl: "https://github.com/Hamza3914Munir/Ventia",
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_10_TITLE,
      category: "Health & Medical App",
      projectCoverUrl: ImagePath.PORTFOLIO_10,
      width: 0.5,
      mobileHeight: 0.3,
      isLive: false,
      githubUrl: "https://github.com/Hamza3914Munir/Blood-Bridge",
    ),
  ];

  // Legacy projects (kept for backward compatibility if needed)
  static List<ProjectData> allProjects = [
    ProjectData(
      title: StringConst.PORTFOLIO_1_TITLE,
      category: StringConst.BRANDING,
      projectCoverUrl: ImagePath.PORTFOLIO_1,
      width: 0.5,
      mobileHeight: 0.3,
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_2_TITLE,
      category: StringConst.BRANDING,
      projectCoverUrl: ImagePath.PORTFOLIO_2,
      width: 0.225,
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_4_TITLE,
      category: StringConst.PHOTOGRAPHY,
      projectCoverUrl: ImagePath.PORTFOLIO_4,
      width: 0.2375,
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_5_TITLE,
      category: StringConst.WEB_DESIGN,
      projectCoverUrl: ImagePath.PORTFOLIO_5,
      width: 0.2375,
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_6_TITLE,
      category: StringConst.WEB_DESIGN,
      projectCoverUrl: ImagePath.PORTFOLIO_6,
      width: 0.475,
      mobileHeight: 0.3,
    ),
  ];
  static List<ProjectData> branding = [
    ProjectData(
      title: StringConst.PORTFOLIO_1_TITLE,
      category: StringConst.BRANDING,
      projectCoverUrl: ImagePath.PORTFOLIO_1,
      width: 0.5,
      mobileHeight: 0.3,
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_2_TITLE,
      category: StringConst.BRANDING,
      projectCoverUrl: ImagePath.PORTFOLIO_2,
      width: 0.225,
    ),
  ];
  static List<ProjectData> packaging = [];
  static List<ProjectData> photograhy = [
    ProjectData(
      title: StringConst.PORTFOLIO_4_TITLE,
      category: StringConst.PHOTOGRAPHY,
      projectCoverUrl: ImagePath.PORTFOLIO_4,
      width: 0.2375,
    ),
  ];
  static List<ProjectData> webDesign = [
    ProjectData(
      title: StringConst.PORTFOLIO_5_TITLE,
      category: StringConst.WEB_DESIGN,
      projectCoverUrl: ImagePath.PORTFOLIO_5,
      width: 0.2375,
    ),
    ProjectData(
      title: StringConst.PORTFOLIO_6_TITLE,
      category: StringConst.WEB_DESIGN,
      projectCoverUrl: ImagePath.PORTFOLIO_6,
      width: 0.475,
      mobileHeight: 0.3,
    ),
  ];

  static List<WorkExperienceData> workExperienceData = [
    WorkExperienceData(
      company: "IIFA Tech, Lahore",
      position: "Software Engineer",
      duration: "April 2025 - present",
      icon: Icons.work,
      responsibilities: [
        "Integrated advanced payment solutions, including crypto wallets, NFT-based transactions, and blockchain-based payment flows across multiple apps.",
        "Implemented AI and ML features—such as recommendation systems, predictive analytics, and automation tools—to enhance app functionality and user experience.",
        "Integrated in-app advertising frameworks and optimized ad placements to improve revenue performance without disrupting UX.",
      ],
    ),
    WorkExperienceData(
      company: "IIFA Tech, Lahore",
      position: "Associate Flutter Developer",
      duration: "Nov 2024 – April 2025",
      icon: Icons.work,
      responsibilities: [
        "Worked with a team of Flutter developers to build and maintain scalable apps using BLoC",
        "Assisted in integrating hybrid features with React Native components",
        "Collaborated in refining the CI/CD workflow and reducing manual testing overhead",
        "Participated in code reviews and supported junior team members in debugging common issues",
      ],
    ),
    WorkExperienceData(
      company: "Sivers.Co, Lahore",
      position: "Flutter Developer",
      duration: "Dec 2023 – Oct 2024",
      icon: Icons.phone_android,
      responsibilities: [
        "Helped port a legacy system to Flutter Web with responsive layouts",
        "Used Dart isolates to manage local processes for smoother backend interactions",
        "Optimized app performance and load times across multiple screen sizes",
      ],
    ),
    WorkExperienceData(
      company: "ZAM Studios",
      position: "Remote Flutter Intern Leader",
      duration: "Sep 2023 – Nov 2023",
      icon: Icons.group,
      responsibilities: [
        "Led a team of interns to deliver a Firebase-integrated mobile app with simple AI-powered insights",
        "Managed code reviews and guided interns on Flutter fundamentals and state management",
      ],
    ),
    WorkExperienceData(
      company: "IIFA Tech, Lahore",
      position: "Flutter Developer Intern",
      duration: "Jul 2023 – Aug 2023",
      icon: Icons.school,
      responsibilities: [
        "Developed responsive UI screens from Figma designs",
        "Worked on Firebase CRUD operations and implemented reusable UI components",
      ],
    ),
  ];

  static List<EducationData> educationData = [
    EducationData(
      degree: "Bachelor of Science in Computer Science",
      institution: "University of Management and Technology (UMT), Lahore",
      duration: "2021–2025",
      icon: Icons.school,
    ),
    EducationData(
      degree: "Intermediate (F.Sc. Pre-Engineering)",
      institution: "Divisional Higher Secondary School, M. Garh",
      duration: "2018–2020",
      specialization: "D.G. Khan Board",
      icon: Icons.book,
    ),
    EducationData(
      degree: "Matriculation (Science Group)",
      institution: "Sardar Kauray Khan Public Higher Secondary School, M. Garh",
      duration: "2015–2017",
      specialization: "D.G. Khan Board",
      icon: Icons.menu_book,
    ),
    EducationData(
      degree: "Mobile App Development with Flutter",
      institution: "UMT Lahore",
      duration: "2023",
      icon: Icons.phone_android,
    ),
  ];
}
