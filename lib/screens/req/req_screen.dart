import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:qitea/components/app_repo/app_state.dart';
import 'package:qitea/components/app_repo/navigation_state.dart';
import 'package:qitea/components/app_repo/progress_indicator_state.dart';
import 'package:qitea/components/app_repo/store_state.dart';
import 'package:qitea/components/connectivity/network_indicator.dart';
import 'package:qitea/components/gradient_app_bar/gradient_app_bar.dart';
import 'package:qitea/components/no_data/no_data.dart';
import 'package:qitea/components/not_registered/not_registered.dart';
import 'package:qitea/components/progress_indicator_component/progress_indicator_component.dart';
import 'package:qitea/components/safe_area/page_container.dart';
import 'package:qitea/components/store_card/store_card_item.dart';
import 'package:qitea/locale/localization.dart';
import 'package:qitea/models/req.dart';
import 'package:qitea/models/favourite_store.dart';
import 'package:qitea/models/store.dart';
import 'package:qitea/screens/req/add_req_screen.dart';
import 'package:qitea/screens/favourite/components/favourite_store_item.dart';
import 'package:qitea/services/access_api.dart';
import 'package:qitea/utils/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
import 'package:qitea/locale/localization.dart';
import 'package:qitea/models/user.dart';
import 'package:qitea/services/access_api.dart';
import 'package:qitea/utils/app_colors.dart';
import 'package:qitea/utils/utils.dart';
import 'package:qitea/screens/auth/password_recovery_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:validators/validators.dart';

class ReqScreen extends StatefulWidget {
  @override
  _ReqScreenState createState() => _ReqScreenState();
}

class _ReqScreenState extends State<ReqScreen> {
  double _height=0, _width=0;
  Future<List<Req>>? _reqList;
  Services _services = Services();
  StoreState? _storeState;
  AppState? _appState;
  bool _initialRun = true;
  NavigationState? _navigationState;
  ProgressIndicatorState? _progressIndicatorState;
  Future<List<Req>> _getReqList() async {
    Map<dynamic, dynamic> results = await _services.get(
        'https://qtaapp.com/api/getreq?page=1&lang=${_appState!.currentLang}&req_user=${_appState!.currentUser.userId}');
    List<Req> reqList = <Req>[];
    if (results['response'] == '1') {
      Iterable iterable = results['req'];
      reqList = iterable.map((model) => Req.fromJson(model)).toList();
    } else {
      print('error');
    }
    return reqList;
  }

  Widget _buildStores() {
    return LayoutBuilder(builder: (context, constraints) {
      return   FutureBuilder<List<Req>>(
        future: _reqList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.length > 0) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: _width,
                      padding: EdgeInsets.all(15),

                      margin:
                      EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                      decoration: BoxDecoration(
                        color:   Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Color(0xffF9F9F9),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(300),
                            blurRadius: 7.0, // has the effect of softening the shadow
                            spreadRadius: 3.0, // has the effect of extending the shadow

                          )
                        ],
                      ),
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("تاريخ الطلب :"),
                                  Text(snapshot.data![index].reqDate!)
                                ],
                              ),

                              Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("المبلغ :"),
                                  Text(snapshot.data![index].reqValue!+" SR ")
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("حالة الطلب :"),
                                  Text(snapshot.data![index].reqDone=="0"?"لم يتم التاكيد":"تم التاكيد")
                                ],
                              ),


                             SizedBox(height: 20,),
                              snapshot.data![index].reqDone=="0"?CustomButton(
                               btnColor: cLightLemon,
                               btnLbl: "حذف الطلب",
                               onPressedFunction: () async{
                                 _progressIndicatorState!.setIsLoading(true);
                                 var results = await _services.get(
                                     'https://qtaapp.com/api/do_delete_req?id=${snapshot.data![index].reqId}&lang=${_appState!.currentLang}');
                                 _progressIndicatorState!.setIsLoading(false);
                                 if (results['response'] == '1') {
                                   showToast(results['message'], context);
                                   _reqList = _getReqList();

                                 } else {
                                   showErrorDialog(results['message'], context);

                                 }


                               },
                             ):Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("صورة التحويل :"),
                                  Image.network(snapshot.data![index].reqPhoto!,width: _width*.55,)
                                ],
                              )
                            ],
                          ),



                        ],
                      ),
                    );
                  });
            } else {
              return NoData(
                message:  AppLocalizations.of(context).noResults,
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
        },
      ); 
    });
  }

  Widget _buildBodyItem() {
    return  Consumer<AppState>(builder: (context, appState, child) {
       return  appState.currentUser != null
            ? ListView(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Container(
            // margin: EdgeInsets.only(top: 7, bottom: 20),
            height: _height - 100,
            child: _buildStores())
      ],
    ) : NotRegistered();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialRun) {
      _initialRun = false;
      _appState = Provider.of<AppState>(context);
      if (_appState!.currentUser != null) {
        _reqList = _getReqList();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    _width = MediaQuery.of(context).size.width;
    _storeState = Provider.of<StoreState>(context);
    _progressIndicatorState = Provider.of<ProgressIndicatorState>(context);
    _navigationState = Provider.of<NavigationState>(context);
    return  NetworkIndicator( child:PageContainer(
      child: Scaffold(
          backgroundColor: Color(0xffF5F2F2),
          body: Stack(
            children: <Widget>[
              _buildBodyItem(),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: GradientAppBar(
                  appBarTitle: "طلبات التحويل",

                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: cBlack,
                    ),
                    onPressed: () {
                      _navigationState!.upadateNavigationIndex(3);
                      Navigator.pushReplacementNamed(context, '/navigation');
                    },
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: cPrimaryColor,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddReqScreen()));
                    },
                  ),
                ),
              ),
              Center(
                child: ProgressIndicatorComponent(),
              )
            ],
          )),
    ));
  }
}
