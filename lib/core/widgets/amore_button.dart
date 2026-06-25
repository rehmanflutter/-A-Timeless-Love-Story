import 'package:flutter/material.dart';
import '../constants/amore_constants.dart';

class AmoreButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool outline;
  final bool expand;
  final IconData? icon;

  const AmoreButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.outline = false,
    this.expand = false,
    this.icon,
  });

  @override
  State<AmoreButton> createState() => _AmoreButtonState();
}

class _AmoreButtonState extends State<AmoreButton> {
  bool _hovering = false;
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() {
        _hovering = false;
        _pressed = false;
      }),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        onTap: widget.onPressed,
        child: AnimatedScale(
          scale: _pressed ? 0.96 : (_hovering ? 1.03 : 1.0),
          duration: AmoreDurations.fast,
          curve: Curves.easeOutCubic,
          child: AnimatedContainer(
            duration: AmoreDurations.fast,
            width: widget.expand ? double.infinity : null,
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            decoration: widget.outline
                ? BoxDecoration(
                    color: _hovering ? AmoreColors.rose : Colors.transparent,
                    borderRadius: BorderRadius.circular(AmoreRadii.pill),
                    border: Border.all(color: AmoreColors.rose, width: 1.5),
                  )
                : BoxDecoration(
                    gradient: AmoreColors.primaryGradient,
                    borderRadius: BorderRadius.circular(AmoreRadii.pill),
                    boxShadow: [
                      BoxShadow(
                        color: AmoreColors.rose
                            .withOpacity(_hovering ? 0.42 : 0.25),
                        blurRadius: _hovering ? 28 : 16,
                        offset: const Offset(0, 8),
                        spreadRadius: -2,
                      ),
                    ],
                  ),
            child: Row(
              mainAxisSize:
                  widget.expand ? MainAxisSize.max : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null) ...[
                  Icon(
                    widget.icon,
                    size: 17,
                    color: widget.outline
                        ? (_hovering ? Colors.white : AmoreColors.rose)
                        : Colors.white,
                  ),
                  const SizedBox(width: 8),
                ],
                Text(
                  widget.label,
                  style: TextStyle(
                    color: widget.outline
                        ? (_hovering ? Colors.white : AmoreColors.rose)
                        : Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    letterSpacing: 0.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
