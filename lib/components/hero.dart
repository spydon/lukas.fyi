import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import '../data/resume.dart';
import 'social_links.dart';

/// The landing hero with avatar, name, tagline and call to actions.
class Hero extends StatelessComponent {
  const Hero({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'about', classes: 'hero section', [
      div(classes: 'container hero-inner', [
        div(classes: 'hero-text', [
          h1(classes: 'hero-name', [Component.text(Profile.name)]),
          p(classes: 'hero-title', [
            Component.text(Profile.title),
            br(),
            span(classes: 'accent', [Component.text(Profile.tagline)]),
          ]),
          p(classes: 'hero-location', [
            Component.text('📍 '),
            Component.text(Profile.location),
          ]),
          p(classes: 'hero-summary', [Component.text(Profile.summary)]),
          div(classes: 'hero-actions', [
            a(href: 'mailto:me@lukas.fyi', classes: 'btn btn-primary', [
              Component.text('Get in touch'),
            ]),
            a(
              href: '/cv.pdf',
              classes: 'btn btn-ghost',
              attributes: {'target': '_blank', 'rel': 'noopener'},
              [Component.text('Download CV')],
            ),
          ]),
          const SocialLinks(),
        ]),
        div(classes: 'hero-photo', [
          div(classes: 'photo-ring', [
            img(
              src: Profile.photo,
              alt: Profile.name,
              attributes: {'width': '300', 'height': '300', 'loading': 'eager'},
            ),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.hero').styles(
      padding: .only(top: 48.px, bottom: 32.px),
    ),
    css('.hero-inner').styles(
      display: .grid,
      gap: Gap(row: 40.px, column: 56.px),
      alignItems: .center,
      gridTemplate: const GridTemplate(
        columns: GridTracks([GridTrack(TrackSize.fr(1.4)), GridTrack(TrackSize.fr(1))]),
      ),
    ),
    css('.hero-name').styles(
      margin: .only(bottom: 14.px),
      fontSize: 3.4.rem,
      fontWeight: .w800,
      letterSpacing: (-1.5).px,
      lineHeight: 1.05.em,
    ),
    css('.hero-title', [
      css('&').styles(
        margin: .only(bottom: 10.px),
        color: AppColors.text,
        fontSize: 1.25.rem,
        fontWeight: .w600,
      ),
      css('.accent').styles(color: AppColors.accentWarm),
    ]),
    css('.hero-location').styles(
      margin: .only(bottom: 22.px),
      color: AppColors.muted,
      fontSize: 0.98.rem,
    ),
    css('.hero-summary').styles(
      maxWidth: 540.px,
      margin: .only(bottom: 30.px),
      color: AppColors.muted,
      fontSize: 1.05.rem,
    ),
    css('.hero-actions').styles(
      display: .flex,
      flexWrap: .wrap,
      gap: Gap(row: 14.px, column: 14.px),
      margin: .only(bottom: 30.px),
    ),
    // Buttons (shared).
    css('.btn').styles(
      display: .inlineFlex,
      alignItems: .center,
      justifyContent: .center,
      padding: .symmetric(vertical: 13.px, horizontal: 24.px),
      radius: .circular(10.px),
      fontSize: 0.98.rem,
      fontWeight: .w600,
      cursor: .pointer,
      transition: const Transition.combine([
        Transition('transform', duration: Duration(milliseconds: 150)),
        Transition('box-shadow', duration: Duration(milliseconds: 150)),
      ]),
    ),
    css('.btn:hover').styles(
      transform: const Transform.translate(y: Unit.pixels(-2)),
    ),
    css('.btn-primary').styles(
      color: const Color('#fff'),
      raw: {'background': accentGradient},
    ),
    css('.btn-primary:hover').styles(
      shadow: const BoxShadow(
        offsetX: Unit.zero,
        offsetY: Unit.pixels(10),
        blur: Unit.pixels(26),
        color: Color('rgba(76,141,255,0.35)'),
      ),
      color: const Color('#fff'),
    ),
    css('.btn-ghost', [
      css('&').styles(
        color: AppColors.text,
        border: .all(color: AppColors.border, width: 1.px),
        backgroundColor: AppColors.surface,
      ),
      css('&:hover').styles(
        border: .all(color: AppColors.accent, width: 1.px),
      ),
    ]),
    // Photo.
    css('.hero-photo').styles(
      display: .flex,
      justifyContent: .center,
    ),
    css('.photo-ring', [
      css('&').styles(
        position: .relative(),
        padding: .all(6.px),
        radius: .circular(50.percent),
        raw: {'background': accentGradient},
        shadow: const BoxShadow(
          offsetX: Unit.zero,
          offsetY: Unit.pixels(20),
          blur: Unit.pixels(60),
          color: Color('rgba(76,141,255,0.25)'),
        ),
      ),
      css('img').styles(
        display: .block,
        width: 300.px,
        height: 300.px,
        radius: .circular(50.percent),
        border: .all(color: AppColors.background, width: 4.px),
        raw: {'object-fit': 'cover'},
      ),
    ]),
    // Responsive.
    css.media(MediaQuery.screen(maxWidth: 820.px), [
      css('.hero-inner').styles(
        gridTemplate: const GridTemplate(
          columns: GridTracks([GridTrack(TrackSize.fr(1))]),
        ),
        raw: {'text-align': 'center'},
      ),
      css('.hero-photo').styles(raw: {'grid-row': '1'}),
      css('.hero-summary').styles(
        margin: .symmetric(horizontal: .auto, vertical: .zero),
      ),
      css('.hero-actions, .socials').styles(justifyContent: .center),
      css('.hero-summary').styles(margin: .only(bottom: 30.px)),
    ]),
    css.media(MediaQuery.screen(maxWidth: 480.px), [
      css('.hero-name').styles(fontSize: 2.6.rem),
      css('.photo-ring img').styles(width: 220.px, height: 220.px),
    ]),
  ];
}
