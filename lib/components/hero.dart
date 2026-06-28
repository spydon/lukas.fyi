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
      alignItems: .center,
      gridTemplate: const GridTemplate(
        columns: GridTracks([GridTrack(TrackSize.fr(1.4)), GridTrack(TrackSize.fr(1))]),
      ),
      gap: Gap(row: 40.px, column: 56.px),
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
      margin: .only(bottom: 30.px),
      flexWrap: .wrap,
      gap: Gap(row: 14.px, column: 14.px),
    ),
    // Buttons (shared).
    css('.btn').styles(
      display: .inlineFlex,
      padding: .symmetric(vertical: 13.px, horizontal: 24.px),
      radius: .circular(10.px),
      cursor: .pointer,
      transition: const Transition.combine([
        Transition('transform', duration: Duration(milliseconds: 150)),
        Transition('box-shadow', duration: Duration(milliseconds: 150)),
      ]),
      justifyContent: .center,
      alignItems: .center,
      fontSize: 0.98.rem,
      fontWeight: .w600,
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
        border: .all(color: AppColors.border, width: 1.px),
        color: AppColors.text,
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
    css.keyframes('photo-ring-spin', {
      'to': const Styles(transform: Transform.rotate(Angle.deg(360))),
    }),
    css('.photo-ring', [
      css('&').styles(
        position: .relative(),
        padding: .all(6.px),
        radius: .circular(50.percent),
        shadow: const BoxShadow(
          offsetX: Unit.zero,
          offsetY: Unit.pixels(20),
          blur: Unit.pixels(60),
          color: Color('rgba(76,141,255,0.25)'),
        ),
        transition: const Transition.combine([
          Transition(
            'transform',
            duration: Duration(milliseconds: 500),
            curve: Curve.cubicBezier(0.34, 1.56, 0.64, 1),
          ),
          Transition('box-shadow', duration: Duration(milliseconds: 500)),
        ]),
        raw: {'background': accentGradient, 'isolation': 'isolate'},
      ),
      // Sharp rotating flame ring, revealed on hover.
      css('&::before').styles(
        position: .absolute(top: .zero, left: .zero, bottom: .zero, right: .zero),
        radius: .circular(50.percent),
        raw: {
          'content': '""',
          'background': 'conic-gradient(from 0deg, #4c8dff, #ff7a3c, #ffb347, #4c8dff)',
          'z-index': '0',
          'opacity': '0',
          'transition': 'opacity 400ms ease',
          'animation': 'photo-ring-spin 4s linear infinite',
          'animation-play-state': 'paused',
        },
      ),
      // Soft blurred glow halo behind the photo.
      css('&::after').styles(
        position: .absolute(
          top: (-16).px,
          left: (-16).px,
          bottom: (-16).px,
          right: (-16).px,
        ),
        radius: .circular(50.percent),
        raw: {
          'content': '""',
          'background': 'conic-gradient(from 0deg, #4c8dff, #ff7a3c, #ffb347, #4c8dff)',
          'filter': 'blur(28px)',
          'z-index': '-1',
          'opacity': '0',
          'transition': 'opacity 400ms ease',
          'animation': 'photo-ring-spin 4s linear infinite',
          'animation-play-state': 'paused',
        },
      ),
      css('img').styles(
        display: .block,
        position: .relative(),
        width: 300.px,
        height: 300.px,
        border: .all(color: AppColors.background, width: 4.px),
        radius: .circular(50.percent),
        raw: {
          'object-fit': 'cover',
          'z-index': '1',
          'transition': 'transform 500ms cubic-bezier(0.34,1.56,0.64,1), filter 500ms ease',
        },
      ),
    ]),
    css('.photo-ring:hover', [
      css('&').styles(
        shadow: const BoxShadow(
          offsetX: Unit.zero,
          offsetY: Unit.pixels(28),
          blur: Unit.pixels(80),
          color: Color('rgba(255,122,60,0.4)'),
        ),
        transform: const Transform.scale(1.05),
      ),
      css('&::before').styles(
        raw: {'opacity': '1', 'animation-play-state': 'running'},
      ),
      css('&::after').styles(
        raw: {'opacity': '0.85', 'animation-play-state': 'running'},
      ),
      css('img').styles(
        transform: const Transform.scale(1.06),
        raw: {'filter': 'saturate(1.2) brightness(1.05)'},
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
