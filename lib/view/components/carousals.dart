import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main(){
  runApp(GetMaterialApp(home: Carousal(),));
}

class Carousal extends StatefulWidget {

  @override
  State<Carousal> createState() => _CarousalState();
}

class _CarousalState extends State<Carousal> {
  int activeIndex = 0;
  var txt = [
            "Are you Vaccinated?",
            "Have you taken the crucial step",
            "Quick and Easy Appointments",
            ];

  var img = [
          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Solo-Viral_Vector-vaccine-27.jpg/1200px-Solo-Viral_Vector-vaccine-27.jpg",
          "https://images.unsplash.com/photo-1632052998134-ee83afa9cced?q=80&w=2010&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/National_Immunization_Campaign_in_%22San_Miguel_Topilejo%22.JPG/220px-National_Immunization_Campaign_in_%22San_Miguel_Topilejo%22.JPG",
          "https://images.unsplash.com/photo-1626420925443-c6421f87daa9?q=80&w=1782&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "https://upload.wikimedia.org/wikipedia/commons/2/20/Poliodrops.jpg",
          "https://plus.unsplash.com/premium_photo-1673953510197-0950d951c6d9?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "https://images.unsplash.com/photo-1632053002434-b203dc8efb37?q=80&w=1778&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "https://images.unsplash.com/photo-1611694449252-02453c27856a?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "https://media.istockphoto.com/id/1400343606/photo/vaccine-and-injection-3d-rendering.jpg?s=2048x2048&w=is&k=20&c=uPTod0eOz-QHo3MthgcHST_Im5j8GDkRJmclfeD-F0o=",
          "https://images.unsplash.com/photo-1615631648086-325025c9e51e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Barros_inaugura_linha_de_produ%C3%A7%C3%A3o_da_vacina_de_febre_amarela_%2828118409009%29.jpg/1200px-Barros_inaugura_linha_de_produ%C3%A7%C3%A3o_da_vacina_de_febre_amarela_%2828118409009%29.jpg",
          "https://upload.wikimedia.org/wikipedia/en/6/68/Medanta_the_medicity_hospital.jpg",
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Human-Male-White-Newborn-Baby-Crying.jpg/800px-Human-Male-White-Newborn-Baby-Crying.jpg",
          // "assets/stack/vaccine2.jpg",
  ];

  // var l = [190,225,215,170,205];

  // var h = [160,145,150,200,145]; 

  // var t = [-10,8,25,2,0]; 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: img.length, itemBuilder: ((context, index, realIndex){
              return 
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 1),
                  child: Image.network(img[index], fit: BoxFit.cover,)
                  ),
                );
              }), 
              
              options: CarouselOptions(
            initialPage: 0,
            height: 160,
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