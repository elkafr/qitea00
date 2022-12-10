
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:qitea/components/app_repo/app_state.dart';
import 'package:qitea/components/app_repo/navigation_state.dart';
import 'package:qitea/components/app_repo/order_state.dart';
import 'package:qitea/components/app_repo/progress_indicator_state.dart';
import 'package:qitea/components/app_repo/tab_state.dart';
import 'package:qitea/components/buttons/custom_button.dart';
import 'package:qitea/components/connectivity/network_indicator.dart';
import 'package:qitea/components/gradient_app_bar/gradient_app_bar.dart';
import 'package:qitea/components/response_handling/response_handling.dart';
import 'package:qitea/components/safe_area/page_container.dart';
import 'package:qitea/locale/localization.dart';
import 'package:qitea/models/order.dart';
import 'package:qitea/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:qitea/screens/orders/components/cancel_order_bottom_sheet.dart';
import 'package:qitea/services/access_api.dart';
import 'package:qitea/utils/app_colors.dart';
import 'dart:math' as math;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:qitea/components/app_repo/app_state.dart';
import 'package:qitea/components/custom_text_form_field/validation_mixin.dart';
import 'package:qitea/components/app_repo/navigation_state.dart';
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
import 'package:qitea/models/city.dart';
import 'package:qitea/models/user.dart';
import 'package:qitea/screens/account/terms_screen.dart';
import 'package:qitea/services/access_api.dart';
import 'package:qitea/utils/app_colors.dart';
import 'package:validators/validators.dart';
import 'package:qitea/components/drop_down_list_selector/drop_down_list_selector.dart';
import 'package:gesture_zoom_box/gesture_zoom_box.dart';

class MtgerOrderDetailsScreen extends StatefulWidget {



  @override
  _MtgerOrderDetailsScreenState createState() => _MtgerOrderDetailsScreenState();
}

class _MtgerOrderDetailsScreenState extends State<MtgerOrderDetailsScreen> {
  bool _initialRun = true;
  OrderState _orderState;
  double _height, _width;
  Services _services = Services();
  ProgressIndicatorState _progressIndicatorState;
  AppState _appState;
  TabState _tabState;
  NavigationState _navigationState;
  Future<Order> _orderDetails;
  final _formKey = GlobalKey<FormState>();

  int _offerType;
  String _requestPrice1, _requestPrice2, _requestPrice3;
  String _requestLabel1, _requestLabel2, _requestLabel3;
  String  _requestPrice1Offer1, _requestPrice1Offer2, _requestPrice1Offer3,_requestPrice1Label1,_requestPrice1Label2,_requestPrice1Label3;
  String  _requestPrice2Offer1, _requestPrice2Offer2, _requestPrice2Offer3,_requestPrice2Label1,_requestPrice2Label2,_requestPrice2Label3;
  String  _requestPrice3Offer1, _requestPrice3Offer2, _requestPrice3Offer3,_requestPrice3Label1,_requestPrice3Label2,_requestPrice3Label3;

