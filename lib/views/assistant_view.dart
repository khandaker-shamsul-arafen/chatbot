import 'package:chat_bot/utils/app_colors.dart';
import 'package:chat_bot/utils/app_sizes.dart';
import 'package:chat_bot/utils/common.dart';
import 'package:chat_bot/widget/assistant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/assistant_model.dart';
import '../controllers/chat_field_controller.dart';
import 'dart:math';


class AssistantView extends StatefulWidget {
  const AssistantView({super.key});

  @override
  State<AssistantView> createState() => _AssistantViewState();
}

class _AssistantViewState extends State<AssistantView>with TickerProviderStateMixin  {
  ChatPageController chatPageController =Get.find();
  int tabIndex = 0;
  TabController? _tabController;
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.cyan,
  ];

  @override

  void initState() {
    _tabController = TabController(
      // newsController.pannelLeagueNewsList.length
        vsync: this,
        length: chatPageController.assistant .length)
      ..addListener(
            () {
          setState(() {
            tabIndex = _tabController!.index;

          });

        },
      );


    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Column(
        children: [
          TabBar(
            isScrollable: true,
            controller: _tabController,
            labelColor: AppColors.primaryText,
            indicator: const BoxDecoration(color: Colors.transparent),
            indicatorPadding:
            EdgeInsets.symmetric(horizontal: DeviceSizes.custom(1), vertical: DeviceSizes.custom(.5),)
                .copyWith(bottom: 0),
            labelPadding: (Get.width > 600)
                ? const EdgeInsets.symmetric(horizontal: 8)
                : const EdgeInsets.symmetric(horizontal: 8),
            unselectedLabelColor:AppColors.primary,
            labelStyle: TextStyle(
              fontSize: DeviceSizes.size16,
              fontWeight: FontWeight.w500,
            ),
            tabs: [
              ...List.generate(
                chatPageController.assistant.keys.length,
                    (index) => Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 7),
                  decoration: BoxDecoration(
                    color: (tabIndex==index)?AppColors.primary:Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color:AppColors.primary),
                  ),
                  child: Tab(
                    height: DeviceSizes.custom(3),
                    text: chatPageController.assistant.keys.toList()[index],
                  ),
                ),
              )
            ],
          ),
                SizedBox(
                  height: DeviceSizes.custom(1),
                ),
                Obx(
                () => SizedBox(
                  height: DeviceSizes.custom(76),
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tabController,
                      children: List.generate(chatPageController.assistant.keys.length, (index) {
                      String key = chatPageController.assistant.keys.toList()[index];
                      List<AssistantModel> models = chatPageController.assistant[key]!;
                      return (index!=0)? GridView.builder(
                                            padding:  EdgeInsets.only(top: DeviceSizes.custom(1.6),  right: DeviceSizes.custom(1.8),),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: (Get.width > 600) ? 3 : 2,
                        crossAxisSpacing: DeviceSizes.custom(DeviceSizes.custom(.1),),
                        mainAxisSpacing: DeviceSizes.custom(2),
                        //childAspectRatio: 1.0
                        ),
                        itemCount: models.length,
                        itemBuilder: (BuildContext ctx, index) {
                        final model = models[index];

                        return AssistantWidget(model,colors[Random().nextInt(colors.length)]
                        );
                        }
                        ):
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            ...List.generate(chatPageController.allAssistant.length,(index3)

                           {
                             String keyall = chatPageController.allAssistant.keys.toList()[index3];
                             List<List<AssistantModel>> modelsall = chatPageController.allAssistant[keyall]!;
                             return      Column(
                               children: [
                                 Padding(
                                   padding:  EdgeInsets.symmetric(horizontal:DeviceSizes.custom(3),vertical:DeviceSizes.custom(1.6) ).copyWith(right: DeviceSizes.custom(2),),
                                   child: SizedBox(
                                     width: Get.width,
                                     child: Row(
                                       children: [
                                         Text(keyall,style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                           fontSize: DeviceSizes.size18,
                                         ),),
                                         const Spacer(),
                                        Icon(Icons.arrow_forward_ios_sharp,color: AppColors.primary.withOpacity(.7),size: DeviceSizes.custom(2.4),)
                                       ],
                                     ),
                                   ),
                                 ),
                                 ...List.generate(modelsall.length, (element){
                                   return SizedBox(
                                     width: Get.width,
                                     height: DeviceSizes.custom(23.5),

                                     child: ListView.builder(
                                       padding: EdgeInsets.only(right: DeviceSizes.custom(1.8),),
                                       scrollDirection: Axis.horizontal,
                                       itemCount: modelsall[element].length,

                                       itemBuilder: (context, itemIndex) {
                                         final model = modelsall[element][itemIndex];
                                         return                                  AssistantWidget(model,colors[Random().nextInt(colors.length)]
                                         );

                                       },
                                     ),
                                   );
                                 })

                               ],
                             );
                           }
                            ),




                          ],
                        ),


                      );
                      }
                      ),
                                  
                  ),
                ),
                ),
        ]


      ),
    );
  }
}
