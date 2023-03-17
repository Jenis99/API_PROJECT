import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class IPaddress_API_Practice extends StatefulWidget {
  const IPaddress_API_Practice({super.key});

  @override
  State<IPaddress_API_Practice> createState() => _IPaddress_API_PracticeState();
}

class _IPaddress_API_PracticeState extends State<IPaddress_API_Practice> {
  TextEditingController _textbox=TextEditingController();
  var ipaddress;
  var region;
  var loc;
  var org;
  var postal;
  var timezone;
  var readme;
  var city;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IP Address"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _textbox,
                keyboardType: TextInputType.text,
              ),
            ),
            SizedBox(height: 20.0,),
            ElevatedButton(onPressed: ()async{
              var ip = _textbox.text.toString();
                Uri url=Uri.parse("https://ipinfo.io/"+ip+"/geo");
                var response=await http.get(url);
                if(response.statusCode==200){
                var body=response.body.toString();
                var json = jsonDecode(body);
                setState(() {
                  ipaddress=json["ip"];
                  city=json["city"];
                  region=json["region"];
                  loc=json["loc"];
                  org=json["org"];
                  postal=json["postal"];
                  timezone=json["timezone"];
                  readme=json["readme"];
                });
              }
              else{
              }
            },
             child: Text("Call")),
             
            SizedBox(height: 20.0,),
            Center(
              child:(city==null)?SizedBox(): Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color:  Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("IP Address : "+ipaddress.toString(),
                  style: TextStyle(
                    fontSize: 20.0
                  ),),
                  Text("City : "+city.toString(),
                  style: TextStyle(
                    fontSize: 20.0
                  ),),
                  Text("Region : "+region.toString(),
                  style: TextStyle(
                    fontSize: 20.0
                  ),),
                  Text("Loc : "+loc.toString(),
                  style: TextStyle(
                    fontSize: 20.0
                  ),),
                  Text("Org : "+org.toString(),
                  style: TextStyle(
                    fontSize: 20.0
                  ),),
                  Text("postal : "+postal.toString(),
                  style: TextStyle(
                    fontSize: 20.0
                  ),),
                  Text("Timezone : "+timezone.toString(),
                  style: TextStyle(
                    fontSize: 20.0
                  ),),
                  Text("Readme : "+readme.toString(),
                  style: TextStyle(
                    fontSize: 20.0
                  ),),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}