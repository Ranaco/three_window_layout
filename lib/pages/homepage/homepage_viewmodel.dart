import 'package:stacked/stacked.dart';

class HomePageViewModel extends BaseViewModel{
  String searchString = '';
  bool searchIsFocus = false;

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
