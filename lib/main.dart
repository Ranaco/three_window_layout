import 'package:flutter/material.dart';
import 'package:three_window_layout/app/app.locator.dart';
import 'package:three_window_layout/app/app.router.dart';

void main(){
  setupLocator();
  runApp(const App());
}

class App extends StatelessWidget{
  const App({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context){
   
    final appRouter = locator<AppRouter>();

    return MaterialApp.router(
        title: "Three Window Layout",
        debugShowCheckedModeBanner: false,
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        routeInformationProvider: appRouter.routeInfoProvider(),
      );
  }
}
