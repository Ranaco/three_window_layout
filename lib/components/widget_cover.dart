import 'package:flutter/material.dart';

class WidgetCover extends StatelessWidget {
  final bool isActive;
  final Widget child;
  final VoidCallback onTap;
  final double? childWidth;

  const WidgetCover(
      {Key? key,
      required this.onTap,
      this.isActive = false,
        this.childWidth,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: childWidth ?? MediaQuery.of(context).size.width,
      child: AnimatedScale(
        scale: isActive ? 1 : 0.95,
        duration: const Duration(milliseconds: 300),
        child: Stack(
          children: [
            child,
            !isActive ? GestureDetector(
              onTap: (){
                print("Widget cover tapped");
                onTap();
              },
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)),
                duration: const Duration(milliseconds: 300),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                ),
            ) : const SizedBox(),
            ]),
      ),
    );
  }
}
