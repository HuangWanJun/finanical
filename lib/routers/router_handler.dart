import 'package:financial_plus/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import '../pages/search/search_page.dart';
import '../pages/search/product_list_page.dart';

Handler detailHandler = Handler(

   handlerFunc: (BuildContext context,Map<String,List<String>> params){

     String goodsId = params['id'].first;
     // print('index detail goodsIT is ${goodsId}');
     return HomePage();
   }
);


//跳到 搜索頁
var searchStockHandler = Handler(

    handlerFunc: (BuildContext context,Map<String, List<String>> params){
    return SearhStockPage();
  }
);

//股票列表頁
var productStockListHandler = Handler(
  handlerFunc: (BuildContext context,Map<String, List<String>> params) {
    return ProductListPage();
  }
);