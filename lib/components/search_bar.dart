import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:three_window_layout/components/constants.dart';
import 'package:three_window_layout/components/drawer_button.dart';
import 'package:three_window_layout/components/theme/theme_provider.dart';

class SearchBar extends StatefulWidget {
  final Function(String) search;
  final Function(bool) animateAppBar;
  final bool searchInFocus;
  final VoidCallback toggleDrawer;

  const SearchBar(
      {Key? key,
      required this.toggleDrawer,
      required this.search,
      required this.animateAppBar,
      required this.searchInFocus})
      : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _searchController;
  double arrowTurns = 1.0;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeProvider themeProvider, child) {
      return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.only(top: 30),
          height: 45,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: themeProvider.useColorModeValue(
                  Colors.grey.shade200, Constants.darkGrey),
              borderRadius: !widget.searchInFocus
                  ? BorderRadius.circular(100)
                  : BorderRadius.zero),
          child: Focus(
              onFocusChange: (val) {
                widget.animateAppBar(val);
                arrowTurns = !val ? 0 : -0.5;
              },
              child: TextField(
                onTapOutside: (del) {
                  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                },
                onChanged: (val) {
                  _searchController.text = val;
                },
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: themeProvider.useColorModeValue(
                        null, Colors.grey.shade400),
                  ),
                  prefixIcon: DrawerButton(
                    turns: arrowTurns,
                    icon: widget.searchInFocus
                        ? Icon(
                            Icons.arrow_forward,
                            color: themeProvider.useColorModeValue(
                                Colors.black, Colors.grey.shade500),
                          )
                        : Icon(
                            Icons.menu,
                            color: themeProvider.useColorModeValue(
                                Colors.black, Colors.grey.shade500),
                          ),
                    isInFocus: widget.searchInFocus,
                    onTap: () {
                      widget.searchInFocus
                          ? WidgetsBinding.instance.focusManager.primaryFocus
                              ?.unfocus()
                          : widget.toggleDrawer();
                    },
                  ),
                  border: InputBorder.none,
                ),
              )));
    });
  }
}