  Future<Order> _getOrderDetails() async {
    Map<String, dynamic> results = await _services.get(
        'https://qtaapp.com/api/show_buy?lang=${_appState.currentLang}&user_id=${_appState.currentUser.userId}&cartt_id=${_orderState.carttId}');
    Order orderDetails = Order();
    if (results['response'] == '1') {
      orderDetails = Order.fromJson(results['result']);
    } else {
      print('error');
    }
    return orderDetails;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialRun) {
      _initialRun = false;
      _appState = Provider.of<AppState>(context);
      _appState.setCurrentTabb(0);
      _orderState = Provider.of<OrderState>(context);
      _orderDetails = _getOrderDetails();
    }
  }


  Widget _buildBodyItem(Order order) {
    return SingleChildScrollView(
      child:  Column(
        children: <Widget>[
          SizedBox(
            height: 60,
          ),


          Container(
            height: _height*.07,
            padding: EdgeInsets.all(15),
            alignment: Alignment.centerRight,

            decoration: BoxDecoration(
                color: cWhite,
                borderRadius: BorderRadius.all(
                  const Radius.circular(10.00),
                ),
                border: Border.all(color: cWhite)
            ),
            margin: EdgeInsets.only(
                left: _width * 0.03,
                right:_width * 0.03,
                bottom:_width * 0.025),
            child: Text(
              " حالة الطلب : "+order.carttState,
              style: TextStyle(
                fontSize: 14,
                color: cOmarColor,
              ),
            ),
          ),


          Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(
                  left: _width * 0.03,
                  right:_width * 0.03,
                  bottom:_width * 0.09),
              height: order.carttNumber=="1"?_height*.47:(order.carttNumber=="2"?_height*.70:_height*.94),
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Color(0xffEBEBEB)),
                color: cWhite,
                borderRadius: BorderRadius.circular(
                  6.0,
                ),

                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300],
                    blurRadius: 12.0, // has the effect of softening the shadow
                    spreadRadius: 5.0, // has the effect of extending the shadow

                  )
                ],

              ),
              child: Row(
                children: <Widget>[




                  SingleChildScrollView(
                    child:        Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Container(
                          width: _width*.85,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal:_width * 0.04,
                                    vertical: _height * 0.01),
                                child: Text(
                                  order.carttMarkaName,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: cOmarColor,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),

                              Container(
                                width: _width * 0.38,
                                margin: EdgeInsets.symmetric(
                                    horizontal: _width* 0.04,
                                    vertical: _height * 0.01),
                                child: Text(
                                  " رقم الطلب : "+order.carttId,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cOmarColor,

                                  ),
                                ),
                              )
                            ],
                          ),
                        ),



                        Container(
                          width: _width*.85,
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal:_width * 0.04,
                                    vertical: _height * 0.01),
                                child: Text(
                                  order.carttTypeeName,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: cOmarColor,

                                  ),
                                ),
                              ),

                              Container(
                                width: _width * 0.38,
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.symmetric(
                                    horizontal: _width* 0.04,
                                    vertical: _height * 0.01),
                                child: Text(
                                  " تاريخ الطلب : "+order.carttDate,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cOmarColor,
                                  ),
                                ),
                              ),



                            ],
                          ),
                        ),





                        Container(
                          width: _width*.85,
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: _width * 0.04,
                                    vertical: _width * 0.01),
                                child: Text(
                                  " موديل : "+order.carttModelName,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: cOmarColor,

                                  ),
                                ),
                              ),

                              Container(
                                width: _width * 0.38,
                                alignment: Alignment.centerRight,
                                margin: EdgeInsets.symmetric(
                                    horizontal: _width * 0.04,
                                    vertical: _height * 0.01),
                                child: Text(
                                  " عدد القطع : "+order.carttNumber,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: cOmarColor,
                                  ),
                                ),
                              )



                            ],
                          ),
                        ),


                        Container(
                          width: _width*.85,
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: _width * 0.04,
                                    vertical: _height * 0.01),
                                child: Text(
                                  " رقم الهيكل : "+order.carttHikal,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: cLightLemon,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),



                            ],
                          ),
                        ),



                        Container(
                          width: _width * 0.38,

                          alignment: Alignment.centerRight,

                          decoration: BoxDecoration(
                              color: cWhite,
                              borderRadius: BorderRadius.all(
                                const Radius.circular(10.00),
                              ),
                              border: Border.all(color: cWhite)
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: _width * 0.04,
                              vertical: _width * 0.01),
                          child: Text(
                            " وصف الطلب ",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: cOmarColor,
                            ),
                          ),
                        ),



                        Container(
                          width: _width * 0.38,
                          alignment: Alignment.centerRight,

                          decoration: BoxDecoration(
                              color: cWhite,
                              borderRadius: BorderRadius.all(
                                const Radius.circular(10.00),
                              ),
                              border: Border.all(color: cWhite)
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: _width * 0.04,
                              vertical: _width * 0.01),
                          child: Text(
                            " القطعة 1 : ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: cOmarColor,
                            ),
                          ),
                        ),

                        Container(
                          width: _width * 0.80,
                          alignment: Alignment.centerRight,

                          decoration: BoxDecoration(
                              color: cWhite,
                              borderRadius: BorderRadius.all(
                                const Radius.circular(10.00),
                              ),
                              border: Border.all(color: cWhite)
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: _width * 0.04,
                              vertical: _width * 0.01),
                          child: Text(
                            order.carttDetails1,
                            style: TextStyle(
                              fontSize: 13,
                              color: cOmarColor,
                            ),
                          ),
                        ),

                        Container(
                          width: _width * 0.80,
                          alignment: Alignment.centerRight,

                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.all(
                                const Radius.circular(10.00),
                              ),
                              border: Border.all(color: cWhite)
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: _width * 0.04,
                              vertical: _width * 0.01),
                          child: GestureDetector(
                            onTap: (){
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20.0)), //this right here
                                      child: Container(

                                        child: GestureZoomBox(
                                          maxScale: 5.0,
                                          doubleTapScale: 2.0,
                                          duration: Duration(milliseconds: 200),
                                          onPressed: () => Navigator.pop(context),
                                          child: Image.network(order.carttPhoto1,height: _height,width: _width,fit: BoxFit.fill,),
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Image.network(order.carttPhoto1,height: _height*.15,width: _width,fit: BoxFit.fitWidth,),
                          ),
                        ),









                        order.carttNumber=="2" || order.carttNumber=="3"?Container(
                          width: _width * 0.38,
                          alignment: Alignment.centerRight,

                          decoration: BoxDecoration(
                              color: cWhite,
                              borderRadius: BorderRadius.all(
                                const Radius.circular(10.00),
                              ),
                              border: Border.all(color: cWhite)
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: _width * 0.04,
                              vertical: _width * 0.01),
                          child: Text(
                            " القطعة 2 : ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: cOmarColor,
                            ),
                          ),
                        ):Text("",style: TextStyle(height: 0),),

                        order.carttNumber=="2" || order.carttNumber=="3"?Container(
                          width: _width * 0.80,
                          alignment: Alignment.centerRight,

                          decoration: BoxDecoration(
                              color: cWhite,
                              borderRadius: BorderRadius.all(
                                const Radius.circular(10.00),
                              ),
                              border: Border.all(color: cWhite)
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: _width * 0.04,
                              vertical: _width * 0.01),
                          child: Text(
                            order.carttDetails2,
                            style: TextStyle(
                              fontSize: 13,
                              color: cOmarColor,
                            ),
                          ),
                        ):Text("",style: TextStyle(height: 0),),

                        order.carttNumber=="2" || order.carttNumber=="3"?Container(
                          width: _width * 0.80,
                          alignment: Alignment.centerRight,

                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.all(
                                const Radius.circular(10.00),
                              ),
                              border: Border.all(color: cWhite)
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: _width * 0.04,
                              vertical: _width * 0.01),
                          child: GestureDetector(
                            onTap: (){
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20.0)), //this right here
                                      child: Container(

                                        child: GestureZoomBox(
                                          maxScale: 5.0,
                                          doubleTapScale: 2.0,
                                          duration: Duration(milliseconds: 200),
                                          onPressed: () => Navigator.pop(context),
                                          child: Image.network(order.carttPhoto2,height: _height,width: _width,fit: BoxFit.fill,),
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Image.network(order.carttPhoto2,height: _height*.15,width: _width,fit: BoxFit.fitWidth,),
                          ),
                        ):Text("",style: TextStyle(height: 0),),















                        order.carttNumber=="3"?Container(
                          width: _width * 0.38,
                          alignment: Alignment.centerRight,

                          decoration: BoxDecoration(
                              color: cWhite,
                              borderRadius: BorderRadius.all(
                                const Radius.circular(10.00),
                              ),
                              border: Border.all(color: cWhite)
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: _width * 0.04,
                              vertical: _width * 0.01),
                          child: Text(
                            " القطعة 3 : ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: cOmarColor,
                            ),
                          ),
                        ):Text("",style: TextStyle(height: 0),),

                        order.carttNumber=="3"?Container(
                          width: _width * 0.80,
                          alignment: Alignment.centerRight,

                          decoration: BoxDecoration(
                              color: cWhite,
                              borderRadius: BorderRadius.all(
                                const Radius.circular(10.00),
                              ),
                              border: Border.all(color: cWhite)
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: _width * 0.04,
                              vertical: _width * 0.01),
                          child: Text(
                            order.carttDetails3,
                            style: TextStyle(
                              fontSize: 13,
                              color: cOmarColor,
                            ),
                          ),
                        ):Text("",style: TextStyle(height: 0),),

                        order.carttNumber=="3"?Container(
                          width: _width * 0.80,
                          alignment: Alignment.centerRight,

                          decoration: BoxDecoration(

                              borderRadius: BorderRadius.all(
                                const Radius.circular(10.00),
                              ),
                              border: Border.all(color: cWhite)
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: _width * 0.04,
                              vertical: _width * 0.01),
                          child: GestureDetector(
                            onTap: (){
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(20.0)), //this right here
                                      child: Container(

                                        child: GestureZoomBox(
                                          maxScale: 5.0,
                                          doubleTapScale: 2.0,
                                          duration: Duration(milliseconds: 200),
                                          onPressed: () => Navigator.pop(context),
                                          child: Image.network(order.carttPhoto3,height: _height,width: _width,fit: BoxFit.fill,),
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Image.network(order.carttPhoto3,height: _height*.15,width: _width,fit: BoxFit.fitWidth,),
                          ),
                        ):Text("",style: TextStyle(height: 0),),


                      ],
                    ),
                  ),










                ],
              )),





          order.carttDone==0 || order.carttDone==1?Form(
        key: _formKey,
          child:Container(

              margin: EdgeInsets.only(
                  left: _width * 0.03,
                  right:_width * 0.03,
                  bottom:_width * 0.09),



              child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,

                  child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("ادخل عرض السعر",style: TextStyle(color: cOmarColor,fontSize: 15),),
                          Container(
                            width: _width*.6,
                            child: TabBar(
                                onTap: (index) {
                                  print(index);
                                  _offerType=index;
                                  _appState.setCurrentTabb(index);
                                },
                                tabs: [
                              Tab(child: Container(
                                decoration: BoxDecoration(
                                  color: _appState.tabb==0?cLightLemon:cWhite,
                                  border: Border.all(
                                    color: Color(0xffF9F9F9),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 25.0, // has the effect of softening the shadow
                                      spreadRadius: 5.0, // has the effect of extending the shadow

                                    )
                                  ],
                                ),
                                child: Text("مفرد",style: TextStyle(fontSize: 16,color: cBlack),),

                                padding: EdgeInsets.all(4),
                                width: _width,
                                alignment: Alignment.center,

                              ),

                              ),
                              Tab(child: Container(

                                decoration: BoxDecoration(
                                  color: _appState.tabb==1?cLightLemon:cWhite,
                                  border: Border.all(
                                    color: Color(0xffF9F9F9),
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey[300],
                                      blurRadius: 25.0, // has the effect of softening the shadow
                                      spreadRadius: 5.0, // has the effect of extending the shadow

                                    )
                                  ],
                                ),
                                child: Text("متعدد",style: TextStyle(fontSize: 16,color: cBlack),),

                                padding: EdgeInsets.all(4),
                                width: _width,
                                alignment: Alignment.center,
                              ),),
                            ]),
                          )
                        ],
                      ),
                      Container(
                        //Add this to give height

                        height: order.carttNumber=="1"?_height*.35:(order.carttNumber=="2"?_height*.65:_height*.92),
                        child: TabBarView(children: [




// مفرد مفرد مفرد مفرد مفرد مفرد مفرد
// مفرد مفرد مفرد مفرد مفرد مفرد مفرد
// مفرد مفرد مفرد مفرد مفرد مفرد مفرد
// مفرد مفرد مفرد مفرد مفرد مفرد مفرد
// مفرد مفرد مفرد مفرد مفرد مفرد مفرد
// مفرد مفرد مفرد مفرد مفرد مفرد مفرد



                          Container(

                            child: Column(
                              children: <Widget>[


                                SizedBox(height: 15,),
                                Container(
                                  height: _height*.04,
                                  padding: EdgeInsets.all(6),
                                  alignment: Alignment.centerRight,

                                  decoration: BoxDecoration(
                                      color: Color(0xffD8DBE1),
                                      borderRadius: BorderRadius.all(
                                        const Radius.circular(10.00),
                                      ),
                                      border: Border.all(color: cWhite)
                                  ),
                                  margin: EdgeInsets.only(
                                      left: _width * 0.03,
                                      right:_width * 0.03,
                                      bottom:_width * 0.025),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "القطعة  ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: cOmarColor,
                                        ),
                                      ),

                                      Text(
                                        "1  ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: cOmarColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),



                                Container(
                                  width: _width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: _width*.46,
                                        child: CustomTextFormField(

                                          hintTxt: "نوع الصنع",
                                          inputData: TextInputType.text,
                                          onChangedFunc: (String text) {
                                            _requestLabel1= text.toString();
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        color: cOmarColor,
                                        height: 45,
                                      ),
                                      Container(
                                        width: _width*.46,
                                        child: CustomTextFormField(
                                          hintTxt: "السعر",
                                          inputData: TextInputType.number,
                                          onChangedFunc: (String text) {
                                            _requestPrice1= text.toString();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),



                                order.carttNumber=="2" || order.carttNumber=="3"?SizedBox(height: 15,):Text("",style: TextStyle(height: 0),),
                                order.carttNumber=="2" || order.carttNumber=="3"?Container(
                                  height: _height*.04,
                                  padding: EdgeInsets.all(6),
                                  alignment: Alignment.centerRight,

                                  decoration: BoxDecoration(
                                      color: Color(0xffD8DBE1),
                                      borderRadius: BorderRadius.all(
                                        const Radius.circular(10.00),
                                      ),
                                      border: Border.all(color: cWhite)
                                  ),
                                  margin: EdgeInsets.only(
                                      left: _width * 0.03,
                                      right:_width * 0.03,
                                      bottom:_width * 0.025),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "القطعة  ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: cOmarColor,
                                        ),
                                      ),

                                      Text(
                                        "2  ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: cOmarColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ):Text("",style: TextStyle(height: 0),),
                                order.carttNumber=="2" || order.carttNumber=="3"?Container(
                                  width: _width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: _width*.46,
                                        child: CustomTextFormField(

                                          hintTxt: "نوع الصنع",
                                          inputData: TextInputType.text,
                                          onChangedFunc: (String text) {
                                            _requestLabel2= text.toString();
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        color: cOmarColor,
                                        height: 45,
                                      ),
                                      Container(
                                        width: _width*.46,
                                        child: CustomTextFormField(
                                          hintTxt: "السعر",
                                          inputData: TextInputType.number,
                                          onChangedFunc: (String text) {
                                            _requestPrice2= text.toString();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ):Text("",style: TextStyle(height: 0),),





                                order.carttNumber=="3"?SizedBox(height: 15,):Text("",style: TextStyle(height: 0),),
                                order.carttNumber=="3"?Container(
                                  height: _height*.04,
                                  padding: EdgeInsets.all(6),
                                  alignment: Alignment.centerRight,

                                  decoration: BoxDecoration(
                                      color: Color(0xffD8DBE1),
                                      borderRadius: BorderRadius.all(
                                        const Radius.circular(10.00),
                                      ),
                                      border: Border.all(color: cWhite)
                                  ),
                                  margin: EdgeInsets.only(
                                      left: _width * 0.03,
                                      right:_width * 0.03,
                                      bottom:_width * 0.025),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "القطعة  ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: cOmarColor,
                                        ),
                                      ),

                                      Text(
                                        "3  ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: cOmarColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ):Text("",style: TextStyle(height: 0),),
                                order.carttNumber=="3"?Container(
                                  width: _width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: _width*.46,
                                        child: CustomTextFormField(

                                          hintTxt: "نوع الصنع",
                                          inputData: TextInputType.text,
                                          onChangedFunc: (String text) {
                                            _requestLabel3= text.toString();
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        color: cOmarColor,
                                        height: 45,
                                      ),
                                      Container(
                                        width: _width*.46,
                                        child: CustomTextFormField(
                                          hintTxt: "السعر",
                                          inputData: TextInputType.number,
                                          onChangedFunc: (String text) {
                                            _requestPrice3= text.toString();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                  :Text("",style: TextStyle(height: 0),),




                              ],
                            ),
                          ),



            //  متعدد  //  متعدد   //  متعدد
            //  متعدد  //  متعدد   //  متعدد
            //  متعدد  //  متعدد   //  متعدد
            //  متعدد  //  متعدد   //  متعدد
            //  متعدد  //  متعدد   //  متعدد

                          Container(

                            child: Column(
                              children: <Widget>[



                                // القطعة 1
                                // القطعة 1
                                SizedBox(height: 15,),
                                Container(
                                  height: _height*.04,
                                  padding: EdgeInsets.all(6),
                                  alignment: Alignment.centerRight,

                                  decoration: BoxDecoration(
                                      color: Color(0xffD8DBE1),
                                      borderRadius: BorderRadius.all(
                                        const Radius.circular(10.00),
                                      ),
                                      border: Border.all(color: cWhite)
                                  ),
                                  margin: EdgeInsets.only(
                                      left: _width * 0.03,
                                      right:_width * 0.03,
                                      bottom:_width * 0.025),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "القطعة  ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: cOmarColor,
                                        ),
                                      ),

                                      Text(
                                        "1  ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: cOmarColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: _width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: _width*.46,
                                        child: CustomTextFormField(

                                          hintTxt: "نوع الصنع",
                                          inputData: TextInputType.text,
                                          onChangedFunc: (String text) {
                                            _requestPrice1Label1= text.toString();
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        color: cOmarColor,
                                        height: 45,
                                      ),
                                      Container(
                                        width: _width*.46,
                                        child: CustomTextFormField(
                                          hintTxt: "السعر",
                                          inputData: TextInputType.number,
                                          onChangedFunc: (String text) {
                                            _requestPrice1Offer1= text.toString();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  width: _width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: _width*.46,
                                        child: CustomTextFormField(

                                          hintTxt: "نوع الصنع",
                                          inputData: TextInputType.text,
                                          onChangedFunc: (String text) {
                                            _requestPrice1Label2= text.toString();
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        color: cOmarColor,
                                        height: 45,
                                      ),
                                      Container(
                                        width: _width*.46,
                                        child: CustomTextFormField(
                                          hintTxt: "السعر",
                                          inputData: TextInputType.number,
                                          onChangedFunc: (String text) {
                                            _requestPrice1Offer2= text.toString();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Container(
                                  width: _width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: _width*.46,
                                        child: CustomTextFormField(

                                          hintTxt: "نوع الصنع",
                                          inputData: TextInputType.text,
                                          onChangedFunc: (String text) {
                                            _requestPrice1Label3= text.toString();
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        color: cOmarColor,
                                        height: 45,
                                      ),
                                      Container(
                                        width: _width*.46,

                                        child: CustomTextFormField(
                                          hintTxt: "السعر",
                                          inputData: TextInputType.number,
                                          onChangedFunc: (String text) {
                                            _requestPrice1Offer3= text.toString();
                                          },
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                // نهاية لقطعة 1
                                // نهاية لقطعة 1










                                // القطعة 2
                                // القطعة 2
                                order.carttNumber=="2" || order.carttNumber=="3"?SizedBox(height: 15,):Text("",style: TextStyle(height: 0),),
                                order.carttNumber=="2" || order.carttNumber=="3"?Container(
                                  height: _height*.04,
                                  padding: EdgeInsets.all(6),
                                  alignment: Alignment.centerRight,

                                  decoration: BoxDecoration(
                                      color: Color(0xffD8DBE1),
                                      borderRadius: BorderRadius.all(
                                        const Radius.circular(10.00),
                                      ),
                                      border: Border.all(color: cWhite)
                                  ),
                                  margin: EdgeInsets.only(
                                      left: _width * 0.03,
                                      right:_width * 0.03,
                                      bottom:_width * 0.025),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "القطعة  ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: cOmarColor,
                                        ),
                                      ),

                                      Text(
                                        "2  ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: cOmarColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ):Text("",style: TextStyle(height: 0),),
                                order.carttNumber=="2" || order.carttNumber=="3"?Container(
                                  width: _width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: _width*.46,
                                        child: CustomTextFormField(

                                          hintTxt: "نوع الصنع",
                                          inputData: TextInputType.text,
                                          onChangedFunc: (String text) {
                                            _requestPrice2Label1= text.toString();
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        color: cOmarColor,
                                        height: 45,
                                      ),
                                      Container(
                                        width: _width*.46,
                                        child: CustomTextFormField(
                                          hintTxt: "السعر",
                                          inputData: TextInputType.number,
                                          onChangedFunc: (String text) {
                                            _requestPrice2Offer1= text.toString();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ):Text("",style: TextStyle(height: 0),),
                                order.carttNumber=="2" || order.carttNumber=="3"?SizedBox(height: 5,):Text("",style: TextStyle(height: 0),),
                                order.carttNumber=="2" || order.carttNumber=="3"?Container(
                                  width: _width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: _width*.46,
                                        child: CustomTextFormField(

                                          hintTxt: "نوع الصنع",
                                          inputData: TextInputType.text,
                                          onChangedFunc: (String text) {
                                            _requestPrice2Label2= text.toString();
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        color: cOmarColor,
                                        height: 45,
                                      ),
                                      Container(
                                        width: _width*.46,
                                        child: CustomTextFormField(
                                          hintTxt: "السعر",
                                          inputData: TextInputType.number,
                                          onChangedFunc: (String text) {
                                            _requestPrice2Offer2= text.toString();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ):Text("",style: TextStyle(height: 0),),
                                order.carttNumber=="2" || order.carttNumber=="3"?SizedBox(height: 5,):Text("",style: TextStyle(height: 0),),
                                order.carttNumber=="2" || order.carttNumber=="3"?Container(
                                  width: _width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: _width*.46,
                                        child: CustomTextFormField(

                                          hintTxt: "نوع الصنع",
                                          inputData: TextInputType.text,
                                          onChangedFunc: (String text) {
                                            _requestPrice2Label3= text.toString();
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        color: cOmarColor,
                                        height: 45,
                                      ),
                                      Container(
                                        width: _width*.46,

                                        child: CustomTextFormField(
                                          hintTxt: "السعر",
                                          inputData: TextInputType.number,
                                          onChangedFunc: (String text) {
                                            _requestPrice2Offer3= text.toString();
                                          },
                                        ),
                                      ),

                                    ],
                                  ),
                                ):Text("",style: TextStyle(height: 0),),
                                // نهاية لقطعة 2
                                // نهاية لقطعة 2



















                                // القطعة 3
                                // القطعة 3
                                order.carttNumber=="3"?SizedBox(height: 15,):Text("",style: TextStyle(height: 0),),
                                order.carttNumber=="3"?Container(
                                  height: _height*.04,
                                  padding: EdgeInsets.all(6),
                                  alignment: Alignment.centerRight,

                                  decoration: BoxDecoration(
                                      color: Color(0xffD8DBE1),
                                      borderRadius: BorderRadius.all(
                                        const Radius.circular(10.00),
                                      ),
                                      border: Border.all(color: cWhite)
                                  ),
                                  margin: EdgeInsets.only(
                                      left: _width * 0.03,
                                      right:_width * 0.03,
                                      bottom:_width * 0.025),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "القطعة  ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: cOmarColor,
                                        ),
                                      ),

                                      Text(
                                        "3  ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: cOmarColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ):Text("",style: TextStyle(height: 0),),
                                order.carttNumber=="3"?Container(
                                  width: _width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: _width*.46,
                                        child: CustomTextFormField(

                                          hintTxt: "نوع الصنع",
                                          inputData: TextInputType.text,
                                          onChangedFunc: (String text) {
                                            _requestPrice3Label1= text.toString();
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        color: cOmarColor,
                                        height: 45,
                                      ),
                                      Container(
                                        width: _width*.46,
                                        child: CustomTextFormField(
                                          hintTxt: "السعر",
                                          inputData: TextInputType.number,
                                          onChangedFunc: (String text) {
                                            _requestPrice3Offer1= text.toString();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ):Text("",style: TextStyle(height: 0),),
                                order.carttNumber=="3"?SizedBox(height: 5,):Text("",style: TextStyle(height: 0),),
                                order.carttNumber=="3"?Container(
                                  width: _width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: _width*.46,
                                        child: CustomTextFormField(

                                          hintTxt: "نوع الصنع",
                                          inputData: TextInputType.text,
                                          onChangedFunc: (String text) {
                                            _requestPrice3Label2= text.toString();
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        color: cOmarColor,
                                        height: 45,
                                      ),
                                      Container(
                                        width: _width*.46,
                                        child: CustomTextFormField(
                                          hintTxt: "السعر",
                                          inputData: TextInputType.number,
                                          onChangedFunc: (String text) {
                                            _requestPrice3Offer2= text.toString();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ):Text("",style: TextStyle(height: 0),),
                                order.carttNumber=="3"?SizedBox(height: 5,):Text("",style: TextStyle(height: 0),),
                                order.carttNumber=="3"?Container(
                                  width: _width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: _width*.46,
                                        child: CustomTextFormField(

                                          hintTxt: "نوع الصنع",
                                          inputData: TextInputType.text,
                                          onChangedFunc: (String text) {
                                            _requestPrice3Label3= text.toString();
                                          },
                                        ),
                                      ),
                                      Container(
                                        width: 1,
                                        color: cOmarColor,
                                        height: 45,
                                      ),
                                      Container(
                                        width: _width*.46,

                                        child: CustomTextFormField(
                                          hintTxt: "السعر",
                                          inputData: TextInputType.number,
                                          onChangedFunc: (String text) {
                                            _requestPrice3Offer3= text.toString();
                                          },
                                        ),
                                      ),

                                    ],
                                  ),
                                ):Text("",style: TextStyle(height: 0),),
                                // نهاية لقطعة 3
                                // نهاية لقطعة 3


                              ],
                            ),
                          ),


                        ]),
                      ),


                      Container(
                          margin: EdgeInsets.only(

                              left: _width * 0.01,
                              right: _width * 0.01,

                          ),
                          child: CustomButton(
                            btnColor: cLightLemon,
                              btnLbl: AppLocalizations.of(context).send,
                              onPressedFunction: () async {


                                if (_formKey.currentState.validate()) {
                                  if (_requestPrice1 == null && _requestPrice1Offer1 ==null) {

                                    showToast(
                                        "يجب ادخال عرض السعر",
                                        context);
                                  } else {
                                    _progressIndicatorState.setIsLoading(true);
                                    FormData formData = new FormData.fromMap({

                                      "offer_mtger": _appState.currentUser.userId,
                                      "offer_cartt": order.carttId,
                                      "offer_type": _offerType,
                                      "requestPrice1": _requestPrice1,
                                      "requestLabel1": _requestLabel1,
                                      "requestPrice2":_requestPrice2,
                                      "requestLabel2":_requestLabel2,
                                      "requestPrice3": _requestPrice3,
                                      "requestLabel3": _requestLabel3,
                                      "requestPrice1Offer1":_requestPrice1Offer1,
                                      "requestPrice1Offer2":_requestPrice1Offer2,
                                      "requestPrice1Offer3":_requestPrice1Offer3,
                                      "requestPrice1Label1":_requestPrice1Label1,
                                      "requestPrice1Label2":_requestPrice1Label2,
                                      "requestPrice1Label3":_requestPrice1Label3,
                                      "requestPrice2Offer1":_requestPrice2Offer1,
                                      "requestPrice2Offer2":_requestPrice2Offer2,
                                      "requestPrice2Offer3":_requestPrice2Offer3,
                                      "requestPrice2Label1":_requestPrice2Label1,
                                      "requestPrice2Label2":_requestPrice2Label2,
                                      "requestPrice2Label3":_requestPrice2Label3,
                                      "requestPrice3Offer1":_requestPrice3Offer1,
                                      "requestPrice3Offer2":_requestPrice3Offer2,
                                      "requestPrice3Offer3":_requestPrice3Offer3,
                                      "requestPrice3Label1":_requestPrice3Label1,
                                      "requestPrice3Label2":_requestPrice3Label2,
                                      "requestPrice3Label3":_requestPrice3Label3,

                                      "lang":_appState.currentLang
                                    });

                                    var results = await _services.postWithDio(
                                        "https://qtaapp.com/api/send_offer",

                                        body: formData);

                                    _progressIndicatorState.setIsLoading(false);


                                    if (results['response'] == '1') {

                                      showToast(results['message'], context);
                                      Navigator.pop(context);
                                      Navigator.pushReplacementNamed(context,  '/navigation');
                                    } else {
                                      showErrorDialog(results['message'], context);
                                    }
                                  }
                                }


                              }))



                    ],
                  )
              )

          )):Text("",style: TextStyle(height: 0),),











          (order.carttDone==2 || order.carttDone==3 || order.carttDone==4 || order.carttDone==5 || order.carttDone==6 || order.carttDone==7) && order.carttMtgerId==_appState.currentUser.userId?Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.only(
                left: _width * 0.03,
                right:_width * 0.03,
                bottom:_width * 0.04),
            height: _height*.16,
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Color(0xffEBEBEB)),
              color: cWhite,
              borderRadius: BorderRadius.circular(
                6.0,
              ),

              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 12.0, // has the effect of softening the shadow
                  spreadRadius: 5.0, // has the effect of extending the shadow

                )
              ],

            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("اسم التاجر",style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(order.carttMtgerName.toString(),style: TextStyle()),
                  ],
                ),
                SizedBox(height: _width*.04,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("التقييم",style: TextStyle(fontWeight: FontWeight.bold),),
                    RatingBar.builder(
                      initialRating:  double.parse(order.carttMtgerRate),
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
                      onRatingUpdate: (rating) async {



                      },
                    ),
                  ],
                )
              ],
            ),
          ):Text("",style: TextStyle(height: 0),),






          (order.carttDone==2 || order.carttDone==3 || order.carttDone==4 || order.carttDone==5 || order.carttDone==6 || order.carttDone==7) && order.carttMtgerId==_appState.currentUser.userId?Container(
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.only(
                left: _width * 0.03,
                right:_width * 0.03,
                bottom:_width * 0.04),
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Color(0xffEBEBEB)),
              color: cWhite,
              borderRadius: BorderRadius.circular(
                6.0,
              ),

              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 12.0, // has the effect of softening the shadow
                  spreadRadius: 5.0, // has the effect of extending the shadow

                )
              ],

            ),
            child: Column(
              children: <Widget>[
                Row(

                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.moneyBillAlt,
                      size: 20,
                      color: cPrimaryColor,
                    ),
                    Padding(padding: EdgeInsets.all(7)),
                    Text("قيمة العرض المقدم",style: TextStyle(),),
                    Spacer(),
                    Container(
                      child: Text(order.carttPrice,style: TextStyle(color: Colors.white)),
                      color: cLightLemon,
                      padding: EdgeInsets.only(top: 4,bottom: 4,left: 7,right: 7),
                    ),
                    Padding(padding: EdgeInsets.all(3)),
                    Text("SR",style: TextStyle(),),
                  ],
                ),

              ],
            ),
          ):Text("",style: TextStyle(height: 0),),

















        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    _width = MediaQuery.of(context).size.width;
    _progressIndicatorState = Provider.of<ProgressIndicatorState>(context);
    _tabState = Provider.of<TabState>(context);
    _navigationState = Provider.of<NavigationState>(context);

    return NetworkIndicator(
        child: PageContainer(
      child: Scaffold(
          backgroundColor: Color(0xffF5F6F8),
          body:FutureBuilder<Order>(
              future: _orderDetails,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Stack(
                    children: <Widget>[
                      _buildBodyItem(snapshot.data),
                      Center(
                        child: ProgressIndicatorComponent(),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: GradientAppBar(
                            appBarTitle: "طلب رقم : "+_orderState.carttId,
                           
                            leading: _appState.currentLang == 'en' ? IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: cBlack,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ) :Container(),
              trailing: _appState.currentLang == 'ar' ? IconButton(
                icon: Transform.rotate(
                angle: 180 * math.pi / 180,
                child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: cBlack,
                ),
                onPressed: null,
                ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ) :Container(),),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return Center(
                    child: SpinKitThreeBounce(
                  color: cPrimaryColor,
                  size: 40,
                ));
              })),
    ));
  }
}
