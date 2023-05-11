import 'package:animationprac/pages/page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _radiusAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    )..forward();

    // roatation controller
    _rotationAnimation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // radius animation
    _radiusAnimation = Tween(begin: 450.0, end: 10.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addListener(() {
      setState(() {});
    });

    // make animation go back and forth

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Page1(),
            ));
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
        ;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              angle: _rotationAnimation.value,
              child: Container(
                width: 225,
                height: 225,
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 0.4,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationAnimation.value + 0.6,
              child: Container(
                width: 125,
                height: 125,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[200],
                  borderRadius: BorderRadius.circular(_radiusAnimation.value),
                ),
              ),
            ),
            Container(
              child: Text(
                'Loading',
                style: TextStyle(
                  color: Colors.white54,
                  letterSpacing: 2.5,
                  fontSize: 18,
                ),
              ),
            ),
            // Container(),
            // Container(),
          ],
        ),
      ),
    );
  }
}
