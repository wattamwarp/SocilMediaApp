import 'dart:convert';
import 'package:flutter_app_bulbandkey/constants/constants.dart';
import 'package:flutter_app_bulbandkey/model/photos_data.dart';
import 'package:http/http.dart' as http;

class getImagesService{

  Future<List<Photo>> getImageList() async {
    Uri uri = Uri.parse(Urls.mainUrl);
    var response = await http.get(uri);
    var jsonString = json.decode(response.body);
    PhotosData data = PhotosData.fromJson(jsonString);
    Photos photos = data.photos;

    return photos.photo;
  }
}