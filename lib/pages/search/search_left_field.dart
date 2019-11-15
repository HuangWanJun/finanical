import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../config/config.dart';
import 'package:provide/provide.dart';
import 'provide/search_stock_provide.dart';
import 'package:financial_plus/routers/application.dart';
import 'package:fluro/fluro.dart';
import '../../routers/routes.dart';

import 'product_list_page.dart';

class SearchLeftField extends StatefulWidget {
  @override
  _SearchLeftFieldState createState() => _SearchLeftFieldState();
}

class _SearchLeftFieldState extends State<SearchLeftField> {

  String selectType = "股票搜索";

  @override
  Widget build(BuildContext context) {

    return Container(

      child:Column(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(750),
            height: ScreenUtil().setHeight(200),
            child: Row(
              children: <Widget>[
                _fieldTitle(),
                _fieldContent(context),
              ],
            ),
          ),
          _searchHeader(),
          Expanded(
            child: _searchRecord(context),
          ),


        ],
      ),


    );
  }


  Widget _fieldTitle(){
    return Container(
      width: ScreenUtil().setWidth(375),

      child: Column(

        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(100),

            child: Text('產品種類 ：',style: TextStyle(fontSize: k_NormalTextSize),),
            padding: EdgeInsets.fromLTRB(35, 8, 15, 8),
            alignment: Alignment.centerLeft,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(35, 8, 15, 8),
            alignment: Alignment.centerLeft,
            height: ScreenUtil().setHeight(100),

            child: Text('產品名稱/代號 ：',style: TextStyle(fontSize: k_NormalTextSize),),

          )

        ],
      ),
    );
  }

  //產品種類 輸入框
  Widget _fieldContent(BuildContext context){
    return Container(
      width: ScreenUtil().setWidth(375),
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(100),
            width: ScreenUtil().setWidth(380),
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            child:  _nomalPopMenu(),

          ),
          Container(
            color: Colors.white,
            height: ScreenUtil().setHeight(100),
           width: ScreenUtil().setWidth(380),
           padding: EdgeInsets.fromLTRB(15, 15 , 15, 15),

            // decoration: BoxDecoration(border: Border.all(color: Colors.black38)),
            child: RaisedButton(
              color: Colors.white,
              shape: BeveledRectangleBorder(side: BorderSide(color: Colors.black12)),
              child: Text('搜索',style: TextStyle(fontSize: k_NormalTextSize)),
             onPressed: (){
               Application.router.navigateTo(context, Routes.productList,transition: TransitionType.cupertino);
             },
             // child:  Container(

//                child: Text("選擇帳戶",style:TextStyle(
//                  fontSize: k_NormalTextSize,
//                )
//                    ,textAlign: TextAlign.center),

            ),

            /*
            TextField(
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300),
              maxLines: 1,
            //  maxLength: 15,
              obscureText: false,

              onSubmitted: (val){
                if(val.length>0){
                  Provide.value<SearchStockProvide>(context).addSearchRecord(val);
                }
              },
            ),
            */
          ),
        ],
      ),
    );
  }

  //搜索紀錄 文字
  Widget _searchHeader(){
    return  Container(
      width: k_ScreenWith,
      padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
      color: Colors.deepOrangeAccent[200],
      child: Text('搜索結果',style: TextStyle(fontSize: k_NormalTextSize,color: Colors.white),
      ),
    );
  }


  //搜索紀錄
  Widget _searchRecord(BuildContext context){
    return Container(
      child: FutureBuilder(
        future: _getSearchStockRecrod(context),
        builder: (context,snapshot){
          if(snapshot.hasData){

            // List<String> records = Provide.value<SearchStockProvide>(context).searchStockRecord;
            return Provide<SearchStockProvide>(
              builder: (context,child,childCatory){
                List<String> records = Provide.value<SearchStockProvide>(context).searchStockRecord;
                return ListView.builder(
                    itemCount: records.length,
                    itemBuilder:(context,index){
                      return Container(
                        height: ScreenUtil().setHeight(60),
                        padding: EdgeInsets.fromLTRB(15, 8, 15, 8),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide (width: 1,color: Colors.orange))
                        ),
                        child: Text(records[index],style: TextStyle(fontSize: k_NormalTextSize),),
                      );
                    }
                );
              },
            );
          }else{
            return Text('正在加載...');
          }
        },
      ),
    );
  }

  Future<String> _getSearchStockRecrod(BuildContext context) async{
    await Provide.value<SearchStockProvide>(context).getSearchRecordList();
    return 'end';
  }
  
  
  Widget _nomalPopMenu(){
    print("shop pop up");
    return new PopupMenuButton<String>(
        itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
          new PopupMenuItem<String>(
              value: 'stock', child: new Text('股票')),
          new PopupMenuItem<String>(
              value: 'feature', child: new Text('期貨')),

        ],
        onSelected: (String value) {
          setState(() {
            selectType = value;
          });

        },
        child:
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(border: Border.all(color: Colors.black38)),
          child: Text(selectType,style:TextStyle(
              fontSize: k_NormalTextSize,

               )
              ,textAlign: TextAlign.center),
        ) ,
       // shape: BeveledRectangleBorder(side: BorderSide(color: Colors.black38))

        );
  }
}
