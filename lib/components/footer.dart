import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import '../data/resume.dart';
import 'social_links.dart';

/// The closing contact call to action and footer.
class Footer extends StatelessComponent {
  const Footer({super.key});

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      section(id: 'contact', classes: 'section contact', [
        div(classes: 'container contact-inner', [
          h2(classes: 'contact-title', [
            Component.text("Let's build something"),
          ]),
          p(classes: 'contact-lead', [
            Component.text('Got something to share or a question to ask?'),
            br(),
            Component.text('My inbox is always open.'),
          ]),
          a(
            href: 'mailto:me@lukas.fyi',
            classes: 'btn btn-primary contact-btn',
            [Component.text('me@lukas.fyi')],
          ),
          const SocialLinks(),
        ]),
      ]),
      footer(classes: 'footer', [
        div(classes: 'container footer-inner', [
          span([Component.text('© ${Profile.name}')]),
          span(classes: 'footer-built', [
            Component.text('Built with '),
            a(
              href: 'https://jaspr.site',
              attributes: {'target': '_blank', 'rel': 'noopener'},
              [Component.text('Jaspr')],
            ),
            Component.text(' & Dart'),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.contact .contact-inner').styles(
      display: .flex,
      flexDirection: .column,
      alignItems: .center,
      padding: .symmetric(vertical: 40.px, horizontal: 32.px),
      radius: .circular(20.px),
      border: .all(color: AppColors.border, width: 1.px),
      backgroundColor: AppColors.surface,
      raw: {
        'text-align': 'center',
        'background-image':
            'radial-gradient(40rem 20rem at 50% -40%, rgba(76,141,255,0.16), transparent 70%)',
      },
    ),
    css('.contact-title').styles(
      margin: .only(bottom: 12.px),
      fontSize: 2.rem,
      letterSpacing: (-0.8).px,
    ),
    css('.contact-lead').styles(
      maxWidth: 460.px,
      margin: .only(bottom: 26.px),
      color: AppColors.muted,
      fontSize: 1.05.rem,
    ),
    css('.contact-btn').styles(
      margin: .only(bottom: 28.px),
      fontFamily: const FontFamily.list([
        FontFamily('JetBrains Mono'),
        FontFamilies.monospace,
      ]),
    ),
    css('.contact .socials').styles(justifyContent: .center),
    css('.footer').styles(
      margin: .only(top: 20.px),
      padding: .symmetric(vertical: 30.px),
      border: .only(
        top: .solid(color: AppColors.border, width: 1.px),
      ),
    ),
    css('.footer-inner', [
      css('&').styles(
        display: .flex,
        gap: Gap(row: 8.px, column: 16.px),
        justifyContent: .spaceBetween,
        flexWrap: .wrap,
        color: AppColors.faint,
        fontSize: 0.9.rem,
      ),
    ]),
  ];
}
