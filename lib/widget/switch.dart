import 'package:chat_bot/utils/common.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_sizes.dart';


class MoodSwitch extends StatelessWidget {
  final String title;
  final String img;
  final bool isTitleBold;
  final Function() onTap;
  final Widget? trailing;

  const MoodSwitch(
      {super.key,
        required this.title,
        required this.img,
        required this.onTap,
        this.isTitleBold = true,
        this.trailing});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(horizontal: DeviceSizes.custom(1.3))
            .copyWith(top: DeviceSizes.custom(.6)),
        padding: EdgeInsets.symmetric(horizontal: DeviceSizes.custom(1.3)),
        child: Row(
          children: [
            Image.asset(img,
                height: DeviceSizes.custom(2.6),
                width: DeviceSizes.custom(2.6),
                fit: BoxFit.cover,
                color: Theme.of(context).textTheme.titleSmall!.color,
                // color: Theme.of(context).primaryColor
            ),
            12.spaceX,
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: DeviceSizes.size15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            trailing == null
                ? Icon(
              Icons.arrow_forward_ios,
              size: 18,
              color: Theme.of(context).dividerColor,
            )
                : trailing!
          ],
        ),
      ),
    );
  }
}
