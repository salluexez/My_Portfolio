import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'portfolio_data.dart';

/// App-wide theme mode. Lives at top level so any widget can toggle it
/// without having to thread callbacks through the whole tree.
final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier<ThemeMode>(
  ThemeMode.light,
);

void main() {
  runApp(const PortfolioApp());
}

/// Semantic color tokens for the portfolio. Implemented as a [ThemeExtension]
/// so every widget can pick up the right palette via `context.palette`.
@immutable
class AppPalette extends ThemeExtension<AppPalette> {
  const AppPalette({
    required this.surface,
    required this.panel,
    required this.panelBorder,
    required this.navBorder,
    required this.navBg,
    required this.navSelected,
    required this.shadow,
    required this.subtleShadow,
    required this.textPrimary,
    required this.textSecondary,
    required this.textTertiary,
    required this.textMuted,
    required this.textBody,
    required this.tagBg,
    required this.tagBorder,
    required this.tagText,
    required this.filledBg,
    required this.filledFg,
    required this.ghostBg,
    required this.statAccentAlt,
    required this.badgeBg,
    required this.badgeFg,
  });

  final Color surface;
  final Color panel;
  final Color panelBorder;
  final Color navBorder;
  final Color navBg;
  final Color navSelected;
  final Color shadow;
  final Color subtleShadow;
  final Color textPrimary;
  final Color textSecondary;
  final Color textTertiary;
  final Color textMuted;
  final Color textBody;
  final Color tagBg;
  final Color tagBorder;
  final Color tagText;
  final Color filledBg;
  final Color filledFg;
  final Color ghostBg;
  final Color statAccentAlt;
  final Color badgeBg;
  final Color badgeFg;

  static const AppPalette light = AppPalette(
    surface: Color(0xFFFFFFFF),
    panel: Color(0xFFFEFEFE),
    panelBorder: Color(0xFFE0E0E0),
    navBorder: Color(0xFFE2E2E2),
    navBg: Color(0xFFFFFFFF),
    navSelected: Color(0xFFE9E9E9),
    shadow: Color(0x1A000000),
    subtleShadow: Color(0x08000000),
    textPrimary: Color(0xFF000000),
    textSecondary: Color(0xFF555555),
    textTertiary: Color(0xFF707070),
    textMuted: Color(0xFF5F5F5F),
    textBody: Color(0xFF333333),
    tagBg: Color(0xFFF2F2F2),
    tagBorder: Color(0xFFE8E8E8),
    tagText: Color(0xFF333333),
    filledBg: Color(0xFF000000),
    filledFg: Color(0xFFFFFFFF),
    ghostBg: Color(0xFFFFFFFF),
    statAccentAlt: Color(0xFF626262),
    badgeBg: Color(0xFF000000),
    badgeFg: Color(0xFFFFFFFF),
  );

  static const AppPalette dark = AppPalette(
    surface: Color(0xFF0B0B0B),
    panel: Color(0xFF161616),
    panelBorder: Color(0xFF262626),
    navBorder: Color(0xFF2A2A2A),
    navBg: Color(0xFF161616),
    navSelected: Color(0xFF2A2A2A),
    shadow: Color(0x66000000),
    subtleShadow: Color(0x4D000000),
    textPrimary: Color(0xFFF5F5F5),
    textSecondary: Color(0xFFB8B8B8),
    textTertiary: Color(0xFF9A9A9A),
    textMuted: Color(0xFFA8A8A8),
    textBody: Color(0xFFCFCFCF),
    tagBg: Color(0xFF1E1E1E),
    tagBorder: Color(0xFF2A2A2A),
    tagText: Color(0xFFD8D8D8),
    filledBg: Color(0xFFF5F5F5),
    filledFg: Color(0xFF0B0B0B),
    ghostBg: Color(0xFF161616),
    statAccentAlt: Color(0xFF8A8A8A),
    badgeBg: Color(0xFFF5F5F5),
    badgeFg: Color(0xFF0B0B0B),
  );

