import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/amore_constants.dart';
import '../../../../core/constants/responsive.dart';
import '../../../../core/widgets/amore_card.dart';
import '../../../../core/widgets/section_heading.dart';
import '../../../../core/widgets/amore_divider.dart';

class _Chapter {
  final String number;
  final String romanNumeral;
  final String tag;
  final String title;
  final String body;
  final String quoteLabel;
  final String quote;
  final IconData icon;

  const _Chapter({
    required this.number,
    required this.romanNumeral,
    required this.tag,
    required this.title,
    required this.body,
    required this.quoteLabel,
    required this.quote,
    required this.icon,
  });
}

const _chapters = [
  _Chapter(
    number: '01',
    romanNumeral: 'I',
    tag: 'Chapter I · First Meeting',
    title: 'The Day the World Stood Still',
    body:
        'It was an ordinary Tuesday — coffee in hand, late for everything — when our eyes met across the bookshop. Time didn\'t stop. It simply changed the way it moved forever.',
    quoteLabel: 'Their first words',
    quote:
        '"You have excellent taste in books — and terrible taste in coffee."',
    icon: Icons.auto_stories_rounded,
  ),
  _Chapter(
    number: '02',
    romanNumeral: 'II',
    tag: 'Chapter II · Falling',
    title: 'A Thousand Small Reasons',
    body:
        'It wasn\'t one grand gesture. It was the way you laughed with your whole self, the way you remembered small things, the way the world looked softer when you were in it.',
    quoteLabel: 'The moment',
    quote:
        '"I realised I was falling when I started laughing at your jokes — even the bad ones."',
    icon: Icons.favorite_rounded,
  ),
  _Chapter(
    number: '03',
    romanNumeral: 'III',
    tag: 'Chapter III · The Promise',
    title: 'A Question Under the Stars',
    body:
        'On the rooftop where we danced to no music, with the city glittering below us and every fear behind us, you asked — and I knew before the last word that my answer would always be yes.',
    quoteLabel: 'The proposal',
    quote: '"You are every beautiful thing I never dared to hope for."',
    icon: Icons.diamond_rounded,
  ),
  _Chapter(
    number: '04',
    romanNumeral: 'IV',
    tag: 'Chapter IV · Forever',
    title: 'The Beginning of Always',
    body:
        'Two names, one promise. The confetti fell like soft punctuation at the end of one life and the first letter of a new one — written together, in a language only we know.',
    quoteLabel: 'The vow',
    quote:
        '"I choose you — not just today, but on every ordinary Wednesday that follows."',
    icon: Icons.church_rounded,
  ),
];

