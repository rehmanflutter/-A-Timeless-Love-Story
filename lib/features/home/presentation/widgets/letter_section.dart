import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/amore_constants.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/widgets/section_heading.dart';

class LoveLetterSection extends StatelessWidget {
  const LoveLetterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final hPad = Responsive.pagePadding(context);

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
          horizontal: hPad, vertical: AmoreSpacing.xxl),
      child: Column(
        children: [
          const AmoreSectionHeading(
            eyebrow: 'A letter',
            title: 'Words from',
            italicSuffix: 'the heart',
          ),
          const SizedBox(height: AmoreSpacing.xl),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: _LetterCard()
                  .animate()
                  .fadeIn(duration: 800.ms)
                  .slideY(begin: 0.05, end: 0),
            ),
          ),
        ],
      ),
    );
  }
}

class _LetterCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
          Responsive.value(context, mobile: 28.0, desktop: 56.0)),
      decoration: BoxDecoration(
        color: AmoreColors.rosePale,
        borderRadius: BorderRadius.circular(AmoreRadii.xl),
        border: Border.all(color: AmoreColors.rose.withOpacity(0.14)),
        boxShadow: [
          BoxShadow(
            color: AmoreColors.rose.withOpacity(0.08),
            blurRadius: 40,
            offset: const Offset(0, 16),
            spreadRadius: -8,
          ),
        ],
      ),
      child: Stack(
        children: [
          // Decorative large quote mark
          Positioned(
            top: -12,
            left: 8,
            child: Text(
              '\u201C',
              style: TextStyle(
                fontFamily: 'Playfair Display',
                fontSize: 120,
                color: AmoreColors.rose.withOpacity(0.07),
                height: 1,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'I have tried, in a thousand ordinary moments, to tell you what you mean to me. '
                'In the way I make your coffee exactly as you like it. In the way I save the window seat. '
                'In the way I still reach for your hand in the dark — not from habit, but because '
                'your hand is where home is.\n\n'
                'You are not the great event of my life. You are every small one. '
                'You are the comma between every sentence that might otherwise end too soon.',
                style: TextStyle(
                  fontFamily: 'Playfair Display',
                  fontStyle: FontStyle.italic,
                  fontSize: Responsive.value(context, mobile: 16.0, desktop: 19.0),
                  color: AmoreColors.textDark,
                  height: 2.0,
                ),
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  Container(
                    width: 36,
                    height: 1,
                    color: AmoreColors.rose.withOpacity(0.4),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Written with love, always',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                      color: AmoreColors.rose,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
