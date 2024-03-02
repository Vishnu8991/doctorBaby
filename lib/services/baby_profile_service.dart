import 'package:doctor_baby/view/profile.dart';
import 'package:http/http.dart' as http;
class HttpDataService{
  static Future<dynamic> fetchData() async{
  var response = await http.get(Uri.parse("http://10.0.2.2:8000/babyapp/children/${ProfilePage.userId}/"));
  if(response.statusCode == 200){
    return response.body;
  } else{
    throw Exception();
  }
  }
}