import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import '../data/resume.dart';

/// A row of circular social media icon links.
class SocialLinks extends StatelessComponent {
  const SocialLinks({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'socials', [
      for (final social in socials)
        a(
          href: social.href,
          attributes: {
            'aria-label': social.label,
            'title': social.label,
            'target': '_blank',
            'rel': 'noopener noreferrer',
          },
          [
            svg(
              viewBox: '0 0 24 24',
              attributes: {'width': '20', 'height': '20'},
              [path([], d: social.icon, fill: AppColors.text)],
            ),
          ],
        ),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.socials', [
      css('&').styles(
        display: .flex,
        flexWrap: .wrap,
        gap: Gap(row: 12.px, column: 12.px),
      ),
      css('a', [
        css('&').styles(
          display: .flex,
          width: 44.px,
          height: 44.px,
          alignItems: .center,
          justifyContent: .center,
          border: .all(color: AppColors.border, width: 1.px),
          radius: .circular(50.percent),
          backgroundColor: AppColors.surface,
          transition: const Transition.combine([
            Transition('transform', duration: Duration(milliseconds: 150)),
            Transition('border-color', duration: Duration(milliseconds: 150)),
            Transition('background-color', duration: Duration(milliseconds: 150)),
          ]),
        ),
        css('&:hover').styles(
          transform: const Transform.translate(y: Unit.pixels(-3)),
          border: .all(color: AppColors.accent, width: 1.px),
          backgroundColor: AppColors.surfaceAlt,
        ),
      ]),
    ]),
  ];
}
