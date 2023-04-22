import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do/utils/app_images/app_images.dart';
import 'package:to_do/utils/app_text_style/text_style.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSize {
   MyCustomAppBar({
    Key? key,
    required this.title,
    required this.length,
     required this.size
  }) : super(key: key);

   String title;
   int length;
   int size;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: size.toDouble(),
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: Text('Today you have $length tasks',
          style: fontRubikW400(appcolor: Colors.white)),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AppImages.appBar), fit: BoxFit.fill)),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}