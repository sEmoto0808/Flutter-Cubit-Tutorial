import 'package:cubit_tutorial/theme/colors.dart';
import 'package:cubit_tutorial/widgets/app_large_text.dart';
import 'package:cubit_tutorial/widgets/app_text.dart';
import 'package:cubit_tutorial/widgets/circle_tab_indicator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

// TabBarの状態変化を同期する
class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;

  final imagesMap = {
    'Balloning': 'balloning.png',
    'Hiking': 'hiking.png',
    'Kayaking': 'kayaking.png',
    'Snorkling': 'snorkling.png',
  };

  @override
  void initState() {
    // vsyncで自信を指定するためにここでインスタンス化
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Bar
          _topBar(),
          const SizedBox(height: 40),
          // Discover Text
          _discoverText(),
          const SizedBox(height: 30),
          // TabBar
          _tabBar(),
          // TabBarView
          _tabBarView(),
          const SizedBox(height: 30),
          // Explore more Text
          _exploreMoreText(),
          const SizedBox(height: 10),
          // Explore Category
          _exploreCategory(),
        ],
      ),
    );
  }

  Widget _topBar() {
    return Container(
      padding: const EdgeInsets.only(
        left: 20,
        top: 70,
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            size: 30,
            color: Colors.black54,
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _discoverText() {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: const AppLargeText(text: 'Discover'),
    );
  }

  Widget _tabBar() {
    return Align(
      alignment: Alignment.centerLeft,
      child: TabBar(
        controller: _tabController,
        labelPadding: const EdgeInsets.only(left: 20, right: 20),
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        // 自作Indicator
        indicator: const CircleTabIndicator(
          color: AppColors.mainColor,
          radius: 4,
        ),
        tabs: const [
          Tab(text: 'Places'),
          Tab(text: 'Inspiration'),
          Tab(text: 'Emotions'),
        ],
      ),
    );
  }

  Widget _tabBarView() {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      // サイズの指定が必要
      width: double.maxFinite,
      height: 300,
      child: TabBarView(
        controller: _tabController,
        children: [
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  right: 15,
                ),
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/mountain.jpeg'),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          Text('There'),
          Text('Bye'),
        ],
      ),
    );
  }

  Widget _exploreMoreText() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          AppLargeText(
            text: 'Explore more',
            size: 22,
          ),
          AppText(
            text: 'See all',
            color: AppColors.textColor1,
          ),
        ],
      ),
    );
  }

  Widget _exploreCategory() {
    return Container(
      width: double.maxFinite,
      height: 100,
      margin: const EdgeInsets.only(left: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (_, index) {
          final image = imagesMap[index];
          return Container(
            margin: const EdgeInsets.only(right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/' +
                            imagesMap.values.elementAt(index),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                AppText(
                  text: imagesMap.keys.elementAt(index),
                  color: AppColors.textColor2,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

