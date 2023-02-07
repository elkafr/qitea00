import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qitea/components/app_repo/app_state.dart';
import 'package:qitea/components/app_repo/tab_state.dart';
import 'package:qitea/components/connectivity/network_indicator.dart';
import 'package:qitea/components/gradient_app_bar/gradient_app_bar.dart';
import 'package:qitea/components/not_registered/not_registered.dart';
import 'package:qitea/components/progress_indicator_component/progress_indicator_component.dart';
import 'package:qitea/components/safe_area/page_container.dart';
import 'package:qitea/locale/localization.dart';
import 'package:qitea/screens/orders/components/canceled_orders.dart';
import 'package:qitea/screens/orders/components/done_orders.dart';
import 'package:qitea/screens/orders/components/processing_orders.dart';
import 'package:qitea/components/MainDrawer.dart';
import 'package:qitea/utils/app_colors.dart';

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
 double _height=0,_width=0;


 Widget _buildBodyItem() {
    return  Consumer<AppState>(builder: (context, appState, child) {
       return  appState.currentUser != null
            ?  ListView(
      children: <Widget>[
        Container(
          height: _height - 40,
          child: TabBarView(
            children: [
              ProcessingOrders(),
              DoneOrders(),
            ],
          ),
        )
      ],
    ) :  NotRegistered();
    });
  }

  @override
  Widget build(BuildContext context) {
    _height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    _width = MediaQuery.of(context).size.width;
    TabState tabState = Provider.of<TabState>(context);
    AppState appState = Provider.of<AppState>(context);

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
      title:Text( AppLocalizations.of(context).orders,style: TextStyle(color: cBlack,fontSize: 15,fontWeight: FontWeight.bold),)
    );

    return  NetworkIndicator( child:PageContainer(
        child: DefaultTabController(
          initialIndex: tabState.initialIndex,
            length: 2,
            child: Scaffold(
                backgroundColor: Color(0xffF5F6F8),
                drawer: MainDrawer(),
          
          body: Stack(
            children: <Widget>[
              _buildBodyItem(),
              appState.currentUser != null?Positioned(
               top: 50,
               child:   Container(
                 margin: EdgeInsets.only(right: _width*.02,left: _width*.02),
                   decoration: BoxDecoration(
                       color: cPrimaryColor,
                       borderRadius: BorderRadius.circular(
                         6.0,
                       )),
                 width: _width*.95,
                      height: 40,
                  
                      child: TabBar(
                        indicator: BoxDecoration(
                            color: cLightLemon), //Ch
                        labelStyle: TextStyle(
                           color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            fontFamily: 'segoeui'),
                        unselectedLabelColor: cWhite,
                        unselectedLabelStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'segoeui'),
                        labelColor: Colors.white,
                        indicatorColor: Colors.white,
                        onTap: (index){

                          tabState.upadateInitialIndex(index);


                        },
                        tabs: [
                          Text(
                            "الحالية"
                          ),
                          Text("السابقة"),

                        ],
                      )),
             ):Text("")

            ,  Positioned(
                top: 0,
                left: 0,
                right: 0,
                child:appBar,
              ),
            
        
            ],
          ))),
    ));
  }
}
