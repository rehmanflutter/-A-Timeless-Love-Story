import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/amore_constants.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/widgets/amore_card.dart';
import '../../../../core/widgets/section_heading.dart';

class _Memory {
  final String date;
  final String title;
  final String description;
  final String emoji;
  final List<Color> gradient;

  const _Memory({
    required this.date,
    required this.title,
    required this.description,
    required this.emoji,
    required this.gradient,
  });
}

const _memories = [
  _Memory(
    date: 'Spring · Year One',
    title: 'The First Picnic',
    description:
        'A checkered blanket, terrible sandwiches, and the best afternoon of our lives.',
    emoji: '🌹',
    gradient: [Color(0xFFFCE4E8), Color(0xFFF5B8C4)],
  ),
  _Memory(
    date: 'Summer · Year Two',
    title: 'The Cliffside Sunrise',
    description:
        'We woke at four. You said it wasn\'t worth it. You were gloriously wrong.',
    emoji: '🌅',
    gradient: [Color(0xFFFEEFD4), Color(0xFFF5D08A)],
  ),
  _Memory(
    date: 'Autumn · Year Two',
    title: 'The Rainy Walk',
    description:
        'One umbrella, two people, and a puddle that changed everything.',
    emoji: '🍃',
    gradient: [Color(0xFFDFF0E8), Color(0xFFA8D8B8)],
  ),
  _Memory(
    date: 'Winter · Year Three',
    title: 'New Year, Same You',
    description:
        'Midnight came, champagne spilled — and you were still the best part of the year.',
    emoji: '✨',
    gradient: [Color(0xFFE4E8FC), Color(0xFFB8C4F5)],
  ),
  _Memory(
    date: 'Spring · Year Four',
    title: 'The Handwritten Letters',
    description:
        'Forty-three letters over forty-three days. Every one still kept.',
    emoji: '💌',
    gradient: [Color(0xFFFCE4F0), Color(0xFFF5B8D8)],
  ),
  _Memory(
    date: 'Autumn · Year Five',
    title: 'The Candlelit Evening',
    description: 'No phones, no plans — just you, me, and the candlelight.',
    emoji: '🕯️',
    gradient: [Color(0xFFFDF0E4), Color(0xFFF5C8A0)],
  ),
];

class GallerySection extends StatelessWidget {
  const GallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    final hPad = Responsive.pagePadding(context);
    final crossAxisCount =
        Responsive.value(context, mobile: 1, tablet: 2, desktop: 3);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFDF0F2),
            Color(0xFFFDF8F2),
            Color(0xFFFDF5EA),
          ],
        ),
      ),
      padding:
          EdgeInsets.symmetric(horizontal: hPad, vertical: AmoreSpacing.xxl),
      child: Column(
        children: [
          const AmoreSectionHeading(
            eyebrow: 'Moments',
            title: 'Memories we',
            italicSuffix: 'keep',
            subtitle:
                'Each moment a sentence. Together they write the most beautiful story we know.',
          ),
          const SizedBox(height: AmoreSpacing.xl),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  mainAxisExtent: crossAxisCount == 1 ? 350 : 320,
                ),
                itemCount: _memories.length,
                itemBuilder: (context, i) => _MemoryCard(memory: _memories[i])
                    .animate(delay: (i * 80).ms)
                    .fadeIn(duration: 600.ms)
                    .slideY(begin: 0.06, end: 0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MemoryCard extends StatelessWidget {
  final _Memory memory;
  const _MemoryCard({required this.memory});

  @override
  Widget build(BuildContext context) {
    return AmoreCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gradient artwork panel
          Container(
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: memory.gradient,
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(AmoreRadii.lg),
              ),
            ),
            alignment: Alignment.center,
            child: Text(memory.emoji, style: const TextStyle(fontSize: 52)),
          ),
          // Card body
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  memory.date.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.6,
                    color: AmoreColors.rose,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  memory.title,
                  style: const TextStyle(
                    fontFamily: 'Playfair Display',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AmoreColors.textDark,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  memory.description,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w300,
                    color: AmoreColors.textMid,
                    height: 1.7,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
