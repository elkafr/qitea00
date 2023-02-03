import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qitea/components/app_repo/chat_state.dart';
import 'package:qitea/components/app_repo/location_state.dart';
import 'package:provider/provider.dart';
import 'package:qitea/components/app_data/shared_preferences_helper.dart';
import 'package:qitea/components/app_repo/app_state.dart';
import 'package:qitea/components/app_repo/navigation_state.dart';
import 'package:qitea/components/app_repo/order_state.dart';
import 'package:qitea/components/app_repo/product_state.dart';
import 'package:qitea/components/app_repo/progress_indicator_state.dart';
import 'package:qitea/components/app_repo/tab_state.dart';
import 'package:qitea/locale/Locale_helper.dart';
import 'package:qitea/locale/localization.dart';
import 'package:qitea/screens/auth/password_recovery_screen.dart';
import 'package:qitea/screens/bottom_navigation.dart/bottom_navigation_bar.dart';
import 'package:qitea/theme/style.dart';
import 'package:qitea/components/app_repo/store_state.dart';
import 'package:qitea/utils/routes.dart';
import 'package:qitea/screens/product/product_screen.dart';

void main() => runApp(

    // DevicePreview(
    //   builder: (context) => MyApp(),
    // ));
    MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   SpecificLocalizationDelegate _specificLocalizationDelegate;

  onLocaleChange(Locale locale) {
    setState(() {
      _specificLocalizationDelegate = new SpecificLocalizationDelegate(locale);
    });
  }

  Future<void> _getLanguage() async {
    String language = await SharedPreferencesHelper.getUserLang();
    onLocaleChange(Locale(language));
  }

  @override
  void initState() {
    super.initState();

    helper.onLocaleChanged = onLocaleChange;
    _specificLocalizationDelegate =
        SpecificLocalizationDelegate(new Locale('ar'));
   _getLanguage();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return
        // add multiprovider
        MultiProvider(
            providers: [
          ChangeNotifierProvider(create: (_) => ProgressIndicatorState()),
          ChangeNotifierProvider(
            create: (_) => AppState(),
          ),
          ChangeNotifierProvider(create: (_) => NavigationState()),
          ChangeNotifierProvider(create: (_) => ChatState()),
          ChangeNotifierProvider(create: (_) => StoreState()),
          ChangeNotifierProvider(create: (_) => ProductState()),
          ChangeNotifierProvider(create: (_)=> TabState()),
           ChangeNotifierProvider(create: (_)=> OrderState()),
           ChangeNotifierProvider(create: (_)=> LocationState()),
        ],
            child: MaterialApp(
                //   builder: DevicePreview.appBuilder,
                localizationsDelegates: [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  _specificLocalizationDelegate,
                  GlobalCupertinoLocalizations.delegate,
                  DefaultCupertinoLocalizations.delegate,
                ],
                supportedLocales: [
                  Locale('en'),
                  Locale('ar')
                ],
                locale: _specificLocalizationDelegate.overriddenLocale,
                debugShowCheckedModeBanner: false,
                title: 'قطعة غيار',
                theme: themeData(),
               routes: routes
                ));
  }
}
