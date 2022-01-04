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
            // BoxDecorationで画像を設定すると背景画像になる
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/' + images[index]),
                fit: BoxFit.cover
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(left: 20, top: 150, right: 20),
              child: Row(
                children: [
                  Column(
                    children: [
                      
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
