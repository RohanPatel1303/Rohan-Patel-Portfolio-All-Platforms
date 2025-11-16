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
              tech: ['Flutter', 'Dart', 'CI/CD','Freezed','GoRouter'],
              repoUrl: 'https://github.com/RohanPatel1303/Rohan-Patel-Portfolio-All-Platforms.git',
              demoUrl: "https://rohandeadhackportfolio.netlify.app",
            ),
            const _ProjectCard(
              title: 'Pocket Budget',
              description: "Pocket Budget is a clean, cross-platform expense tracker built with Flutter. It helps you manage your finances with a simple interface to add, view, and edit expenditures.Because it's built with Flutter, Pocket Budget runs seamlessly on mobile (iOS/Android), web, and desktop from a single codebase.Core Concepts & Packages:\nThe app uses a modern, reactive architecture powered by:\n•flutter_riverpod for scalable state management.\n•drift (a reactive persistence library) for fast and reliable local data storage on any platform.\n•go_router for declarative, URL-based navigation.\n•freezed for creating immutable, type-safe data models.",
              tech: ['Flutter','Dart','Riverpod','GoRouter','Freezed','Drift'],
              repoUrl: 'https://github.com/deadhack1/rohan_portfolio_website',
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
