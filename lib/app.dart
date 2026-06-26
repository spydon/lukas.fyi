import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'components/experience.dart';
import 'components/footer.dart';
import 'components/hero.dart';
import 'components/nav_bar.dart';
import 'components/projects.dart';
import 'components/skills.dart';

/// The root component of the resume site. Fully static, no client hydration
/// needed; all navigation is handled by anchor links and smooth scrolling.
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      const NavBar(),
      main_(id: 'top', [
        const Hero(),
        const Experience(),
        const Projects(),
        const Skills(),
        const Footer(),
      ]),
    ]);
  }
}
