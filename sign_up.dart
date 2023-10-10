import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'Constant/ColorGolobal.dart';
import 'Animation/AnimationBuildLogin.dart';
import 'Constant/frequentWidget.dart';
import 'Constant/TextField.dart';

import 'welcome.dart';
import 'HomePage.dart';

class SignUpPage extends StatefulWidget {
  @override
  SignUpPageState createState() {
    return new SignUpPageState();
  }
}

class SignUpPageState extends State<SignUpPage> {
  var top = FractionalOffset.topCenter;
  var bottom = FractionalOffset.bottomCenter;
  double width = 400.0;
  double widthIcon = 0.0; // Changed the initial width to 0
  TextEditingController phoneNumberController = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode phoneNumberFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        width = 190.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      backgroundColor: ColorGlobal.whiteColor,
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(),
                height: size.height,
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                    colors: [
                      ColorGlobal.colorPrimaryDark.withOpacity(0.8),
                      ColorGlobal.colorPrimary,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeOutQuad,
                child: AnimationBuildLogin(
                  size: size,
                  yOffset: size.height / 1.26,
                  color: ColorGlobal.whiteColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/Icon/iconn.png',
                      height: 120,
                      width: 120,
                      color: ColorGlobal.whiteColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 210.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Create Account !',
                      style: TextStyle(
                        color: ColorGlobal.whiteColor,
                        fontSize: 24.0,
                        letterSpacing: 2,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 22,
                  left: 22,
                  bottom: 22,
                  top: 270,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {
                          // Handle phone number changes here
                        },
                        hintText: 'Phone Number',
                        selectorConfig: SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        ),
                        textFieldController: phoneNumberController,
                        formatInput: false,
                        keyboardType: TextInputType.phone,
                        inputDecoration: InputDecoration(
                          hintText: 'Phone Number',
                          prefixIcon: Icon(Icons.phone),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 20.0,
                          ),
                        ),
                        focusNode: phoneNumberFocus,
                        autoFocus: false,
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 30,
                          right: 8,
                          left: 8,
                          bottom: 20,
                        ),
                        height: 60.0,
                        decoration: BoxDecoration(
                          gradient: new LinearGradient(
                            colors: [
                              ColorGlobal.whiteColor,
                              ColorGlobal.whiteColor.withOpacity(0.7),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: ColorGlobal.colorPrimary.withOpacity(0.6),
                              spreadRadius: 5,
                              blurRadius: 20,
                            ),
                          ],
                          border: Border.all(
                            width: 2,
                            color: ColorGlobal.colorPrimaryDark,
                          ),
                          color: ColorGlobal.whiteColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(22.0),
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "SIGN UP WITH PHONE NUMBER",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 1,
                              color: ColorGlobal.colorPrimary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 30),
        color: ColorGlobal.whiteColor,
        height: 70,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pop(
                      context,
                      PageTransition(
                        child: Login(),
                        type: PageTransitionType.leftToRight,
                        duration: Duration(milliseconds: 800),
                      ),
                    );
                    setState(() {
                      width = 500;
                      widthIcon = 0;
                    });
                  },
                  child: AnimatedContainer(
                    height: 65.0,
                    width: width,
                    duration: Duration(milliseconds: 1000),
                    curve: Curves.linear,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Have an Account",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 14,
                                    letterSpacing: 1,
                                    color:
                                        ColorGlobal.whiteColor.withOpacity(0.9),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                child: Text(
                                  "Sign In",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 2,
                                    color: ColorGlobal.colorPrimaryDark,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
