import 'package:cubit_tutorial/theme/colors.dart';
import 'package:cubit_tutorial/widgets/app_text.dart';
import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;

  ResponsiveButton({
    Key? key,
    this.width = 120,
    this.isResponsive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive == true ? double.maxFinite : width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            if (isResponsive == true)
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const AppText(
                  text: 'Book Trip Now',
                  color: Colors.white,
                ),
              ),
            Image.asset('assets/images/button-one.png'),
          ],
        ),
      ),
    );
  }
}
