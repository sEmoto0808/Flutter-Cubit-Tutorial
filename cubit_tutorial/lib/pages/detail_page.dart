import 'package:cubit_tutorial/theme/colors.dart';
import 'package:cubit_tutorial/widgets/app_large_text.dart';
import 'package:cubit_tutorial/widgets/app_text.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        // StackとPositionedを使ってオーバーラップを実装する
        child: Stack(
          children: [
            // NOTE: 配列の後ろの方が上に表示される
            // 背景画像
            Positioned(
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/mountain.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // MenuBar
            Positioned(
              left: 20,
              top: 70,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                    color: Colors.white,
                  )
                ],
              ),
            ),
            // Content Detail
            Positioned(
              top: 320,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 30,
                  right: 20,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Yosemite Text
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: 'Yosemite',
                          color: Colors.black.withOpacity(0.8),
                        ),
                        const AppLargeText(
                          text: '\$ 250',
                          color: AppColors.mainColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: const [
                        Icon(
                          Icons.location_on,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(width: 5),
                        AppText(
                          text: 'USA, California',
                          color: AppColors.textColor1,
                        )
                      ],
                    ),
                    // Location
                    const SizedBox(height: 20),
                    // Stars
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: index < gottenStars
                                  ? AppColors.starColor
                                  : AppColors.textColor2,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const AppText(
                          text: '(4.0)',
                          color: AppColors.textColor2,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
