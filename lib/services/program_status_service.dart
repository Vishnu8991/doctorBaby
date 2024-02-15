import 'package:doctor_baby/model/program_status_model.dart';
import 'package:http/http.dart' as https;

class ProgramService{
  static Future<dynamic> fetchPrograms()async{
    var response = await https.get(Uri.parse("http://10.0.2.2:8000/babyapp/vaccinestatus/"));
    if(response.statusCode == 200){
      var data = response.body;
      return programStatusFromJson(data);
    }else{
      throw Exception();
    }
  }
}