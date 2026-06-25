import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Falling rose-petal animation rendered via CustomPainter.
/// Lightweight: only repaints its own RepaintBoundary layer.
class FallingPetalsBackground extends StatefulWidget {
  const FallingPetalsBackground({super.key});

  @override
  State<FallingPetalsBackground> createState() =>
      _FallingPetalsBackgroundState();
}

class _FallingPetalsBackgroundState extends State<FallingPetalsBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final List<_Petal> _petals;
  final math.Random _rng = math.Random();

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();

    _petals = List.generate(36, (_) => _Petal.random(_rng, preSpawn: true));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (_, __) {
          for (final p in _petals) {
            p.tick(0.016); // ~60fps step
          }
          return CustomPaint(
            painter: _PetalsPainter(petals: _petals),
            size: Size.infinite,
          );
        },
      ),
    );
  }
}

class _Petal {
  double x, y, size, rot, rotSpeed, vx, vy, opacity;
  final double hue, sat, light;
  static const double _gravity = 0.008;

  _Petal({
    required this.x,
    required this.y,
    required this.size,
    required this.rot,
    required this.rotSpeed,
    required this.vx,
    required this.vy,
    required this.opacity,
    required this.hue,
    required this.sat,
    required this.light,
  });

  factory _Petal.random(math.Random rng, {bool preSpawn = false}) {
    return _Petal(
      x: rng.nextDouble(),
      y: preSpawn ? rng.nextDouble() : -0.05,
      size: 6 + rng.nextDouble() * 10,
      rot: rng.nextDouble() * math.pi * 2,
      rotSpeed: (rng.nextDouble() - 0.5) * 0.03,
      vx: (rng.nextDouble() - 0.5) * 0.0012,
      vy: 0.0008 + rng.nextDouble() * 0.0016,
      opacity: 0.35 + rng.nextDouble() * 0.45,
      hue: 340 + rng.nextDouble() * 20,
      sat: 55 + rng.nextDouble() * 25,
      light: 72 + rng.nextDouble() * 16,
    );
  }

  void tick(double dt) {
    y += vy;
    x += vx + math.sin(y * math.pi * 6) * 0.0004;
    rot += rotSpeed;
    if (y > 1.05) {
      final rng = math.Random();
      x = rng.nextDouble();
      y = -0.05;
      vy = 0.0008 + rng.nextDouble() * 0.0016;
      vx = (rng.nextDouble() - 0.5) * 0.0012;
    }
  }
}

class _PetalsPainter extends CustomPainter {
  final List<_Petal> petals;
  _PetalsPainter({required this.petals});

  @override
  void paint(Canvas canvas, Size size) {
    for (final p in petals) {
      final cx = p.x * size.width;
      final cy = p.y * size.height;

      canvas.save();
      canvas.translate(cx, cy);
      canvas.rotate(p.rot);

      final paint = Paint()
        ..color = HSLColor.fromAHSL(
                p.opacity, p.hue, p.sat / 100, p.light / 100)
            .toColor();

      canvas.drawOval(
        Rect.fromCenter(
          center: Offset.zero,
          width: p.size * 0.55,
          height: p.size,
        ),
        paint,
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _PetalsPainter old) => true;
}
