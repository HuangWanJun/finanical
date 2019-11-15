import 'package:financial_plus/config/config.dart';
import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



final items = List<String>.generate(10000, (i) => "Item $i");

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  TextEditingController editingController = TextEditingController();
  String searchStockContent = 'no data';

  var items = List<String>();

  @override
  void initState() {

    searchStockProduct("").then((val){
      setState(() {
        print("below :${val.toString()}");
        searchStockContent = val.toString();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('搜索產品'),
      ),
      body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value){
                    
                  },
                  style: TextStyle(fontSize: k_NormalTextSize),
                  controller: editingController,
                  decoration: InputDecoration(
                    labelText: "輸入股票號",
                    hintText: "輸入股票號",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: items.length,
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return ListTile(
                        title: Text('${items[index]}'),
                      );
                    }),
              ),
            ],
          ),
        ),
      );

  }

  void _searchStockList({String key}) async {
      
      searchStockProduct("").then((val){
  
        print("below :${val.toString()}");
        searchStockContent = val.toString();
      
    });
  }
}

class searchBarDelegate extends SearchDelegate<String>{

  List<String> searchList ;

  @override
  List<Widget> buildActions(BuildContext context) {

    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: ()=>query = "",
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {

    return IconButton(
      icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow,progress: transitionAnimation,),
      onPressed: () => close(context,null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {

    return Container(
      width: 100,
      height: 100,
      child: Card(
        color: Colors.redAccent,
        child: Center(
          child: Text(query),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    final suggestionList = query.isEmpty ? [""] : searchList.where((input)=> input.startsWith(query)).toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context,index) {

          return ListTile(
            title: RichText(
              text: TextSpan(
                text: suggestionList[index].substring(0,query.length),
                style: TextStyle(
                  color: Colors.black,fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: suggestionList[index].substring(query.length),
                    style: TextStyle(color: Colors.green)
                  )
                ]
              ),
            ),
          );
        },
    );
  }

  

}
