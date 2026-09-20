import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/app_assets.dart';
import '../data/mock_repository.dart';
import '../models/workout_program.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';
import '../widgets/category_chip.dart';
import '../widgets/challenge_card.dart';
import '../widgets/featured_plan_card.dart';
import '../widgets/program_card.dart';
import '../widgets/section_header.dart';
import 'gym_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategory = 0;

  List<WorkoutProgram> get _visiblePrograms {
    if (_selectedCategory == 0) return MockRepository.programs;
    final category = MockRepository.programCategories[_selectedCategory];
    return MockRepository.programs
        .where((p) => p.category == category)
        .toList();
  }

  void _openGym() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (_) => const GymDetailScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(top: 16, bottom: 32),
          children: [
            // Antet: data + salut + clopotel
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.screenPadding,
              ),
              child: _Greeting(),
            ),
            const SizedBox(height: 29),

            // Card negru: challenge-ul zilei cu inel de progres
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.screenPadding,
              ),
              child: ChallengeCard(
                label: 'Today’s Challenge',
                title: 'Running',
                completed: 15,
                total: 20,
              ),
            ),
            const SizedBox(height: 24),

            // Sectiune: Featured Plan
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenPadding,
              ),
              child: SectionHeader(title: 'Featured Plan', onSeeAll: () {}),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 144,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenPadding,
                ),
                itemCount: MockRepository.featuredPlans.length,
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemBuilder: (context, index) => FeaturedPlanCard(
                  plan: MockRepository.featuredPlans[index],
                  onStart: _openGym,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Sectiune: Workout Programs
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenPadding,
              ),
              child: SectionHeader(title: 'Workout Programs', onSeeAll: () {}),
            ),
            const SizedBox(height: 16),

            // Filtre pe categorii
            SizedBox(
              height: 30,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenPadding,
                ),
                itemCount: MockRepository.programCategories.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(width: AppSpacing.chipGap),
                itemBuilder: (context, index) => CategoryChip(
                  label: MockRepository.programCategories[index],
                  selected: _selectedCategory == index,
                  onTap: () => setState(() => _selectedCategory = index),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Grila de programe
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.screenPadding,
              ),
              child: _ProgramGrid(programs: _visiblePrograms, onTap: _openGym),
            ),
          ],
        ),
      ),
    );
  }
}

class _Greeting extends StatelessWidget {
  const _Greeting();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Friday, 20 May', style: AppTextStyles.bodySmallRegular),
              const SizedBox(height: 4),
              Text('Good Morning', style: AppTextStyles.h6),
            ],
          ),
        ),
        const _NotificationButton(),
      ],
    );
  }
}

class _NotificationButton extends StatelessWidget {
  const _NotificationButton();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppIcons.bell, width: 48, height: 48);
  }
}

class _ProgramGrid extends StatelessWidget {
  const _ProgramGrid({required this.programs, required this.onTap});

  final List<WorkoutProgram> programs;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (programs.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Center(
          child: Text(
            'No programs in this category',
            style: AppTextStyles.bodySmallRegular,
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: programs.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 184,
      ),
      itemBuilder: (context, index) =>
          ProgramCard(program: programs[index], onTap: onTap),
    );
  }
}
