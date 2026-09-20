import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTextStyles {
  static const _family = 'PlusJakartaSans';

  static const h4 = TextStyle(
    fontFamily: _family,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.5,
    color: AppColors.grey900,
  );

  static const h6 = TextStyle(
    fontFamily: _family,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.4,
    color: AppColors.grey900,
  );

  static const bodyLargeSemibold = TextStyle(
    fontFamily: _family,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.55,
    color: AppColors.grey900,
  );

  static const bodyMediumSemibold = TextStyle(
    fontFamily: _family,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.55,
    letterSpacing: -0.32,
    color: AppColors.grey900,
  );

  static const bodySmallRegular = TextStyle(
    fontFamily: _family,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.55,
    letterSpacing: -0.28,
    color: AppColors.grey400,
  );

  static const bodySmallMedium = TextStyle(
    fontFamily: _family,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.55,
    letterSpacing: -0.28,
    color: AppColors.grey400,
  );

  static const bodySmallSemibold = TextStyle(
    fontFamily: _family,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.55,
    letterSpacing: -0.28,
    color: AppColors.grey900,
  );

  static const bodyXSmallRegular = TextStyle(
    fontFamily: _family,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.55,
    letterSpacing: -0.24,
    color: AppColors.grey400,
  );

  static const bodyXSmallMedium = TextStyle(
    fontFamily: _family,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.55,
    letterSpacing: -0.24,
    color: AppColors.grey900,
  );

  static const bodyXSmallSemibold = TextStyle(
    fontFamily: _family,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 1.55,
    letterSpacing: -0.24,
    color: AppColors.grey900,
  );

  static const caption = TextStyle(
    fontFamily: _family,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    height: 1.55,
    letterSpacing: -0.22,
    color: AppColors.grey200,
  );
}
