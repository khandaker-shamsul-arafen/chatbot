import 'package:chat_bot/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../controllers/assistant_model.dart';
import '../utils/app_sizes.dart';

class AssistantWidget extends StatelessWidget {
  const AssistantWidget(this.model,this.color,{super.key});


  final AssistantModel model;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return       ZoomTapAnimation(
      child: Container(
        margin: EdgeInsets.only(left: DeviceSizes.custom(1.6),top: DeviceSizes.custom(0)
      
        ),
        padding: EdgeInsets.symmetric(horizontal:DeviceSizes.custom(1.2),vertical: DeviceSizes.custom(.5),),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).primaryColor,
          border: Border.all(color: Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.05),width: DeviceSizes.custom(.12),),
      
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      
          children: [
            Container(
              height: DeviceSizes.custom(8),
              width: DeviceSizes.custom(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(DeviceSizes.custom(1.4)),
                  color:color
              ),
            ),

SizedBox(
  height: DeviceSizes.custom(1.2),
),
            SizedBox(
              width: DeviceSizes.custom(18),
      
              child: Text(model.header,
      textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: DeviceSizes.size18,
      
              ),
                //textAlign: TextAlign.center,
                maxLines: 1,
      
              ),
            ),
            8.spaceY,
            SizedBox(
              width: DeviceSizes.custom(18),
              child: Text(
                textAlign: TextAlign.center,
                model.description,style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: DeviceSizes.size13,
                wordSpacing: 2,
                color: Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.6)
      
              
              ),
                //textAlign: TextAlign.center,
                maxLines: 4,
                overflow: TextOverflow.clip,
              
              ),
            ),
          ],
        ),
      ),
    );
  }
}
