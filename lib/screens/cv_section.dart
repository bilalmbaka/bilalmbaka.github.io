import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../widgets/profile_header.dart';
import '../widgets/work_experience_card.dart';
import '../widgets/skills_display.dart';
import '../theme/app_theme.dart';

class CVSection extends StatelessWidget {
  final VoidCallback? onDownloadCV;

  const CVSection({super.key, this.onDownloadCV});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.spacingXL),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(
              name: PortfolioData.name,
              email: PortfolioData.email,
              github: PortfolioData.github,
            ),
            const SizedBox(height: AppTheme.spacingXXL),
            Text(
              'Work Experience',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: AppTheme.spacingL),
            ...PortfolioData.workExperiences.map(
              (experience) => Padding(
                padding: const EdgeInsets.only(bottom: AppTheme.spacingL),
                child: WorkExperienceCard(experience: experience),
              ),
            ),
            const SizedBox(height: AppTheme.spacingXL),
            SkillsDisplay(skills: PortfolioData.skills),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
