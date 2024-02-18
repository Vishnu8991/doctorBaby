// import 'package:doctor_baby/controller/program%20_status_controller.dart';
// import 'package:doctor_baby/controller/summary_controller.dart';
// import 'package:doctor_baby/model/program_status_model.dart';
// import 'package:doctor_baby/model/summary_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// void main(){
//   runApp(GetMaterialApp(home: VaccineSummary(),));
// }

// class VaccineSummary extends StatelessWidget {
//   VaccineSummary({super.key});

  

//   final SummaryController summaryController = Get.put(SummaryController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("HEY")),
//       body: Obx(() => 
//       ListView.builder(
//         // itemCount: programController.programlist.first.statuses.length,
//         itemCount: summaryController.summaryList.length,
//         itemBuilder: (context, index){
//           // StatusElement summary = programController.programlist[index];  
//           // ProgramStatus program = programController.programlist.first;

//           Summary summary = summaryController.summaryList[index];

//           return Container(
//             child: Row(
//               children: [
//                 // Text("Vaccine ${program.statuses!.first.status!.id.toString()}"),

//                 // Text("Vaccine ${program.statuses![index].status!.childName}"),
//                 // Text("Vaccine ${program.statuses![index].status!.isTaken.toString()}"),
//                 // Text("Vaccine ${program.statuses![index].status!.program.toString()}"),


//                 Text(summary.status!.program.toString()),
//                 Text(summary.status!.isTaken.toString()),
                
//                 // Text("Vaccine ${program.statuses!.asMap().entries.first.value.status!.id.toString()}"),
//                 SizedBox(width: 10,),
//                 // Text(program.statuses!.first.status!.isTaken.toString()),
//               ],
//             ),
//           );
//         }),)
//     );
//   }
// }



import 'package:doctor_baby/model/summary_model.dart';
import 'package:doctor_baby/view/profile.dart';
import 'package:doctor_baby/view/program_status_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class SummaryScreen extends StatefulWidget {
  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  final _summaryController = Get.put(SummaryController());

  @override
  void initState() {
    super.initState();
    _summaryController.fetchSummaryData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey,

        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Card(color: Colors.black54,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              // height: 600,
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
          
                  Text("Vaccine Summary", style: TextStyle(color: Colors.grey[200], fontSize: 25, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20),
          
                  Expanded(
                    child: Obx(
                      () {
                        if (_summaryController.isLoading.value) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return ListView.builder(
                            itemCount: _summaryController.summaryList.length,
                            itemBuilder: (context, index) {
                              var summary = _summaryController.summaryList[index];
                    
                              String isTakenDisplay = summary.status?.isTaken == true ? 'Completed' : 'Pending';
                              var isTakenColor = summary.status?.isTaken == true ? Colors.green : Colors.red;
                    
                              return 
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                        color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.symmetric(vertical: 12,horizontal: 10),
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 150,
                                        padding: EdgeInsets.all(10),
                                        child: Text('Vaccine ${summary.status?.program}',style: TextStyle(fontSize: 20, color: Colors.white)),
                                      ),
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                          color: isTakenColor,
                                              borderRadius: BorderRadius.circular(20)),
                                            alignment: Alignment.center,
                                          padding: EdgeInsets.all(10),
                                            child: Text('${isTakenDisplay}',style: TextStyle(fontSize: 20),)),
                                        )
                                    ],
                                  ),
                                ),
                              );
                              ListTile(
                                title: Text('Vaccine ${summary.status?.program}'),
                                // subtitle: Text('Is Taken: ${summary.status?.isTaken}'),
                                subtitle: Text('Taken: ${isTakenDisplay}'),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SummaryController extends GetxController {
  RxBool isLoading = true.obs;
  RxList<Summary> summaryList = <Summary>[].obs;

  Future<void> fetchSummaryData() async {
    try {

      String? firstName = await Util.getFirstName();

      final response = await http.get(Uri.parse('http://10.0.2.2:8000/babyapp/child_vaccine_status/$firstName/'));
      if (response.statusCode == 200) {
        final List<Summary> summaries = summaryFromJson(response.body);
        summaryList.assignAll(summaries);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
