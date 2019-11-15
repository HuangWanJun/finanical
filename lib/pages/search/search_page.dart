import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'search_tab.dart';
import 'search_left_field.dart';

class SearhStockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('搜索產品'),
      ),
      body: Column(
          children: <Widget>[
             SearchTab(),
           Expanded(
             child: SearchLeftField(),
           ),

          ],
      ),
    );
  }
}
