import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;

class Fake_products extends StatefulWidget
{
  @override
  State<Fake_products> createState() => _Fake_productsState();
}

class _Fake_productsState extends State<Fake_products>
{


//200 ok
//400 api not found
//500 server error

  Future<List>? allproducts;

 Future<List> getdata() async
  {
      Uri url = Uri.parse("https://fakestoreapi.com/products");
      var response = await http.get(url);
      if(response.statusCode==200)
      {
        var body = response.body.toString();
        var json = jsonDecode(body);
      return json;
      }
      else
      {
        print("API Error. Contact Developer");
        return [];
      }
  }
  CheckInternet() async
  {
     bool result = await InternetConnectionChecker().hasConnection;
     if(result)
     {
        setState(() {
          allproducts = getdata();
        });
     }
     else
     {
      //redirect to no internet

     }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CheckInternet();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Product"),
      ),
      body: FutureBuilder(
        future: allproducts,
        builder: (context,snapshot)
        {
          if(snapshot.hasData)
          {
            if(snapshot.data!.length<=0)
            {
              return Center(
                child: Text("No Data"),
              );
            }
            else
            {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context,index)
                {
                  return ListTile(
                    leading: Image.network(snapshot.data![index]["image"].toString()),
                    title: Text(snapshot.data![index]["title"].toString()),
                    subtitle: Text(snapshot.data![index]["rating"]["rate"].toString()),
                    trailing:  Text("Rs."+snapshot.data![index]["price"].toString()),
                  );
                },
              );
            }
          }
          else
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      // body: Center(
      //   child:  ElevatedButton(onPressed: ()async{
      //      bool result = await InternetConnectionChecker().hasConnection;
      //     if(result == true) {
      //         print("Your Internet Is Conected");
      //       } else {
      //         print("Please Connect the Internet Connection");
      //       }
       
      //   }, child: Text("Menu")),
      // ),
    );
  }
}