import 'package:financial_plus/config/config.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'provide/search_stock_provide.dart';

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provide<SearchStockProvide>(
      builder: (context,child,val){
        var isLeft = Provide.value<SearchStockProvide>(context).isLeft;
        var isRight = Provide.value<SearchStockProvide>(context).isRight;

        return Container(
          child: Row(
            children: <Widget>[
               _myTabeLeft(context, true, isLeft,isRight),
              _myTabeLeft(context, false, isRight,isRight),
            ],
          ),
        );
      },
    );
  }

  ///  selfisLeft : 自己是固定屬於 左 true, 右 false
  Widget _myTabeLeft(BuildContext context,bool selfisLeft, bool leftSide,bool rightSide){

    bool open = false;
    if (selfisLeft && leftSide){ //點中左邊
      open = true;
    }else if(!selfisLeft && rightSide){ //點中右邊
      open = true;
    }

    return InkWell(
        onTap: (){
         var kk = selfisLeft ? 'left' : 'right';
          Provide.value<SearchStockProvide>(context).changeLeftRight(kk);
        },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        width: ScreenUtil().setWidth(375),
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.0,
                    color: open ? Colors.orange:Colors.black12,
              )
            )
        ),
          child: Text(
              selfisLeft ? '產品搜索' : '條件搜索',
          style: TextStyle(
            color: open ? Colors.orange:Colors.black,
            fontSize: k_NormalTextSize
          ),
      ),
      ),
    );
  }


}
