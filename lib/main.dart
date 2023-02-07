import 'package:flutter/material.dart';
import 'package:three_window_layout/app/app.locator.dart';
import 'package:three_window_layout/app/app.router.dart';
import 'package:provider/provider.dart';
import 'package:three_window_layout/components/theme/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appRouter = locator<AppRouter>();

    return ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: Consumer<ThemeProvider>(
          builder: (context, ThemeProvider value, child) {
            return MaterialApp.router(
              title: "Three Window Layout",
              debugShowCheckedModeBanner: false,
              theme: value.isDark ? value.darkThemeData : value.lightThemeData,
              routerDelegate: appRouter.delegate(),
              routeInformationParser: appRouter.defaultRouteParser(),
              routeInformationProvider: appRouter.routeInfoProvider(),
            );
          },
        ));
  }
}
