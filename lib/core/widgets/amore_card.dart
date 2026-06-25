import 'package:flutter/material.dart';
import '../constants/amore_constants.dart';

/// Soft cream card with a faint rose border — the base card for
/// testimonials, gallery items, and quote cards throughout the app.
class AmoreCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Color? background;
  final bool hoverable;
  final VoidCallback? onTap;

  const AmoreCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AmoreSpacing.lg),
    this.borderRadius = AmoreRadii.lg,
    this.background,
    this.hoverable = true,
    this.onTap,
  });

  @override
  State<AmoreCard> createState() => _AmoreCardState();
}

class _AmoreCardState extends State<AmoreCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : MouseCursor.defer,
      onEnter: widget.hoverable ? (_) => setState(() => _hovering = true) : null,
      onExit: widget.hoverable ? (_) => setState(() => _hovering = false) : null,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: AmoreDurations.fast,
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(
              0, widget.hoverable && _hovering ? -6 : 0, 0),
          decoration: BoxDecoration(
            color: widget.background ?? Colors.white,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(
              color: AmoreColors.rose.withOpacity(0.10),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: AmoreColors.rose.withOpacity(_hovering ? 0.14 : 0.06),
                blurRadius: _hovering ? 40 : 20,
                offset: const Offset(0, 8),
                spreadRadius: -4,
              ),
            ],
          ),
          child: Padding(
            padding: widget.padding,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
