import 'package:doctor_baby/model/hospitals_model.dart';
import 'package:http/http.dart' as https;

class HospitalService{
  static Future<dynamic> fetchHopitals()async{
    var response = await https.get(Uri.parse("http://10.0.2.2:8000/babyapp/hospitals/"));
    if(response.statusCode == 200){
      var data = response.body;
      return hospitalsFromJson(data);
    }else{
      throw Exception();
    }
  }
}