import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppThemes {
  static ThemeData app({bool isDark = false}) {
    return ThemeData(
      secondaryHeaderColor:
      isDark ? const Color(0xFF282837) : const Color(0xFFF6F8FE),
      useMaterial3: false,
      primaryColor: isDark ? AppColors.primaryWidget : AppColors.secondaryWidget,
    //  primarySwatch: AppColors.primaryMaterialColor,
      brightness: isDark ? Brightness.dark : Brightness.light,
      fontFamily: GoogleFonts.roboto().fontFamily,
      scaffoldBackgroundColor: isDark ? AppColors.primaryBackground : AppColors.secondaryBackground,

      appBarTheme: AppBarTheme(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
        // ),
        iconTheme: IconThemeData(
          color: isDark ? AppColors.primaryText:AppColors.bottomNavigationColor ,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
          statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        ),
        backgroundColor:isDark ? AppColors.bottomNavigationColor : AppColors.primaryText,
        elevation: 0,
      ),


      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: isDark ? AppColors.bottomNavigationColor : AppColors.secondaryWidget,
        selectedItemColor: AppColors.primary,
        unselectedItemColor:isDark ? AppColors.primaryText.withOpacity(.6):AppColors.secondaryText.withOpacity(.6),

      ),
      shadowColor: isDark ? const Color(0xFF1D1D2F) : Colors.black,
      iconTheme: IconThemeData(
        color: isDark ? AppColors.bottomNavigationColor : AppColors.primaryText,
      ),


      // outlinedButtonTheme: OutlinedButtonThemeData(
      //     style: ButtonStyle(
      //         textStyle: MaterialStatePropertyAll(TextStyle(
      //           color: isDark?AppColors.white:AppColors.dark,
      //         )),
      //         shape: MaterialStatePropertyAll(RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(12),
      //
      //         )),
      //         side: const MaterialStatePropertyAll(BorderSide(
      //           color: AppColors.primary,
      //           width: .5,
      //         ))
      //     )
      // ),

      // inputDecorationTheme: InputDecorationTheme(
      //   fillColor: const Color(0xFFF6F8FE),
      //   filled: true,
      //   hintStyle: const TextStyle(
      //     color:Colors.black54,
      //   ),
      //   border: OutlineInputBorder(
      //     borderSide: BorderSide.none,
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      //   focusedBorder: OutlineInputBorder(
      //     borderSide: const BorderSide(
      //       color: AppColors.primary,
      //       width: .2,
      //     ),
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      //   disabledBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      // ),

      //  )
    );
  }
}
