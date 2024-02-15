import 'package:doctor_baby/services/hospital_service.dart';
import 'package:get/get.dart';

class HospitalsController extends GetxController{

  var hospitalsList = [].obs;

  @override
  void onInit() {
    getHospitals();
    super.onInit();
  }
  
  void getHospitals() async{
    try {
      var datas = await HospitalService.fetchHopitals();
      if(datas!=null){
        hospitalsList.value=datas;
      }
    } catch (e) {
      print(e);
    }
  }
  
}