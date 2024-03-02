import 'package:doctor_baby/controller/baby_profile_controller.dart';
import 'package:doctor_baby/model/baby_profile_model.dart';
import 'package:doctor_baby/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BabyProfilePage extends StatelessWidget {
  final BabyProfileController _controller = Get.put(BabyProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 10, bottom: 10),
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => Home(),
                  ),
                );
              },
              label: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Container(child: Text("Logout",style: TextStyle(fontSize: 18, color: Colors.white),)),
              ),backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Baby Profile'),
      ),
      body: Obx(() => ListView.builder(
        itemCount: _controller.profile.length,
        itemBuilder: (context, index){
          BabyProfile babyProfile =_controller.profile[index]; 

        String formattedDate = babyProfile.dateOfBirth != null
                        ? DateFormat('yyyy-MM-dd').format(babyProfile.dateOfBirth!)
                        : 'N/A';

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.black,
            child: Container(
              alignment: Alignment.center,
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
            
                  Icon(Icons.person, size: 250,color: Colors.grey,),
            
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                      color: Colors.black,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text('Firstname:          ${babyProfile.firstName!}', style: TextStyle(fontSize: 18, color: Colors.grey[300]),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                      color: Colors.black,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text('Lastname:          ${babyProfile.lastName!}', style: TextStyle(fontSize: 18, color: Colors.grey[300]),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                      color: Colors.black,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text('Sex:                     ${babyProfile.sex!}', style: TextStyle(fontSize: 18, color: Colors.grey[300]),)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                      color: Colors.black,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text('Date of birth:      $formattedDate', style: TextStyle(fontSize: 18, color: Colors.grey[300]),)),
                  ),
                ],
              ),
            ),
          ),
        );
      }))
    );
  }
}
