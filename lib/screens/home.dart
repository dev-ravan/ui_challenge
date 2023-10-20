// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:plantify/screens/details.dart';
import 'package:plantify/utils/text.dart';
import 'package:plantify/utils/themes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final searchController = TextEditingController();
  bool isFavorite = false;

  @override
  void initState() {
    searchController.text = "Plants";
    super.initState();
  }

  void addToFavorite() {
    setState(() {
      isFavorite = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            buildAppBar(),
            const SizedBox(
              height: 20,
            ),
            buildSearchField(),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(children: [
                          MyTexts().boldText(text: "Found\n10 Results"),
                          const SizedBox(
                            height: 20,
                          ),
                          plantContainer(
                              plantImage: "assets/images/plant_1.png",
                              plantName: "Lucky Jade Plant",
                              price: "\$13.00",
                              variant: ""),
                          const SizedBox(
                            height: 25,
                          ),
                          plantContainer(
                              plantImage: "assets/images/plant_6.png",
                              plantName: "Snake Plant",
                              price: "\$14.99",
                              variant: ""),
                          const SizedBox(
                            height: 25,
                          ),
                          plantContainer(
                              plantImage: "assets/images/plant_3.png",
                              plantName: "Lucky Jade Plant",
                              price: "\$15.99",
                              variant: ""),
                        ]),
                        Column(
                          children: [
                            plantContainer(
                                plantImage: "assets/images/plant_2.png",
                                plantName: "Peperomia Plant",
                                price: "\$12.99",
                                variant: "Super Greens"),
                            const SizedBox(
                              height: 25,
                            ),
                            plantContainer(
                                plantImage: "assets/images/plant_4.png",
                                plantName: "Small Plant",
                                price: "\$10.99",
                                variant: "Super Greens"),
                            const SizedBox(
                              height: 25,
                            ),
                            plantContainer(
                                plantImage: "assets/images/plant_5.png",
                                plantName: "Lucky Jade Plant",
                                price: "\$9.99",
                                variant: "Super Greens"),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

// custom app bar widget
  Widget buildAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        MyTexts().subTitle15(text: "Search Products"),
        const CircleAvatar(
          foregroundImage: AssetImage("assets/images/profile.jpg"),
        )
      ],
    );
  }

  // search textfield
  Widget buildSearchField() {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            height: 50,
            decoration: BoxDecoration(
                color: palette.white, borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: searchController,
              cursorColor: palette.primary,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: palette.grey,
                  )),
            ),
          ),
        ),
        Expanded(
          child: Container(
              height: 50,
              decoration: BoxDecoration(
                  color: palette.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Icon(
                Icons.tune,
                color: palette.black,
              )),
        ),
      ],
    );
  }

  Widget plantContainer(
      {required String plantName,
      required String variant,
      required String plantImage,
      required String price}) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Details(
                      plantImg: plantImage,
                      plantName: plantName,
                      price: price,
                    )));
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width / 2.5,
        decoration: BoxDecoration(
            color: palette.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4.7,
              color: palette.white,
              child: Image.asset(
                plantImage,
                fit: BoxFit.cover,
              ),
            ),
            MyTexts().subTitle12(text: plantName),
            const SizedBox(
              height: 5,
            ),
            MyTexts().subTitle11(text: variant),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyTexts().priceText(text: price),
                CircleAvatar(
                  backgroundColor: palette.black,
                  radius: 11,
                  child: const Icon(
                    Icons.favorite,
                    size: 13,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
