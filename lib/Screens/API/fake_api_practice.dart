import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

class fake_api_practice extends StatefulWidget {
  const fake_api_practice({super.key});

  @override
  State<fake_api_practice> createState() => _fake_api_practiceState();
}

class _fake_api_practiceState extends State<fake_api_practice> {
   Future<List>? allproducts;

   Future<List>? getproduct_data()async{

    Uri url=Uri.parse("https://dummyjson.com/products");
    var response=await http.get(url);
    if(response.statusCode==200){
      var body=response.body.toString();
      var json = jsonDecode(body);
      return json["products"];
    }
    else{
      return [];
    }
  }
   Checkconnection() async
  {
     bool result = await InternetConnectionChecker().hasConnection;
     if(result)
     {
       setState(() {
     allproducts=getproduct_data();
    });
     }
     else
     {
      return print("Please Connect The Internet");
     }
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Checkconnection();
    setState(() {
     allproducts=getproduct_data();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is View Product Screen"),
      ),
      body: FutureBuilder(
        future: allproducts,
        builder: (context,snapshot){
          {
          if(snapshot.hasData){
            if(snapshot.data!.length<0){
              return Center(
                child: Text("Their is no user"),
              );
            }
            else{
              return GridView.builder(
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
              ),
               itemCount:snapshot.data!.length,
               itemBuilder: ((context, index){
                return Card(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      margin:  EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          (snapshot.data![index]["images"].toString()==null)?SizedBox():Image.network(snapshot.data![index]["images"][0].toString(),width: 50.0,),
                          SizedBox(height: 10.0,),
                          Text("Name : "+snapshot.data![index]["title"].toString()),
                          SizedBox(height: 5.0,),
                          Text("Price : "+snapshot.data![index]["price"].toString()),
                        ],
                      ),
                    ),
                  );
               }
               )
              ); }
          }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          
      }
          }
        }
      ),
    );
  }
}