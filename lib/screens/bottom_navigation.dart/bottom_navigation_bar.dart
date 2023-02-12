import 'package:flutter/material.dart';
import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';

import 'package:provider/provider.dart';
import 'package:qitea/components/app_data/shared_preferences_helper.dart';
import 'package:qitea/components/app_repo/app_state.dart';
import 'package:qitea/components/app_repo/navigation_state.dart';
import 'package:qitea/components/connectivity/network_indicator.dart';
import 'package:qitea/locale/localization.dart';
import 'package:qitea/models/user.dart';
import 'package:qitea/utils/app_colors.dart';
import 'package:qitea/components/app_repo/location_state.dart';
import 'package:qitea/components/MainDrawer.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as gg;
import 'package:location/location.dart';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:qitea/components/app_repo/app_state.dart';
import 'package:qitea/components/connectivity/network_indicator.dart';
import 'package:qitea/components/gradient_app_bar/gradient_app_bar.dart';
import 'package:qitea/components/safe_area/page_container.dart';
import 'package:qitea/locale/localization.dart';
import 'package:qitea/services/access_api.dart';
import 'package:qitea/utils/app_colors.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../components/badge_tab_bar.dart';




import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';

import 'package:firebase_core/firebase_core.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  bool _initialRun = true;
  AppState? _appState;
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  NavigationState? _navigationState;
  LocationData? _locData;
  LocationState? _locationState;
  Services _services = Services();

  Future<String>? _termsContent;

  Future<String> _getTermsContent() async {
    var results =     await _services.get("https://qtaapp.com/api/get_unread_notify?user_id=0");
    String termsContent = '';
    if (results['response'] == '1') {
      termsContent = results['Number'];
    } else {
      print('error');
    }
    return termsContent;
  }




  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  new FlutterLocalNotificationsPlugin();
  ValueNotifier<int> notificationCounterValueNotifer = ValueNotifier(0);

  void _iOSPermission() {
    _firebaseMessaging.requestPermission(sound: true, badge: true, alert: true);
    // _firebaseMessaging.onIosSettingsRegistered
    //     .listen((IosNotificationSettings settings) {
    //   print("Settings registered: $settings");
    // });
  }
  void _firebaseCloudMessagingListeners() {
    var android = new AndroidInitializationSettings('mipmap/ic_launcher');
    var ios = new DarwinInitializationSettings();
    var platform = new InitializationSettings(android: android, iOS: ios);

    _flutterLocalNotificationsPlugin.initialize(platform,
        onDidReceiveNotificationResponse : selectNotification as void Function(NotificationResponse));

    if (Platform.isIOS) _iOSPermission();
    FirebaseMessaging.onMessage.listen((event) {
      print('on message ${event.data}');
      print("onMessage: ${event.data}");
      notificationCounterValueNotifer.value++;

      FlutterAppBadger.updateBadgeCount(
          notificationCounterValueNotifer.value + 1);
      _showNotification(event.data);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      _navigationState!.upadateNavigationIndex(2);
      Navigator.pushReplacementNamed(context, '/navigation');
    });
  }

  _showNotification(Map<String, dynamic> message) async {
    var android = new AndroidNotificationDetails(
      'channel id',
      "CHANNLE NAME",
      channelDescription:
      "channelDescription",
    );
    var iOS = new DarwinNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
   /* await _flutterLocalNotificationsPlugin.show(
        0,
        message['notification']['title'],
        message['notification']['body'],
        platform); */

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: ListTile(
          title: Text(message['notification']['title']),
          subtitle: Text(message['notification']['body']),
        ),
        actions: <Widget>[
          TextButton(
            child: message['notification']['title']=="تنويه باتمام الدفع"?Text('الانتقال لطلباتي'):Text('موافق'),
            onPressed: () {
              Navigator.of(context).pop();

              message['notification']['title']=="تنويه باتمام الدفع"?_navigationState!.upadateNavigationIndex(1):_navigationState!.upadateNavigationIndex(2);
              Navigator.pushReplacementNamed(context, '/navigation');
            },
          ),
        ],
      ),
    ).then((value) => setState(() {}));

  }



  void selectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
