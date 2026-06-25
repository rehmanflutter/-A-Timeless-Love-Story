import 'package:flutter/material.dart';
import '../constants/amore_constants.dart';

class AmoreSectionHeading extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String? italicSuffix; // renders italic in rose at end of title
  final String? subtitle;
  final TextAlign align;
  final bool darkMode;

  const AmoreSectionHeading({
    super.key,
    required this.eyebrow,
    required this.title,
    this.italicSuffix,
    this.subtitle,
    this.align = TextAlign.center,
    this.darkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final crossAxis = align == TextAlign.center
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;
    final titleSize = _titleSize(context);

    return Column(
      crossAxisAlignment: crossAxis,
      children: [
        // Eyebrow
        Text(
          eyebrow.toUpperCase(),
          textAlign: align,
          style: TextStyle(
            fontSize: 11.5,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.2,
            color: darkMode
                ? AmoreColors.goldLight.withOpacity(0.8)
                : AmoreColors.rose,
          ),
        ),
        const SizedBox(height: 10),
        // Headline — plain + optional italic rose suffix
        RichText(
          textAlign: align,
          text: TextSpan(
            style: TextStyle(
              fontFamily: 'Playfair Display',
              fontSize: titleSize,
              fontWeight: FontWeight.w700,
              color: darkMode ? Colors.white : AmoreColors.textDark,
              height: 1.2,
            ),
            children: [
              TextSpan(text: title),
              if (italicSuffix != null)
                TextSpan(
                  text: ' $italicSuffix',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: darkMode ? AmoreColors.goldLight : AmoreColors.rose,
                  ),
                ),
            ],
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 14),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(
              subtitle!,
              textAlign: align,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: darkMode
                    ? Colors.white.withOpacity(0.6)
                    : AmoreColors.textMid,
                height: 1.8,
              ),
            ),
          ),
        ],
      ],
    );
  }

  double _titleSize(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    if (w < 600) return 28;
    if (w < 1024) return 34;
    return 40;
  }
}
