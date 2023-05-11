import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> with SingleTickerProviderStateMixin {
  //
  late final AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      reverseDuration: Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  bool bookmark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent[200],
      body: Center(
        child: GestureDetector(
          onTap: () {
            if (bookmark == false) {
              bookmark = true;
              _controller.forward();
            } else {
              bookmark = false;
              _controller.reverse();
            }
          },
          child: Lottie.network(
              'https://assets7.lottiefiles.com/packages/lf20_xdfeea13.json',
              controller: _controller),
        ),
      ),
    );
  }
}
