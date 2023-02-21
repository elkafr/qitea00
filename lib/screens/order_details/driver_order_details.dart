import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:qitea/components/app_repo/app_state.dart';
import 'package:qitea/components/app_repo/location_state.dart';
import 'package:qitea/components/app_repo/navigation_state.dart';
import 'package:qitea/components/app_repo/order_state.dart';
import 'package:qitea/components/app_repo/progress_indicator_state.dart';
import 'package:qitea/components/app_repo/tab_state.dart';
import 'package:qitea/components/buttons/custom_button.dart';
import 'package:qitea/components/buttons/custom_button1.dart';
import 'package:qitea/components/buttons/custom_button2.dart';
import 'package:qitea/components/connectivity/network_indicator.dart';
import 'package:qitea/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:qitea/components/gradient_app_bar/gradient_app_bar.dart';
import 'package:qitea/components/response_handling/response_handling.dart';
import 'package:qitea/components/safe_area/page_container.dart';
import 'package:qitea/locale/localization.dart';
import 'package:qitea/models/order.dart';

import 'package:qitea/screens/orders/components/cancel_order_bottom_sheet.dart';
import 'package:qitea/services/access_api.dart';
import 'package:qitea/utils/app_colors.dart';
import 'dart:math' as math;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qitea/services/access_api.dart';
import 'package:qitea/utils/app_colors.dart';
import 'dart:math' as math;

import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:qitea/components/app_repo/app_state.dart';
import 'package:qitea/components/app_repo/navigation_state.dart';
import 'package:qitea/components/app_repo/order_state.dart';
import 'package:qitea/components/app_repo/progress_indicator_state.dart';
import 'package:qitea/components/app_repo/tab_state.dart';
import 'package:qitea/components/buttons/custom_button.dart';
import 'package:qitea/components/connectivity/network_indicator.dart';
import 'package:qitea/components/gradient_app_bar/gradient_app_bar.dart';
import 'package:qitea/components/response_handling/response_handling.dart';
import 'package:qitea/components/safe_area/page_container.dart';
import 'package:qitea/locale/localization.dart';
import 'package:qitea/models/order.dart';
import 'package:qitea/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:qitea/screens/orders/components/cancel_order_bottom_sheet.dart';
import 'package:qitea/services/access_api.dart';
import 'package:qitea/utils/app_colors.dart';
import 'dart:math' as math;


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:qitea/components/app_repo/app_state.dart';
import 'package:qitea/components/custom_text_form_field/validation_mixin.dart';
import 'package:qitea/components/app_repo/navigation_state.dart';
import 'package:qitea/components/app_repo/progress_indicator_state.dart';
import 'package:qitea/components/buttons/custom_button.dart';
import 'package:qitea/components/connectivity/network_indicator.dart';
import 'package:qitea/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:qitea/components/gradient_app_bar/gradient_app_bar.dart';
import 'package:qitea/components/horizontal_divider/horizontal_divider.dart';
import 'package:qitea/components/progress_indicator_component/progress_indicator_component.dart';
import 'package:qitea/components/response_handling/response_handling.dart';
import 'package:qitea/components/safe_area/page_container.dart';
import 'package:qitea/locale/localization.dart';
import 'package:qitea/models/city.dart';
import 'package:qitea/models/user.dart';
import 'package:qitea/screens/account/terms_screen.dart';
import 'package:qitea/services/access_api.dart';
import 'package:qitea/utils/app_colors.dart';
import 'package:validators/validators.dart';
import 'package:qitea/components/drop_down_list_selector/drop_down_list_selector.dart';

class DriverOrderDetailsScreen extends StatefulWidget {
  @override
  _DriverOrderDetailsScreenState createState() =>
      _DriverOrderDetailsScreenState();
}

class _DriverOrderDetailsScreenState extends State<DriverOrderDetailsScreen> {
  bool _initialRun = true;
  OrderState? _orderState;
  double _height = 0, _width = 0;
  Services _services = Services();
  ProgressIndicatorState? _progressIndicatorState;
  AppState? _appState;
  TabState? _tabState;
  NavigationState? _navigationState;
  LocationState? _locationState;
  Future<Order>? _orderDetails;
  LocationData? _locData;
  String? _myOffer;
  String? xxx;

