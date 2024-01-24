class Items {
  final String img;
  final String title;
  final String subTitle;

  Items({
    required this.img,
    required this.title,
    required this.subTitle,
  });
}

List<Items> listOfItems = [
  Items(
    img: "assets/intro_images/in1.jpg",
    title: "Welcome to Docotor Baby",
    subTitle: "",
  ),
  Items(
    img: "assets/intro_images/in2.jpg",
    title: "Create a profile for your baby",
    subTitle: "",
  ),
  Items(
    img: "assets/intro_images/in3.jpg",
    title:"Know the vaccines timely",
    subTitle: "",
  ),
];