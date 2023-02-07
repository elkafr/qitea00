import 'package:qitea/screens/auth/login_screen.dart';
import 'package:qitea/screens/auth/password_recovery_screen.dart';
import 'package:qitea/screens/auth/register_code_activation1_screen.dart';
import 'package:qitea/screens/auth/register_code_activation_screen.dart';
import 'package:qitea/screens/auth/register_screen.dart';
import 'package:qitea/screens/bottom_navigation.dart/bottom_navigation_bar.dart';
import 'package:qitea/screens/cart/cart_screen.dart';


import 'package:qitea/screens/location/addLocation_screen.dart';
import 'package:qitea/screens/notifications/notifications_screen.dart';

import 'package:qitea/screens/order_details/order_details.dart';

import 'package:qitea/screens/orders/orders_screen.dart';
import 'package:qitea/screens/product/product_screen.dart';
import 'package:qitea/screens/profile/personal_information_screen.dart';
import 'package:qitea/screens/splash/splash_screen.dart';
import 'package:qitea/screens/store/store_screen.dart';


final routes = {
  '/': (context) => SplashScreen(),
  '/login_screen':(context) => LoginScreen(),
  '/password_recovery_screen':(context) => PasswordRecoveryScreen(),
  '/register_screen':(context) => RegisterScreen(),

  '/navigation':(context) => BottomNavigation(),
  '/product_screen':(context) => ProductScreen(),

  '/orders_screen':(context) => OrdersScreen(),
 '/personal_information_screen':(context) => PersonalInformationScreen(),
  '/notifications_screen' :(context) => NotificationsScreen(),
  '/order_details_screen':(context) => OrderDetailsScreen(),

  '/register_code_activation_screen' :(context) => RegisterCodeActivationScreen(),
  '/register_code_activation1_screen' :(context) => RegisterCodeActivation1Screen(),
  '/addLocation_screen' :(context) => AddLocationScreen()



};
