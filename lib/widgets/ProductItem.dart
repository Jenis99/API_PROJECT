
import 'package:flutter/material.dart';

import '../models/FakeProducts.dart';

class ProductItem extends StatelessWidget
{

 FakeProducts obj;
 GestureTapCallback onclick;
 ProductItem({required this.obj,required this.onclick});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onclick,
      child: Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.red.shade100,
            margin: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(obj.title.toString()),
                Text(obj.rating!.rate.toString()),
              ],
            ),
          ),
    );
  }

}