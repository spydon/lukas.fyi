/// The entrypoint for the **server** environment.
///
/// The [main] method will only be executed on the server during pre-rendering.
/// To run code on the client, check the `main.client.dart` file.
library;

import 'package:jaspr/dom.dart';
import 'package:jaspr/server.dart';

import 'app.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.server.options.dart';

void main() {
  Jaspr.initializeApp(
    options: defaultServerOptions,
  );

  runApp(
    Document(
      title: 'Lukas Klingsbo — Senior Software Engineer',
      lang: 'en',
      meta: {
        'description':
            'Lukas Klingsbo (spydon) is a senior software engineer and '
            'Flutter & Dart Google Developer Expert. Creator of the Flame game '
            'engine, based in Stockholm, Sweden.',
        'author': 'Lukas Klingsbo',
        'theme-color': '#0a0e16',
        'og:title': 'Lukas Klingsbo — Senior Software Engineer',
        'og:description':
            'Flutter & Dart GDE, creator of the Flame game engine. '
            'Currently building the Flutter SDK at Supabase.',
        'og:type': 'website',
        'og:url': 'https://lukas.fyi',
        'twitter:card': 'summary',
        'twitter:creator': '@spydon',
      },
      head: const [
        link(rel: 'icon', type: 'image/png', href: 'images/favicon.png'),
      ],
      body: const App(),
    ),
  );
}
