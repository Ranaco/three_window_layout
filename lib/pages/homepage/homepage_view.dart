import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:three_window_layout/components/constants.dart';
import 'package:three_window_layout/components/mail_tile.dart';
import 'package:three_window_layout/components/search_bar.dart';
import 'package:stacked/stacked.dart';
import 'package:three_window_layout/components/theme/theme_provider.dart';
import 'package:three_window_layout/pages/homepage/homepage_viewmodel.dart';

class HomePageView extends StatefulWidget {
  final VoidCallback toggleDrawer;
  final double leftVal;
  final int currentPage;
  const HomePageView(
      {Key? key,
      required this.currentPage,
      required this.toggleDrawer,
      required this.leftVal})
      : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _colorAnimation =
        ColorTween(begin: Colors.transparent, end: Constants.darkGrey)
            .animate(_controller);
    super.initState();
  }

  @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return ViewModelBuilder<HomePageViewModel>.reactive(
        viewModelBuilder: () => HomePageViewModel(),
        builder: (context, model, child) {
          animateAppBar(bool val) {
            model.toggleSearchIsFocus(val);
            model.searchIsFocus ? _controller.forward() : _controller.reverse();
          }

          return AnimatedBuilder(
              animation: _colorAnimation,
              builder: (context, child) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child:  CustomScrollView(slivers: [
                    SliverAppBar(
                      floating: true,
                      snap: true,
                      elevation: 0,
                      leadingWidth: 100,
                      toolbarHeight: 75,
                      backgroundColor: _colorAnimation.value,
                      title: SearchBar(
                        toggleDrawer: widget.toggleDrawer,
                        search: model.search,
                        animateAppBar: animateAppBar,
                        searchInFocus: model.searchIsFocus,
                      ),
                    ),
                    SliverList(
                        delegate:
                            SliverChildBuilderDelegate((context, index) {
                      return MailTile(
                        index: index,
                        title: Text(
                          "hero issac in the beast",
                          style: TextStyle(
                            fontSize: 16,
                            overflow: TextOverflow.ellipsis,
                              color: themeProvider.useColorModeValue(
                                  Constants.darkTextColor,
                                  Constants.lightTextColor),
                              fontWeight: FontWeight.bold),
                        ),
                        description: Text(
                          model.description,
                          style: TextStyle(
                            fontSize: 12,
                            overflow: TextOverflow.ellipsis,
                              color: themeProvider.useColorModeValue(
                                  Colors.grey.shade800,
                                  Colors.grey.shade500)),
                        ),
                      );
                    }, childCount: 20))
                  ] //ListTile
                      ),
                );
              });
        });
  }
}
