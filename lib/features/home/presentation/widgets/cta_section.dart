import 'package:flutter/material.dart';
import '../../../../core/constants/amore_constants.dart';
import '../../../../core/constants/responsive.dart';

class CtaSection extends StatefulWidget {
  const CtaSection({super.key});

  @override
  State<CtaSection> createState() => _CtaSectionState();
}

class _CtaSectionState extends State<CtaSection> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hPad = Responsive.pagePadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AmoreColors.rose,
            AmoreColors.roseDark,
            AmoreColors.roseDeep,
          ],
        ),
      ),
      padding: EdgeInsets.symmetric(
          horizontal: hPad, vertical: AmoreSpacing.xxxl),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
            children: [
              Text(
                'Begin writing\nyour love story',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Playfair Display',
                  fontSize: Responsive.value(context,
                      mobile: 32.0, tablet: 44.0, desktop: 52.0),
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 18),
              Text(
                'Your story deserves to be told beautifully. Start today — for free, forever.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: Colors.white.withOpacity(0.78),
                  height: 1.7,
                ),
              ),
              const SizedBox(height: 40),
              if (isMobile)
                Column(
                  children: [
                    _EmailField(controller: _controller),
                    const SizedBox(height: 12),
                    _StartButton(onTap: () {}),
                  ],
                )
              else
                Row(
                  children: [
                    Expanded(child: _EmailField(controller: _controller)),
                    const SizedBox(width: 12),
                    _StartButton(onTap: () {}),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  final TextEditingController controller;
  const _EmailField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Your email address…',
        hintStyle: TextStyle(color: Colors.white.withOpacity(0.55)),
        filled: true,
        fillColor: Colors.white.withOpacity(0.14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AmoreRadii.pill),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.25)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AmoreRadii.pill),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.25)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AmoreRadii.pill),
          borderSide:
              BorderSide(color: Colors.white.withOpacity(0.6), width: 1.5),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      ),
    );
  }
}

class _StartButton extends StatefulWidget {
  final VoidCallback onTap;
  const _StartButton({required this.onTap});

  @override
  State<_StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<_StartButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: AmoreDurations.fast,
          padding:
              const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AmoreRadii.pill),
            boxShadow: _hovering
                ? [
                    const BoxShadow(
                        color: Colors.black26,
                        blurRadius: 24,
                        offset: Offset(0, 8))
                  ]
                : [],
          ),
          child: const Text(
            'Start Free →',
            style: TextStyle(
              color: AmoreColors.rose,
              fontWeight: FontWeight.w800,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
