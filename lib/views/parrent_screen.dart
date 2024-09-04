import 'dart:io';

import 'package:chat_bot/utils/app_colors.dart';
import 'package:chat_bot/utils/app_sizes.dart';
import 'package:chat_bot/utils/common.dart';
import 'package:chat_bot/views/setting_page.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../controllers/chat_field_controller.dart';
import 'assistant_view.dart';
import 'history_page.dart';
import 'home_screen.dart';



class ParrentScreen extends StatefulWidget {
  const ParrentScreen({
    super.key,
  });

  @override
  ParrentScreenState createState() => ParrentScreenState();
}

class ParrentScreenState extends State<ParrentScreen> {


  ChatPageController chatPageController =Get.find();




  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor
        // image: DecorationImage(image: AssetImage('images/brain.png'))
      ),

      child: Scaffold(
            appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Chat AI',style: Theme.of(context).textTheme.titleSmall!.copyWith(
          fontSize: DeviceSizes.size22
        ),),
        centerTitle: true,
              automaticallyImplyLeading: false,


      ),



   body: PersistentTabView(
     backgroundColor: Colors.transparent,
     tabs: [
       PersistentTabConfig(
         screen:   const HomeScreen(),
         item: ItemConfig(
           activeForegroundColor: Theme.of(context).textTheme.titleSmall!.color??Colors.transparent,
           activeColorSecondary: AppColors.primary.withOpacity(.8),
           textStyle: TextStyle(fontSize: DeviceSizes.size14),
           icon:Image.asset('images/messenger.png',height: DeviceSizes.custom(3),width: DeviceSizes.custom(3),fit: BoxFit.cover,color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor!,),
           title: "Chat",

         ),

       ),
       PersistentTabConfig(
         screen: const AssistantView(),
         item: ItemConfig(

           activeForegroundColor: Theme.of(context).textTheme.titleSmall!.color??Colors.transparent,
           activeColorSecondary: AppColors.primary.withOpacity(.8),
           textStyle: TextStyle(fontSize: DeviceSizes.size14),
                     icon:Padding(
                       padding:  EdgeInsets.symmetric(vertical:2.0),
                       child: Image.asset('images/menu.png',height: DeviceSizes.custom(2.6),width: DeviceSizes.custom(2.6),fit: BoxFit.cover,color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor!,),
                     ),
           title: "Assistants",
         ),
       ),
       PersistentTabConfig(
         screen: const HistoryPage(),
         item: ItemConfig(
           activeForegroundColor: Theme.of(context).textTheme.titleSmall!.color??Colors.transparent,
           activeColorSecondary: AppColors.primary.withOpacity(.8),
           textStyle: TextStyle(fontSize: DeviceSizes.size14),
           icon:Image.asset('images/history.png',height: DeviceSizes.custom(3),width: DeviceSizes.custom(3),fit: BoxFit.cover,color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor!,),
           title: "History",
         ),
       ),
       PersistentTabConfig(
         screen: const SettingPage(),
         item: ItemConfig(
           activeForegroundColor: Theme.of(context).textTheme.titleSmall!.color??Colors.transparent,
           activeColorSecondary: AppColors.primary.withOpacity(.8),
           textStyle: TextStyle(fontSize: DeviceSizes.size14),

           icon:Image.asset('images/settings.png',height: DeviceSizes.custom(3),width: DeviceSizes.custom(3),fit: BoxFit.cover,color: Theme.of(context).bottomNavigationBarTheme.unselectedItemColor!,),
           title: "Settings",
         ),
       ),
     ],
     navBarBuilder: (navBarConfig) => Style2BottomNavBar(
       navBarConfig: navBarConfig,
       navBarDecoration: NavBarDecoration(
         color: Theme.of(context).bottomNavigationBarTheme.backgroundColor??Colors.white
       ),
     ),
   ),
      ),


    );
  }
}
