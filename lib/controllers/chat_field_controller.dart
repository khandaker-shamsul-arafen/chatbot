import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../utils/helpers.dart';
import 'assistant_model.dart';

class ChatPageController extends GetxController{

  final Rx<TextEditingController> queryController = TextEditingController().obs;

Rx isLoading =true.obs;

  RxList<String>answer=<String>[].obs;


  RxMap<String,List<AssistantModel>> assistant=<String,List<AssistantModel>>{}.obs;
  RxList<String> question=<String>[].obs;
  RxMap<String,List<dynamic>> questionStore=<String,List<dynamic>>{}.obs;
  RxMap<String,List<List<AssistantModel>>> allAssistant=<String,List<List<AssistantModel>>>{}.obs;
  static const apiKey = 'AIzaSyADsG7ABUV6DxXS25YrCKQL_dWSJ6YTdcY';
  ScrollController controller = ScrollController();
  RxBool  focus = false.obs;
  RxBool speechEnabled = false.obs;
  RxInt totalChance=3.obs;



  AssistantModel model1 = AssistantModel(
    key:'writing',
    image: 'path/to/image1.png',
    header: 'Write an Articles',
    description: 'Generate well written articles an any topic you want ',
  );

  AssistantModel model2 = AssistantModel(
    key:'writing',

    image: 'path/to/image2.png',
    header: 'Academic Writer',
    description: 'Generate educational writing such as essays reports etc',
  );
  AssistantModel model7 = AssistantModel(
    key:'writing',

    image: 'path/to/image2.png',
    header: 'Summarize(Tl;DR)',
    description: 'Extract key  points from long texts',
  );
  AssistantModel model3 = AssistantModel(
    key:'Creative',

    image: 'path/to/image2.png',
    header: 'Songs / Lyrics',
    description: 'Generate lyrics from any music genre you want',
  );
  AssistantModel model4 = AssistantModel(
    key:'Creative',

    image: 'path/to/image2.png',
    header: 'Storyteller',
    description: 'Generate Stories from any given topic',
  );
  AssistantModel model5 = AssistantModel(
    key:'Business',

    image: 'path/to/image2.png',
    header: 'Email Writer',
    description: 'Generate templates for emails letters etc',
  );
  AssistantModel model6 = AssistantModel(
    key:'Business',

    image: 'path/to/image2.png',
    header: 'Answer Interviewer',
    description: 'Generate answer to interview questions',
  );
  AssistantModel model8 = AssistantModel(
    key:'Social Media',

    image: 'path/to/image2.png',
    header: 'Linkedin',
    description: 'Create attention grabbing post on Linkedin',
  );
  AssistantModel model9 = AssistantModel(
    key:'Social Media',

    image: 'path/to/image2.png',
    header: 'Instagram',
    description: 'Write captions that attract audience on Instagram',
  );
  AssistantModel model10 = AssistantModel(
    key:'Developer',

    image: 'path/to/image2.png',
    header: 'Write Code',
    description: 'Write codes in any programming language',
  );
  AssistantModel model11 = AssistantModel(
    key:'Developer',

    image: 'path/to/image2.png',
    header: 'Explain Code',
    description: 'Explain complicated programming code snippets',
  );

  addData(){


    // Add data to the map
    assistant['All'] = [model1,model2,model3,model4];
    assistant['Writing'] = [model2, model1,model7];
    assistant['Creative'] = [model3,model4];
    assistant['Business'] = [model5, model6]; 
    assistant['Social Media'] = [model5, model6];
    assistant['Developer'] = [model10, model11];

    assistant.entries.map((element){
    allAssistant[element.key]=[element.value];
    }).toList();
    // Example with multiple models under the same key

  }









  geminiAiResponse(String massage) async {

    final model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: apiKey,
      generationConfig: GenerationConfig(maxOutputTokens: 500),
    );
    final geminichat = model.startChat();
    var content = Content.text(massage);
    var response = await geminichat.sendMessage(content);
   answer.add(response.text??'');
    Timer(Duration(milliseconds: 500),
            () => controller.jumpTo(controller.position.maxScrollExtent),);
totalChance.value=totalChance.value-1;
    putStorage('totalChance', totalChance.value);

   isLoading.value = false;
  }



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    var history = getStorage('question');

    if (history != null ) {
      questionStore.clear();
      Map<String, dynamic> decodedMap = jsonDecode(history);
      questionStore.value = decodedMap.map((key, value) =>
          MapEntry(key, List<String>.from(value)));
    }


    var total = getStorage('totalChance');
    if (total != null ) {
    totalChance.value=total;
    }

    addData();

}
}