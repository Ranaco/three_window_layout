import 'package:flutter/material.dart';
import 'package:three_window_layout/pages/content_page/content_page_view.dart';
import 'package:three_window_layout/pages/drawer/drawer_view.dart';
import 'package:three_window_layout/pages/homepage/homepage_view.dart';
import 'package:three_window_layout/components/widget_cover.dart';

class BasePageView extends StatefulWidget {
  const BasePageView({Key? key}) : super(key: key);

  @override
  State<BasePageView> createState() => _BasePageViewState();
}

class _BasePageViewState extends State<BasePageView>{

  double tapDownPos = 0.0;
  bool drawerIsOpen = true;
  int currentPage = 1;
  double leftVal = 0.0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const double MIN_DRAG_DISTANCE = 80;

    toggleDrawer() {
      drawerIsOpen = !drawerIsOpen;
      setState(() {
        if (drawerIsOpen) {
          leftVal = leftVal - size.width * 2 / 3;
          currentPage = 1;
        } else {
          leftVal = leftVal + size.width * 2 / 3;
          currentPage = 0;
        }
      });
    }

    handleDragDown(DragDownDetails details) {
      tapDownPos = details.globalPosition.dx;
    }

    handleDragUp(DragEndDetails details) {
      //print("${details}, ${tapDownPos}");
    }

    handleDragUpdate(DragUpdateDetails details) {
      if (tapDownPos == 0.0) return;
      double maxDelta = size.width;
      double dragDelta = tapDownPos - details.globalPosition.dx;
      double rawPercentage = (dragDelta / maxDelta) * -100;
      setState(() {
        leftVal = (rawPercentage / 100) * size.width;
      });
      print(dragDelta);
    }

    return GestureDetector(
        onHorizontalDragDown: handleDragDown,
        onHorizontalDragEnd: handleDragUp,
        onHorizontalDragUpdate: handleDragUpdate,
        child: SizedBox(
          width: (size.width * 2) + (size.width * 2/3),
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                right: (size.width) - leftVal,
                child: WidgetCover(
                  onTap: () {},
                  isActive: currentPage == 0,
                  child: const DrawerView(),
                ),
              ),
              AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  left: leftVal,
                  child: WidgetCover(
                      isActive: currentPage == 1,
                      onTap: toggleDrawer,
                      child: HomePageView(
                        currentPage: currentPage,
                        leftVal: leftVal,
                        toggleDrawer: toggleDrawer,
                      ))),
              AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  left: size.width + leftVal,
                  child: WidgetCover(
                      isActive: currentPage == 2,
                      onTap: () {},
                      child: const ContentPageView()))
            ],
          ),
        ));
  }
}
