import 'package:flutter/material.dart';
import 'package:three_window_layout/components/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:three_window_layout/components/theme/theme_loader.dart';

class ThemeProvider extends ChangeNotifier{

  bool _isDark = true;
  get isDark => _isDark;

  toggleTheme(bool val){
    ThemeLoader themeLoader = ThemeLoader();
    themeLoader.setTheme(val);
    _isDark = val;
    notifyListeners();
  }

  loadTheme() async {
    ThemeLoader themeLoader = ThemeLoader();
    _isDark = await themeLoader.getCurrentTheme() ?? true;
  }

  ThemeProvider(){
    loadTheme();
  }

  dynamic useColorModeValue(dynamic light, dynamic dark){
    return _isDark ? dark : light;
  }

  ThemeData darkThemeData = ThemeData( 
    primaryColor: Constants.dark,
    colorScheme: ColorScheme.fromSwatch().copyWith(background: Constants.dark),
    textTheme: GoogleFonts.mPlusRounded1cTextTheme().apply(bodyColor: Constants.lightTextColor),
    scaffoldBackgroundColor: Constants.dark,
    inputDecorationTheme: InputDecorationTheme(hintStyle: GoogleFonts.mPlusRounded1c()),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent)
    );

  ThemeData lightThemeData = ThemeData( 
    primaryColor: Constants.light,
    colorScheme: ColorScheme.fromSwatch().copyWith(background: Constants.light),
    textTheme: GoogleFonts.mPlusRounded1cTextTheme().apply(bodyColor: Constants.darkTextColor),
    inputDecorationTheme: InputDecorationTheme(hintStyle: GoogleFonts.mPlusRounded1c()),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
    scaffoldBackgroundColor: Constants.light,
  );
}
