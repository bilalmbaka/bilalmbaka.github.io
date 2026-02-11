enum ProficiencyLevel {
  beginner,
  intermediate,
  advanced,
  expert,
}

class Skill {
  final String name;
  final ProficiencyLevel level;

  Skill({
    required this.name,
    required this.level,
  });

  String get levelName {
    switch (level) {
      case ProficiencyLevel.beginner:
        return 'Beginner';
      case ProficiencyLevel.intermediate:
        return 'Intermediate';
      case ProficiencyLevel.advanced:
        return 'Advanced';
      case ProficiencyLevel.expert:
        return 'Expert';
    }
  }

  double get levelPercentage {
    switch (level) {
      case ProficiencyLevel.beginner:
        return 0.25;
      case ProficiencyLevel.intermediate:
        return 0.5;
      case ProficiencyLevel.advanced:
        return 0.75;
      case ProficiencyLevel.expert:
        return 1.0;
    }
  }
}
