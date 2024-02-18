
import 'package:doctor_baby/view/auth/registration.dart';
import 'package:doctor_baby/view/calendar.dart';
import 'package:doctor_baby/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';


void main(){
  runApp(GetMaterialApp(home: Login(),));
}

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> _loginUser() async {
    const String apiUrl = 'http://10.0.2.2:8000/babyapp/authlogin/';

    String userEmail = email.text;
    String userPassword = password.text;

    if (userEmail.isNotEmpty && userPassword.isNotEmpty) {
      try {
        final response = await http.post(
          Uri.parse(apiUrl),
          body: {
            'email': userEmail,
            'password': userPassword,
          },
        );

        if (response.statusCode == 200) {
          print('Login successful');
          Navigator.of(context).push(MaterialPageRoute(builder: ((context) => ProfilePage())));
        } else {
          print('Failed to login: ${response.statusCode}');
        }
      } catch (e) {
        print('Exception during login: $e');
      }
    } else {
      print('Email and password are required');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://plus.unsplash.com/premium_photo-1702598514328-df24125131cd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",),fit: BoxFit.fitHeight)),
          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                        
                        
                
                SizedBox(height: 80,),
                        
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Card(
                      color: Colors.black54,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 25),
                            Text(
                              "Login",
                              style: TextStyle(color: Colors.blue, fontSize: 25),
                            ),
                            const SizedBox(height: 25),
                            Text("Email",style: TextStyle(color: Colors.grey),),
                            SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextField(
                                controller: email,
                                style: TextStyle(color: Colors.grey[100]),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  isDense: true,
                                  hintText: "Enter Email",hintStyle: TextStyle(color: Colors.grey[200]),
                                  fillColor: Colors.green,
                                ),
                              ),
                            ),
                            const SizedBox(height: 25),
                            Text("Password",style: TextStyle(color: Colors.grey),),
                            SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextField(
                                controller: password,
                                obscureText: true,
                                style: TextStyle(color: Colors.grey[100]),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  isDense: true,
                                  hintText: "Enter Password",hintStyle: TextStyle(color: Colors.grey[200]),
                                  fillColor: Colors.green,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                
                          Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("By signing in, I accept the", style: TextStyle(
                                color: Colors.grey[200],
                                fontSize: 13, letterSpacing: 0.4)),
                              GestureDetector(
                                onTap: () => "",
                                child: Text(" Terms and Conditions", 
                                  style: TextStyle(
                                    color: Colors.blue,
                                    letterSpacing: 0.4,
                                    fontSize: 13),),
                              )
                            ],
                          ),
                
                            const SizedBox(height: 20),
                
                            Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.blue[700]),
                                  fixedSize: MaterialStateProperty.all(Size(250, 40)),
                                ),
                                onPressed: () {
                                  _loginUser(); 
                                },
                                child: const Text("Login", style: TextStyle(color: Colors.white)),
                              ),
                            ),
                
                            
                            SizedBox(height: 20,),
                
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account ?", 
                                style: TextStyle(
                                  color: Colors.grey[200]
                                ),),
                                GestureDetector(
                                  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>RegPage(),)),
                                  child: Text("Sign up",
                                  style: TextStyle(color: Colors.blue),)),
                              ],
                            ),

                            SizedBox(height: 20)
                
                
                          ],
                        ),
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