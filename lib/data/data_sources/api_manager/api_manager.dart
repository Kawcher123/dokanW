import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dokan/core/exceptions/customExceptions.dart';
import 'package:http/http.dart' as http;



class APIManager {

  final http.Client client;
  APIManager({required this.client});



  Future<dynamic> postAPICallWithHeader({String? url, var param, Map<String, String>? headerData}) async {
    log("Calling API: $url");
    log("Calling parameters: ${param}");
    log("Calling parameters: ${headerData}");

    var responseJson;
    try {
      final response = await client.post(Uri.parse(url!), body: param, headers: headerData ?? {});

      log('APIManager.postAPICallWithHeader:${response.body}');
      responseJson = apiResponse(response);
    } on SocketException catch (e) {
      log('APIManager.postAPICallWithHeader: $e');

      throw ServerFailure('Socket Exception in postAPICallWithHeader :${e.toString()}');
    } catch (e) {
      throw ('Exception in postAPICallWithHeader :${e.toString()}');
    }
    return responseJson;
  }



  Future<dynamic> getWithHeader({String? url, Map<String, String>? headerData}) async {
    log("Calling API: $url");
    log("Calling API header: $headerData");
    var responseJson;
    try {
      final response = await client.get(Uri.parse(url!), headers: headerData ?? {});


      responseJson = apiResponse(response);
    } on SocketException catch (e) {
      throw ServerFailure('Socket Exception in getWithHeader :${e.toString()}');
    } catch (e) {
      throw ('Exception in getWithHeader :${e.toString()}');
    }
    return responseJson;
  }

  dynamic apiResponse(http.Response response) {
    log('APIManager.apiResponse:${response.statusCode}');
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestFailure(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedFailure(response.body.toString());
      case 500:
      default:
        throw ServerFailure(response.body.toString());
    }
  }
}
