import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'app_exceptions.dart';

class ApiBaseHelper {
  final String _baseUrl = 'http://xinsa.demoserver23.com/api/v2';

  Future<dynamic> get(String url) async {
    print('Api Get, url $url');
    var responseJson;
    try {
      final response = await http.get(Uri.parse(_baseUrl + url));
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api get recieved!');
    return responseJson;
  }

  Future<dynamic> post(String url, dynamic body) async {
    print('Api Post, url $url, baseurl: $_baseUrl');
    print(body.toString());
    var responseJson;
    try {
      final response = await http.post(Uri.parse(_baseUrl + url), body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      print('No net');
      throw FetchDataException('No Internet connection');
    }
    print('api post.');
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
      case 404:
        var jsonBody = jsonDecode(response.body);
        throw UnauthorisedException(
          jsonBody != null && jsonBody['message'] != null
              ? jsonBody['message']
              : 'Unauthorized',
        );
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
