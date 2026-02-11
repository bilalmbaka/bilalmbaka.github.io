import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'theme/app_theme.dart';
import 'widgets/responsive_layout.dart';
import 'widgets/sidebar_navigation.dart';
import 'screens/cv_section.dart';
import 'screens/projects_section.dart';
import 'utils/cv_pdf_generator.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mbaka Bilal Tudor - Portfolio',
      theme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  NavigationSection _currentSection = NavigationSection.cv;

  void _onSectionChanged(NavigationSection section) {
    setState(() {
      _currentSection = section;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      currentSection: _currentSection,
      onSectionChanged: _onSectionChanged,
      floatingActionButton: _buildFAB(),
      child: _buildCurrentSection(),
    );
  }

  Widget? _buildFAB() {
    // Only show FAB on CV section
    if (_currentSection == NavigationSection.cv) {
      return FloatingActionButton.extended(
        onPressed: _downloadCV,
        icon: const Icon(Icons.download),
        label: const Text('Download CV'),
        backgroundColor: AppTheme.accentColor,
      );
    }
    return null;
  }

  Widget _buildCurrentSection() {
    switch (_currentSection) {
      case NavigationSection.cv:
        return const CVSection();
      case NavigationSection.projects:
        return const ProjectsSection();
    }
  }

  Future<void> _downloadCV() async {
    try {
      final pdf = await CVPdfGenerator.generateCV();
      await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => pdf.save(),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error generating CV: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
