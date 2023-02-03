import 'package:flutter/material.dart';
import 'package:three_window_layout/components/search_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:three_window_layout/pages/homepage/homepage_viewmodel.dart';

class HomePageView extends StatefulWidget{

  const HomePageView({Key? key}):super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> with 
SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
    void initState() {
      _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500)); 
      _colorAnimation = ColorTween(begin: Colors.transparent, end: Colors.grey.shade200).animate(_controller);
      super.initState();
    } 


  @override 
  Widget build(BuildContext context){
    return ViewModelBuilder<HomePageViewModel>.reactive(
        viewModelBuilder: () => HomePageViewModel(),
        builder: (context, model, child){
          
        animateAppBar(bool val){
          model.toggleSearchIsFocus(val);
          model.searchIsFocus ? _controller.forward() : _controller.reverse();
        }

          return AnimatedBuilder(
            animation: _colorAnimation,
            builder: (context, child){
              return CustomScrollView( 
        slivers: [
          SliverAppBar(
            floating: true,
            snap: true,
            elevation: 0,
            leadingWidth: 100,
            toolbarHeight: 65,
            backgroundColor: _colorAnimation.value,
            title: SearchBar(
              search: model.search, 
              animateAppBar: animateAppBar, 
              searchInFocus: model.searchIsFocus,), 
            ),
          SliverList( 
           delegate: SliverChildBuilderDelegate(
             (context, index) => ListTile(
                tileColor: (index % 2 == 0) ? Colors.transparent : Colors.green[50],
                title: Center(
                  child: Text('$index',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 50,
                          color: Colors.greenAccent[400]) //TextStyle
                      ), //Text
                ), //Center
              )
             )
           )
        ]//ListTile
      );
            }); 
        }
      );
  }
}