  @override
  AppPalette copyWith({
    Color? surface,
    Color? panel,
    Color? panelBorder,
    Color? navBorder,
    Color? navBg,
    Color? navSelected,
    Color? shadow,
    Color? subtleShadow,
    Color? textPrimary,
    Color? textSecondary,
    Color? textTertiary,
    Color? textMuted,
    Color? textBody,
    Color? tagBg,
    Color? tagBorder,
    Color? tagText,
    Color? filledBg,
    Color? filledFg,
    Color? ghostBg,
    Color? statAccentAlt,
    Color? badgeBg,
    Color? badgeFg,
  }) {
    return AppPalette(
      surface: surface ?? this.surface,
      panel: panel ?? this.panel,
      panelBorder: panelBorder ?? this.panelBorder,
      navBorder: navBorder ?? this.navBorder,
      navBg: navBg ?? this.navBg,
      navSelected: navSelected ?? this.navSelected,
      shadow: shadow ?? this.shadow,
      subtleShadow: subtleShadow ?? this.subtleShadow,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textTertiary: textTertiary ?? this.textTertiary,
      textMuted: textMuted ?? this.textMuted,
      textBody: textBody ?? this.textBody,
      tagBg: tagBg ?? this.tagBg,
      tagBorder: tagBorder ?? this.tagBorder,
      tagText: tagText ?? this.tagText,
      filledBg: filledBg ?? this.filledBg,
      filledFg: filledFg ?? this.filledFg,
      ghostBg: ghostBg ?? this.ghostBg,
      statAccentAlt: statAccentAlt ?? this.statAccentAlt,
      badgeBg: badgeBg ?? this.badgeBg,
      badgeFg: badgeFg ?? this.badgeFg,
    );
  }

  @override
  AppPalette lerp(ThemeExtension<AppPalette>? other, double t) {
    if (other is! AppPalette) return this;
    return AppPalette(
      surface: Color.lerp(surface, other.surface, t)!,
      panel: Color.lerp(panel, other.panel, t)!,
      panelBorder: Color.lerp(panelBorder, other.panelBorder, t)!,
      navBorder: Color.lerp(navBorder, other.navBorder, t)!,
      navBg: Color.lerp(navBg, other.navBg, t)!,
      navSelected: Color.lerp(navSelected, other.navSelected, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
      subtleShadow: Color.lerp(subtleShadow, other.subtleShadow, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      textTertiary: Color.lerp(textTertiary, other.textTertiary, t)!,
      textMuted: Color.lerp(textMuted, other.textMuted, t)!,
      textBody: Color.lerp(textBody, other.textBody, t)!,
      tagBg: Color.lerp(tagBg, other.tagBg, t)!,
      tagBorder: Color.lerp(tagBorder, other.tagBorder, t)!,
      tagText: Color.lerp(tagText, other.tagText, t)!,
      filledBg: Color.lerp(filledBg, other.filledBg, t)!,
      filledFg: Color.lerp(filledFg, other.filledFg, t)!,
      ghostBg: Color.lerp(ghostBg, other.ghostBg, t)!,
      statAccentAlt: Color.lerp(statAccentAlt, other.statAccentAlt, t)!,
      badgeBg: Color.lerp(badgeBg, other.badgeBg, t)!,
      badgeFg: Color.lerp(badgeFg, other.badgeFg, t)!,
    );
  }
}

extension AppPaletteX on BuildContext {
  AppPalette get palette => Theme.of(this).extension<AppPalette>()!;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeModeNotifier,
      builder: (context, mode, _) {
        return MaterialApp(
          title: 'Mohd Salauddin | Flutter Developer',
          debugShowCheckedModeBanner: false,
          themeMode: mode,
          theme: _buildTheme(Brightness.light),
          darkTheme: _buildTheme(Brightness.dark),
          home: const PortfolioHome(),
        );
      },
    );
  }

