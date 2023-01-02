import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_manager/components.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:student_manager/view_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class loginscreen extends HookConsumerWidget {
  static const forthColour = Color(0XFF004aad);
  static const secondaryColour = Color(0XFF8d99ae);
  static const thirdColour = Color(0XFFedf2f4);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController _emailField = useTextEditingController();
    TextEditingController _passwordField = useTextEditingController();
    final viewModelProvider = ref.watch(viewModel);
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: thirdColour,
        body: Stack(
          children: [
            // Beginning of header section with logos

            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: secondaryColour),
              height: heightDevice / 9,
              width: widthDevice,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 15.0),
                  Image.asset("assets/kukkiwon_logo.png"),
                  SizedBox(width: 150.0),
                  Image.asset("assets/new-logo.png"),
                  SizedBox(width: 150.0),
                  Image.asset("assets/wt_logo.png"),
                ],
              ),
            ),

            // End of header section

            // Beginning of main section where login screen is

            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextBlack("Taekwondo Student Manager", 40.0),
                  SizedBox(height: 15.0),
                  TextBlack("Enter username and password below to enter", 25.0),
                  SizedBox(height: 15.0),
                  Image.asset(
                    "assets/loginLogo2.png",
                    width: widthDevice / 7,
                    height: heightDevice / 7,
                  ),
                  SizedBox(height: 15.0),

                  // username text field

                  SizedBox(
                    width: 350.0,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textAlign: TextAlign.center,
                      controller: _emailField,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                            size: 30.0,
                          ),
                          hintText: "Email",
                          hintStyle: GoogleFonts.openSans()),
                    ),
                  ),

                  // End of username text field

                  // Beginning of password field

                  SizedBox(height: 20.0),
                  SizedBox(
                    width: 350.0,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: _passwordField,
                      obscureText: viewModelProvider.isObscure,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          prefixIcon: IconButton(
                            icon: Icon(
                              viewModelProvider.isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                              size: 30.0,
                            ),
                            onPressed: () {
                              viewModelProvider.toggleObscure();
                            },
                          ),
                          hintText: "Password",
                          hintStyle: GoogleFonts.openSans()),
                    ),
                  ),

                  // End of password field

                  // Beginning of login button

                  SizedBox(height: 20.0),
                  SizedBox(
                    height: 50.0,
                    width: 150.0,
                    child: MaterialButton(
                      child: SansText("Login", 25.0),
                      splashColor: Colors.grey,
                      color: forthColour,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () async {
                        viewModelProvider.signInWithEmailAndPassword(
                            context, _emailField.text, _passwordField.text);
                      },
                    ),
                  ),

                  // End of login button
                ],
              ),
            )

            // End of main section
          ],
        ),
      ),
    );
  }
}
