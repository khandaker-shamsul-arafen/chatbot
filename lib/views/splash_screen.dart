
import 'package:chat_bot/utils/app_sizes.dart';
import 'package:chat_bot/views/subcription_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds:6),()=>Get.to(()=>SubscriptionScreen()),);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).scaffoldBackgroundColor,
alignment: Alignment.center,
      child:  Text('CHAT AI BOT',style: Theme.of(context).textTheme.titleSmall!.copyWith(
        fontSize: DeviceSizes.size22
      ),),

    );
  }
}
