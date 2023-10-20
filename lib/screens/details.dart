import 'package:flutter/material.dart';
import 'package:plantify/utils/text.dart';
import 'package:plantify/utils/themes.dart';

// ignore: must_be_immutable
class Details extends StatefulWidget {
  String? plantName;
  String? plantImg;
  String? price;
  Details(
      {required this.plantName,
      required this.plantImg,
      required this.price,
      super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  buildAppBar(),
                  const SizedBox(
                    height: 20,
                  ),
                  buildImageAndDetails(),
                ],
              ),
            ),
          ),
          buildPlantCart(),
        ],
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
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.shopping_cart_outlined)),
      ],
    );
  }
  // Image and content widget

  Widget buildImageAndDetails() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          SizedBox(
              height: MediaQuery.of(context).size.height / 2.4,
              child: Image.asset(
                widget.plantImg!,
                fit: BoxFit.cover,
              )),
          // Title and content
          MyTexts().boldText(text: widget.plantName!),
          const SizedBox(
            height: 20,
          ),
          MyTexts().subTitle15(
              text:
                  "Plants make your life with minimal and happy love the plants more and enjoy life.")
        ],
      );

// Plant temperature, price and cart details
  Widget buildPlantCart() => Container(
        height: MediaQuery.of(context).size.height / 4,
        decoration: BoxDecoration(
            color: palette.primary,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconContent(
                      icon: Icons.height,
                      subTitle: "30cm - 40cm",
                      title: "Height"),
                  iconContent(
                      icon: Icons.device_thermostat_outlined,
                      subTitle: "20c to 25c",
                      title: "Temperature"),
                  iconContent(
                      icon: Icons.compost_outlined,
                      subTitle: "Ceramic Pot",
                      title: "Pot"),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              addToCart()
            ],
          ),
        ),
      );

  Widget iconContent(
          {required String title,
          required String subTitle,
          required IconData icon}) =>
      Column(
        children: [
          Icon(
            icon,
            size: 30,
            color: palette.white,
          ),
          MyTexts().subTitleWhite12(text: title),
          const SizedBox(
            height: 05,
          ),
          MyTexts().subTitleWhite11(text: subTitle),
        ],
      );

  // Add to cart components

  Widget addToCart() => Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyTexts().subTitle13White(text: "Total Price"),
                MyTexts().subTitle15White(text: widget.price!),
              ],
            ),
          ),
          Expanded(
              child: Container(
            height: MediaQuery.of(context).size.height / 14,
            decoration: BoxDecoration(
                color: palette.secondary,
                borderRadius: BorderRadius.circular(15)),
            child:
                Center(child: MyTexts().subTitle15White(text: "Add to Cart")),
          ))
        ],
      );
}
