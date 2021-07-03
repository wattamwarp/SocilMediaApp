import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app_bulbandkey/constants/constants.dart';
import 'package:flutter_app_bulbandkey/controller/controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RatingDetails extends StatefulWidget {
  final ScreenArguments arguments;

  RatingDetails(this.arguments);

  static const String route = '/RatingDetails';

  @override
  _RatingDetailsState createState() => _RatingDetailsState();
}

class _RatingDetailsState extends State<RatingDetails> {
  RatingPageController _ratingPageController = Get.put(RatingPageController());
  LandingPageCrontroller _landingPageCrontroller =
      Get.put(LandingPageCrontroller());
  TextEditingController nameCon = new TextEditingController();
  TextEditingController reasonCon = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _ratingPageController.getData(widget.arguments.id, nameCon, reasonCon);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return Container(
            color: BColor.blackCol,
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: _width,
                  child: Image.network(
                    widget.arguments.url,
                    fit: BoxFit.fill,
                  ),
                ),
                TextField(
                  controller: nameCon,
                  onChanged: (val) {
                    //print(val);
                  },
                ),
                RatingBar.builder(
                  initialRating: _ratingPageController.rating.value,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  unratedColor: BColor.btnCol,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (val) {
                    _ratingPageController.rating.value = val;
                  },
                ),
                TextField(
                  controller: reasonCon,
                  onChanged: (val) {},
                ),
                InkWell(
                  onTap: () async {
                    Map<String, String> map = {
                      'givenBy': nameCon.text,
                      'reason': reasonCon.text,
                      'rating': _ratingPageController.rating.toString()
                    };
                    await save(widget.arguments.id, map);
                    _landingPageCrontroller.updateRating();

                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 100,
                    height: 40,
                    color: BColor.btnCol,
                    child: Center(child: Text('submit')),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  save(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
    nameCon.clear();
    reasonCon.clear();
    _ratingPageController.initailRating.value = 0.0;
  }
}

class ScreenArguments {
  final String id;
  final String url;

  ScreenArguments(this.id, this.url);
}
