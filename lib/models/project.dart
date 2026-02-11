class Project {
  final String title;
  final String description;
  final Map<String, String> links; // platform name -> URL

  Project({
    required this.title,
    required this.description,
    required this.links,
  });
}
