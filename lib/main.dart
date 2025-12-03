import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rohan_portfolio_website/pages/about_page.dart';
import 'package:rohan_portfolio_website/pages/home_page.dart';
import 'package:rohan_portfolio_website/pages/project_page.dart';
import 'package:rohan_portfolio_website/theme.dart';
import 'package:rohan_portfolio_website/theme_controller.dart';
import 'package:rohan_portfolio_website/widgets/fade_slide_in.dart';
import 'package:rohan_portfolio_website/widgets/nav_bar.dart';
import 'package:rohan_portfolio_website/widgets/site_footer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeController.instance.init();
  runApp(const PortfolioApp());
}
class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
        initialLocation: "/", routes: [
          ShellRoute(
            builder: (context,state,child){
              return SiteShell(child: child);
            },
            routes: [
              GoRoute(path: "/",builder: (context,state)=>const HomePage(),),
              GoRoute(path: '/projects',builder: (context,state)=>const ProjectsPage()),
              GoRoute(path: '/about',builder: (context,state)=>const AboutPage()),
              // GoRoute(path: '/contact',builder: (context,state)=>const ContactPage()),
    ]

          )

    ],



    );
    return AnimatedBuilder(animation: ThemeController.instance, builder: (context,_){
      return MaterialApp.router(
        title: 'Rohan Patel (Deadhack) Portfolio',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeController.instance.mode,
        theme: AppTheme.light,
          darkTheme: AppTheme.dark,
        routerConfig: router,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
            PointerDeviceKind.stylus,
            PointerDeviceKind.trackpad
          }
        ),

      );
    });
  }
}
  class SiteShell extends StatelessWidget {
    final Widget child;

    const SiteShell({super.key, required this.child});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .surface,
        appBar: PreferredSize(preferredSize: const Size.fromHeight(64),
            child: const SiteNavBar()),
        body
        :SafeArea(child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(), child: Column(
          children: [child,const SiteFooter()],
        ),
        )),
      );
    }
  }