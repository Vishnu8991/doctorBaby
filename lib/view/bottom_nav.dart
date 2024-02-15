import 'package:doctor_baby/view/booking_summary.dart';
import 'package:doctor_baby/view/calendar.dart';
import 'package:doctor_baby/view/hospitals_view.dart';
import 'package:doctor_baby/view/maps.dart';
import 'package:doctor_baby/view/program_status_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavi extends StatefulWidget {
  const BottomNavi({super.key});

  @override
  State<BottomNavi> createState() => _BottomNaviState();
}

class _BottomNaviState extends State<BottomNavi> {
 List pages=[
    VaccineCalendar(),
    // MapScreen(),
    Hospitalsview(),
    Programsview(),
    SummaryScreen(),
// Container(
//   child: Center(
//     child: Text('settings'),
//   ),
// ),

  ];
  int selecetdIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selecetdIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
setState(() {
  selecetdIndex=value;
});
        },
        items:[
        BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.local_hospital),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.book),label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.read_more),label: ''),
        // BottomNavigationBarItem(icon: Icon(Icons.settings),label: ''),
       

      ]),
    );
  }
}