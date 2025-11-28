import 'package:url_launcher/url_launcher.dart';

Future<void> openResume()async{
  final uri=Uri.parse('assets/Rohan Patel Resume November 2025.pdf');
  await launchUrl(uri,webOnlyWindowName: '_blank');
}