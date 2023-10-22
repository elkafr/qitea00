import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:qitea/components/app_repo/app_state.dart';
import 'package:qitea/components/connectivity/network_indicator.dart';
import 'package:qitea/components/dialogs/log_out_dialog.dart';
import 'package:qitea/components/gradient_app_bar/gradient_app_bar.dart';
import 'package:qitea/components/not_registered/not_registered.dart';
import 'package:qitea/components/safe_area/page_container.dart';
import 'package:qitea/locale/localization.dart';
import 'package:qitea/screens/account/about_screen.dart';
import 'package:qitea/screens/account/contact_with_us_screen.dart';
import 'package:qitea/screens/account/language_screen.dart';
import 'package:qitea/screens/account/terms_screen.dart';
import 'package:qitea/screens/req/req_screen.dart';
import 'package:qitea/screens/banks/banks_screen.dart';
import 'package:qitea/utils/app_colors.dart';
import 'dart:math' as math;
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
import 'package:share/share.dart';


class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  bool _initialRun = true;
double _height=0,_width=0;
AppState? _appState;
Services _services = Services();
String _facebookUrl = '',
    _instragramUrl = '',
    _linkedinUrl = '',
    _twitterUrl = '';

String _userCredit='';
String _userReq='';
String _userReqs='';

_launchURL(String url) async {
   launch(url);
}

Future<Null> _getSocialContact() async {
  var results = await _services.get(Utils.BASE_URL + 'social');

  if (results['response'] == '1') {
    _facebookUrl = results['setting_facebook'];
    _twitterUrl = results['setting_twitter'];
    _linkedinUrl = results['setting_linkedin'];
    _instragramUrl = results['setting_instigram'];
  } else {
    print('error');
  }
}



Future<Null> _getUserCredit() async {
  final response =
  await _services.get("https://qtaapp.com/api/get_user_credit?user_id=${_appState!.currentUser!.userId}");

  if (response['response'] == '1') {

   setState(() {
     _userCredit=response['user_credit'];
   });
  }

}

  Future<Null> _getUserReq() async {
    final response =
    await _services.get("https://qtaapp.com/api/get_user_credit?user_id=${_appState!.currentUser!.userId}");

    if (response['response'] == '1') {

      setState(() {
        _userReq =response['user_req'];
      });
    }

  }


  Future<Null> _getUserReqs() async {
    final response =
    await _services.get("https://qtaapp.com/api/get_user_credit?user_id=${_appState!.currentUser!.userId}");

    if (response['response'] == '1') {

      setState(() {
        _userReqs =response['user_reqs'];
      });
    }

  }


@override
void didChangeDependencies() {
  super.didChangeDependencies();
  if (_initialRun) {
    _initialRun = false;
    _appState = Provider.of<AppState>(context);
    _getUserCredit();
    _getUserReq();
    _getUserReqs();
  }
}
@override
void initState() {
  super.initState();

  _getSocialContact();

}

