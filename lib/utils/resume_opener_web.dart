import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

Future<void> openResume() async {
  const fileName = 'Rohan Patel Resume November 2025.pdf';

  // Check if the app is running in Release mode (Netlify/Production)
  // or Debug mode (Localhost).
  String path = kReleaseMode
      ? 'assets/assets/$fileName' // Netlify path
      : 'assets/$fileName'; // Local path

  final url = Uri.parse(path);

  await launchUrl(url, webOnlyWindowName: '_blank');
}
