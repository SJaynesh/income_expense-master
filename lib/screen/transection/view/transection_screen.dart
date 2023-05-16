
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/transection_controller.dart';

class transectionscreen extends StatefulWidget {
  const transectionscreen({Key? key}) : super(key: key);

  @override
  State<transectionscreen> createState() => _transectionscreenState();
}

class _transectionscreenState extends State<transectionscreen> {
  Transactioncontroller controller = Get.put(Transactioncontroller());

  @override
  void initState() {
    super.initState();
    controller.readtransection();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('All Transactions',style: TextStyle(letterSpacing: 1,fontWeight: FontWeight.w500,color: Colors.white)),
        ),
        body: ListView.builder(itemBuilder: (context, index) => transactionBox(
          controller.transectionlist[index]['id'],
          controller.transectionlist[index]['category'],
          controller.transectionlist[index]['notes'],
          controller.transectionlist[index]['amount'],
          controller.transectionlist[index]['status'],
        ),itemCount: 10,),
      ),
    );
  }
  Widget transactionBox(int id,String category,String notes,String amount,String status)
  {
    int s1 = int.parse(status);
    return Container(
      height: 80,
      width: double.infinity,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: s1==1?Border.all(color: Colors.green,width: 2):Border.all(color: Colors.red,width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('$id',style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.w500,fontSize: 17)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$category',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.indigo,letterSpacing: 1,fontSize: 16)),
              SizedBox(height: 2,),
              Text('  $notes',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.indigo,letterSpacing: 1,fontSize: 12)),
            ],
          ),
          s1==1?Text('\$ $amount',style: TextStyle(color: Colors.green,fontWeight: FontWeight.w500,fontSize: 17)):Text('\$ $amount',style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500,fontSize: 17)),
          //VerticalDivider(width: 2,color: Colors.grey,),
          Icon(Icons.edit,color: Colors.indigo),
          Icon(Icons.delete,color: Colors.red),
        ],
      ),
    );
  }
}

