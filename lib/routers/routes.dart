import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routes{
  //總路由器
  static String root = '/';
  static String searchStock = '/search'; //跳到股票搜索頁
  static String productList = '/productList'; //跳到股票搜索頁
  static String detailPage = '/detail';
  static void configureRoutes(Router router){

    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print("ROUTE WAS NOT FOUND !!!");
        });

    router.define(detailPage, handler: detailHandler);
    router.define(searchStock, handler: searchStockHandler);//跳到股票搜索頁
    router.define(productList, handler: productStockListHandler);//跳到股票列表頁
  }

}