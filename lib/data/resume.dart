/// All the content for the resume lives here so it is easy to update in one
/// place without touching the layout code.
library;

class Profile {
  const Profile();

  static const String name = 'Lukas Klingsbo';
  static const String title = 'Senior Software Engineer @ Supabase';
  static const String tagline = 'Flutter & Dart GDE · Flame 🔥';
  static const String location = 'Stockholm, Sweden';
  static const String photo = 'images/profile.jpg';

  static const String summary =
      'Senior software engineer specialising in Flutter and Dart. Google '
      'Developer Expert and creator and maintainer of Flame, the most popular '
      'game engine for Flutter. I love building developer tools, open source '
      'ecosystems and the occasional game engine. Currently building the '
      'Flutter SDK at Supabase.';
}

class SocialLink {
  const SocialLink(this.label, this.href, this.handle, this.icon);

  final String label;
  final String href;
  final String handle;

  /// Inline SVG path data for a 24x24 viewBox icon.
  final String icon;
}

class Job {
  const Job({
    required this.role,
    required this.company,
    required this.companyUrl,
    required this.period,
    required this.location,
    required this.description,
    this.logo,
    this.logoTransparent = false,
    this.highlights = const [],
  });

  final String role;
  final String company;
  final String? companyUrl;
  final String period;
  final String location;
  final String description;

  /// Path to the company logo asset, or null to render a monogram fallback.
  final String? logo;

  /// Whether the logo should sit on a transparent tile instead of the default
  /// white one. Use for logos that already read well on a dark background.
  final bool logoTransparent;
  final List<String> highlights;
}

class Project {
  const Project({
    required this.name,
    required this.url,
    required this.description,
    required this.tags,
  });

  final String name;
  final String url;
  final String description;
  final List<String> tags;
}

class SkillGroup {
  const SkillGroup(this.title, this.skills);

  final String title;
  final List<String> skills;
}

class Education {
  const Education({
    required this.degree,
    required this.school,
    required this.period,
    required this.description,
  });

  final String degree;
  final String school;
  final String period;
  final String description;
}

const List<SocialLink> socials = [
  SocialLink(
    'Email',
    'mailto:me@lukas.fyi',
    'me@lukas.fyi',
    'M4 4h16a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2zm0 '
        '2v.01L12 13l8-6.99V6H4zm16 12V8.24l-7.4 6.47a1 1 0 0 1-1.2 0L4 8.24V18h16z',
  ),
  SocialLink(
    'GitHub',
    'https://github.com/spydon',
    'spydon',
    'M12 .297c-6.63 0-12 5.373-12 12 0 5.303 3.438 9.8 8.205 11.385.6.113.82-.258'
        '.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61C4.422 '
        '18.07 3.633 17.7 3.633 17.7c-1.087-.744.084-.729.084-.729 1.205.084 1.838 '
        '1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-'
        '1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303'
        '-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02'
        '.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 '
        '3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 '
        '1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 '
        '22.092 24 17.592 24 12.297c0-6.627-5.373-12-12-12',
  ),
  SocialLink(
    'LinkedIn',
    'https://linkedin.com/in/spydon',
    'in/spydon',
    'M4.98 3.5a2.5 2.5 0 1 1 0 5 2.5 2.5 0 0 1 0-5zM3 9h4v12H3V9zm7 0h3.8v1.65h'
        '.05c.53-.95 1.83-1.95 3.77-1.95 4.03 0 4.78 2.5 4.78 5.75V21h-4v-5.3c0-'
        '1.27-.02-2.9-1.77-2.9-1.77 0-2.04 1.38-2.04 2.81V21h-4V9z',
  ),
  SocialLink(
    'X',
    'https://x.com/spydon',
    '@spydon',
    'M18.244 2.25h3.308l-7.227 8.26 8.502 11.24h-6.66l-5.214-6.817L4.99 21.75H'
        '1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 '
        '4.126H5.117z',
  ),
  SocialLink(
    'Mastodon',
    'https://fosstodon.org/@spydon',
    '@spydon@fosstodon.org',
    'M21.58 13.9c-.29 1.5-2.6 3.13-5.25 3.45-1.38.16-2.74.32-4.19.26-2.37-.11'
        '-4.24-.57-4.24-.57 0 .24.01.46.04.66.31 2.33 2.31 2.47 4.21 2.54 1.92'
        '.06 3.62-.48 3.62-.48l.08 1.73s-1.34.72-3.72.85c-1.31.07-2.94-.03-4.84'
        '-.54C3.16 21.13 2.45 16.74 2.34 12.3c-.03-1.32-.01-2.56-.01-3.6 0-4.53'
        '2.97-5.86 2.97-5.86 1.5-.69 4.07-.98 6.74-1h.07c2.67.02 5.24.31 6.74 1'
        '0 0 2.97 1.33 2.97 5.86 0 0 .04 3.34-.41 5.2zM18.4 9.13c0-1.12-.29-2.01'
        '-.86-2.67-.59-.66-1.36-1-2.32-1-1.11 0-1.95.43-2.5 1.28l-.54.91-.54-.91'
        'c-.55-.85-1.39-1.28-2.5-1.28-.96 0-1.73.34-2.32 1-.57.66-.86 1.55-.86 '
        '2.67v4.57h1.81V9.27c0-1.12.47-1.69 1.41-1.69 1.04 0 1.57.68 1.57 2v2.91'
        'h1.8v-2.91c0-1.32.53-2 1.57-2 .94 0 1.41.57 1.41 1.69v4.43h1.81V9.13z',
  ),
  SocialLink(
    'Bluesky',
    'https://bsky.app/profile/spydon.dev',
    '@spydon.dev',
    'M5.77 3.74C8.34 5.67 11.1 9.6 12 11.71c.9-2.11 3.66-6.04 6.23-7.97C20.08 '
        '2.35 23 1.28 23 4.62c0 .67-.38 5.6-.61 6.4-.78 2.78-3.61 3.49-6.13 '
        '3.06 4.41.75 5.53 3.24 3.11 5.73-4.6 4.73-6.6-1.18-7.12-2.69-.09-.27'
        '-.14-.4-.25-.4s-.16.13-.25.4c-.52 1.51-2.52 7.42-7.12 2.69-2.42-2.49'
        '-1.3-4.98 3.11-5.73-2.52.43-5.35-.28-6.13-3.06C1.38 10.22 1 5.29 1 '
        '4.62 1 1.28 3.92 2.35 5.77 3.74z',
  ),
];

