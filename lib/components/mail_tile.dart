import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:three_window_layout/components/theme/theme_provider.dart';

class MailTile extends StatelessWidget {
  final Widget title;
  final Widget description;
  final int index;

  const MailTile(
      {Key? key,
      required this.title,
      required this.description,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ThemeProvider value, child) {
        return Padding(
          padding:
              EdgeInsets.only(left: 10, right: 10, top: index == 0 ? 15 : 5),
          child: SizedBox(
            height: 70,
            child: ListTile(
              visualDensity: VisualDensity.standard,
              dense: true,
            title: title,
            subtitle: description,
          )
            ),
        );
      },
    );
  }
}
