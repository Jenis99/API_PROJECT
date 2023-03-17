import 'dart:convert';
import 'package:api_project/Screens/products/View_Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class Update_Product extends StatefulWidget {

  var pid;
  Update_Product({this.pid});
  @override
  State<Update_Product> createState() => _Update_ProductState();
}

class _Update_ProductState extends State<Update_Product> {
   TextEditingController _product=TextEditingController();
  TextEditingController _price=TextEditingController();
  TextEditingController _qty=TextEditingController();

  getdata()async{
    Uri url=Uri.parse("http://picsyapps.com/studentapi/getSingleProduct.php");
    var params={
      "pid":widget.pid
    };
        var response = await http.post(url,body: params);
        if(response.statusCode==200){
          var body=response.body.toString();
          var json = jsonDecode(body);
          _product.text=json["data"]["pname"].toString();
          _price.text=json["data"]["price"].toString();
          _qty.text=json["data"]["qty"].toString();
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
        title: Text("Add Product"),
      ),
      body: SingleChildScrollView(
          child: (
              Column(
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 10.0,right: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.0,),
                            Text("Product Name",style: TextStyle(
                                fontSize: 20.0
                            ),),
                            SizedBox(height: 5.0,),
                            TextField(
                              decoration: InputDecoration (
                                focusedBorder: OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.blue ),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.black),
                                ),
                              ),
                              controller: _product,
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(height: 10.0,),
                            Text("Price",style: TextStyle(
                                fontSize: 20.0
                            ),),
                            SizedBox(height: 5.0,),
                            TextField(
                              decoration: InputDecoration (
                                focusedBorder: OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.blue ),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.black),
                                ),
                              ),
                              controller: _price,
                              keyboardType: TextInputType.number,
                            ),
                            
                            Text("Qty",style: TextStyle(
                                fontSize: 20.0
                            ),),
                            SizedBox(height: 5.0,),
                            TextField(
                              decoration: InputDecoration (
                                focusedBorder: OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.blue ),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderSide:BorderSide(color: Colors.black),
                                ),
                              ),
                              controller: _qty,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                            ),
                           
                            Center(
                              child:  ElevatedButton(
                                onPressed: () async{
                               
                                var name=_product.text.toString();
                                var price=_price.text.toString();
                                var qty=_qty.text.toString();
                                
                              Uri url=Uri.parse("http://picsyapps.com/studentapi/updateProductNormal.php");
                               var params = {
                                  "pname":name,
                                  "qty":qty,
                                  "price":price,
                                  "pid":widget.pid,
                                };

                                 var response = await http.post(url,body: params);
                                if(response.statusCode==200)
                                {
                                  var json = jsonDecode(response.body.toString());
                                  if(json["status"]=="true")
                                  {
                                    var message = json["message"].toString();
                                    print(message);
                                     Navigator.of(context).pop();  
                                  Navigator.of(context).pop();
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context)=>View_Product())
                                  );  
                                  }
                                  else
                                  {
                                    var message = json["message"].toString();
                                    print(message);
                                  }
                                }
                                 
                              }, child: Padding(
                                padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0,bottom: 10.0),
                                child: Text("Update",style: TextStyle(
                                    fontSize: 20.0
                                ),),
                              )),
                            )
                          ],
                        )
                    ),
                  ]
              )
          )
      ),
    );
  }
}