import 'package:flutter/material.dart';
import 'package:student_manager/components.dart';

class Mobile_Ui extends StatefulWidget {
  const Mobile_Ui({Key? key}) : super(key: key);

  @override
  State<Mobile_Ui> createState() => _Mobile_UiState();
}

class _Mobile_UiState extends State<Mobile_Ui> {
  static const secondaryColour = Color(0XFF8d99ae);
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(color: secondaryColour),
              height: heightDevice / 9,
              width: widthDevice,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/new-logo.png"),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextBlack("Mobile version under construction", 40.0),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
