import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qitea/utils/app_colors.dart';
import 'package:qitea/utils/app_colors.dart';

class CustomButton2 extends StatelessWidget {
  final double? height ;
  final Color? btnColor;
  final String? btnLbl;
  final Function? onPressedFunction;
  final TextStyle? btnStyle;
  final Color? borderColor;
  final bool? defaultMargin;


  const CustomButton2(
      {Key? key,
        this.btnLbl,
        this.height,
        this.borderColor,
        this.onPressedFunction,
        this.btnColor,
        this.btnStyle,
        this.defaultMargin
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height:  height ==  null? 46 : height,
        margin: EdgeInsets.symmetric(
            horizontal: defaultMargin!?
            MediaQuery.of(context).size.width * 0.07 : 0.0,
            vertical: MediaQuery.of(context).size.height * 0.01),
        child: Builder(
            builder: (context) => ElevatedButton(
              onPressed: () {
                onPressedFunction!();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: btnColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                side: BorderSide(color:borderColor != null ? borderColor! : cLightLemon  ),
                elevation:0,
              ),
              child: Stack(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      child: new Text(
                        '$btnLbl',
                        style: btnStyle == null
                            ? Theme.of(context).textTheme.button
                            : btnStyle,
                      )),

                  Positioned(
                      left: 2,
                      top: 8,
                      child:  Container(
                        width: 30,
                        height: 30,
                        child: Icon(Icons.refresh,color: Colors.green,),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                        ),
                      ))
                ],
              ),
            )));
  }
}
