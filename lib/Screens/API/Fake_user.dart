import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Fake_user extends StatefulWidget {
  const Fake_user({super.key});

  @override
  State<Fake_user> createState() => _Fake_userState();
}

class _Fake_userState extends State<Fake_user> {

  Future<List>? alluserdata;

  Future<List>? get_user_data()async{
    Uri url=Uri.parse("https://jsonplaceholder.typicode.com/todos");
    var response=await http.get(url);
    if(response.statusCode==200){
      var body=response.body.toString();
      var json = jsonDecode(body);
      return json;
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
      alluserdata=get_user_data();
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
      alluserdata=get_user_data();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fake User"),
      ),
      body: FutureBuilder(
       future: alluserdata,
        builder: (context,snapshot)
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
                  var completed=snapshot.data![index]["completed"].toString();
                  return Card(
                    child: Container(
                      decoration: BoxDecoration(
                        color: (completed=="true")?Colors.green:Colors.red,
                      ),
                      child: Padding(padding: EdgeInsets.all(8.0),
                      child: Text(snapshot.data![index]["title"].toString()),),
                    ),
                  );
                }),
              );
            }
          }
          else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
    );
  }
}