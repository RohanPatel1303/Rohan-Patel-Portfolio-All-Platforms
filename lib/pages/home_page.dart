import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../widgets/sections.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 64),
            color: cs.primary.withOpacity(0.7),
            child: Section(
              child: Wrap(
                runSpacing: 24,
                spacing: 48,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 56,
                    backgroundImage:
                        const AssetImage('assets/rohanLinkedInImage.jpeg'),
                    backgroundColor: cs.primary.withOpacity(0.15),
                  ),
                  SizedBox(
                    width: 640,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi I'm Rohan - Flutter Developer",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'I build fast , accessible apps for mobile and web platforms. Here are a few Highlights and recent projects',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Wrap(
                          spacing: 12,
                          runSpacing: 8,
                          children: [
                            FilledButton(
                                onPressed: () => launchUrlString(
                                    'mailto:developerrohan01@gmail.com'),
                                child: const Text("Contact Me")),
                            OutlinedButton(
                                onPressed: () => launchUrlString(
                                    "https://github.com/deadhack1"),
                                child: const Text('Github')),
                            OutlinedButton(
                                onPressed: () => launchUrlString(
                                    'https://www.linkedin.com/in/rohan-flutter-developer',
                                    mode: LaunchMode.platformDefault),
                                child: const Text("Linkedin")),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Section(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Recent Projects",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 16,
              ),
              const Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _Chip('Flutter'),
                  _Chip('Dart'),
                  _Chip('Firebase'),
                  _Chip('REST APIs'),
                  _Chip('CI/CD'),
                  _Chip('State Management'),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip(this.label);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
    );
  }
}
