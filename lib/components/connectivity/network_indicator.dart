import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:qitea/locale/localization.dart';

class NetworkIndicator extends StatefulWidget {
  final Widget? child;
  const NetworkIndicator({this.child});
  @override
  _NetworkIndicatorState createState() => _NetworkIndicatorState();
}

class _NetworkIndicatorState extends State<NetworkIndicator> {
  Widget _buildBodyItem(double height) {
    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: height * 0.2,
            ),
            Icon(
              Icons.signal_wifi_off,
              size: height * 0.25,
              color: Colors.grey[400],
            ),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  AppLocalizations.of(context)!.sorryNoInternet,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'segoeui',
                      fontWeight: FontWeight.w400),
                )),
            Container(
                margin: EdgeInsets.only(top: height * 0.025),
                child: Text(
                  AppLocalizations.of(context)!.scanRouter,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[400],
                      fontFamily: 'segoeui',
                      fontWeight: FontWeight.w400),
                )),
            Container(
                margin: EdgeInsets.only(top: height * 0.025),
                child: Text(
                  AppLocalizations.of(context)!.reconnectInternet,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[400],
                      fontFamily: 'segoeui',
                      fontWeight: FontWeight.w400),
                )),
            Container(
                height: height * 0.09,
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.25,
                    vertical: height * 0.02),
                child: Builder(
                    builder: (context) => TextButton(
                          onPressed: () {},


                          child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                AppLocalizations.of(context)!.updateScreen,
                                style: TextStyle(
                                    fontFamily: 'segoeui',
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20.0),
                              )),
                        )))
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        if (connectivity == ConnectivityResult.none) {
          final appBar = AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: Text(
                AppLocalizations.of(context)!.aouonTuraif,
                style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontFamily: 'segoeui',
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              centerTitle: true,
              actions: <Widget>[]);
          final height = MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top;
          return Scaffold(
            appBar: appBar,
            body: _buildBodyItem(height),
          );
        } else {
          return child;
        }
      },
      builder: (BuildContext context) {
        return widget!.child!;
      },
    );
  }
}
