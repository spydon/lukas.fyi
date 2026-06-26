// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:lukas_fyi/components/experience.dart' as _experience;
import 'package:lukas_fyi/components/footer.dart' as _footer;
import 'package:lukas_fyi/components/hero.dart' as _hero;
import 'package:lukas_fyi/components/nav_bar.dart' as _nav_bar;
import 'package:lukas_fyi/components/projects.dart' as _projects;
import 'package:lukas_fyi/components/skills.dart' as _skills;
import 'package:lukas_fyi/components/social_links.dart' as _social_links;
import 'package:lukas_fyi/constants/theme.dart' as _theme;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  styles: () => [
    ..._theme.styles,
    ..._experience.Experience.styles,
    ..._footer.Footer.styles,
    ..._hero.Hero.styles,
    ..._nav_bar.NavBar.styles,
    ..._projects.Projects.styles,
    ..._skills.Skills.styles,
    ..._social_links.SocialLinks.styles,
  ],
);
