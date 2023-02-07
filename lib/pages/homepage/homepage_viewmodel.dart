import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:stacked/stacked.dart';

class HomePageViewModel extends BaseViewModel{
  String searchString = '';
  bool searchIsFocus = false;

  String title = lorem(words: 3);
  String description = lorem(words: 30);

  toggleSearchIsFocus(bool val){
    searchIsFocus = val;
    print(val);
    notifyListeners();
  }

  search(String val){
    searchString = val;
    notifyListeners();
  }
}
