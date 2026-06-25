import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/amore_constants.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/widgets/amore_card.dart';
import '../../../../core/widgets/section_heading.dart';

class _Testimonial {
  final String quote;
  final String name;
  final String role;
  final String initials;
  final List<Color> avatarGradient;
  const _Testimonial(
      this.quote, this.name, this.role, this.initials, this.avatarGradient);
}

const _testimonials = [
  _Testimonial(
    '"Reading this felt like someone had opened the journal of my own heart and read it aloud. Every word is true."',
    'Sofia & Marco',
    'Together 7 years · Milan',
    'SM',
    [AmoreColors.roseLight, AmoreColors.rose],
  ),
  _Testimonial(
    '"I sent the love letter section to my husband. He cried. I cried. The dog looked confused. Ten out of ten."',
    'Priya & James',
    'Married 4 years · London',
    'PJ',
    [Color(0xFFC0A0D8), Color(0xFF8060B8)],
  ),
  _Testimonial(
    '"We used this as our wedding website inspiration. Our guests said it was the most beautiful thing they\'d seen."',
    'Amara & Kwesi',
    'Newlyweds · Accra',
    'AK',
    [AmoreColors.goldLight, AmoreColors.gold],
  ),
];

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final hPad = Responsive.pagePadding(context);
    final cols =
        Responsive.value(context, mobile: 1, tablet: 1, desktop: 3);

    return Container(
      color: AmoreColors.rosePale,
      padding: EdgeInsets.symmetric(
          horizontal: hPad, vertical: AmoreSpacing.xxl),
      child: Column(
        children: [
          const AmoreSectionHeading(
            eyebrow: 'Voices of love',
            title: 'Stories from',
            italicSuffix: 'our readers',
          ),
          const SizedBox(height: AmoreSpacing.xl),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: cols == 1
                  ? Column(
                      children: _testimonials
                          .asMap()
                          .entries
                          .map((e) => Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 20),
                                child: _TestiCard(t: e.value)
                                    .animate(delay: (e.key * 100).ms)
                                    .fadeIn(duration: 600.ms),
                              ))
                          .toList(),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _testimonials
                          .asMap()
                          .entries
                          .map((e) => Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: e.key > 0 ? 16 : 0,
                                  ),
                                  child: _TestiCard(t: e.value)
                                      .animate(
                                          delay: (e.key * 100).ms)
                                      .fadeIn(duration: 600.ms),
                                ),
                              ))
                          .toList(),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TestiCard extends StatelessWidget {
  final _Testimonial t;
  const _TestiCard({required this.t});

  @override
  Widget build(BuildContext context) {
    return AmoreCard(
      padding: const EdgeInsets.all(28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Stars
          ShaderMask(
            shaderCallback: (b) =>
                AmoreColors.goldGradient.createShader(b),
            child: const Text(
              '★★★★★',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          const SizedBox(height: 16),
          // Quote
          Text(
            t.quote,
            style: const TextStyle(
              fontFamily: 'Playfair Display',
              fontStyle: FontStyle.italic,
              fontSize: 15.5,
              color: AmoreColors.textDark,
              height: 1.8,
            ),
          ),
          const SizedBox(height: 20),
          // Author
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: t.avatarGradient),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  t.initials,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AmoreColors.textDark,
                    ),
                  ),
                  Text(
                    t.role,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AmoreColors.textSoft,
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
