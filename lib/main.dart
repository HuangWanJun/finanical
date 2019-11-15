import 'package:financial_plus/pages/search/provide/search_stock_provide.dart' as prefix0;
import 'package:flutter/material.dart';
import 'provide/current_index.dart';
import 'package:provide/provide.dart';
import 'package:fluro/fluro.dart';
import 'routers/application.dart';
import 'routers/routes.dart';
import 'pages/index_page.dart';
import 'pages/search/provide/search_stock_provide.dart';
import 'package:flutter/rendering.dart';

void main() {

  debugPaintSizeEnabled = false;
  debugPaintPointersEnabled = false;
  var currentIndexProvide = CurrentIndexProvide();
  var searchStockProvide = SearchStockProvide();

  var providers = Providers();

  providers
  ..provide(Provider<SearchStockProvide>.value(searchStockProvide))
  ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide));
  runApp((ProviderNode(child: MyApp(),providers: providers,)));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final router = Router();
     Routes.configureRoutes(router);
    Application.router = router;

    return Container(
       child: MaterialApp(
         title: 'Financial App',

         onGenerateRoute: Application.router.generator,
         debugShowCheckedModeBanner: false,
         theme: ThemeData(
           primarySwatch: Colors.orange,
         ),
         home: IndexPage(),
       ),
    );
  }
}


