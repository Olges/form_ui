import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        // body: Center(
        child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(7),
            child: Lottie.asset(
            'assets/animation/128328-mice-between-the-lines.json'),
            ),
          Padding(
            padding: EdgeInsets.all(7),
            child: Lottie.asset(
            'assets/animation/128260-hands-collaboration.json'),
            ),
          Padding(
            padding: EdgeInsets.all(7),
            child: Lottie.asset(
            'assets/animation/128325-karlito-spike.json'),
            ),
          Padding(
            padding: EdgeInsets.all(7),
            child: Lottie.asset(
            'assets/animation/128635-letter-d.json'),
            ),
          ],
        ),
    );
  }
}
