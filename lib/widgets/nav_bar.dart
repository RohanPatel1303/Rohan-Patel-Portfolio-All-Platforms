import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rohan_portfolio_website/theme_controller.dart';

class SiteNavBar extends StatelessWidget{
  const SiteNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    final isWide=MediaQuery.of(context).size.width>=900;
    final mode= ThemeController.instance.mode;
    final isDark=mode==ThemeMode.dark||(mode==ThemeMode.system && MediaQuery.platformBrightnessOf(context)==Brightness.dark);
    return AppBar(
      titleSpacing: 24,
      title: InkWell(
        onTap: ()=> context.go('/'),
        child: const Text(
          'Rohan Patel',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        ),
      actions: [
        if(isWide)...[
          _NavLink(label: 'Home', onTap: ()=>context.go('/')),
          _NavLink(label: 'Projects', onTap: ()=>context.go('/projects')),

          _NavLink(label: 'About', onTap: ()=>context.go('/about')),

          _NavLink(label: 'Contact', onTap: ()=>context.go('/contact')),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Tooltip(
                message: isDark?'Switch to Light Mode':'Switch to Dark Mode',
                child: IconButton(
                  onPressed: ThemeController.instance.toggle,
                  icon: Icon(isDark?Icons.wb_sunny_rounded:Icons.dark_mode_rounded),
                ),
              )
          )
        ]else ...[
          PopupMenuButton(itemBuilder: (context)=>[
            PopupMenuItem(
              onTap: ()=>context.go('/'),
                child: const Text('Home')
            ),
            PopupMenuItem(onTap:()=>context.go('/projects'),
                child: const Text('Projects')
            ),
            PopupMenuItem(onTap:()=>context.go('/about'),
                child: const Text('About')
            ),
            PopupMenuItem(onTap:()=>context.go('/contact'),
                child: const Text('Contact')
            ),
          ],
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Tooltip(
              message: isDark?'Switch to Light Mode':'Switch to Dark Mode',
              child: IconButton(
    onPressed: ThemeController.instance.toggle,
    icon: Icon(isDark?Icons.wb_sunny_rounded:Icons.dark_mode_rounded),
            ),
          )
    )]

      ],
      );


  }
}
class _NavLink extends StatelessWidget{
  const _NavLink({required this.label,required this.onTap});
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onTap,
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),);
  }
}