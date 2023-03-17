import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Model_Example extends StatefulWidget {

  @override
  State<Model_Example> createState() => _Model_ExampleState();
}

class _Model_ExampleState extends State<Model_Example> {


  List<Cars> alldata = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //   Cars obj1 = new Cars(
  //     carName: "Audi",
  //     carEngine: "Petrol"
  //   );


  // Cars obj2 = new Cars(
  //       carName: "Jaguar",
  //       carEngine: "Disel"
  //     );

      alldata.add(Cars(
      carName: "Audi",
      carEngine: "Petrol"
    ));
      alldata.add(Cars(
        carName: "Jaguar",
        carEngine: "Disel"
      ));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Model Example"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: alldata.map((obj){
            return Container(
              child: Text(obj.carName.toString()),
            );
          }).toList(),
        ),
      ),
      // body: ListView.builder(
      //   itemCount: alldata.length,
      //   itemBuilder: (context,index)
      //   {
      //     return ListTile(
      //       title: Text(alldata[index].carName.toString()),
      //     );
      //   },
      // ),
    );
  } 
}


class Cars
{
  //Member variable
  var carName,carEngine;
  // Constructor
  Cars({this.carName,this.carEngine});
  // Member function
  _demo()
  {
    print("Car name : "+carName);
  }
}