  double from = 0;
  double to = 0;

  final _formKey = GlobalKey<FormState>();
  Future<void> _getCurrentUserLocation() async {
    _locData = await Location().getLocation();
    if (_locData != null) {
      print('lat' + _locData!.latitude.toString());
      print('longitude' + _locData!.longitude.toString());

      setState(() {
        _locationState!.setLocationLatitude(_locData!.latitude!);
        _locationState!.setLocationlongitude(_locData!.longitude!);
      });
    }
  }

  Future<Order> _getOrderDetails() async {
    Map<dynamic, dynamic> results = await _services.get(
        'https://qtaapp.com/api/show_buy?lang=${_appState!.currentLang}&user_id=${_appState!.currentUser!.userId}&cartt_id=${_orderState!.carttId}');
    Order orderDetails = Order();
    if (results['response'] == '1') {
      orderDetails = Order.fromJson(results['result']);
    } else {
      print('error');
    }
    return orderDetails;
  }

  Future<String>? _distanceBetweenDriverAndMtger;

  Future<String> _getDistanceBetweenDriverAndMtger() async {
    var results = await _services.get(
        'https://qtaapp.com/api/getDistanceCost?driver_mapx=${_locationState!.locationLatitude}&driver_mapy=${_locationState!.locationlongitude}&cartt_id=${_orderState!.carttId}');
    String distanceBetweenDriverAndMtger = '';
    if (results['response'] == '1') {
      distanceBetweenDriverAndMtger = results['distanceBetweenDriverAndMtger'];
    } else {
      print('error');
    }
    return distanceBetweenDriverAndMtger;
  }

  Future<String>? _distanceBetweenMtgerAndUser;
  Future<String> _getDistanceBetweenMtgerAndUser() async {
    var results = await _services.get(
        'https://qtaapp.com/api/getDistanceCost?driver_mapx=${_locationState!.locationLatitude}&driver_mapy=${_locationState!.locationlongitude}&cartt_id=${_orderState!.carttId}');
    String distanceBetweenMtgerAndUser = '';
    if (results['response'] == '1') {
      distanceBetweenMtgerAndUser = results['distanceBetweenMtgerAndUser'];
    } else {
      print('error');
    }
    return distanceBetweenMtgerAndUser;
  }

  Future<String>? _checkSendOffer;
  Future<String> _getCheckSendOffer() async {
    var results = await _services.get(
        'https://qtaapp.com/api/checkSendOffer?offer_driver=${_appState!.currentUser!.userId}&offer_cartt=${_orderState!.carttId}');
    String checkSendOffer = '';
    if (results['response'] == '1') {
      checkSendOffer = "1";
    } else {
      checkSendOffer = "0";
    }
    return checkSendOffer;
  }

  Future<String>? _costFrom;
  Future<String> _getCostFrom() async {
    var results = await _services.get(
        'https://qtaapp.com/api/getDistanceCost?driver_mapx=${_locationState!.locationLatitude}&driver_mapy=${_locationState!.locationlongitude}&cartt_id=${_orderState!.carttId}');
    String costFrom = '';
    if (results['response'] == '1') {
      costFrom = results['costFrom'];
      from = double.parse(costFrom);
    } else {
      print('error');
    }
    return costFrom;
  }

  Future<String>? _costTo;
  Future<String> _getCostTo() async {
    var results = await _services.get(
        'https://qtaapp.com/api/getDistanceCost?driver_mapx=${_locationState!.locationLatitude}&driver_mapy=${_locationState!.locationlongitude}&cartt_id=${_orderState!.carttId}');
    String costTo = '';
    if (results['response'] == '1') {
      costTo = results['costTo'];
      to = double.parse(costTo);
    } else {
      print('error');
    }
    return costTo;
  }

