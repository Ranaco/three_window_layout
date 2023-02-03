import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget{

  final Function(String) search;
  final Function(bool) animateAppBar;
  final bool searchInFocus;

  const SearchBar({Key? key, required this.search, required this.animateAppBar, required this.searchInFocus}):super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>{

  late TextEditingController _searchController;
  int arrowTurns = 1; 

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
  Widget build(BuildContext context){
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.only(top: 10),
      height: 45,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: !widget.searchInFocus ? BorderRadius.circular(100) : BorderRadius.zero 
      ),
      child: Focus(
        onFocusChange: (val){
          widget.animateAppBar(val);
          setState(() {
            arrowTurns = !val ? 1 : 3;
          });
        },
        child: TextField(
        onChanged: (val){
          _searchController.text = val;
        },
        decoration: InputDecoration( 
          hintText: "Search",
          hintStyle: TextStyle(
                color: Colors.grey.shade400,
                ),
            prefixIcon: GestureDetector( 
              onTap: () {
                //TODO: Add drawer Function
                widget.searchInFocus ? WidgetsBinding.instance.focusManager.primaryFocus?.unfocus() : null;
              },
                child: AnimatedRotation(
                  turns: 1, 
                  duration: const Duration(milliseconds: 900), 
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 900), 
                    child: widget.searchInFocus ?
                    const Icon(Icons.arrow_back, color: Colors.black,) 
                    : const Icon(Icons.menu, color: Colors.black,),)),
              ),
            border: InputBorder.none,
          ),
        ))  
      );
  }
}
