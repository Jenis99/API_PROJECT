
import 'package:api_project/Screens/API/Fake_user.dart';
import 'package:api_project/Screens/API/IPaddress_API_Practice.dart';
import 'package:api_project/Screens/API/fake_api_practice.dart';
import 'package:api_project/Screens/Model_Example.dart';
import 'package:api_project/Screens/employee/Add_employee.dart';
import 'package:api_project/Screens/employee/View_Employee.dart';
import 'package:api_project/Screens/employee/View_Employee_using_Model.dart';
import 'package:api_project/Screens/products/Add_Product.dart';
import 'package:api_project/Screens/products/Fake_Product_with_model.dart';
import 'package:api_project/Screens/products/Fake_products.dart';
import 'package:api_project/Screens/products/View_Product.dart';
import 'package:api_project/Screens/products/View_Product_Using_Model.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../resources/StringResources.dart';
import '../widgets/PrimaryButton.dart';

class homescreen extends StatefulWidget {
  const homescreen({super.key});

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child:  ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
      const DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text('Drawer Header'),
      ),
      ListTile(
        title: const Text('Add Product'),
        onTap: () {
          Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>Add_Product())
         );
        },
      ),
      ListTile(
        title: const Text('View Product'),
        onTap: () {
          Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>View_Product())
         );
        },
      ),
      ListTile(
        title: const Text('Add Employee'),
        onTap: () {
          Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>Add_employee())
         );
        },
      ),
      ListTile(
        title: const Text('View Employee'),
        onTap: () {
         Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>View_Employee())
         );
        },
      ),
      ListTile(
        title: const Text('View Employee'),
        onTap: () {
         Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>View_Employee())
         );
        },
      ),
      ListTile(
        title: const Text('Fake Products'),
        onTap: () {
         Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>Fake_products())
         );
        },
      ),
      ListTile(
        title: const Text('Fake User'),
        onTap: () {
         Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>Fake_user())
         );
        },
      ),
      ListTile(
        title: const Text('Fake API Practice'),
        onTap: () {
         Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>fake_api_practice())
         );
        },
      ),
      ListTile(
        title: const Text('Model'),
        onTap: () {
         Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>Model_Example())
         );
        },
      ),
      ListTile(
        title: const Text('Ip Address'),
        onTap: () {
         Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>IPaddress_API_Practice())
         );
        },
      ),
      ListTile(
        title: const Text('Fake Product With Model'),
        onTap: () {
         Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>Fake_Product_with_model())
         );
        },
      ),
      ListTile(
        title: const Text('View Product Using Model'),
        onTap: () {
         Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>View_Product_Using_Model())
         );
        },
      ),
      ListTile(
        title: const Text('View Employee Using Model'),
        onTap: () {
         Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>View_Employee_Using_Model())
         );
        },
      ),
    ],
  ),
      ),
    appBar: AppBar(
      title: Text("Home Screen"),
    ),
    body: Column(
      children: [



        PrimaryButton(
          buttonText: StringResources.APP_NAME,
          ctx: context,
          onclick: (){
            print("Sign in button clicked");
          },
        ),
        SizedBox(height: 15.0,),
        PrimaryButton(
          buttonText: "Sign Up",
           ctx: context,
           onclick: (){
            print("Sign up button clicked");
           },
        ),

        // GestureDetector(
        //   onTap: (){

        //   },
        //   child: Container(
        //   margin: EdgeInsets.all(10.0),
        //   width: MediaQuery.of(context).size.width,
        //   height: 60.0,
        //   alignment: Alignment.center,
        //   decoration: BoxDecoration(
        //     color: Colors.purple,
        //     borderRadius: BorderRadius.circular(15.0)
        //   ),
        //   child: Text("Sign In",style: TextStyle(fontSize: 20.0,color: Colors.white),),
        // ),
        // ),
        // SizedBox(height: 15.0,),
        // GestureDetector(
        //   onTap: (){

        //   },
        //   child: Container(
        //   margin: EdgeInsets.all(10.0),
        //   width: MediaQuery.of(context).size.width,
        //   height: 60.0,
        //   alignment: Alignment.center,
        //   decoration: BoxDecoration(
        //     color: Colors.purple,
        //     borderRadius: BorderRadius.circular(15.0)
        //   ),
        //   child: Text("Sign Up",style: TextStyle(fontSize: 20.0,color: Colors.white),),
        // ),
        // ),
        // SizedBox(height: 15.0,),
        // GestureDetector(
        //   onTap: (){

        //   },
        //   child: Container(
        //   margin: EdgeInsets.all(10.0),
        //   width: MediaQuery.of(context).size.width,
        //   height: 60.0,
        //   alignment: Alignment.center,
        //   decoration: BoxDecoration(
        //     color: Colors.purple,
        //     borderRadius: BorderRadius.circular(15.0)
        //   ),
        //   child: Text("Submit",style: TextStyle(fontSize: 20.0,color: Colors.white),),
        // ),
        // ),
        // SizedBox(height: 15.0,),
        // GestureDetector(
        //   onTap: (){

        //   },
        //   child: Container(
        //   margin: EdgeInsets.all(10.0),
        //   width: MediaQuery.of(context).size.width,
        //   height: 60.0,
        //   alignment: Alignment.center,
        //   decoration: BoxDecoration(
        //     color: Colors.purple,
        //     borderRadius: BorderRadius.circular(15.0)
        //   ),
        //   child: Text("Add Complain",style: TextStyle(fontSize: 20.0,color: Colors.white),),
        // ),
        // ),
        // SizedBox(height: 15.0,),
      ],
    ),
    );
  }
}