
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_bot/utils/app_colors.dart';
import 'package:chat_bot/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../utils/app_sizes.dart';
import 'chat_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          25.spaceY,
          Image.asset('images/robot.png',height: DeviceSizes.custom(25),width: DeviceSizes.custom(15),fit: BoxFit.cover,),
      15.spaceY,
          Text("Welcome to",style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontSize: DeviceSizes.size28,
            fontWeight: FontWeight.w600
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Chat AI",style: TextStyle(
                fontSize: DeviceSizes.size28,
                fontWeight: FontWeight.w600,
                color:AppColors.primary
              ),),
              3.spaceX,
              Image.asset('images/claping.gif',height: DeviceSizes.custom(6),width: DeviceSizes.custom(6),fit: BoxFit.cover,),

            ],
          ),
          20.spaceY,
          DefaultTextStyle(
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.8),
                fontSize: DeviceSizes.size15,
                height: 1.8,
                letterSpacing: 1,
                fontWeight: FontWeight.w600
            ),
            child: AnimatedTextKit(
isRepeatingAnimation: false,
              animatedTexts: [
                TypewriterAnimatedText('Start chatting with ChatAi now',speed: const Duration(milliseconds: 80,),textAlign: TextAlign.center),

              ],

            ),
          ),
 Text('You can ask me anything',style:Theme.of(context).textTheme.titleSmall!.copyWith(
     color: Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.5),
     fontSize: DeviceSizes.size13,
     height: 1.8,
     letterSpacing: 1,
     fontWeight: FontWeight.w600
 ),

 ).animate().fadeIn(duration: const Duration(milliseconds: 1800),),


          80.spaceY,


          ZoomTapAnimation(
            beginCurve: Curves.bounceIn,
            endCurve: Curves.bounceInOut,
            onTap: (){
              Get.to(()=>const ChatPage(),transition: Transition.leftToRightWithFade,duration: const Duration(milliseconds: 600));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical:DeviceSizes.custom(1.8),),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(DeviceSizes.custom(3.6),
                ),


              ),
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: DeviceSizes.custom(3)),
              child: Text('Start Chat ',
                maxLines: 1,
                style: TextStyle(color: AppColors.primaryText,fontSize: DeviceSizes.size22,

              ),
              ),
            ),
          ) .animate(
              onPlay: (controller) => controller.repeat())
              .shimmer(
            size: .4,
            duration: 1300.ms,
            //   blendMode: BlendMode.luminosity,
            color: Colors.white.withOpacity(.6),),

        ],
      ),
    );
  }
}
