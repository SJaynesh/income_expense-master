import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:income_expense/screen/transection/controller/transection_controller.dart';
import 'package:income_expense/utils/db_helper.dart';

class incomescreen extends StatefulWidget {
  const incomescreen({Key? key}) : super(key: key);

  @override
  State<incomescreen> createState() => _incomescreenState();
}

class _incomescreenState extends State<incomescreen> {
  TextEditingController txtcate = TextEditingController(text: 'food');
  TextEditingController txtamount = TextEditingController(text: '1000');
  TextEditingController txtnote = TextEditingController(text: 'restaurent');
  TextEditingController txtpaytype = TextEditingController(text: 'online');
  TextEditingController txtstatus = TextEditingController();
  TextEditingController txtdate = TextEditingController(text: "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}");
  TextEditingController txttime = TextEditingController(text: "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}");
  Transactioncontroller transactioncontroller = Get.put(Transactioncontroller());
  @override
  void initState() {
    // TODO: implement initState
    Dbhelper dbhelper = Dbhelper();
    dbhelper.checkdb();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text("Income Expense"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 20,),
                TextField(controller: txtcate,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Category"),fillColor: Colors.black),

                ),
                SizedBox(height: 20,),
                TextField(controller: txtamount,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Amount"),fillColor: Colors.black),
                ),
                SizedBox(height: 20,),
                TextField(controller: txtnote,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Note"),fillColor: Colors.black),
                ),
                SizedBox(height: 20,),
                TextField(controller: txtpaytype,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Paytype"),fillColor: Colors.black),
                ),
                SizedBox(height: 20,),
                TextField(controller: txtdate,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Date"),fillColor: Colors.black),
                ),
                SizedBox(height: 20,),
                TextField(controller: txttime,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Time"),fillColor: Colors.black),
                ),
                SizedBox(height: 120,),
                Align(alignment: Alignment.bottomCenter,child: addButton()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addButton()
  {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Dbhelper dbhelper = Dbhelper();
                dbhelper.insertdata(
                    category:txtcate.text,
                    amount: txtamount.text,
                    status: '1',
                    notes: txtnote.text,
                    date: txtdate.text,
                    time: txttime.text,
                    paytype: txtpaytype.text);
                print(dbhelper.database);
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.center,
                child: Text('Income',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 2)),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Dbhelper dbhelper = Dbhelper();
                dbhelper.insertdata(
                    category:txtcate.text,
                    amount: txtamount.text,
                    status: '0',
                    notes: txtnote.text,
                    date: txtdate.text,
                    time: txttime.text,
                    paytype: txtpaytype.text);
                print(dbhelper.database);
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.center,
                child: Text('Expanse',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 2)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
