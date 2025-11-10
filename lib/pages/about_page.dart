import 'package:flutter/cupertino.dart';
import 'package:rohan_portfolio_website/widgets/sections.dart';

class AboutPage extends StatelessWidget{
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement The UI of the About Page
    return Section(child: Column(
      children: [
        Text("About Page"),
      ],
    ));
  }
}