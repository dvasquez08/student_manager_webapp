import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_manager/Web_UI.dart';
import 'package:student_manager/components.dart';
import 'package:student_manager/students_north.dart';
import 'package:student_manager/students_terwilliger.dart';
import 'package:student_manager/students_west.dart';
import 'package:student_manager/view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class studentsWindermere extends HookConsumerWidget {
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
            // Beginning of side menu section

            Row(
              children: [
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

                // End of side menu section

                // Beginning of main section which contains the lists

                Container(
                  width: widthDevice / 1.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 100.0),
                      TextBlack("Windermere Students", 40.0),
                    ],
                  ),
                ),
                Container(
                  width: widthDevice / 1.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 100.0),
                      TextBlack("West Students", 40.0),
                      SizedBox(height: 20.0),
                      TextBlack("Attended", 25.0),

                      // Beginning of attendance lists section

                      Expanded(
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("studentsWest")
                                .doc("all")
                                .collection("attended")
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      DocumentSnapshot documentSnapshot =
                                          snapshot.data!.docs[index];
                                      final dateFormat =
                                          DateFormat('MMM dd, yyyy hh:mm a');
                                      final timestamp =
                                          documentSnapshot["date"];
                                      final dateTime = timestamp.toDate();
                                      final formattedDate =
                                          dateFormat.format(dateTime);
                                      return attendanceRecord(
                                        code: documentSnapshot["code"],
                                        date: formattedDate,
                                      );
                                    });
                              } else
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                            }),
                      ),

                      // End of attendance list section

                      // Beginning of student list section

                      SizedBox(height: 20.0),
                      TextBlack("Student List", 25.0),
                      SizedBox(height: 15.0),
                      Expanded(
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection("studentsWest")
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      DocumentSnapshot documentSnapshot =
                                          snapshot.data!.docs[index];
                                      return studentList(
                                          fullname:
                                              documentSnapshot["fullname"],
                                          belt: documentSnapshot["belt"],
                                          phone: documentSnapshot["phone"],
                                          email: documentSnapshot["email"],
                                          address: documentSnapshot["address"]);
                                    });
                              } else
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                            }),
                      ),

                      // End of student list section
                    ],
                  ),
                ),

                // End of main section with the lists.
              ],
            ),

            // Beginning of header section

            Container(
              decoration: BoxDecoration(color: secondaryColour),
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

            // End of header section
          ],
        ),
      ),
    );
  }
}
