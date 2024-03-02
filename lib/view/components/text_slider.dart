import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main(){
  runApp(GetMaterialApp(home: TextSlider(),));
}

class TextSlider extends StatefulWidget {

  @override
  State<TextSlider> createState() => _TextSliderState();
}

class _TextSliderState extends State<TextSlider> {
  int activeIndex = 0;
  var txt = [
            "Are you Vaccinated?",
            "Have you taken the crucial step",
            "Quick and Easy Appointments",
            "Take the important step towards protection",
            "Secure your spot with hassle-free appointments",
            "Ensure your safety with a quick and easy vaccination process",
            "Have you completed the crucial vaccination process?",
            "Swift and convenient appointments for your vaccination",
            "Take the essential step for your health and well-being",
            "Effortless and speedy vaccination appointments await you",
            "Prioritize your health with a quick and easy vaccination experience",
            "Secure your immunity through simple and convenient appointments.",
            ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: txt.length, itemBuilder: ((context, index, realIndex){
              return 
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                  color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(txt[index], style: TextStyle(color: Colors.white, fontSize: 18),),
                  ),
                );
              }), 
              
              options: CarouselOptions(
            initialPage: 0,
            height: 80,
            // aspectRatio: 16/9,
            viewportFraction: 1,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayCurve: Curves.linear,
            // enlargeCenterPage: true,
            // enlargeFactor: .3,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          )),
          // buildIndicator(),
      ],
    );
  }

  Widget buildIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: txt.length,
      effect: ScrollingDotsEffect(
        activeDotColor: Colors.black,
        dotHeight: 9,
        dotWidth: 9,
        strokeWidth:  1.5
      ),
    );
  }
}