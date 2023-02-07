import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:qitea/components/app_repo/app_state.dart';
import 'package:qitea/components/app_repo/store_state.dart';
import 'package:qitea/components/app_repo/store_state.dart';
import 'package:qitea/components/dialogs/response_alert_dialog.dart';
import 'package:qitea/screens/store/components/log_out_dialog.dart';
import 'package:qitea/services/access_api.dart';
import 'package:qitea/utils/app_colors.dart';

class StoreAppBar extends StatefulWidget {
  
  @override
  _StoreAppBarState createState() => _StoreAppBarState();
}

class _StoreAppBarState extends State<StoreAppBar> {
  bool _initialRun = true;
  AppState? _appState;
  StoreState? _storeState;
  Services _services = Services();




  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialRun) {
      _appState = Provider.of<AppState>(context);
      _storeState = Provider.of<StoreState>(context);
      _initialRun = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreState>(builder: (context, storeState, child) {
      return Stack(
        children: <Widget>[
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(


                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(500),
                    offset: Offset(0.0, 1.5),
                    blurRadius: 1.5,
                  ),
                ]),

            child: FittedBox(
                fit: BoxFit.cover,
                child: Image.network(
                  storeState.currentStore.mtgerPhoto1!,
                )),

          ),
          Positioned(
            right: 0,
            top: 27,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Image.asset("assets/images/back1.png"),
                  onPressed: () async{

                    
                       if(_storeState!.isAddToCart!=null){



                         var results = await _services.get(
                             'https://qtaapp.com/api/do_delete_cart?user_id=${_appState!.currentUser.userId}&lang=${_appState!.currentLang}');

                         if (results['response'] == '1') {


                         } else {


                         }


                         _storeState!.setCurrentIsAddToCart(null);
                         showDialog(
                             barrierDismissible: true,
                             context: context,
                             builder: (_) {
                               return LogoutDialog(
                                 alertMessage: "سوف يتم تفريغ سلة المشتريات عند خروجك من المتجر بدون تأكيد الطلب , تأكيد الحذف ؟",
                               );
                             });
                       }else{
                         Navigator.pushNamed(context, '/home1_screen');
                       }





                  },
                ),
                Text(storeState.currentStore.mtgerName!,
                    textAlign: TextAlign.center,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(6),
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*.03),
                  decoration: BoxDecoration(
                      color: cWhite,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.00),
                        topRight: Radius.circular(4.00),
                        bottomLeft: Radius.circular(4.00),
                        bottomRight: Radius.circular(4.00),
                      ),
                      border: Border.all(color: cPrimaryColor)),
                  child: Text(storeState.currentStore.state!),
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
