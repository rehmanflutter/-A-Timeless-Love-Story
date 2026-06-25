import 'package:flutter/material.dart';
import '../constants/amore_constants.dart';

class AnimatedCounter extends StatefulWidget {
  final int target;
  final String suffix;
  final String label;
  final bool started;
  final bool infinity;

  const AnimatedCounter({
    super.key,
    required this.target,
    required this.suffix,
    required this.label,
    required this.started,
    this.infinity = false,
  });

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1800));
    _anim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic);
  }

  @override
  void didUpdateWidget(AnimatedCounter old) {
    super.didUpdateWidget(old);
    if (widget.started && !old.started) _ctrl.forward();
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
          animation: _anim,
          builder: (_, __) {
            final val = widget.infinity
                ? '∞'
                : _format((_anim.value * widget.target).round());
            return ShaderMask(
              shaderCallback: (bounds) =>
                  AmoreColors.goldGradient.createShader(bounds),
              child: Text(
                '$val${widget.infinity ? '' : widget.suffix}',
                style: const TextStyle(
                  fontFamily: 'Playfair Display',
                  fontSize: 42,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 1,
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 8),
        Text(
          widget.label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11.5,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.6,
            color: Colors.white.withOpacity(0.55),
          ),
        ),
      ],
    );
  }

  String _format(int n) {
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}K';
    return n.toString();
  }
}
