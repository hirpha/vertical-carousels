import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late Color colors;
  int _currentSlide = 0;
  bool isLastPage = false;
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  List<String> images = [
    "assets/images/image11.jpeg",
    "assets/images/image1.jpeg",
    "assets/images/image9.jpeg",
    "assets/images/image4.jpeg",
    "assets/images/image8.jpeg",
    "assets/images/image5.jpeg",
    "assets/images/image10.jpeg",
    "assets/images/image6.jpeg",
    "assets/images/image3.jpeg",
    "assets/images/image7.jpeg",
  ];

  @override
  void initState() {
    colors = Colors.white;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors,
      body: Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.height * .63,
            top: 0,
            left: 0,
            right: 0,
            child: CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height * .63,
                aspectRatio: 16 / 9,
                viewportFraction: 1.0,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentSlide = index;
                    images = images.reversed.toList();
                  });
                },
              ),
              items: [
                ...List.generate(
                  3,
                  (index) => Row(
                    children: [
                      Expanded(
                        child: ScrollLoopAutoScroll(
                            scrollDirection: Axis.vertical, //required
                            delay: const Duration(microseconds: 100),
                            duration: const Duration(seconds: 50),
                            gap: 10,
                            reverseScroll: false,
                            duplicateChild: 2,
                            enableScrollInput: true,
                            delayAfterScrollInput: const Duration(seconds: 1),
                            child: Column(
                                children: images
                                    .map((e) => ImageContainer(
                                          image: e,
                                        ))
                                    .toList())),
                      ),
                      Expanded(
                        child: ScrollLoopAutoScroll(
                            scrollDirection: Axis.vertical, //required
                            delay: const Duration(microseconds: 100),
                            duration: const Duration(seconds: 50),
                            gap: 10,
                            reverseScroll: true,
                            duplicateChild: 2,
                            enableScrollInput: true,
                            delayAfterScrollInput: const Duration(seconds: 1),
                            child: Column(
                                children: images
                                    .map((e) => ImageContainer(
                                          image: e,
                                        ))
                                    .toList())),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * .54,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height *
                      .5, // Adjust this for the gradient height
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(10),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        colors,
                        colors,
                        colors,
                        colors,
                        colors,
                        colors,
                        colors,
                      ],
                    ),
                  ),
                ),
              )),
          Positioned(
              top: MediaQuery.of(context).size.height * .68,
              left: 0,
              right: 0,
              child: DotsIndicator(
                dotsCount: 3,
                position: _currentSlide,
                decorator: DotsDecorator(
                  size: const Size.square(13.0),
                  activeSize: const Size(45.0, 15.0),
                  activeColor: Colors.amber,
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0)),
                ),
              )),
          Positioned(
              top: MediaQuery.of(context).size.height * .75,
              left: 20,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: Text(
                      "Connect, Share and Empower",
                      style: TextStyle(
                        color: colors == Colors.white
                            ? Colors.black
                            : Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    // margin: EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      "oin a vibrant community of women supporting women. Share your experience, discover inspring stories",
                      style: TextStyle(
                        color: Color.fromARGB(255, 152, 152, 152),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .8,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: colors == Colors.white
                                ? Colors.black
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Set border radius here
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              if (colors == Colors.white) {
                                colors = const Color.fromARGB(255, 33, 33, 33);
                              } else {
                                colors = Colors.white;
                              }
                            });
                          },
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                              // color: Colors.black,
                              color: colors != Colors.white
                                  ? Colors.black
                                  : Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )))
                ],
              )),
        ],
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  final String image;
  const ImageContainer({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black, // Shadow color
            spreadRadius: 5, // How far the shadow spreads
            blurRadius: 7, // Blur effect of the shadow
            offset: Offset(0, 3), // X and Y offset
          ),
        ],
        // image: DecorationImage(
        //   image: AssetImage(
        //       'assets/images/image1.jpeg'), // Replace with your image path
        //   fit: BoxFit.cover,
        // ),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 90, // Adjust this for the gradient height
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black,
                  ],
                ),
              ),
            ),
          )
        ],
      ),

      // child: Image.asset("assets/images/image1.jpeg"),
    );
  }
}
