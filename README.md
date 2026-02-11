# Portfolio Website - Mbaka Bilal Tudor

A modern, responsive portfolio website built with Flutter showcasing professional experience, skills, and projects.

## Features

- 🌙 **Dark Mode** - Beautiful dark theme for comfortable viewing
- 🎨 **Modern Minimal Design** - Clean, professional UI with subtle animations
- 📱 **Fully Responsive** - Seamless experience on desktop, tablet, and mobile devices
- 🔄 **Sidebar Navigation** - Easy navigation between CV and Projects sections
  - Desktop: Persistent sidebar
  - Mobile: Drawer navigation with hamburger menu
- ✨ **Smooth Animations** - Professional hover effects and transitions
- 🔗 **Interactive Links** - Direct links to project distributions (App Store, websites)
- 📧 **Interactive Email** - Click to open email client or copy to clipboard
- 💻 **GitHub Integration** - Clickable GitHub profile link
- 📄 **CV Download** - Generate and download CV as PDF with one click (CV section only)

## Project Structure

```
lib/
├── main.dart                    # App entry point and navigation logic
├── data/
│   └── portfolio_data.dart      # Portfolio content (personal info, work history, skills, projects)
├── models/
│   ├── work_experience.dart     # Work experience data model
│   ├── skill.dart               # Skill with proficiency level model
│   └── project.dart             # Project data model
├── screens/
│   ├── cv_section.dart          # CV page (profile, work history, skills)
│   └── projects_section.dart    # Projects showcase page
├── widgets/
│   ├── responsive_layout.dart   # Responsive layout handler
│   ├── sidebar_navigation.dart  # Sidebar/drawer navigation
│   ├── profile_header.dart      # Profile header with name and email
│   ├── work_experience_card.dart # Individual work experience card
│   ├── skills_display.dart      # Skills display with progress indicators
│   └── project_card.dart        # Project card with links
└── theme/
    └── app_theme.dart           # App-wide theme configuration
```

## Getting Started

### Prerequisites

- Flutter SDK 3.9.2 or higher
- Dart SDK
- A web browser (for web development)
- iOS/Android development tools (optional, for mobile platforms)

### Installation

1. Clone the repository:
```bash
cd /Users/bilal/Documents/main/projects/portfolio
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:

**For Web:**
```bash
flutter run -d chrome
```

**For Mobile (iOS):**
```bash
flutter run -d ios
```

**For Mobile (Android):**
```bash
flutter run -d android
```

### Building for Production

**Web:**
```bash
flutter build web
```
The output will be in `build/web/` directory.

**iOS:**
```bash
flutter build ios
```

**Android:**
```bash
flutter build apk
```

## Customization

### Updating Personal Information

Edit `lib/data/portfolio_data.dart`:

```dart
class PortfolioData {
  static const String name = 'Your Name';
  static const String email = 'your.email@example.com';
  static const String github = 'github.com/your-username';
  
  // Add or modify work experiences
  static final List<WorkExperience> workExperiences = [
    // Your work history
  ];
  
  // Add or modify skills
  static final List<Skill> skills = [
    // Your skills
  ];
  
  // Add or modify projects
  static final List<Project> projects = [
    // Your projects
  ];
}
```

**Note:** When you update the portfolio data, the CV PDF will automatically reflect the changes when downloaded.

### Changing Colors and Theme

Edit `lib/theme/app_theme.dart`:

```dart
class AppTheme {
  static const Color primaryColor = Color(0xFF2C3E50);
  static const Color accentColor = Color(0xFF3498DB);
  // Modify other colors as needed
}
```

### Adding New Sections

1. Create a new screen file in `lib/screens/`
2. Add a new navigation item in `lib/widgets/sidebar_navigation.dart`
3. Update the navigation logic in `lib/main.dart`

## Testing

Run tests:
```bash
flutter test
```

Run code analysis:
```bash
flutter analyze
```

## Technologies Used

- **Flutter** - UI framework
- **Google Fonts** - Typography (Poppins for headings, Inter for body text)
- **URL Launcher** - Opening external links and email client
- **PDF** - Dynamic PDF generation for CV
- **Printing** - PDF download functionality

## Current Portfolio Content

### Personal Information
- **Name:** Mbaka Bilal Tudor
- **Email:** mbakabilal.t@gmail.com (clickable - opens email client or copies to clipboard)
- **GitHub:** github.com/mbaka-bilal (clickable - opens in browser)

### Work Experience
1. **Harvoxx Tech Hub** - Flutter Developer (January 2024 - March 2025)
2. **Walletwise** - Flutter Developer (September 2025 - Present)

### Skills
- **Flutter** - Advanced
- **Node.js with PostgreSQL** - Intermediate

### Projects
- **Yirapay** - An escrow platform for crypto transactions
  - Website: https://app.useyirapay.com
  - App Store: https://apps.apple.com/gh/app/yirapay/id6755782075

## Design Philosophy

The portfolio follows a **modern minimal dark mode** design approach with:
- Clean, generous spacing with dark backgrounds
- Subtle shadows and elevation optimized for dark theme
- Professional dark color palette (dark backgrounds with blue accents)
- Smooth hover effects and transitions
- Focus on content and readability with high contrast text

## Browser Support

The web version is tested and works on:
- Chrome (latest)
- Safari (latest)
- Firefox (latest)
- Edge (latest)

## License

This is a personal portfolio project.

## Contact

**Mbaka Bilal Tudor**
- Email: mbakabilal.t@gmail.com

---

Built with ❤️ using Flutter
