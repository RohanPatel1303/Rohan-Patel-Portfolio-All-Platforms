import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../widgets/sections.dart';

//import the custom defined util for opening resume.
import '../utils/resume_opener.dart' as resume;

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
            color: cs.primary.withValues(alpha: 0.7),
            child: Section(
              child: Wrap(
                runSpacing: 24,
                spacing: 48,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 56,
                    backgroundImage: const AssetImage(
                      'assets/rohanLinkedInImage.jpeg',
                    ),
                    backgroundColor: cs.primary.withValues(alpha: 0.15),
                  ),
                  SizedBox(
                    width: 640,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hi I'm Rohan - Flutter Developer",
                          style: Theme.of(context).textTheme.headlineSmall!
                              .copyWith(fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'I’m a Master of Computer Science student with a strong focus on Flutter app development. I build scalable, responsive mobile apps, handle API integrations, manage state with tools like GetX and Riverpod, and maintain clean version control through GitHub. I’m comfortable debugging across platforms, improving performance, and delivering polished UI experiences. I pick up new frameworks quickly and enjoy turning product requirements into smooth, reliable features that feel natural to users.',
                          // 'I build fast , accessible apps for mobile and web platforms.Currently Looking For Full Time Opportunities.',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 12,
                          runSpacing: 8,
                          children: [
                            FilledButton(
                              onPressed: () => launchUrlString(
                                'mailto:developerrohan01@gmail.com',
                              ),
                              child: const Text("Email"),
                            ),
                            FilledButton(
                              onPressed: () => launchUrlString(
                                "https://github.com/deadhack1",
                              ),
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  Colors.green,
                                ),
                                foregroundColor: WidgetStatePropertyAll(
                                  Colors.black,
                                ),
                              ),
                              child: const Text('Github'),
                            ),
                            FilledButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  Colors.white,
                                ),
                                foregroundColor: WidgetStatePropertyAll(
                                  Colors.blue,
                                ),
                              ),
                              onPressed: () => launchUrlString(
                                'https://www.linkedin.com/in/rohan-flutter-developer',
                                mode: LaunchMode.platformDefault,
                              ),
                              child: const Text("Linkedin"),
                            ),
                            FilledButton(
                              onPressed: _openResume,
                              child: Text("Resume"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Section(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tech Stack",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _Chip('Flutter'),
                    _Chip('Dart'),
                    _Chip('Firebase'),
                    _Chip('REST APIs'),
                    _Chip('GetX'),
                    _Chip('Riverpod'),
                    _Chip('Git'),
                    _Chip('GitHub'),
                    _Chip('Supabase'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _openResume() async {
    try {
      await resume.openResume();
    } catch (e) {
      SnackBar(content: Text(e.toString()));
    }
  }
}

class _Chip extends StatelessWidget {
  const _Chip(this.label);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(label));
  }
}
