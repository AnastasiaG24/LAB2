class FeaturedPlan {
  const FeaturedPlan({
    required this.title,
    required this.imagePath,
    required this.weeks,
    required this.sessionsPerWeek,
  });

  final String title;
  final String imagePath;
  final int weeks;
  final int sessionsPerWeek;
}