  ThemeData _buildTheme(Brightness brightness) {
    final palette = brightness == Brightness.dark
        ? AppPalette.dark
        : AppPalette.light;
    final mono = GoogleFonts.jetBrainsMonoTextTheme().apply(
      bodyColor: palette.textPrimary,
      displayColor: palette.textPrimary,
    );
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: palette.surface,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.black,
        brightness: brightness,
      ),
      textTheme: mono,
      extensions: [palette],
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome> {
  final _scrollController = ScrollController();
  final _sectionKeys = List.generate(navItems.length, (_) => GlobalKey());
  var _activeIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_syncActiveSection);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_syncActiveSection)
      ..dispose();
    super.dispose();
  }

  void _syncActiveSection() {
    var closestIndex = _activeIndex;
    var closestDistance = double.infinity;

    for (var i = 0; i < _sectionKeys.length; i++) {
      final context = _sectionKeys[i].currentContext;
      if (context == null) continue;
      final box = context.findRenderObject() as RenderBox?;
      if (box == null || !box.attached) continue;
      final distance = (box.localToGlobal(Offset.zero).dy - 120).abs();
      if (distance < closestDistance) {
        closestDistance = distance;
        closestIndex = i;
      }
    }

    if (closestIndex != _activeIndex && mounted) {
      setState(() => _activeIndex = closestIndex);
    }
  }

  Future<void> _scrollTo(int index) async {
    final context = _sectionKeys[index].currentContext;
    if (context == null) return;
    setState(() => _activeIndex = index);
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
      alignment: 0.04,
    );
  }

  Future<void> _open(Uri uri) async {
    await launchUrl(uri, mode: LaunchMode.platformDefault);
  }

  Future<void> _openResume() async {
    final base = Uri.base;
    final resumeUri = base.resolve(resumeWebPath);
    await launchUrl(resumeUri, webOnlyWindowName: '_blank');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PortfolioSection(
                  key: _sectionKeys[0],
                  child: HeroSection(
                    onContact: () => _scrollTo(5),
                    onResume: _openResume,
                    openLink: _open,
                  ),
                ),
                PortfolioSection(
                  key: _sectionKeys[1],
                  child: const StatusSection(),
                ),
                PortfolioSection(
                  key: _sectionKeys[2],
                  child: WorkSection(openLink: _open),
                ),
                PortfolioSection(
                  key: _sectionKeys[3],
                  child: ProjectsSection(openLink: _open),
                ),
                PortfolioSection(
                  key: _sectionKeys[4],
                  child: ResumeSection(onResume: _openResume),
                ),
                PortfolioSection(
                  key: _sectionKeys[5],
                  child: ContactSection(openLink: _open, onResume: _openResume),
                ),
              ],
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topCenter,
              child: FloatingNav(
                activeIndex: _activeIndex,
                onSelected: _scrollTo,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1240),
          child: child,
        ),
      ),
    );
  }
}

class FloatingNav extends StatelessWidget {
  const FloatingNav({
    required this.activeIndex,
    required this.onSelected,
    super.key,
  });

