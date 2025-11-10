import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SiteFooter extends StatelessWidget{
  const SiteFooter({super.key});
  @override
  Widget build(BuildContext context){
    final color=Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6);
    return Padding(padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: [
          Divider(color: color.withValues(alpha: .3),),
          const SizedBox(height: 16,),
          Text('© ${DateTime.now().year} Rohan Patel',style: TextStyle(color: color)),
          const SizedBox(height:8),

        ],
      ),

    );
  }
}