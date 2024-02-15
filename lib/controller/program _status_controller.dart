import 'package:doctor_baby/services/hospital_service.dart';
import 'package:doctor_baby/services/program_status_service.dart';
import 'package:get/get.dart';

class ProgramController extends GetxController{

  var programlist = [].obs;

  @override
  void onInit() {
    getprograms();
    super.onInit();
  }
  
  void getprograms() async{
    try {
      var datas = await ProgramService.fetchPrograms();
      if(datas!=null){
        programlist.value=datas;
      }
    } catch (e) {
      print(e);
    }
  }
  
}