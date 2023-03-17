import 'dart:convert';
import 'package:api_project/Screens/employee/Update_Employee.dart';
import 'package:api_project/resources/UrlHelper.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class View_Employee extends StatefulWidget {
  const View_Employee({super.key});

  @override
  State<View_Employee> createState() => _View_EmployeeState();
}

class _View_EmployeeState extends State<View_Employee> {

  Future<List>? allemployee;

   Future<List>? getemployee_data()async{

    Uri url=Uri.parse(UrlHelper.VIEW_EMPLOYEE);
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
      allemployee=getemployee_data();
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
      allemployee=getemployee_data();
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("This is View Product Screen"),
      ),
      body: FutureBuilder(
        future: allemployee,
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
                          Text("Eid : "+snapshot.data![index]["eid"].toString()),
                          Text("Employee Name : "+snapshot.data![index]["ename"].toString()),
                          Text("Salary : "+snapshot.data![index]["salary"].toString()),
                          Text("Department : "+snapshot.data![index]["department"].toString()),
                          Text("Gender : "+snapshot.data![index]["gender"].toString()),
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
                                        var id=snapshot.data![index]["eid"].toString();


                                      Uri url =Uri.parse("http://picsyapps.com/studentapi/deleteEmployeeNormal.php");
                                      
                                      var params={
                                        "eid":id,
                                      };
                                      var response=await http.post(url,body: params);
                                      if(response.statusCode==200){

                                        var json=jsonDecode(response.body.toString());
                                        if(json["status"]=="true"){

                                           Navigator.of(context).pop();
                                         setState(() {
                                          allemployee=getemployee_data();                                        
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
                                var id=snapshot.data![index]["eid"].toString();
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context)=>Update_Employee(eid:id))
                                );
                              }, child: Text("Update")),
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