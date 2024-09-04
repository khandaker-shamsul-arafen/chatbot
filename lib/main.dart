// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_recognition_result.dart';
// import 'package:speech_to_text/speech_to_text.dart';
//
//
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   SpeechToText _speechToText = SpeechToText();
//
//   bool _speechEnabled = false;
//   String _lastWords = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _initSpeech();
//   }
//   Future<bool> getMicrophonePermission() async {
//     bool hasPermission = await _speechToText.initialize(
//       onError: (error) => print('Error initializing speech recognition: $error'),
//     );
//
//     if (!hasPermission) {
//       bool isPermissionGranted = await _speechToText.hasPermission;
//
//       if (!isPermissionGranted) {
//         print('Microphone permission not granted');
//       }
//
//       return isPermissionGranted;
//     }
//
//     return true;
//   }
//   /// This has to happen only once per app
//   void _initSpeech() async {
//     _speechEnabled = await _speechToText.initialize();
//     setState(() {});
//   }
//
//   /// Each time to start a speech recognition session
//   void _startListening() async {
//     await _speechToText.listen(onResult: _onSpeechResult);
//     setState(() {});
//   }
//
//   /// Manually stop the active speech recognition session
//   /// Note that there are also timeouts that each platform enforces
//   /// and the SpeechToText plugin supports setting timeouts on the
//   /// listen method.
//   void _stopListening() async {
//     await _speechToText.stop();
//     setState(() {});
//   }
//
//   /// This is the callback that the SpeechToText plugin calls when
//   /// the platform returns recognized words.
//   void _onSpeechResult(SpeechRecognitionResult result) {
//     setState(() {
//       _lastWords = result.recognizedWords;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Speech Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.all(16),
//               child: Text(
//                 'Recognized words:',
//                 style: TextStyle(fontSize: 20.0),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.all(16),
//                 child: Text(
//                   // If listening is active show the recognized words
//                   _speechToText.isListening
//                       ? '$_lastWords'
//                   // If listening isn't active but could be tell the user
//                   // how to start it, otherwise indicate that speech
//                   // recognition is not yet ready or not supported on
//                   // the target device
//                       : _speechEnabled
//                       ? 'Tap the microphone to start listening...'
//                       : 'Speech not available',
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed:
//         // If not yet listening for speech start, otherwise stop
//         _speechToText.isNotListening ? _startListening : _stopListening,
//         tooltip: 'Listen',
//         child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
//       ),
//     );
//   }
// }
import 'package:chat_bot/utils/app_theme.dart';
import 'package:chat_bot/utils/helpers.dart';
import 'package:chat_bot/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controllers/chat_field_controller.dart';
import 'views/subcription_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();



  //
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,

      theme: AppThemes.app(),
      themeMode: ThemeMode.system,
      darkTheme: AppThemes.app(isDark: true),

      title:'ChatBot',
      onGenerateRoute: (settings) {
        final routes = <String, WidgetBuilder>{
          // MainScreen.route: (BuildContext context) =>
          //     MainScreen(settings.arguments),
        };
        WidgetBuilder? builder = routes[settings.name];
        return MaterialPageRoute(builder: (context) => builder!(context));
      },
      onInit: () {
        bool isDark = getStorage('dark') ?? false;
        Get.changeThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);

        Get.put(ChatPageController());

      },
      home: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:SplashScreen(),
    );
  }
}
