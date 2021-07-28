import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:centauros_app/utils/my_connectivity.dart';
import 'package:connectivity/connectivity.dart';

import 'package:http/http.dart'as http;

import 'package:models/result.dart';
import 'package:models/localization_constants.dart';

class ApiBaseSource {
  final String? baseUrl;
  final http.Client client;
  final MyConnectivity? connectivity;
  final String? token;

  final Duration timeout = Duration(seconds: 60);

  ApiBaseSource(this.baseUrl, this.client, this.connectivity, this.token);

  Future<Result<T>> get<T>(String url, T Function(dynamic value) mapperFunction,
      {Map<String, String>? headers}) async {
    try {
      var connectivityResult = await connectivity!.checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return Result<T>.error(message: L10NConstants.internetNotAvailable);
      }
      headers = await getHeaders(headers);
      headers[HttpHeaders.contentTypeHeader] = 'application/json';
      headers[HttpHeaders.acceptHeader] = 'application/json';
      log(url, name: 'url');
      log('GET', name: 'method');
      log(headers.toString(), name: 'headers');
      var response =
          await client.get(Uri.parse(url), headers: headers).timeout(timeout);
      return await _manageResponse(response, mapperFunction);
    } catch (ex) {
      log(ex.toString(), name: 'error');
      return Result<T>.error(message: L10NConstants.defaultError);
    }
  }

  Future<Result<T>> post<T>(String url, Map<String, dynamic> body,
      T Function(dynamic value) mapperFunction,
      {Map<String, String>? headers}) async {
    try {
      var connectivityResult = await connectivity!.checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return Result<T>.error(message: L10NConstants.internetNotAvailable);
      }
      headers = await getHeaders(headers);
      headers[HttpHeaders.contentTypeHeader] = 'application/json';
      headers[HttpHeaders.acceptHeader] = 'application/json';
      log(url, name: 'url');
      log('POST', name: 'method');
      log(headers.toString(), name: 'headers');
      log(json.encode(body), name: 'requestBody');
      var response = await client
          .post(Uri.parse(url), body: json.encode(body), headers: headers)
          .timeout(timeout);
      return await _manageResponse(response, mapperFunction);
    } catch (ex) {
      log(ex.toString(), name: 'error');
      return Result<T>.error(message: L10NConstants.defaultError);
    }
  }

  Future<Result<T>> put<T>(String url, Map<String, dynamic>? body,
      T Function(dynamic value) mapperFunction,
      {Map<String, String>? headers}) async {
    try {
      var connectivityResult = await connectivity!.checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        return Result<T>.error(message: L10NConstants.internetNotAvailable);
      }
      headers = await getHeaders(headers);
      headers[HttpHeaders.contentTypeHeader] = 'application/json';
      headers[HttpHeaders.acceptHeader] = 'application/json';
      log(url, name: 'url');
      log('PUT', name: 'method');
      log(headers.toString(), name: 'headers');
      log(json.encode(body), name: 'requestBody');
      var response = await client
          .put(Uri.parse(url), body: json.encode(body), headers: headers)
          .timeout(timeout);
      return await _manageResponse(response, mapperFunction);
    } catch (ex) {
      log(ex.toString(), name: 'error');
      return Result<T>.error(message: L10NConstants.defaultError);
    }
  }

  Future<Result<T>> _manageResponse<T>(
      http.Response response, T Function(dynamic value) mapperFunction) async {
    log(response.statusCode.toString(), name: 'statusCode');
    log(response.body, name: 'responseBody');
    if (response.statusCode == 200) {
      return Result<T>.success(mapperFunction(_getBody(response.body)));
    } else {
      return _manageError<T>(response);
    }
  }

  Result<T> _manageError<T>(http.Response response) {
    if (response.statusCode >= 500) {
      return Result<T>.error(message: L10NConstants.defaultError);
    } else if (response.statusCode == 401) {
      //  Application().logoutController.add(true);
      return Result<T>.error(message: L10NConstants.defaultError);
    } else {
      return _errorFromMap(response);
    }
  }

  Result<T> _errorFromMap<T>(http.Response response) {
    try {
      Map<String, dynamic> body = jsonDecode(response.body);
      String? description = body['description'];
      description = description ?? L10NConstants.defaultError;
      String? code = body['code'];
      return Result<T>.error(
          message: description, code: int.parse(code.toString()));
    } catch (ex) {
      log(ex.toString(), name: 'error');
      return Result<T>.error(message: L10NConstants.defaultError);
    }
  }

  dynamic _getBody(body) {
    String bodyString;
    if (body is String) {
      bodyString = body;
    } else {
      bodyString = utf8.decode(body);
    }

    try {
      return json.decode(bodyString);
    } catch (ex) {
      //log(ex.toString(), name: 'error');
      return bodyString;
    }
  }

  Future<Map<String, String>> getHeaders(Map<String, String>? headers) async {
    headers = headers ?? {};
    headers = await loadToken(headers);
    return headers;
  }

  Future<Map<String, String>> loadToken(Map<String, String> headers) async {
    if (token != null) {
      log(token!, name: 'token');
      headers[HttpHeaders.authorizationHeader] = 'bearer $token';
    }
    return headers;
  }
}
