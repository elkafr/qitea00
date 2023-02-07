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
import 'package:qitea/models/bank.dart';
import 'package:qitea/models/favourite_store.dart';
import 'package:qitea/models/store.dart';
import 'package:qitea/screens/banks/add_bank_screen.dart';
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

class BanksScreen extends StatefulWidget {
  @override
  _BanksScreenState createState() => _BanksScreenState();
}

class _BanksScreenState extends State<BanksScreen> {
  double _height=0, _width=0;
  Future<List<Bank>>? _banksList;
  Services _services = Services();
  StoreState? _storeState;
  AppState? _appState;
  NavigationState? _navigationState;


  bool _initialRun = true;
  ProgressIndicatorState? _progressIndicatorState;
  Future<List<Bank>> _getBanksList() async {
    Map<dynamic, dynamic> results = await _services.get(
        'https://qtaapp.com/api/getbank?page=1&lang=${_appState!.currentLang}&bank_user=${_appState!.currentUser.userId}');
    List<Bank> bankList = <Bank>[];
    if (results['response'] == '1') {
      Iterable iterable = results['bank'];
      bankList = iterable.map((model) => Bank.fromJson(model)).toList();
    } else {
      print('error');
    }
    return bankList;
  }

  Widget _buildStores() {
    return LayoutBuilder(builder: (context, constraints) {
      return   FutureBuilder<List<Bank>>(
        future: _banksList,
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
                                  Text("البنك :"),
                                  Text(snapshot.data![index].bankTitle!)
                                ],
                              ),

                              Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("اسم الحساب :"),
                                  Text(snapshot.data![index].bankName!)
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("رقم الحساب :"),
                                  Text(snapshot.data![index].bankAcount!)
                                ],
                              ),
                              Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("رقم الايبان :"),
                                  Text(snapshot.data![index].bankIban!)
                                ],
                              ),
                             SizedBox(height: 20,),

                             CustomButton(
                               btnColor: cLightLemon,
                               btnLbl: "حذف الحساب",
                               onPressedFunction: () async{
                                 _progressIndicatorState!.setIsLoading(true);
                                 var results = await _services.get(
                                     'https://qtaapp.com/api/do_delete_bank?id=${snapshot.data![index].bankId}&lang=${_appState!.currentLang}');
                                 _progressIndicatorState!.setIsLoading(false);
                                 if (results['response'] == '1') {
                                   showToast(results['message'], context);
                                   _banksList = _getBanksList();

                                 } else {
                                   showErrorDialog(results['message'], context);

                                 }


                               },
                             )
                            ],
                          ),



                        ],
                      ),
                    );
                  });
            } else {
              return NoData(
                message:  AppLocalizations.of(context)!.noResults,
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
        _banksList = _getBanksList();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    _width = MediaQuery.of(context).size.width;
    _storeState = Provider.of<StoreState>(context);
    _navigationState = Provider.of<NavigationState>(context);
    _progressIndicatorState = Provider.of<ProgressIndicatorState>(context);
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
                  appBarTitle: "الحسابات البنكية",

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
                              builder: (context) => AddBankScreen()));
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
