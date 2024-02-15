import 'package:doctor_baby/services/book_vaccine_service.dart';
import 'package:doctor_baby/view/bottom_nav.dart';
import 'package:doctor_baby/view/calendar.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';


class VaccineController extends GetxController {
  RxList<Vaccines> vaccines = <Vaccines>[].obs;
  Rx<Vaccines?> selectedVaccine = Rx<Vaccines?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/babyapp/vaccine_programs/'));
    
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      vaccines.value = data.map((json) => Vaccines.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load vaccines');
    }
  }
}


// void main() {
//   runApp(GetMaterialApp(home: Booking(),));
// }

class Booking extends StatelessWidget {

   final hospitalname;
  final hospitalId;

  Booking({super.key, required this.hospitalname, this.hospitalId,});



  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final hospitalController = TextEditingController();
  final vaccinesController = TextEditingController();
  final selectedDateController = TextEditingController();


Future<void> bookData() async {
    const String apiUrl = 'http://10.0.2.2:8000/babyapp/vaccinebook/';

    String name = nameController.text;
    String email = emailController.text;
    String hospital = hospitalController.text;
    String vaccine = vaccinesController.text;
    String date = selectedDateController.text;

    if (name.isNotEmpty && email.isNotEmpty) {
      try {
        final response = await http.post(
          Uri.parse(apiUrl),
          body: {
            'parent_name': name,
            'parent_email': email,
            'hospital': hospitalId.toString(),
            'vaccine_program': vaccineController.selectedVaccine.value!.id.toString(),
            'booking_date': date,
          },
        );

        if (response.statusCode == 201) {
          print('Booking successful');
          Get.snackbar("Successfull", "Vaccination booked");
          Get.to(BottomNavi());
        } else {
          print('Failed to book: ${response.statusCode}');
        }
      } catch (e) {
        print('Exception during booking: $e');
      }
    } else {
      print('Something wromg');
    }
  }




  final VaccineController vaccineController = Get.put(VaccineController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[900],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 65, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  color: Colors.cyan[800],
                  // width: 375,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Book Vaccination", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
                      Divider(),
                      SizedBox(height: 20),
                      
                      EasyDateTimeLine(
                        initialDate: DateTime.now(),
                        onDateChange: (selectedDate) {
                          final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
                  selectedDateController.text = formattedDate;
                        },
                        activeColor: Colors.black,
                        dayProps: const EasyDayProps(

                          height: 83,
                          width: 60,

                          todayHighlightStyle: TodayHighlightStyle.withBackground,
                          todayHighlightColor: Colors.black38,
                          landScapeMode: true,
                          activeDayStyle: DayStyle(
                            borderRadius: 48.0,
                          ),
                          dayStructure: DayStructure.dayStrDayNum,
                          inactiveDayStyle: DayStyle(
                            borderRadius: 50.0,
                            dayNumStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        headerProps: const EasyHeaderProps(
                          dateFormatter: DateFormatter.fullDateDMonthAsStrY(),
                        ),
                      ),

                      SizedBox(height: 40),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                        ),
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: 'Parent Name',
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                        ),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
          
                    Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                          ),
                          child: Text("Hospital:  ${hospitalname}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                        ),
                        SizedBox(height: 16),
          
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                        ),
                        child: Obx(() {
                          return DropdownButton<Vaccines>(
                            hint: Text("Vaccine"),
                            value: vaccineController.selectedVaccine.value,
                            items: vaccineController.vaccines
                                .map((vaccine) => DropdownMenuItem<Vaccines>(
                                      value: vaccine,
                                      child: Text('Vaccine ${vaccine.id}'),
                                    ))
                                .toList(),
                            onChanged: (selectedVaccine) {
                              vaccineController.selectedVaccine.value = selectedVaccine;
                              print('Selected Vaccine ID: ${selectedVaccine?.id}');
                            },
                          );
                        }),
                      ),
                      SizedBox(height: 16),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white70,
                        ),
                        child: TextField(
                          controller: selectedDateController,
                          decoration: InputDecoration(
                            isDense: true,
                            labelText: 'Date',
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      
                      GestureDetector(
                        onTap: () => bookData(),
                        child: Container(
                          decoration: BoxDecoration(
                          color: Colors.green,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
                          child: Text("Book", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),),
                      )
                      
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Vaccines {
  int? id;
  List<Vaccine>? vaccines;

  Vaccines({
    this.id,
    this.vaccines,
  });

  factory Vaccines.fromJson(Map<String, dynamic> json) => Vaccines(
        id: json["id"],
        vaccines: json["vaccines"] == null
            ? []
            : List<Vaccine>.from(
                json["vaccines"].map((x) => Vaccine.fromJson(x)),
              ),
      );
}

class Vaccine {
  int? id;
  String? vaccine;

  Vaccine({
    this.id,
    this.vaccine,
  });

  factory Vaccine.fromJson(Map<String, dynamic> json) => Vaccine(
        id: json["id"],
        vaccine: json["vaccine"],
      );
}
