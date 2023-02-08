import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:three_window_layout/components/constants.dart';
import 'package:three_window_layout/components/theme/theme_provider.dart';

class CustomDrawerHeader extends StatelessWidget{

  final Widget title;

  const CustomDrawerHeader({Key? key, required this.title}):super(key: key);

  @override
  Widget build(BuildContext context){
    return Consumer<ThemeProvider>(builder: (context, ThemeProvider themeProvider, child){
      return Container(
        alignment: Alignment.centerLeft,
      decoration:  BoxDecoration(
          border: Border(bottom:
            BorderSide(width: 1, 
              color:themeProvider.useColorModeValue(Constants.darkTextColor, Colors.grey.shade500))) 
        ),
        width: MediaQuery.of(context).size.width * 2/3,
        height: 70,
        child: title 
      );
    });
  }
}
