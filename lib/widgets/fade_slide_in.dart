import 'package:flutter/cupertino.dart';

class FadeSlideIn extends StatefulWidget{
  const FadeSlideIn({
    super.key,
    required this.child,
    this.beginOffset=const Offset(0, 0),
    this.duration=const Duration(milliseconds: 600),
    this.delay=Duration.zero
});
  final Widget child;
  final Offset beginOffset;
  final Duration duration;
  final Duration delay;
  @override
  State<FadeSlideIn> createState() => _FadeSlideInState();
}

class _FadeSlideInState extends State<FadeSlideIn> with SingleTickerProviderStateMixin{
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _offset;

  @override
  void initState(){
    print("init state called!!");
    super.initState();
    _controller=AnimationController(vsync: this,duration: widget.duration);
    _opacity=CurvedAnimation(parent: _controller,curve: Curves.easeInOut);
    _offset=Tween<Offset>(begin:widget.beginOffset,
        end:Offset.zero).animate(CurvedAnimation(parent: _controller,curve: Curves.easeOutCubic));

    if(widget.delay==Duration.zero) {
      _controller.forward();
    }else{
      print("the animation is delayed");
      Future.delayed(widget.delay,(){if(mounted)_controller.forward();});
    }

  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print("the animation is building!!");
    return FadeTransition(opacity: _opacity,
      child: SlideTransition(position: _offset,
        child: widget.child,
      ),
    );

  }

}