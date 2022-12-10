import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:qitea/components/app_repo/order_state.dart';
import 'package:qitea/components/buttons/custom_button.dart';
import 'package:qitea/locale/localization.dart';
import 'package:qitea/models/order.dart';
import 'package:qitea/screens/order_details/order_details.dart';
import 'package:qitea/utils/app_colors.dart';

class DoneOrder extends StatefulWidget {
  final bool isCancelOrder;
  final Order order;

  const DoneOrder({Key key, this.isCancelOrder = false, this.order})
      : super(key: key);
  @override
  _DoneOrderState createState() => _DoneOrderState();
}

class _DoneOrderState extends State<DoneOrder> {
  @override
  Widget build(BuildContext context) {
    final orderState = Provider.of<OrderState>(context);
        return LayoutBuilder(builder: (context, constraints) {
      return Container(
        padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(
              left: constraints.maxWidth * 0.03,
              right: constraints.maxWidth * 0.03,
              bottom: constraints.maxHeight * 0.09),
          height: constraints.maxHeight,
          decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Color(0xffEBEBEB)),
              color: Color(0xffF9F9F9),
              borderRadius: BorderRadius.circular(
                6.0,
              ),

            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                blurRadius: 25.0, // has the effect of softening the shadow
                spreadRadius: 5.0, // has the effect of extending the shadow
                offset: Offset(
                  10.0, // horizontal, move right 10
                  10.0, // vertical, move down 10
                ),
              )
            ],

          ),
          child: Row(
            children: <Widget>[



              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: constraints.maxWidth*.85,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth * 0.04,
                              vertical: constraints.maxHeight * 0.04),
                          child: Text(
                            widget.order.carttMarkaName,
                            style: TextStyle(
                                fontSize: 15,
                                color: cPrimaryColor,
                                fontWeight: FontWeight.w700),
                          ),
                        ),

                        Container(
                          width: constraints.maxWidth * 0.42,
                          margin: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth * 0.04,
                              vertical: constraints.maxHeight * 0.04),
                          child: Text(
                            " رقم الطلب : "+widget.order.carttId,
                            style: TextStyle(
                              fontSize: 13,
                              color: cPrimaryColor,

                            ),
                          ),
                        )
                      ],
                    ),
                  ),



                  Container(
                    width: constraints.maxWidth*.85,
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth * 0.04,
                              vertical: constraints.maxHeight * 0.04),
                          child: Text(
                            widget.order.carttTypeeName,
                            style: TextStyle(
                              fontSize: 15,
                              color: cPrimaryColor,

                            ),
                          ),
                        ),

                        Container(
                          width: constraints.maxWidth * 0.42,
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth * 0.04,
                              vertical: constraints.maxHeight * 0.04),
                          child: Text(
                            " تاريخ الطلب : "+widget.order.carttDate,
                            style: TextStyle(
                              fontSize: 13,
                              color: cPrimaryColor,
                            ),
                          ),
                        ),



                      ],
                    ),
                  ),





                  Container(
                    width: constraints.maxWidth*.85,
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth * 0.04,
                              vertical: constraints.maxHeight * 0.04),
                          child: Text(
                            " موديل : "+widget.order.carttModelName,
                            style: TextStyle(
                              fontSize: 15,
                              color: cPrimaryColor,

                            ),
                          ),
                        ),

                        Container(
                          width: constraints.maxWidth * 0.42,
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth * 0.04,
                              vertical: constraints.maxHeight * 0.04),
                          child: Text(
                            " عدد القطع : "+widget.order.carttNumber,
                            style: TextStyle(
                              fontSize: 13,
                              color: cPrimaryColor,
                            ),
                          ),
                        )



                      ],
                    ),
                  ),












                  Container(
                    width: constraints.maxWidth*.85,
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Container(
                          margin: EdgeInsets.only(right: constraints.maxHeight * 0.04,top: constraints.maxHeight * 0.04),
                          child: Text(
                            " رقم الهيكل : "+widget.order.carttHikal,
                            style: TextStyle(
                                fontSize: 13,
                                color: cLightLemon,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),

                        Container(
                          width: constraints.maxWidth * 0.40,
                          padding: EdgeInsets.all(5),
                          alignment: Alignment.centerRight,

                          decoration: BoxDecoration(
                              color: cWhite,
                              borderRadius: BorderRadius.all(
                                const Radius.circular(10.00),
                              ),
                              border: Border.all(color: cWhite)
                          ),
                          margin: EdgeInsets.only(left: constraints.maxWidth * 0.01,),
                          child: Text(
                            widget.order.carttState,
                            style: TextStyle(
                              fontSize: 13,
                              color: cPrimaryColor,
                            ),
                          ),
                        )



                      ],
                    ),
                  ),







                ],
              ),



              Spacer(),



            ],
          ));
    });
  }
}
