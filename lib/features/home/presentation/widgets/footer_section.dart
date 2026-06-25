import 'package:flutter/material.dart';
import '../../../../core/constants/amore_constants.dart';
import '../../../../core/constants/responsive.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  static const _links = ['Our Story', 'Gallery', 'Letters', 'Privacy', 'Contact'];

  @override
  Widget build(BuildContext context) {
    final hPad = Responsive.pagePadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      color: const Color(0xFF1A0C10),
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 36),
      child: Column(
        children: [
          isMobile
              ? Column(
                  children: [
                    _Logo(),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 24,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      children: _links.map(_FooterLink.new).toList(),
                    ),
                    const SizedBox(height: 24),
                    _SocialRow(),
                  ],
                )
              : Row(
                  children: [
                    _Logo(),
                    const Spacer(),
                    Wrap(
                      spacing: 32,
                      children: _links.map(_FooterLink.new).toList(),
                    ),
                    const Spacer(),
                    _SocialRow(),
                  ],
                ),
          const SizedBox(height: 28),
          Container(
              height: 1, color: Colors.white.withOpacity(0.07)),
          const SizedBox(height: 20),
          Text(
            'Made with ♡ for every love story · © ${DateTime.now().year} Amore',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (b) => AmoreColors.primaryGradient.createShader(b),
      child: const Text(
        'Amore',
        style: TextStyle(
          fontFamily: 'Playfair Display',
          fontSize: 26,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String label;
  const _FooterLink(this.label);

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedDefaultTextStyle(
        duration: AmoreDurations.fast,
        style: TextStyle(
          fontSize: 13,
          color: _hovering
              ? AmoreColors.roseLight
              : Colors.white.withOpacity(0.4),
          letterSpacing: 0.4,
        ),
        child: Text(widget.label),
      ),
    );
  }
}

class _SocialRow extends StatelessWidget {
  const _SocialRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [Icons.alternate_email_rounded, Icons.camera_alt_outlined, Icons.favorite_rounded]
          .map((icon) => Padding(
                padding: const EdgeInsets.only(left: 12),
                child: _SocialIcon(icon: icon),
              ))
          .toList(),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  const _SocialIcon({required this.icon});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: AmoreDurations.fast,
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          gradient: _hovering ? AmoreColors.primaryGradient : null,
          color: _hovering ? null : Colors.white.withOpacity(0.08),
          shape: BoxShape.circle,
        ),
        child: Icon(
          widget.icon,
          size: 16,
          color: _hovering ? Colors.white : Colors.white.withOpacity(0.4),
        ),
      ),
    );
  }
}
