import 'dart:convert';

import 'package:flutter_app_bulbandkey/model/model.dart';
import 'package:flutter_app_bulbandkey/services/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LandingPageCrontroller extends GetxController {
  List<Photo> ph = List<Photo>().obs;
  var ratingData = List<Rating>().obs;
  var loading = true.obs;
  var ids = List<String>().obs;
  var postCount = 3.obs;
  var map = Map<String, dynamic>().obs;

  @override
  void onInit() {
    callData();
    super.onInit();
  }

  callData() async {
    getImagesService imageService = new getImagesService();
    List<Photo> list = await imageService.getImageList();
    ph.addAll(list);
    loading(false);
    for (int i = 0; i < ph.length; i++) {
      await returnId(ph[i].id);
    }
  }

  updateRating() async {
    for (int i = 0; i < ph.length; i++) {
      await returnId(ph[i].id);
      print(ph[i].id);
    }
  }

  returnId(String id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var i = pref.getString(id);

    if (i == null || i.isEmpty)
      i = 'null';
    else {
      var b = jsonDecode(i);
      ids.add(id);
      map.update('$id', (dynamic val) => b['rating'].toString(),
          ifAbsent: () => b['rating'].toString());
    }
  }
}
