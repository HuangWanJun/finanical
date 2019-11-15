import 'package:dio/dio.dart';
import '../config/service_url.dart';
import 'dart:convert';
import 'dart:async';
import 'dart:io';

Future request(url,{formData}) async{

  try{
    print('start to get home page below data');
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse('application/x-wwww-fomr-urlencoded');

    if(formData==null){
      response = await dio.post(url);
    }else {
      response = await dio.post(url, data: formData);
    }
    if(response.statusCode == 200){
      return response.data;
    }else{
      throw Exception('server error');
    }
  }catch(e){
    return print('start to get data error:=======>${e}');
  }
}

Future searchStockProduct(String searchKey) async{

  Map<String,String> base = _baseParam();

  var searchParam = {"action":"search","market":"","category":"","product_code":"","exchange":"","keywords":searchKey,"paging":0,"article_id":"","type":"futures","fi_keyword":"y"};
  base["body"] = json.encode(searchParam) ;
  var body = jsonEncode(base);


  return request(searchStock,formData:body);
}

Map<String,dynamic> _baseParam(){

  return {"device":"pushy",
          "version":"3.6.0",
          "language":"zh_CN",
          "token":"yI0ZMnzzn4egBIbVXsc9IymKFgTVlhihsLSof\/Tjqeg=",
          "u":"64436C73-798E-4225-AFF8-0138E351DBFF"
        };
}

