
import 'package:doctor_baby/view/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; 

void main() {
  runApp(MaterialApp(home: RegPage(), debugShowCheckedModeBanner: false));
}

class RegPage extends StatefulWidget {
  const RegPage({Key? key}) : super(key: key);

  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  final user = TextEditingController();
  final first = TextEditingController();
  final last = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final pass = TextEditingController();

  Future<void> _registerUser() async {
    const String apiUrl = 'http://10.0.2.2:8000/babyapp/authtoken/';

    String userName = user.text;
    String firstName = first.text;
    String lastName = last.text;
    String userEmail = email.text;
    String userPhone = phone.text;
    String userPassword = pass.text;

    if (firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        userEmail.isNotEmpty &&
        userPhone.isNotEmpty &&
        userPassword.isNotEmpty) {
      try {
        final response = await http.post(
          Uri.parse(apiUrl),
          body: {
            'username': userName,
            'first_name': firstName,
            'last_name': lastName,
            'email': userEmail,
            'phone': userPhone,
            'password': userPassword,
          },
        );

        if (response.statusCode == 201) {
          print('User registered successfully');
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
        } else {
          print('Failed to register user: ${response.statusCode}');
        }
      } catch (e) {
        print('Exception during registration: $e');
      }
    } else {
      print('All fields are required');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://plus.unsplash.com/premium_photo-1702598514328-df24125131cd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",),fit: BoxFit.fitHeight)),
            child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
                  child: Card(
                    color: Colors.black54,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      // color: Colors.white30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      
                        const SizedBox(height: 10),
                      
                        Text("Registration", style: TextStyle(color: Colors.blue, fontSize: 25),),
                      
                                const SizedBox(height: 20),  
                      
                                Text("Username",style: TextStyle(color: Colors.grey),),
                      
                                  SizedBox(height: 5),
                      
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25)
                                      ),
                                      child: TextField(
                                        controller: user,
                                        style: TextStyle(color: Colors.grey[100]),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                          isDense: true,
                                          hintText: "username",hintStyle: TextStyle(color: Colors.grey[200]),
                                          fillColor: Colors.green
                                        ),
                                      ),
                                    ),
                                const SizedBox(height: 15),  
                                Text("First name",style: TextStyle(color: Colors.grey)),
                      
                                  SizedBox(height: 5),
                      
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25)
                                      ),
                                      child: TextField(
                                        controller: first,
                                        style: TextStyle(color: Colors.grey[100]),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                          isDense: true,
                                          hintText: "first name",hintStyle: TextStyle(color: Colors.grey[200]),
                                          fillColor: Colors.green
                                        ),
                                      ),
                                    ),
                                const SizedBox(height: 25),  
                      
                                Text("Last name",style: TextStyle(color: Colors.grey)),
                      
                                  SizedBox(height: 5),
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25)
                                      ),
                                      child: TextField(
                                        controller: last,
                                        style: TextStyle(color: Colors.grey[100]),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                          isDense: true,
                                          hintText: "last name",hintStyle: TextStyle(color: Colors.grey[200]),
                                          fillColor: Colors.green
                                        ),
                                      ),
                                    ),
                                const SizedBox(height: 15),  
                      
                                Text("Email",style: TextStyle(color: Colors.grey)),
                      
                                  SizedBox(height: 5),
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25)
                                      ),
                                      child: TextField(
                                        controller: email,
                                        style: TextStyle(color: Colors.grey[100]),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                          isDense: true,
                                          hintText: "email",hintStyle: TextStyle(color: Colors.grey[200]),
                                          fillColor: Colors.green
                                        ),
                                      ),
                                    ),
                                const SizedBox(height: 15),  
                      
                                Text("Phone number",style: TextStyle(color: Colors.grey)),
                      
                                  SizedBox(height: 5),
                      
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25)
                                      ),
                                      child: TextField(
                                        controller: phone,
                                        style: TextStyle(color: Colors.grey[100]),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                          isDense: true,
                                          hintText: "phone number",hintStyle: TextStyle(color: Colors.grey[200]),
                                          fillColor: Colors.green
                                        ),
                                      ),
                                    ),
                                const SizedBox(height: 15),  
                      
                                Text("Password",style: TextStyle(color: Colors.grey)),
                      
                                  SizedBox(height: 5),
                      
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25)
                                      ),
                                      child: TextField(
                                        obscureText: true,
                                        controller: pass,
                                        style: TextStyle(color: Colors.grey[100]),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                          isDense: true,
                                          hintText: "password",hintStyle: TextStyle(color: Colors.grey[200]),
                                          fillColor: Colors.green
                                        ),
                                      ),
                                    ),
                      
                      
                      
                        const SizedBox(height: 25), 
                      
                
                        Padding(
                            padding: const EdgeInsets.only(left: 35),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.blue[700]),
                                fixedSize: MaterialStateProperty.all(Size(250, 40)),
                              ),
                              onPressed: () {
                                _registerUser(); 
                              },
                              child: const Text("SIGNUP", style: TextStyle(color: Colors.white)),
                            ),
                          ),
                
                
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?",style:TextStyle(color: Colors.grey[200]),),
                            TextButton(onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login()));
                            }, child: Text("Sign in"))
                          ],
                        )
                
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
                    ),
          ),
      ),
    );
  }
}