class ChaptersSection extends StatelessWidget {
  const ChaptersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final hPad = Responsive.pagePadding(context);
    final isMobile = Responsive.isMobile(context);

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
          horizontal: hPad, vertical: AmoreSpacing.xxl),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: Responsive.maxWidth(context)),
          child: Column(
            children: [
              const AmoreSectionHeading(
                eyebrow: 'Our Story',
                title: 'Chapters of',
                italicSuffix: 'us',
                subtitle:
                    'Every great love is a story. Here are the chapters that wrote ours into forever.',
              ),
              const SizedBox(height: AmoreSpacing.xxl),
              ...List.generate(_chapters.length, (i) {
                return Column(
                  children: [
                    isMobile
                        ? _ChapterMobile(chapter: _chapters[i], index: i)
                        : _ChapterDesktop(
                            chapter: _chapters[i],
                            index: i,
                            isLeft: i.isEven,
                          ),
                    if (i < _chapters.length - 1)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: AmoreDivider(symbol: '♡'),
                      ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Desktop: alternating left / right ────────────────────────────────────────

class _ChapterDesktop extends StatelessWidget {
  final _Chapter chapter;
  final int index;
  final bool isLeft;

  const _ChapterDesktop({
    required this.chapter,
    required this.index,
    required this.isLeft,
  });

  @override
  Widget build(BuildContext context) {
    final content = _ChapterContent(chapter: chapter)
        .animate(delay: (index * 120).ms)
        .fadeIn(duration: 700.ms)
        .slideX(begin: isLeft ? -0.05 : 0.05, end: 0);

    final card = _QuoteCard(chapter: chapter)
        .animate(delay: (index * 120 + 180).ms)
        .fadeIn(duration: 700.ms)
        .slideX(begin: isLeft ? 0.05 : -0.05, end: 0);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: isLeft
            ? [
                Expanded(child: content),
                _TimelineNode(numeral: chapter.romanNumeral),
                Expanded(child: Align(alignment: Alignment.topLeft, child: card)),
              ]
            : [
                Expanded(child: Align(alignment: Alignment.topRight, child: card)),
                _TimelineNode(numeral: chapter.romanNumeral),
                Expanded(child: content),
              ],
      ),
    );
  }
}

class _TimelineNode extends StatelessWidget {
  final String numeral;
  const _TimelineNode({required this.numeral});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      child: Column(
        children: [
          // Top line
          Expanded(
            child: Center(
              child: Container(
                width: 1,
                color: AmoreColors.rose.withOpacity(0.2),
              ),
            ),
          ),
          // Dot
          Container(
            width: 46,
            height: 46,
            decoration: const BoxDecoration(
              gradient: AmoreColors.primaryGradient,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0x44C0485A),
                  blurRadius: 18,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Text(
              numeral,
              style: const TextStyle(
                fontFamily: 'Playfair Display',
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
          ),
          // Bottom line
          Expanded(
            child: Center(
              child: Container(
                width: 1,
                color: AmoreColors.rose.withOpacity(0.2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChapterContent extends StatelessWidget {
  final _Chapter chapter;
  const _ChapterContent({required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AmoreSpacing.xl, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AmoreColors.rose.withOpacity(0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(chapter.icon, color: AmoreColors.rose, size: 20),
          ),
          const SizedBox(height: 14),
          Text(
            chapter.tag.toUpperCase(),
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.8,
              color: AmoreColors.rose,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            chapter.title,
            style: const TextStyle(
              fontFamily: 'Playfair Display',
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AmoreColors.textDark,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            chapter.body,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: AmoreColors.textMid,
              height: 1.85,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuoteCard extends StatelessWidget {
  final _Chapter chapter;
  const _QuoteCard({required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AmoreSpacing.xl, horizontal: 8),
      child: AmoreCard(
        background: AmoreColors.rosePale,
        padding: const EdgeInsets.all(AmoreSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              chapter.quoteLabel.toUpperCase(),
              style: const TextStyle(
                fontSize: 10.5,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.8,
                color: AmoreColors.rose,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              chapter.quote,
              style: const TextStyle(
                fontFamily: 'Playfair Display',
                fontStyle: FontStyle.italic,
                fontSize: 15,
                color: AmoreColors.textDark,
                height: 1.75,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Mobile: stacked layout ────────────────────────────────────────────────────

class _ChapterMobile extends StatelessWidget {
  final _Chapter chapter;
  final int index;
  const _ChapterMobile({required this.chapter, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AmoreSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  gradient: AmoreColors.primaryGradient,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  chapter.romanNumeral,
                  style: const TextStyle(
                    fontFamily: 'Playfair Display',
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  chapter.tag.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 10.5,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.6,
                    color: AmoreColors.rose,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            chapter.title,
            style: const TextStyle(
              fontFamily: 'Playfair Display',
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AmoreColors.textDark,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            chapter.body,
            style: const TextStyle(
              fontSize: 14.5,
              fontWeight: FontWeight.w300,
              color: AmoreColors.textMid,
              height: 1.85,
            ),
          ),
          const SizedBox(height: 14),
          AmoreCard(
            background: AmoreColors.rosePale,
            padding: const EdgeInsets.all(AmoreSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chapter.quoteLabel.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.6,
                    color: AmoreColors.rose,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  chapter.quote,
                  style: const TextStyle(
                    fontFamily: 'Playfair Display',
                    fontStyle: FontStyle.italic,
                    fontSize: 14.5,
                    color: AmoreColors.textDark,
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
