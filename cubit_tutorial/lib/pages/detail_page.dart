import 'package:cubit_tutorial/cubit/app_cubit_states.dart';
import 'package:cubit_tutorial/cubit/app_cubits.dart';
import 'package:cubit_tutorial/theme/colors.dart';
import 'package:cubit_tutorial/widgets/app_buttons.dart';
import 'package:cubit_tutorial/widgets/app_large_text.dart';
import 'package:cubit_tutorial/widgets/app_text.dart';
import 'package:cubit_tutorial/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
        if (state is DetailState) {
          final detail = state.place;

          return SizedBox(
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
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'http://mark.bslmeiyu.com/uploads/' + detail.img,
                        ),
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
                        onPressed: () {
                          // メイン画面に戻る
                          BlocProvider.of<AppCubits>(context).goMain();
                        },
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
                              text: detail.name,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            AppLargeText(
                              text: '\$${detail.price}',
                              color: AppColors.mainColor,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Location
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            const SizedBox(width: 5),
                            AppText(
                              text: detail.location,
                              color: AppColors.textColor1,
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Stars
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                5,
                                (index) => Icon(
                                  Icons.star,
                                  color: index < detail.stars
                                      ? AppColors.starColor
                                      : AppColors.textColor2,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            AppText(
                              text: '(${detail.stars})',
                              color: AppColors.textColor2,
                            )
                          ],
                        ),
                        const SizedBox(height: 25),
                        // People Text
                        AppLargeText(
                          text: 'People',
                          color: Colors.black.withOpacity(0.8),
                          size: 20,
                        ),
                        const SizedBox(height: 5),
                        const AppText(
                          text: 'Number of people in your group',
                          color: AppColors.mainTextColor,
                        ),
                        const SizedBox(height: 10),
                        // Buttons
                        Wrap(
                          children: List.generate(
                            5,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButtons(
                                  text: (index + 1).toString(),
                                  size: 50,
                                  color: index == selectedIndex
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: index == selectedIndex
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  borderColor: index == selectedIndex
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Description Text
                        AppLargeText(
                          text: 'Description',
                          color: Colors.black.withOpacity(0.8),
                          size: 20,
                        ),
                        const SizedBox(height: 10),
                        AppText(
                          text: detail.description,
                          color: AppColors.mainTextColor,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 30,
                  child: Row(
                    children: [
                      const AppButtons(
                        color: AppColors.textColor2,
                        backgroundColor: Colors.white,
                        size: 60,
                        borderColor: AppColors.textColor1,
                        icon: Icons.favorite_border,
                      ),
                      const SizedBox(width: 20),
                      ResponsiveButton(isResponsive: true),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }
}
