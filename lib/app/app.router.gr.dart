// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app.router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    AppRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const AppScaffold(),
        durationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeTab.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const BasePageView(),
        durationInMilliseconds: 0,
        opaque: true,
        barrierDismissible: false,
      );
    },
    Home.name: (routeData) {
      final args = routeData.argsAs<HomeArgs>();
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: HomePageView(
          key: args.key,
          currentPage: args.currentPage,
          toggleDrawer: args.toggleDrawer,
        ),
      );
    },
    Drawer.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const DrawerView(),
      );
    },
    Content.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const ContentPageView(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          AppRoute.name,
          path: '/',
          children: [
            RouteConfig(
              HomeTab.name,
              path: '',
              parent: AppRoute.name,
              children: [
                RouteConfig(
                  Home.name,
                  path: 'home-page-view',
                  parent: HomeTab.name,
                ),
                RouteConfig(
                  Drawer.name,
                  path: 'drawer-view',
                  parent: HomeTab.name,
                ),
                RouteConfig(
                  Content.name,
                  path: 'content-page-view',
                  parent: HomeTab.name,
                ),
              ],
            )
          ],
        )
      ];
}

/// generated route for
/// [AppScaffold]
class AppRoute extends PageRouteInfo<void> {
  const AppRoute({List<PageRouteInfo>? children})
      : super(
          AppRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'AppRoute';
}

/// generated route for
/// [BasePageView]
class HomeTab extends PageRouteInfo<void> {
  const HomeTab({List<PageRouteInfo>? children})
      : super(
          HomeTab.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'HomeTab';
}

/// generated route for
/// [HomePageView]
class Home extends PageRouteInfo<HomeArgs> {
  Home({
    Key? key,
    required int currentPage,
    required void Function() toggleDrawer,
  }) : super(
          Home.name,
          path: 'home-page-view',
          args: HomeArgs(
            key: key,
            currentPage: currentPage,
            toggleDrawer: toggleDrawer,
          ),
        );

  static const String name = 'Home';
}

class HomeArgs {
  const HomeArgs({
    this.key,
    required this.currentPage,
    required this.toggleDrawer,
  });

  final Key? key;

  final int currentPage;

  final void Function() toggleDrawer;

  @override
  String toString() {
    return 'HomeArgs{key: $key, currentPage: $currentPage, toggleDrawer: $toggleDrawer}';
  }
}

/// generated route for
/// [DrawerView]
class Drawer extends PageRouteInfo<void> {
  const Drawer()
      : super(
          Drawer.name,
          path: 'drawer-view',
        );

  static const String name = 'Drawer';
}

/// generated route for
/// [ContentPageView]
class Content extends PageRouteInfo<void> {
  const Content()
      : super(
          Content.name,
          path: 'content-page-view',
        );

  static const String name = 'Content';
}
