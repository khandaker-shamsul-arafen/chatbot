import 'dart:async';
import 'dart:convert';

import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:chat_bot/utils/app_sizes.dart';
import 'package:chat_bot/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:speech_to_text_google_dialog/speech_to_text_google_dialog.dart';
import '../controllers/chat_field_controller.dart';
import '../utils/app_colors.dart';
import '../utils/helpers.dart';
import '../widget/chat_page_nodata_widget.dart';
import 'package:intl/intl.dart';


class ChatPage extends StatefulWidget {
  const ChatPage({super.key,});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  ChatPageController chatPageController =Get.find();


  Timer? _debounce;

  @override
  void initState() {
    super.initState();
  //  _initSpeech();




  }

  @override
  void dispose() {
    super.dispose();
  }


  // Future<bool> getMicrophonePermission() async {
  //   bool hasPermission = await _speechToText.initialize(
  //     onError: (error) => print('Error initializing speech recognition: $error'),
  //   );
  //
  //   if (!hasPermission) {
  //     bool isPermissionGranted = await _speechToText.hasPermission;
  //
  //     if (!isPermissionGranted) {
  //     //  print('Microphone permission not granted');
  //     }
  //
  //     return isPermissionGranted;
  //   }
  //
  //   return true;
  // }
  /// This has to happen only once per app
  // void _initSpeech() async {
  //  // _speechEnabled = await _speechToText.initialize();
  //   setState(() {});
  // }
  //
  // void _startListening() async {
  //   await _speechToText.listen(onResult: _onSpeechResult);
  // }
  //
  //
  // void _stopListening() async {
  //   await _speechToText.stop();
  //   setState(() {});
  // }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  // void _onSpeechResult(SpeechRecognitionResult result) {
  //
  //   // chatPageController.queryController.value.text  = result.recognizedWords;
  //   // onSearch( chatPageController.queryController.value.text);
  //
  // }
  //
  onSearch(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
     (chatPageController.totalChance.value==0)?QuickAlert.show(
       context: context,
       type: QuickAlertType.info,
       text: 'Update your plan for  unlimited search',
     ) :_debounce = Timer(const Duration(seconds: 1), () {
      chatPageController.question.add(query);
      chatPageController.geminiAiResponse(query);
      chatPageController.queryController.value.clear();
      if (chatPageController.questionStore.containsKey(DateFormat('EEE, MMM d, yy').format(
          DateTime.now()
      ),)) {
        chatPageController.questionStore[DateFormat('EEE, MMM d, yy').format(
            DateTime.now()
        )]!.add(query);
        chatPageController.questionStore.refresh();
      } else {
        chatPageController.questionStore[DateFormat('EEE, MMM d, yy').format(
            DateTime.now()
        )] = [query];
      }

      putStorage('question', jsonEncode (chatPageController.questionStore.value));
      Timer(const Duration(milliseconds: 500),
            () => chatPageController.controller.jumpTo(chatPageController.controller.position.maxScrollExtent),);



    },
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        title: Text('Chat',style: Theme.of(context).textTheme.titleSmall,),
          centerTitle: true,

          actions: [
            SizedBox(
              width: DeviceSizes.custom(7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/clock.png',height: DeviceSizes.custom(3),width: DeviceSizes.custom(2),fit: BoxFit.cover,),
                  3.spaceX,
                Obx(()=>  Text(chatPageController.totalChance.value.toString(),style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: DeviceSizes.size16
                ),),),
                  10.spaceX
                ],
              ),
            ),
          ],


      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal:DeviceSizes.custom(1.8),),
        child:  Obx((){
          final bottomInsets = MediaQuery.of(context).viewInsets.bottom;
          bool isKeyboardOpen = bottomInsets != 0;
          chatPageController.focus.value=isKeyboardOpen;
          print('shanto${ chatPageController.focus.value}');
          if(chatPageController.question.isEmpty){
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
              
                    children: [
                      column1Widget(),
                      30.spaceY,
                      Obx((){
                        return  Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
              
              
                                height:DeviceSizes.custom(8),
                                width: DeviceSizes.custom(40),
                                color: Theme.of(context).scaffoldBackgroundColor,
                                child: Focus(
              
                                  child: AnimatedTextField(
                                    maxLines: 1,
                                    onSubmitted:    onSearch
                                    ,
                                    controller:chatPageController.queryController.value ,
                                    animationType: Animationtype.typer, // Use Animationtype.typer for Type Write Style animations
                                    hintTextStyle: Theme.of(context).textTheme.titleSmall,
                                    hintTexts: const [
                                      'You  can search anything',
              
                                    ],
                                    decoration: InputDecoration(
                                      suffixIcon:   InkWell(
                                        onTap:
                                            () async{

                                          ( chatPageController.focus.value)?onSearch(chatPageController.queryController.value.text.trim()):SpeechToTextGoogleDialog.getInstance()
                                              .showGoogleDialog(

                                            onTextReceived: (data) {
                                              chatPageController.queryController.value.text  = data.toString();
                                              onSearch( chatPageController.queryController.value.text);
                                            },
                                            // locale: "en-US",
                                          );
                                        },

                                        child: Icon(chatPageController.focus.value? Icons.send : Icons.mic ,color: Theme.of(context).textTheme.titleSmall!.color,),
                                      ),

                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(color:Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.1), width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(DeviceSizes.custom(1.8)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color:(chatPageController.focus.value)? AppColors.primary:Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.3), width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(DeviceSizes.custom(1.8)),
                                      ),
                                      contentPadding: EdgeInsets.all(12),
              
                                    ),
                                  ),
                                ),
                              ),
              
              
                            ],
                          ),
                        );
                      },),
              
              
                    ],
                  ),
                ],
              ),
            );
          }

          return  Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  Flexible(

                    child: InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: ((){
                        FocusManager.instance.primaryFocus?.unfocus(

                        ) ;

                      }
                      ),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(bottom: 10),
                          controller:chatPageController.controller,
                          itemCount:  chatPageController.question.length,
                          itemBuilder: (BuildContext context,int index){


                            return  Column(
                              children: [
                                ChatBubble(

                                  clipper: ChatBubbleClipper5(type: BubbleType.sendBubble),
                                  alignment: Alignment.bottomRight,
                                  shadowColor:Colors.transparent,
                                  margin: const EdgeInsets.only(top: 20),
                                  backGroundColor: Theme.of(context).primaryColor,
                                  child: Container(
                                    constraints: BoxConstraints(
                                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                                    ),
                                    child:  Text(
                                      chatPageController.question[index] ,
                                      style: Theme.of(context).textTheme.titleSmall,
                                    ),
                                  ),
                                ).animate().fadeIn(),
                                Obx((){

                                  return (chatPageController.answer.length==index)?   const SizedBox() :  ChatBubble(
                                        clipper: ChatBubbleClipper5(type: BubbleType.receiverBubble),
                                        alignment: Alignment.bottomLeft,
                                    shadowColor:Colors.transparent,

                                    margin: const EdgeInsets.only(top: 20),
                                        backGroundColor: AppColors.primary,
                                        child: Container(
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context).size.width * 0.7,
                                          ),
                                          child:  Text(
                                            chatPageController.answer[index] ,
                                            style: Theme.of(context).textTheme.titleSmall,
                                          ),
                                        ),
                                      ).animate().fadeIn();

                                },)
                              ],
                            );

                          },
                        ),
                      ),
                    ),
                  ),
                  Obx((){
                    return  Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(


                            height:DeviceSizes.custom(8),
                            width: DeviceSizes.custom(40),
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: Focus(

                              child: AnimatedTextField(
                                maxLines: 1,
                                onSubmitted:    onSearch
                                ,
                                controller:chatPageController.queryController.value ,
                                animationType: Animationtype.typer, // Use Animationtype.typer for Type Write Style animations
                                hintTextStyle: Theme.of(context).textTheme.titleSmall,
                                hintTexts: const [
                                  'You  can search anything',

                                ],
                                decoration: InputDecoration(
                                  suffixIcon:   InkWell(
                                    onTap:
                                        () async{
                                 //   chatPageController.focus.value?chatPageController.speechEnabled.value=false:chatPageController.speechEnabled.value=true;

                                      //  (  chatPageController.focus.value)?onSearch(chatPageController.queryController.value.text.trim()) :  _speechToText.isNotListening ? _startListening : _stopListening;
                                      (  chatPageController.focus.value)?    onSearch(chatPageController.queryController.value.text.trim()):SpeechToTextGoogleDialog.getInstance()
                                          .showGoogleDialog(

                                        onTextReceived: (data) {
                                          chatPageController.queryController.value.text  = data.toString();
                                          onSearch( chatPageController.queryController.value.text);
                                          //    chatPageController.speechEnabled.value=false;
                                        },
                                        // locale: "en-US",
                                      ); ;
                                    },

                                    child: Icon(chatPageController.focus.value? Icons.send : Icons.mic ,color: Theme.of(context).textTheme.titleSmall!.color,),
                                  ),


                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color:Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.1), width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(DeviceSizes.custom(1.8)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color:(chatPageController.focus.value)? AppColors.primary:Theme.of(context).textTheme.titleSmall!.color!.withOpacity(.3), width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(DeviceSizes.custom(1.8)),
                                  ),
                                  contentPadding: EdgeInsets.all(12),

                                ),
                              ),
                            ),
                          ),


                        ],
                      ),
                    );
                  },),

                ],
              ),
            ],
          );
        },)



      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Column column1Widget() {
    return Column(
      children: [
        40.spaceY,
        Image.asset('images/brain.png',height: DeviceSizes.custom(12),width: DeviceSizes.custom(12),fit: BoxFit.cover,),

        30.spaceY,
        Text('Capabilities',style: Theme.of(context).textTheme.titleSmall!.copyWith(
          fontSize: DeviceSizes.size26,
          fontWeight: FontWeight.w600
        ),),
        30.spaceY,
        const ChatPageNodataWidget('Answer all your questions.\n (just ask me anything you like!)'),

        const ChatPageNodataWidget('Generate all the text you want.\n (essays, articles,reports,stories,& more)'),
        const ChatPageNodataWidget('Conversational AI\n (I can talk to you like a natural human)'),

        30.spaceY,
        Text("These are just few examples of what i can do",style: Theme.of(context).textTheme.titleSmall,)
      ],
    );

  }






}