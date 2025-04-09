import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: SquareAnimation());
  }
}

class SquareAnimation extends StatefulWidget {
  const SquareAnimation({super.key});

  @override
  State<SquareAnimation> createState() {
    return SquareAnimationState();
  }
}

class SquareAnimationState extends State<SquareAnimation> {
  Alignment _alignment = Alignment.center;
  double _squareSize = 100.0;
  bool _boxIsMoving = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedAlign(
            alignment: _alignment,
            duration: Duration(seconds: 1),
            onEnd: () {
              setState(() {
                _boxIsMoving = false;
              });
            },
            child: Container(
              width: _squareSize,
              height: _squareSize,
              decoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _alignment == Alignment.centerLeft || _boxIsMoving
                          ? Colors.grey
                          : Colors.blue,
                ),
                onPressed: () {
                  if (_alignment != Alignment.centerLeft) {
                    setState(() {
                      _boxIsMoving = true;
                      _alignment = Alignment.centerLeft;
                    });
                  }
                },
                child: const Text(
                  'Left',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _alignment == Alignment.centerRight || _boxIsMoving
                          ? Colors.grey
                          : Colors.green,
                ),
                onPressed: () {
                  if (_alignment != Alignment.centerRight) {
                    setState(() {
                      _boxIsMoving = true;
                      _alignment = Alignment.centerRight;
                    });
                  }
                },
                child: const Text(
                  'Right',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
