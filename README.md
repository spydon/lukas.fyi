# lukas.fyi

My personal resume site, built with [Jaspr](https://jaspr.site) (a Dart web
framework) and statically pre-rendered.

A live version of the project can be seen at https://lukas.fyi

## Prerequisites

- The [Dart SDK](https://dart.dev/get-dart)
- The Jaspr CLI: `dart pub global activate jaspr_cli`

## Develop

Run the dev server with hot reload:

```
jaspr serve
```

## Build

Generate the static site into `build/jaspr`:

```
jaspr build
```

## Editing the content

All of the resume content (profile, experience, projects, skills and
education) lives in `lib/data/resume.dart`, so it can be updated without
touching the layout or styling code.

## Legacy

The previous React/webpack version of the site is kept under `legacy/`.
