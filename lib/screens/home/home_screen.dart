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







import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qitea/components/app_repo/store_state.dart';
import 'package:qitea/components/drop_down_list_selector/drop_down_list_selector.dart';
import 'package:qitea/models/category.dart';

import 'package:provider/provider.dart';
import 'package:qitea/components/app_data/shared_preferences_helper.dart';
import 'package:qitea/components/app_repo/app_state.dart';
import 'package:qitea/components/app_repo/progress_indicator_state.dart';
import 'package:qitea/components/buttons/custom_button.dart';
import 'package:qitea/components/connectivity/network_indicator.dart';
import 'package:qitea/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:qitea/components/gradient_app_bar/gradient_app_bar.dart';
import 'package:qitea/components/horizontal_divider/horizontal_divider.dart';
import 'package:qitea/components/progress_indicator_component/progress_indicator_component.dart';
import 'package:qitea/components/response_handling/response_handling.dart';
import 'package:qitea/components/safe_area/page_container.dart';
import 'package:qitea/components/custom_text_form_field/validation_mixin.dart';
import 'package:qitea/locale/localization.dart';
import 'package:qitea/models/user.dart';
import 'package:qitea/services/access_api.dart';
import 'package:qitea/utils/app_colors.dart';
import 'package:qitea/utils/utils.dart';
import 'package:qitea/screens/auth/password_recovery_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:validators/validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'dart:math' as math;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with ValidationMixin{
  dynamic _pickImageError;
  final _picker = ImagePicker();
  final _picker1 = ImagePicker();
  final _picker2 = ImagePicker();
  double _height;
  double _width;
  final _formKey = GlobalKey<FormState>();
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  Services _services = Services();
  bool _enableSearch = false;
  StoreState _storeState;
  AppState _appState;
  NavigationState _navigationState;
  LocationState _locationState;
  bool _initialRun = true;

  Marka _selectedMarka;
  Future<List<Marka>> _markaList;

  Type _selectedType;
  Future<List<Type>> _typeList;

  Model _selectedModel;
  Future<List<Model>> _modelList;

  List<String> _carttNumber;
  String _selectedCarttNumber;

  ProgressIndicatorState _progressIndicatorState;
  FocusNode _focusNode;

  File _imageFile;
  File _imageFile1;
  File _imageFile2;

  String _carttHikal,
      _carttDetails1,
      _carttDetails2,
      _carttDetails3;


  Future<List<Marka>> _getMarkaItems() async {
    Map<String, dynamic> results = await _services.get(
        'https://qtaapp.com/api/getmarka?lang=${_appState.currentLang}');
    List<Marka> markaList = List<Marka>();
    if (results['response'] == '1') {
      Iterable iterable = results['marka'];
      markaList = iterable.map((model) => Marka.fromJson(model)).toList();
    } else {
      print('error');
    }
    return markaList;
  }


  Future<List<Type>> _getTypeItems(String x) async {

    Map<String, dynamic> results = x=="0"?await _services.get(
        'https://qtaapp.com/api/gettype?lang=${_appState.currentLang}&marka_id=0'):await _services.get(
        'https://qtaapp.com/api/gettype?lang=${_appState.currentLang}&marka_id=$x');
    List<Type> typeList = List<Type>();
    if (results['response'] == '1') {
      Iterable iterable = results['type'];
      typeList = iterable.map((model) => Type.fromJson(model)).toList();
    } else {
      print('error');
    }
    return typeList;
  }


  Future<List<Model>> _getModelItems() async {
    Map<String, dynamic> results = await _services.get(
        'https://qtaapp.com/api/getmodel/?lang=${_appState.currentLang}');
    List<Model> modelList = List<Model>();
    if (results['response'] == '1') {
      Iterable iterable = results['model'];
      modelList = iterable.map((model) => Model.fromJson(model)).toList();
    } else {
      print('error');
    }
    return modelList;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialRun) {
      _appState = Provider.of<AppState>(context);
      _navigationState= Provider.of<NavigationState>(context);

      _markaList = _getMarkaItems();
      _typeList = _getTypeItems("0");
      _modelList = _getModelItems();
      _carttNumber = ["1", "2", "3"];
      _initialRun=false;
    }

  }

  @override
  void initState() {
    super.initState();

    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _focusNode.dispose();
    super.dispose();
  }

  void _onImageButtonPressed(ImageSource source, {BuildContext context}) async {
    try {
      final pickedFile = await _picker.getImage(source: source);
      _imageFile = File(pickedFile.path);
      setState(() {});
    } catch (e) {
      _pickImageError = e;
      print(_pickImageError);
    }
  }

  void _onImageButtonPressed1(ImageSource source, {BuildContext context}) async {
    try {
      final pickedFile1 = await _picker1.getImage(source: source);
      _imageFile1 = File(pickedFile1.path);
      setState(() {});
    } catch (e) {
      _pickImageError = e;
      print(_pickImageError);
    }
  }


  void _onImageButtonPressed2(ImageSource source, {BuildContext context}) async {
    try {
      final pickedFile2 = await _picker2.getImage(source: source);
      _imageFile2 = File(pickedFile2.path);
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
                    title: new Text('معرض الصور'),
                    onTap: () {
                      _onImageButtonPressed1(ImageSource.gallery,
                          context: context);
                      Navigator.pop(context);
                    }),
                new ListTile(
                    leading: new Icon(Icons.camera),
                    title: new Text('الكاميرا'),
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
                    title: new Text('معرض الصور'),
                    onTap: () {
                      _onImageButtonPressed2(ImageSource.gallery,
                          context: context);
                      Navigator.pop(context);
                    }),
                new ListTile(
                    leading: new Icon(Icons.camera),
                    title: new Text('الكاميرا'),
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


  Widget _buildBodyItemDriver() {

    return ListView(
      children: <Widget>[
        SizedBox(
          height: _width * .01,
        ),
        Container(
          margin: EdgeInsets.all(_width * .05),
          child: SliderImages(),
        ),
        SizedBox(
          height: _width * .04,
        ),
        Container(
          child: Text("انت مسجل دخول",style: TextStyle(color: cBlack,fontSize: 17),),
          alignment: Alignment.center,
        ),
        SizedBox(
          height: _width * .04,
        ),
        Container(
          child: Text("كـ مندوب",style: TextStyle(color: cLightLemon,fontSize: 22,fontWeight: FontWeight.bold),),
          alignment: Alignment.center,
        ),
        SizedBox(
          height: _width * .08,
        ),
        Container(
          child: Text("للاستفادة من خدمات التطبيق يلزمك التسجيل كعميل",style: TextStyle(color: cPrimaryColor,fontSize: 13),),
          alignment: Alignment.center,
        ),
      ],
    );

  }



  Widget _buildBodyItemMtger() {

    return ListView(

      children: <Widget>[
        SizedBox(
          height: _width * .01,
        ),
        Container(
          margin: EdgeInsets.all(_width * .05),
          child: SliderImages(),
        ),
        SizedBox(
          height: _width * .04,
        ),
        Container(
          child: Text("انت مسجل دخول",style: TextStyle(color: cBlack,fontSize: 17),),
          alignment: Alignment.center,
        ),
        SizedBox(
          height: _width * .04,
        ),
        Container(
          child: Text("كـ تاجر",style: TextStyle(color: cLightLemon,fontSize: 22,fontWeight: FontWeight.bold),),
          alignment: Alignment.center,
        ),
        SizedBox(
          height: _width * .08,
        ),
        Container(
          child: Text("للاستفادة من خدمات التطبيق يلزمك التسجيل كعميل",style: TextStyle(color: cPrimaryColor,fontSize: 13),),
          alignment: Alignment.center,
        ),
      ],
    );

  }

  Widget _buildBodyItem() {
    var carttNumber = _carttNumber.map((item) {
      return new DropdownMenuItem<String>(
        child: new Text(item),
        value: item,
      );
    }).toList();
    return ListView(
      children: <Widget>[
        SizedBox(
          height: _width * .0001,
        ),
        Container(
          margin: EdgeInsets.all(_width * .05),
          child: SliderImages(),
        ),
        Container(
          margin: EdgeInsets.only(right: _width * .05,left: _width * .05),
          height: _width*.18,
          child: Image.asset("assets/images/order.png"),
        ),
        SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: _height * 0.02,
                ),



                FutureBuilder<List<Marka>>(
                  future: _markaList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.hasData) {
                        var markaList = snapshot.data.map((item) {
                          return new DropdownMenuItem<Marka>(
                            child: new Text(item.markaName),
                            value: item,
                          );
                        }).toList();

                        return DropDownListSelector(
                          dropDownList: markaList,
                          hint: _appState.currentLang=="ar"?"ماركة السيارة":"car brand",

                          onChangeFunc: (newValue) {
                            FocusScope.of(context).requestFocus(FocusNode());

                            setState(() {
                              _selectedMarka = newValue;
                              _selectedType=null;
                              _typeList = _getTypeItems(_selectedMarka.markaId);
                            });


                          },
                          value: _selectedMarka,
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


                FutureBuilder<List<Type>>(
                  future: _typeList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.hasData) {
                        var typeList = snapshot.data.map((item) {
                          return new DropdownMenuItem<Type>(
                            child: new Text(item.typeName),
                            value: item,
                          );
                        }).toList();

                        return DropDownListSelector(
                          dropDownList: typeList,
                          hint: _appState.currentLang=="ar"?"نوع السيارة":"Vehicle Type",

                          onChangeFunc: (newValue) {
                            FocusScope.of(context).requestFocus(FocusNode());

                            setState(() {
                              _selectedType = newValue;
                            });
                          },
                          value: _selectedType,
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



                FutureBuilder<List<Model>>(
                  future: _modelList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.hasData) {
                        var modelList = snapshot.data.map((item) {
                          return new DropdownMenuItem<Model>(
                            child: new Text(item.modelName),
                            value: item,
                          );
                        }).toList();

                        return DropDownListSelector(
                          dropDownList: modelList,
                          hint: _appState.currentLang=="ar"?"الموديل *":"Model",

                          onChangeFunc: (newValue) {
                            FocusScope.of(context).requestFocus(FocusNode());

                            setState(() {
                              _selectedModel = newValue;
                            });

                          },
                          value: _selectedModel,
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

                Container(
                  margin: EdgeInsets.only(
                      left: _width * 0.025,
                      bottom: _width * 0.025,
                      right: _width * 0.025),
                  child: CustomTextFormField(

                    hintTxt: _appState.currentLang=="ar"?"رقم الهيكل":"Structure No",
                    validationFunc: (value) {
                      if (value.trim().length == 0) {
                        return "برجاء ادخال رقم الهيكل";
                      }
                      return null;
                    },
                    inputData: TextInputType.text,
                    onChangedFunc: (String text) {
                      _carttHikal = text.toString();
                    },
                  ),
                ),

                Container(

                  child: DropDownListSelector(

                    dropDownList: carttNumber,
                    hint:  _appState.currentLang=="ar"?"عدد القطع المطلوبة":"number of pieces required ",
                    onChangeFunc: (newValue) {

                      FocusScope.of(context).requestFocus( FocusNode());
                      setState(() {
                        _selectedCarttNumber = newValue;
                        _appState.setCurrentCarttNumber(newValue);
                      });
                    },
                    value: _selectedCarttNumber,
                  ),
                ),




                Container(
                  height: _width*.3,
                  margin: EdgeInsets.only(
                      left: _width * 0.025,
                      bottom: _width * 0.025,
                      right: _width * 0.025),
                  child: CustomTextFormField(
                    hintTxt: _appState.currentLang=="ar"?"وصف القطعة 1":"Widget Description 1",
                    validationFunc: (value) {
                      if (value.trim().length == 0) {
                        return _appState.currentLang=="ar"?"برجاء ادخال وصف القطعة  1":"Please enter the description of the part 1";
                      }
                      return null;
                    },
                    inputData: TextInputType.text,
                    onChangedFunc: (String text) {
                      _carttDetails1 = text.toString();
                    },
                  ),
                ),


                GestureDetector(
                    onTap: () {
                      _settingModalBottomSheet(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: _width*.05,left: _width*.05),
                      decoration: BoxDecoration(
                        color:   Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Color(0xffF9F9F9),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300],
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

                          child: Text(_appState.currentLang=="ar"?"صورة القطعة 1":"widget image 1",style: TextStyle(fontSize: 14,color: cHintColor),),
                        ),
                        trailing: _imageFile != null
                            ?ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child:  Image.file(
                              _imageFile,
                               fit: BoxFit.fill,
                            )):Icon(Icons.camera_alt,size: 30,color: cHintColor,),
                      ),
                    )),









                _appState.carttNumber=="2" || _appState.carttNumber=="3"?Container(
                  height: _width*.3,
                  margin: EdgeInsets.only(
                    top: _width*.025,
                      left: _width * 0.025,
                      bottom: _width * 0.025,
                      right: _width * 0.025),
                  child: CustomTextFormField(
                    hintTxt: _appState.currentLang=="ar"?"وصف القطعة 2":"Widget Description 2",
                    inputData: TextInputType.text,
                    onChangedFunc: (String text) {
                      _carttDetails2 = text.toString();
                    },
                  ),
                ):Text(""),
                _appState.carttNumber=="2" || _appState.carttNumber=="3"?GestureDetector(
                    onTap: () {
                      _settingModalBottomSheet1(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: _width*.05,left: _width*.05),
                      decoration: BoxDecoration(
                        color:   Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Color(0xffF9F9F9),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300],
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

                          child: Text(_appState.currentLang=="ar"?"صورة القطعة 2":"Widget 2 image",style: TextStyle(fontSize: 14,color: cHintColor),),
                        ),
                        trailing: _imageFile1 != null
                            ?ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child:  Image.file(
                              _imageFile1,
                              fit: BoxFit.fill,
                            )):Icon(Icons.camera_alt,size: 30,color: cHintColor,),
                      ),
                    )):Text(""),










                _appState.carttNumber=="3"?Container(
                  height: _width*.3,
                  margin: EdgeInsets.only(
                      top: _width*.025,
                      left: _width * 0.025,
                      bottom: _width * 0.025,
                      right: _width * 0.025),
                  child: CustomTextFormField(
                    hintTxt: _appState.currentLang=="ar"?"وصف القطعة 3":"Widget Description 3",
                    inputData: TextInputType.text,
                    onChangedFunc: (String text) {
                      _carttDetails3 = text.toString();
                    },
                  ),
                ):Text(""),
                _appState.carttNumber=="3"?GestureDetector(
                    onTap: () {
                      _settingModalBottomSheet2(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: _width*.05,left: _width*.05),
                      decoration: BoxDecoration(
                        color:   Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Color(0xffF9F9F9),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300],
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

                          child: Text(_appState.currentLang=="ar"?"صورة القطعة 3":"Widget 3 image",style: TextStyle(fontSize: 14,color: cHintColor),),
                        ),
                        trailing: _imageFile2 != null
                            ?ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child:  Image.file(
                              _imageFile2,
                              fit: BoxFit.fill,
                            )):Icon(Icons.camera_alt,size: 30,color: cHintColor,),
                      ),
                    )):Text(""),




            //Text(_appState.currentUser.userId),
                Container(
                  margin: EdgeInsets.symmetric(vertical: _height * 0.02),
                  height: 60,
                  child: CustomButton(
                    btnColor: cLightLemon,
                    btnLbl: _appState.currentLang=="ar"?"ارسال":"Send",
                    onPressedFunction: () async {


                       if(_appState.currentUser!=null) {
                         if (_formKey.currentState.validate() &
                         checkAddProductValidation(context,
                           adMainCategory: _selectedMarka,
                           imgFile: _imageFile,
                         )
                         ) {

                           _progressIndicatorState.setIsLoading(true);
                           String fileName = (_imageFile != null)
                               ? Path.basename(_imageFile.path)
                               : "";

                           String fileName1 = (_imageFile1 != null)
                               ? Path.basename(_imageFile1.path)
                               : "";

                           String fileName2 = (_imageFile2 != null)
                               ? Path.basename(_imageFile2.path)
                               : "";

                           FormData formData = new FormData.fromMap({
                             "cartt_user": _appState.currentUser.userId,
                             "cartt_marka": _selectedMarka.markaId,
                             "cartt_typee": _selectedType.typeId,
                             "cartt_model": _selectedModel.modelId,
                             "cartt_hikal": _carttHikal,
                             "cartt_number": _selectedCarttNumber,
                             "cartt_details1": _carttDetails1,
                             "cartt_details2": _carttDetails2 != null
                                 ? _carttDetails2
                                 : "",
                             "cartt_details3": _carttDetails3 != null
                                 ? _carttDetails3
                                 : "",
                             "lang": _appState.currentLang,
                             "cartt_photo1": (_imageFile != null)
                                 ? await MultipartFile.fromFile(_imageFile.path,
                                 filename: fileName)
                                 : "",
                             "cartt_photo2": (_imageFile1 != null)
                                 ? await MultipartFile.fromFile(
                                 _imageFile1.path,
                                 filename: fileName1)
                                 : "",
                             "cartt_photo3": (_imageFile2 != null)
                                 ? await MultipartFile.fromFile(
                                 _imageFile2.path,
                                 filename: fileName2)
                                 : "",
                           });


                           final results = await _services
                               .postWithDio(
                               "https://qtaapp.com/api/send_request",
                               body: formData);

                           print(results.toString() + "ssssssss");

                           _progressIndicatorState.setIsLoading(false);
                           if (results['response'] == '1') {
                             _navigationState.upadateNavigationIndex(1);
                             Navigator.pushReplacementNamed(context, '/navigation');

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
                                           Image.asset(
                                               "assets/images/true.png"),
                                           SizedBox(
                                             height: 10,
                                           ),
                                           Text(
                                             results['message'],
                                             textAlign: TextAlign.center,
                                             style: TextStyle(
                                                 fontSize: 16,
                                                 height: 1.5,
                                                 fontFamily: 'segoeui',
                                                 color: cText,
                                                 fontWeight: FontWeight.bold),
                                           ),
                                           SizedBox(
                                             height: 10,
                                           ),
                                         ],
                                       ),
                                     ),
                                   );
                                 });
                           } else {
                             showErrorDialog(results['message'], context);
                           }
                         }
                       }else{
                         showErrorDialog("عفوا يجب عليك تسجيل الدخول اولا", context);
                       }




                    },
                  ),
                ),
              ],
            ),
          ),
        )
      ],
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

    final appBar = AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Image.asset("assets/images/menu.png"),
          onPressed: () => Scaffold.of(context).openDrawer(),
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
      ),
      title: Container(

        child: Image.asset("assets/images/toplogo.png",height: _height*.07,),
      ),
    );

    return NetworkIndicator(
        child: PageContainer(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover)),
        child: Scaffold(
            key: _scaffoldKey, // ADD THIS LINE

            appBar: appBar,
            drawer: MainDrawer(),
            backgroundColor: Colors.transparent,
            body: Stack(
              children: <Widget>[

                _appState.currentUser!=null?( _appState.currentUser.userType=="user"?_buildBodyItem():(_appState.currentUser.userType=="driver"?_buildBodyItemDriver():_buildBodyItemMtger())):_buildBodyItem(),

                Center(
                  child: ProgressIndicatorComponent(),
                )
              ],
            )
        ),
      ),
    ));
  }
}


