import 'dart:convert';
import 'package:doctor_baby/view/booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class VacccinePost {




//   Future<void> postData({
//     // required String parentName,
//     // required String parentEmail,
//     // required int hospitalId,
//     // required int vaccineProgramId,
//     // required String bookingDate,



//   }) async {
//     final String apiUrl = ''; 

//     final Map<String, dynamic> data = {
//       'parent_name': name,
//       'parent_email': parentEmail,
//       'hospital': hospitalId,
//       'vaccine_program': vaccineProgramId,
//       'booking_date': bookingDate,
//     };

//     try {
//       final response = await http.post(
//         Uri.parse(apiUrl),
//         headers: {
//           'Content-Type': 'application/json',
//         },
//         body: jsonEncode(data),
//       );

//       if (response.statusCode == 201) {
//         print('Data posted successfully');
//       } else {
//         print('Failed to post data. Status code: ${response.statusCode}');
//         print('Response body: ${response.body}');
//       }
//     } catch (error) {
//       print('Error posting data: $error');
//     }
//   }
// }

//   final nameController = TextEditingController();
//   final emailController = TextEditingController();
//   final hospitalController = TextEditingController();
//   final vaccinesController = TextEditingController();
//   final selectedDateController = TextEditingController();


// Future<void> bookData() async {
//     const String apiUrl = 'http://10.0.2.2:8000/babyapp/vaccinebook/';

//     String name = nameController.text;
//     String email = emailController.text;
//     String hospital = emailController.text;
//     String vaccine = emailController.text;
//     String date = emailController.text;

//     if (name.isNotEmpty && email.isNotEmpty && hospital.isNotEmpty && vaccine.isNotEmpty) {
//       try {
//         final response = await http.post(
//           Uri.parse(apiUrl),
//           body: {
//             'parent_name': name,
//             'parent_email': email,
//             'hospital': ,
//             'vaccine_program': vaccine,
//             'booking_date': date,
//           },
//         );

//         if (response.statusCode == 200) {
//           print('Login successful');
//           Get.snackbar("Successfull", "Vaccination booked");
//         } else {
//           print('Failed to login: ${response.statusCode}');
//         }
//       } catch (e) {
//         print('Exception during login: $e');
//       }
//     } else {
//       print('Email and password are required');
//     }
//   }
}