  final int activeIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Container(
      margin: const EdgeInsets.only(top: 18),
      padding: const EdgeInsets.all(8),
      constraints: const BoxConstraints(maxWidth: 820),
      decoration: BoxDecoration(
        color: palette.navBg.withValues(alpha: 0.92),
        border: Border.all(color: palette.navBorder),
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: palette.shadow,
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (var i = 0; i < navItems.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Semantics(
                  button: true,
                  label: 'Navigate to ${navItems[i].label}',
                  child: _NavButton(
                    item: navItems[i],
                    selected: activeIndex == i,
                    onPressed: () => onSelected(i),
                  ),
                ),
              ),
            const SizedBox(width: 4),
            Container(
              width: 1,
              height: 26,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              color: palette.navBorder,
            ),
            const SizedBox(width: 4),
            const ThemeToggleButton(),
          ],
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.item,
    required this.selected,
    required this.onPressed,
  });

  final NavItem item;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(item.icon, size: 17),
      label: Text(item.label),
      style: TextButton.styleFrom(
        foregroundColor: palette.textPrimary,
        backgroundColor: selected ? palette.navSelected : palette.navBg,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        textStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13),
      ),
    );
  }
}

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final isDark = context.isDark;
    return Tooltip(
      message: isDark ? 'Switch to light mode' : 'Switch to dark mode',
      child: Semantics(
        button: true,
        label: 'Toggle theme',
        child: IconButton(
          onPressed: () {
            themeModeNotifier.value = isDark
                ? ThemeMode.light
                : ThemeMode.dark;
          },
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            transitionBuilder: (child, anim) =>
                RotationTransition(turns: anim, child: child),
            child: Icon(
              isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
              key: ValueKey<bool>(isDark),
              size: 20,
            ),
          ),
          color: palette.textPrimary,
          style: IconButton.styleFrom(
            fixedSize: const Size(44, 44),
            backgroundColor: palette.navBg,
            shape: const CircleBorder(),
            side: BorderSide(color: palette.navBorder),
          ),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({
    required this.onContact,
    required this.onResume,
    required this.openLink,
    super.key,
  });

  final VoidCallback onContact;
  final VoidCallback onResume;
  final ValueChanged<Uri> openLink;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 900;
        return Padding(
          padding: EdgeInsets.only(
            top: isWide ? 116 : 104,
            bottom: isWide ? 82 : 54,
          ),
          child: Flex(
            direction: isWide ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: isWide
                ? [
                    Expanded(
                      flex: 11,
                      child: _HeroIntro(
                        onContact: onContact,
                        onResume: onResume,
                        openLink: openLink,
                      ),
                    ),
                    const SizedBox(width: 56),
                    const Expanded(flex: 9, child: HeroStatsGrid()),
                  ]
                : [
                    _HeroIntro(
                      onContact: onContact,
                      onResume: onResume,
                      openLink: openLink,
                    ),
                    const SizedBox(height: 28),
                    const HeroStatsGrid(),
                  ],
          ),
        );
      },
    );
  }
}

class _HeroIntro extends StatelessWidget {
  const _HeroIntro({
    required this.onContact,
    required this.onResume,
    required this.openLink,
  });

  final VoidCallback onContact;
  final VoidCallback onResume;
  final ValueChanged<Uri> openLink;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _HeroName(),
        const SizedBox(height: 28),
        const TypewriterRole(),
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Text(
            'MCA student and full-stack developer building Flutter apps, AI-assisted learning tools, and practical systems with clean architecture.',
            style: TextStyle(
              fontSize: 20,
              height: 1.55,
              color: palette.textSecondary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(height: 30),
        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            AppButton(
              label: 'Get In Touch',
              icon: Icons.mail_outline,
              filled: true,
              onPressed: onContact,
            ),
            AppButton(
              label: 'Download Resume',
              icon: Icons.file_download_outlined,
              onPressed: onResume,
            ),
          ],
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            IconLinkButton(
              label: 'GitHub',
              icon: Icons.code,
              onPressed: () => openLink(PortfolioLinks.github),
            ),
            IconLinkButton(
              label: 'LinkedIn',
              icon: Icons.business_center_outlined,
              onPressed: () => openLink(PortfolioLinks.linkedin),
            ),
            IconLinkButton(
              label: 'Email',
              icon: Icons.alternate_email,
              onPressed: () => openLink(PortfolioLinks.email),
            ),
          ],
        ),
      ],
    );
  }
}

class _HeroName extends StatelessWidget {
  const _HeroName();

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = math.min(
          128.0,
          math.max(58.0, constraints.maxWidth / 5.4),
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'MOHD',
              maxLines: 1,
              style: TextStyle(
                fontSize: size,
                height: 0.82,
                fontWeight: FontWeight.w900,
                color: palette.textPrimary,
                letterSpacing: 0,
              ),
            ),
            Text(
              'SALAUDDIN',
              maxLines: 1,
              style: TextStyle(
                fontSize: size * 0.75,
                height: 1.02,
                fontWeight: FontWeight.w900,
                color: palette.textSecondary,
                letterSpacing: 0,
              ),
            ),
          ],
        );
      },
    );
  }
}

