import 'package:flutter/material.dart';
import 'package:rohan_portfolio_website/widgets/sections.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  @override
  Widget build(BuildContext context) {
    return Section(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Projects',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const _ProjectCard(
              title: 'Rohan Portfolio Website',
              description: 'A portfolio website to showcase my work and skills.',
              tech: ['Flutter', 'Dart', 'CI/CD'],
              repoUrl: 'https://github.com/deadhack1/rohan_portfolio_website',
            ),
            const _ProjectCard(
              title: 'Second Project',
              description: 'Another project to demonstrate the scroll functionality.',
              tech: ['Flutter', 'Firebase'],
              repoUrl: 'https://github.com/deadhack1/rohan_portfolio_website',
              demoUrl: 'https://github.com/deadhack1/rohan_portfolio_website',
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    required this.title,
    required this.description,
    required this.tech,
    this.repoUrl,
    this.demoUrl,
  });
  final String title;
  final String description;
  final List<String> tech;
  final String? repoUrl;
  final String? demoUrl;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: const  EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(description),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: tech.map((t) => Chip(label: Text(t))).toList(),
            ),
            const SizedBox(
              height: 12,
            ),
            Wrap(
              spacing: 12,
              children: [
                if (repoUrl != null)
                  OutlinedButton(
                      onPressed: () => launchUrlString(repoUrl!),
                      child: const Text("Source")),
                if (demoUrl != null)
                  OutlinedButton(
                      onPressed: () => launchUrlString(demoUrl!),
                      child: const Text("Live Demo")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
