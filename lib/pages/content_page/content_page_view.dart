import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:three_window_layout/pages/content_page/content_page_viewmodel.dart';

class ContentPageView extends StatelessWidget{

  const ContentPageView({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context){
    return ViewModelBuilder<ContentPageViewModel>.reactive(
        viewModelBuilder: () => ContentPageViewModel(),
        builder: (context, model, child){
          return Container(
            color: Colors.grey.shade600,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
              child: const Center(
                  child: Text("Hello there Content page")
                ) 
            );
        },
      );
  }
}
