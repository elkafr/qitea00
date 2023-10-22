
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
import 'package:qitea/screens/account/terms1_screen.dart';
import 'package:qitea/screens/account/terms_screen.dart';
import 'package:qitea/services/access_api.dart';
import 'package:qitea/utils/app_colors.dart';
import 'package:validators/validators.dart';
import 'package:qitea/components/drop_down_list_selector/drop_down_list_selector.dart';

import 'package:geocoding/geocoding.dart';

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

class MtgerRegisterScreen extends StatefulWidget {
  MtgerRegisterScreen({Key? key}) : super(key: key);

  @override
  _MtgerRegisterScreenState createState() => _MtgerRegisterScreenState();
}

class _MtgerRegisterScreenState extends State<MtgerRegisterScreen> with ValidationMixin {
  double _height=0;
  double _width=0;
  final _formKey = GlobalKey<FormState>();
  String _userName = '', _userEmail = '', _userPhone = '', _userOwner = '', _userPassword = '';
  City? _selectedCity;
  Future<List<City>>? _cityList;

  Future<List<Marka>>? _markaList;
  Services _services = Services();
  ProgressIndicatorState? _progressIndicatorState;
  AppState? _appState;
  NavigationState? _navigationState;
  bool _initialRun = true;

  LocationState? _locationState;
  LocationData? _locData;

  File? _imageFile;
  File? _imageFile1;
  File? _imageFile2;
  File? _imageFile3;
  File? _imageFile4;
  File? _imageFile5;

  dynamic _pickImageError;
  final _picker = ImagePicker();
  final _picker1 = ImagePicker();
  final _picker2 = ImagePicker();
  final _picker3 = ImagePicker();
  final _picker4 = ImagePicker();
  final _picker5 = ImagePicker();

  List<String>? x;

  
  Future<List<City>> _getCityItems() async {
    Map<dynamic, dynamic> results = await _services.get(
        'https://qtaapp.com/api/getcity?lang=${_appState!.currentLang}');
    List<City> cityList = <City>[];
    if (results['response'] == '1') {
      Iterable iterable = results['city'];
      cityList = iterable.map((model) => City.fromJson(model)).toList();
    } else {
      print('error');
    }
    return cityList;
  }


  Future<List<Marka>> _getMarkaItems() async {
    Map<dynamic, dynamic> results = await _services.get(
        'https://qtaapp.com/api/getmarka?lang=${_appState!.currentLang}');
    List<Marka> markaList = <Marka>[];
    if (results['response'] == '1') {
      Iterable iterable = results['marka'];
      markaList = iterable.map((model) => Marka.fromJson(model)).toList();
    } else {
      print('error');
    }
    return markaList;
  }


