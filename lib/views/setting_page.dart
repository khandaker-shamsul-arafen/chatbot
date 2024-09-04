import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_bot/utils/common.dart';
import 'package:chat_bot/views/subcription_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../utils/app_colors.dart';
import '../utils/app_sizes.dart';
import '../utils/consts.dart';
import '../utils/helpers.dart';
import '../widget/drawerWidget.dart';
import '../widget/switch.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ZoomTapAnimation(
            onTap: (){
              Get.to(()=>const SubscriptionScreen());
            },
            beginCurve: Curves.bounceIn,
            endCurve: Curves.bounceInOut,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: DeviceSizes.custom(2.3),horizontal: DeviceSizes.custom(2)),

              margin: EdgeInsets.symmetric(horizontal: DeviceSizes.custom(1.6),),
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(DeviceSizes.custom(2),)

              ),

              child: Row(
                children: [
              Container(
                margin: EdgeInsets.only(right: DeviceSizes.custom(2),),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
                ),
                alignment: Alignment.center,
                child: Image.asset('images/star.gif',width: DeviceSizes.custom(7),height: DeviceSizes.custom(7),),
              ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width:DeviceSizes.custom(26),
                        child: DefaultTextStyle(
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                              fontSize: DeviceSizes.size22,
                              height: 1.8,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w600
                          ),
                          child: AnimatedTextKit(
                            totalRepeatCount: 100000,
                            animatedTexts: [
                              TypewriterAnimatedText('Upgrade to Pro !',speed: const Duration(milliseconds: 80),),

                            ],

                          ),
                        ),
                      ),
                      Text('Enjoy all benefits without \nrestictions',style: TextStyle(
                        color: Colors.white,
                          fontSize: DeviceSizes.size14,
                          height: 1.5,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600
                      )
                        ,)

                    ],
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios_sharp,size: DeviceSizes.custom(2.6),color:Colors.white ,)

                ],
              ),

            ).animate(
                onPlay: (controller) => controller.repeat())
                .shimmer(
              size: .4,
              duration: 1300.ms,
              //   blendMode: BlendMode.luminosity,
              color: Colors.white.withOpacity(.6),),
          ),


Padding(
  padding:  EdgeInsets.symmetric(horizontal:DeviceSizes.custom(3),vertical: DeviceSizes.custom(2.5),),
  child: Row(
    children: [
      Text('General',style: Theme.of(context).textTheme.titleSmall,),
  
    20.spaceX,
      Container(
        width: DeviceSizes.custom(30),
        height: .2,
        color: Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.8),
      ),
    ],
  ),
),



          MoodSwitch(
            title: 'Light Mode',
            img: 'images/sun.png',
            onTap: () {
              Get.changeThemeMode(
                  Theme.of(context).brightness == Brightness.dark
                      ? ThemeMode.light
                      : ThemeMode.dark);
              bool isDark = Theme.of(context).brightness == Brightness.dark;
              putStorage('dark', isDark);
            },
            isTitleBold: false,
            trailing: Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                activeColor: AppColors.primary,
                trackColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                applyTheme: true,
                value: Theme.of(context).brightness == Brightness.light,
                onChanged: (value) {
                  Get.changeThemeMode(
                      Theme.of(context).brightness == Brightness.dark
                          ? ThemeMode.light
                          : ThemeMode.dark
                  );
                  bool isDark =
                      Theme.of(context).brightness == Brightness.dark;
                  putStorage('dark', isDark);
                },
              ),
            ),
          ),
          7.spaceY,
          MoodSwitch(
            title: 'Notifications',
            img: 'images/bell.png',
            onTap: () {

            },
            isTitleBold: false,
            trailing: Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                activeColor: AppColors.primary,
                trackColor: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                applyTheme: true,
                value:false,
                onChanged: (value) {

                },
              ),
            ),
          ),
          7.spaceY,


          ZoomTapAnimation(
            beginCurve: Curves.bounceIn,
            endCurve: Curves.bounceInOut,
            onTap: () async {
              PackageInfo packageInfo = await PackageInfo.fromPlatform();
              String message = 'Check out this app for the best AI Assistant';
              if (GetPlatform.isAndroid) {
                Share.share(
                  '$message https://play.google.com/store/apps/details?id=${packageInfo.packageName}',
                );
              } else {
                final box = context.findRenderObject() as RenderBox?;
                await Share.share(
                  '$message \nApp Link : ',
                  sharePositionOrigin:
                  box!.localToGlobal(Offset.zero) & box.size,
                );
              }
            },
            child: const DrawerWidget(
                'images/send.png', 'Share With  Yours Friends'),
          ),
          ZoomTapAnimation(
            beginCurve: Curves.bounceIn,
            endCurve: Curves.bounceInOut,
            onTap: () async {
              PackageInfo packageInfo = await PackageInfo.fromPlatform();
              String message = 'Check out this app for the best AI Assistant';
              if (GetPlatform.isAndroid) {
                Share.share(
                  '$message https://play.google.com/store/apps/details?id=${packageInfo.packageName}',
                );
              } else {
                final box = context.findRenderObject() as RenderBox?;
                await Share.share(
                  '$message \nApp Link : ',
                  sharePositionOrigin:
                  box!.localToGlobal(Offset.zero) & box.size,
                );
              }
            },
            child: const DrawerWidget(
                'images/star.png', 'Rate Us'),
          ),


          Padding(
            padding:  EdgeInsets.symmetric(horizontal:DeviceSizes.custom(3),vertical: DeviceSizes.custom(2.5),),
            child: Row(
              children: [
                Text('Purchase',style: Theme.of(context).textTheme.titleSmall,),

                20.spaceX,
                Container(
                  width: DeviceSizes.custom(29),
                  height: .2,
                  color: Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.8),
                )
              ],
            ),
          ),
          ZoomTapAnimation(
            beginCurve: Curves.bounceIn,
            endCurve: Curves.bounceInOut,
            onTap: () async {

            },
            child: const DrawerWidget(
                'images/credit-card.png', 'Payment'),
          ),

          Padding(
            padding:  EdgeInsets.symmetric(horizontal:DeviceSizes.custom(3),vertical: DeviceSizes.custom(2.5)),
            child: Row(
              children: [
                Text('About',style: Theme.of(context).textTheme.titleSmall,),

                20.spaceX,
                Container(
                  width: DeviceSizes.custom(32),
                  height: .2,
                  color: Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.8),
                )
              ],
            ),
          ),
          ZoomTapAnimation(
            beginCurve: Curves.bounceIn,
            endCurve: Curves.bounceInOut,
            onTap: () async {
              goURL(' ');

            },
            child: const DrawerWidget(
                'images/phone.png', 'Contact Us'),
          ),
          ZoomTapAnimation(
            beginCurve: Curves.bounceIn,
            endCurve: Curves.bounceInOut,
            onTap: () async {
              goURL(' ');

            },
            child: const DrawerWidget(
                'images/document.png', 'Terms & Condition'),
          ),
          ZoomTapAnimation(
            beginCurve: Curves.bounceIn,
            endCurve: Curves.bounceInOut,
            onTap: () async {

            },
            child: const DrawerWidget(
                'images/shield.png', 'Privacy Policy'),
          ),
          60.spaceY,


        ],
      )
    );
  }
}
