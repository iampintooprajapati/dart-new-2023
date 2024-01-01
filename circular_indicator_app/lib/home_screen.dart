import 'package:circular_indicator_app/ciccular_indicator.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final maxProgress = 100.0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));

    _animation =
        Tween<double>(begin: 0, end: maxProgress).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Circle Progress Bar"),
      ),
      body: Center(
        child: CustomPaint(
          foregroundPainter: CircleProgress(_animation.value),
          child: SizedBox(
            width: 100,
            height: 100,
            child: GestureDetector(
              onTap: () {
                if (_animation.value == maxProgress) {
                  _animationController.reverse();
                } else {
                  _animationController.forward();
                }
              },
              child: Center(
                  child: Text(
                "${_animation.value.toInt()}",
                style: const TextStyle(fontSize: 20),
              )),
            ),
          ),
        ),
      ),
    ));
  }
}