  Future<void> _getCurrentUserLocation() async {
    _progressIndicatorState!.setIsLoading(true);
    _locData = await gg.Location().getLocation();
    print(_locData!.latitude);
    print(_locData!.longitude);

    if(_locData != null){
      _locationState!.setLocationLatitude(_locData!.latitude!);
      _locationState!.setLocationlongitude(_locData!.longitude!);
      List<Placemark> placemark = await placemarkFromCoordinates(
          _locationState!.locationLatitude, _locationState!
          .locationlongitude);
      _locationState!.setCurrentAddress(placemark[0]!.name! + '  ' + placemark[0]!.administrativeArea! + ' '
          + placemark[0]!.country!);
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
            return LocationDialog(

            );
          });

    }

  }



  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialRun) {
      _appState = Provider.of<AppState>(context);
      _locationState = Provider.of<LocationState>(context);
      _locationState!.initCurrentAddress("فضلا اختيار اللوكيشن");
      _cityList = _getCityItems();
      _markaList = _getMarkaItems();
       x=[];
      _initialRun=false;
    }

  }



  void _onImageButtonPressed(ImageSource source, {BuildContext? context}) async {
    try {
      final pickedFile = await _picker.getImage(source: source);
      _imageFile = File(pickedFile!.path);
      setState(() {});
    } catch (e) {
      _pickImageError = e;
      print(_pickImageError);
    }
  }

  void _onImageButtonPressed1(ImageSource source, {BuildContext? context}) async {
    try {
      final pickedFile1 = await _picker1.getImage(source: source);
      _imageFile1 = File(pickedFile1!.path);
      setState(() {});
    } catch (e) {
      _pickImageError = e;
      print(_pickImageError);
    }
  }


  void _onImageButtonPressed2(ImageSource source, {BuildContext? context}) async {
    try {
      final pickedFile2 = await _picker2.getImage(source: source);
      _imageFile2 = File(pickedFile2!.path);
      setState(() {});
    } catch (e) {
      _pickImageError = e;
      print(_pickImageError);
    }
  }


  void _onImageButtonPressed3(ImageSource source, {BuildContext? context}) async {
    try {
      final pickedFile3 = await _picker3.getImage(source: source);
      _imageFile3 = File(pickedFile3!.path);
      setState(() {});
    } catch (e) {
      _pickImageError = e;
      print(_pickImageError);
    }
  }


  void _onImageButtonPressed4(ImageSource source, {BuildContext? context}) async {
    try {
      final pickedFile4 = await _picker4.getImage(source: source);
      _imageFile4 = File(pickedFile4!.path);
      setState(() {});
    } catch (e) {
      _pickImageError = e;
      print(_pickImageError);
    }
  }


  void _onImageButtonPressed5(ImageSource source, {BuildContext? context}) async {
    try {
      final pickedFile5 = await _picker5.getImage(source: source);
      _imageFile5 = File(pickedFile5!.path);
      setState(() {});
    } catch (e) {
      _pickImageError = e;
      print(_pickImageError);
    }
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.subject),
                    title: new Text('معرض الصور'),
                    onTap: () {
                      _onImageButtonPressed(ImageSource.gallery,
                          context: context);
                      Navigator.pop(context);
                    }),
                new ListTile(
                    leading: new Icon(Icons.camera),
                    title: new Text('الكاميرا'),
                    onTap: () {
                      _onImageButtonPressed(ImageSource.camera,
                          context: context);
                      Navigator.pop(context);
                    }),
              ],
            ),
          );
        });
  }


  void _settingModalBottomSheet1(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.subject),
                    title: new Text('Gallery'),
                    onTap: () {
                      _onImageButtonPressed1(ImageSource.gallery,
                          context: context);
                      Navigator.pop(context);
                    }),
                new ListTile(
                    leading: new Icon(Icons.camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _onImageButtonPressed1(ImageSource.camera,
                          context: context);
                      Navigator.pop(context);
                    }),
              ],
            ),
          );
        });
  }







  void _settingModalBottomSheet2(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.subject),
                    title: new Text('Gallery'),
                    onTap: () {
                      _onImageButtonPressed2(ImageSource.gallery,
                          context: context);
                      Navigator.pop(context);
                    }),
                new ListTile(
                    leading: new Icon(Icons.camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _onImageButtonPressed2(ImageSource.camera,
                          context: context);
                      Navigator.pop(context);
                    }),
              ],
            ),
          );
        });
  }




  void _settingModalBottomSheet3(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.subject),
                    title: new Text('Gallery'),
                    onTap: () {
                      _onImageButtonPressed3(ImageSource.gallery,
                          context: context);
                      Navigator.pop(context);
                    }),
                new ListTile(
                    leading: new Icon(Icons.camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _onImageButtonPressed3(ImageSource.camera,
                          context: context);
                      Navigator.pop(context);
                    }),
              ],
            ),
          );
        });
  }







  void _settingModalBottomSheet4(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.subject),
                    title: new Text('Gallery'),
                    onTap: () {
                      _onImageButtonPressed4(ImageSource.gallery,
                          context: context);
                      Navigator.pop(context);
                    }),
                new ListTile(
                    leading: new Icon(Icons.camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _onImageButtonPressed4(ImageSource.camera,
                          context: context);
                      Navigator.pop(context);
                    }),
              ],
            ),
          );
        });
  }





  void _settingModalBottomSheet5(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.subject),
                    title: new Text('Gallery'),
                    onTap: () {
                      _onImageButtonPressed5(ImageSource.gallery,
                          context: context);
                      Navigator.pop(context);
                    }),
                new ListTile(
                    leading: new Icon(Icons.camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _onImageButtonPressed5(ImageSource.camera,
                          context: context);
                      Navigator.pop(context);
                    }),
              ],
            ),
          );
        });
  }

  Widget _buildBodyItem() {

    var stringList="1";
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: _height * 0.05,
            ),
            Container(
              margin: EdgeInsets.only(right: _width*.05,left: _width*.05),
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                child: Text("تخطي",style: TextStyle(color: cOmarColor,fontSize: 14),),
                onTap: (){
                  _navigationState!.upadateNavigationIndex(0);
                  Navigator.pushReplacementNamed(context, '/navigation');
                },
              ),
            ),

            Container(
              height: _height * 0.19,
              margin: EdgeInsets.symmetric(horizontal: _width * 0.03),
              child: Center(
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
            SizedBox(
              height: _height * 0.03,
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                    height: 1.3,
                    fontWeight: FontWeight.w400,
                    color: cBlack,
                    fontSize: 20,
                    fontFamily: 'segoeui'),
                children: <TextSpan>[
                  TextSpan(text: "حياك معنا"),
                  TextSpan(text: ' ! ',style: TextStyle(color: cLightLemon,fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(
              height: _height * 0.03,
            ),
            Container(
                margin: EdgeInsets.only(
                  top: _height * 0.03,
                  right:_width*.04,
                  left:_width*.04,
                ),
                child: CustomTextFormField(
                
                  prefixIcon:  Icon(
                      Icons.person,
                      size: 24,
                    ),
                  
                  hintTxt: "اسم النشاط التجاري",
                  validationFunc: (value) {
                    if (value!.trim().length == 0) {
                      return "فضلا ادخال اسم النشاط التجاري";
                    }
                    return null;
                  },
                  inputData: TextInputType.text,
                  onChangedFunc: (String text) {
                    _userName = text.toString();
                  },
                )),




            Container(
                margin: EdgeInsets.only(
                  top: _height * 0.03,
                  right:_width*.04,
                  left:_width*.04,
                ),
                child: CustomTextFormField(

                  prefixIcon:  Icon(
                    Icons.person,
                    size: 24,
                  ),

                  hintTxt: "اسم المالك",
                  validationFunc: (value) {
                    if (value!.trim().length == 0) {
                      return "فضلا ادخال اسم المالك";
                    }
                    return null;
                  },
                  inputData: TextInputType.text,
                  onChangedFunc: (String text) {
                    _userOwner = text.toString();
                  },
                )),
            Container(
                margin: EdgeInsets.only(
                  top: _height * 0.015,
                  right:_width*.04,
                  left:_width*.04,
                ),
                child: CustomTextFormField(
              iconIsImage: true,
                  suffixIcon:  Image.asset("assets/images/sa.png"),
              imagePath: 'assets/images/call.png', 
              hintTxt: AppLocalizations.of(context)!.phoneNo,
              validationFunc: (value) {
               if (value!.trim().length == 0) {
                      return AppLocalizations.of(context)!.phonoNoValidation;
                    }

               if (value.trim().length != 9) {
                 return "يجب ان يكون  رقم الهاتف مكون من 9 ارقايم ويبدء ب 5 ";
               }
                return null;
              },
              inputData: TextInputType.text,
              onChangedFunc: (String text) {
                _userPhone = text.toString();
              },
            )),
            Container(
                margin: EdgeInsets.only(
                  top: _height * 0.015,
                  right:_width*.04,
                  left:_width*.04,
                ),
                child: CustomTextFormField(
                 prefixIcon:  Icon(Icons.mail),
                  hintTxt: AppLocalizations.of(context)!.email,
                  validationFunc: (value) {
                    if (!isEmail(value!)) {
                      return AppLocalizations.of(context)!.emailValidation;
                    }
                    return null;
                  },
                  inputData: TextInputType.text,
                  onChangedFunc: (String text) {
                    _userEmail = text.toString();
                  },
                )),

            Container(
                margin: EdgeInsets.only(
                  top: _height * 0.015,
                  right:_width*.02,
                  left:_width*.02,
                ),
              child:
              FutureBuilder<List<City>>(
                future: _cityList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.hasData) {
                      var cityList = snapshot.data!.map((item) {
                        return new DropdownMenuItem<City>(
                          child: new Text(item!.cityName!),
                          value: item,
                        );
                      }).toList();

                      return DropDownListSelector(
                        dropDownList: cityList,
                        hint: "المدينة",

                        onChangeFunc: (newValue) {
                          FocusScope.of(context).requestFocus(FocusNode());

                          setState(() {
                            _selectedCity = newValue;
                          });


                        },
                        value: _selectedCity,
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }

                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),





            GestureDetector(
                onTap: () {
                  _settingModalBottomSheet(context);
                },
                child: Container(
                  margin: EdgeInsets.only(right: _width*.07,left: _width*.07,top: _width*.03,),
                  decoration: BoxDecoration(
                    color:   Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Color(0xffF9F9F9),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 25.0, // has the effect of softening the shadow
                        spreadRadius: 5.0, // has the effect of extending the shadow
                        offset: Offset(
                          10.0, // horizontal, move right 10
                          10.0, // vertical, move down 10
                        ),
                      )
                    ],
                  ),
                  child: ListTile(
                    leading: Container(

                      child: Text("صورة من السجل التجاري ",style: TextStyle(fontSize: 14,color: cHintColor),),
                    ),
                    trailing: _imageFile != null
                        ?ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child:  Image.file(
                          _imageFile!,
                          fit: BoxFit.fill,
                        )):Icon(Icons.camera_alt,size: 30,color: cHintColor,),
                  ),
                )),



            Container(
              margin: EdgeInsets.only(top: 15,right: 30,left: 30),
              child: Text(_appState!.currentLang=="ar"?"اختيار أقسام الورشة":"Selection of workshop sections",style: TextStyle(fontSize: 16),),
            ),


            Container(
                height: _height * 0.4,
                color: Color(0xffF8F8F8),
                margin: EdgeInsets.only(left: 20,right: 20),
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: FutureBuilder<List<Marka>>(
                    future: _markaList,
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return Center(
                            child: SpinKitFadingCircle(color: cPrimaryColor),
                          );
                        case ConnectionState.active:
                          return Text('');
                        case ConnectionState.waiting:
                          return Center(
                            child: SpinKitFadingCircle(color: cPrimaryColor),
                          );
                        case ConnectionState.done:
                          if (snapshot.hasError) {
                            return Text("حدث خطأ ما ");
                          } else {
                            if (snapshot.data!.length > 0) {
                              return GridView.builder(
                                  shrinkWrap: false,
                                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: MediaQuery.of(context).size.width /
                                        (MediaQuery.of(context).size.height / 5),
                                  ),
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Consumer<AppState>(
                                        builder: (context, appState, child) {
                                          return InkWell(


                                            onTap: () {


                                              if(x!.contains(snapshot.data![index].markaId)){

                                               setState(() {
                                                 x!.remove(snapshot.data![index].markaId);
                                                 stringList = x!.join(",");
                                                 _appState!.setMarkaa(stringList);
                                               });

                                              }else{
                                                setState(() {
                                                  x!.add(snapshot.data![index].markaId!);
                                                  stringList = x!.join(",");
                                                  _appState!.setMarkaa(stringList);
                                                });
                                              }


                                              print(x);

                                              print(stringList); //Prints "onetwothree"

                                            },

                                            child: Container(
                                              alignment: Alignment.center,

                                              margin: EdgeInsets.all(5),

                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                border: Border.all(
                                                  color: cPrimaryColor,
                                                ),
                                                color: x!.contains(snapshot.data![index].markaId.toString())?cPrimaryColor:Colors.white,

                                              ),


                                              child: Text(snapshot.data![index].markaName!,style: TextStyle(color: (x!.contains(snapshot.data![index].markaId))?Colors.white:cPrimaryColor),),
                                            ),
                                          );
                                        });
                                  });
                            } else {
                              return Text("لاتوجد نتائج");
                            }
                          }
                      }
                      return Center(
                        child: SpinKitFadingCircle(color: cPrimaryColor),
                      );
                    })),

            Container(
              margin: EdgeInsets.only(right: _width*.06,left: _width*.06,top: _width*.03,bottom:  _width*.03),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){

                      _getCurrentUserLocation();
                    },
                    child: Container(
                      width: _width * 0.35,
                      height: 40,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: cPrimaryColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.00),
                          ),
                          border: Border.all(color: cPrimaryColor)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 5,right: 5),
                            child: Image.asset(
                              'assets/images/cursor.png',
                              color: cWhite,
                            ),
                          ),
                          Text(
                            " اختار اللوكيشن",
                            style: TextStyle(
                                color: cWhite,
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: _width *0.45,

                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      _locationState!.address,
                      maxLines: 2,
                      style: TextStyle(

                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xffB7B7B7)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            ),


            Container(
                margin: EdgeInsets.only(
                  top: _height * 0.02,
                  right:_width*.04,
                  left:_width*.04,
                ),
                child: CustomTextFormField(
                       isPassword: true,
                    imagePath:'assets/images/key.png' ,
                 iconIsImage: true,
                    hintTxt: AppLocalizations.of(context)!.password,
                    inputData: TextInputType.text,
                    onChangedFunc: (String text) {
                      _userPassword = text.toString();
                    },
                    validationFunc: (value) {
                      if (value!.trim().length < 4) {
                        return AppLocalizations.of(context)!.passwordValidation;
                      }
                      return null;
                    })),
            Container(
                margin: EdgeInsets.only(
                  top: _height * 0.015,
                  right:_width*.04,
                  left:_width*.04,
                ),
                child: CustomTextFormField(
                   
                    isPassword: true,
                    imagePath:'assets/images/key.png' ,
                 iconIsImage: true,
                    hintTxt: AppLocalizations.of(context)!.passwordVerify,
                    inputData: TextInputType.text,
                 
                    validationFunc: (value) {
                    if (value!.trim().length < 4) {
                        return AppLocalizations.of(context)!.passwordValidation;
                  
                      } else if (value != _userPassword) {
                        return AppLocalizations.of(context)!.passwordNotIdentical;
                      }
                      return null;
                    })),
            Container(
              margin: EdgeInsets.only(
                top: _height * 0.025,
                right:_width*.04,
                left:_width*.04,
              ),
              alignment: Alignment.topRight,
              height: _height * 0.05,
              child: Row(
                children: <Widget>[
                   Consumer<AppState>(builder: (context, appState, child) {
                    return GestureDetector(
                      onTap: () =>
                          appState.setAcceptTerms(!appState.acceptTerms!),
                      child: Container(
                        width: 20,
                        height: 20,
                        margin: EdgeInsets.only(
                            left: _width * 0.02, right: _width * 0.02),
                        child: appState.acceptTerms!
                            ? Icon(
                                Icons.check,
                                color: cWhite,
                                size: 17,
                              )
                            : Container(),
                        decoration: BoxDecoration(
                          color:  appState.acceptTerms! ? cPrimaryColor : cWhite,
                          border: Border.all(
                            color:  appState.acceptTerms!
                                ? cPrimaryColor
                                : cHintColor,
                          ),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    );
                  }),
                  
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Terms1Screen()));
                    },
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: _width * 0.02),
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'segoeui',
                                color: Colors.black),
                            children: <TextSpan>[
                              new TextSpan(text: AppLocalizations.of(context)!.iAccept),
                              new TextSpan(
                                  text: AppLocalizations.of(context)!.terms,
                                  style: new TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      fontFamily: 'segoeui',
                                      color: cLightLemon)),
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
            Container(
              height: 60,
              child: CustomButton(
                btnColor: cLightLemon,
                btnLbl: AppLocalizations.of(context)!.register,
                onPressedFunction: () async {
                  if (_formKey.currentState!.validate() &
                  checkMtgerRegisterValidation(context,
                    imgFile: _imageFile!,
                      userCity :_selectedCity!
                  )

                  ) {
                    if (_appState!.acceptTerms!) {

                     if(_locData!=null){



                      _progressIndicatorState!.setIsLoading(true);
                      String fileName = (_imageFile != null)
                          ? Path.basename(_imageFile!.path)
                          : "";

                      String fileName1 = (_imageFile1 != null)
                          ? Path.basename(_imageFile1!.path)
                          : "";

                      String fileName2 = (_imageFile2 != null)
                          ? Path.basename(_imageFile2!.path)
                          : "";

                      String fileName3 = (_imageFile3 != null)
                          ? Path.basename(_imageFile3!.path)
                          : "";

                      String fileName4 = (_imageFile4 != null)
                          ? Path.basename(_imageFile4!.path)
                          : "";

                      String fileName5 = (_imageFile5 != null)
                          ? Path.basename(_imageFile5!.path)
                          : "";


                      FormData formData = new FormData.fromMap({
                        "user_name": _userName,
                        "user_owner": _userOwner,
                        "user_phone":_userPhone,
                        "user_email": _userEmail,
                        "user_city": _selectedCity!.cityId,
                        "user_pass": _userPassword,
                        "user_marka": _appState!.markaa,
                        "user_mapx": _locationState!.locationLatitude.toString(),
                        "user_mapy": _locationState!.locationlongitude.toString(),
                        "lang": _appState!.currentLang,
                        "user_photo": (_imageFile != null)
                            ? await MultipartFile.fromFile(_imageFile!.path,
                            filename: fileName)
                            : "",


                      });


                      final results = await _services
                          .postWithDio(
                          "https://qtaapp.com/api/register_mtger",
                          body: formData);



                      _progressIndicatorState!.setIsLoading(false);
                      if (results['response'] == '1') {

                        showToast(context,message: results['message']);
                       // _appState.setCurrentUser(User(userId:results['user_id'].toString() ));
                        _appState!.setCurrentPhone111(results['user_id'].toString());
                        Navigator.pushNamed(context, '/register_code_activation1_screen' );

                      } else {
                        showErrorDialog(results['message'], context);
                      }


                     } else {
                       showErrorDialog("يجب اختيار اللوكيشن", context);
                     }


                    } else {
                      showErrorDialog(AppLocalizations.of(context)!.acceptTerms, context);
                    }
                  }
                },
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: _height * 0.01),
                child: Center(
                  child: Text(
                   "لديك حساب بالفعل",
                    style:
                        TextStyle(color: cOmarColor,fontSize: 14),
                  ),
                )),
            GestureDetector(
              child: Text("اضغط هنا",style: TextStyle(color: cLightLemon,fontSize: 14,fontWeight: FontWeight.bold),),
              onTap: (){
                Navigator.pushNamed(context, '/login_screen');
              },
            ),
            SizedBox(height: _width*.04,)

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
    _appState = Provider.of<AppState>(context);
    _navigationState = Provider.of<NavigationState>(context);
    return  NetworkIndicator( child:PageContainer(
      child: Scaffold(
          backgroundColor: Color(0xffF5F6F8),
          body: Stack(
        children: <Widget>[
          _buildBodyItem(),

          Center(
            child: ProgressIndicatorComponent(),
          )
        ],
      )),
    ));
  }
}
