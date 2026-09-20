class WorkoutProgram {
  const WorkoutProgram({
    required this.title,
    required this.imagePath,
    required this.calories,
    required this.durationMinutes,
    required this.category,
    this.isPro = false,
  });

  final String title;
  final String imagePath;
  final int calories;
  final int durationMinutes;
  final String category;
  final bool isPro;
}
