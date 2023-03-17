import 'dart:convert';

import 'package:api_project/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class View_Product_Using_Model extends StatefulWidget {
  const View_Product_Using_Model({super.key});

  @override
  State<View_Product_Using_Model> createState() => _View_Product_Using_ModelState();
}

class _View_Product_Using_ModelState extends State<View_Product_Using_Model> {

  List<Product> alldata=[]; 
  getdata()async{
    Uri url=Uri.parse("http://picsyapps.com/studentapi/getProducts.php");
    var response=await http.get(url);
    if(response.statusCode==200){
      var body=response.body.toString();
      var json = jsonDecode(body);
      setState(() {
        alldata=json["data"].map<Product>((jsonobj)=>Product.fromJson(jsonobj)).toList();
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Product with Model"),
      ),
      body: ListView.builder(
        itemCount: alldata.length,
        itemBuilder: (context,index){
          return ListTile(
            title: Text(alldata[index].pname.toString()),
            subtitle:Text(alldata[index].price.toString()),
            trailing: Text(alldata[index].qty.toString()),
          );
        }),
    );
  }
}