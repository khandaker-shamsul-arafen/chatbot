import 'dart:ffi';

import 'package:chat_bot/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../controllers/chat_field_controller.dart';
import '../utils/app_colors.dart';
import '../utils/app_sizes.dart';
import 'chat_page.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  ChatPageController chatPageController =Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx((){
      if (chatPageController.questionStore.value.entries.toList().isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/noData.gif',
                width: DeviceSizes.custom(15),
                height: DeviceSizes.custom(15),
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                'Data Not Found',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: DeviceSizes.size16,
                ),
              ),
            ],
          ),
        );
      }


      var entries = chatPageController.questionStore.value.entries.toList();

      return  Column(
        children: [
          ...List.generate(entries.length, (index1){
            var entry = entries[index1];
            return       Expanded(
              child:  ListView.builder(
             //   physics: NeverScrollableScrollPhysics(),
                itemCount: entry.value.length,
                itemBuilder: (context, index) {

                  return  ZoomTapAnimation(
                    onTap: (){
                      chatPageController.queryController.value.text=entry.value[index].toString();

                      Get.to(()=>const ChatPage(), transition: Transition.leftToRightWithFade,duration: const Duration(milliseconds: 600));
                    },
                    child: Builder(
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: DeviceSizes.custom(2.3),horizontal: DeviceSizes.custom(2)),

                          margin: EdgeInsets.symmetric(horizontal: DeviceSizes.custom(1.6),).copyWith(bottom: DeviceSizes.custom(2)),
                          decoration: BoxDecoration(
                            border: Border.all(  color: Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.7)
                                ,width: .1),
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(DeviceSizes.custom(2),),


                          ),
                          child:  Row(
                            children: [
                              Image.asset('images/brain.png',height: DeviceSizes.custom(4),width: DeviceSizes.custom(4),fit: BoxFit.cover,),

                              SizedBox(
                                width: DeviceSizes.custom(2),
                              ),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:DeviceSizes.custom(30),

                                    child: Text(entry.value[index].toString(),
                                      maxLines: 10,
                                      //textAlign: TextAlign.justify,
                                      style: Theme.of(context).textTheme.titleSmall!.copyWith(

                                          fontSize: DeviceSizes.size13,
                                          letterSpacing: 1,
                                          height: 1.2,

                                          fontWeight: FontWeight.w600
                                      ),),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(top:DeviceSizes.custom(.6),),
                                    child: Text(entry.key,
                                      maxLines: 1,
                                      textAlign: TextAlign.justify,
                                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                          color: Theme.of(context).textTheme.titleSmall!.color?.withOpacity(.7),
                                          fontSize: DeviceSizes.size12,
                                          letterSpacing: 1,

                                          fontWeight: FontWeight.w400
                                      ),),
                                  ),


                                ],
                              ),

                              const Spacer(),
                              Icon(Icons.arrow_forward_ios_sharp,size: DeviceSizes.custom(2.2),color:Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.6) ,)





                            ],
                          ),
                        );
                      }
                    ),
                  );


                },),



            );

          }),

      // SizedBox(
      //   height:DeviceSizes.custom(2) ,
      // )
        ],
      );
    });



  }


}