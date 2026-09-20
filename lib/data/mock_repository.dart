import '../models/amenity.dart';
import '../models/featured_plan.dart';
import '../models/gym.dart';
import '../models/workout_program.dart';
import 'app_assets.dart';

abstract final class MockRepository {
  static const programCategories = <String>[
    'All Type',
    'Pilates',
    'Cardio',
    'Boxing',
    'Yoga',
  ];

  static const featuredPlans = <FeaturedPlan>[
    FeaturedPlan(
      title: 'Massive Upper Body',
      imagePath: AppImages.featured,
      weeks: 5,
      sessionsPerWeek: 4,
    ),
    FeaturedPlan(
      title: 'Massive Upper Body',
      imagePath: AppImages.featured,
      weeks: 5,
      sessionsPerWeek: 4,
    ),
  ];

  static const programs = <WorkoutProgram>[
    WorkoutProgram(
      title: 'Yoga',
      imagePath: AppImages.programYoga,
      calories: 210,
      durationMinutes: 120,
      category: 'Yoga',
    ),
    WorkoutProgram(
      title: 'Arm\nStrengthening',
      imagePath: AppImages.programArm,
      calories: 210,
      durationMinutes: 120,
      category: 'Cardio',
      isPro: true,
    ),
  ];

  static const gym = Gym(
    name: 'Mid City Gym Training',
    location: 'California, New York',
    imagePath: AppImages.gymHero,
    rating: 4.5,
    reviewCount: 1232,
    description:
        'Lorem ipsum dolor sit amet consectetur. Blandit vitae aliquet eros '
        'laoreet quam sollicitudin. Duis non eu habitant id vel nisi eget '
        'amet tellus... ',
    pricePerWeek: 69,
    amenities: <Amenity>[
      Amenity(label: 'Showers', iconPath: AppIcons.showers),
      Amenity(label: 'Lockers', iconPath: AppIcons.lockers),
      Amenity(label: 'Free Wi-fi', iconPath: AppIcons.wifi),
      Amenity(label: 'Free Wi-fi', iconPath: AppIcons.wifi),
    ],
  );
}
