import 'package:doctor_baby/view/bottom_nav.dart';
import 'package:doctor_baby/view/calendar.dart';
import 'package:doctor_baby/view/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {

  static int? userId;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _dobController = TextEditingController();
  final _parentNameController = TextEditingController();
  File? _profileImage;
  String _selectedGender = 'Male';



  Future<void> _saveProfile() async {
    if (_validateForm()) {
      final url = 'http://10.0.2.2:8000/babyapp/childcreate/'; 

      final requestData = {
        'first_name': _firstnameController.text,
        'last_name': _lastnameController.text,
        'date_of_birth': _dobController.text,
        'sex': _selectedGender,
        'parent_username': _parentNameController.text,
      };

      try {
        final response = await http.post(
          Uri.parse(url),
          body: json.encode(requestData),
          headers: {
            'Content-Type': 'application/json',
          },
        );

        if (response.statusCode == 201) {
          print(response.body);
          _showSnackBar('Profile created successfully!');
          final Map<String, dynamic> responseData = json.decode(response.body);
          
          // userId = responseData['id']; 
          ProfilePage.userId = responseData["id"];


          await saveFirstName(_firstnameController.text);


        print('Retrieved ID: ${ProfilePage.userId}');
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
        } else {
          _showSnackBar('Failed to create profile. Please try again.');
        }
      } catch (e) {
        print('Exception: $e');
        _showSnackBar('Failed to create profile. Please try again.');
      }
    }
  }


  Future<void> saveFirstName(String firstName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('firstName', firstName);
  }



  bool _validateForm() {
    if (_firstnameController.text.isEmpty ||  
        _lastnameController.text.isEmpty || 
        _dobController.text.isEmpty ||
        _parentNameController.text.isEmpty ||
        _selectedGender.isEmpty) {
      _showSnackBar('Please fill in all fields.');
      return false;
    }
    return true;
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

   Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _dobController.text = picked.toLocal().toString().split(' ')[0];
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1582486225644-aeacf6aa0b1b?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"), fit: BoxFit.cover)),
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Card(
                color: Colors.black45,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      // Center(
                      //     child: GestureDetector(
                      //       onTap: _pickImage,
                      //       child: CircleAvatar(
                      //         backgroundColor: Colors.black,
                      //         radius: 50,
                      //         backgroundImage: _profileImage != null
                      //             ? FileImage(_profileImage!) as ImageProvider<Object>?
                      //             : AssetImage("assets/profile.jpeg"),
                                  
                      //       ),
                      //     ),
                      //   ),
                  
                        SizedBox(height: 20),
                      Text("Create a profile for your baby", 
                      style: TextStyle(color: Colors.grey[200], fontSize: 25),),
                  
                        SizedBox(height: 70),
                            
                        TextFormField(style: TextStyle(color: Colors.grey[100]),
                          controller: _firstnameController,
                          decoration: InputDecoration(labelText: 'First Name',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[300]),
                            border: OutlineInputBorder(borderRadius: BorderRadius
                                .circular(20) ),),
                            
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your first name.';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 12),
                        TextFormField(style: TextStyle(color: Colors.grey[100]),
                          controller: _lastnameController,
                          decoration: InputDecoration(labelText: 'Last Name',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[300]),
                            border: OutlineInputBorder(borderRadius: BorderRadius
                                .circular(20) ),),
                            
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your last name.';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 12),
                        TextFormField(style: TextStyle(color: Colors.grey[100]),
                          controller: _dobController,
                          decoration: InputDecoration(
                            labelText: 'Date of Birth',  labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[300]),
                            border: OutlineInputBorder(borderRadius: BorderRadius
                                .circular(20) ),),
                          onTap: () => _selectDate(context),
                          readOnly: true,
                        ),
                        SizedBox(height: 12),
                        TextFormField(style: TextStyle(color: Colors.grey[100]),
                          controller: _parentNameController,
                          decoration: InputDecoration(labelText: 'Parent Name',  labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey[300]),
                            border: OutlineInputBorder(borderRadius: BorderRadius
                                .circular(20) ),),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the parent name.';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 24),
                            
                        Text("Gender", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[300])),
                        Row(
                          children: [
                            Radio(
                              value: 'Male',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value.toString();
                                });
                              },
                            ),
                            Text('Male', style: TextStyle(color: Colors.grey[200]),),
                            Radio(
                              value: 'Female',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value.toString();
                                });
                              },
                            ),
                            Text('Female', style: TextStyle(color: Colors.grey[200]),),
                          ],
                        ),
                            
                            
                        SizedBox(height: 25),
                            
                        Center(
                          child: GestureDetector(
                            onTap: _saveProfile,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Create profile",
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


  class Util {
  static Future<String?> getFirstName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('firstName');
  }
}


void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
  ));
}
