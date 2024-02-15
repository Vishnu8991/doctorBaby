import 'package:doctor_baby/model/vaccines_model.dart';
import 'package:doctor_baby/view/program_status_view.dart';
import 'package:http/http.dart' as https;

class VaccineSummary{
  static Future<dynamic> fetchSummary()async{
    var response = await https.get(Uri.parse("http://10.0.2.2:8000/babyapp/child_vaccine_status/nazrin/"));
    if(response.statusCode == 200){
      var data = response.body;
      return vaccinesFromJson(data);
    }else{
      throw Exception();
    }
  }
}