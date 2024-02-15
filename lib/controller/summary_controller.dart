import 'package:doctor_baby/services/summary_service.dart';
import 'package:doctor_baby/services/vaccine_service.dart';
import 'package:get/get.dart';

class SummaryController extends GetxController{

  var summaryList = [].obs;

  @override
  void onInit() {
    getSummary();
    super.onInit();
  }
  
  void getSummary() async{
    try {
      var datas = await VaccineSummary.fetchSummary();
      if(datas!=null){
        summaryList.value=datas;
      }
    } catch (e) {
      print(e);
    }
  }
  
}