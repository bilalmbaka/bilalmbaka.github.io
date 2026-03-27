import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../widgets/project_card.dart';
import '../theme/app_theme.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.spacingXL),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Projects', style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: AppTheme.spacingM),
            Text(
              'You will find here projects i worked on both as short term Gigs, projects i am working on where i am currently employed and my persoal projects which are projects i am maintaing.',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppTheme.textSecondary),
            ),
            const SizedBox(height: AppTheme.spacingXXL),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 800) {
                  // Multi-column layout for larger screens
                  return Wrap(
                    spacing: AppTheme.spacingL,
                    runSpacing: AppTheme.spacingL,
                    children: PortfolioData.projects.map((project) {
                      return SizedBox(
                        width: (constraints.maxWidth - AppTheme.spacingL) / 2,
                        child: ProjectCard(project: project),
                      );
                    }).toList(),
                  );
                } else {
                  // Single column layout for smaller screens
                  return Column(
                    children: PortfolioData.projects.map((project) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppTheme.spacingL,
                        ),
                        child: ProjectCard(project: project),
                      );
                    }).toList(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
