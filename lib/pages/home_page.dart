import 'package:flutter/material.dart';
import 'package:rohan_portfolio_website/widgets/fade_slide_in.dart';
import 'package:rohan_portfolio_website/widgets/course_card.dart';
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
          FadeSlideIn(
            duration: Duration(milliseconds: 800),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 64),
              color: cs.surface,
              child: Section(
                child: Wrap(
                  runSpacing: 24,
                  spacing: 48,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    TweenAnimationBuilder<double>(
                      tween: Tween<double>(begin: 0.0, end: 1.0),
                      duration: const Duration(seconds: 10),
                      curve: Curves.elasticOut, // The "Cool" bounce effect
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: child,
                        );
                      },
                      child: CircleAvatar(
                        radius: 56,
                        backgroundImage: const AssetImage(
                          'assets/rohanLinkedInImage.jpeg',
                        ),
                        backgroundColor: cs.primary.withValues(alpha: 0.15),
                      ),
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
                            'I build scalable, responsive mobile apps, handle API integrations, manage state with tools like GetX and Riverpod, and maintain clean version control through GitHub. I’m comfortable debugging across platforms, improving performance, and delivering polished UI experiences. I pick up new frameworks quickly and enjoy turning product requirements into smooth, reliable features that feel natural to users.',
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
                                    Color(0XFF0a66c2),
                                  ),
                                  foregroundColor: WidgetStatePropertyAll(
                                    Colors.white,
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
                    _Chip('Go Router'),
                    _Chip('Git'),
                    _Chip('GitHub'),
                    _Chip('Supabase'),
                  ],
                ),
              ],
            ),
          ),
          Section(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Experience",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // 1. Current GTA Role (CSU)
                _ExperienceCard(
                  role: "Graduate Teaching Assistant",
                  company: "Cleveland State University",
                  date: "Aug 2025 – Dec 2025",
                  description:
                  "Assisting in teaching Data Science and Computer Architecture. Guiding students through lab assignments, grading projects on machine learning basics, CPU design, and memory hierarchy. Holding office hours to provide one-on-one academic support.",
                  skills: const ['Teaching', 'Data Science', 'Machine Learning', 'Computer Architecture'],
                  delay: 0,
                ),

                const SizedBox(height: 16),

                // 2. Previous GTA Role (CSU)
                _ExperienceCard(
                  role: "Graduate Teaching Assistant",
                  company: "Cleveland State University",
                  date: "Jan 2025 – May 2025",
                  description:
                  "Taught core CS concepts including algorithms (sorting, recursion) and data structures (trees, stacks). Proctored exams, graded coding assignments for over 40 students, and acted as the primary contact for resolving queries regarding algorithm design.",
                  skills: const ['Algorithms', 'Data Structures', 'Mentoring'],
                  delay: 200,
                ),

                const SizedBox(height: 16),

                // 3. App Developer Intern (TechElecon)
                _ExperienceCard(
                  role: "App Developer Intern",
                  company: "TechElecon Pvt Ltd",
                  date: "Jan 2023 – Nov 2023",
                  description:
                  "Developed Flutter-based mobile applications including 'Kaizen' (published on Play Store) and an internal Canteen billing app. Integrated user authentication, QR scanning, and real-time data sync. Led a group of interns and gathered direct user feedback to improve UX.",
                  skills: const ['Flutter', 'Dart', 'Firebase', 'Play Store Publishing', 'Team Leadership'],
                  delay: 400,
                ),
              ],
            ),
          ),
          Section(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Courses & Certifications",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                CourseCard(
                  title: "Flutter & Dart - The Complete Guide",
                  platform: "Udemy",
                  date: "2023",
                ),
                const SizedBox(height: 12),
                CourseCard(
                  title: "The Complete 2023 Web Development Bootcamp",
                  platform: "Udemy",
                  date: "2023",
                ),
                const SizedBox(height: 12),
                CourseCard(
                  title: "Google Data Analytics Professional Certificate",
                  platform: "Coursera",
                  date: "2024",
                ),
                const SizedBox(height: 12),
                CourseCard(
                  title: "Postman API Fundamentals Student Expert",
                  platform: "Postman",
                  date: "2024",
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

class _ExperienceCard extends StatelessWidget {
  const _ExperienceCard({
    required this.role,
    required this.company,
    required this.date,
    required this.description,
    this.skills = const [],
    this.delay = 0,  });

  final String role;
  final String company;
  final String date;
  final String description;
  final List<String> skills;
  final int delay;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Animation: Slide Up + Fade In
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutQuart,
      builder: (context, value, child) {
        // Create a delay effect by adjusting the opacity/transform based on value
        // Note: For true staggering, a sophisticated list is better,
        // but this works for simple layouts.
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 50 * (1 - value)), // Slide up 50px
            child: child,
          ),
        );
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: theme.colorScheme.outlineVariant),
        ),
        color: theme.colorScheme.surfaceContainerLow,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: Role & Date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          role,
                          style: theme.textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          company,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      date,
                      style: theme.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Description
              Text(
                description,
                style: theme.textTheme.bodyMedium?.copyWith(
                  height: 1.5,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16),
              // Skill Chips
              if (skills.isNotEmpty)
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: skills.map((skill) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        skill,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
