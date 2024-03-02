import 'dart:convert';
import 'package:doctor_baby/model/baby_profile_model.dart';
import 'package:doctor_baby/services/baby_profile_service.dart';
import 'package:get/get.dart';

class BabyProfileController extends GetxController{

   var profile = <BabyProfile>[].obs;
  
   

  @override
  void onInit() {
    getData();
    super.onInit();
  }
  
  void getData() async{
    try{
      var response = await HttpDataService.fetchData();
      var jsonData = json.decode(response);
      BabyProfile babyProfile = BabyProfile.fromJson(jsonData);
       profile.add(babyProfile);
    } catch(e){
      print(e);
    }
  }
}
