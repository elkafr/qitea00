
import 'package:flutter/material.dart';
import 'package:qitea/screens/notifications/notifications_screen.dart';
import 'package:qitea/screens/account/account_screen.dart';
import 'package:qitea/screens/cart/cart_screen.dart';
import 'package:qitea/screens/favourite/favourite_screen.dart';
import 'package:qitea/screens/home/home_screen.dart';

import 'package:qitea/screens/orders/orders_screen.dart';


class NavigationState extends ChangeNotifier {

    int _navigationIndex = 0 ;


  void upadateNavigationIndex(int value ){
    _navigationIndex = value;
    notifyListeners();
  }

  int get navigationIndex => _navigationIndex;


    List<Widget> _screens = [
    HomeScreen(),
    OrdersScreen(),

    NotificationsScreen(),

    AccountScreen()
  
  ];
  
  Widget get  selectedContent => _screens[_navigationIndex];

}