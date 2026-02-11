import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

enum NavigationSection {
  cv,
  projects,
}

class SidebarNavigation extends StatelessWidget {
  final NavigationSection currentSection;
  final Function(NavigationSection) onSectionChanged;

  const SidebarNavigation({
    super.key,
    required this.currentSection,
    required this.onSectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      color: AppTheme.cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppTheme.spacingXL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Portfolio',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: AppTheme.spacingXS),
                Text(
                  'Mbaka Bilal Tudor',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const Divider(
            height: 1,
            color: AppTheme.borderColor,
          ),
          const SizedBox(height: AppTheme.spacingL),
          _NavigationItem(
            icon: Icons.person_outline,
            label: 'CV',
            isActive: currentSection == NavigationSection.cv,
            onTap: () => onSectionChanged(NavigationSection.cv),
          ),
          _NavigationItem(
            icon: Icons.work_outline,
            label: 'Projects',
            isActive: currentSection == NavigationSection.projects,
            onTap: () => onSectionChanged(NavigationSection.projects),
          ),
        ],
      ),
    );
  }
}

class _NavigationItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavigationItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  State<_NavigationItem> createState() => _NavigationItemState();
}

class _NavigationItemState extends State<_NavigationItem> {
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
          margin: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingM,
            vertical: AppTheme.spacingXS,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingM,
            vertical: AppTheme.spacingM,
          ),
          decoration: BoxDecoration(
            color: widget.isActive
                ? AppTheme.accentColor.withValues(alpha: 0.1)
                : (_isHovered ? AppTheme.hoverColor : Colors.transparent),
            borderRadius: BorderRadius.circular(AppTheme.radiusM),
            border: widget.isActive
                ? Border.all(
                    color: AppTheme.accentColor.withValues(alpha: 0.3),
                    width: 1,
                  )
                : null,
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: widget.isActive
                    ? AppTheme.accentColor
                    : AppTheme.textSecondary,
                size: 20,
              ),
              const SizedBox(width: AppTheme.spacingM),
              Text(
                widget.label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: widget.isActive
                          ? AppTheme.accentColor
                          : AppTheme.textPrimary,
                      fontWeight: widget.isActive
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
