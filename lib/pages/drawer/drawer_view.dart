import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:three_window_layout/components/drawer_header.dart';
import 'package:three_window_layout/components/theme/theme_provider.dart';
import 'package:three_window_layout/pages/drawer/drawer_viewmodel.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    
    return ViewModelBuilder<DrawerViewModel>.reactive(
      viewModelBuilder: () => DrawerViewModel(),
      builder: (context, model, child) {
        return Container(
          color: Colors.blue,
            width: MediaQuery.of(context).size.width * 2/3,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(top: 30),
            child: 
            Column(
              children: const [
               Padding(
                 padding: EdgeInsets.all(10),
                 child: CustomDrawerHeader(
                  title: Text("Hello there", style: TextStyle(fontSize: 25),),
                  ), 
                 ) 
              ], 
        ));
      },
    );
  }
}
