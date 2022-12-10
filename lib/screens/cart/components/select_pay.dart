


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qitea/components/buttons/custom_button.dart';
import 'package:qitea/components/dialogs/location_dialog.dart';
import 'package:qitea/models/category.dart';
import 'package:qitea/models/location.dart';
import 'package:qitea/utils/app_colors.dart';
import 'package:qitea/utils/app_colors.dart';


import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:qitea/screens/location/addLocation_screen.dart';
import 'package:provider/provider.dart';
import 'package:qitea/components/app_data/shared_preferences_helper.dart';
import 'package:qitea/components/app_repo/app_state.dart';
import 'package:qitea/components/connectivity/network_indicator.dart';
import 'package:qitea/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:qitea/components/gradient_app_bar/gradient_app_bar.dart';
import 'package:qitea/components/no_data/no_data.dart';
import 'package:qitea/components/safe_area/page_container.dart';
import 'package:qitea/locale/localization.dart';
import 'package:qitea/services/access_api.dart';
import 'package:qitea/utils/app_colors.dart';
import 'package:qitea/models/category.dart';
import 'package:qitea/models/store.dart';
import 'package:qitea/utils/utils.dart';
import 'package:qitea/components/app_repo/store_state.dart';
import 'package:qitea/components/store_card/store_card_item.dart';

import 'package:qitea/components/app_repo/progress_indicator_state.dart';
import 'package:qitea/components/progress_indicator_component/progress_indicator_component.dart';

class SelectPay extends StatefulWidget {
  const SelectPay({Key key}) : super(key: key);
  @override
  _SelectPayState createState() => _SelectPayState();
}

class _SelectPayState extends State<SelectPay> {
  Services _services = Services();
  Future<List<Location>> _locationList;
   AppState _appState;
  bool _initialRun = true;
  String _note;





  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialRun) {
      _initialRun = false;
      _appState = Provider.of<AppState>(context);


    }
  }



  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
          padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Container(
                height: 30,
                child: Image.asset('assets/images/bottomTop.png'),
              ),

             Container(
               padding: EdgeInsets.only(right: 20),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   Text("خيارات الدفع",style: TextStyle(color: cText,fontSize: 16,fontWeight: FontWeight.bold),),
                   Padding(padding: EdgeInsets.all(5)),
                   Text("اختار طريقة الدفع المناسبة لك",style: TextStyle(color: cHintColor,fontSize: 13),),
                 ],
               ),
             ),
              Padding(padding: EdgeInsets.all(8)),
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[

                  ListTile(
                    leading: Image.asset("assets/images/selectvisa.png"),
                    title: GestureDetector(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("البطاقة الائئتمانية",style: TextStyle(color: cText,fontSize: 15),),
                          Padding(padding: EdgeInsets.all(5)),
                          Text("الدفع بفيزا كارد - ماستر كارد - مدى",style: TextStyle(color: cHintColor,fontSize: 12),),
                        ],
                      ),
                      onTap: (){
                        setState(() {
                          _appState.setCurrentPayMethod("3");
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.02),
                    color: Color(0xffEFEFEF),
                    height: 1,
                  ),

                  ListTile(
                    leading: Image.asset("assets/images/selectwallet.png"),
                    title: GestureDetector(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("المحفظة",style: TextStyle(color: cText,fontSize: 15),),
                          Padding(padding: EdgeInsets.all(5)),
                          Text(_appState.currentUser.userCharge!=null?_appState.currentUser.userCharge:"0"+" ريال ",style: TextStyle(color: cHintColor,fontSize: 12),),
                        ],
                      ),
                      onTap: (){
                        setState(() {
                          _appState.setCurrentPayMethod("2");
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.02),
                    color: Color(0xffEFEFEF),
                    height: 1,
                  ),

                  ListTile(
                    leading: Image.asset("assets/images/selecthand.png"),
                    title: GestureDetector(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("عند الاستلام",style: TextStyle(color: cText,fontSize: 15),),
                          Padding(padding: EdgeInsets.all(5)),
                          Text("الدفع عند استلامك للطلب",style: TextStyle(color: cHintColor,fontSize: 12),),
                        ],
                      ),
                      onTap: (){
                        setState(() {
                          _appState.setCurrentPayMethod("1");
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),




                ],
              )


              ),




            ],
          ));
    });
  }
}