const List<Job> jobs = [
  Job(
    role: 'SDK Engineer',
    company: 'Supabase',
    companyUrl: 'https://supabase.com',
    period: '2026 – Present',
    location: 'Remote',
    logo: 'images/logos/supabase.png',
    description:
        'Building and maintaining the Flutter SDK for Supabase, the open source '
        'Firebase alternative.',
    highlights: [
      'Develop and maintain the official supabase-flutter client libraries.',
      'Shape the developer experience for Flutter developers on Supabase.',
    ],
  ),
  Job(
    role: 'Blue Fire · Flame Engine',
    company: 'Open Source',
    companyUrl: 'https://flame-engine.org',
    period: '2019 – Present',
    location: 'Worldwide',
    logo: 'images/logos/flame.png',
    logoTransparent: true,
    description:
        'Creator and lead maintainer of Flame, the most popular 2D game engine '
        'for Flutter, and a member of the Blue Fire open source collective.',
    highlights: [
      'Grew Flame into a thriving ecosystem with thousands of GitHub stars and '
          'a large community of contributors.',
      'Maintain core packages such as Forge2D, the audioplayers plugin and '
          'numerous Flame bridge packages.',
    ],
  ),
  Job(
    role: 'Senior Software Engineer',
    company: 'Amara',
    companyUrl: 'https://amara.app',
    period: '2025 – 2026',
    location: 'Berlin, Germany',
    logo: 'images/logos/amara.png',
    logoTransparent: true,
    description:
        'Built cross-platform applications and internal tooling with Flutter '
        'and Dart.',
  ),
  Job(
    role: 'Senior Software Engineer',
    company: 'Canonical',
    companyUrl: 'https://canonical.com',
    period: '2023 – 2025',
    location: 'Remote',
    logo: 'images/logos/canonical.png',
    description:
        "Mainly building Ubuntu's OS installer in Flutter, but also the App "
        'Center, Firmware updater, Security center and OEM tools.',
  ),
  Job(
    role: 'Senior Software Engineer',
    company: 'Skandia',
    companyUrl: 'https://skandia.se',
    period: '2022 – 2023',
    location: 'Stockholm, Sweden',
    logo: 'images/logos/skandia.png',
    description:
        "Rebuilding Skandiabanken's previously outsourced native app in "
        'Flutter, with a new design and lots of new bells and whistles.',
  ),
  Job(
    role: 'Senior Software Engineer',
    company: 'Klarna',
    companyUrl: 'https://klarna.com',
    period: '2017 – 2021',
    location: 'Stockholm, Sweden',
    logo: 'images/logos/klarna.png',
    description:
        'Built the services for credit card payments and provided a uniform '
        'API to several underlying services, in Erlang and Scala.',
  ),
  Job(
    role: 'Software Engineer',
    company: 'DICE (EA)',
    companyUrl: 'https://dice.se',
    period: '2016 – 2017',
    location: 'Stockholm, Sweden',
    logo: 'images/logos/dice.png',
    description:
        'Built scalable backend services for Battlefield 1, such as the '
        'recommendations engine, serving 22M users.',
  ),
  Job(
    role: 'Software Engineer',
    company: 'Ericsson & SICS',
    companyUrl: 'https://ericsson.com',
    period: '2014 – 2015',
    location: 'Stockholm, Sweden',
    logo: 'images/logos/ericsson.png',
    description:
        'Built an information-centric network in Erlang for live video '
        'streaming with an accompanying Android application, deployed at the '
        'Skiing World Championship in Falun 2015.',
  ),
];

