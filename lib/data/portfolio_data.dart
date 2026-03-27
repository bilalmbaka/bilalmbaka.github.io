import '../models/work_experience.dart';
import '../models/skill.dart';
import '../models/project.dart';

class PortfolioData {
  static const String name = 'Mbaka Bilal Tudor';
  static const String email = 'mbakabilal.t@gmail.com';
  static const String github = 'github.com/bilalmbaka';

  static final List<WorkExperience> workExperiences = [
    WorkExperience(
      company: 'Helixgade',
      position: 'Flutter Developer (Intern)',
      startDate: DateTime(2022, 10),
      endDate: DateTime(2022, 11),
    ),
    WorkExperience(
      company: 'Alaart',
      position: 'Flutter Developer (Intern)',
      startDate: DateTime(2023, 5),
      endDate: DateTime(2024, 1),
    ),
    WorkExperience(
      company: 'Harvoxx Tech Hub',
      position: 'Flutter Developer',
      startDate: DateTime(2024, 3),
      endDate: DateTime(2025, 6),
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
      description:
          'An escrow platform for crypto transactions, this is a project been maintained by I and my Colleague',
      links: {
        'Website': 'https://app.useyirapay.com',
        'App Store': 'https://apps.apple.com/gh/app/yirapay/id6755782075',
      },
    ),
    Project(
      title: 'Alarrt',
      description:
          'An emergency services app, i was part of the initial group of people that brought this project to life, when i worked as an intern',
      links: {
        'Website': 'https://alarrt.com',
        'App Store': 'https://apps.apple.com/ng/app/alarrt-app/id6450431527',
        'GooglePlay':
            'https://play.google.com/store/apps/details?id=com.alarrt.beta',
      },
    ),
    Project(
      title: 'Walletwise',
      description:
          'A fintech app enabling users to send, receive money, buy and sell gitcards and much more',
      links: {
        'Website': 'https://walletwise.ng/',
        'App Store':
            'https://apps.apple.com/ng/app/walletwise-seamless-payment/id6744754064',
        'GooglePlay':
            'https://play.google.com/store/apps/details?id=com.finance.walletwise.app',
      },
    ),
    Project(
      title: 'Invoicer',
      description:
          'A app enabling businesses to manage their inventory, and much more, i was part of the team that works on the first version of the app when i worked for the company Harvoxx tech hub, based in portharcourt.',
      links: {
        'Website': 'https://www.getinvoicer.app/',
        'App Store':
            'https://apps.apple.com/us/app/invoicer-pos-stock-manager/id6751941791',
        'GooglePlay':
            'https://play.google.com/store/apps/details?id=com.bwh.invoicer',
      },
    ),
  ];
}