class TypewriterRole extends StatefulWidget {
  const TypewriterRole({super.key});

  @override
  State<TypewriterRole> createState() => _TypewriterRoleState();
}

class _TypewriterRoleState extends State<TypewriterRole>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  static const roles = [
    'Flutter Developer',
    'Full-Stack Builder',
    'AI Systems Explorer',
    'CTF Problem Solver',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 9500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final screenWidth = MediaQuery.of(context).size.width;
    final fontSize = screenWidth > 600 ? 27.0 : 20.0;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final slot = (_controller.value * roles.length).floor() % roles.length;
        final progress = (_controller.value * roles.length) % 1;
        final role = roles[slot];
        final visibleCount = math.max(1, (role.length * progress).ceil());
        return Text(
          '> ${role.substring(0, math.min(visibleCount, role.length))}|',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w900,
            color: palette.textPrimary,
            height: 1.2,
          ),
        );
      },
    );
  }
}

class HeroStatsGrid extends StatelessWidget {
  const HeroStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth > 520 ? 2 : 1;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: heroStats.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            mainAxisExtent: 144,
            crossAxisSpacing: 18,
            mainAxisSpacing: 18,
          ),
          itemBuilder: (context, index) {
            final item = heroStats[index];
            return BorderedPanel(
              accent: index.isEven ? palette.textPrimary : palette.statAccentAlt,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.value,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                      color: palette.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.label,
                    style: TextStyle(
                      fontSize: 13,
                      letterSpacing: 0.8,
                      color: palette.textSecondary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class StatusSection extends StatelessWidget {
  const StatusSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      eyebrow: 'CURRENT STATUS',
      title: 'What I am building toward right now',
      body:
          'A focused mix of Flutter product engineering, AI systems, core CS, and security practice.',
      child: ResponsiveGrid(
        itemCount: focusCards.length,
        itemBuilder: (context, index) => FocusCard(data: focusCards[index]),
      ),
    );
  }
}

class WorkSection extends StatelessWidget {
  const WorkSection({required this.openLink, super.key});

  final ValueChanged<Uri> openLink;

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      eyebrow: 'WORK',
      title: 'Professional experience',
      body:
          'Internship work shaped around shipping cross-platform apps with AI-powered features.',
      child: ResponsiveGrid(
        itemCount: workItems.length,
        itemBuilder: (context, index) =>
            TimelineCard(item: workItems[index], openLink: openLink),
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({required this.openLink, super.key});

  final ValueChanged<Uri> openLink;

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      eyebrow: 'WORK & PROJECTS',
      title: 'Featured builds',
      body:
          'Projects chosen from the resume because they show product thinking, cross-platform UI, backend integration, and AI workflows.',
      child: ResponsiveGrid(
        itemCount: projectItems.length,
        itemBuilder: (context, index) =>
            TimelineCard(item: projectItems[index], openLink: openLink),
      ),
    );
  }
}

class ResumeSection extends StatelessWidget {
  const ResumeSection({required this.onResume, super.key});

