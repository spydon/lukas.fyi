import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import '../data/resume.dart';

/// A vertical timeline of work experience.
class Experience extends StatelessComponent {
  const Experience({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'experience', classes: 'section', [
      div(classes: 'container', [
        h2(classes: 'section-title', [Component.text('Experience')]),
        div(classes: 'timeline', [
          for (final job in jobs)
            div(classes: 'timeline-item', [
              div(classes: 'timeline-dot', []),
              div(classes: 'job-card', [
                div(classes: 'job-head', [
                  div(classes: 'job-id', [
                    _logo(job),
                    div(classes: 'job-headings', [
                      h3(classes: 'job-role', [Component.text(job.role)]),
                      p(classes: 'job-company', [
                        if (job.companyUrl != null)
                          a(
                            href: job.companyUrl!,
                            attributes: {'target': '_blank', 'rel': 'noopener'},
                            [Component.text(job.company)],
                          )
                        else
                          span([Component.text(job.company)]),
                        span(classes: 'dot-sep', [Component.text(' • ')]),
                        span(classes: 'job-location', [
                          Component.text(job.location),
                        ]),
                      ]),
                    ]),
                  ]),
                  span(classes: 'job-period', [Component.text(job.period)]),
                ]),
                p(classes: 'job-desc', [Component.text(job.description)]),
                if (job.highlights.isNotEmpty)
                  ul(classes: 'job-highlights', [
                    for (final highlight in job.highlights) li([Component.text(highlight)]),
                  ]),
              ]),
            ]),
        ]),
      ]),
    ]);
  }

  Component _logo(Job job) {
    return div(classes: job.logoTransparent ? 'job-logo job-logo--plain' : 'job-logo', [
      if (job.logo != null)
        img(
          src: job.logo!,
          alt: job.company,
          attributes: {'width': '46', 'height': '46', 'loading': 'lazy'},
        )
      else
        span(classes: 'job-logo-mono', [
          Component.text(job.company.substring(0, 1)),
        ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.timeline').styles(
      position: .relative(),
      padding: .only(left: 28.px),
    ),
    // The vertical line.
    css('.timeline::before').styles(
      position: .absolute(top: 6.px, left: 4.px),
      width: 2.px,
      height: 100.percent,
      raw: {'content': '""', 'background': 'linear-gradient(180deg, #4c8dff, #ff7a3c 70%, transparent)'},
    ),
    css('.timeline-item').styles(
      position: .relative(),
      margin: .only(bottom: 26.px),
    ),
    css('.timeline-dot').styles(
      position: .absolute(top: 24.px, left: Unit.pixels(-28)),
      width: 11.px,
      height: 11.px,
      radius: .circular(50.percent),
      backgroundColor: AppColors.accent,
      border: .all(color: AppColors.background, width: 2.px),
      shadow: const BoxShadow(
        offsetX: Unit.zero,
        offsetY: Unit.zero,
        blur: Unit.pixels(0),
        spread: Unit.pixels(3),
        color: Color('rgba(76,141,255,0.18)'),
      ),
    ),
    css('.job-card', [
      css('&').styles(
        padding: .symmetric(vertical: 22.px, horizontal: 26.px),
        radius: .circular(14.px),
        border: .all(color: AppColors.border, width: 1.px),
        backgroundColor: AppColors.surface,
        transition: const Transition('border-color', duration: Duration(milliseconds: 150)),
      ),
      css('&:hover').styles(
        border: .all(color: AppColors.accent, width: 1.px),
      ),
    ]),
    css('.job-head').styles(
      display: .flex,
      gap: Gap(row: 6.px, column: 16.px),
      justifyContent: .spaceBetween,
      alignItems: .start,
      flexWrap: .wrap,
      margin: .only(bottom: 12.px),
    ),
    css('.job-id').styles(
      display: .flex,
      gap: Gap(column: 14.px),
      alignItems: .center,
    ),
    css('.job-logo', [
      css('&').styles(
        display: .flex,
        width: 46.px,
        height: 46.px,
        alignItems: .center,
        justifyContent: .center,
        flex: const Flex(shrink: 0),
        radius: .circular(11.px),
        overflow: .clip,
        border: .all(color: AppColors.border, width: 1.px),
        backgroundColor: const Color('#fff'),
      ),
      css('img').styles(
        width: 100.percent,
        height: 100.percent,
        raw: {'object-fit': 'cover'},
      ),
      css('.job-logo-mono').styles(
        display: .flex,
        width: 100.percent,
        height: 100.percent,
        alignItems: .center,
        justifyContent: .center,
        color: const Color('#fff'),
        fontSize: 1.2.rem,
        fontWeight: .w800,
        raw: {'background': accentGradient},
      ),
    ]),
    css('.job-logo--plain', [
      css('&').styles(
        border: .unset,
        backgroundColor: Colors.transparent,
      ),
      css('img').styles(raw: {'object-fit': 'contain'}),
    ]),
    css('.job-role').styles(
      fontSize: 1.2.rem,
      margin: .only(bottom: 4.px),
    ),
    css('.job-company', [
      css('&').styles(color: AppColors.muted, fontSize: 0.95.rem),
      css('.dot-sep').styles(color: AppColors.faint),
      css('.job-location').styles(color: AppColors.faint),
    ]),
    css('.job-period').styles(
      padding: .symmetric(vertical: 5.px, horizontal: 12.px),
      radius: .circular(999.px),
      border: .all(color: AppColors.border, width: 1.px),
      color: AppColors.accent,
      backgroundColor: AppColors.surfaceAlt,
      fontSize: 0.82.rem,
      fontWeight: .w600,
      whiteSpace: .noWrap,
    ),
    css('.job-desc').styles(color: AppColors.muted, fontSize: 1.0.rem),
    css('.job-highlights', [
      css('&').styles(
        margin: .only(top: 12.px),
        padding: .only(left: 20.px),
        color: AppColors.muted,
        fontSize: 0.96.rem,
      ),
      css('li').styles(margin: .only(bottom: 6.px)),
    ]),
  ];
}
