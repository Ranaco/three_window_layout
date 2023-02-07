import 'package:flutter/material.dart';

class DrawerButton extends StatefulWidget{

  final bool isInFocus;
  final Widget icon;
  final double turns;
  final VoidCallback onTap;
  const DrawerButton({Key? key, required this.turns, required this.icon, required this.onTap, required this.isInFocus}):super(key: key);

  @override
  State<DrawerButton> createState() => _DrawerButtonState();
}
class _DrawerButtonState extends State<DrawerButton>{

  @override 
  Widget build(BuildContext context){
    return GestureDetector(
        onTap: widget.onTap,
        child: AnimatedRotation(
          turns: widget.turns,
          duration: const Duration(milliseconds: 200),
            child: widget.icon
          ),
    );
  }
}
