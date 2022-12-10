import 'package:flutter/material.dart';

import 'package:qitea/models/category.dart';
import 'package:qitea/models/marka.dart';
import 'package:qitea/models/city.dart';
import 'package:qitea/utils/app_colors.dart';
import 'package:validators/validators.dart';
import 'dart:io';
import 'package:qitea/components/response_handling/response_handling.dart';

mixin ValidationMixin<T extends StatefulWidget> on State<T> {
  String _password = '';








  // String validateKeySearch(String keySearch) {
  //   if (keySearch.trim().length == 0) {
  //     return ' يرجى إدخال كلمة البحث';
  //   }
  //   return null;
  // }

  // String validateAge(String age) {
  //   if (age.trim().length == 0 || !isNumeric(age)) {
  //     return ' يرجى إدخال العمر';
  //   }
  //   return null;
  // }

  bool checkAddProductValidation(BuildContext context,
      {File imgFile, Marka adMainCategory}) {

    if (adMainCategory == null) {
      showToast("يجب اختيار الماركة", context);
      return false;
    }
    return true;
  }

  bool checkEditProductValidation(BuildContext context,
      { Category adMainCategory}) {


    if (adMainCategory == null) {
      showToast("يجب اختيار القسم", context);
      return false;
    }
    return true;
  }


  bool checkAddCatValidation(BuildContext context,
      {File imgFile, Category adMainCategory}) {
    if (imgFile == null) {
      showToast("يجب اختيار صورة", context);
      return false;
    }

    return true;
  }



  bool checkDriverRegisterValidation(BuildContext context,
      {File imgFile,File imgFile1,File imgFile2,File imgFile3,File imgFile4,File imgFile5, City userCity}) {
    if (imgFile == null) {
      showToast("يجب اختيار الصورة الشخصية", context);
      return false;
    }


    if (imgFile1 == null) {
      showToast("يجب اختيار صورة السيارة من الامام", context);
      return false;
    }

    if (imgFile2 == null) {
      showToast("يجب اختيار صورة الهوية", context);
      return false;
    }

    if (imgFile3 == null) {
      showToast("يجب اختيار صورة رخصة لقيادة", context);
      return false;
    }

    if (imgFile4 == null) {
      showToast("يجب اختيار صورةاستمارة السيارة", context);
      return false;
    }

    if (imgFile5 == null) {
      showToast("يجب اختيار صورة السيارة من الخلف", context);
      return false;
    }


    if (userCity == null) {
      showToast("يجب اختيار المدينة", context);
      return false;
    }
    return true;
  }







  bool checkMtgerRegisterValidation(BuildContext context,
      {File imgFile, City userCity}) {
    if (imgFile == null) {
      showToast("يجب اختيار صورة من السجل التجاري ", context);
      return false;
    }

    if (userCity == null) {
      showToast("يجب اختيار المدينة", context);
      return false;
    }

    return true;
  }





}
