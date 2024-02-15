import 'package:doctor_baby/controller/hospital_controller.dart';
import 'package:doctor_baby/model/hospitals_model.dart';
import 'package:doctor_baby/model/program_status_model.dart';
import 'package:doctor_baby/view/booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(GetMaterialApp(home: Hospitalsview(),));
}

class Hospitalsview extends StatelessWidget {

  final HospitalsController hospitalsController = Get.put(HospitalsController());

  Hospitalsview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
        backgroundColor: Colors.cyan[900],
      //   title: Text("Hospitals nearby you", style: TextStyle(fontSize: 30, color: Colors.white),),),
      body: Column(
        children: [
          
          SizedBox(height: 60),

          Container(padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerLeft,
            height: 90,
            decoration: BoxDecoration(
              color:Colors.black,
              // borderRadius: BorderRadius.only(
              // bottomLeft: Radius.circular(20),
              // bottomRight: Radius.circular(20)
              // )
              ),
            child: Text("Select a hospital to book your slot", 
           style: GoogleFonts.robotoSlab(
            fontSize: 25,
            color: Colors.white,
            // letterSpacing: 1.0,
            // fontWeight: FontWeight.bold
            
          ),)
          ),

        SizedBox(height: 15),

          Expanded(
            child: Obx(() => 
              ListView.builder(padding: EdgeInsets.symmetric(horizontal: 5),
                itemCount: hospitalsController.hospitalsList.length,
                itemBuilder: (context, index) {
                Hospitals hospitals = hospitalsController.hospitalsList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InkWell(
                    onTap: ()=> Get.to(Booking(hospitalname: hospitals.name!, hospitalId: hospitals.id!,)),
                    child: Card(
                      color:Colors.transparent,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        height: 250,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text(hospitals.name!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20),)),
                    
                            SizedBox(height: 10,),  
                    
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                  color: Colors.cyan[700],
                                    borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.all(8),
                                  // alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text("Location: ",
                                      style: TextStyle(color: Colors.white70),
                                      ),
                                      Text(hospitals.location!,
                                      style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  )
                                  ),

                                  SizedBox(height: 10,),
                                  
                                Container(
                                  decoration: BoxDecoration(
                                  color: Colors.cyan[700],
                                    borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.all(8),
                                  // alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Text("Slots Available: ",
                                      style: TextStyle(color: Colors.white70),),
                                      Container(
                                        decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(5)
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                                        child: Text("${hospitals.slotsAvailable!}",
                                        style: TextStyle(color: Colors.white),),
                                      ),
                                    ],
                                  )
                                  ),

                                  SizedBox(height: 10,),
  //                               Container(
  //                                 decoration: BoxDecoration(
  //                                 color: Colors.cyan[700],
  //                                   borderRadius: BorderRadius.circular(10)),
  //                                 padding: EdgeInsets.all(8),
  //                                 // alignment: Alignment.centerLeft,
  //                                 child: Row(
  //   children: [
  //     Text("Programs Available: ", style: TextStyle(color: Colors.white70),),
  //     Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: 
  //       // hospitals.programsDetails!.first.vaccines!.map((vaccine) 
  //       hospitals.programsAvailable!.map((program) 
  //       {
  //         return Padding(
  //           padding: const EdgeInsets.all(3.0),
  //           child: Container(
  //             decoration: BoxDecoration(
  //                                         color: Colors.black,
  //                                         borderRadius: BorderRadius.circular(5)
  //                                         ),
  //                                         padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
  //             child: Text(
  //               program.toString().split('.').last, 
  //               style: TextStyle(color: Colors.white),
  //             ),
  //           ),
  //         );
  //       }).toList(),
  //     ),
  //   ],
  // ),

  //                                 ),
  Container(
  decoration: BoxDecoration(
    color: Colors.cyan[700],
    borderRadius: BorderRadius.circular(10),
  ),
  padding: EdgeInsets.all(8),
  child: Row(
    children: [
      Text("Vaccines Available: ", style: TextStyle(color: Colors.white70),),
      Row(
        children: hospitals.programsAvailable!.map((program) {
          return Padding(
            padding: EdgeInsets.only(right: 5),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "$program",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }).toList(),
      ),
    ],
  ),
)

                                  
                              ],
                            ),
                            SizedBox(height: 10,),
                    
                            Container(
                              decoration: BoxDecoration(
                              color: Colors.cyan[900],
                              borderRadius: BorderRadius.circular(20)),
                              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 3),
                              child: Text("Select", style: TextStyle(fontSize: 16, color: Colors.white),),
                            )
                          ],
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
    );
  }

  // String getLocationString(Location location) {
  //   // Convert Location enum to string for display
  //   switch (location) {
  //     case Location.IRINJALAKUDA:
  //       return "Irinjalakuda";
  //     case Location.THRISSUR:
  //       return "Thrissur";
  //     default:
  //       return "";
  //   }
  // }
}