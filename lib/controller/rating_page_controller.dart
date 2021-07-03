

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RatingPageController extends GetxController{



  var rating = (0.0).obs;
  var initailRating = (0.0).obs;
  var isDataAvailable = false.obs;

  @override
  void onInit() {
    // TODO: implement initState
    //getData();
    print('jbcjbcjbcjbcjbcjbcmbc');
    super.onInit();
  }

  getData(String id , TextEditingController nameCon ,TextEditingController reasonCon ) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    print(id);
    var i = pref.getString(id);
    //print('the var is ' + i);
    rating.value = 0.0;
    if (i != null ) {
      // i = 'null';

      var b = jsonDecode(i);
      print('the var is ' + b.toString());
      print(b['rating'].toString());
      //print(i.get('givebBy'));
      //setState(() {
        rating.value  = (double.parse(b['rating']) );
        nameCon.text = b['givenBy'];
        reasonCon.text = b['reason'];
      //});
    }else{
      rating.value = 0.0;
    }
  }
}