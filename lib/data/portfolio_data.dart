import '../models/work_experience.dart';
import '../models/skill.dart';
import '../models/project.dart';

class PortfolioData {
  static const String name = 'Mbaka Bilal Tudor';
  static const String email = 'mbakabilal.t@gmail.com';
  static const String github = 'github.com/mbaka-bilal';

  static final List<WorkExperience> workExperiences = [
    WorkExperience(
      company: 'Alaart',
      position: 'Flutter Developer',
      startDate: DateTime(2023, 1),
      endDate: DateTime(2024, 1),
    ),
    WorkExperience(
      company: 'Harvoxx Tech Hub',
      position: 'Flutter Developer',
      startDate: DateTime(2024, 3),
      endDate: DateTime(2025, 3),
    ),
    WorkExperience(
      company: 'Walletwise',
      position: 'Flutter Developer',
      startDate: DateTime(2025, 9),
      endDate: null, // Currently working
    ),
  ];

  static final List<Skill> skills = [
    Skill(name: 'Flutter', level: ProficiencyLevel.advanced),
    Skill(
      name: 'Node.js with PostgreSQL',
      level: ProficiencyLevel.intermediate,
    ),
  ];

  static final List<Project> projects = [
    Project(
      title: 'Yirapay',
      description: 'An escrow platform for crypto transactions.',
      links: {
        'Website': 'https://app.useyirapay.com',
        'App Store': 'https://apps.apple.com/gh/app/yirapay/id6755782075',
      },
    ),
  ];
}
