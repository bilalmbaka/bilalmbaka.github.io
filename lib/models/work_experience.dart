class WorkExperience {
  final String company;
  final String position;
  final DateTime startDate;
  final DateTime? endDate; // null means currently working

  WorkExperience({
    required this.company,
    required this.position,
    required this.startDate,
    this.endDate,
  });

  String get dateRange {
    final start = _formatDate(startDate);
    final end = endDate != null ? _formatDate(endDate!) : 'Present';
    return '$start - $end';
  }

  String _formatDate(DateTime date) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return '${months[date.month - 1]} ${date.year}';
  }
}
