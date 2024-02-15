import 'package:doctor_baby/model/vaccines_model.dart';
import 'package:http/http.dart' as https;

class VaccineService{
  static Future<dynamic> fetchVaccine()async{
    var response = await https.get(Uri.parse("http://10.0.2.2:8000/babyapp/vaccine_programs/"));
    if(response.statusCode == 200){
      var data = response.body;
      return vaccinesFromJson(data);
    }else{
      throw Exception();
    }
  }
}