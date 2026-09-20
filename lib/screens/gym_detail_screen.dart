import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/app_assets.dart';
import '../data/mock_repository.dart';
import '../models/gym.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';
import '../widgets/amenity_tile.dart';
import '../widgets/primary_button.dart';

class GymDetailScreen extends StatelessWidget {
  const GymDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gym = MockRepository.gym;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Stack(
          children: [
            ListView(
              padding: EdgeInsets.zero,
              children: [
                // Imaginea mare din varf + butoanele peste ea
                _Hero(gym: gym),
                const SizedBox(height: 24),

                // Rating, denumire, locatie
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenPadding,
                  ),
                  child: _Summary(gym: gym),
                ),
                const SizedBox(height: 18),

                // Descriere cu Read more
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenPadding,
                  ),
                  child: _Description(text: gym.description),
                ),
                const SizedBox(height: 16),

                // Lista de facilitati
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.screenPadding,
                  ),
                  child: _Amenities(gym: gym),
                ),
                const SizedBox(height: 140),
              ],
            ),

            // Bara fixa de jos: pret + Reserve
            Align(
              alignment: Alignment.bottomCenter,
              child: _BottomBar(gym: gym),
            ),
          ],
        ),
      ),
    );
  }
}

class _Hero extends StatelessWidget {
  const _Hero({required this.gym});

  final Gym gym;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(gym.imagePath, fit: BoxFit.cover),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenPadding,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).maybePop(),
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.white.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            AppIcons.arrowLeft,
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      AppIcons.dotsVertical,
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Summary extends StatelessWidget {
  const _Summary({required this.gym});

  final Gym gym;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 14),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.grey100)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(AppIcons.star, width: 16, height: 16),
              const SizedBox(width: 8),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '${gym.rating} ',
                      style: AppTextStyles.bodySmallSemibold,
                    ),
                    TextSpan(
                      text: '(${_formatCount(gym.reviewCount)} reviews)',
                      style: AppTextStyles.bodySmallRegular,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(gym.name, style: AppTextStyles.h4),
          const SizedBox(height: 8),
          Text(gym.location, style: AppTextStyles.bodySmallRegular),
        ],
      ),
    );
  }

  String _formatCount(int value) {
    final digits = value.toString();
    final buffer = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      if (i > 0 && (digits.length - i) % 3 == 0) buffer.write(',');
      buffer.write(digits[i]);
    }
    return buffer.toString();
  }
}

class _Description extends StatelessWidget {
  const _Description({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: text, style: AppTextStyles.bodySmallRegular),
          TextSpan(
            text: 'Read more',
            style: AppTextStyles.bodySmallMedium.copyWith(
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _Amenities extends StatelessWidget {
  const _Amenities({required this.gym});

  final Gym gym;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Amenities', style: AppTextStyles.bodyLargeSemibold),
        const SizedBox(height: 16),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: gym.amenities.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 52,
          ),
          itemBuilder: (context, index) =>
              AmenityTile(amenity: gym.amenities[index]),
        ),
      ],
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({required this.gym});

  final Gym gym;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(0, -10),
            blurRadius: 50,
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 16, 25, 16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Total', style: AppTextStyles.bodySmallMedium),
                    const SizedBox(height: 4),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '\$${gym.pricePerWeek.toStringAsFixed(2)} ',
                            style: AppTextStyles.h6,
                          ),
                          TextSpan(
                            text: '/week',
                            style: AppTextStyles.bodySmallMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: PrimaryButton(label: 'Reserve', onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
