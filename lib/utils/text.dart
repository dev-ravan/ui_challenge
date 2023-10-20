import 'package:flutter/material.dart';
import 'package:plantify/utils/themes.dart';

class MyTexts {
  Widget subTitle15({required String text}) => Text(
        text,
        style: const TextStyle(
            fontFamily: "Avalon", fontSize: 15, letterSpacing: 1),
      );

  Widget subTitle15White({required String text}) => Text(
        text,
        style: TextStyle(
            fontFamily: "Avalon",
            fontSize: 15,
            letterSpacing: 1,
            fontWeight: FontWeight.w600,
            color: palette.white),
      );
  Widget subTitle13White({required String text}) => Text(
        text,
        style: TextStyle(
            fontFamily: "Avalon",
            fontSize: 13,
            letterSpacing: 1,
            fontWeight: FontWeight.w600,
            color: palette.white),
      );

  Widget subTitle12({required String text}) => Text(
        text,
        style: const TextStyle(
            fontFamily: "Avalon", fontSize: 12, fontWeight: FontWeight.w600),
      );

  Widget subTitle11({required String text}) => Text(
        text,
        style:
            TextStyle(fontFamily: "Avalon", fontSize: 11, color: palette.grey),
      );

  Widget priceText({required String text}) => Text(
        text,
        style: TextStyle(
            fontFamily: "Avalon",
            fontSize: 13,
            color: palette.black,
            fontWeight: FontWeight.bold),
      );

  Widget boldText({required String text}) {
    return Text(text,
        style: TextStyle(
            fontSize: 28,
            color: palette.black,
            fontFamily: "Avalon",
            fontWeight: FontWeight.w700,
            letterSpacing: 1));
  }

  Widget subTitleWhite12({required String text}) => Text(
        text,
        style: TextStyle(
            color: palette.white,
            fontFamily: "Avalon",
            fontSize: 12,
            fontWeight: FontWeight.w700),
      );

  Widget subTitleWhite11({required String text}) => Text(
        text,
        style:
            TextStyle(fontFamily: "Avalon", fontSize: 11, color: palette.white),
      );
}
