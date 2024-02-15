import 'dart:convert';

import 'package:doctor_baby/controller/program%20_status_controller.dart';
import 'package:doctor_baby/model/program_status_model.dart';
import 'package:doctor_baby/view/calendar.dart';
import 'package:doctor_baby/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

void main(){
  runApp(GetMaterialApp(home: Programsview(),));
}

class VaccineSelectionController extends GetxController {
  RxString selectedVaccineId = "".obs;

  void setSelectedVaccineId(String id) {
    selectedVaccineId.value = id;
  }
}

final VaccineSelectionController vaccineSelectionController = Get.put(VaccineSelectionController());


class Programsview extends StatelessWidget {

  final ProgramController programController = Get.put(ProgramController());
  final TextEditingController dropController= TextEditingController();
  TextEditingController nameController = TextEditingController();

  static String enteredName = "";


  Programsview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
        // backgroundColor: Colors.black,
      body: Container(
        height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://media.istockphoto.com/id/1395084227/photo/covid-19-vaccine.jpg?s=2048x2048&w=is&k=20&c=kiPagHTCx5T6itBE_ek4AtZA8QeiXrUIaSt2VuNom1E=",
              ),
              fit: BoxFit.fill,
            ),
          ),
        // decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/baby.png"))),
        child: SingleChildScrollView(
          child: Column(
            children: [
          
            SizedBox(height: 100),
          
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: Container(alignment: Alignment.center,
                    height: 550,
                    color: Colors.transparent,
                    child: Column(
                      children: [
                
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  height: 90,
                  decoration: BoxDecoration(
                    color:Colors.transparent,
                    borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                    )),
                  child: Text("Select vaccine to confirm", 
                 style: GoogleFonts.robotoSlab(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),)
                ),
                
                        Expanded(
                          child: Obx(() => 
                            ListView.builder(padding: EdgeInsets.symmetric(horizontal: 5),
                              itemCount: programController.programlist.length,
                              itemBuilder: (context, index) {
                              ProgramStatus program = programController.programlist[index];
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                child: InkWell(
                                  onTap: () {
                                    // vaccineSelectionController.setSelectedVaccineId(program.program!.id.toString());
                                    String selectedVaccineId = program.program!.id.toString();
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 50),
                                                child: AlertDialog(
                                                  title: Text("Vaccine Confirmation"),
                                                  content: SingleChildScrollView(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          alignment: Alignment.center,
                                                          width: double.infinity,
                                                          padding: EdgeInsets.all(8),
                                                          color: Colors.black,
                                                          child: Text("Have you taken the vaccination ${program.program!.id.toString()}?", style: TextStyle(color: Colors.white),)),
                                                                              
                                                        SizedBox(height: 10,),
                                                                              
                                                        TextField(
                                                        controller: nameController,
                                                        decoration: InputDecoration(labelText: 'Enter Babyname'),
                                                                                    ),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () async {
                                                                            
                                                        enteredName = nameController.text.trim();
                                                                            
                                                        String username = nameController.text.trim();
                                                                            
                                                        String yes = "True";
                                                                            
                                                        await post(selectedVaccineId, username, yes);
                                                        // Get.to(VaccineCalendar());
                                                      },
                                                      child: Text("Yes"),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context).pop();
                                                      },
                                                      child: Text("No"),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      } ,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                      color:Colors.green,
                                        borderRadius: BorderRadius.circular(10)),
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                                        height: 50,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              child: Text("Vaccine ${program.program!.id.toString()}",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> post(String vaccineId, String username, String yes) async {
    final url = Uri.parse('http://10.0.2.2:8000/babyapp/setvaccinestatus/$vaccineId/');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: 
      jsonEncode(
        {
        'is_taken': yes, 
        'child_name': username
        }
        ),
    );

    if (response.statusCode == 200) {
      print('Confirmation successful');
      Get.snackbar("Vaccination", "Confirm");
      Get.to(Home());
    } else {
      print('Error: ${response.statusCode}');
    }
  }