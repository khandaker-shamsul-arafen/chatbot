import 'package:chat_bot/views/parrent_screen.dart';
import 'package:chat_bot/utils/app_sizes.dart';
import 'package:chat_bot/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../utils/app_colors.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(decoration: BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor
     // image: DecorationImage(image: AssetImage('images/brain.png'))
    ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // actions: [
        //   Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(16),
        //     color: Theme.of(context).primaryColor,
        //
        //   ),
        //   margin: EdgeInsets.symmetric(horizontal: DeviceSizes.custom(2),vertical: DeviceSizes.custom(1.5),),
        //
        //   padding: EdgeInsets.symmetric(horizontal: DeviceSizes.custom(3),),
        //   alignment: Alignment.center,
        //   child: Text('Restore',style: Theme.of(context).textTheme.titleSmall,),
        // ),],
        leading: InkWell(
          onTap: (){
            Get.to(()=>const ParrentScreen());
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).primaryColor,


            ),
            margin: EdgeInsets.symmetric(horizontal: DeviceSizes.custom(1),vertical: DeviceSizes.custom(1.5),),

            padding: EdgeInsets.all(DeviceSizes.custom(.2),
            ),
            child: Icon(Icons.close_outlined,size: DeviceSizes.custom(3),color: Theme.of(context).textTheme.titleSmall?.color,),
          ),
        ),

      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('images/Animation.png',height: DeviceSizes.custom(15),width: DeviceSizes.custom(15),fit: BoxFit.cover,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("ChatAI ",style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: DeviceSizes.size22,
                    fontWeight: FontWeight.w500
        
                ),),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
        
        borderRadius: BorderRadius.circular(14)
                  ),
                  margin: EdgeInsets.symmetric(horizontal: DeviceSizes.custom(1),vertical: DeviceSizes.custom(1.5),),
        
                  padding: EdgeInsets.symmetric(vertical:DeviceSizes.custom(.3),horizontal: DeviceSizes.custom(1.5),
                  ),alignment: Alignment.center,
                  child: Text("PRO",style: TextStyle(
                    color: AppColors.primaryText,
                      fontSize: DeviceSizes.size22,
                      fontWeight: FontWeight.w600
        
                  ),),
                ),
              ],
            ),
            10.spaceY,
        
            Container(
              width:  Get.width ,
              margin: EdgeInsets.symmetric(horizontal: DeviceSizes.custom(1.6),),
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 18),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(DeviceSizes.custom(2),),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.all(4),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(.3),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          Icons.check,
                          color: AppColors.primary,
                          size: DeviceSizes.size18,
                        ),
                      ),
                      SizedBox(
                        width: DeviceSizes.custom(22),
                        child: Text("Powered by ChatGpt 4",
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontSize: DeviceSizes.size16, fontWeight: FontWeight.w500),),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.all(4),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(.3),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            Icons.check,
                            color: AppColors.primary,
                            size: DeviceSizes.size18,
                          ),
                        ),
                        SizedBox(
                          width: DeviceSizes.custom(22),
                          child: Text("Remove Ads",
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  fontSize: DeviceSizes.size16, fontWeight: FontWeight.w500),),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 12),
                          padding: const EdgeInsets.all(4),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(.3),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            Icons.check,
                            color: AppColors.primary,
                            size: DeviceSizes.size18,
                          ),
                        ),
                        SizedBox(
                          width: DeviceSizes.custom(22),
                          child: Text("Unlimited Messages",
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  fontSize: DeviceSizes.size16, fontWeight: FontWeight.w500)),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 12),
                        padding: const EdgeInsets.all(4),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(.3),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(
                          Icons.check,
                          color: AppColors.primary,
                          size: DeviceSizes.size18,
                        ),
                      ),
                      SizedBox(
                        width: DeviceSizes.custom(22),
                        child: Text("Cancel Anytime",
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                fontSize: DeviceSizes.size16, fontWeight: FontWeight.w500),),
                      ),
                    ],
                  ),
        
        
                ],
              ),
            ) .animate(
                onPlay: (controller) => controller.lowerBound)
                .shimmer(
              size: .4,
              duration: 1300.ms,
              //   blendMode: BlendMode.luminosity,
              color: Colors.grey.withOpacity(.6),),
            20.spaceY,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ZoomTapAnimation(


                beginCurve: Curves.bounceIn,
                endCurve: Curves.bounceInOut,
                  child: Container(
                    width: DeviceSizes.custom(20),
                  //  padding: EdgeInsets.symmetric(vertical: 18),
                          
                    margin: EdgeInsets.symmetric(horizontal: DeviceSizes.custom(1.6),),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(DeviceSizes.custom(2),),
                      border: Border.all(color: Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.1),
                          width: 1)
                  
                    ),
                    child: Column(
                      children: [
                        10.spaceY,
                        Text("Weekly",style: TextStyle(color: AppColors.primary,fontSize: DeviceSizes.size18),),
                      10.spaceY,
                        Divider(
                          color: Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.1),
                        ),
                        Text("BDT 150.00",style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: DeviceSizes.size16),),
                          15.spaceY,
                        Text("Per Week",style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: DeviceSizes.size14,
                          color: Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.6),
                        ),
                        ),
                          
                          20.spaceY,
                          
                      ],
                    ),
                          
                  ).animate().slide(
                      duration: const Duration(milliseconds: 900),
                      begin:const Offset(-1, 0),end: const Offset(0, 0)),
                ),
                ZoomTapAnimation(
                  beginCurve: Curves.bounceIn,
                  endCurve: Curves.bounceInOut,
                  child: Container(
                    width: DeviceSizes.custom(20),
                  //  padding: EdgeInsets.symmetric(vertical: 18),

                    margin: EdgeInsets.only(right: DeviceSizes.custom(1.6),),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(DeviceSizes.custom(2),),
                      border: Border.all(color: Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.1),
                        width: 1
                      ),
                    ),
                    child: Column(
                      children: [
                        10.spaceY,
                        Text("Monthly",style: TextStyle(color: AppColors.primary,fontSize: DeviceSizes.size18),),
                      10.spaceY,
                        Divider(
                          color: Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.1),
                        ),
                        Text("BDT 650.00",style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: DeviceSizes.size16),),
                          15.spaceY,
                        Text("Per Month",style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: DeviceSizes.size14,
                          color: Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.6),
                        ),),

                          20.spaceY,

                      ],
                    ),

                  ).animate().slide(
                      duration: const Duration(milliseconds: 900),
                      begin:const Offset(1, 0),end: const Offset(0, 0)),
                ),
              ],
            ),
            20.spaceY,

            ZoomTapAnimation(
              beginCurve: Curves.bounceIn,
              endCurve: Curves.bounceInOut,
              child: Container(
              //  width: DeviceSizes.custom(20),
                padding: const EdgeInsets.only(bottom: 18),

                margin: EdgeInsets.symmetric(horizontal: DeviceSizes.custom(1.6),),
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.1),width: 1),
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(DeviceSizes.custom(2),)

                ),

                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: AppColors.primary,

                            borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomLeft: Radius.circular(10),)

                        ),
                        padding: const EdgeInsets.all(8),

                        child: const Text('Save %85',style: TextStyle(color: AppColors.primaryText),),
                      ),
                    ),
                    Text("Weekly",style: TextStyle(color: AppColors.primary,fontSize: DeviceSizes.size18),),
                    10.spaceY,
                    Divider(
                      color: Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.2),
                    ),
                    Text("BDT 2800.00",style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: DeviceSizes.size16),),
                    10.spaceY,
                    Text("Per Year",style:Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: DeviceSizes.size14,
                      color: Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.6),
                    ),),



                  ],
                ),

              ) .animate(
                  onPlay: (controller) => controller.repeat(),)
                  .shimmer(
                size: .4,
                  duration: 1300.ms,
               //   blendMode: BlendMode.luminosity,
                  color: Colors.grey.withOpacity(.6),),
            ),
            20.spaceY,
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.security,size: DeviceSizes.size18, color: Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.6)),
                5.spaceX,
                Text('Secured by Google Play  Cancel Anytime',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.6)
                ),),
              ],
            ),
            20.spaceY,


          ],
        ),
      ),
    ),
    );
  }
}
