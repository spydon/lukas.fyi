import 'package:jaspr/dom.dart';

/// Dark mode color palette for the site.
class AppColors {
  static const background = Color('#0a0e16');
  static const surface = Color('#121826');
  static const surfaceAlt = Color('#171f30');
  static const border = Color('#222c41');
  static const text = Color('#e6edf3');
  static const muted = Color('#9aa7bd');
  static const faint = Color('#6b7689');

  /// Flame blue.
  static const accent = Color('#4c8dff');

  /// Flame orange.
  static const accentWarm = Color('#ff7a3c');
}

const _contentWidth = 1000.0;

/// A reusable accent gradient used for highlights across the site.
const accentGradient = 'linear-gradient(135deg, #4c8dff 0%, #ff7a3c 100%)';

/// Global styles applied across the whole document.
@css
List<StyleRule> get styles => [
  css.import(
    'https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=JetBrains+Mono:wght@500&display=swap',
  ),
  css('*, *::before, *::after').styles(boxSizing: .borderBox),
  css(':root').styles(raw: {'scroll-behavior': 'smooth'}),
  css('html, body').styles(
    width: 100.percent,
    padding: .zero,
    margin: .zero,
    color: AppColors.text,
    backgroundColor: AppColors.background,
    fontFamily: const FontFamily.list([
      FontFamily('Inter'),
      FontFamilies.sansSerif,
    ]),
    lineHeight: 1.6.em,
    raw: {
      'background-image':
          'radial-gradient(55rem 55rem at 85% -10%, rgba(76,141,255,0.16), transparent 60%), '
          'radial-gradient(45rem 45rem at -10% 5%, rgba(255,122,60,0.10), transparent 55%)',
      'background-attachment': 'fixed',
      '-webkit-font-smoothing': 'antialiased',
      'text-rendering': 'optimizeLegibility',
    },
  ),
  css('h1, h2, h3, h4').styles(
    margin: .zero,
    lineHeight: 1.2.em,
    fontWeight: .w700,
  ),
  css('p').styles(margin: .zero),
  css('ul').styles(margin: .zero),
  css('a').styles(
    color: AppColors.accent,
    textDecoration: const TextDecoration(line: .none),
    transition: const Transition('color', duration: Duration(milliseconds: 150)),
  ),
  css('a:hover').styles(color: AppColors.accentWarm),
  css('::selection').styles(
    color: AppColors.background,
    backgroundColor: AppColors.accent,
  ),
  // Shared content container.
  css('.container').styles(
    width: 100.percent,
    maxWidth: _contentWidth.px,
    margin: .symmetric(horizontal: .auto),
    padding: .symmetric(horizontal: 24.px),
  ),
  // Section spacing and headings.
  css('.section').styles(padding: .symmetric(vertical: 52.px)),
  css('.section-title', [
    css('&').styles(
      display: .flex,
      gap: Gap(column: 14.px),
      alignItems: .center,
      margin: .only(bottom: 30.px),
      fontSize: 1.55.rem,
      letterSpacing: (-0.3).px,
    ),
    css('&::before').styles(
      width: 28.px,
      height: 4.px,
      radius: .circular(2.px),
      raw: {'content': '""', 'background': accentGradient},
    ),
  ]),
];