  final VoidCallback onResume;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return SectionShell(
      eyebrow: 'RESUME',
      title: 'Education, skills, and proof points',
      body: 'A scannable version of the PDF for recruiters and collaborators.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveGrid(
            itemCount: educationItems.length,
            itemBuilder: (context, index) {
              final item = educationItems[index];
              return BorderedPanel(
                accent: index.isEven
                    ? const Color(0xFF4385F5)
                    : const Color(0xFF21C76F),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.period,
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      item.degree,
                      style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item.school,
                      style: TextStyle(
                        color: palette.textSecondary,
                        fontWeight: FontWeight.w700,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 22),
          BorderedPanel(
            accent: palette.textPrimary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PanelHeader(
                  icon: Icons.tune_outlined,
                  title: 'Skills Summary',
                ),
                const SizedBox(height: 18),
                SkillGroup(title: 'Languages', skills: languageSkills),
                SkillGroup(title: 'Frameworks', skills: frameworkSkills),
                SkillGroup(title: 'Core Subjects', skills: coreSkills),
                SkillGroup(title: 'Tools', skills: toolSkills),
              ],
            ),
          ),
          const SizedBox(height: 22),
          BorderedPanel(
            accent: const Color(0xFFF0B429),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PanelHeader(
                  icon: Icons.emoji_events_outlined,
                  title: 'Certifications & Achievements',
                ),
                const SizedBox(height: 16),
                for (final item in achievements)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '> ',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: palette.textPrimary,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            item,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              height: 1.45,
                              color: palette.textBody,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 12),
                AppButton(
                  label: 'Open Full Resume',
                  icon: Icons.open_in_new,
                  filled: true,
                  onPressed: onResume,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({
    required this.openLink,
    required this.onResume,
    super.key,
  });

  final ValueChanged<Uri> openLink;
  final VoidCallback onResume;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return SectionShell(
      eyebrow: 'CONTACT',
      title: 'Let us build something useful',
      body:
          'Open to Flutter, full-stack, AI feature work, internships, and product-minded collaborations.',
      bottomPadding: 70,
      child: BorderedPanel(
        accent: palette.textPrimary,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 780;
            final actions = Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                AppButton(
                  label: 'Email',
                  icon: Icons.alternate_email,
                  filled: true,
                  onPressed: () => openLink(PortfolioLinks.email),
                ),
                AppButton(
                  label: 'Call',
                  icon: Icons.phone_outlined,
                  onPressed: () => openLink(PortfolioLinks.phone),
                ),
                AppButton(
                  label: 'GitHub',
                  icon: Icons.code,
                  onPressed: () => openLink(PortfolioLinks.github),
                ),
                AppButton(
                  label: 'Resume',
                  icon: Icons.description_outlined,
                  onPressed: onResume,
                ),
              ],
            );

            return Flex(
              direction: isWide ? Axis.horizontal : Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: isWide
                  ? [
                      const Expanded(child: _ContactDetails()),
                      const SizedBox(width: 34),
                      Expanded(child: actions),
                    ]
                  : [
                      const _ContactDetails(),
                      const SizedBox(height: 28),
                      actions,
                    ],
            );
          },
        ),
      ),
    );
  }
}

class SectionShell extends StatelessWidget {
  const SectionShell({
    required this.eyebrow,
    required this.title,
    required this.body,
    required this.child,
    this.bottomPadding = 92,
    super.key,
  });

  final String eyebrow;
  final String title;
  final String body;
  final Widget child;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    final screenWidth = MediaQuery.of(context).size.width;
    final eyebrowFontSize = screenWidth > 600 ? 54.0 : 32.0;
    final titleFontSize = screenWidth > 600 ? 23.0 : 18.0;
    return Padding(
      padding: EdgeInsets.only(
        top: screenWidth > 600 ? 92 : 54,
        bottom: bottomPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            eyebrow,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: eyebrowFontSize,
              height: 1.02,
              fontWeight: FontWeight.w900,
              color: palette.textPrimary,
            ),
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 850),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: titleFontSize,
                height: 1.35,
                fontWeight: FontWeight.w900,
                color: palette.textSecondary,
              ),
            ),
          ),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 820),
            child: Text(
              body,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                fontWeight: FontWeight.w700,
                color: palette.textTertiary,
              ),
            ),
          ),
          const SizedBox(height: 44),
          child,
        ],
      ),
    );
  }
}

class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    required this.itemCount,
    required this.itemBuilder,
    super.key,
  });

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final columns = width > 980 ? 2 : 1;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: itemCount,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            mainAxisExtent: width > 560 ? 260 : 310,
          ),
          itemBuilder: itemBuilder,
        );
      },
    );
  }
}

class FocusCard extends StatelessWidget {
  const FocusCard({required this.data, super.key});

