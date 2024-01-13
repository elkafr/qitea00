import 'package:flutter/material.dart';
import 'package:qitea/components/buttons/custom_button.dart';
import 'package:qitea/components/custom_text_form_field/custom_text_form_field.dart';
import 'package:qitea/components/response_handling/response_handling.dart';
import 'package:qitea/locale/localization.dart';
import 'package:qitea/utils/app_colors.dart';

class CancelOrderBottomSheet extends StatefulWidget {
  final Function? onPressedConfirmation;


  const CancelOrderBottomSheet({Key? key, this.onPressedConfirmation})
      : super(key: key);
  @override
  _CancelOrderBottomSheetState createState() => _CancelOrderBottomSheetState();
}

class _CancelOrderBottomSheetState extends State<CancelOrderBottomSheet> {
  String? reason;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: constraints.maxHeight * 0.05),
              child: Icon(
                Icons.not_interested,
                size: constraints.maxHeight * 0.25,
                color: cLightRed,
              )),
          Container(
            margin:
                EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.05),
            child: Text(
              AppLocalizations.of(context)!.wantToCancelOrder,
              style: TextStyle(
                  color: cBlack, fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),



          Container(
            margin:
            EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.05),
 height: 100,
            child: CustomTextFormField(
              maxLines: 3,
              hintTxt: "ما سبب الالغاء ...",
              validationFunc: (value) {
                if (value!.trim().length == 0) {
                  return "يجب ادخال سبب الالغاء";
                }
                return null;
              },
              inputData: TextInputType.text,
              onChangedFunc: (String text) {
                reason=text;
              },
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Spacer(
                flex: 2,
              ),
              Container(
                width: constraints.maxWidth * 0.5,
                height: 60,
                child: CustomButton(
                    btnStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: cWhite),
                    btnLbl: AppLocalizations.of(context)!.ok,
                    onPressedFunction: () async {
                      if(reason==null){
                        showErrorDialog("فضلا ادخال سبب الالغاء", context);
                      }else{
                        widget.onPressedConfirmation!(reason);
                      }

                    }),
              ),
              Spacer(
                flex: 1,
              ),
              Container(
                  width: constraints.maxWidth * 0.5,
                  height: 60,
                  child: CustomButton(
                      btnStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: cPrimaryColor),

                      btnLbl: AppLocalizations.of(context)!.cancel,
                      btnColor: cWhite,
                      onPressedFunction: () {
                        Navigator.pop(context);
                      })),
              Spacer(
                flex: 2,
              ),
            ],
          )
        ],
      );
    });
  }
}
