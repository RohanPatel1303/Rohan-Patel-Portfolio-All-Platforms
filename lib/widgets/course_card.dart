import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.title,
    required this.platform,
    required this.date,
    this.credentialUrl,
    this.delay = 0,
  });

  final String title;
  final String platform;
  final String date;
  final String? credentialUrl;
  final int delay;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutQuart,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - value)),
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
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          title: Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text("$platform • $date"),
          trailing: credentialUrl != null
              ? IconButton(
                  icon: const Icon(Icons.open_in_new),
                  onPressed: () => launchUrlString(credentialUrl!),
                )
              : null,
        ),
      ),
    );
  }
}
