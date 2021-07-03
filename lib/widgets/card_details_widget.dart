import 'package:flutter/material.dart';
import 'package:flutter_app_bulbandkey/constants/color.dart';
import 'package:flutter_app_bulbandkey/constants/urls.dart';
import 'package:flutter_app_bulbandkey/controller/landing_page_controller.dart';
import 'package:get/get.dart';
class CardDetailsWidget extends StatefulWidget {
  @override
  _CardDetailsWidgetState createState() => _CardDetailsWidgetState();
}

class _CardDetailsWidgetState extends State<CardDetailsWidget> {
  LandingPageCrontroller _landingPageCrontroller =
  Get.put(LandingPageCrontroller());
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) {
        setState(() {
          _landingPageCrontroller.postCount =
              _landingPageCrontroller.postCount - 1;
        });
      },
      child: Card(
        child: Container(
          color: BColor.whiteCol,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 40,
                      width: 40,
                      child: ClipOval(
                        child: Image.network(
                          Urls.accountImgUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 8, top: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '  Raghivir Singh Pa... ',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500
                              //color: BColor.greyCol
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Contributor * 4hr ago ',
                            style:
                            TextStyle(fontSize: 12, color: BColor.greyCol),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                  'Testing Covid Positive across certain hotspots, pune city is way above',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Text(
                    'As the covid-19 vaccine  completes its journey from laboratory to hospital ,its pricing is being quistioned . public health activist and indus...'),
              ),
              SizedBox(
                height: 4,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    "Read More...",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                      decorationThickness: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 191,
                    decoration: BoxDecoration(
                        color: BColor.greyCol,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    padding:
                    EdgeInsets.only(top: 4, bottom: 4, left: 10, right: 10),
                    child: Row(
                      children: [
                        Text(
                          'ORIGINAL IN MARATHI ',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 14,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                  height: 230,
                  child: Image.network(
                    Urls.postImgUrl,
                    fit: BoxFit.fill,
                  )),
              SizedBox(
                height: 6,
              ),
              Container(
                margin: EdgeInsets.only(left: 4, right: 4),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: BColor.redCol,
                      size: 18,
                    ),
                    Text(
                      '42 Likes',
                      style: TextStyle(
                        fontSize: 12,
                        color: BColor.greyCol,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '134 Views',
                      style: TextStyle(
                        fontSize: 12,
                        color: BColor.greyCol,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.add,
                          color: BColor.greyCol,
                          size: 16,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 4),
                          child: Text(
                            'Like',
                            style: TextStyle(
                              fontSize: 12,
                              color: BColor.greyCol,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.messenger_outline,
                          color: BColor.greyCol,
                          size: 16,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 4),
                          child: Text(
                            'Comment',
                            style: TextStyle(
                              fontSize: 12,
                              color: BColor.greyCol,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.share,
                          color: BColor.greyCol,
                          size: 16,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 4),
                          child: Text(
                            'Share',
                            style: TextStyle(
                              fontSize: 12,
                              color: BColor.greyCol,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(-8, -8),
                          child: Container(
                            height: 17,
                            width: 17,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: BColor.redCol,
                              // border: Border.all(width: 5.0, color: BColor.whiteCol),
                            ),
                            //color: Colors.yellowAccent,
                            child: Center(
                              child: Text(
                                '99',
                                style: TextStyle(color: BColor.whiteCol),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
