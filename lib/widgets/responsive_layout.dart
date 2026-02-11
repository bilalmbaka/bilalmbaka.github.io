import 'package:flutter/material.dart';
import 'sidebar_navigation.dart';
import '../theme/app_theme.dart';

class ResponsiveLayout extends StatelessWidget {
  final NavigationSection currentSection;
  final Function(NavigationSection) onSectionChanged;
  final Widget child;
  final Widget? floatingActionButton;

  const ResponsiveLayout({
    super.key,
    required this.currentSection,
    required this.onSectionChanged,
    required this.child,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          // Desktop layout with persistent sidebar
          return Scaffold(
            backgroundColor: AppTheme.backgroundColor,
            body: Row(
              children: [
                SidebarNavigation(
                  currentSection: currentSection,
                  onSectionChanged: onSectionChanged,
                ),
                Expanded(child: child),
              ],
            ),
            floatingActionButton: floatingActionButton,
          );
        } else {
          // Mobile/Tablet layout with drawer
          return Scaffold(
            backgroundColor: AppTheme.backgroundColor,
            appBar: AppBar(
              backgroundColor: AppTheme.cardColor,
              elevation: 0,
              title: Text(
                'Portfolio',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              iconTheme: const IconThemeData(color: AppTheme.textPrimary),
            ),
            drawer: Drawer(
              backgroundColor: AppTheme.cardColor,
              child: SidebarNavigation(
                currentSection: currentSection,
                onSectionChanged: (section) {
                  onSectionChanged(section);
                  Navigator.of(context).pop(); // Close drawer after selection
                },
              ),
            ),
            body: child,
            floatingActionButton: floatingActionButton,
          );
        }
      },
    );
  }
}