// Here you can check notification payload and redirect user to the respective screen
      _navigationState!.upadateNavigationIndex(2);
      Navigator.pushReplacementNamed(context, '/navigation');
    }
  }

  Future<Null> _checkIsLogin() async {
    var userData = await SharedPreferencesHelper.read("user");

    if (userData != null) {
      _appState!.setCurrentUser(User.fromJson(userData));
      _firebaseCloudMessagingListeners();
    }
  }

  // Future<Null> _getUnreadNotificationNum() async {
  //   Map<String, dynamic> results =
  //       await _services.get(Utils.NOTIFICATION_UNREAD_URL, header: {
  //     'Accept': 'application/json',
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer ${_appState.currentUser.token}'
  //   });

  //   if (results['status']) {
  //     print(results['data']);

  //     _appState.updateNotification(results['data']['count']);
  //   }
  //     else if (!results['status'] &&
  //                       results['statusCode'] == 401) {
  //                     handleUnauthenticated(context);
  //                   } else {
  //                        showErrorDialog(results['msg'], context);
  //                   }
  // }




  Future<void> _getCurrentUserLocation() async {

    _locData = await gg.Location().getLocation();
    print(_locData!.latitude);
    print(_locData!.longitude);
      _locationState!.setLocationLatitude(_locData!.latitude!);
      _locationState!.setLocationlongitude(_locData!.longitude!);
      List<Placemark> placemark = await placemarkFromCoordinates(
          _locationState!.locationLatitude, _locationState!
          .locationlongitude);
      _locationState!.setCurrentAddress(placemark[0].name! + '  ' + placemark[0].administrativeArea !+ ' '
          + placemark[0].country!);
      //  final coordinates = new Coordinates(_locationState.locationLatitude, _locationState
      //  .locationlongitude);
      // var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
      // var first = addresses.first;

      // _locationState.setCurrentAddress(first.addressLine);


      // print("${first.featureName} : ${first.addressLine}");




  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialRun) {
      _initialRun = false;
      _appState = Provider.of<AppState>(context);
      _locationState = Provider.of<LocationState>(context);
      _termsContent = _getTermsContent();
      _checkIsLogin();
      _getCurrentUserLocation();
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    _navigationState = Provider.of<NavigationState>(context);
    _appState = Provider.of<AppState>(context);
    return NetworkIndicator(
        child: Scaffold(
          key: _scaffoldKey, //

          drawer: MainDrawer(),
      body: _navigationState!.selectedContent,
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _navigationState!.navigationIndex==0?Image.asset("assets/images/home.png",color: cLightLemon,):Image.asset("assets/images/home.png",color: cPrimaryColor,),
            label: "الرئيسية",
          ),
           BottomNavigationBarItem(
            icon: _navigationState!.navigationIndex==1?Image.asset("assets/images/orders.png",color: cLightLemon,):Image.asset("assets/images/orders.png",color: cPrimaryColor,),
            label: "طلباتي",
          ),

          BottomNavigationBarItem(
            icon:  _navigationState!.navigationIndex==2?Image.asset("assets/images/notifications.png",color: cLightLemon,):Image.asset("assets/images/notifications.png",color: cPrimaryColor,),
            label: "الاشعارات",



          ),

          BottomNavigationBarItem(
            icon: _navigationState!.navigationIndex==3?Image.asset("assets/images/user.png",color: cLightLemon,):Image.asset("assets/images/user.png",color: cPrimaryColor,),

            label:_appState!.currentLang=="ar"?"حسابي":"My account",
          ),



        ],
        currentIndex: _navigationState!.navigationIndex,
        selectedItemColor: cPrimaryColor,
        unselectedItemColor: Color(0xFFC4C4C4),
        onTap: (int index) {
          _navigationState!.upadateNavigationIndex(index);
          if(index==2){
            notificationCounterValueNotifer.value=0;
          }


        },
        elevation: 4,
        backgroundColor: cWhite,
        type: BottomNavigationBarType.fixed,
      ),
    ));
  }
}
