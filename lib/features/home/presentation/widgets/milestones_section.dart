import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../../../core/constants/amore_constants.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/widgets/animated_counter.dart';
import '../../../../core/widgets/section_heading.dart';

class _Milestone {
  final int target;
  final String suffix;
  final String label;
  final bool infinity;
  const _Milestone(this.target, this.suffix, this.label,
      {this.infinity = false});
}

const _milestones = [
  _Milestone(1847, '', 'Days Together'),
  _Milestone(43, '', 'Love Letters Written'),
  _Milestone(312, '', 'Sunsets Shared'),
  _Milestone(0, '', 'Reasons I Love You', infinity: true),
];

class MilestonesSection extends StatefulWidget {
  const MilestonesSection({super.key});

  @override
  State<MilestonesSection> createState() => _MilestonesSectionState();
}

class _MilestonesSectionState extends State<MilestonesSection> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    final hPad = Responsive.pagePadding(context);

    return VisibilityDetector(
      key: const Key('milestones-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3 && !_visible) {
          setState(() => _visible = true);
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          gradient: AmoreColors.darkGradient,
        ),
        padding: EdgeInsets.symmetric(
            horizontal: hPad, vertical: AmoreSpacing.xxl),
        child: Column(
          children: [
            const AmoreSectionHeading(
              eyebrow: 'By the numbers',
              title: 'Love,',
              italicSuffix: 'measured',
              darkMode: true,
            ),
            const SizedBox(height: AmoreSpacing.xl),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  runSpacing: AmoreSpacing.xl,
                  spacing: AmoreSpacing.xl,
                  children: _milestones
                      .map((m) => SizedBox(
                            width: 180,
                            child: AnimatedCounter(
                              target: m.target,
                              suffix: m.suffix,
                              label: m.label.toUpperCase(),
                              started: _visible,
                              infinity: m.infinity,
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
