import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../constants/theme.dart';
import '../data/resume.dart';

/// Skills grouped by category, plus education and interests.
class Skills extends StatelessComponent {
  const Skills({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'skills', classes: 'section', [
      div(classes: 'container', [
        h2(classes: 'section-title', [Component.text('Skills & Toolbox')]),
        div(classes: 'skill-groups', [
          for (final group in skillGroups)
            div(classes: 'skill-group', [
              h3(classes: 'skill-group-title', [Component.text(group.title)]),
              div(classes: 'skill-tags', [
                for (final skill in group.skills) span(classes: 'tag', [Component.text(skill)]),
              ]),
            ]),
        ]),
        div(classes: 'edu-interests', [
          div(classes: 'edu-block', [
            h3(classes: 'sub-title', [Component.text('Education')]),
            for (final entry in education)
              div(classes: 'edu-card', [
                div(classes: 'edu-head', [
                  h4([Component.text(entry.degree)]),
                  span(classes: 'job-period', [Component.text(entry.period)]),
                ]),
                p(classes: 'edu-school', [Component.text(entry.school)]),
                p(classes: 'edu-desc', [Component.text(entry.description)]),
              ]),
          ]),
          div(classes: 'interest-block', [
            h3(classes: 'sub-title', [Component.text('Beyond Code')]),
            div(classes: 'skill-tags', [
              for (final interest in interests) span(classes: 'tag tag-warm', [Component.text(interest)]),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css('.skill-groups').styles(
      display: .grid,
      gap: Gap(row: 22.px, column: 22.px),
      margin: .only(bottom: 40.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([
          GridTrack.repeat(
            TrackRepeat.autoFill,
            [GridTrack(TrackSize.minmax(TrackSize(Unit.pixels(240)), TrackSize.fr(1)))],
          ),
        ]),
      ),
    ),
    css('.skill-group-title').styles(
      margin: .only(bottom: 14.px),
      color: AppColors.text,
      fontSize: 1.0.rem,
    ),
    css('.skill-tags').styles(
      display: .flex,
      flexWrap: .wrap,
      gap: Gap(row: 9.px, column: 9.px),
    ),
    css('.tag-warm').styles(color: AppColors.accentWarm),
    css('.edu-interests').styles(
      display: .grid,
      gap: Gap(row: 28.px, column: 40.px),
      gridTemplate: const GridTemplate(
        columns: GridTracks([
          GridTrack(TrackSize.minmax(TrackSize(Unit.pixels(260)), TrackSize.fr(1.4))),
          GridTrack(TrackSize.minmax(TrackSize(Unit.pixels(200)), TrackSize.fr(1))),
        ]),
      ),
    ),
    css('.sub-title').styles(
      margin: .only(bottom: 16.px),
      color: AppColors.muted,
      fontSize: 0.82.rem,
      fontWeight: .w700,
      letterSpacing: 1.5.px,
      textTransform: .upperCase,
    ),
    css('.edu-card').styles(
      padding: .symmetric(vertical: 20.px, horizontal: 24.px),
      radius: .circular(14.px),
      border: .all(color: AppColors.border, width: 1.px),
      backgroundColor: AppColors.surface,
    ),
    css('.edu-head').styles(
      display: .flex,
      gap: Gap(row: 6.px, column: 14.px),
      justifyContent: .spaceBetween,
      alignItems: .start,
      flexWrap: .wrap,
      margin: .only(bottom: 6.px),
    ),
    css('.edu-school').styles(
      color: AppColors.accent,
      fontWeight: .w600,
      margin: .only(bottom: 8.px),
    ),
    css('.edu-desc').styles(color: AppColors.muted, fontSize: 0.96.rem),
  ];
}
