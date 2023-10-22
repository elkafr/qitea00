import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as gg;
import 'package:provider/provider.dart';
import 'package:qitea/components/app_repo/app_state.dart';
import 'package:qitea/components/app_repo/location_state.dart';
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
import 'package:qitea/models/offer.dart';
import 'package:qitea/models/offer1.dart';
import 'package:qitea/models/order.dart';
import 'package:qitea/screens/payment/payment_screen.dart';
import 'package:qitea/utils/utils.dart';
import 'package:qitea/components/progress_indicator_component/progress_indicator_component.dart';
import 'package:qitea/screens/orders/components/cancel_order_bottom_sheet.dart';
import 'package:qitea/services/access_api.dart';
import 'package:qitea/utils/app_colors.dart';
import 'dart:math' as math;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


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

import 'dart:async';
import 'dart:core';
import 'dart:core';
import 'dart:core';

import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:qitea/components/MainDrawer.dart';
import 'package:qitea/components/app_repo/navigation_state.dart';
import 'package:qitea/components/drop_down_list_selector/drop_down_list_selector.dart';
import 'package:qitea/components/app_repo/location_state.dart';
import 'package:qitea/models/marka.dart';
import 'package:qitea/models/model.dart';
import 'package:qitea/models/type.dart';
import 'package:qitea/screens/home/components/home_appbar.dart';
import 'package:qitea/screens/home/components/select_location.dart';
import 'package:qitea/screens/home/home1_screen.dart';
import 'package:provider/provider.dart';
import 'package:qitea/components/app_data/shared_preferences_helper.dart';
import 'package:qitea/components/app_repo/app_state.dart';
import 'package:qitea/components/connectivity/network_indicator.dart';
import 'package:qitea/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:qitea/components/gradient_app_bar/gradient_app_bar.dart';
import 'package:qitea/components/no_data/no_data.dart';
import 'package:qitea/components/safe_area/page_container.dart';
import 'package:qitea/locale/localization.dart';
import 'package:qitea/screens/orders/orders_screen.dart';
import 'package:qitea/services/access_api.dart';
import 'package:qitea/utils/app_colors.dart';
import 'package:qitea/models/category.dart';
import 'package:qitea/models/store.dart';
import 'package:qitea/utils/utils.dart';
import 'package:qitea/components/app_repo/store_state.dart';
import 'package:qitea/components/store_card/store_card_item.dart';
import 'package:qitea/screens/home/components/slider_images.dart';
import 'package:qitea/screens/home/components/category_item1.dart';
import 'package:qitea/components/app_repo/progress_indicator_state.dart';
import 'package:qitea/components/progress_indicator_component/progress_indicator_component.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:validators/validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:qitea/components/app_repo/progress_indicator_state.dart';
import 'package:qitea/components/buttons/custom_button.dart';
import 'package:qitea/components/response_handling/response_handling.dart';
import 'dart:math' as math;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:qitea/services/access_api.dart';
import 'dart:io';

import 'package:qitea/components/dialogs/location_dialog.dart';
import 'package:qitea/components/dialogs/location_dialog1.dart';
import 'package:qitea/components/app_repo/location_state.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qitea/components/app_repo/location_state.dart';
import 'package:qitea/components/buttons/custom_button.dart';
import 'package:qitea/locale/localization.dart';
import 'package:qitea/utils/app_colors.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

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
import 'package:qitea/components/connectivity/network_indicator.dart';
import 'package:qitea/components/gradient_app_bar/gradient_app_bar.dart';
import 'package:qitea/components/response_handling/response_handling.dart';
import 'package:qitea/components/safe_area/page_container.dart';
import 'package:qitea/locale/localization.dart';
import 'package:qitea/models/offer.dart';
import 'package:qitea/models/order.dart';
import 'package:qitea/utils/utils.dart';
import 'package:qitea/components/progress_indicator_component/progress_indicator_component.dart';
import 'package:qitea/screens/orders/components/cancel_order_bottom_sheet.dart';
import 'package:qitea/services/access_api.dart';
import 'package:qitea/utils/app_colors.dart';
import 'dart:math' as math;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


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

import 'dart:async';
import 'dart:core';
import 'dart:core';
import 'dart:core';

import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:qitea/components/MainDrawer.dart';
import 'package:qitea/components/app_repo/navigation_state.dart';
import 'package:qitea/components/drop_down_list_selector/drop_down_list_selector.dart';
import 'package:qitea/components/app_repo/location_state.dart';
import 'package:qitea/models/marka.dart';
import 'package:qitea/models/model.dart';
import 'package:qitea/models/type.dart';
import 'package:qitea/screens/home/components/home_appbar.dart';
import 'package:qitea/screens/home/components/select_location.dart';
import 'package:qitea/screens/home/home1_screen.dart';
import 'package:provider/provider.dart';
import 'package:qitea/components/app_data/shared_preferences_helper.dart';
import 'package:qitea/components/app_repo/app_state.dart';
import 'package:qitea/components/connectivity/network_indicator.dart';
import 'package:qitea/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:qitea/components/gradient_app_bar/gradient_app_bar.dart';
import 'package:qitea/components/no_data/no_data.dart';
import 'package:qitea/components/safe_area/page_container.dart';
import 'package:qitea/locale/localization.dart';
import 'package:qitea/screens/orders/orders_screen.dart';
import 'package:qitea/services/access_api.dart';
import 'package:qitea/utils/app_colors.dart';
import 'package:qitea/models/category.dart';
import 'package:qitea/models/store.dart';
import 'package:qitea/utils/utils.dart';
import 'package:qitea/components/app_repo/store_state.dart';
import 'package:qitea/components/store_card/store_card_item.dart';
import 'package:qitea/screens/home/components/slider_images.dart';
import 'package:qitea/screens/home/components/category_item1.dart';
import 'package:qitea/components/app_repo/progress_indicator_state.dart';
import 'package:qitea/components/progress_indicator_component/progress_indicator_component.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:validators/validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:qitea/components/app_repo/progress_indicator_state.dart';
import 'package:qitea/components/buttons/custom_button.dart';
import 'package:qitea/components/response_handling/response_handling.dart';
import 'dart:math' as math;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:qitea/services/access_api.dart';
import 'dart:io';

import 'package:qitea/components/dialogs/location_dialog.dart';
import 'package:qitea/components/app_repo/location_state.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as gg;

class OrderDetailsScreen extends StatefulWidget {
  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  bool _initialRun = true;
  OrderState? _orderState;
  double _height = 0, _width = 0;
  Services _services = Services();
  ProgressIndicatorState? _progressIndicatorState;
  AppState? _appState;
  TabState? _tabState;
  NavigationState? _navigationState;
  Future<Order>? _orderDetails;
  Future<Offer>? _offerDetails;
  Future<Offer1>? _offer1Details;

  Completer<GoogleMapController> _mapController = Completer();
  Set<Marker> _markers = Set();
  LocationState? _locationState;
  Future<List<Offer>>? _offersList;
  Future<List<Offer1>>? _offersList1;
  Marker? _marker;
  String? _rateValue;

  LocationData? _locData;

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

  Future<Offer> _getOfferDetails() async {
    Map<dynamic, dynamic> results = await _services.get(
        'https://qtaapp.com/api/show_offer?lang=${_appState!.currentLang}&offer_mtger=${_appState!.currentOfferMtger}&offer_cartt=${_orderState!.carttId}');
    Offer offerDetails = Offer();
    if (results['response'] == '1') {
      offerDetails = Offer.fromJson(results['result']);
    } else {
      print('error');
    }
    return offerDetails;
  }

  Future<Offer1> _getOffer1Details() async {
    Map<dynamic, dynamic> results = await _services.get(
        'https://qtaapp.com/api/show_offer1?lang=${_appState!.currentLang}&offer_driver=${_appState!.currentOfferDriver}&offer_cartt=${_orderState!.carttId}');
    Offer1 offerDetails = Offer1();
    if (results['response'] == '1') {
      offerDetails = Offer1.fromJson(results['result']);
    } else {
      print('error');
    }
    return offerDetails;
  }

