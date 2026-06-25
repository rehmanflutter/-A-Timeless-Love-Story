import 'package:flutter/material.dart';
import '../widgets/nav_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/chapters_section.dart';
import '../widgets/gallery_section.dart';
import '../widgets/letter_section.dart';
import '../widgets/milestones_section.dart';
import '../widgets/testimonials_section.dart';
import '../widgets/cta_section.dart';
import '../widgets/footer_section.dart';
import '../../../../core/widgets/amore_divider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Sticky Nav
          // SliverPersistentHeader(
          //   pinned: true,
          //   delegate: _NavDelegate(),
          // ),

          // All page sections as slivers — builds lazily as user scrolls
          const SliverToBoxAdapter(child: HeroSection()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              child: const AmoreDivider(symbol: '✦'),
            ),
          ),
          const SliverToBoxAdapter(child: ChaptersSection()),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
              child: const AmoreDivider(symbol: '♡'),
            ),
          ),
          const SliverToBoxAdapter(child: GallerySection()),
          const SliverToBoxAdapter(child: LoveLetterSection()),
          const SliverToBoxAdapter(child: MilestonesSection()),
          const SliverToBoxAdapter(child: TestimonialsSection()),
          const SliverToBoxAdapter(child: CtaSection()),
          const SliverToBoxAdapter(child: FooterSection()),
        ],
      ),
    );
  }
}

class _NavDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 70;
  @override
  double get maxExtent => 70;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.only(top: 1),
      child: const AmoreNavBar(),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
