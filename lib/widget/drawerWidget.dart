import 'package:chat_bot/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_sizes.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget(this.firstImage, this.txt, {super.key});

  final String firstImage;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.all(DeviceSizes.custom(1.3)),
      margin: EdgeInsets.symmetric(horizontal: DeviceSizes.custom(1.3))
          .copyWith(top: DeviceSizes.custom(.6)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            firstImage,
            height: DeviceSizes.custom(2.6),
            width: DeviceSizes.custom(2.6),
            fit: BoxFit.cover,
            color: Theme.of(context).textTheme.titleSmall!.color,


          ),
          12.spaceX,
          Text(
            txt,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: DeviceSizes.size15,
                  fontWeight: FontWeight.w500,
                ),
          ),

          Spacer(),
          Icon(Icons.arrow_forward_ios_sharp,size: DeviceSizes.custom(2.2),color:Theme.of(context).textTheme.titleSmall!.color ,)
        ],
      ),
    );
  }
}
