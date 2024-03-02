import 'package:doctor_baby/view/baby_profile_view.dart';
import 'package:doctor_baby/view/booking_summary.dart';
import 'package:doctor_baby/view/calendar.dart';
import 'package:doctor_baby/view/chat.dart';
import 'package:doctor_baby/view/components/carousals.dart';
import 'package:doctor_baby/view/components/text_slider.dart';
import 'package:doctor_baby/view/hospitals_view.dart';
import 'package:doctor_baby/view/profile.dart';
import 'package:doctor_baby/view/program_status_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(){
  runApp(GetMaterialApp(home: Home(),debugShowCheckedModeBanner: false,));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String parentName = '';

  @override
  void initState() {
    super.initState();

    // Retrieve parent's name from SharedPreferences when the widget is initialized
    _loadParentName();
  }

  var name = [
    "Calendar",
    "Hospitals",
    "Confirm",
    "Summary",
    "Chat bot",
    "Profile",
  ];

  var icon = [
    Icons.calendar_month,
    Icons.local_hospital,
    Icons.confirmation_num_rounded,
    Icons.list_alt,
    Icons.chat,
    Icons.person,
  ];

  var color = [
    Colors.blue[100],
    Colors.red[300],
    Colors.green[100],
    Colors.pink[100],
    Colors.purple[200],
    Colors.cyan[100],
  ];

  var pages = [
    VaccineCalendar(),
    Hospitalsview(),
    Programsview(),
    SummaryScreen(),
    ChatBot(),
    BabyProfilePage(),
  ];


  Future<void> _loadParentName() async {
    String? name = await Utils.getParentName();
    setState(() {
      parentName = name ?? "Parent"; // Default to "Parent" if no name is available
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
          children: [
            
            Container(
              decoration: BoxDecoration(
                color: Colors.cyan[900],
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(50))
              ),
              child: Column(
                children: [
                  SizedBox(height: 10,),
                
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: Text("DoctorBaby", style: TextStyle(color: Colors.white, fontSize: 30),),
                  ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hi $parentName, ",style: TextStyle(color: Colors.grey[300], fontSize: 22),),
                    Text("How are you doing today?",style: TextStyle(color: Colors.grey[200], fontSize: 23))
                  ],
                ),
              ),
            ),
                ],
              ),
            ),
                
                
            Carousal(),
                
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10)),
                height:280,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        height: 25,
                        width: double.infinity,
                        child: Text("Category", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      ),
                    ),
                    Expanded(
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Column(
                      children: [
                        InkWell(onTap: () => Get.to(pages[index]),
                          child: Container(
                            decoration: BoxDecoration(
                            // color: color[index],
                            color: Colors.blue[100],
                              borderRadius: BorderRadius.circular(20)
                            ),
                            padding: EdgeInsets.all(8),
                            child: Icon(icon[index], size: 50),
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(name[index], style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  );
                }),
                    )
                  ],
                ),
              ),
            ),
                
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10),
            //   child: Container(
            //     decoration: BoxDecoration(
            //     color: Colors.grey[300],
            //       borderRadius: BorderRadius.circular(10)
            //     ),
            //     width: double.infinity,
            //     child: Expanded(
            //       child: Padding(
            //         padding: const EdgeInsets.all(2),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             Card(
            //               // color: Colors.grey[900],
            //               child: Container(
            //                 width: 140,
            //                 padding: EdgeInsets.all(10),
            //                 child: Column(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
                            
            //                   Text("Quick and",style: TextStyle(color: Colors.black)),
            //                   // SizedBox(height: 3,),
            //                   Text("easy",style: TextStyle(color: Colors.black)),
            //                   // SizedBox(height: 3,),
            //                   Text("appointments",style: TextStyle(color: Colors.black)),
            //                 ],),
            //               ),
            //             ),
            //             SizedBox(width: 30),
            //             Card(
            //               // color: Colors.grey[900],
            //               child: Container(
            //                 width: 140,
            //                 padding: EdgeInsets.all(10),
            //                 child: Column(
            //                   crossAxisAlignment: CrossAxisAlignment.center,
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
                            
            //                   Text("Safe and", style: TextStyle(color: Colors.black),),
            //                   // SizedBox(height: 3,),
            //                   Text("effective",style: TextStyle(color: Colors.black)),
            //                   // SizedBox(height: 3,),
            //                   Text("vaccines",style: TextStyle(color: Colors.black)),
            //                 ],),
            //               ),
            //             ),
            //           ],
            //         ),
            //       )),
            //   ),
            // )

            SizedBox(height: 5),
            
            Container(
              padding: EdgeInsets.all(5),
              width: double.infinity,
              color: Colors.grey[300],
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextSlider(),
                ],
              ))
                
          ],
                ),
        )
      ),
    );
    
  }
}