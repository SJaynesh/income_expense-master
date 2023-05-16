import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text("My Pocket",style: TextStyle(color: Colors.white,fontSize: 20,letterSpacing: 1)),
        ),
        body: Column(
          children: [
            totalBalanceBox(),
            incomeExpenseBox(),
            Spacer(),
            addButton(),
          ],
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
                Get.toNamed('/income');
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.center,
                child: Text('Add',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 2)),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                Get.toNamed('/transaction');
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(50),
                ),
                alignment: Alignment.center,
                child: Text('Transaction',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,letterSpacing: 2)),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget totalBalanceBox()
  {
    return Container(
      margin: EdgeInsets.all(10),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Total Balance',style: TextStyle(color: Colors.white,letterSpacing: 1,fontSize: 22,)),
          Text('\$ 2000/-',style: TextStyle(color: Colors.white,letterSpacing: 2,fontSize: 22,fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget incomeExpenseBox()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            height: 80,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Total Income',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500)),
                SizedBox(height: 10,),
                Text('\$ 52000',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.all(10),
            height: 80,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Total Expense',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500)),
                SizedBox(height: 10,),
                Text('\$ 5000',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
