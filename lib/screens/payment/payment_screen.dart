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
import 'package:qitea/screens/banks/banks_screen.dart';
import 'package:qitea/services/access_api.dart';
import 'package:qitea/utils/app_colors.dart';
import 'package:qitea/utils/utils.dart';
import 'package:qitea/screens/auth/password_recovery_bottom_sheet.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:validators/validators.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  double _height=0;
  double _width=0;
  final _formKey = GlobalKey<FormState>();
  String? _reqValue;
  Services _services = Services();
  AppState? _appState;
  ProgressIndicatorState? _progressIndicatorState;

  late final WebViewController _controller;

  FocusNode? _focusNode;

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }




  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith("https://qtaapp.com/site/hyper?id="+_appState!.url!)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse("https://qtaapp.com/site/hyper?id="+_appState!.url!));

  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _focusNode!.dispose();
    super.dispose();
  }

  void _handleLoad(String value) {
    setState(() {

    });
  }






  @override
  Widget build(BuildContext context) {
    _height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    _width = MediaQuery.of(context).size.width;
    _progressIndicatorState = Provider.of<ProgressIndicatorState>(context);
    _appState = Provider.of<AppState>(context);
    return NetworkIndicator(
        child: PageContainer(
          child: Scaffold(
              backgroundColor: Color(0xffF5F6F8),
              body: Stack(
                children: <Widget>[
                  WebViewWidget(controller: _controller),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: GradientAppBar(
                      appBarTitle: "دفع الكتروني",
                      leading: _appState!.currentLang == 'ar'
                          ? IconButton(
                        icon: Image.asset('assets/images/back.png',color: cPrimaryColor,),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                          : Container(),
                      trailing: _appState!.currentLang == 'en'
                          ? IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: cWhite,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                          : Container(),
                    ),
                  ),
                ],
              ), ),
        ));
  }
}
