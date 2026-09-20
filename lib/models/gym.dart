import 'amenity.dart';

class Gym {
  const Gym({
    required this.name,
    required this.location,
    required this.imagePath,
    required this.rating,
    required this.reviewCount,
    required this.description,
    required this.pricePerWeek,
    required this.amenities,
  });

  final String name;
  final String location;
  final String imagePath;
  final double rating;
  final int reviewCount;
  final String description;
  final double pricePerWeek;
  final List<Amenity> amenities;
}