  final FocusCardData data;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return BorderedPanel(
      accent: data.accent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PanelHeader(icon: data.icon, title: data.title),
          const SizedBox(height: 20),
          Text(
            data.subtitle,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: palette.textPrimary,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            data.body,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: palette.textMuted,
              height: 1.55,
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineCard extends StatelessWidget {
  const TimelineCard({required this.item, required this.openLink, super.key});

  final TimelineItem item;
  final ValueChanged<Uri> openLink;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return BorderedPanel(
      accent: item.accent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: palette.textPrimary,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.role,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: palette.textSecondary,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              if (item.badge != null) BadgeLabel(label: item.badge!),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            item.period,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: palette.textMuted,
            ),
          ),
          const SizedBox(height: 17),
          Expanded(
            child: Text(
              item.description,
              style: TextStyle(
                fontSize: 14,
                height: 1.52,
                fontWeight: FontWeight.w700,
                color: palette.textBody,
              ),
            ),
          ),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final tag in item.tags) TechTag(tag),
              if (item.link != null)
                TextButton.icon(
                  onPressed: () => openLink(item.link!),
                  icon: const Icon(Icons.open_in_new, size: 16),
                  label: const Text('Code'),
                  style: TextButton.styleFrom(
                    foregroundColor: palette.textPrimary,
                    textStyle: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class BorderedPanel extends StatelessWidget {
  const BorderedPanel({required this.child, required this.accent, super.key});

  final Widget child;
  final Color accent;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: palette.panel,
        border: Border.all(color: palette.panelBorder),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: palette.subtleShadow,
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(height: 5, color: accent),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 29, 24, 24),
            child: child,
          ),
        ],
      ),
    );
  }
}

class _ContactDetails extends StatelessWidget {
  const _ContactDetails();

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PanelHeader(
          icon: Icons.bolt_outlined,
          title: 'Available for practical product work',
        ),
        const SizedBox(height: 18),
        Text(
          'sallumalik1111@gmail.com\n+91 7983818754\ngithub.com/salluexez',
          style: TextStyle(
            fontSize: 18,
            height: 1.7,
            fontWeight: FontWeight.w800,
            color: palette.textBody,
          ),
        ),
      ],
    );
  }
}

class PanelHeader extends StatelessWidget {
  const PanelHeader({required this.icon, required this.title, super.key});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Row(
      children: [
        Icon(icon, size: 24, color: palette.textPrimary),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: palette.textPrimary,
              height: 1.25,
            ),
          ),
        ),
      ],
    );
  }
}

class SkillGroup extends StatelessWidget {
  const SkillGroup({required this.title, required this.skills, super.key});

  final String title;
  final List<String> skills;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: palette.textPrimary,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [for (final skill in skills) TechTag(skill)],
          ),
        ],
      ),
    );
  }
}

class BadgeLabel extends StatelessWidget {
  const BadgeLabel({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: palette.badgeBg,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: palette.badgeFg,
          fontWeight: FontWeight.w900,
          fontSize: 12,
        ),
      ),
    );
  }
}

class TechTag extends StatelessWidget {
  const TechTag(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: palette.tagBg,
        border: Border.all(color: palette.tagBorder),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: palette.tagText,
          fontSize: 12,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    this.filled = false,
    super.key,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Semantics(
      button: true,
      label: label,
      child: FilledButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: FilledButton.styleFrom(
          backgroundColor: filled ? palette.filledBg : palette.ghostBg,
          foregroundColor: filled ? palette.filledFg : palette.textPrimary,
          side: BorderSide(color: palette.panelBorder),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}

class IconLinkButton extends StatelessWidget {
  const IconLinkButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;
    return Tooltip(
      message: label,
      child: Semantics(
        button: true,
        label: label,
        child: IconButton.outlined(
          onPressed: onPressed,
          icon: Icon(icon),
          color: palette.textPrimary,
          style: IconButton.styleFrom(
            fixedSize: const Size(48, 48),
            side: BorderSide(color: palette.panelBorder),
          ),
        ),
      ),
    );
  }
}
