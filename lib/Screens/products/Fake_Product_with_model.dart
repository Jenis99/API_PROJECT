import 'dart:convert';

import 'package:api_project/models/FakeProducts.dart';
import 'package:api_project/widgets/ProductItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class Fake_Product_with_model extends StatefulWidget {
  const Fake_Product_with_model({super.key});

  @override
  State<Fake_Product_with_model> createState() => _Fake_Product_with_modelState();
}

class _Fake_Product_with_modelState extends State<Fake_Product_with_model> {


  List<FakeProducts> alldata=[];
  getdata() async
  {
    Uri url = Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);
    if(response.statusCode==200)
    {
      var body = response.body.toString();
      var json = jsonDecode(body);
      //1.read json object one by one
      //2. convert json object to class object
      //3. store that class object to List
      setState(() {
        alldata = json.map<FakeProducts>((jsonobj)=> FakeProducts.fromJson(jsonobj)).toList();
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
        title: Text("Fake Product with Model"),
      ),
      body: ListView.builder(
        itemCount: alldata.length,
        itemBuilder: (context,index)
        {
          return ProductItem(
            onclick: (){
              var id = alldata[index].id.toString();
            },
            obj: alldata[index],
          );
        
        },
      ),
    );
  }
}