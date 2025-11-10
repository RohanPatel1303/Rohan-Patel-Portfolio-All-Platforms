import 'package:flutter/cupertino.dart';

class Section extends StatelessWidget{
  const Section({super.key,required this.child,this.width=1200});
  final Widget child;
  final double width;

  @override
Widget build(BuildContext context){
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: width),
        child:Padding(padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 32.0),child: child,),
      ),
    );
  }
}