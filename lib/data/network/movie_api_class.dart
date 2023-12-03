import 'dart:convert';

import 'package:flutter_mvvm_provider_api/data/exceptions/app_exception.dart';
import 'package:flutter_mvvm_provider_api/data/network/base_api_class.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class MovieApiClass extends BaseApiClass{
  @override
  Future deleteApiCall(String uri) {
    // TODO: implement deleteApiCall
    throw UnimplementedError();
  }

  @override
  Future getApiCall(String uri) async{
   dynamic jsonResponse;
   try{
     final response = await http.get(Uri.parse((uri))).timeout(const Duration(seconds: 10));
     jsonResponse = getResponseParse(response);
   } on SocketException{
     throw FetchException('Problem Data Fetching');
   }
   return jsonResponse;
  }

  @override
  Future postApiCall(String uri, data) {
    // TODO: implement postApiCall
    throw UnimplementedError();
  }

  @override
  Future updateApiCall(String uri, data) {
    // TODO: implement updateApiCall
    throw UnimplementedError();
  }

  dynamic getResponseParse(http.Response response){
    switch( response.statusCode){
      case 200 :
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        throw BadException(response.body.toString());
      case 404:
        throw UnAuthorisedException(response.body.toString());
      default :
         throw FetchException(response.statusCode.toString());
    }
  }

}