import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';

const _links = [
  (label: 'About', href: '#about'),
  (label: 'Experience', href: '#experience'),
  (label: 'Open Source', href: '#projects'),
  (label: 'Skills', href: '#skills'),
  (label: 'Contact', href: '#contact'),
];

/// A sticky top navigation bar with anchor links to each section.
class NavBar extends StatelessComponent {
  const NavBar({super.key});

  @override
  Component build(BuildContext context) {
    return header(classes: 'nav', [
      div(classes: 'container nav-inner', [
        a(href: '#top', classes: 'brand', [
          img(
            classes: 'brand-mark',
            src: 'images/favicon.png',
            alt: 'Flame',
            attributes: {'width': '34', 'height': '34'},
          ),
          span(classes: 'brand-name', [Component.text('Lukas Klingsbo')]),
        ]),
        nav(classes: 'nav-links', [
          for (final link in _links) a(href: link.href, [Component.text(link.label)]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.nav', [
      css('&').styles(
        position: .sticky(top: .zero),
        zIndex: const ZIndex(100),
        backgroundColor: const Color('rgba(10,14,22,0.72)'),
        border: .only(
          bottom: .solid(color: AppColors.border, width: 1.px),
        ),
        raw: {
          'backdrop-filter': 'blur(12px)',
          '-webkit-backdrop-filter': 'blur(12px)',
        },
      ),
      css('.nav-inner').styles(
        display: .flex,
        height: 64.px,
        alignItems: .center,
        justifyContent: .spaceBetween,
        gap: Gap(column: 16.px),
      ),
      css('.brand', [
        css('&').styles(
          display: .flex,
          gap: Gap(column: 12.px),
          alignItems: .center,
          color: AppColors.text,
          fontWeight: .w700,
        ),
        css('.brand-mark').styles(
          display: .block,
          width: 34.px,
          height: 34.px,
          raw: {'object-fit': 'contain'},
        ),
      ]),
      css('.nav-links', [
        css('&').styles(
          display: .flex,
          gap: Gap(column: 26.px),
          alignItems: .center,
        ),
        css('a', [
          css('&').styles(
            color: AppColors.muted,
            fontSize: 0.95.rem,
            fontWeight: .w500,
          ),
          css('&:hover').styles(color: AppColors.text),
        ]),
      ]),
    ]),
    css.media(MediaQuery.screen(maxWidth: 720.px), [
      css('.nav .nav-links').styles(display: .none),
      css('.nav .brand-name').styles(display: .none),
    ]),
  ];
}
