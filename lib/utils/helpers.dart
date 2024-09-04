import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get_storage/get_storage.dart';

import 'app_colors.dart';

goURL(url) async {
  Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    dd('Could not launch $uri');
  }
}

showToastMessage(String message, [ToastGravity gravity = ToastGravity.BOTTOM]) {
  if (message != '') {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.grey.shade800,
      textColor: Colors.white,
      fontSize: 14.0,
    );
  }
}

showSnackBarMessage(String message, [callback, int duration = 5]) {
  if (!kDebugMode && message == 'Server error! Please try again.') {
    return;
  }
  final snackBar = SnackBar(
    content: Text(message),
    backgroundColor: Colors.grey[800],
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: duration),
    action: callback != null
        ? SnackBarAction(
            label: 'Refresh',
            textColor: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
              callback();
            },
          )
        : null,
  );

  ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
}

String? convertUrlToId(String url, {bool trimWhitespaces = true}) {
  if (!url.contains("http") && (url.length == 11)) return url;
  if (trimWhitespaces) url = url.trim();

  for (var exp in [
    RegExp(
        r"^https:\/\/(?:www\.|m\.)?youtube\.com\/watch\?v=([_\-a-zA-Z0-9]{11}).*$"),
    RegExp(
        r"^https:\/\/(?:www\.|m\.)?youtube(?:-nocookie)?\.com\/embed\/([_\-a-zA-Z0-9]{11}).*$"),
    RegExp(r"^https:\/\/youtu\.be\/([_\-a-zA-Z0-9]{11}).*$")
  ]) {
    Match? match = exp.firstMatch(url);
    if (match != null && match.groupCount >= 1) return match.group(1);
  }

  return null;
}

String getThumbnail({
  required String url,
  bool webp = true,
}) {
  String videoId = convertUrlToId(url) ?? '';
  return webp
      ? 'https://img.youtube.com/vi/$videoId/0.jpg'
      : 'https://i3.ytimg.com/vi/$videoId/0.jpg';
}





loadDatePicker(
    {required DateTime initialDate,
    required Null Function(DateTime date) onChange}) async {
  final DateTime? date = await showDatePicker(
    context: Get.context!,
    initialDate: initialDate,
    firstDate: DateTime.now().add(const Duration(days: -30)),
    lastDate: DateTime.now().add(const Duration(days: 30)),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: AppColors.primary,
          colorScheme: ColorScheme.light(
            primary: Theme.of(context).primaryColor,
          ),
          buttonTheme:
              const ButtonThemeData(textTheme: ButtonTextTheme.primary),
        ),
        child: child!,
      );
    },
  );

  if (date != null) {
    onChange(date);
  }
}

Widget showCachedImage(
  String imageUrl, {
  double? height = double.infinity,
  double? width = double.infinity,
  BoxFit fit = BoxFit.fill,
  Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder,
  Widget Function(BuildContext, String, DownloadProgress)?
      progressIndicatorBuilder,
  Widget Function(BuildContext, String, dynamic)? errorWidget,
  Widget Function(BuildContext, String)? placeholder,
  bool hide = true,
}) {
  // return Image.asset(
  //   'assets/images/default-team.png',
  //   height: height,
  //   width: width,
  //   fit: fit,
  // );

  return CachedNetworkImage(
    imageUrl: imageUrl,
    height: height,
    width: width,
    fit: fit,
    imageBuilder: imageBuilder,
    errorWidget: errorWidget ??
        (context, url, error) {
          return Center(
            child: Image.asset(
              'assets/icons/security.png',
              height: height,
              width: width,
              fit: fit,
            ),
          );
        },
    // progressIndicatorBuilder: progressIndicatorBuilder ?? null,
    placeholder: placeholder ??
        (context, url) {
          return SizedBox(
            height: height,
            width: width,
            child: const Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                ),
              ),
            ),
          );
        },
  );
}

// initNotification({required Null Function(RemoteMessage message) onOpen}) async {
//   dd('initNotification');

//   FirebaseMessaging messaging = FirebaseMessaging.instance;

//   NotificationSettings settings = await messaging.requestPermission(
//     alert: true,
//     announcement: false,
//     badge: true,
//     carPlay: false,
//     criticalAlert: false,
//     provisional: false,
//     sound: true,
//   );

//   if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//     dd('User granted permission');
//   } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
//     dd('User granted provisional permission');
//   } else {
//     dd('User declined or has not accepted permission');
//   }

//   //dd(await FirebaseMessaging.instance.getToken());
//   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//     alert: true,
//     badge: true,
//     sound: true,
//   );

//   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
//     onOpen(message);
//   });

//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     dd(message.notification?.title);
//   });
// }

Future<String> getFcmToken() {
  return Future.value('');
}

getStorage(key) {
  var box = GetStorage();
  return box.read(key);
}

putStorage(key, value) {
  var box = GetStorage();
  box.write(key, value);
}

dd(object, {isShowLog = false}) {
  if (kDebugMode) {
    if (!isShowLog) {
      print(object);
    } else {
      log(object.toString());
    }
  }
}

Widget showImage(
  String imageUrl, {
  double? height = double.infinity,
  double? width = double.infinity,
  BoxFit fit = BoxFit.fill,
  Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder,
  Widget Function(BuildContext, String, DownloadProgress)?
      progressIndicatorBuilder,
  Widget Function(BuildContext, String, dynamic)? errorWidget,
  Widget Function(BuildContext, String)? placeholder,
  bool hide = true,
}) {
  // if (settingController.isAppInreview.value && hide) {
  //   return Image.asset(
  //     'assets/images/default-team.png',
  //     height: height,
  //     width: width,
  //     fit: fit,
  //   );
  // }

  return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: fit,
      imageBuilder: imageBuilder,
      errorWidget: errorWidget ??
          (context, url, error) {
            return Center(
              child: Image.asset(
                'assets/icons/security.png',
                height: height,
                width: width,
                fit: fit,
              ),
            );
          },
      // progressIndicatorBuilder: progressIndicatorBuilder ?? null,
      placeholder: (context, url) => SizedBox(
            child: Transform.scale(
              scale: .3,
              child: const CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
          ));
}

copyToClipboard(String content) {
  Clipboard.setData(ClipboardData(text: content)).then((_) {
    showToastMessage('Copied to Clipboard');
  });
}
