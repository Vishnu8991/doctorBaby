import 'package:animate_do/animate_do.dart';
import 'package:doctor_baby/view/intro_screens/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../components/components.dart';
import '../model/model.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  /// Anime
  Widget animationDo(
      int index,
      int delay,
      Widget child,
      ) {
    if (index == 1) {
      return FadeInDown(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView.builder(
                  controller: pageController,
                  itemCount: listOfItems.length,
                  onPageChanged: (newIndex) {
                    setState(() {
                      currentIndex = newIndex;
                    });
                  },
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: ((context, index) {
                    return SizedBox(
                      width: size.width,
                      height: size.height,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(15, 40, 15, 10),
                            width: size.width,
                            height: size.height / 2.5,
                            child: animationDo(
                              index,
                              100,
                              Image.asset(listOfItems[index].img),
                            ),
                          ),

                          Padding(
                              padding: const EdgeInsets.only(top: 25, bottom: 15),
                              child: animationDo(
                                index,
                                250,
                                Text(
                                  listOfItems[index].title,
                                  textAlign: TextAlign.center,
                                  style: textTheme.headline1?.copyWith(fontSize: 30),
                                ),
                              )),

                          animationDo(
                            index,
                            500,
                            Text(
                              listOfItems[index].subTitle,
                              textAlign: TextAlign.center,
                              style: textTheme.headline2,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),

              /// --------------------------
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                      controller: pageController,
                      count: listOfItems.length,
                      effect: const ExpandingDotsEffect(
                        spacing: 6.0,
                        radius: 10.0,
                        dotWidth: 10.0,
                        dotHeight: 10.0,
                        expansionFactor: 3.8,
                        dotColor: Colors.grey,
                        activeDotColor: MyColors.btnColor,
                      ),
                      onDotClicked: (newIndex) {
                        setState(() {
                          currentIndex = newIndex;
                          pageController.animateToPage(newIndex,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);
                        });
                      },
                    ),
                    currentIndex == 2

                        ? GetStartBtn(size: size, textTheme: textTheme)

                        : SkipBtn(
                      size: size,
                      textTheme: textTheme,
                      onTap: () {
                        setState(() {
                          pageController.animateToPage(2,
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.fastOutSlowIn);
                        });
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}