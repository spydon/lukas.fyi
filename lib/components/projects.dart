import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import '../data/resume.dart';

/// A responsive grid of open source projects.
class Projects extends StatelessComponent {
  const Projects({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'projects', classes: 'section', [
      div(classes: 'container', [
        h2(classes: 'section-title', [Component.text('Open Source')]),
        p(classes: 'section-lead', [
          Component.text(
            'A selection of the projects I have created, maintain or '
            'contribute to.',
          ),
        ]),
        div(classes: 'project-grid', [
          for (final project in projects)
            a(
              href: project.url,
              classes: 'project-card',
              attributes: {'target': '_blank', 'rel': 'noopener noreferrer'},
              [
                div(classes: 'project-top', [
                  h3(classes: 'project-name', [Component.text(project.name)]),
                  span(classes: 'project-arrow', [Component.text('↗')]),
                ]),
                p(classes: 'project-desc', [Component.text(project.description)]),
                div(classes: 'project-tags', [
                  for (final tag in project.tags) span(classes: 'tag', [Component.text(tag)]),
                ]),
              ],
            ),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.section-lead').styles(
      maxWidth: 560.px,
      margin: .only(top: Unit.pixels(-16), bottom: 30.px),
      color: AppColors.muted,
    ),
    css('.project-grid').styles(
      display: .grid,
      gap: Gap(row: 20.px, column: 20.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([
          GridTrack.repeat(
            TrackRepeat.autoFill,
            [GridTrack(TrackSize.minmax(TrackSize(Unit.pixels(280)), TrackSize.fr(1)))],
          ),
        ]),
      ),
    ),
    css('.project-card', [
      css('&').styles(
        display: .flex,
        flexDirection: .column,
        padding: .all(24.px),
        radius: .circular(14.px),
        border: .all(color: AppColors.border, width: 1.px),
        color: AppColors.text,
        backgroundColor: AppColors.surface,
        transition: const Transition.combine([
          Transition('transform', duration: Duration(milliseconds: 150)),
          Transition('border-color', duration: Duration(milliseconds: 150)),
        ]),
      ),
      css('&:hover').styles(
        transform: const Transform.translate(y: Unit.pixels(-4)),
        border: .all(color: AppColors.accent, width: 1.px),
        color: AppColors.text,
      ),
      css('&:hover .project-arrow').styles(
        color: AppColors.accentWarm,
        transform: const Transform.translate(x: Unit.pixels(2), y: Unit.pixels(-2)),
      ),
    ]),
    css('.project-top').styles(
      display: .flex,
      justifyContent: .spaceBetween,
      alignItems: .center,
      margin: .only(bottom: 10.px),
    ),
    css('.project-name').styles(fontSize: 1.18.rem),
    css('.project-arrow').styles(
      color: AppColors.faint,
      fontSize: 1.1.rem,
      transition: const Transition('transform', duration: Duration(milliseconds: 150)),
    ),
    css('.project-desc').styles(
      flex: const Flex(grow: 1),
      margin: .only(bottom: 18.px),
      color: AppColors.muted,
      fontSize: 0.96.rem,
    ),
    css('.project-tags').styles(
      display: .flex,
      flexWrap: .wrap,
      gap: Gap(row: 8.px, column: 8.px),
    ),
    css('.tag').styles(
      padding: .symmetric(vertical: 4.px, horizontal: 11.px),
      radius: .circular(7.px),
      border: .all(color: AppColors.border, width: 1.px),
      color: AppColors.muted,
      backgroundColor: AppColors.surfaceAlt,
      fontFamily: const FontFamily.list([
        FontFamily('JetBrains Mono'),
        FontFamilies.monospace,
      ]),
      fontSize: 0.78.rem,
    ),
  ];
}