const List<Project> projects = [
  Project(
    name: 'Flame',
    url: 'https://github.com/flame-engine/flame',
    description:
        'A modular Flutter game engine that provides a complete set of '
        'out-of-the-way solutions for building games.',
    tags: ['Dart', 'Flutter', 'Game Engine'],
  ),
  Project(
    name: 'Forge2D',
    url: 'https://github.com/flame-engine/forge2d',
    description: 'A Dart port of the Box2D physics engine.',
    tags: ['Dart', 'Physics'],
  ),
  Project(
    name: 'Melos',
    url: 'https://github.com/invertase/melos',
    description:
        'A command line tool for managing Dart and Flutter monorepos with '
        'multiple packages.',
    tags: ['Dart', 'Tooling', 'Monorepo'],
  ),
  Project(
    name: 'audioplayers',
    url: 'https://github.com/bluefireteam/audioplayers',
    description:
        'A Flutter plugin to play multiple simultaneously audio files, works '
        'on every platform.',
    tags: ['Dart', 'Flutter', 'Audio'],
  ),
  Project(
    name: 'Ubuntu Flutter',
    url: 'https://github.com/canonical/ubuntu-flutter-plugins',
    description:
        'Contributions to the Flutter ecosystem powering the Ubuntu desktop '
        'installer and provisioning tooling.',
    tags: ['Dart', 'Flutter', 'Linux'],
  ),
  Project(
    name: 'QMK Firmware',
    url: 'https://github.com/qmk/qmk_firmware',
    description:
        'Keyboard controller firmware, used to run my split ergonomic Dactyl '
        'Manuform keyboard.',
    tags: ['C', 'Firmware', 'Keyboards'],
  ),
];

const List<SkillGroup> skillGroups = [
  SkillGroup('Languages', [
    'Dart',
    'Scala',
    'Erlang',
    'Haskell',
    'Java',
    'Python',
    'JavaScript',
    'Bash',
    'SML',
  ]),
  SkillGroup('Frameworks', ['Flutter', 'Flame', 'React', 'GWT']),
  SkillGroup('Cloud & DevOps', [
    'AWS',
    'Docker',
    'Terraform',
    'Ansible',
    'Nginx',
    'CI/CD',
  ]),
  SkillGroup('Data', ['PostgreSQL', 'MySQL', 'MariaDB', 'MongoDB', 'Riak']),
  SkillGroup('Tools & Systems', [
    'Linux',
    'Git',
    'Vim',
    'Zsh',
    'Melos',
    'Gradle',
    'SBT',
    'Arch',
    'Debian',
  ]),
];

const List<Education> education = [
  Education(
    degree: 'Master of Computer Science',
    school: 'Uppsala University',
    period: '2013 – 2015',
    description:
        'Master thesis at DICE (EA): "A Security Management Layer for CDN '
        'Assets".',
  ),
  Education(
    degree: 'Bachelor of Computer Science',
    school: 'Uppsala University',
    period: '2009 – 2012',
    description:
        'Bachelor thesis at Kivra: "NoSQL: Moving from MapReduce Batch Jobs to '
        'Event-Driven Data Collection".',
  ),
];

const List<String> interests = [
  'Open Source',
  'Mechanical Keyboards',
  'Climbing',
  'Backpacking',
  'Linux',
];
