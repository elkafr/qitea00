
import 'package:flutter/material.dart';
import 'package:qitea/utils/app_colors.dart';

class NoData extends StatelessWidget {
  final String? message;

  const NoData({Key? key, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
       final height =  MediaQuery.of(context).size.height;

    return  Center( child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          
                          Icon(
                            Icons.not_interested,
                            size:  height *0.12,
                            color: cPrimaryColor,
                          ),
                          Container(
                              margin: EdgeInsets.only(top: height*0.02),
                                                      child: Text(
                            message!,
                              style: TextStyle(
                                  color: cBlack,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'segoeui',
                                  fontSize: 15),
                            ),
                          ),
                        ],
                      ));
  }
}