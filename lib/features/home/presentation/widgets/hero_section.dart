import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/amore_constants.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/widgets/falling_petals.dart';
import '../../../../core/widgets/amore_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final hPad = Responsive.pagePadding(context);
    final titleSize =
        Responsive.value(context, mobile: 38.0, tablet: 52.0, desktop: 66.0);

    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.94,
        child: Stack(
          children: [
            // Ambient gradient background
            Positioned.fill(child: _HeroBg()),

            // Falling petals layer
            const Positioned.fill(child: FallingPetalsBackground()),

            // Main content
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: hPad),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Eyebrow badge
                    _EyebrowBadge()
                        .animate()
                        .fadeIn(duration: 800.ms, delay: 200.ms)
                        .slideY(begin: 0.3, end: 0),

                    const SizedBox(height: 28),

                    // Main headline
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 900),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'Playfair Display',
                            fontSize: titleSize,
                            fontWeight: FontWeight.w700,
                            color: AmoreColors.textDark,
                            height: 1.12,
                          ),
                          children: const [
                            TextSpan(text: 'Every love story is\n'),
                            TextSpan(
                              text: 'beautiful,',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: AmoreColors.rose,
                              ),
                            ),
                            TextSpan(text: ' but ours\nis my '),
                            TextSpan(
                              text: 'favourite.',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: AmoreColors.rose,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 900.ms, delay: 400.ms)
                        .slideY(begin: 0.2, end: 0),

                    const SizedBox(height: 24),

                    // Subtitle
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 580),
                      child: Text(
                        'Crafted with golden threads of memory, woven through '
                        'the seasons of two hearts that found each other in '
                        'the quiet poetry of an ordinary day.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isMobile ? 16 : 18,
                          fontWeight: FontWeight.w300,
                          color: AmoreColors.textMid,
                          height: 1.85,
                        ),
                      ),
                    ).animate().fadeIn(duration: 800.ms, delay: 600.ms),

                    const SizedBox(height: 40),

                    // CTA buttons
                    Wrap(
                      spacing: 16,
                      runSpacing: 14,
                      alignment: WrapAlignment.center,
                      children: [
                        AmoreButton(
                          label: 'Read Our Story',
                          onPressed: () {},
                          icon: Icons.menu_book_rounded,
                        ),
                        AmoreButton(
                          label: 'Relive the Moments',
                          onPressed: () {},
                          outline: true,
                        ),
                      ],
                    )
                        .animate()
                        .fadeIn(duration: 700.ms, delay: 800.ms)
                        .slideY(begin: 0.2, end: 0),

                    const SizedBox(height: 52),

                    // Scroll indicator
                    _ScrollIndicator()
                        .animate()
                        .fadeIn(duration: 600.ms, delay: 1200.ms),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroBg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(0, -0.6),
          radius: 1.4,
          colors: [
            AmoreColors.rose.withOpacity(0.10),
            AmoreColors.cream,
          ],
        ),
      ),
    );
  }
}

class _EyebrowBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
      decoration: BoxDecoration(
        color: AmoreColors.rose.withOpacity(0.07),
        borderRadius: BorderRadius.circular(AmoreRadii.pill),
        border: Border.all(color: AmoreColors.rose.withOpacity(0.20)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('♡ ',
              style: TextStyle(color: AmoreColors.rose, fontSize: 13)),
          Text(
            'A timeless love story',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.0,
              color: AmoreColors.rose,
            ),
          ),
        ],
      ),
    );
  }
}

class _ScrollIndicator extends StatefulWidget {
  @override
  State<_ScrollIndicator> createState() => _ScrollIndicatorState();
}

class _ScrollIndicatorState extends State<_ScrollIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1800))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedBuilder(
          animation: _ctrl,
          builder: (_, __) => Opacity(
            opacity: 0.4 + _ctrl.value * 0.6,
            child: Transform.scale(
              scaleY: 1.0 + _ctrl.value * 0.15,
              child: Container(
                width: 1,
                height: 50,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AmoreColors.roseLight, Colors.transparent],
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'SCROLL TO BEGIN',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.0,
            color: AmoreColors.textSoft,
          ),
        ),
      ],
    );
  }
}
