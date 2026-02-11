import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/project.dart';
import '../theme/app_theme.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  IconData _getIconForPlatform(String platform) {
    final lowerPlatform = platform.toLowerCase();
    if (lowerPlatform.contains('website') || lowerPlatform.contains('web')) {
      return Icons.language;
    } else if (lowerPlatform.contains('app store') ||
        lowerPlatform.contains('ios')) {
      return Icons.apple;
    } else if (lowerPlatform.contains('play store') ||
        lowerPlatform.contains('android')) {
      return Icons.android;
    } else if (lowerPlatform.contains('github')) {
      return Icons.code;
    }
    return Icons.link;
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not launch $url'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(AppTheme.spacingXL),
        decoration: BoxDecoration(
          color: AppTheme.cardColor,
          borderRadius: BorderRadius.circular(AppTheme.radiusL),
          border: Border.all(color: AppTheme.borderColor),
          boxShadow: _isHovered ? AppTheme.hoverShadow : AppTheme.cardShadow,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppTheme.accentColor,
                        AppTheme.accentColor.withValues(alpha: 0.7),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(AppTheme.radiusM),
                  ),
                  child: const Icon(
                    Icons.work_outline,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingM),
                Expanded(
                  child: Text(
                    widget.project.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppTheme.spacingL),
            Text(
              widget.project.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: AppTheme.spacingXL),
            Wrap(
              spacing: AppTheme.spacingM,
              runSpacing: AppTheme.spacingM,
              children: widget.project.links.entries.map((entry) {
                return _PlatformButton(
                  platform: entry.key,
                  url: entry.value,
                  icon: _getIconForPlatform(entry.key),
                  onTap: () => _launchUrl(entry.value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlatformButton extends StatefulWidget {
  final String platform;
  final String url;
  final IconData icon;
  final VoidCallback onTap;

  const _PlatformButton({
    required this.platform,
    required this.url,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_PlatformButton> createState() => _PlatformButtonState();
}

class _PlatformButtonState extends State<_PlatformButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingL,
            vertical: AppTheme.spacingM,
          ),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppTheme.accentColor
                : AppTheme.accentColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(AppTheme.radiusM),
            border: Border.all(
              color: AppTheme.accentColor,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                size: 20,
                color: _isHovered ? Colors.white : AppTheme.accentColor,
              ),
              const SizedBox(width: AppTheme.spacingS),
              Text(
                widget.platform,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: _isHovered ? Colors.white : AppTheme.accentColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
