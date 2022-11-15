import 'package:ecommerce/model/base_model.dart';
import 'package:ecommerce/view/basket_view.dart';
import 'package:ecommerce/view/home_view.dart';
import 'package:ecommerce/view/profile_view.dart';
import 'package:ecommerce/view/search_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:grock/grock.dart';

class BaseController extends ChangeNotifier {
  final List<BaseModel> _baseModel = [
    BaseModel(icon: CupertinoIcons.home, page: const HomeView(), key: GlobalKey()),
    BaseModel(icon: CupertinoIcons.search, page: const SearchView(), key: GlobalKey()),
    BaseModel(icon: CupertinoIcons.shopping_cart, page: const BasketView(), key: GlobalKey()),
    BaseModel(icon: CupertinoIcons.person, page: const ProfileView(), key: GlobalKey()),
  ];

  List<BaseModel> get baseModel => _baseModel;

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  Widget body() => _baseModel[currentIndex].page;
  GlobalKey activeKey() => _baseModel[currentIndex].key;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  double selectedPosition = 45;

  void setWidgetPosition() {
    final RenderBox renderBox = activeKey().currentContext!.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    selectedPosition = position.dx + (Grock.width / 5.9) / 2;
    notifyListeners();
  }
}
