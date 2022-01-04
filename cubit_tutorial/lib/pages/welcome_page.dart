import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final images = [
    'welcome-one.png',
    'welcome-two.png',
    'welcome-three.png',
  ];

  @override
  Widget build(BuildContext context) {
    // 上下スワイプをPageViewで作る
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/' + images[index]),
                fit: BoxFit.cover
              ),
            ),
          );
        },
      ),
    );
  }
}
