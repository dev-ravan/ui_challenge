import 'package:flutter/material.dart';
import 'package:plantify/screens/home.dart';
import 'package:plantify/utils/text.dart';
import 'package:plantify/utils/themes.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home()));
                },
                child: Align(
                  alignment: Alignment.topRight,
                  child: MyTexts().subTitle15(text: "Skip"),
                ),
              ),
              Expanded(
                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: introImages.length,
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                    },
                    itemBuilder: (_, i) {
                      return Column(
                        children: [
                          Image.asset(
                            introImages[i].image,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width * 0.95,
                          ),
                        ],
                      );
                    }),
              ),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        introImages.length,
                        (index) => buildDot(index),
                      ),
                    ),
                    buildContent(),
                    buildGoButton()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // dot indicator for current image identification

  Container buildDot(int index) {
    return Container(
      height: 7,
      width: currentIndex == index ? 18 : 7,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index ? palette.secondary : palette.grey),
    );
  }

  // content text

  Widget buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: 'Enjoy your \nLife with ',
              style: TextStyle(
                  color: palette.black,
                  fontSize: 38,
                  fontFamily: "Avalon",
                  letterSpacing: 1)),

          TextSpan(
              text: 'Plants',
              style: TextStyle(
                  fontSize: 38,
                  color: palette.black,
                  fontFamily: "Avalon",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1)), // this is invisible
        ]),
      ),
    );
  }

  // Go button widget

  Widget buildGoButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Home()));
      },
      child: CircleAvatar(
        backgroundColor: palette.primary,
        radius: 45,
        child: const Icon(
          Icons.east,
          size: 45,
        ),
      ),
    );
  }

  // Intro slide images
  List<IntroImage> introImages = [
    IntroImage(image: "assets/images/plant_2.png"),
    IntroImage(image: "assets/images/plant_3.png"),
    IntroImage(image: "assets/images/plant_4.png"),
  ];
}

class IntroImage {
  String image;
  IntroImage({required this.image});
}
