import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:student_manager/components.dart';
import 'package:student_manager/students_north.dart';
import 'package:student_manager/students_terwilliger.dart';
import 'package:student_manager/students_west.dart';
import 'package:student_manager/students_windermere.dart';
import 'package:student_manager/view_model.dart';

//This is the main page that users will get into initially after login. Right
//now there is not much in this screen but it will be filled in with data
//in the future depending on how the business wants to grow and what direction
//they want to take.

class webView extends HookConsumerWidget {
  static const primaryColour = Color(0xFF003566);
  static const secondaryColour = Color(0XFF8d99ae);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelProvider = ref.watch(viewModel);
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Row(
              children: [
                //Beginning of the side menu section. This is the container that
                //appears on the left and has navigation menu buttons to navigate
                //to other locations' pages.

                Container(
                  decoration: BoxDecoration(color: primaryColour),
                  height: heightDevice,
                  width: widthDevice / 4.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 90.0),
                      NavButton("Home", webView()),
                      SizedBox(height: 15.0),
                      NavButton("North Students", studentsNorth()),
                      SizedBox(height: 15.0),
                      NavButton("West Students", studentsWest()),
                      SizedBox(height: 15.0),
                      NavButton("Terwilliger Students", studentsTerwilliger()),
                      SizedBox(height: 15.0),
                      NavButton("Windermere Students", studentsWindermere()),
                      SizedBox(height: 15.0),
                      MaterialButton(
                        onPressed: () async {
                          await viewModelProvider.logout();
                        },
                        child: Text(
                          "Logout",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),

                //end of side menu section

                Container(
                  width: widthDevice / 1.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 100.0),
                      TextBlack("Dashboard", 40.0),
                    ],
                  ),
                ),
              ],
            ),

            // This section is the top part where the logo is. The reason why
            // it was placed at the bottom of the code here is because when it
            // was initially coded, it was placed first at the top lines of the
            // code however, when coding the side menu, this section appears
            // underneath the menu, so this was placed at the bottom liens of code
            // so that it appears on top of the menu and does not get covered.

            Container(
              decoration: BoxDecoration(
                color: secondaryColour,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(2, 2),
                    blurRadius: 25.0,
                  ),
                ],
              ),
              height: heightDevice / 9,
              width: widthDevice,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/new-logo.png"),
                  SizedBox(width: 100.0),
                  SansText("Taegeuk Taekwondo Student Manager", 30.0)
                ],
              ),
            ),

            // End of top logo section
          ],
        ),
      ),
    );
  }
}
