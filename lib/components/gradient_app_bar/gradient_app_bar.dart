import 'package:flutter/material.dart';
import 'package:qitea/utils/app_colors.dart';


class GradientAppBar extends StatelessWidget {

  final String? appBarTitle;
  final Widget? leading;
  final Widget? trailing;

  const GradientAppBar({Key? key, this.appBarTitle, this.leading, this.trailing}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return 
    Stack(
      children: <Widget>[
          Container(

            color:Color(0xffF5F6F8),
          height: 50,


          child: Center(
            child: Text(appBarTitle!,
             style: Theme.of(context).textTheme.display1
         ),
          ),
        ),
        Positioned(
         
          right: 0,
          child: leading!= null ? leading : Container(),
        )
, 
Positioned(
  left: 0,
  child:  trailing != null ? trailing : Container(),

)
        //  IconButton(
        //     icon: Icon(Icons.arrow_back_ios ,color: cWhite,),
        //     onPressed: (){
        //       Navigator.pop(context);
        //     },
        //   )
      ],
    );
  }
}