import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rickandmorty_app/constants/strings.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      var response = await dio.get('character');

      if (response.statusCode == 200) {
        print(json.encode(response.data));
        return response.data['results'];
      } else {
        print(response.statusMessage);
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
