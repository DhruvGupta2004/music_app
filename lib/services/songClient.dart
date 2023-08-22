import 'dart:convert';

import 'package:dio/dio.dart';

class SongClient {
  final Dio _dioClient = Dio();

  getSongsFromITunes() async {
    try {
      String iTunesUrl =
          "https://itunes.apple.com/search?term=daler+mehndi&limit=25";

      var res = await _dioClient.get(iTunesUrl);
      Map<String, dynamic> songsMap = jsonDecode(res.data);

      print("this is  the resp $res");
      print("this is  the map resp $songsMap");
      return songsMap;
    } catch (error) {
      print("Some error has occured in Songs Fetching $error");
    }
  }
}
