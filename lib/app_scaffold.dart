import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:three_window_layout/app/app.router.dart';

class AppScaffold extends StatelessWidget{

  const AppScaffold({Key? key}):super(key: key);

  @override 
  Widget build(BuildContext context){
    return const AutoTabsScaffold(
        routes: [HomeTab()],
        homeIndex: 0,
      );
  }
}

