import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provide/provide.dart';
import 'home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../provide/current_index.dart';
import 'bond/bond_page.dart';

class IndexPage extends StatelessWidget {

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首頁')
    ),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.home),
        title: Text('Bond')
    ),
  ];

  final List<Widget> tabBodies = [
      HomePage(),
      BondPage(),
  ];

  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(width: 750,height: 1134)..init(context);
    ScreenUtil().allowFontScaling = true;
    return Provide<CurrentIndexProvide>(
      builder: (context,child,val){
        int currentIndex = Provide.value<CurrentIndexProvide>(context).currentIndex;
        return Scaffold(
          backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            items: bottomTabs,
            onTap: (index){
              Provide.value<CurrentIndexProvide>(context).changeIndex(index);
            },
          ),
          body: IndexedStack(
            index: currentIndex,
            children: tabBodies,
          ),
        );
      },
    );
  }
}
