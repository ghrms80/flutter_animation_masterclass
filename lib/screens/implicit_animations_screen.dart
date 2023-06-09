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
    // final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              // 애니메이션의 시작 값, 끝 값을 정의
              tween: ColorTween(
                begin: Colors.yellow,
                end: Colors.red,
              ),
              curve: Curves.bounceInOut,
              duration: const Duration(seconds: 5),
              builder: (context, value, child) {
                // return Text("$value");
                return Image.network(
                  'https://res.cloudinary.com/dnegavcrl/images/f_auto,q_auto/v1678438365/Flutter-Dash-Sticer/Flutter-Dash-Sticer.png?_i=AA',
                  color: value,
                  colorBlendMode: BlendMode.colorBurn,
                );
              },
            ),
            const SizedBox(height: 50),
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
