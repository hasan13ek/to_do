import 'package:flutter/material.dart';
import 'package:to_do/utils/app_colors/app_colors.dart';
import 'package:to_do/utils/app_icons/app_icons.dart';

class FakeModel{
  static List<String> categories = [
    'Personal',
    'Work',
    'Meting',
    'Study',
    'Shopping',
    'Party'
  ];
  static List<Color> colors = [
    MyColors.c_FFD506,
    MyColors.c_5DE61A,
    MyColors.c_D10263,
    MyColors.c_F29130,
    MyColors.c_3044F2,
    MyColors.c_FFFE9B,
    MyColors.c_E4FFDB,
  ];

  static  List<Color> colorsTwo = [
    MyColors.c_FFFE9B,
    MyColors.c_B5FF9B,
    MyColors.c_FF9BCD,
    MyColors.c_FFD09B,
    MyColors.c_9BFFF8,
    MyColors.c_F59BFF
  ];
  static List images = [
    AppIcons.iconPerson,
    AppIcons.iconBriefcase,
    AppIcons.iconPresentation,
    AppIcons.iconShoppingBasket,
    AppIcons.iconConfetti,
    AppIcons.iconMolecule
  ];

}