import 'dart:convert';

import 'package:http/http.dart' as http;


Object setRequestHeaders = (additionalHeaders) {
  var headers = { 'Content-Type': 'application/json' };
  return headers;
};

Future<Object> get(url,[headers]) async {
  try{
    if (headers == null) {
        headers = { 'Content-Type': 'application/json' };
    }
    var response = await http.get(url,headers: headers);
    return response;
  }
  catch(error){
    throw error;
  }
}

Future<Object>  post(url,data,[headers]) async {
  try{
    Map<String,String> headers ;
    final encodedData = jsonEncode(data);
    if (headers == null) {
        headers = { 'Content-Type': 'application/json' };
    }
    var response = await http.post(url,body:encodedData,headers: headers);
    return response;
  }
  catch(error){
    throw error;
  }
}

Future<Object>  put(url,data,[headers]) async {
  try{
    Map<String,String> headers ;
    final encodedData = jsonEncode(data);
    if (headers == null) {
        headers = { 'Content-Type': 'application/json' };
    }
    var response = await http.put(url,body:encodedData,headers: headers);
    return response;
  }
  catch(error){
    throw error;
  }
}

Future<Object>  delete(url,[headers]) async {
  try{
    Map<String,String> headers ;
    if (headers == null) {
        headers = { 'Content-Type': 'application/json' };
    }
    var response = await http.delete(url,headers: headers);
    return response;
  }
  catch(error){
    throw error;
  }
}