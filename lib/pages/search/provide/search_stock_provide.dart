import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../../config/config.dart';

class SearchStockProvide with ChangeNotifier{

  bool isLeft = true;
  bool isRight = false;

   String searchRecordString = '[]';
   List<String> searchStockRecord = [];

   //獲取全部搜索紀錄
   getSearchRecordList() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     searchRecordString = prefs.getString(k_SP_Search_Stock_Record);
     var temp = searchRecordString == null ? [] : json.decode(searchRecordString.toString());
     searchStockRecord = (temp as List).cast();
     notifyListeners();
   }

   //加一個搜索紀錄
   addSearchRecord(String search_key) async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     searchRecordString = prefs.getString(k_SP_Search_Stock_Record);
     var temp = searchRecordString == null ? [] : json.decode(searchRecordString.toString());
     List<String> tempList = (temp as List).cast();

     tempList.add(search_key);
     searchRecordString = json.encode(tempList).toString();
     prefs.setString(k_SP_Search_Stock_Record, searchRecordString);
     notifyListeners();
  }

  //切換Tab
  changeLeftRight(String changeStatus){

    if (changeStatus == 'left'){
      isLeft = true;
      isRight = false;
    }else{
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }
}