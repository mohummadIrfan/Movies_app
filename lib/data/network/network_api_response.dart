import 'dart:convert';
import 'dart:io';

import "package:http/http.dart" as http;
import 'package:http/http.dart';

import 'package:provider_course/data/app_exceptions.dart';
import 'package:provider_course/data/network/base_api_response.dart';

class NetworkApiResponse extends BaseApiResponse {
  @override
  Future getGetApiResponse(String url) async {
    dynamic jasonResponse;
    try {
      final response =await http.get(Uri.parse(url)).timeout(Duration(seconds: 10) );
      jasonResponse = returnResponse(response);

    } on SocketException {
      throw FetchException("No Network");
    }
    return jasonResponse;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic jasonResponse;
    try {
      Response response =
          await post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));
      jasonResponse = returnResponse(response);
    } on SocketException {
      throw FetchException("No Network");
    }
    return jasonResponse;
  }
}

dynamic returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      dynamic jasonResponse = jsonDecode(response.body);
      return jasonResponse;

    case 400:
      throw BadException(response.body.toString());
    case 500:
      throw AuthenticationException(response.body.toString());
    default:
      throw FetchException('Error occurs');
  }
}
