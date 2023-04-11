import 'dart:convert';

import 'package:api_project/Screens/products/Update_Product.dart';
import 'package:api_project/resources/UrlHelper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
class View_Product extends StatefulWidget {
  const View_Product({super.key});

  @override
  State<View_Product> createState() => _View_ProductState();
}

class _View_ProductState extends State<View_Product> {
  Future<List>? allproducts;

  Future<List>? getproduct_data()async{
    Uri url=Uri.parse(UrlHelper.VIEW_PRODUCT);
    var response=await http.get(url);
    if(response.statusCode==200){
      var body=response.body.toString();
      var json = jsonDecode(body);
      return json["data"];
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
              return ListView.builder(
               itemCount:snapshot.data!.length,
               itemBuilder: ((context, index){
                return Card(
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      margin:  EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text("Pid : "+snapshot.data![index]["pid"].toString()),
                          Text("Product Name : "+snapshot.data![index]["pname"].toString()),
                          Text("Quantity : "+snapshot.data![index]["qty"].toString()),
                          Text("Price : "+snapshot.data![index]["price"].toString()),
                          Text("Date : "+snapshot.data![index]["added_datetime"].toString()),
                          SizedBox(height: 20.0,),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: (){
                                  print("object");
                                   AlertDialog alert =  AlertDialog(
                                  title: Text("Warning!"),
                                  content: Text("Are you sure you want to delete?"),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () async{
                                     var id = snapshot.data![index]["pid"].toString();

                                     Uri url = Uri.parse("http://picsyapps.com/studentapi/deleteProductNormal.php");
                                     
                                     var params={
                                      "pid":id
                                     };
                                     var response = await http.post(url,body: params);
                                     if(response.statusCode==200)
                                     {
                                      var json = jsonDecode(response.body.toString());
                                      if(json["status"]=="true")
                                      {
                                         Navigator.of(context).pop();
                                         setState(() {
                                          allproducts=getproduct_data();
                                        });
                                      }
                                     }
                                    }, child: Text("Yes")),
                                    ElevatedButton(
                                      onPressed: (){
                                      Navigator.of(context).pop();
                                    }, child: Text("No")),
                                  ],
                                );
                                 showDialog(context: context, builder: (context){
                                  return alert;
                                });
                              }, child: Text("Delete")
                              ),
                              SizedBox(width: 20.0,),
                              ElevatedButton(onPressed: (){
                                var id=snapshot.data![index]["pid"].toString();
                                 Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context)=>Update_Product(pid: id,))
                                );
                              }, child: Text("Edit")),
                            ],
                          )
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