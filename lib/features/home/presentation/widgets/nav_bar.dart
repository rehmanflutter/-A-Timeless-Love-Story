import 'package:flutter/material.dart';
import '../../../../core/constants/amore_constants.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/widgets/amore_button.dart';

class AmoreNavBar extends StatefulWidget {
  final VoidCallback? onBeginStory;
  const AmoreNavBar({super.key, this.onBeginStory});

  @override
  State<AmoreNavBar> createState() => _AmoreNavBarState();
}

class _AmoreNavBarState extends State<AmoreNavBar> {
  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final hPad = Responsive.pagePadding(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 18),
      decoration: BoxDecoration(
        color: AmoreColors.cream.withOpacity(0.92),
        border: Border(
          bottom: BorderSide(
            color: AmoreColors.rose.withOpacity(0.10),
          ),
        ),
      ),
      child: Row(
        children: [
          // Logo
          ShaderMask(
            shaderCallback: (b) =>
                AmoreColors.primaryGradient.createShader(b),
            child: Text(
              'Amore',
              style: TextStyle(
                fontFamily: 'Playfair Display',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(),
          if (!isMobile) ...[
            _NavLink(label: 'Our Story'),
            _NavLink(label: 'Moments'),
            _NavLink(label: 'Letters'),
            _NavLink(label: 'Gallery'),
            const SizedBox(width: 12),
          ],
          AmoreButton(
            label: 'Begin Your Story',
            onPressed: widget.onBeginStory ?? () {},
          ),
        ],
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  const _NavLink({required this.label});

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: AnimatedDefaultTextStyle(
          duration: AmoreDurations.fast,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
            color: _hovering ? AmoreColors.rose : AmoreColors.textMid,
          ),
          child: Text(widget.label.toUpperCase()),
        ),
      ),
    );
  }
}
