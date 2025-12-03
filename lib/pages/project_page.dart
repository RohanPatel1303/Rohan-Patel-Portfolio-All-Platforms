import 'package:flutter/material.dart';
import 'package:rohan_portfolio_website/widgets/sections.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectData {
  final String title;
  final String description;
  final List<String> tech;
  final String? repoUrl;
  final String? demoUrl;

  const ProjectData({
    required this.title,
    required this.description,
    required this.tech,
    this.repoUrl,
    this.demoUrl,
  });
}

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final List<ProjectData> _projects = const [
    ProjectData(
      title: 'Rohan Portfolio Website',
      description: 'A portfolio website to showcase my work and skills.',
      tech: ['Flutter', 'Dart', 'CI/CD', 'Freezed', 'GoRouter'],
      repoUrl:
      'https://github.com/RohanPatel1303/Rohan-Patel-Portfolio-All-Platforms.git',
      demoUrl: "https://rohandeadhackportfolio.netlify.app",
    ),
    ProjectData(
      title: 'Pocket Budget',
      description:
      "Pocket Budget is a clean, cross-platform expense tracker built with Flutter. It helps you manage your finances with a simple interface to add, view, and edit expenditures.\n\nCore Concepts & Packages:\n• flutter_riverpod for state management.\n• drift for local data storage.\n• go_router for navigation.",
      tech: ['Flutter', 'Dart', 'Riverpod', 'GoRouter', 'Freezed', 'Drift'],
      repoUrl: 'https://github.com/deadhack1/rohan_portfolio_website',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Section(
      // 1. Add SingleChildScrollView back to allow vertical scrolling
      child: SingleChildScrollView(
        child: SizedBox(
          // 2. Force full width so GridView can calculate crossAxis count
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Projects',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              // 3. Keep LayoutBuilder to solve the "crossAxisExtent > 0" error
              LayoutBuilder(builder: (context, constraints) {
                // Guard against layout passes where width isn't ready
                if (constraints.maxWidth == 0) {
                  return const SizedBox.shrink();
                }

                return GridView.builder(
                  // 4. Keep shrinkWrap and physics to make it behave inside the ScrollView
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 500,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    mainAxisExtent: 350,
                  ),
                  itemCount: _projects.length,
                  itemBuilder: (context, index) {
                    final project = _projects[index];
                    return _ProjectCard(
                      title: project.title,
                      description: project.description,
                      tech: project.tech,
                      repoUrl: project.repoUrl,
                      demoUrl: project.demoUrl,
                    );
                  },
                );
              }),
            ],
          ),
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
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Theme.of(context).dividerColor,
          width: 2,
        ),
      ),
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Text(
                description,
                overflow: TextOverflow.ellipsis,
                maxLines: 8,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: tech.map((t) => Chip(label: Text(t))).toList(),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              children: [
                if (repoUrl != null)
                  OutlinedButton(
                    onPressed: () => launchUrlString(repoUrl!),
                    child: const Text("Source"),
                  ),
                if (demoUrl != null)
                  OutlinedButton(
                    onPressed: () => launchUrlString(demoUrl!),
                    child: const Text("Live Demo"),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
