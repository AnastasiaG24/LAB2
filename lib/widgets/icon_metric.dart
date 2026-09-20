import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconMetric extends StatelessWidget {
  const IconMetric({
    super.key,
    required this.iconPath,
    required this.label,
    required this.style,
    this.iconSize = 12,
    this.gap = 3,
    this.iconColor,
  });

  final String iconPath;
  final String label;
  final TextStyle style;
  final double iconSize;
  final double gap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          iconPath,
          width: iconSize,
          height: iconSize,
          colorFilter: iconColor == null
              ? null
              : ColorFilter.mode(iconColor!, BlendMode.srcIn),
        ),
        SizedBox(width: gap),
        Flexible(
          child: Text(
            label,
            style: style,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
          ),
        ),
      ],
    );
  }
}
