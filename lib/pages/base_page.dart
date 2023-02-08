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
  double lastUpPos = 0.0;
  double percentage = 0.0;
  bool drawerIsOpen = true;
  int currentPage = 1;
  double dragDist = 0.0;
  double MIN_DRAG_DISTANCE = 15;

    @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final leftMaxDrag = size.width * 2/3;
    final rightMaxDrag = 0.0;


  toggleDrawer() {
      drawerIsOpen = !drawerIsOpen;
      setState(() {
        if (drawerIsOpen) {
          dragDist = dragDist - size.width * 2 / 3;
          currentPage = 1;
        } else {
          dragDist = dragDist + size.width * 2 / 3;
          currentPage = 0;
        }
      });
    }

 int getDragDirection(){
  var dx = percentage - lastUpPos;

      if(dx > 0 && dx.abs() > MIN_DRAG_DISTANCE){
        return 0;
      } else if(dx < 0 && dx.abs() > MIN_DRAG_DISTANCE){
        return 1;
      }

      return -1;
  }

  handlePageDrag(double dragDist){
   
    int direction = getDragDirection();

    if(direction == 0 && currentPage == 1){
      toggleDrawer();
    } else if(direction == 1 && currentPage == 0){
      toggleDrawer();
    }

    }



    handleDragDown(DragDownDetails details) {
      tapDownPos = details.globalPosition.dx;
    }

    handleDragUp(DragEndDetails details) {
      lastUpPos = percentage;
    }

    handleDragUpdate(DragUpdateDetails details) {
      double maxDelta = size.width;
      double dragDelta = (tapDownPos ) - details.globalPosition.dx;
      double rawPercentage = (dragDelta / maxDelta) * -100;
      percentage = rawPercentage + lastUpPos;
      setState(() {
        dragDist = (percentage / 100) * size.width;
      });
      if(dragDist > leftMaxDrag){
        dragDist = leftMaxDrag;
      } else if(dragDist < (rightMaxDrag)){
        dragDist = rightMaxDrag;
      }
     handlePageDrag(dragDist);
    }

    return GestureDetector(
        onHorizontalDragDown: handleDragDown,
        onHorizontalDragEnd: handleDragUp,
        onHorizontalDragUpdate: handleDragUpdate,
        child: SizedBox(
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                right: (size.width) - dragDist,
                child: WidgetCover(
                  childWidth: size.width * 2/3,
                  onTap: toggleDrawer,
                  isActive: currentPage == 0,
                  child: const DrawerView(),
                ),
              ),
              AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  left: dragDist,
                  child: WidgetCover(
                      isActive: currentPage == 1,
                      onTap: toggleDrawer,
                      child: HomePageView(
                        currentPage: currentPage,
                        toggleDrawer: toggleDrawer,
                      ))),
            ],
          ),
        ));
  }
}
