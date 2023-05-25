import 'package:flutter/material.dart';

class ImplicitAnimationScreen extends StatefulWidget {
  const ImplicitAnimationScreen({super.key});

  @override
  State<ImplicitAnimationScreen> createState() =>
      _ImplicitAnimationScreenState();
}

class _ImplicitAnimationScreenState extends State<ImplicitAnimationScreen> {
  bool _visible = false;

  void _trigger() {
    setState(() {
      _visible = !_visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedAlign(
              alignment: _visible ? Alignment.topLeft : Alignment.topRight,
              duration: const Duration(seconds: 2),
              child: AnimatedOpacity(
                opacity: _visible ? 1 : 0.2,
                duration: const Duration(seconds: 2),
                child: Container(
                  width: size.width * 0.8,
                  height: size.width * 0.8,
                  color: Colors.amber,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _trigger,
              child: const Text('Go!'),
            ),
          ],
        ),
      ),
    );
  }
}
