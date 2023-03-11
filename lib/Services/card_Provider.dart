// ignore_for_file: file_names

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardProvider with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;
//*********For store cart value********** */
  void _setPrefItems() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt("cart_items", _counter);
    sp.setDouble("total_price", _totalPrice);
    notifyListeners();
  }

  void _getPrefItems() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _counter = sp.getInt("cart_items") ?? 0;
    _totalPrice = sp.getDouble("total_price") ?? 0.0;
    notifyListeners();
  }

  //***********for increament cart********* */
  void addCounter() {
    _counter++;
    _setPrefItems();
    notifyListeners();
  }

  //***********for decreament cart********* */
  void removeCounter() {
    _counter--;
    _setPrefItems();
    notifyListeners();
  }

  int getCounter() {
    _getPrefItems();
    return _counter;
  }

  //***********for increament TotalPrice********* */
  void addTotalPrice(double productPrice) {
    _totalPrice = _totalPrice + productPrice;
    _setPrefItems();
    notifyListeners();
  }

  //***********for decreament TotalPrice********* */
  void removeTotalPrice(double productPrice) {
    _totalPrice = _totalPrice - productPrice;
    _setPrefItems();
    notifyListeners();
  }

  //***********for decreament TotalPrice********* */
  double getTotalPrice() {
    _getPrefItems();
    return _totalPrice;
  }
}