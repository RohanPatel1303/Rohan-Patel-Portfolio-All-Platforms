import 'package:flutter/material.dart';
import 'package:rohan_portfolio_website/widgets/sections.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Me',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const Text(
              'I am a passionate Flutter developer with a love for creating beautiful and functional applications. I have experience in building multi-platform apps for mobile and web.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),
            const Text(
              'My journey into programming started with a curiosity for how things work, and it has led me down a path of continuous learning and growth. When I\'m not coding, I enjoy exploring new technologies, contributing to open-source projects, and drinking coffee.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