  Future<void> _getCurrentUserLocation() async {

    _progressIndicatorState!.setIsLoading(true);
    _locData = await gg.Location().getLocation();
    print(_locData!.latitude);
    print(_locData!.longitude);

    if (_locData != null) {
      _locationState!.setLocationLatitude(_locData!.latitude!);
      _locationState!.setLocationlongitude(_locData!.longitude!);
      List<Placemark> placemark = await placemarkFromCoordinates(
          _locationState!.locationLatitude, _locationState!.locationlongitude);
      _locationState!.setCurrentAddress(placemark[0].name! +
          '  ' +
          placemark[0].administrativeArea! +
          ' ' +
          placemark[0].country!);
      //  final coordinates = new Coordinates(_locationState.locationLatitude, _locationState
      //  .locationlongitude);
      // var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
      // var first = addresses.first;
      _progressIndicatorState!.setIsLoading(false);
      // _locationState.setCurrentAddress(first.addressLine);

      // print("${first.featureName} : ${first.addressLine}");
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (_) {
            return LocationDialog();
          });
    }
  }

  Future<List<Offer1>> _getOffersList1() async {
    Map<dynamic, dynamic> results = await _services.get(
        'https://qtaapp.com/api/show_offers1?lang=${_appState!.currentLang}&cartt_id=${_orderState!.carttId}');

    List offerList = <Offer1>[];
    if (results['response'] == '1') {
      Iterable iterable = results['result'];
      offerList = iterable.map((model) => Offer1.fromJson(model)).toList();
    } else {
      print('error');
    }
    return offerList as FutureOr<List<Offer1>>;
  }

  Future<void> _getCurrentUserLocation1() async {
    _progressIndicatorState!.setIsLoading(true);
    _locData = await gg.Location().getLocation();
    print(_locData!.latitude);
    print(_locData!.longitude);

    if (_locData != null) {
      _locationState!.setLocationLatitude(_locData!.latitude!);
      _locationState!.setLocationlongitude(_locData!.longitude!);
      List<Placemark> placemark = await placemarkFromCoordinates(
          _locationState!.locationLatitude, _locationState!.locationlongitude);
      _locationState!.setCurrentAddress(placemark[0].name! +
          '  ' +
          placemark[0].administrativeArea! +
          ' ' +
          placemark[0].country!);
      //  final coordinates = new Coordinates(_locationState.locationLatitude, _locationState
      //  .locationlongitude);
      // var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
      // var first = addresses.first;
      _progressIndicatorState!.setIsLoading(false);
      // _locationState.setCurrentAddress(first.addressLine);

      // print("${first.featureName} : ${first.addressLine}");
      showDialog(
          barrierDismissible: true,
          context: context,
          builder: (_) {
            return AlertDialog(
              contentPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              content: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: cPrimaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.00),
                          topRight: Radius.circular(15.00),
                        ),
                        border: Border.all(color: cHintColor)),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    child: Text(
                      "اختيار اللوكيشن",
                      style: TextStyle(
                          color: cWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * .95,
                    child: GoogleMap(
                      markers: _markers,
                      mapType: MapType.normal,
                      // myLocationEnabled: true,
                      initialCameraPosition: CameraPosition(
                          target: LatLng(_locationState!.locationLatitude,
                              _locationState!.locationlongitude),
                          zoom: 12),
                      onMapCreated: (GoogleMapController controller) {
                        _mapController.complete(controller);
                      },
                      onCameraMove: ((_position) => _updatePosition(_position)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Text(_locationState!.address,
                        style: TextStyle(
                            height: 1.5,
                            color: cPrimaryColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w400)),
                  ),
                  Container(
                      margin: EdgeInsets.only(bottom: 20, right: 15, left: 15),
                      child: CustomButton(
                          btnColor: cLightLemon,
                          btnLbl: "تاكيد",
                          onPressedFunction: () async {
                            Navigator.pop(context);
                            _progressIndicatorState!.setIsLoading(true);
                            var results = await _services.get(
                                'https://qtaapp.com/api/send_request1?lang=ar&user_id=${_appState!.currentUser!.userId}&request_cartt=${_appState!.currentOfferCartt}&request_mapx=${_locationState!.locationLatitude}&request_mapy=${_locationState!.locationlongitude}&lang=${_appState!.currentLang}');
                            _progressIndicatorState!.setIsLoading(false);
                            if (results['response'] == '1') {
                              print(results['message']);
                              print(results['message']);

                              showToast(context,message: results['message']);

                              setState(() {
                                _orderDetails = _getOrderDetails();
                                _offerDetails = _getOfferDetails();
                              });
                            } else {
                              showErrorDialog(results['message'], context);
                            }
                          }))
                ],
              )),
            );
          });
    }
  }

  Future<void> _updatePosition(CameraPosition _position) async {
    print(
        'inside updatePosition ${_position.target.latitude} ${_position.target.longitude}');
    // Marker marker = _markers.firstWhere(
    //     (p) => p.markerId == MarkerId('marker_2'),
    //     orElse: () => null);

    _markers.remove(_marker);
    _markers.add(
      Marker(
        markerId: MarkerId('marker_2'),
        position: LatLng(_position.target.latitude, _position.target.longitude),
        draggable: true,
      ),
    );
    print(_position.target.latitude);
    print(_position.target.longitude);
    _locationState!.setLocationLatitude(_position.target.latitude);
    _locationState!.setLocationlongitude(_position.target.longitude);
    List<Placemark> placemark = await placemarkFromCoordinates(
        _locationState!.locationLatitude, _locationState!.locationlongitude);
    _locationState!.setCurrentAddress(placemark[0].name! +
        '  ' +
        placemark[0].administrativeArea! +
        ' ' +
        placemark[0].country!);
    //              final coordinates = new Coordinates(
    //                _locationState.locationLatitude, _locationState
    //  .locationlongitude);
    //       var addresses = await Geocoder.local.findAddressesFromCoordinates(
    //         coordinates);
    //       var first = addresses.first;
    //     _locationState.setCurrentAddress(first.addressLine);
    print(_locationState!.address);
    if (!mounted) return;
    setState(() {});
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
      _offerDetails = _getOfferDetails();
      _offer1Details = _getOffer1Details();
      _locationState = Provider.of<LocationState>(context);
      _locationState!.initCurrentAddress("فضلا اختيار اللوكيشن");
      _offersList1 = _getOffersList1();
      _locationState!.setAnotherAdress("0");
    }
  }

  Widget _buildBodyItem(Order order) {
    print("333333333333333333333333");
    print(_appState!.currentOfferDriver);
    print("333333333333333333333333");

    return SingleChildScrollView(
      child: Container(
        width: _width,
        height: _height*.94,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 60,
            ),

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
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(
                    left: _width * 0.03,
                    right: _width * 0.03,
                    bottom: _width * 0.09),
                height: order.carttNumber == "1"
                    ? _height * .47
                    : (order.carttNumber == "2"
                        ? _height * .70
                        : _height * .94),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          order.carttNumber == "2" || order.carttNumber == "3"
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
                          order.carttNumber == "2" || order.carttNumber == "3"
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
                          order.carttNumber == "2" || order.carttNumber == "3"
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
                    ),
                  ],
                )),

            (order.carttDone == 1) &&
                    _appState!.currentOfferCartt != "0" &&
                    _appState!.currentOfferMtger != ""
                ? Container(
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.only(
                        left: _width * 0.03,
                        right: _width * 0.03,
                        bottom: _width * 0.04),
                    height: _height * .16,
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
                    child: FutureBuilder<Offer>(
                        future: _offerDetails,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "اسم التاجر",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                        snapshot.data!.offerMtgerName
                                            .toString(),
                                        style: TextStyle()),
                                  ],
                                ),
                                SizedBox(
                                  height: _width * .01,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "التقييم",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    RatingBar.builder(
                                      initialRating: double.parse(
                                          snapshot.data!.offerMtgerRate!),
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemPadding: EdgeInsets.all(0),
                                      itemSize: 25,
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (d){},
                                      ignoreGestures: true,
                                    ),
                                  ],
                                )
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
                  )
                : Text(
                    "",
                    style: TextStyle(height: 0),
                  ),

            (order.carttDone == 2 ||
                        order.carttDone == 3 ||
                        order.carttDone == 4 ||
                        order.carttDone == 5 ||
                        order.carttDone == 6 ||
                        order.carttDone == 7) &&
                    _appState!.currentOfferCartt != "0" &&
                    _appState!.currentOfferMtger != ""
                ? Container(
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.only(
                        left: _width * 0.03,
                        right: _width * 0.03,
                        bottom: _width * 0.04),
                    height: _height * .16,
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
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "اسم التاجر",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(order.carttMtgerName.toString(),
                                style: TextStyle()),
                          ],
                        ),
                        SizedBox(
                          height: _width * .01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "التقييم",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            RatingBar.builder(
                              initialRating:
                                  double.parse(order.carttMtgerRate!),
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.all(0),
                              itemSize: 25,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (s) {},
                              ignoreGestures: true,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : Text(
                    "",
                    style: TextStyle(height: 0),
                  ),

            (order.carttDone == 2 ||
                    order.carttDone == 5 ||
                    order.carttDone == 6 ||
                    order.carttDone == 7)
                ? Container(
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.only(
                        left: _width * 0.03,
                        right: _width * 0.03,
                        bottom: _width * 0.04),
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
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.moneyBillAlt,
                              size: 20,
                              color: cPrimaryColor,
                            ),
                            Padding(padding: EdgeInsets.all(7)),
                            Text(
                              "قيمة العرض المقدم",
                              style: TextStyle(),
                            ),
                            Spacer(),
                            Container(
                              child: Text(order.carttPrice!,
                                  style: TextStyle(color: Colors.white)),
                              color: cLightLemon,
                              padding: EdgeInsets.only(
                                  top: 4, bottom: 4, left: 7, right: 7),
                            ),
                            Padding(padding: EdgeInsets.all(3)),
                            Text(
                              "SR",
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Text(
                    "",
                    style: TextStyle(height: 0),
                  ),

            (order.carttDone == 3) &&
                    _appState!.currentOfferCartt != "0" &&
                    _appState!.currentOfferDriver != "0"
                ? Container(
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.only(
                        left: _width * 0.03,
                        right: _width * 0.03,
                        bottom: _width * 0.04),
                    height: _height * .16,
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
                    child: FutureBuilder<Offer1>(
                        future: _offer1Details,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.offerDriverName == null) {
                              return Center(
                                child: Text("لا توجد عروض توصيل"),
                              );
                            } else {
                              return Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "اسم المندوب",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          snapshot.data!.offerDriverName
                                              .toString(),
                                          style: TextStyle()),
                                    ],
                                  ),
                                  SizedBox(
                                    height: _width * .01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "التقييم",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      RatingBar.builder(
                                        initialRating: double.parse(
                                            snapshot.data!.offerDriverRate!),
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.all(0),
                                        itemSize: 25,
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) async {},
                                        ignoreGestures: true,
                                      ),
                                    ],
                                  )
                                ],
                              );
                            }
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }

                          return Center(
                              child: SpinKitThreeBounce(
                            color: cPrimaryColor,
                            size: 40,
                          ));
                        }),
                  )
                : Text(
                    "",
                    style: TextStyle(height: 0),
                  ),

            (order.carttDone == 4 ||
                    order.carttDone == 5 ||
                    order.carttDone == 6 ||
                    order.carttDone == 7)
                ? Container(
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.only(
                        left: _width * 0.03,
                        right: _width * 0.03,
                        bottom: _width * 0.04),
                    height: _height * .16,
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
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "اسم المندوب",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(order.carttDriverName.toString(),
                                style: TextStyle()),
                          ],
                        ),
                        SizedBox(
                          height: _width * .01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "التقييم",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            RatingBar.builder(
                              initialRating:
                                  double.parse(order.carttDriverRate!),
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.all(0),
                              itemSize: 25,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (c){},
                              ignoreGestures: true,
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : Text(
                    "",
                    style: TextStyle(height: 0),
                  ),

            (order.carttDone == 3) &&
                    _appState!.currentOfferCartt != "0" &&
                    _appState!.currentOfferDriver != "0"
                ? Container(
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.only(
                        left: _width * 0.03,
                        right: _width * 0.03,
                        bottom: _width * 0.04),
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
                    child: FutureBuilder<Offer1>(
                        future: _offer1Details,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.offerDriverName == null) {
                              return Text("");
                            } else {
                              return Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        FontAwesomeIcons.moneyBillAlt,
                                        size: 20,
                                        color: cPrimaryColor,
                                      ),
                                      Padding(padding: EdgeInsets.all(7)),
                                      Text(
                                        "قيمة العرض المقدم",
                                        style: TextStyle(),
                                      ),
                                      Spacer(),
                                      Container(
                                        child: Text(
                                            snapshot.data!.offerPrice
                                                .toString(),
                                            style:
                                                TextStyle(color: Colors.white)),
                                        color: cLightLemon,
                                        padding: EdgeInsets.only(
                                            top: 4,
                                            bottom: 4,
                                            left: 7,
                                            right: 7),
                                      ),
                                      Padding(padding: EdgeInsets.all(3)),
                                      Text(
                                        "SR",
                                        style: TextStyle(),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }

                          return Center(
                              child: SpinKitThreeBounce(
                            color: cPrimaryColor,
                            size: 40,
                          ));
                        }),
                  )
                : Text(
                    "",
                    style: TextStyle(height: 0),
                  ),

            (order.carttDone == 4 ||
                    order.carttDone == 5 ||
                    order.carttDone == 6 ||
                    order.carttDone == 7)
                ? Container(
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.only(
                        left: _width * 0.03,
                        right: _width * 0.03,
                        bottom: _width * 0.04),
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
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.moneyBillAlt,
                              size: 20,
                              color: cPrimaryColor,
                            ),
                            Padding(padding: EdgeInsets.all(7)),
                            Text(
                              "قيمة العرض المقدم",
                              style: TextStyle(),
                            ),
                            Spacer(),
                            Container(
                              child: Text(order.carttPrice1!,
                                  style: TextStyle(color: Colors.white)),
                              color: cLightLemon,
                              padding: EdgeInsets.only(
                                  top: 4, bottom: 4, left: 7, right: 7),
                            ),
                            Padding(padding: EdgeInsets.all(3)),
                            Text(
                              "SR",
                              style: TextStyle(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Text(
                    "",
                    style: TextStyle(height: 0),
                  ),

            (order.carttDone == 4 || order.carttDone == 7)
                ? Container(
                    padding: EdgeInsets.only(
                        right: _width * .08,
                        left: _width * .08,
                        top: 10,
                        bottom: 10),
                    margin: EdgeInsets.only(
                        left: _width * 0.03,
                        right: _width * 0.03,
                        bottom: _width * 0.02),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Color(0xffEBEBEB)),
                      color: cWhite,
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "قيمة العرض ",
                            style: TextStyle(color: cPrimaryColor),
                          ),
                          width: _width * .32,
                        ),
                        Container(
                            width: 2, height: 35, color: Colors.grey[200]),
                        Row(
                          children: <Widget>[
                            Text(order.carttPrice!,
                                style: TextStyle(color: cPrimaryColor)),
                            Padding(padding: EdgeInsets.all(3)),
                            Text(
                              "SR",
                              style: TextStyle(color: cPrimaryColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : Text(
                    "",
                    style: TextStyle(height: 0),
                  ),

            (order.carttDone == 4 || order.carttDone == 7)
                ? Container(
                    padding: EdgeInsets.only(
                        right: _width * .08,
                        left: _width * .08,
                        top: 10,
                        bottom: 10),
                    margin: EdgeInsets.only(
                        left: _width * 0.03,
                        right: _width * 0.03,
                        bottom: _width * 0.02),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Color(0xffEBEBEB)),
                      color: cWhite,
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "قيمة عرض التوصيل ",
                            style: TextStyle(color: cPrimaryColor),
                          ),
                          width: _width * .32,
                        ),
                        Container(
                            width: 2, height: 35, color: Colors.grey[200]),
                        Row(
                          children: <Widget>[
                            Text(order.carttPrice1!,
                                style: TextStyle(color: cPrimaryColor)),
                            Padding(padding: EdgeInsets.all(3)),
                            Text(
                              "SR",
                              style: TextStyle(color: cPrimaryColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : Text(
                    "",
                    style: TextStyle(height: 0),
                  ),

            (order.carttDone == 4 || order.carttDone == 7)
                ? Container(
                    padding: EdgeInsets.only(
                        right: _width * .08,
                        left: _width * .08,
                        top: 10,
                        bottom: 10),
                    margin: EdgeInsets.only(
                        left: _width * 0.03,
                        right: _width * 0.03,
                        bottom: _width * 0.02),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Color(0xffEBEBEB)),
                      color: cWhite,
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "رسوم ادارية ",
                            style: TextStyle(color: cPrimaryColor),
                          ),
                          width: _width * .28,
                        ),
                        Container(
                            width: 2, height: 35, color: Colors.grey[200]),
                        Row(
                          children: <Widget>[
                            Text(order.carttFees!,
                                style: TextStyle(color: cPrimaryColor)),
                            Padding(padding: EdgeInsets.all(3)),
                            Text(
                              "SR",
                              style: TextStyle(color: cPrimaryColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : Text(
                    "",
                    style: TextStyle(height: 0),
                  ),

            (order.carttDone == 4 || order.carttDone == 7)
                ? Container(
                    padding: EdgeInsets.only(
                        right: _width * .08,
                        left: _width * .08,
                        top: 10,
                        bottom: 10),
                    margin: EdgeInsets.only(
                        left: _width * 0.03,
                        right: _width * 0.03,
                        bottom: _width * 0.02),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Color(0xffEBEBEB)),
                      color: cWhite,
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "القيمة المضافة ",
                            style: TextStyle(color: cPrimaryColor),
                          ),
                          width: _width * .28,
                        ),
                        Container(
                            width: 2, height: 35, color: Colors.grey[200]),
                        Row(
                          children: <Widget>[
                            Text(order.carttVat!,
                                style: TextStyle(color: cPrimaryColor)),
                            Padding(padding: EdgeInsets.all(3)),
                            Text(
                              "SR",
                              style: TextStyle(color: cPrimaryColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : Text(
                    "",
                    style: TextStyle(height: 0),
                  ),

            (order.carttDone == 4 || order.carttDone == 7)
                ? Container(
                    padding: EdgeInsets.only(
                        right: _width * .08,
                        left: _width * .08,
                        top: 10,
                        bottom: 10),
                    margin: EdgeInsets.only(
                        left: _width * 0.03,
                        right: _width * 0.03,
                        bottom: _width * 0.02),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Color(0xffEBEBEB)),
                      color: cWhite,
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          child: Text(
                            "الاجمالي ",
                            style: TextStyle(color: cPrimaryColor),
                          ),
                          width: _width * .37,
                        ),
                        Container(
                            width: 2, height: 35, color: Colors.grey[200]),
                        Row(
                          children: <Widget>[
                            Text(order.carttTotal!,
                                style: TextStyle(color: cPrimaryColor)),
                            Padding(padding: EdgeInsets.all(3)),
                            Text(
                              "SR",
                              style: TextStyle(color: cPrimaryColor),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                : Text(
                    "",
                    style: TextStyle(height: 0),
                  ),

            (order.carttDone == 3) &&
                    _appState!.currentOfferCartt != "0" &&
                    _appState!.currentOfferDriver != "0"
                ? Container(
                    margin: EdgeInsets.only(
                        left: _width * 0.02,
                        right: _width * 0.02,
                        bottom: _width * 0.04),
                    child: FutureBuilder<Offer1>(
                        future: _offer1Details,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data!.offerDriverName == null) {
                              return Text("");
                            } else {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width: _width * .45,
                                    child: CustomButton(
                                        defaultMargin: false,
                                        btnStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15,
                                            color: cWhite),
                                        btnLbl: "رفض",
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
                                        btnLbl: "قبول",
                                        onPressedFunction: () {
                                          showDialog(
                                              barrierDismissible: true,
                                              context: context,
                                              builder: (_) {
                                                return AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.0))),
                                                  content:
                                                      SingleChildScrollView(
                                                    child: Column(
                                                      children: <Widget>[
                                                        Text(
                                                          "هل تريد بالفعل  قبول عرض التوصيل ؟",
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              height: 1.5,
                                                              fontFamily:
                                                                  'segoeui'),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Divider(
                                                          height: 2,
                                                          color:
                                                              Color(0xff707070),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: <Widget>[
                                                            GestureDetector(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .cancel,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color: Theme.of(context)
                                                                            .primaryColor,
                                                                        fontFamily:
                                                                            'segoeui',
                                                                        fontWeight:
                                                                            FontWeight.w500))),
                                                            Container(
                                                              width: 1,
                                                              height: 30,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                            GestureDetector(
                                                                onTap:
                                                                    () async {

                                                                  _progressIndicatorState!
                                                                      .setIsLoading(
                                                                          true);
                                                                  _orderDetails = _getOrderDetails();
                                                                  var results =
                                                                      await _services
                                                                          .get(
                                                                              'https://qtaapp.com/api/acceptOffer1?cartt_id=${snapshot.data!.offerCartt}&offer_id=${snapshot.data!.offerId}&lang=${_appState!.currentLang}');
                                                                  _progressIndicatorState!
                                                                      .setIsLoading(
                                                                          false);
                                                                  if (results[
                                                                          'response'] ==
                                                                      '1') {
                                                                    showToast(context,message:
                                                                    results[
                                                                            'message']);

                                                                    setState(
                                                                        () {
                                                                      _orderDetails =
                                                                          _getOrderDetails();
                                                                      _offerDetails =
                                                                          _getOfferDetails();
                                                                    });
                                                                  } else {
                                                                    showErrorDialog(
                                                                        results[
                                                                            'message'],
                                                                        context);
                                                                  }

                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Text(
                                                                    AppLocalizations.of(
                                                                            context)!
                                                                        .ok,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        fontFamily:
                                                                            'segoeui',
                                                                        color: Theme.of(context)
                                                                            .primaryColor,
                                                                        fontWeight:
                                                                            FontWeight.w500)))
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        }),
                                  ),
                                ],
                              );
                            }
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }

                          return Center(
                              child: SpinKitThreeBounce(
                            color: cPrimaryColor,
                            size: 40,
                          ));
                        }),
                  )
                : Text(
                    "",
                    style: TextStyle(height: 0),
                  ),

            order.carttDone == 1 &&
                    _appState!.currentOfferCartt != "0" &&
                    _appState!.currentOfferMtger != ""
                ? Container(
                    padding: EdgeInsets.all(30),
                    margin: EdgeInsets.only(
                        left: _width * 0.03,
                        right: _width * 0.03,
                        bottom: _width * 0.09),
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
                    child: FutureBuilder<Offer>(
                        future: _offerDetails,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "القطعة 1",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: _width * .02,
                                ),
                                snapshot.data!.offerType == 0
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(snapshot.data!.requestLabel1
                                              .toString()),
                                          Text(" سعر " +
                                              snapshot.data!.requestPrice1
                                                  .toString() +
                                              " ريال "),
                                          Container(
                                            alignment: Alignment.center,
                                            child: snapshot.data!
                                                        .requestPrice1Act ==
                                                    0
                                                ? GestureDetector(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: _width * .20,
                                                      child: Text(
                                                        "قبول",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      color: Colors.green,
                                                      padding: EdgeInsets.only(
                                                          top: 10,
                                                          bottom: 10,
                                                          right: 14,
                                                          left: 14),
                                                    ),
                                                    onTap: () {
                                                      showDialog(
                                                          barrierDismissible:
                                                              true,
                                                          context: context,
                                                          builder: (_) {
                                                            return AlertDialog(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              10.0))),
                                                              content:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                      "هل تريد بالفعل  قبول عرض السعر ؟",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15,
                                                                          height:
                                                                              1.5,
                                                                          fontFamily:
                                                                              'segoeui'),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Divider(
                                                                      height: 2,
                                                                      color: Color(
                                                                          0xff707070),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: <
                                                                          Widget>[
                                                                        GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Text(AppLocalizations.of(context)!.cancel, style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor, fontFamily: 'segoeui', fontWeight: FontWeight.w500))),
                                                                        Container(
                                                                          width:
                                                                              1,
                                                                          height:
                                                                              30,
                                                                          color:
                                                                              Colors.black,
                                                                        ),
                                                                        GestureDetector(
                                                                            onTap:
                                                                                () async {
                                                                              print("Sssssssssssss");

                                                                              Navigator.pop(context);

                                                                              _progressIndicatorState!.setIsLoading(true);
                                                                              var results = await _services.get('https://qtaapp.com/api/acceptRequest?lang=ar&type=requestPrice1Act&offer_id=${snapshot.data!.offerId}&lang=${_appState!.currentLang}');
                                                                              _progressIndicatorState!.setIsLoading(false);
                                                                              if (results['response'] == '1') {
                                                                                showToast(context,message: results['message']);

                                                                                setState(() {
                                                                                  _orderDetails = _getOrderDetails();
                                                                                  _offerDetails = _getOfferDetails();
                                                                                });
                                                                              } else {
                                                                                showErrorDialog(results['message'], context);
                                                                              }
                                                                            },
                                                                            child:
                                                                                Text(AppLocalizations.of(context)!.ok, style: TextStyle(fontSize: 14, fontFamily: 'segoeui', color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500)))
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          });
                                                    },
                                                  )
                                                : (snapshot.data!
                                                            .requestPrice1Act ==
                                                        1
                                                    ? Icon(
                                                        Icons.check_circle,
                                                        color: Colors.green,
                                                      )
                                                    : Icon(
                                                        Icons.cancel,
                                                        color: Colors.red,
                                                      )),
                                          )
                                        ],
                                      )
                                    : Column(
                                        children: <Widget>[
                                          snapshot.data!.requestPrice1Offer1 != 0
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text(snapshot.data!
                                                        .requestPrice1Label1
                                                        .toString()),
                                                    Text(" سعر " +
                                                        snapshot.data!
                                                            .requestPrice1Offer1
                                                            .toString() +
                                                        " ريال "),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: snapshot.data!
                                                                  .requestPrice1Offer1Act ==
                                                              0
                                                          ? GestureDetector(
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                width: _width *
                                                                    .20,
                                                                child: Text(
                                                                  "قبول",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                color: Colors
                                                                    .green,
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: 10,
                                                                        bottom:
                                                                            10,
                                                                        right:
                                                                            14,
                                                                        left:
                                                                            14),
                                                              ),
                                                              onTap: () {
                                                                showDialog(
                                                                    barrierDismissible:
                                                                        true,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (_) {
                                                                      return AlertDialog(
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.all(Radius.circular(10.0))),
                                                                        content:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            children: <Widget>[
                                                                              Text(
                                                                                "هل تريد بالفعل  قبول عرض السعر ؟",
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(fontSize: 15, height: 1.5, fontFamily: 'segoeui'),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              Divider(
                                                                                height: 2,
                                                                                color: Color(0xff707070),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: <Widget>[
                                                                                  GestureDetector(
                                                                                      onTap: () {
                                                                                        Navigator.pop(context);
                                                                                      },
                                                                                      child: Text(AppLocalizations.of(context)!.cancel, style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor, fontFamily: 'segoeui', fontWeight: FontWeight.w500))),
                                                                                  Container(
                                                                                    width: 1,
                                                                                    height: 30,
                                                                                    color: Colors.black,
                                                                                  ),
                                                                                  GestureDetector(
                                                                                      onTap: () async {
                                                                                        print("Sssssssssssss");

                                                                                        Navigator.pop(context);

                                                                                        _progressIndicatorState!.setIsLoading(true);
                                                                                        var results = await _services.get('https://qtaapp.com/api/acceptRequest?lang=ar&type=requestPrice1Offer1Act&offer_id=${snapshot.data!.offerId}&lang=${_appState!.currentLang}');

                                                                                        _progressIndicatorState!.setIsLoading(false);
                                                                                        if (results['response'] == '1') {
                                                                                          showToast(context,message: results['message']);

                                                                                          setState(() {
                                                                                            _orderDetails = _getOrderDetails();
                                                                                            _offerDetails = _getOfferDetails();
                                                                                          });
                                                                                        } else {
                                                                                          showErrorDialog(results['message'], context);
                                                                                        }
                                                                                      },
                                                                                      child: Text(AppLocalizations.of(context)!.ok, style: TextStyle(fontSize: 14, fontFamily: 'segoeui', color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500)))
                                                                                ],
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    });
                                                              },
                                                            )
                                                          : (snapshot.data!
                                                                      .requestPrice1Offer1Act ==
                                                                  1
                                                              ? Icon(
                                                                  Icons
                                                                      .check_circle,
                                                                  color: Colors
                                                                      .green,
                                                                )
                                                              : Icon(
                                                                  Icons.cancel,
                                                                  color: Colors
                                                                      .red,
                                                                )),
                                                    )
                                                  ],
                                                )
                                              : Text(
                                                  "",
                                                  style: TextStyle(height: 0),
                                                ),
                                          SizedBox(
                                            height: _width * .02,
                                          ),
                                          snapshot.data!.requestPrice1Offer2 != 0
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text(snapshot.data!
                                                        .requestPrice1Label2
                                                        .toString()),
                                                    Text(" سعر " +
                                                        snapshot.data!
                                                            .requestPrice1Offer2
                                                            .toString() +
                                                        " ريال "),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: snapshot.data!
                                                                  .requestPrice1Offer2Act ==
                                                              0
                                                          ? GestureDetector(
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                width: _width *
                                                                    .20,
                                                                child: Text(
                                                                  "قبول",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                color: Colors
                                                                    .green,
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: 10,
                                                                        bottom:
                                                                            10,
                                                                        right:
                                                                            14,
                                                                        left:
                                                                            14),
                                                              ),
                                                              onTap: () {
                                                                showDialog(
                                                                    barrierDismissible:
                                                                        true,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (_) {
                                                                      return AlertDialog(
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.all(Radius.circular(10.0))),
                                                                        content:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            children: <Widget>[
                                                                              Text(
                                                                                "هل تريد بالفعل  قبول عرض السعر ؟",
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(fontSize: 15, height: 1.5, fontFamily: 'segoeui'),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              Divider(
                                                                                height: 2,
                                                                                color: Color(0xff707070),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: <Widget>[
                                                                                  GestureDetector(
                                                                                      onTap: () {
                                                                                        Navigator.pop(context);
                                                                                      },
                                                                                      child: Text(AppLocalizations.of(context)!.cancel, style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor, fontFamily: 'segoeui', fontWeight: FontWeight.w500))),
                                                                                  Container(
                                                                                    width: 1,
                                                                                    height: 30,
                                                                                    color: Colors.black,
                                                                                  ),
                                                                                  GestureDetector(
                                                                                      onTap: () async {
                                                                                        print("Sssssssssssss");

                                                                                        Navigator.pop(context);

                                                                                        _progressIndicatorState!.setIsLoading(true);
                                                                                        var results = await _services.get('https://qtaapp.com/api/acceptRequest?lang=ar&type=requestPrice1Offer2Act&offer_id=${snapshot.data!.offerId}&lang=${_appState!.currentLang}');
                                                                                        _progressIndicatorState!.setIsLoading(false);
                                                                                        if (results['response'] == '1') {
                                                                                          showToast(context,message: results['message']);

                                                                                          setState(() {
                                                                                            _orderDetails = _getOrderDetails();
                                                                                            _offerDetails = _getOfferDetails();
                                                                                          });
                                                                                        } else {
                                                                                          showErrorDialog(results['message'], context);
                                                                                        }
                                                                                      },
                                                                                      child: Text(AppLocalizations.of(context)!.ok, style: TextStyle(fontSize: 14, fontFamily: 'segoeui', color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500)))
                                                                                ],
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    });
                                                              },
                                                            )
                                                          : (snapshot.data!
                                                                      .requestPrice1Offer2Act ==
                                                                  1
                                                              ? Icon(
                                                                  Icons
                                                                      .check_circle,
                                                                  color: Colors
                                                                      .green,
                                                                )
                                                              : Icon(
                                                                  Icons.cancel,
                                                                  color: Colors
                                                                      .red,
                                                                )),
                                                    )
                                                  ],
                                                )
                                              : Text(
                                                  "",
                                                  style: TextStyle(height: 0),
                                                ),
                                          SizedBox(
                                            height: _width * .02,
                                          ),
                                          snapshot.data!.requestPrice1Offer3 != 0
                                              ? Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text(snapshot.data!
                                                        .requestPrice1Label3
                                                        .toString()),
                                                    Text(" سعر " +
                                                        snapshot.data!
                                                            .requestPrice1Offer3
                                                            .toString() +
                                                        " ريال "),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      child: snapshot.data!
                                                                  .requestPrice1Offer3Act ==
                                                              0
                                                          ? GestureDetector(
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                width: _width *
                                                                    .20,
                                                                child: Text(
                                                                  "قبول",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                                color: Colors
                                                                    .green,
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: 10,
                                                                        bottom:
                                                                            10,
                                                                        right:
                                                                            14,
                                                                        left:
                                                                            14),
                                                              ),
                                                              onTap: () {
                                                                showDialog(
                                                                    barrierDismissible:
                                                                        true,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (_) {
                                                                      return AlertDialog(
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.all(Radius.circular(10.0))),
                                                                        content:
                                                                            SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            children: <Widget>[
                                                                              Text(
                                                                                "هل تريد بالفعل  قبول عرض السعر ؟",
                                                                                textAlign: TextAlign.center,
                                                                                style: TextStyle(fontSize: 15, height: 1.5, fontFamily: 'segoeui'),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              Divider(
                                                                                height: 2,
                                                                                color: Color(0xff707070),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 10,
                                                                              ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: <Widget>[
                                                                                  GestureDetector(
                                                                                      onTap: () {
                                                                                        Navigator.pop(context);
                                                                                      },
                                                                                      child: Text(AppLocalizations.of(context)!.cancel, style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor, fontFamily: 'segoeui', fontWeight: FontWeight.w500))),
                                                                                  Container(
                                                                                    width: 1,
                                                                                    height: 30,
                                                                                    color: Colors.black,
                                                                                  ),
                                                                                  GestureDetector(
                                                                                      onTap: () async {
                                                                                        print("Sssssssssssss");

                                                                                        Navigator.pop(context);

                                                                                        _progressIndicatorState!.setIsLoading(true);
                                                                                        var results = await _services.get('https://qtaapp.com/api/acceptRequest?lang=ar&type=requestPrice1Offer3Act&offer_id=${snapshot.data!.offerId}&lang=${_appState!.currentLang}');
                                                                                        _progressIndicatorState!.setIsLoading(false);
                                                                                        if (results['response'] == '1') {
                                                                                          showToast(context,message: results['message']);

                                                                                          setState(() {
                                                                                            _orderDetails = _getOrderDetails();
                                                                                            _offerDetails = _getOfferDetails();
                                                                                          });
                                                                                        } else {
                                                                                          showErrorDialog(results['message'], context);
                                                                                        }
                                                                                      },
                                                                                      child: Text(AppLocalizations.of(context)!.ok, style: TextStyle(fontSize: 14, fontFamily: 'segoeui', color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500)))
                                                                                ],
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      );
                                                                    });
                                                              },
                                                            )
                                                          : (snapshot.data!
                                                                      .requestPrice1Offer3Act ==
                                                                  1
                                                              ? Icon(
                                                                  Icons
                                                                      .check_circle,
                                                                  color: Colors
                                                                      .green,
                                                                )
                                                              : Icon(
                                                                  Icons.cancel,
                                                                  color: Colors
                                                                      .red,
                                                                )),
                                                    )
                                                  ],
                                                )
                                              : Text(
                                                  "",
                                                  style: TextStyle(height: 0),
                                                ),
                                        ],
                                      ),

                                order.carttNumber == "2" ||
                                        order.carttNumber == "3"
                                    ? SizedBox(
                                        height: _width * .04,
                                      )
                                    : Text(
                                        "",
                                        style: TextStyle(height: 0),
                                      ),
                                order.carttNumber == "2" ||
                                        order.carttNumber == "3"
                                    ? Text(
                                        "القطعة 2",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        "",
                                        style: TextStyle(height: 0),
                                      ),
                                order.carttNumber == "2" ||
                                        order.carttNumber == "3"
                                    ? SizedBox(
                                        height: _width * .02,
                                      )
                                    : Text(
                                        "",
                                        style: TextStyle(height: 0),
                                      ),
                                order.carttNumber == "2" ||
                                        order.carttNumber == "3"
                                    ? snapshot.data!.offerType == 0
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(snapshot.data!.requestLabel2
                                                  .toString()),
                                              Text(" سعر " +
                                                  snapshot.data!.requestPrice2
                                                      .toString() +
                                                  " ريال "),
                                              Container(
                                                alignment: Alignment.center,
                                                child: snapshot.data!
                                                            .requestPrice2Act ==
                                                        0
                                                    ? GestureDetector(
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: _width * .20,
                                                          child: Text(
                                                            "قبول",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          color: Colors.green,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 10,
                                                                  bottom: 10,
                                                                  right: 14,
                                                                  left: 14),
                                                        ),
                                                        onTap: () {
                                                          showDialog(
                                                              barrierDismissible:
                                                                  true,
                                                              context: context,
                                                              builder: (_) {
                                                                return AlertDialog(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(10.0))),
                                                                  content:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      children: <
                                                                          Widget>[
                                                                        Text(
                                                                          "هل تريد بالفعل  قبول عرض السعر ؟",
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                              fontSize: 15,
                                                                              height: 1.5,
                                                                              fontFamily: 'segoeui'),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Divider(
                                                                          height:
                                                                              2,
                                                                          color:
                                                                              Color(0xff707070),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: <
                                                                              Widget>[
                                                                            GestureDetector(
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Text(AppLocalizations.of(context)!.cancel, style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor, fontFamily: 'segoeui', fontWeight: FontWeight.w500))),
                                                                            Container(
                                                                              width: 1,
                                                                              height: 30,
                                                                              color: Colors.black,
                                                                            ),
                                                                            GestureDetector(
                                                                                onTap: () async {
                                                                                  print("Sssssssssssss");

                                                                                  Navigator.pop(context);

                                                                                  _progressIndicatorState!.setIsLoading(true);
                                                                                  var results = await _services.get('https://qtaapp.com/api/acceptRequest?lang=ar&type=requestPrice2Act&offer_id=${snapshot.data!.offerId}&lang=${_appState!.currentLang}');
                                                                                  _progressIndicatorState!.setIsLoading(false);
                                                                                  if (results['response'] == '1') {
                                                                                    showToast(context,message: results['message']);

                                                                                    setState(() {
                                                                                      _orderDetails = _getOrderDetails();
                                                                                      _offerDetails = _getOfferDetails();
                                                                                    });
                                                                                  } else {
                                                                                    showErrorDialog(results['message'], context);
                                                                                  }
                                                                                },
                                                                                child: Text(AppLocalizations.of(context)!.ok, style: TextStyle(fontSize: 14, fontFamily: 'segoeui', color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500)))
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              });
                                                        },
                                                      )
                                                    : (snapshot.data!
                                                                .requestPrice2Act ==
                                                            1
                                                        ? Icon(
                                                            Icons.check_circle,
                                                            color: Colors.green,
                                                          )
                                                        : Icon(
                                                            Icons.cancel,
                                                            color: Colors.red,
                                                          )),
                                              )
                                            ],
                                          )
                                        : Column(
                                            children: <Widget>[
                                              snapshot.data!
                                                          .requestPrice2Offer1 !=
                                                      0
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Text(snapshot.data!
                                                            .requestPrice2Label1
                                                            .toString()),
                                                        Text(" سعر " +
                                                            snapshot.data!
                                                                .requestPrice2Offer1
                                                                .toString() +
                                                            " ريال "),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: snapshot.data!
                                                                      .requestPrice2Offer1Act ==
                                                                  0
                                                              ? GestureDetector(
                                                                  child:
                                                                      Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    width:
                                                                        _width *
                                                                            .20,
                                                                    child: Text(
                                                                      "قبول",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    color: Colors
                                                                        .green,
                                                                    padding: EdgeInsets.only(
                                                                        top: 10,
                                                                        bottom:
                                                                            10,
                                                                        right:
                                                                            14,
                                                                        left:
                                                                            14),
                                                                  ),
                                                                  onTap: () {
                                                                    showDialog(
                                                                        barrierDismissible:
                                                                            true,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (_) {
                                                                          return AlertDialog(
                                                                            shape:
                                                                                RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                                            content:
                                                                                SingleChildScrollView(
                                                                              child: Column(
                                                                                children: <Widget>[
                                                                                  Text(
                                                                                    "هل تريد بالفعل  قبول عرض السعر ؟",
                                                                                    textAlign: TextAlign.center,
                                                                                    style: TextStyle(fontSize: 15, height: 1.5, fontFamily: 'segoeui'),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  Divider(
                                                                                    height: 2,
                                                                                    color: Color(0xff707070),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: <Widget>[
                                                                                      GestureDetector(
                                                                                          onTap: () {
                                                                                            Navigator.pop(context);
                                                                                          },
                                                                                          child: Text(AppLocalizations.of(context)!.cancel, style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor, fontFamily: 'segoeui', fontWeight: FontWeight.w500))),
                                                                                      Container(
                                                                                        width: 1,
                                                                                        height: 30,
                                                                                        color: Colors.black,
                                                                                      ),
                                                                                      GestureDetector(
                                                                                          onTap: () async {
                                                                                            print("Sssssssssssss");

                                                                                            Navigator.pop(context);

                                                                                            _progressIndicatorState!.setIsLoading(true);
                                                                                            var results = await _services.get('https://qtaapp.com/api/acceptRequest?lang=ar&type=requestPrice2Offer1Act&offer_id=${snapshot.data!.offerId}&lang=${_appState!.currentLang}');
                                                                                            _progressIndicatorState!.setIsLoading(false);
                                                                                            if (results['response'] == '1') {
                                                                                              showToast(context,message: results['message']);

                                                                                              setState(() {
                                                                                                _orderDetails = _getOrderDetails();
                                                                                                _offerDetails = _getOfferDetails();
                                                                                              });
                                                                                            } else {
                                                                                              showErrorDialog(results['message'], context);
                                                                                            }
                                                                                          },
                                                                                          child: Text(AppLocalizations.of(context)!.ok, style: TextStyle(fontSize: 14, fontFamily: 'segoeui', color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500)))
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          );
                                                                        });
                                                                  },
                                                                )
                                                              : (snapshot.data!
                                                                          .requestPrice2Offer1Act ==
                                                                      1
                                                                  ? Icon(
                                                                      Icons
                                                                          .check_circle,
                                                                      color: Colors
                                                                          .green,
                                                                    )
                                                                  : Icon(
                                                                      Icons
                                                                          .cancel,
                                                                      color: Colors
                                                                          .red,
                                                                    )),
                                                        )
                                                      ],
                                                    )
                                                  : Text(
                                                      "",
                                                      style:
                                                          TextStyle(height: 0),
                                                    ),
                                              snapshot.data!
                                                          .requestPrice2Offer2 !=
                                                      0
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Text(snapshot.data!
                                                            .requestPrice2Label2
                                                            .toString()),
                                                        Text(" سعر " +
                                                            snapshot.data!
                                                                .requestPrice2Offer2
                                                                .toString() +
                                                            " ريال "),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: snapshot.data!
                                                                      .requestPrice2Offer2Act ==
                                                                  0
                                                              ? GestureDetector(
                                                                  child:
                                                                      Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    width:
                                                                        _width *
                                                                            .20,
                                                                    child: Text(
                                                                      "قبول",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    color: Colors
                                                                        .green,
                                                                    padding: EdgeInsets.only(
                                                                        top: 10,
                                                                        bottom:
                                                                            10,
                                                                        right:
                                                                            14,
                                                                        left:
                                                                            14),
                                                                  ),
                                                                  onTap: () {
                                                                    showDialog(
                                                                        barrierDismissible:
                                                                            true,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (_) {
                                                                          return AlertDialog(
                                                                            shape:
                                                                                RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                                            content:
                                                                                SingleChildScrollView(
                                                                              child: Column(
                                                                                children: <Widget>[
                                                                                  Text(
                                                                                    "هل تريد بالفعل  قبول عرض السعر ؟",
                                                                                    textAlign: TextAlign.center,
                                                                                    style: TextStyle(fontSize: 15, height: 1.5, fontFamily: 'segoeui'),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  Divider(
                                                                                    height: 2,
                                                                                    color: Color(0xff707070),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: <Widget>[
                                                                                      GestureDetector(
                                                                                          onTap: () {
                                                                                            Navigator.pop(context);
                                                                                          },
                                                                                          child: Text(AppLocalizations.of(context)!.cancel, style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor, fontFamily: 'segoeui', fontWeight: FontWeight.w500))),
                                                                                      Container(
                                                                                        width: 1,
                                                                                        height: 30,
                                                                                        color: Colors.black,
                                                                                      ),
                                                                                      GestureDetector(
                                                                                          onTap: () async {
                                                                                            print("Sssssssssssss");

                                                                                            Navigator.pop(context);

                                                                                            _progressIndicatorState!.setIsLoading(true);
                                                                                            var results = await _services.get('https://qtaapp.com/api/acceptRequest?lang=ar&type=requestPrice2Offer2Act&offer_id=${snapshot.data!.offerId}&lang=${_appState!.currentLang}');
                                                                                            _progressIndicatorState!.setIsLoading(false);
                                                                                            if (results['response'] == '1') {
                                                                                              showToast(context,message: results['message']);

                                                                                              setState(() {
                                                                                                _orderDetails = _getOrderDetails();
                                                                                                _offerDetails = _getOfferDetails();
                                                                                              });
                                                                                            } else {
                                                                                              showErrorDialog(results['message'], context);
                                                                                            }
                                                                                          },
                                                                                          child: Text(AppLocalizations.of(context)!.ok, style: TextStyle(fontSize: 14, fontFamily: 'segoeui', color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500)))
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          );
                                                                        });
                                                                  },
                                                                )
                                                              : (snapshot.data!
                                                                          .requestPrice2Offer2Act ==
                                                                      1
                                                                  ? Icon(
                                                                      Icons
                                                                          .check_circle,
                                                                      color: Colors
                                                                          .green,
                                                                    )
                                                                  : Icon(
                                                                      Icons
                                                                          .cancel,
                                                                      color: Colors
                                                                          .red,
                                                                    )),
                                                        )
                                                      ],
                                                    )
                                                  : Text(
                                                      "",
                                                      style:
                                                          TextStyle(height: 0),
                                                    ),
                                              snapshot.data!
                                                          .requestPrice2Offer3 !=
                                                      0
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Text(snapshot.data!
                                                            .requestPrice2Label3
                                                            .toString()),
                                                        Text(" سعر " +
                                                            snapshot.data!
                                                                .requestPrice2Offer3
                                                                .toString() +
                                                            " ريال "),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: snapshot.data!
                                                                      .requestPrice2Offer3Act ==
                                                                  0
                                                              ? GestureDetector(
                                                                  child:
                                                                      Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    width:
                                                                        _width *
                                                                            .20,
                                                                    child: Text(
                                                                      "قبول",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    color: Colors
                                                                        .green,
                                                                    padding: EdgeInsets.only(
                                                                        top: 10,
                                                                        bottom:
                                                                            10,
                                                                        right:
                                                                            14,
                                                                        left:
                                                                            14),
                                                                  ),
                                                                  onTap: () {
                                                                    showDialog(
                                                                        barrierDismissible:
                                                                            true,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (_) {
                                                                          return AlertDialog(
                                                                            shape:
                                                                                RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                                            content:
                                                                                SingleChildScrollView(
                                                                              child: Column(
                                                                                children: <Widget>[
                                                                                  Text(
                                                                                    "هل تريد بالفعل  قبول عرض السعر ؟",
                                                                                    textAlign: TextAlign.center,
                                                                                    style: TextStyle(fontSize: 15, height: 1.5, fontFamily: 'segoeui'),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  Divider(
                                                                                    height: 2,
                                                                                    color: Color(0xff707070),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: <Widget>[
                                                                                      GestureDetector(
                                                                                          onTap: () {
                                                                                            Navigator.pop(context);
                                                                                          },
                                                                                          child: Text(AppLocalizations.of(context)!.cancel, style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor, fontFamily: 'segoeui', fontWeight: FontWeight.w500))),
                                                                                      Container(
                                                                                        width: 1,
                                                                                        height: 30,
                                                                                        color: Colors.black,
                                                                                      ),
                                                                                      GestureDetector(
                                                                                          onTap: () async {
                                                                                            print("Sssssssssssss");

                                                                                            Navigator.pop(context);

                                                                                            _progressIndicatorState!.setIsLoading(true);
                                                                                            var results = await _services.get('https://qtaapp.com/api/acceptRequest?lang=ar&type=requestPrice2Offer3Act&offer_id=${snapshot.data!.offerId}&lang=${_appState!.currentLang}');
                                                                                            _progressIndicatorState!.setIsLoading(false);
                                                                                            if (results['response'] == '1') {
                                                                                              showToast(context,message: results['message']);

                                                                                              setState(() {
                                                                                                _orderDetails = _getOrderDetails();
                                                                                                _offerDetails = _getOfferDetails();
                                                                                              });
                                                                                            } else {
                                                                                              showErrorDialog(results['message'], context);
                                                                                            }
                                                                                          },
                                                                                          child: Text(AppLocalizations.of(context)!.ok, style: TextStyle(fontSize: 14, fontFamily: 'segoeui', color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500)))
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          );
                                                                        });
                                                                  },
                                                                )
                                                              : (snapshot.data!
                                                                          .requestPrice2Offer3Act ==
                                                                      1
                                                                  ? Icon(
                                                                      Icons
                                                                          .check_circle,
                                                                      color: Colors
                                                                          .green,
                                                                    )
                                                                  : Icon(
                                                                      Icons
                                                                          .cancel,
                                                                      color: Colors
                                                                          .red,
                                                                    )),
                                                        )
                                                      ],
                                                    )
                                                  : Text(
                                                      "",
                                                      style:
                                                          TextStyle(height: 0),
                                                    ),
                                            ],
                                          )
                                    : Text(
                                        "",
                                        style: TextStyle(height: 0),
                                      ),

                                order.carttNumber == "3"
                                    ? SizedBox(
                                        height: _width * .04,
                                      )
                                    : Text(
                                        "",
                                        style: TextStyle(height: 0),
                                      ),
                                order.carttNumber == "3"
                                    ? Text(
                                        "القطعة 3",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    : Text(
                                        "",
                                        style: TextStyle(height: 0),
                                      ),
                                order.carttNumber == "3"
                                    ? SizedBox(
                                        height: _width * .02,
                                      )
                                    : Text(
                                        "",
                                        style: TextStyle(height: 0),
                                      ),
                                order.carttNumber == "3"
                                    ? snapshot.data!.offerType == 0
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(snapshot.data!.requestLabel3
                                                  .toString()),
                                              Text(" سعر " +
                                                  snapshot.data!.requestPrice3
                                                      .toString() +
                                                  " ريال "),
                                              Container(
                                                alignment: Alignment.center,
                                                child: snapshot.data!
                                                            .requestPrice3Act ==
                                                        0
                                                    ? GestureDetector(
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          width: _width * .20,
                                                          child: Text(
                                                            "قبول",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          color: Colors.green,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 10,
                                                                  bottom: 10,
                                                                  right: 14,
                                                                  left: 14),
                                                        ),
                                                        onTap: () {
                                                          showDialog(
                                                              barrierDismissible:
                                                                  true,
                                                              context: context,
                                                              builder: (_) {
                                                                return AlertDialog(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(10.0))),
                                                                  content:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      children: <
                                                                          Widget>[
                                                                        Text(
                                                                          "هل تريد بالفعل  قبول عرض السعر ؟",
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                              fontSize: 15,
                                                                              height: 1.5,
                                                                              fontFamily: 'segoeui'),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Divider(
                                                                          height:
                                                                              2,
                                                                          color:
                                                                              Color(0xff707070),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              10,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: <
                                                                              Widget>[
                                                                            GestureDetector(
                                                                                onTap: () {
                                                                                  Navigator.pop(context);
                                                                                },
                                                                                child: Text(AppLocalizations.of(context)!.cancel, style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor, fontFamily: 'segoeui', fontWeight: FontWeight.w500))),
                                                                            Container(
                                                                              width: 1,
                                                                              height: 30,
                                                                              color: Colors.black,
                                                                            ),
                                                                            GestureDetector(
                                                                                onTap: () async {
                                                                                  print("Sssssssssssss");

                                                                                  Navigator.pop(context);

                                                                                  _progressIndicatorState!.setIsLoading(true);
                                                                                  var results = await _services.get('https://qtaapp.com/api/acceptRequest?lang=ar&type=requestPrice3Act&offer_id=${snapshot.data!.offerId}&lang=${_appState!.currentLang}');
                                                                                  _progressIndicatorState!.setIsLoading(false);
                                                                                  if (results['response'] == '1') {
                                                                                    showToast(context,message: results['message']);

                                                                                    setState(() {
                                                                                      _orderDetails = _getOrderDetails();
                                                                                      _offerDetails = _getOfferDetails();
                                                                                    });
                                                                                  } else {
                                                                                    showErrorDialog(results['message'], context);
                                                                                  }
                                                                                },
                                                                                child: Text(AppLocalizations.of(context)!.ok, style: TextStyle(fontSize: 14, fontFamily: 'segoeui', color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500)))
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                );
                                                              });
                                                        },
                                                      )
                                                    : (snapshot.data!
                                                                .requestPrice3Act ==
                                                            1
                                                        ? Icon(
                                                            Icons.check_circle,
                                                            color: Colors.green,
                                                          )
                                                        : Icon(
                                                            Icons.cancel,
                                                            color: Colors.red,
                                                          )),
                                              )
                                            ],
                                          )
                                        : Column(
                                            children: <Widget>[
                                              snapshot.data!
                                                          .requestPrice3Offer1 !=
                                                      0
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Text(snapshot.data!
                                                            .requestPrice3Label1
                                                            .toString()),
                                                        Text(" سعر " +
                                                            snapshot.data!
                                                                .requestPrice3Offer1
                                                                .toString() +
                                                            " ريال "),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: snapshot.data!
                                                                      .requestPrice3Offer1Act ==
                                                                  0
                                                              ? GestureDetector(
                                                                  child:
                                                                      Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    width:
                                                                        _width *
                                                                            .20,
                                                                    child: Text(
                                                                      "قبول",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    color: Colors
                                                                        .green,
                                                                    padding: EdgeInsets.only(
                                                                        top: 10,
                                                                        bottom:
                                                                            10,
                                                                        right:
                                                                            14,
                                                                        left:
                                                                            14),
                                                                  ),
                                                                  onTap: () {
                                                                    showDialog(
                                                                        barrierDismissible:
                                                                            true,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (_) {
                                                                          return AlertDialog(
                                                                            shape:
                                                                                RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                                            content:
                                                                                SingleChildScrollView(
                                                                              child: Column(
                                                                                children: <Widget>[
                                                                                  Text(
                                                                                    "هل تريد بالفعل  قبول عرض السعر ؟",
                                                                                    textAlign: TextAlign.center,
                                                                                    style: TextStyle(fontSize: 15, height: 1.5, fontFamily: 'segoeui'),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  Divider(
                                                                                    height: 2,
                                                                                    color: Color(0xff707070),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: <Widget>[
                                                                                      GestureDetector(
                                                                                          onTap: () {
                                                                                            Navigator.pop(context);
                                                                                          },
                                                                                          child: Text(AppLocalizations.of(context)!.cancel, style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor, fontFamily: 'segoeui', fontWeight: FontWeight.w500))),
                                                                                      Container(
                                                                                        width: 1,
                                                                                        height: 30,
                                                                                        color: Colors.black,
                                                                                      ),
                                                                                      GestureDetector(
                                                                                          onTap: () async {
                                                                                            print("Sssssssssssss");

                                                                                            Navigator.pop(context);

                                                                                            _progressIndicatorState!.setIsLoading(true);
                                                                                            var results = await _services.get('https://qtaapp.com/api/acceptRequest?lang=ar&type=requestPrice3Offer1Act&offer_id=${snapshot.data!.offerId}&lang=${_appState!.currentLang}');
                                                                                            _progressIndicatorState!.setIsLoading(false);
                                                                                            if (results['response'] == '1') {
                                                                                              showToast(context,message: results['message']);

                                                                                              setState(() {
                                                                                                _orderDetails = _getOrderDetails();
                                                                                                _offerDetails = _getOfferDetails();
                                                                                              });
                                                                                            } else {
                                                                                              showErrorDialog(results['message'], context);
                                                                                            }
                                                                                          },
                                                                                          child: Text(AppLocalizations.of(context)!.ok, style: TextStyle(fontSize: 14, fontFamily: 'segoeui', color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500)))
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          );
                                                                        });
                                                                  },
                                                                )
                                                              : (snapshot.data!
                                                                          .requestPrice3Offer1Act ==
                                                                      1
                                                                  ? Icon(
                                                                      Icons
                                                                          .check_circle,
                                                                      color: Colors
                                                                          .green,
                                                                    )
                                                                  : Icon(
                                                                      Icons
                                                                          .cancel,
                                                                      color: Colors
                                                                          .red,
                                                                    )),
                                                        )
                                                      ],
                                                    )
                                                  : Text(
                                                      "",
                                                      style:
                                                          TextStyle(height: 0),
                                                    ),
                                              snapshot.data!
                                                          .requestPrice3Offer2 !=
                                                      0
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Text(snapshot.data!
                                                            .requestPrice3Label2
                                                            .toString()),
                                                        Text(" سعر " +
                                                            snapshot.data!
                                                                .requestPrice3Offer2
                                                                .toString() +
                                                            " ريال "),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: snapshot.data!
                                                                      .requestPrice3Offer2Act ==
                                                                  0
                                                              ? GestureDetector(
                                                                  child:
                                                                      Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    width:
                                                                        _width *
                                                                            .20,
                                                                    child: Text(
                                                                      "قبول",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    color: Colors
                                                                        .green,
                                                                    padding: EdgeInsets.only(
                                                                        top: 10,
                                                                        bottom:
                                                                            10,
                                                                        right:
                                                                            14,
                                                                        left:
                                                                            14),
                                                                  ),
                                                                  onTap: () {
                                                                    showDialog(
                                                                        barrierDismissible:
                                                                            true,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (_) {
                                                                          return AlertDialog(
                                                                            shape:
                                                                                RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                                            content:
                                                                                SingleChildScrollView(
                                                                              child: Column(
                                                                                children: <Widget>[
                                                                                  Text(
                                                                                    "هل تريد بالفعل  قبول عرض السعر ؟",
                                                                                    textAlign: TextAlign.center,
                                                                                    style: TextStyle(fontSize: 15, height: 1.5, fontFamily: 'segoeui'),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  Divider(
                                                                                    height: 2,
                                                                                    color: Color(0xff707070),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: <Widget>[
                                                                                      GestureDetector(
                                                                                          onTap: () {
                                                                                            Navigator.pop(context);
                                                                                          },
                                                                                          child: Text(AppLocalizations.of(context)!.cancel, style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor, fontFamily: 'segoeui', fontWeight: FontWeight.w500))),
                                                                                      Container(
                                                                                        width: 1,
                                                                                        height: 30,
                                                                                        color: Colors.black,
                                                                                      ),
                                                                                      GestureDetector(
                                                                                          onTap: () async {
                                                                                            print("Sssssssssssss");

                                                                                            Navigator.pop(context);

                                                                                            _progressIndicatorState!.setIsLoading(true);
                                                                                            var results = await _services.get('https://qtaapp.com/api/acceptRequest?lang=ar&type=requestPrice3Offer2Act&offer_id=${snapshot.data!.offerId}&lang=${_appState!.currentLang}');
                                                                                            _progressIndicatorState!.setIsLoading(false);
                                                                                            if (results['response'] == '1') {
                                                                                              showToast(context,message: results['message']);

                                                                                              setState(() {
                                                                                                _orderDetails = _getOrderDetails();
                                                                                                _offerDetails = _getOfferDetails();
                                                                                              });
                                                                                            } else {
                                                                                              showErrorDialog(results['message'], context);
                                                                                            }
                                                                                          },
                                                                                          child: Text(AppLocalizations.of(context)!.ok, style: TextStyle(fontSize: 14, fontFamily: 'segoeui', color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500)))
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          );
                                                                        });
                                                                  },
                                                                )
                                                              : (snapshot.data!
                                                                          .requestPrice3Offer2Act ==
                                                                      1
                                                                  ? Icon(
                                                                      Icons
                                                                          .check_circle,
                                                                      color: Colors
                                                                          .green,
                                                                    )
                                                                  : Icon(
                                                                      Icons
                                                                          .cancel,
                                                                      color: Colors
                                                                          .red,
                                                                    )),
                                                        )
                                                      ],
                                                    )
                                                  : Text(
                                                      "",
                                                      style:
                                                          TextStyle(height: 0),
                                                    ),
                                              snapshot.data!
                                                          .requestPrice3Offer3 !=
                                                      0
                                                  ? Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Text(snapshot.data!
                                                            .requestPrice3Label3
                                                            .toString()),
                                                        Text(" سعر " +
                                                            snapshot.data!
                                                                .requestPrice3Offer3
                                                                .toString() +
                                                            " ريال "),
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: snapshot.data!
                                                                      .requestPrice3Offer3Act ==
                                                                  0
                                                              ? GestureDetector(
                                                                  child:
                                                                      Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    width:
                                                                        _width *
                                                                            .20,
                                                                    child: Text(
                                                                      "قبول",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    color: Colors
                                                                        .green,
                                                                    padding: EdgeInsets.only(
                                                                        top: 10,
                                                                        bottom:
                                                                            10,
                                                                        right:
                                                                            14,
                                                                        left:
                                                                            14),
                                                                  ),
                                                                  onTap: () {
                                                                    showDialog(
                                                                        barrierDismissible:
                                                                            true,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (_) {
                                                                          return AlertDialog(
                                                                            shape:
                                                                                RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                                            content:
                                                                                SingleChildScrollView(
                                                                              child: Column(
                                                                                children: <Widget>[
                                                                                  Text(
                                                                                    "هل تريد بالفعل  قبول عرض السعر ؟",
                                                                                    textAlign: TextAlign.center,
                                                                                    style: TextStyle(fontSize: 15, height: 1.5, fontFamily: 'segoeui'),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  Divider(
                                                                                    height: 2,
                                                                                    color: Color(0xff707070),
                                                                                  ),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: <Widget>[
                                                                                      GestureDetector(
                                                                                          onTap: () {
                                                                                            Navigator.pop(context);
                                                                                          },
                                                                                          child: Text(AppLocalizations.of(context)!.cancel, style: TextStyle(fontSize: 14, color: Theme.of(context).primaryColor, fontFamily: 'segoeui', fontWeight: FontWeight.w500))),
                                                                                      Container(
                                                                                        width: 1,
                                                                                        height: 30,
                                                                                        color: Colors.black,
                                                                                      ),
                                                                                      GestureDetector(
                                                                                          onTap: () async {
                                                                                            print("Sssssssssssss");

                                                                                            Navigator.pop(context);

                                                                                            _progressIndicatorState!.setIsLoading(true);
                                                                                            var results = await _services.get('https://qtaapp.com/api/acceptRequest?lang=ar&type=requestPrice3Offer3Act&offer_id=${snapshot.data!.offerId}&lang=${_appState!.currentLang}');
                                                                                            _progressIndicatorState!.setIsLoading(false);
                                                                                            if (results['response'] == '1') {
                                                                                              showToast(context,message: results['message']);

                                                                                              setState(() {
                                                                                                _orderDetails = _getOrderDetails();
                                                                                                _offerDetails = _getOfferDetails();
                                                                                              });
                                                                                            } else {
                                                                                              showErrorDialog(results['message'], context);
                                                                                            }
                                                                                          },
                                                                                          child: Text(AppLocalizations.of(context)!.ok, style: TextStyle(fontSize: 14, fontFamily: 'segoeui', color: Theme.of(context).primaryColor, fontWeight: FontWeight.w500)))
                                                                                    ],
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          );
                                                                        });
                                                                  },
                                                                )
                                                              : (snapshot.data!
                                                                          .requestPrice3Offer3Act ==
                                                                      1
                                                                  ? Icon(
                                                                      Icons
                                                                          .check_circle,
                                                                      color: Colors
                                                                          .green,
                                                                    )
                                                                  : Icon(
                                                                      Icons
                                                                          .cancel,
                                                                      color: Colors
                                                                          .red,
                                                                    )),
                                                        )
                                                      ],
                                                    )
                                                  : Text(
                                                      "",
                                                      style:
                                                          TextStyle(height: 0),
                                                    ),
                                            ],
                                          )
                                    : Text(
                                        "",
                                        style: TextStyle(height: 0),
                                      ),

                                // زرار تاكيد قبول السعر للكل

                                SizedBox(
                                  height: 30,
                                ),

                                GestureDetector(
                                  child: Center(
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: _width,
                                      child: Text(
                                        "تأكيد قبول الاسعار",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      color: cLightLemon,
                                      padding: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          right: 14,
                                          left: 14),
                                    ),
                                  ),
                                  onTap: () {
                                    showDialog(
                                        barrierDismissible: true,
                                        context: context,
                                        builder: (_) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0))),
                                            content: SingleChildScrollView(
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    "هل تريد بالفعل تاكيد قبول الاسعار لجميع القطع ؟",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        height: 1.5,
                                                        fontFamily: 'segoeui'),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Divider(
                                                    height: 2,
                                                    color: Color(0xff707070),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      GestureDetector(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                              AppLocalizations
                                                                      .of(
                                                                          context)!
                                                                  .cancel,
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  fontFamily:
                                                                      'segoeui',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500))),
                                                      Container(
                                                        width: 1,
                                                        height: 30,
                                                        color: Colors.black,
                                                      ),
                                                      GestureDetector(
                                                          onTap: () async {
                                                            Navigator.pop(
                                                                context);
                                                            _progressIndicatorState!
                                                                .setIsLoading(
                                                                    true);
                                                            var results =
                                                                await _services.get(
                                                                    'https://qtaapp.com/api/acceptOffer?cartt_id=${snapshot.data!.offerCartt}&offer_id=${snapshot.data!.offerId}&lang=${_appState!.currentLang}');
                                                            _progressIndicatorState!
                                                                .setIsLoading(
                                                                    false);
                                                            if (results[
                                                                    'response'] ==
                                                                '1') {
                                                              showToast(context,message:
                                                              results[
                                                                      'message']
                                                                  );

                                                              setState(() {
                                                                _orderDetails =
                                                                    _getOrderDetails();
                                                                _offerDetails =
                                                                    _getOfferDetails();
                                                              });
                                                            } else {
                                                              showErrorDialog(
                                                                  results[
                                                                      'message'],
                                                                  context);
                                                            }
                                                          },
                                                          child: Text(
                                                              AppLocalizations.of(
                                                                      context)!
                                                                  .ok,
                                                              style: TextStyle(
                                                                  fontSize: 14,
                                                                  fontFamily:
                                                                      'segoeui',
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)))
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                )
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
                  )
                : Text(
                    "",
                    style: TextStyle(height: 0),
                  ),

            order.carttDone == 4 && order.carttPay == 0
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
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    context: context,
                                    builder: (builder) {
                                      return Container(
                                        height: _height * 0.35,
                                        width: _width,
                                        child: CancelOrderBottomSheet(
                                          onPressedConfirmation: () async {
                                            _progressIndicatorState!
                                                .setIsLoading(true);
                                            var results = await _services.get(
                                                'https://qtaapp.com/api/do_dis_buy?cartt_id=${order.carttId}&lang=${_appState!.currentLang}');
                                            _progressIndicatorState!
                                                .setIsLoading(false);
                                            if (results['response'] == '1') {
                                              showToast(context,message:
                                              results['message']);
                                              Navigator.pop(context);
                                              _tabState!.upadateInitialIndex(1);
                                              _navigationState!
                                                  .upadateNavigationIndex(1);
                                              Navigator.pushReplacementNamed(
                                                  context, '/navigation');
                                            } else {
                                              showErrorDialog(
                                                  results['message'], context);
                                            }
                                          },
                                        ),
                                      );
                                    });
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
                              btnLbl: "دفع",
                              onPressedFunction: () async {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        new AlertDialog(
                                          title: new Text('اختار طريقة الدفع'),
                                          content: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              //mada
                                              //mada
                                              GestureDetector(
                                                child: Text("Mada"),
                                                onTap: () async {

                                                  print("#####11111######");
                                                  print("#####11111######");
                                                  print("#####11111######");
                                                  print(_appState!.url);
                                                  print("#####11111######");
                                                  print("#####11111######");
                                                  print("#####11111######");

                                                  _progressIndicatorState!
                                                      .setIsLoading(true);
                                                  var results = await _services.get(
                                                      "https://qtaapp.com/site/request?amount=${order.carttTotal}&currency=SAR&paymentType=DB&cartt_id=${order.carttId}&user_id=${_appState!.currentUser!.userId}");
                                                  _progressIndicatorState!
                                                      .setIsLoading(false);
                                                  if (results['status'] ==
                                                      true) {
                                                    _appState!.setCurrentUrl(
                                                        results['id']);
                                                    print("Sssss");
                                                    print(_appState!.url);
                                                    print("Sssss");
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                PaymentScreen(
                                                                  url:results['id']
                                                                )));
                                                  } else {
                                                    showErrorDialog(
                                                        results['message'],
                                                        context);
                                                  }
                                                },
                                              ),

                                              //mada
                                              //mada
                                              GestureDetector(
                                                child: Text("Visa"),
                                                onTap: () async {

                                                  print("#####11111######");
                                                  print("#####11111######");
                                                  print("#####11111######");
                                                  print(_appState!.url);
                                                  print("#####11111######");
                                                  print("#####11111######");
                                                  print("#####11111######");

                                                  _progressIndicatorState!
                                                      .setIsLoading(true);
                                                  var results = await _services.get(
                                                      "https://qtaapp.com/site/request1?amount=${order.carttTotal}&currency=SAR&paymentType=DB&cartt_id=${order.carttId}&user_id=${_appState!.currentUser!.userId}");
                                                  _progressIndicatorState!
                                                      .setIsLoading(false);
                                                  if (results['status'] ==
                                                      true) {
                                                    _appState!.setCurrentUrl(
                                                        results['id']);
                                                    print("Sssss");
                                                    print(_appState!.url);
                                                    print("Sssss");
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                PaymentScreen(
                                                                    url:results['id']
                                                                )));
                                                  } else {
                                                    showErrorDialog(
                                                        results['message'],
                                                        context);
                                                  }
                                                },
                                              ),

                                              //master
                                              //master
                                              GestureDetector(
                                                child: Text("Master"),
                                                onTap: () async {



                                                  print("#####11111######");
                                                  print("#####11111######");
                                                  print("#####11111######");
                                                  print(_appState!.url);
                                                  print("#####11111######");
                                                  print("#####11111######");
                                                  print("#####11111######");

                                                  _progressIndicatorState!
                                                      .setIsLoading(true);
                                                  var results = await _services.get(
                                                      "https://qtaapp.com/site/request1?amount=${order.carttTotal}&currency=SAR&paymentType=DB&cartt_id=${order.carttId}&user_id=${_appState!.currentUser!.userId}");
                                                  _progressIndicatorState!
                                                      .setIsLoading(false);
                                                  if (results['status'] ==
                                                      true) {
                                                    _appState!.setCurrentUrl(
                                                        results['id']);
                                                    print("Sssss");
                                                    print(_appState!.url);
                                                    print("Sssss");
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                PaymentScreen(
                                                                    url:results['id']
                                                                )));
                                                  } else {
                                                    showErrorDialog(
                                                        results['message'],
                                                        context);
                                                  }


                                                },
                                              ),
                                            ],
                                          ),
                                          actions: <Widget>[
                                            new IconButton(
                                                icon: new Icon(Icons.close),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                })
                                          ],
                                        ));
                              }),
                        ),
                      ],
                    ))
                : Text(
                    "",
                    style: TextStyle(height: 0),
                  ),

            // التوصيل لعنوانى - التوصيل لعنوان المختلف

            order.carttDone == 2 &&
                    _appState!.currentOfferCartt != "0" &&
                    _appState!.currentOfferMtger != ""
                ? Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(
                        left: _width * 0.03,
                        right: _width * 0.03,
                        bottom: _width * 0.04),
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Color(0xffEBEBEB)),
                      color: cPrimaryColor,
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "قيمة العرض",
                          style: TextStyle(color: Colors.white),
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Container(
                          width: 1,
                          color: Colors.grey[200],
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Text(
                          order.carttPrice! + " ريال ",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )
                : Text(
                    "",
                    style: TextStyle(height: 0),
                  ),

            order.carttDone == 2 &&
                    _appState!.currentOfferCartt != "0" &&
                    _appState!.currentOfferMtger != ""
                ? Container(
                    child: CustomButton(
                      btnColor: cLightLemon,
                      btnLbl: "التوصيل لعنواني",
                      onPressedFunction: () async {
                        _progressIndicatorState!.setIsLoading(true);
                        var results = await _services.get(
                            'https://qtaapp.com/api/send_request1?lang=ar&user_id=${_appState!.currentUser!.userId}&request_cartt=${order.carttId}&request_mapx=${_locationState!.locationLatitude}&request_mapy=${_locationState!.locationlongitude}&lang=${_appState!.currentLang}');
                        _progressIndicatorState!.setIsLoading(false);
                        if (results['response'] == '1') {
                          print(results['message']);
                          print(results['message']);

                          showToast(context,message: results['message']);

                          setState(() {
                            _orderDetails = _getOrderDetails();
                            _offerDetails = _getOfferDetails();
                          });
                        } else {
                          showErrorDialog(results['message'], context);
                        }
                      },
                    ),
                  )
                : Text(
                    "",
                    style: TextStyle(height: 0),
                  ),

            order.carttDone == 2 &&
                    _appState!.currentOfferCartt != "0" &&
                    _appState!.currentOfferMtger != ""
                ? Container(
                    child: _locationState!.anotherAdress == "0"
                        ? CustomButton(
                            btnColor: cPrimaryColor,
                            btnLbl: "التوصيل لعنوان مختلف",
                            onPressedFunction: () {
                            //  _getCurrentUserLocation();

                              print("object");
                              print("object");
                              print(_locationState!.locationLatitude.toString());
                              print("object");
                              print("object");
                              showDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (_) {
                                    return LocationDialog();
                                  });


                            },
                          )
                        : CustomButton(
                            btnColor: cLightLemon,
                            btnLbl: "تم تاكيد الاختيار اضغط للارسال للتوصيل",
                            onPressedFunction: () async {
                              _progressIndicatorState!.setIsLoading(true);
                              var results = await _services.get(
                                  'https://qtaapp.com/api/send_request1?lang=ar&user_id=${_appState!.currentUser!.userId}&request_cartt=${order.carttId}&request_mapx=${_locationState!.locationLatitude}&request_mapy=${_locationState!.locationlongitude}&lang=${_appState!.currentLang}');
                              _progressIndicatorState!.setIsLoading(false);
                              if (results['response'] == '1') {
                                print(results['message']);
                                print(results['message']);

                                showToast(context,message: results['message']);

                                setState(() {
                                  _orderDetails = _getOrderDetails();
                                  _offerDetails = _getOfferDetails();
                                });
                              } else {
                                showErrorDialog(results['message'], context);
                              }
                              _locationState!.setAnotherAdress("0");
                            },
                          ),
                  )
                : Text(
                    "",
                    style: TextStyle(height: 0),
                  ),

            order.carttState == "0"
                ? CustomButton(
                    btnStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: cWhite),
                    btnLbl: AppLocalizations.of(context)!.cancelOrder,
                    onPressedFunction: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          context: context,
                          builder: (builder) {
                            return Container(
                              height: _height * 0.35,
                              width: _width,
                              child: CancelOrderBottomSheet(
                                onPressedConfirmation: () async {
                                  _progressIndicatorState!.setIsLoading(true);
                                  var results = await _services.get(
                                      'https://qtaapp.com/api/do_dis_buy?cartt_id=${order.carttId}&lang=${_appState!.currentLang}');
                                  _progressIndicatorState!.setIsLoading(false);
                                  if (results['response'] == '1') {
                                    showToast(context,message: results['message']);
                                    Navigator.pop(context);
                                    _tabState!.upadateInitialIndex(1);
                                    _navigationState!.upadateNavigationIndex(1);
                                    Navigator.pushReplacementNamed(
                                        context, '/navigation');
                                  } else {
                                    showErrorDialog(
                                        results['message'], context);
                                  }
                                },
                              ),
                            );
                          });
                    })
                : Text(
                    "",
                    style: TextStyle(height: 0),
                  ),

            // تحميل فاتورة القيمة المضافة
            (order.carttDone == 7)
                ? Container(
                    padding: EdgeInsets.only(
                        right: _width * .08,
                        left: _width * .08,
                        top: 10,
                        bottom: 10),
                    margin: EdgeInsets.only(
                        left: _width * 0.03,
                        right: _width * 0.03,
                        bottom: _width * 0.02,
                        top: _width * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "تحميل فاتورة ضريبة القيمة المضافة ",
                          style: TextStyle(color: cPrimaryColor, fontSize: 13),
                        ),
                        GestureDetector(
                          child: Icon(
                            Icons.file_download,
                            size: 35,
                            color: cBlack,
                          ),
                          onTap: () {
                            launch('https://qtaapp.com/site/fatora/' +
                                order.carttId.toString());
                          },
                        )
                      ],
                    ),
                  )
                : Text(
                    "",
                    style: TextStyle(height: 0),
                  ),

            // التقيييم

            order.carttDone == 7
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
                              btnLbl: "تقييم المندوب",
                              onPressedFunction: () async {
                                showDialog(
                                    barrierDismissible: true,
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        contentPadding: EdgeInsets.fromLTRB(
                                            0.0, 0.0, 0.0, 0.0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0))),
                                        content: SingleChildScrollView(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: cPrimaryColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15.00),
                                                    topRight:
                                                        Radius.circular(15.00),
                                                  ),
                                                  border: Border.all(
                                                      color: cHintColor)),
                                              alignment: Alignment.center,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 30,
                                              child: Text(
                                                "تقييم المندوب",
                                                style: TextStyle(
                                                    color: cWhite,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            SizedBox(
                                              height: _width * .07,
                                            ),
                                            RatingBar.builder(
                                              initialRating: 0,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.all(0),
                                              itemSize: 40,
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) async {
                                                _rateValue = rating.toString();
                                                print(_rateValue);
                                              },
                                            ),
                                            SizedBox(
                                              height: _width * .07,
                                            ),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 20,
                                                    right: 15,
                                                    left: 15),
                                                child: CustomButton(
                                                    btnColor: cLightLemon,
                                                    btnLbl: "تاكيد",
                                                    onPressedFunction:
                                                        () async {
                                                      Navigator.pop(context);
                                                      _progressIndicatorState!
                                                          .setIsLoading(true);
                                                      var results =
                                                          await _services.get(
                                                              'https://qtaapp.com/api/rate_driver?lang=ar&user_id=${_appState!.currentUser!.userId}&rate_cartt=${order.carttId}&rate_driver=${order.carttDriverId}&rate_value=$_rateValue&lang=${_appState!.currentLang}');
                                                      _progressIndicatorState!
                                                          .setIsLoading(false);
                                                      if (results['response'] ==
                                                          '1') {
                                                        print(
                                                            results['message']);
                                                        print(
                                                            results['message']);

                                                        showToast(context,message:
                                                        results['message']);

                                                        setState(() {
                                                          _orderDetails =
                                                              _getOrderDetails();
                                                          _offerDetails =
                                                              _getOfferDetails();
                                                        });
                                                      } else {
                                                        showErrorDialog(
                                                            results['message'],
                                                            context);
                                                      }
                                                    }))
                                          ],
                                        )),
                                      );
                                    });
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
                              btnLbl: "تقييم البائع",
                              onPressedFunction: () async {
                                showDialog(
                                    barrierDismissible: true,
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        contentPadding: EdgeInsets.fromLTRB(
                                            0.0, 0.0, 0.0, 0.0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15.0))),
                                        content: SingleChildScrollView(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                  color: cPrimaryColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15.00),
                                                    topRight:
                                                        Radius.circular(15.00),
                                                  ),
                                                  border: Border.all(
                                                      color: cHintColor)),
                                              alignment: Alignment.center,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 30,
                                              child: Text(
                                                "تقييم البائع",
                                                style: TextStyle(
                                                    color: cWhite,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            SizedBox(
                                              height: _width * .07,
                                            ),
                                            RatingBar.builder(
                                              initialRating: 0,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemPadding: EdgeInsets.all(0),
                                              itemSize: 40,
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) async {
                                                _rateValue = rating.toString();
                                                print(_rateValue);
                                              },
                                            ),
                                            SizedBox(
                                              height: _width * .07,
                                            ),
                                            Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 20,
                                                    right: 15,
                                                    left: 15),
                                                child: CustomButton(
                                                    btnColor: cLightLemon,
                                                    btnLbl: "تاكيد",
                                                    onPressedFunction:
                                                        () async {
                                                      Navigator.pop(context);
                                                      _progressIndicatorState!
                                                          .setIsLoading(true);
                                                      var results =
                                                          await _services.get(
                                                              'https://qtaapp.com/api/rate_mtger?lang=ar&user_id=${_appState!.currentUser!.userId}&rate_cartt=${order.carttId}&rate_mtger=${order.carttMtgerId}&rate_value=$_rateValue&lang=${_appState!.currentLang}');
                                                      _progressIndicatorState!
                                                          .setIsLoading(false);
                                                      if (results['response'] ==
                                                          '1') {
                                                        print(
                                                            results['message']);
                                                        print(
                                                            results['message']);

                                                        showToast(context,message:
                                                        results['message']);

                                                        setState(() {
                                                          _orderDetails =
                                                              _getOrderDetails();
                                                          _offerDetails =
                                                              _getOfferDetails();
                                                        });
                                                      } else {
                                                        showErrorDialog(
                                                            results['message'],
                                                            context);
                                                      }
                                                    }))
                                          ],
                                        )),
                                      );
                                    });
                              }),
                        ),
                      ],
                    ))
                : Text(
                    "",
                    style: TextStyle(height: 0),
                  ),
          ],
        ),
      ),
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
    _locationState = Provider.of<LocationState>(context);

    _marker = Marker(
        // optimized: false,
        zIndex: 5,
        onTap: () {
          print('Tapped');
        },
        draggable: true,
        onDragEnd: ((value) async {
          print('ismail');
          print(value.latitude);
          print(value.longitude);
          _locationState!.setLocationLatitude(value.latitude);
          _locationState!.setLocationlongitude(value.longitude);
          //              final coordinates = new Coordinates(
          //                _locationState.locationLatitude, _locationState
          //  .locationlongitude);
          List<Placemark> placemark = await placemarkFromCoordinates(_locationState!.locationLatitude,
                  _locationState!.locationlongitude);
          _locationState!.setCurrentAddress(placemark[0].name!);

          //   var addresses = await Geocoder.local.findAddressesFromCoordinates(
          //     coordinates);
          //   var first = addresses.first;
          // _locationState.setCurrentAddress(first.addressLine);
          // print(_locationState.address);
        }),
        markerId: MarkerId('my marker'),
        // infoWindow: InfoWindow(title: widget.address),
        position:LatLng(11.2,11.2),
        flat: true);
    _markers.add(_marker!);

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
                              leading: (snapshot.data!.carttDone == 0 ||
                                          snapshot.data!.carttDone == 1 ||
                                          snapshot.data!.carttDone == 2 ||
                                          snapshot.data!.carttDone == 3) &&
                                      snapshot.data!.carttPay == 0
                                  ? Container(
                                      width: _width * .45,
                                      margin: EdgeInsets.only(
                                          right: _width * .04,
                                          top: _width * .04,
                                          left: _width * .04),
                                      child: GestureDetector(
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.delete_sweep,
                                              color: Colors.red,
                                            ),
                                            Text(
                                              "الغاء",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        onTap: () {
                                          showModalBottomSheet(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              context: context,
                                              builder: (builder) {
                                                return Container(
                                                  height: _height * 0.35,
                                                  width: _width,
                                                  child: CancelOrderBottomSheet(
                                                    onPressedConfirmation:
                                                        () async {
                                                      _progressIndicatorState!
                                                          .setIsLoading(true);
                                                      var results =
                                                          await _services.get(
                                                              'https://qtaapp.com/api/do_dis_buy?cartt_id=${snapshot.data!.carttId}&lang=${_appState!.currentLang}');
                                                      _progressIndicatorState!
                                                          .setIsLoading(false);
                                                      if (results['response'] ==
                                                          '1') {
                                                        showToast(context,message:
                                                        results['message']);
                                                        Navigator.pop(context);
                                                        _tabState!
                                                            .upadateInitialIndex(
                                                                1);
                                                        _navigationState!
                                                            .upadateNavigationIndex(
                                                                1);
                                                        Navigator
                                                            .pushReplacementNamed(
                                                                context,
                                                                '/navigation');
                                                      } else {
                                                        showErrorDialog(
                                                            results['message'],
                                                            context);
                                                      }
                                                    },
                                                  ),
                                                );
                                              });
                                        },
                                      ),
                                    )
                                  : Text(
                                      "",
                                      style: TextStyle(height: 0),
                                    ),
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
                                        _locationState!.setAnotherAdress("0");
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
