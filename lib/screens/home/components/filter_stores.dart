


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qitea/components/buttons/custom_button.dart';
import 'package:qitea/components/dialogs/location_dialog.dart';
import 'package:qitea/models/category.dart';
import 'package:qitea/models/location.dart';
import 'package:qitea/utils/app_colors.dart';
import 'package:qitea/utils/app_colors.dart';
import 'package:qitea/components/app_repo/progress_indicator_state.dart';

import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qitea/screens/home/components/home_appbar.dart';
import 'package:qitea/screens/home/home1_screen.dart';
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
import 'package:qitea/screens/home/components/slider_images.dart';
import 'package:qitea/screens/home/components/category_item1.dart';
import 'package:qitea/components/app_repo/progress_indicator_state.dart';
import 'package:qitea/components/progress_indicator_component/progress_indicator_component.dart';

class FilterStores extends StatefulWidget {
  const FilterStores({Key key}) : super(key: key);
  @override
  _FilterStoresState createState() => _FilterStoresState();
}

class _FilterStoresState extends State<FilterStores> {
  Services _services = Services();
  Future<List<Location>> _locationList;
   AppState _appState;
   ProgressIndicatorState _progressIndicatorState;
  bool _initialRun = true;







  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialRun) {
      _initialRun = false;
      _appState = Provider.of<AppState>(context);
      _progressIndicatorState = Provider.of<ProgressIndicatorState>(context);

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
                   Text("الفرز حسب",style: TextStyle(color: cText,fontSize: 16,fontWeight: FontWeight.bold),),
                   Padding(padding: EdgeInsets.all(5)),
                   Text("إختر نوع الفرز المناسب لك",style: TextStyle(color: cHintColor,fontSize: 13),),
                 ],
               ),
             ),
              Padding(padding: EdgeInsets.all(8)),
              Expanded(child: Column(
                children: <Widget>[

                  ListTile(
                    title: GestureDetector(
                      child: Text("الكل"),
                      onTap: (){

                        _appState.setCurrentFilter(1);
                       Navigator.pop(context);
                        Navigator.pushReplacementNamed(
                            context, '/home1_screen');

                      },
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.01),
                    color: Color(0xffEFEFEF),
                    height: 1,
                  ),

                  ListTile(
                    title: GestureDetector(
                      child: Text("ابجديا"),
                      onTap: (){
                        _appState.setCurrentFilter(2);
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(
                            context, '/home1_screen');

                      },
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.01),
                    color: Color(0xffEFEFEF),
                    height: 1,
                  ),
                  ListTile(
                    title: GestureDetector(
                      child: Text("الاعلى تقييما"),
                      onTap: (){
                        _appState.setCurrentFilter(3);
                        Navigator.pop(context);

                        Navigator.pushReplacementNamed(
                            context, '/home1_screen');


                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.01),
                    color: Color(0xffEFEFEF),
                    height: 1,
                  ),

                  ListTile(
                    title: GestureDetector(
                      child: Text("الاقرب اليك"),
                      onTap: (){
                        _appState.setCurrentFilter(4);
                        Navigator.pop(context);

                        Navigator.pushReplacementNamed(
                            context, '/home1_screen');


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
