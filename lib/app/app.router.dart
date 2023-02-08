import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:three_window_layout/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:three_window_layout/pages/base_page.dart';
import 'package:three_window_layout/pages/content_page/content_page_view.dart';
import 'package:three_window_layout/pages/drawer/drawer_view.dart';
import 'package:three_window_layout/pages/homepage/homepage_view.dart';
part 'package:three_window_layout/app/app.router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'View|Page|Dialog,Route',
  routes: [
    CustomRoute(
        page: AppScaffold,
        name: 'AppRoute',
        path: '/',
        durationInMilliseconds: 0,
        children: [
          CustomRoute(
            durationInMilliseconds: 0,
            name: 'HomeTab',
            page: BasePageView,
                  initial: true,
                  children: [
              AutoRoute(
                  page: HomePageView,
                  name: 'home'
                ),
              AutoRoute( 
                  page: DrawerView,
                  name: 'drawer'
                ),
              AutoRoute( 
                  page: ContentPageView, 
                  name: 'content'
                )
                  ]
            )
        ]
      )
  ]

)

@singleton
class AppRouter extends _$AppRouter{}

