import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:three_window_layout/pages/drawer/drawer_viewmodel.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DrawerViewModel>.reactive(
      viewModelBuilder: () => DrawerViewModel(),
      builder: (context, model, child) {
        return Container(
            alignment: Alignment.centerRight,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.grey.shade600,
            child: const Center(child: Text("helllo there drawer")));
      },
    );
  }
}