Widget _buildBodyItem(){
  return ListView(
    children: <Widget>[
      SizedBox(
        height: 50,
      ),

  _appState!.currentUser == null
  ?
  Container(
  alignment: Alignment.centerRight,
  padding: EdgeInsets.all(30),
  child: Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[
  Container(
  decoration: BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(50.0)),

  color: Colors.white,


  ),
  child: Image.asset("assets/images/logo.png",width: 70,height:70 ,),
  ),
  Padding(padding: EdgeInsets.all(7)),
  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[
  Padding(padding: EdgeInsets.all(4)),
  Text("زائر",style: TextStyle(color: cWhite,fontSize: 18)),
  Text("الحساب الشخصي",style: TextStyle(color: cWhite,fontSize: 16),),
  ],
  )
  ],
  ),
  )
      :Container(
  alignment: Alignment.centerRight,
  padding: EdgeInsets.all(18),
  child: Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[
  Consumer<AppState>(
  builder: (context,authProvider,child){
  return CircleAvatar(
  backgroundColor: cLightLemon,
  backgroundImage: NetworkImage(_appState!.currentUser!.userPhoto!=null?_appState!.currentUser!.userPhoto!:""),
  maxRadius: 40,
  );
  }
  ),
  Padding(padding: EdgeInsets.all(7)),
  Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  mainAxisAlignment: MainAxisAlignment.start,
  children: <Widget>[
  Padding(padding: EdgeInsets.all(4)),
  Text(_appState!.currentUser!.userName!,style: TextStyle(color: cPrimaryColor,fontSize: 20)),
    _appState!.currentUser!.userType=="user"?Text("الحساب الشخصي",style: TextStyle(color: cPrimaryColor,fontSize: 16),):Row(
      children: <Widget>[
        RatingBar.builder(
          initialRating:  double.parse(_appState!.currentUser!.userRate!),
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
          onRatingUpdate: (s){},
          ignoreGestures: true,

        ),

        Padding(padding: EdgeInsets.all(10)),

        Container(

  decoration: BoxDecoration(
    color: _appState!.currentUser!.userType=="driver"?cLightLemon:cPrimaryColor,
                borderRadius: BorderRadius.all(
                 const Radius.circular(15.00),
             ),
 ),
          padding: EdgeInsets.only(right: 11,left: 11,top: 6,bottom: 6),
          child: Text(_appState!.currentUser!.userType=="driver"?"مندوب":"تاجر",style: TextStyle(color: Colors.white,fontSize: 15),),

        )
      ],
    ),
  ],
  )
  ],
  ),
  ),


      Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(_width*.04),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Color(0xffEBEBEB)),
          color: cWhite,
          borderRadius: BorderRadius.circular(
            6.0,
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 12.0, // has the effect of softening the shadow
              spreadRadius: 5.0, // has the effect of extending the shadow

            )
          ],

        ),
        child: Column(
          children: <Widget>[

            Container(
              child: ListTile(
                leading:Image.asset("assets/images/cart.png"),
                title: Text("اجمالى عدد الطلبات",
                  style: TextStyle(
                      color: cPrimaryColor,fontSize: 15
                  ), ),
                trailing: Text(_appState!.currentUser!.userNumberOfCartts!,
                  style: TextStyle(
                      color: cPrimaryColor,fontSize: 15
                  ), ),
                onTap: (){

                },
              ),
            ),
            _appState!.currentUser!.userType!="user"?Divider(height: 1,):Text("",style: TextStyle(height: 0),),
            _appState!.currentUser!.userType!="user"?Container(
              child: ListTile(
                leading:Image.asset("assets/images/wallet.png"),
                title: Text("اجمالى المبالغ المترتبة",
                  style: TextStyle(
                      color: cPrimaryColor,fontSize: 15
                  ), ),
                trailing: Text(_userCredit,
                  style: TextStyle(
                      color: cPrimaryColor,fontSize: 15
                  ), ),
                onTap: (){

                },
              ),
            ):Text("",style: TextStyle(height: 0),),
            _appState!.currentUser!.userType!="user"?Divider(height: 1,):Text("",style: TextStyle(height: 0),),
            _appState!.currentUser!.userType!="user"?Container(
              child: ListTile(
                leading:Image.asset("assets/images/wallet.png"),
                title: Text("اجمالى المبالغ المدفوعة",
                  style: TextStyle(
                      color: cPrimaryColor,fontSize: 15
                  ), ),
                trailing: Text(_userReq,
                  style: TextStyle(
                      color: cPrimaryColor,fontSize: 15
                  ), ),
                onTap: (){

                },
              ),
            ):Text("",style: TextStyle(height: 0),),
            _appState!.currentUser!.userType!="user"?Divider(height: 1,):Text("",style: TextStyle(height: 0),),
            _appState!.currentUser!.userType!="user"?Container(
              child: ListTile(
                leading:Image.asset("assets/images/transfer.png"),
                title: Text("طلبات التحويل",
                  style: TextStyle(
                      color: cPrimaryColor,fontSize: 15
                  ), ),
                trailing: Text(_userReqs,
                  style: TextStyle(
                      color: cPrimaryColor,fontSize: 15
                  ), ),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReqScreen()));
                },
              ),
            ):Text("",style: TextStyle(height: 0),),
            _appState!.currentUser!.userType!="user"?Divider(height: 1,):Text("",style: TextStyle(height: 0),),
            _appState!.currentUser!.userType!="user"?Container(
              child: ListTile(
                leading:Image.asset("assets/images/card.png"),
                title: Text("حسابي البنكي",
                  style: TextStyle(
                      color: cPrimaryColor,fontSize: 15
                  ), ),

                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BanksScreen()));
                },
              ),
            ):Text("",style: TextStyle(height: 0),),
            Divider(height: 1,),
            Container(
              child: ListTile(
                leading:Image.asset("assets/images/contact.png",color: cPrimaryColor,),
                title: Text("اتصل بنا",
                  style: TextStyle(
                      color: cPrimaryColor,fontSize: 15
                  ), ),

                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ContactWithUsScreen()));
                },
              ),
            ),
            Divider(height: 1,),
            Container(
              child: ListTile(
                leading:Image.asset("assets/images/share.png",color: cPrimaryColor,),
                title: Text("شارك التطبيق",
                  style: TextStyle(
                      color: cPrimaryColor,fontSize: 15
                  ), ),

                onTap: (){
                  Share.share("https://play.google.com/store/apps/details?id=com.omar.qitea",
                    subject: "اعجبنى تطبيق قطعة غيار وانصحك به",
                  );
                },
              ),
            ),


            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: _width * 0.1, vertical: _height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        _launchURL(_twitterUrl);
                      },
                      child: Image.asset(
                        'assets/images/twitter.png',

                      )),
                  GestureDetector(
                      onTap: () {
                        _launchURL(_linkedinUrl);
                      },
                      child: Image.asset(
                        'assets/images/linkedin.png',

                      )),
                  GestureDetector(
                      onTap: () {
                        _launchURL(_instragramUrl);
                      },
                      child: Image.asset(
                        'assets/images/instagram.png',
                      )),
                  GestureDetector(
                      onTap: () {
                        _launchURL("https://api.whatsapp.com/send?phone="+_facebookUrl);
                      },
                      child: Image.asset(
                        'assets/images/facebook.png',

                      )),
                ],
              ),
            ),

          ],
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

    return  NetworkIndicator( child:PageContainer(
      child: Scaffold(
          backgroundColor: Color(0xffF5F6F8),          body: Stack(
            children: <Widget>[
              _appState!.currentUser != null?_buildBodyItem():NotRegistered() ,
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: GradientAppBar(
                  appBarTitle:  AppLocalizations.of(context)!.account,
trailing: _appState!.currentUser != null?Container(
  padding: EdgeInsets.only(left: _width*.06,top: _width*.03),
  child: Row(
    children: <Widget>[
      GestureDetector(
        child: Icon(FontAwesomeIcons.edit,color: cPrimaryColor,),
        onTap: (){
          Navigator.pushNamed(context, '/personal_information_screen');
        },
      ),
      Padding(padding: EdgeInsets.all(13)),
      GestureDetector(
        child: Icon(
          FontAwesomeIcons.signInAlt,
          color: cPrimaryColor,
          size: 25,
        ),
        onTap: (){
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (_) {
                return LogoutDialog(
                  alertMessage: AppLocalizations.of(context)!.wantToLogout,
                );
              });
        },
      )
    ],
  ),
):Text(""),

                ),
              ),

            ],
          )),
    ));
  }
}