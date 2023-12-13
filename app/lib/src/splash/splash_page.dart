import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
        animationBehavior: AnimationBehavior.preserve);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            if (_animation.value == 1) {
              Navigator.of(context).pushNamed('/auth');
            }
            return SizedBox(
              width: _animation.value * 200,
              height: _animation.value * 200,
              child: const Image(
                image: AssetImage('assets/images/logo.png'),
                height: 35,
              ),
              //  ),
            );
          },
        ),
      ),
    );
  }
}
