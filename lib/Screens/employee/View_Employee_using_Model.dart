import 'dart:convert';

import 'package:api_project/models/Employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class View_Employee_Using_Model extends StatefulWidget {
  const View_Employee_Using_Model({super.key});

  @override
  State<View_Employee_Using_Model> createState() => _View_Employee_Using_ModelState();
}

class _View_Employee_Using_ModelState extends State<View_Employee_Using_Model> {

  List<Employee>alldata = [];

  getemployee_data()async{

    Uri url=Uri.parse("http://picsyapps.com/studentapi/getEmployee.php");
    var response=await http.get(url);
    if(response.statusCode==200){
      var body=response.body.toString();
      var json = jsonDecode(body);
     setState(() {
       alldata=json["data"].map<Employee>((jsonobj)=>Employee.fromJson(jsonobj)).toList();
     });

    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getemployee_data();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Employee Using Model"),
      ),
      body: ListView.builder(
        itemCount:alldata.length,
        itemBuilder:(context,index){
          return ListTile(
            title: Text(alldata[index].ename.toString()),
            subtitle: Text(alldata[index].department.toString()),
            trailing:Text(alldata[index].salary.toString())
          );
        }
      ),
    );
  }
}