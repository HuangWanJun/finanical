import 'package:financial_plus/routers/application.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../routers/routes.dart';

 class HomePage extends StatefulWidget {
   @override
   _HomePageState createState() => _HomePageState();
 }

 class _HomePageState extends State<HomePage>  {

   final List<Map<String,String>> stockList = [
     {"name":"搜索","image":"assets/images/bb.png"},
     {"name":"新聞","image":"assets/images/bb.png"},
     {"name":"按值","image":"assets/images/logo.png"},
     {"name":"搜索","image":"assets/images/bb.png"},
     {"name":"新聞","image":"assets/images/bb.png"},
     {"name":"按值","image":"assets/images/logo.png"},
   ];

   @override
   Widget build(BuildContext context) {
     return Scaffold(

       body: Container(
         child: Column(

           children: <Widget>[
             _logoImage(),
             _banner(),
             Expanded(
               child: _functionList(),
             ),
           ],

         ),

       ),
       persistentFooterButtons: <Widget>[
          Container (
              height: ScreenUtil().setHeight(110),
               child: Container(
                 color: Colors.yellow,
                 child: new InkWell(
                   onTap: () {
                      
                   },
                   child: new Container(
                     child: Image.network('https://cdn.unwire.hk/wp-content/uploads/2019/11/1107-4c.png',fit: BoxFit.cover,),
                     width:  ScreenUtil().setWidth(715),

                   ),
                 ),),
          ),

       ],
     );



   }

   //標題 logo
   Widget _logoImage(){
     return Container(

       width: ScreenUtil().setWidth(750),
       height: ScreenUtil().setHeight(100),
       child: Stack(
         children: <Widget>[
           Image.asset('assets/images/bb.png',
             repeat: ImageRepeat.repeat,
             fit: BoxFit.fill,
             width: ScreenUtil().setWidth(750),
             height: ScreenUtil().setHeight(100),
           ),
           Container(
             padding: EdgeInsets.only(left: 20,top: 40),
             child: Image.asset('assets/images/logo.png',
               alignment: new FractionalOffset(0.0, 0.0),

               width: ScreenUtil().setWidth(300),
             ),
           ),

         ],
       ),
       

     );
   }

   //上面廣告文字
 Widget _banner(){
     return Container(
       margin: EdgeInsets.only(top: 10),
         padding: EdgeInsets.fromLTRB(5, 8, 5, 5),
         decoration: BoxDecoration(
         border: Border(top: BorderSide(width: 3,color: Colors.orange)),
         color: Colors.grey,
       ),
       width:  ScreenUtil().setWidth(750),
       child: Text(
         '香港深圳輸入北像投擲之者中識別那通制裁的通知,香港深圳輸入北像投擲之者中識別那通制裁的通知',
         style: TextStyle(
             color: Colors.white,
             fontSize: ScreenUtil().setSp(30),

         ),

       ),
     );
 }

 //功能列表
 Widget _functionList(){
     return
       CustomScrollView(
         slivers: <Widget>[
           SliverToBoxAdapter(
             child: _buildStockHeader(),
           ),
           SliverGrid(
             gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
               maxCrossAxisExtent: 100.0,
               mainAxisSpacing: 10.0,
               crossAxisSpacing: 5.0,
               childAspectRatio: 0.75,
             ),
             delegate: SliverChildBuilderDelegate(
                   (BuildContext context, int index) {
                     var functionName = stockList[index];
                 return _buildGridItem(functionName["name"],functionName["image"],index);
               },
               childCount: stockList.length,
             ),
           ),
            SliverToBoxAdapter(
              child: _bulderFutruesHeader(),
            ),
           SliverGrid(
             gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
               maxCrossAxisExtent: 100.0,
               mainAxisSpacing: 10.0,
               crossAxisSpacing: 5.0,
               childAspectRatio: 0.75,
             ),
             delegate: SliverChildBuilderDelegate(
                   (BuildContext context, int index) {
                 var functionName = stockList[index];
                 return _buildGridItem(functionName["name"],functionName["image"],index);
               },
               childCount: stockList.length,
             ),
           ),
         ],
       );
 }


 // 股票 名稱 header
 Widget _buildStockHeader(){
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 20, 5),
      height: 60,
      child: Text('股票',style: TextStyle(color: Colors.orange,fontSize: ScreenUtil().setSp(40),fontWeight: FontWeight.bold)),
    );
 }

   // 期貨 名稱 header
 Widget _bulderFutruesHeader(){
   return Container(
     padding: EdgeInsets. fromLTRB(15, 15, 20, 0),
     height: 60,
     child: Text('期貨',style: TextStyle(color: Colors.orange,fontSize: ScreenUtil().setSp(40),fontWeight: FontWeight.bold)),
   );
 }

 //
 Widget _buildGridItem(String name,String image,int index){
   return Padding(
     padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
     child: InkWell(
       onTap: (){
         if(index == 0) {
           Application.router.navigateTo(context, Routes.searchStock,transition: TransitionType.cupertino);
         }
       },
       child: Card(
         child: Padding(
           padding: EdgeInsets.all(10.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               ClipRRect(
                 child: SizedBox(
                   width: 65.0,
                   height: 65.0,
                   child: Image.asset(
                     image,
                     fit: BoxFit.cover,
                   ),
                 ),
                 borderRadius: BorderRadius.all(Radius.circular(8.0)),
               ),
               Expanded(
                 child: Padding(
                   padding: EdgeInsets.only(top: 8.0),
                   child: Text(
                     name,
                     textAlign: TextAlign.center,
                     overflow: TextOverflow.ellipsis,
                   ),
                 ),
               ),
             ],
           ),
         ),
       ),
     ),
   );
 }


 }
