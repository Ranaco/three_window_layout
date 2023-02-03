import 'package:flutter/material.dart';
import 'package:three_window_layout/pages/content_page/content_page_view.dart';
import 'package:three_window_layout/pages/drawer/drawer_view.dart';
import 'package:three_window_layout/pages/homepage/homepage_view.dart';

class BasePageView extends StatefulWidget{

  const BasePageView({Key? key}):super(key: key);

  @override 
  State<BasePageView> createState() => _BasePageViewState();
}

class _BasePageViewState extends State<BasePageView> with SingleTickerProviderStateMixin{


  @override 
  Widget build(BuildContext context){

  double leftVal = 0.0;
  double tapDownPos = 0.0;
  double tapUpPos = 0.0;

  handleDragDown(DragDownDetails details){
          tapDownPos = details.globalPosition.dx; 
  }

  handleDragUp(DragEndDetails details){
    print("${details}, ${tapDownPos}");
  }
  handleDragUpdate(DragUpdateDetails details){
    if(tapDownPos == 0.0) return;
    double maxDelta = MediaQuery.of(context).size.width ;
    double dragDelta = tapDownPos - details.globalPosition.dx;
    double rawPercentage = (dragDelta/maxDelta) * -100;
    leftVal = (rawPercentage/100) * MediaQuery.of(context).size.width;
    print(leftVal);
  }
    return GestureDetector( 
      onHorizontalDragDown: handleDragDown,
      onHorizontalDragEnd: handleDragUp, 
      onHorizontalDragUpdate: handleDragUpdate,
      onTap: (){
        print("tap recorded");
      },
      child: SizedBox( 
            child: Stack(
        children: [
           Positioned(
             left: (MediaQuery.of(context).size.width * -1) + leftVal,
             child: const DrawerView(),),
            Positioned(
             left: leftVal == 0.0 ? null : leftVal,
             child: const HomePageView()),
           Positioned(
             left: MediaQuery.of(context).size.width + leftVal,
             child: const ContentPageView()) 
        ],
      ), 
         ) 
      );
  }
}
