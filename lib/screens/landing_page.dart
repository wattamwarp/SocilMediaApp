
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_bulbandkey/constants/constants.dart';
import 'package:flutter_app_bulbandkey/controller/controller.dart';
import 'package:flutter_app_bulbandkey/screens/export.dart';
import 'package:flutter_app_bulbandkey/widgets/widgets.dart';
import 'package:get/get.dart';


class LandingPage extends StatefulWidget {
  static const String route = '/';

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  LandingPageCrontroller _landingPageCrontroller =
      Get.put(LandingPageCrontroller());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BColor.whiteCol,
        actions: <Widget>[
          Container(
              margin: EdgeInsets.only(right: 8),
              child: Icon(
                Icons.notifications,
                color: BColor.greyCol,
                size: 24,
              )),
          Container(
              margin: EdgeInsets.only(right: 8),
              child: Icon(
                Icons.search,
                color: BColor.greyCol,
                size: 22,
              )),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: BColor.backgroundCol,
          height: _height,
          width: _width,
          child: Column(
            children: [
              Container(
                color: BColor.whiteCol,
                padding:
                    EdgeInsets.only(left: 12, top: 8, right: 12, bottom: 8),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: BColor.redCol,
                          size: 22,
                        ),
                        Text(
                          'Unnmaned Road,Baner340...',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Text(
                      'Change location',
                      style: TextStyle(color: Colors.blue),
                    )
                  ],
                ),
              ),
              Obx(() {
                return Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: _landingPageCrontroller.loading.value
                      ? Container(
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _landingPageCrontroller.ph.length + 1,
                          itemBuilder: (context, index) {
                            if (index < _landingPageCrontroller.ph.length) {
                              String server, id, secret;
                              server =
                                  '${_landingPageCrontroller.ph[index].server}';
                              id = '${_landingPageCrontroller.ph[index].id}';
                              secret =
                                  '${_landingPageCrontroller.ph[index].secret}';
                              final url =
                                  'https://live.staticflickr.com/$server/${id}_${secret}_w.jpg';

                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/RatingDetails',
                                    arguments: ScreenArguments(id, url),
                                  );
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 20,
                                  margin: EdgeInsets.only(right: 10, left: 10),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                10,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          child: Image.network(
                                            url.toString(),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        right: 10.0,
                                        top: 10.0,
                                        child: _landingPageCrontroller.ids
                                                .contains(id)
                                            ? Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.amber,
                                                ),
                                                //color: Colors.yellowAccent,
                                                child: Center(
                                                  child: Text(
                                                    _landingPageCrontroller.map[
                                                        _landingPageCrontroller
                                                            .ph[index].id],
                                                    style: TextStyle(
                                                        color: BColor.whiteCol),
                                                  ),
                                                ),
                                              )
                                            : SizedBox(height: 0,),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return InkWell(
                                onTap: () async {
                                  await _landingPageCrontroller.callData();
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.asset(
                                      'Assets/Images/loadMore.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            }
                          }),
                );
              }),
              Container(
                  height: _height - 324, child: cardListView(_height, _width)),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardListView(var _height, var _width) {
    return Obx(() {
      return ListView.builder(
        itemCount: 1 + _landingPageCrontroller.postCount.value,
        itemBuilder: (context, index) {
          if (index == 0) {
            return SizedBox(
              height: 0,
            );
          } else {
            return Container(margin: EdgeInsets.all(7), child: detailsCard());
          }
        },
      );
    });
  }

  Widget detailsCard() {
    return CardDetailsWidget();
  }
}