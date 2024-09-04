import 'package:flutter/material.dart';

import '../utils/app_sizes.dart';

class ChatPageNodataWidget extends StatelessWidget {
  const ChatPageNodataWidget(this.txt,{super.key});
final String txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: DeviceSizes.custom(2.3),horizontal: DeviceSizes.custom(2)),

      margin: EdgeInsets.symmetric(horizontal: DeviceSizes.custom(1.6),).copyWith(bottom: DeviceSizes.custom(3)),
      decoration: BoxDecoration(
          border: Border.all(  color: Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.7)
              ,width: .1),
          color: Theme.of(context).primaryColor.withOpacity(.8),
          borderRadius: BorderRadius.circular(DeviceSizes.custom(2),)

      ),
      alignment: Alignment.center,
      child: Text(txt,textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleSmall!.copyWith(
        fontSize: DeviceSizes.size16,
            height: 1.4
      ),),
    );
  }
}
