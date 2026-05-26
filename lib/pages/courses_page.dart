import 'package:flutter/material.dart';
import 'package:rohan_portfolio_website/widgets/course_card.dart';
import 'package:rohan_portfolio_website/widgets/sections.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Courses & Certifications',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 24),
            const CourseCard(
              title: "Flutter & Dart - The Complete Guide",
              platform: "Udemy",
              date: "2023",
            ),
            const SizedBox(height: 12),
            const CourseCard(
              title: "The Complete 2023 Web Development Bootcamp",
              platform: "Udemy",
              date: "2023",
            ),
            const SizedBox(height: 12),
            const CourseCard(
              title: "Google Data Analytics Professional Certificate",
              platform: "Coursera",
              date: "2024",
            ),
            const SizedBox(height: 12),
            const CourseCard(
              title: "Postman API Fundamentals Student Expert",
              platform: "Postman",
              date: "2024",
            ),
          ],
        ),
      ),
    );
  }
}