  @override
  void initState() {
    super.initState();

    _getCurrentUserLocation();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialRun) {
      _initialRun = false;
      _appState = Provider.of<AppState>(context);
      _orderState = Provider.of<OrderState>(context);
      _locationState = Provider.of<LocationState>(context);
      _orderDetails = _getOrderDetails();

      _distanceBetweenDriverAndMtger = _getDistanceBetweenDriverAndMtger();
      _distanceBetweenMtgerAndUser = _getDistanceBetweenMtgerAndUser();
      _checkSendOffer = _getCheckSendOffer();
      _costFrom = _getCostFrom();
      _costTo = _getCostTo();
    }
  }

  Widget _buildBodyItem(Order order) {
    print("==============ssss==================");
    print("=============sssss===================");
    print("=============ssss===================");
    print(_locationState!.locationLatitude);
    print(_locationState!.locationlongitude);
    print("==============ssss==================");
    print("==============sss==================");
    print("==============sss==================");
    return SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Container(
            width: _width,
            height: _height,
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                      color: cWhite,
                      borderRadius: BorderRadius.all(
                        const Radius.circular(10.00),
                      ),
                      border: Border.all(color: cWhite)),
                  margin: EdgeInsets.only(
                      left: _width * 0.03,
                      right: _width * 0.03,
                      bottom: _width * 0.025),
                  child: Text(
                    " حالة الطلب : " + order.carttState!,
                    style: TextStyle(
                      fontSize: 14,
                      color: cOmarColor,
                    ),
                  ),
                ),
                Container(
                    height: _height * .42,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(
                        left: _width * 0.03,
                        right: _width * 0.03,
                        bottom: _width * 0.01),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Color(0xffEBEBEB)),
                      color: cWhite,
                      borderRadius: BorderRadius.circular(
                        6.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius:
                              12.0, // has the effect of softening the shadow
                          spreadRadius:
                              5.0, // has the effect of extending the shadow
                        )
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: _width * .85,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: _width * 0.04,
                                          vertical: _height * 0.01),
                                      child: Text(
                                        order.carttMarkaName!,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: cOmarColor,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    Container(
                                      width: _width * 0.38,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: _width * 0.04,
                                          vertical: _height * 0.01),
                                      child: Text(
                                        " رقم الطلب : " + order.carttId!,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: cOmarColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: _width * .85,
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: _width * 0.04,
                                          vertical: _height * 0.01),
                                      child: Text(
                                        order.carttTypeeName!,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: cOmarColor,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: _width * 0.38,
                                      alignment: Alignment.centerRight,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: _width * 0.04,
                                          vertical: _height * 0.01),
                                      child: Text(
                                        " تاريخ الطلب : " + order.carttDate!,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: cOmarColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: _width * .85,
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: _width * 0.04,
                                          vertical: _width * 0.01),
                                      child: Text(
                                        " موديل : " + order.carttModelName!,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: cOmarColor,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: _width * 0.38,
                                      alignment: Alignment.centerRight,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: _width * 0.04,
                                          vertical: _height * 0.01),
                                      child: Text(
                                        " عدد القطع : " + order.carttNumber!,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: cOmarColor,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: _width * .85,
                                alignment: Alignment.centerRight,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: _width * 0.04,
                                          vertical: _height * 0.01),
                                      child: Text(
                                        " رقم الهيكل : " + order.carttHikal!,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: cLightLemon,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: _width * 0.38,
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    color: cWhite,
                                    borderRadius: BorderRadius.all(
                                      const Radius.circular(10.00),
                                    ),
                                    border: Border.all(color: cWhite)),
                                margin: EdgeInsets.symmetric(
                                    horizontal: _width * 0.04,
                                    vertical: _width * 0.01),
                                child: Text(
                                  " وصف الطلب ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: cOmarColor,
                                  ),
                                ),
                              ),
                              Container(
                                width: _width * 0.38,
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    color: cWhite,
                                    borderRadius: BorderRadius.all(
                                      const Radius.circular(10.00),
                                    ),
                                    border: Border.all(color: cWhite)),
                                margin: EdgeInsets.symmetric(
                                    horizontal: _width * 0.04,
                                    vertical: _width * 0.01),
                                child: Text(
                                  " القطعة 1 : ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: cOmarColor,
                                  ),
                                ),
                              ),
                              Container(
                                width: _width * 0.80,
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    color: cWhite,
                                    borderRadius: BorderRadius.all(
                                      const Radius.circular(10.00),
                                    ),
                                    border: Border.all(color: cWhite)),
                                margin: EdgeInsets.symmetric(
                                    horizontal: _width * 0.04,
                                    vertical: _width * 0.01),
                                child: Text(
                                  order.carttDetails1!,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cOmarColor,
                                  ),
                                ),
                              ),
                              Container(
                                width: _width * 0.80,
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      const Radius.circular(10.00),
                                    ),
                                    border: Border.all(color: cWhite)),
                                margin: EdgeInsets.symmetric(
                                    horizontal: _width * 0.04,
                                    vertical: _width * 0.01),
                                child: Image.network(
                                  order.carttPhoto1!,
                                  height: _height * .15,
                                  width: _width,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              order.carttNumber == "2" ||
                                      order.carttNumber == "3"
                                  ? Container(
                                      width: _width * 0.38,
                                      alignment: Alignment.centerRight,
                                      decoration: BoxDecoration(
                                          color: cWhite,
                                          borderRadius: BorderRadius.all(
                                            const Radius.circular(10.00),
                                          ),
                                          border: Border.all(color: cWhite)),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: _width * 0.04,
                                          vertical: _width * 0.01),
                                      child: Text(
                                        " القطعة 2 : ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: cOmarColor,
                                        ),
                                      ),
                                    )
                                  : Text(
                                      "",
                                      style: TextStyle(height: 0),
                                    ),
                              order.carttNumber == "2" ||
                                      order.carttNumber == "3"
                                  ? Container(
                                      width: _width * 0.80,
                                      alignment: Alignment.centerRight,
                                      decoration: BoxDecoration(
                                          color: cWhite,
                                          borderRadius: BorderRadius.all(
                                            const Radius.circular(10.00),
                                          ),
                                          border: Border.all(color: cWhite)),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: _width * 0.04,
                                          vertical: _width * 0.01),
                                      child: Text(
                                        order.carttDetails2!,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: cOmarColor,
                                        ),
                                      ),
                                    )
                                  : Text(
                                      "",
                                      style: TextStyle(height: 0),
                                    ),
                              order.carttNumber == "2" ||
                                      order.carttNumber == "3"
                                  ? Container(
                                      width: _width * 0.80,
                                      alignment: Alignment.centerRight,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            const Radius.circular(10.00),
                                          ),
                                          border: Border.all(color: cWhite)),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: _width * 0.04,
                                          vertical: _width * 0.01),
                                      child: Image.network(
                                        order.carttPhoto2!,
                                        height: _height * .15,
                                        width: _width,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    )
                                  : Text(
                                      "",
                                      style: TextStyle(height: 0),
                                    ),
                              order.carttNumber == "3"
                                  ? Container(
                                      width: _width * 0.38,
                                      alignment: Alignment.centerRight,
                                      decoration: BoxDecoration(
                                          color: cWhite,
                                          borderRadius: BorderRadius.all(
                                            const Radius.circular(10.00),
                                          ),
                                          border: Border.all(color: cWhite)),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: _width * 0.04,
                                          vertical: _width * 0.01),
                                      child: Text(
                                        " القطعة 3 : ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: cOmarColor,
                                        ),
                                      ),
                                    )
                                  : Text(
                                      "",
                                      style: TextStyle(height: 0),
                                    ),
                              order.carttNumber == "3"
                                  ? Container(
                                      width: _width * 0.80,
                                      alignment: Alignment.centerRight,
                                      decoration: BoxDecoration(
                                          color: cWhite,
                                          borderRadius: BorderRadius.all(
                                            const Radius.circular(10.00),
                                          ),
                                          border: Border.all(color: cWhite)),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: _width * 0.04,
                                          vertical: _width * 0.01),
                                      child: Text(
                                        order.carttDetails3!,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: cOmarColor,
                                        ),
                                      ),
                                    )
                                  : Text(
                                      "",
                                      style: TextStyle(height: 0),
                                    ),
                              order.carttNumber == "3"
                                  ? Container(
                                      width: _width * 0.80,
                                      alignment: Alignment.centerRight,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                            const Radius.circular(10.00),
                                          ),
                                          border: Border.all(color: cWhite)),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: _width * 0.04,
                                          vertical: _width * 0.01),
                                      child: Image.network(
                                        order.carttPhoto3!,
                                        height: _height * .15,
                                        width: _width,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    )
                                  : Text(
                                      "",
                                      style: TextStyle(height: 0),
                                    ),
                            ],
                          ),
                        )
                      ],
                    )),
                SizedBox(
                  height: 2,
                ),
                order.carttDone == 3
                    ? Container(
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                            color: cWhite,
                            borderRadius: BorderRadius.all(
                              const Radius.circular(10.00),
                            ),
                            border: Border.all(color: cWhite)),
                        margin: EdgeInsets.only(
                            left: _width * 0.03,
                            right: _width * 0.03,
                            bottom: _width * 0.01),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.mapMarkerAlt,
                              size: 20,
                              color: cPrimaryColor,
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                            Text(
                              " انت تبعد عن المتجر ",
                              style: TextStyle(
                                fontSize: 14,
                                color: cOmarColor,
                              ),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.only(
                                  right: 12, left: 12, top: 2, bottom: 3),
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.all(
                                    const Radius.circular(5.00),
                                  ),
                                  border: Border.all(
                                      color: Colors.grey.shade300)),
                              child: FutureBuilder<String>(
                                future: _distanceBetweenDriverAndMtger,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      snapshot.data.toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: cOmarColor,
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }

                                  return Center(
                                      child: SpinKitThreeBounce(
                                    color: cPrimaryColor,
                                    size: 40,
                                  ));
                                },
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(3)),
                            Text(
                              " كم ",
                              style: TextStyle(
                                fontSize: 14,
                                color: cOmarColor,
                              ),
                            )
                          ],
                        ),
                      )
                    : Text(
                        "",
                        style: TextStyle(height: 0),
                      ),
                order.carttDone == 3
                    ? SizedBox(
                        height: 5,
                      )
                    : Text(
                        "",
                        style: TextStyle(height: 0),
                      ),
                order.carttDone == 3
                    ? Container(
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                            color: cWhite,
                            borderRadius: BorderRadius.all(
                              const Radius.circular(10.00),
                            ),
                            border: Border.all(color: cWhite)),
                        margin: EdgeInsets.only(
                            left: _width * 0.03,
                            right: _width * 0.03,
                            bottom: _width * 0.025),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.mapMarkerAlt,
                              size: 20,
                              color: cPrimaryColor,
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                            Text(
                              " المتجر يبعد عن العميل ",
                              style: TextStyle(
                                fontSize: 14,
                                color: cOmarColor,
                              ),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.only(
                                  right: 12, left: 12, top: 3, bottom: 1),
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.all(
                                    const Radius.circular(5.00),
                                  ),
                                  border: Border.all(
                                      color: Colors.grey.shade300)),
                              child: FutureBuilder<String>(
                                future: _distanceBetweenMtgerAndUser,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      snapshot.data.toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: cOmarColor,
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }

                                  return Center(
                                      child: SpinKitThreeBounce(
                                    color: cPrimaryColor,
                                    size: 40,
                                  ));
                                },
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(3)),
                            Text(
                              " كم ",
                              style: TextStyle(
                                fontSize: 14,
                                color: cOmarColor,
                              ),
                            )
                          ],
                        ),
                      )
                    : Text(
                        "",
                        style: TextStyle(height: 0),
                      ),
                order.carttDone == 3
                    ? SizedBox(
                        height: _height * .00,
                      )
                    : Text(
                        "",
                        style: TextStyle(height: 0),
                      ),
                order.carttDone == 3
                    ? Container(
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                            color: cWhite,
                            borderRadius: BorderRadius.all(
                              const Radius.circular(10.00),
                            ),
                            border: Border.all(color: cWhite)),
                        margin: EdgeInsets.only(
                            left: _width * 0.03,
                            right: _width * 0.03,
                            bottom: _width * 0.025),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.moneyBillAlt,
                              size: 20,
                              color: cPrimaryColor,
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                            Text(
                              " تكلفة التوصيل ",
                              style: TextStyle(
                                fontSize: 14,
                                color: cOmarColor,
                              ),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.only(
                                  right: 12, left: 12, top: 3, bottom: 3),
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.all(
                                    const Radius.circular(5.00),
                                  ),
                                  border: Border.all(
                                      color: Colors.grey.shade300)),
                              child: FutureBuilder<String>(
                                future: _costFrom,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      snapshot.data.toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: cOmarColor,
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }

                                  return Center(
                                      child: SpinKitThreeBounce(
                                    color: cPrimaryColor,
                                    size: 40,
                                  ));
                                },
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(1)),
                            Text(
                              " : ",
                              style: TextStyle(
                                fontSize: 30,
                                color: cOmarColor,
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(1)),
                            Container(
                              padding: EdgeInsets.only(
                                  right: 12, left: 12, top: 3, bottom: 3),
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.all(
                                    const Radius.circular(5.00),
                                  ),
                                  border: Border.all(
                                      color: Colors.grey.shade300)),
                              child: FutureBuilder<String>(
                                future: _costTo,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      snapshot.data.toString(),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: cOmarColor,
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }

                                  return Center(
                                      child: SpinKitThreeBounce(
                                    color: cPrimaryColor,
                                    size: 40,
                                  ));
                                },
                              ),
                            ),
                            Text(
                              " SR ",
                              style: TextStyle(
                                fontSize: 14,
                                color: cOmarColor,
                              ),
                            )
                          ],
                        ),
                      )
                    : Text(
                        "",
                        style: TextStyle(height: 0),
                      ),
                order.carttDone == 3
                    ? Container(
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                            color: cWhite,
                            borderRadius: BorderRadius.all(
                              const Radius.circular(10.00),
                            ),
                            border: Border.all(color: cWhite)),
                        margin: EdgeInsets.only(
                            left: _width * 0.03,
                            right: _width * 0.03,
                            bottom: _width * 0.025),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.moneyBillAlt,
                              size: 20,
                              color: cPrimaryColor,
                            ),
                            Padding(padding: EdgeInsets.all(5)),
                            Text(
                              " ادخل عرضك ",
                              style: TextStyle(
                                fontSize: 14,
                                color: cOmarColor,
                              ),
                            ),
                            Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.all(
                                    const Radius.circular(5.00),
                                  ),
                                  border: Border.all(
                                      color: Colors.grey.shade300)),
                              child: Container(
                                color: Colors.grey[100],
                                height: 38,
                                width: 100,
                                child: Container(
                                    color: Colors.grey[100],
                                    child: CustomTextFormField(
                                      hintTxt: "0.0",
                                      inputData: TextInputType.number,
                                      onChangedFunc: (String text) {
                                        _myOffer = text.toString();
                                      },
                                    )),
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(3)),
                            Text(
                              " SR ",
                              style: TextStyle(
                                fontSize: 14,
                                color: cOmarColor,
                              ),
                            )
                          ],
                        ),
                      )
                    : Text(
                        "",
                        style: TextStyle(height: 0),
                      ),
                FutureBuilder<String>(
                  future: _checkSendOffer,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      xxx = snapshot.data.toString();
                      if (xxx == "1") {
                        return Container(
                          padding: EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              "تم ارسال عرض السعر",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      } else {
                        return Text("");
                      }
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    return Center(
                        child: SpinKitThreeBounce(
                      color: cPrimaryColor,
                      size: 40,
                    ));
                  },
                ),
                order.carttDone == 3 && xxx == "0"
                    ? Container(
                        margin: EdgeInsets.only(
                            right: _width * .04, left: _width * .04),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: _width * .45,
                              child: CustomButton(
                                  defaultMargin: false,
                                  btnStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: cWhite),
                                  btnLbl: "الغاء",
                                  onPressedFunction: () {
                                    Navigator.pop(context);
                                  }),
                            ),
                            Container(
                              width: _width * .45,
                              child: CustomButton(
                                  defaultMargin: false,
                                  btnStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: cWhite),
                                  btnColor: Colors.yellow,
                                  btnLbl: "ارسال",
                                  onPressedFunction: () async {
                                    if (_formKey.currentState!.validate()) {
                                      if (_myOffer == null) {
                                        showToast(context,message:
                                        "يجب ادخال عرض السعر");
                                      } else if (double.parse(_myOffer!) <
                                          from) {
                                        showToast(context,message:
                                        "يجب ان لا يقل السعر عن الحد الادنى " +
                                                from.toString());
                                      } else if (double.parse(_myOffer!) > to) {
                                        showToast(context,message:
                                        "يجب ان لا يزيد السعر عن الحد الاعلى " +
                                                to.toString());
                                      } else {
                                        _progressIndicatorState!
                                            .setIsLoading(true);
                                        FormData formData =
                                            new FormData.fromMap({
                                          "offer_driver":
                                              _appState!.currentUser!.userId,
                                          "offer_cartt": order.carttId,
                                          "offer_price": _myOffer,
                                          "lang": _appState!.currentLang
                                        });

                                        var results = await _services.postWithDio(
                                            "https://qtaapp.com/api/send_offer1",
                                            body: formData);

                                        _progressIndicatorState!
                                            .setIsLoading(false);

                                        if (results['response'] == '1') {
                                          showToast(context,message:
                                          results['message']);
                                          Navigator.pop(context);
                                          // Navigator.pushReplacementNamed(context,  '/navigation');
                                        } else {
                                          showErrorDialog(
                                              results['message'], context);
                                        }
                                      }
                                    }
                                  }),
                            ),
                          ],
                        ))
                    : Text(
                        "",
                        style: TextStyle(height: 0),
                      ),
                order.carttDone == 4 ||
                        order.carttDone == 5 ||
                        order.carttDone == 6
                    ? Container(
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.centerRight,
                        decoration: BoxDecoration(
                            color: cWhite,
                            borderRadius: BorderRadius.all(
                              const Radius.circular(10.00),
                            ),
                            border: Border.all(color: cWhite)),
                        margin: EdgeInsets.only(
                            left: _width * 0.03,
                            right: _width * 0.03,
                            bottom: _width * 0.025),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  "حالة الدفع / ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  order.carttPay == 0
                                      ? "لم يتم التأكيد"
                                      : "مؤكد",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: _height * .03,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "حالة الطلب / ",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  order.carttPay == 0
                                      ? "بانتظار دفع العميل لبدء التوصيل"
                                      : "جارى التوصيل",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: _height * .03,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "اسم المتجر / ",
                                  style: TextStyle(),
                                ),
                                Text(
                                  order.carttMtgerName!,
                                  style: TextStyle(),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: _height * .01,
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "موقع المتجر / ",
                                  style: TextStyle(),
                                ),
                                TextButton(
                                  child: Text('اضغط هنا'),
                                  onPressed: () {
                                    launch(
                                        'https://www.google.com/maps/search/?api=1&query=' +
                                            order.carttMtgerMapx.toString() +
                                            ',' +
                                            order.carttMtgerMapy.toString() +
                                            '');
                                  },
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "موقع العميل / ",
                                  style: TextStyle(),
                                ),
                                TextButton(
                                  child: Text('اضغط هنا'),
                                  onPressed: () {
                                    launch(
                                        'https://www.google.com/maps/search/?api=1&query=' +
                                            order.carttMapx.toString() +
                                            ',' +
                                            order.carttMapy.toString() +
                                            '');
                                  },
                                )
                              ],
                            ),
                          ],
                        ))
                    : Text(
                        "",
                        style: TextStyle(height: 0),
                      ),
                (order.carttDone == 4 ||
                            order.carttDone == 5 ||
                            order.carttDone == 6) &&
                        order.carttPay == 1
                    ? Container(
                        margin: EdgeInsets.only(
                            left: _width * 0.02,
                            right: _width * 0.02,
                            bottom: _width * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: _width * .46,
                              child: CustomButton1(
                                  defaultMargin: false,
                                  btnStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: cWhite),
                                  btnLbl: "الاتصال بالعميل",
                                  onPressedFunction: () {
                                    launch('tel:' +
                                        "00966" +
                                        order.carttUserPhone!);
                                  }),
                            ),
                            Container(
                              width: _width * .46,
                              child: CustomButton1(
                                  defaultMargin: false,
                                  btnStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: cWhite),
                                  btnLbl: "الاتصال بالتاجر",
                                  onPressedFunction: () {
                                    launch('tel:' +
                                        "00966" +
                                        order.carttMtgerPhone!);
                                  }),
                            ),
                          ],
                        ),
                      )
                    : Text(
                        "",
                        style: TextStyle(height: 0),
                      ),
                order.carttDone == 4 && order.carttPay == 1
                    ? Container(
                        margin: EdgeInsets.only(
                          left: _width * 0.02,
                          right: _width * 0.02,
                        ),
                        width: _width,
                        child: CustomButton2(
                            btnColor: cLightLemon,
                            defaultMargin: false,
                            btnStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: cWhite),
                            btnLbl: "فى الطريق",
                            onPressedFunction: () async {
                              _progressIndicatorState!.setIsLoading(true);
                              var results = await _services.get(
                                  'https://qtaapp.com/api/do_update_cartt?id=${order.carttId}&done=5');
                              _progressIndicatorState!.setIsLoading(false);
                              if (results['response'] == '1') {
                                showToast(context,message: results['message']);
                                setState(() {
                                  _orderDetails = _getOrderDetails();
                                });
                              } else {
                                showErrorDialog(results['message'], context);
                              }
                            }),
                      )
                    : Text(
                        "",
                        style: TextStyle(height: 0),
                      ),
                order.carttDone == 5 && order.carttPay == 1
                    ? Container(
                        margin: EdgeInsets.only(
                          left: _width * 0.02,
                          right: _width * 0.02,
                        ),
                        width: _width,
                        child: CustomButton2(
                            btnColor: cLightLemon,
                            defaultMargin: false,
                            btnStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: cWhite),
                            btnLbl: "تم الوصول للموقع",
                            onPressedFunction: () async {
                              _progressIndicatorState!.setIsLoading(true);
                              var results = await _services.get(
                                  'https://qtaapp.com/api/do_update_cartt?id=${order.carttId}&done=6');
                              _progressIndicatorState!.setIsLoading(false);
                              if (results['response'] == '1') {
                                showToast(context,message: results['message']);
                                setState(() {
                                  _orderDetails = _getOrderDetails();
                                });
                              } else {
                                showErrorDialog(results['message'], context);
                              }
                            }),
                      )
                    : Text(
                        "",
                        style: TextStyle(height: 0),
                      ),
                order.carttDone == 6 && order.carttPay == 1
                    ? Container(
                        margin: EdgeInsets.only(
                          left: _width * 0.02,
                          right: _width * 0.02,
                        ),
                        width: _width,
                        child: CustomButton2(
                            btnColor: cLightLemon,
                            defaultMargin: false,
                            btnStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: cWhite),
                            btnLbl: "تم التسليم",
                            onPressedFunction: () async {
                              _progressIndicatorState!.setIsLoading(true);
                              var results = await _services.get(
                                  'https://qtaapp.com/api/do_update_cartt?id=${order.carttId}&done=7');
                              _progressIndicatorState!.setIsLoading(false);
                              if (results['response'] == '1') {
                                showToast(context,message: results['message']);
                                setState(() {
                                  _orderDetails = _getOrderDetails();
                                });
                              } else {
                                showErrorDialog(results['message'], context);
                              }
                            }),
                      )
                    : Text(
                        "",
                        style: TextStyle(height: 0),
                      ),
              ],
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    _height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    _width = MediaQuery.of(context).size.width;
    _progressIndicatorState = Provider.of<ProgressIndicatorState>(context);
    _tabState = Provider.of<TabState>(context);
    _navigationState = Provider.of<NavigationState>(context);

    return NetworkIndicator(
        child: PageContainer(
      child: Scaffold(
          backgroundColor: Color(0xffF5F6F8),
          body: Stack(
            children: <Widget>[
              FutureBuilder<Order>(
                  future: _orderDetails,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Stack(
                        children: <Widget>[
                          _buildBodyItem(snapshot.data!),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: GradientAppBar(
                              appBarTitle: "طلب رقم : " + _orderState!.carttId,
                              leading: _appState!.currentLang == 'en'
                                  ? IconButton(
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        color: cBlack,
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  : Container(),
                              trailing: _appState!.currentLang == 'ar'
                                  ? IconButton(
                                      icon: Transform.rotate(
                                        angle: 180 * math.pi / 180,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.arrow_back_ios,
                                            color: cBlack,
                                          ),
                                          onPressed: null,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  : Container(),
                            ),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    return Center(
                        child: SpinKitThreeBounce(
                      color: cPrimaryColor,
                      size: 40,
                    ));
                  }),
              Center(
                child: ProgressIndicatorComponent(),
              )
            ],
          )),
    ));
  }
}
