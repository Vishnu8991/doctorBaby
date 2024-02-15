import 'package:doctor_baby/services/vaccine_service.dart';
import 'package:get/get.dart';

class VaccineController extends GetxController{

  var vaccineList = [].obs;

  @override
  void onInit() {
    getVaccines();
    super.onInit();
  }
  
  void getVaccines() async{
    try {
      var datas = await VaccineService.fetchVaccine();
      if(datas!=null){
        vaccineList.value=datas;
      }
    } catch (e) {
      print(e);
    }
  }
  
}