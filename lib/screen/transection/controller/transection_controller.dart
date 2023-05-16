import 'package:get/get.dart';
import 'package:income_expense/utils/db_helper.dart';

class Transactioncontroller extends GetxController
{
  RxList<Map> transectionlist = <Map>[].obs;

  Future<void> readtransection()
  async {
    Dbhelper dbhelper=Dbhelper();
    transectionlist.value= await dbhelper.readdata();
  }
}