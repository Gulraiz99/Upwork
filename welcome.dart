import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'Animation/AnimationBuildLogin.dart';
import 'Constant/ColorGolobal.dart';
import 'Constant/frequentWidget.dart';
import 'Constant/TextField.dart';

import 'AuthButton.dart';
import 'sign_up.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  var top = FractionalOffset.topCenter;
  var bottom = FractionalOffset.bottomCenter;
  double width = 190.0;
  double widthIcon = 200.0;
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode phoneFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  getDisposeController() {
    phoneController.clear();
    passwordController.clear();
    phoneFocus.unfocus();
    passwordFocus.unfocus();
  }

  @override
  void initState() {
    super.initState();
    getDisposeController();
  }

  @override
  void dispose() {
    getDisposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    final double paddingValue =
        keyboardOpen ? 0.0 : 70.0; // Set your desired padding value here

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
                      ColorGlobal.colorPrimaryDark.withOpacity(0.7),
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
                  yOffset: size.height / 1.36,
                  color: ColorGlobal.whiteColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/Icon/iconn.png',
                      height: 100,
                      width: 100,
                      color: ColorGlobal.whiteColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 22,
                  left: 22,
                  top: 200,
                  bottom: 22,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: TextFieldWidget(
                        suffixIconData: Icons.call,
                        onChanged: (value) {},
                        hintText: 'Enter your Phone number',
                        obscureText: false,
                        prefixIconData: Icons.call,
                        textEditingController: phoneController,
                        focusNode: phoneFocus,
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Container(
                      child: TextFieldWidget(
                        suffixIconData: Icons.lock,
                        onChanged: (value) {},
                        hintText: 'Password',
                        obscureText: true,
                        prefixIconData: Icons.lock,
                        textEditingController: passwordController,
                        focusNode: passwordFocus,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 8, top: 18),
                      child: Text(
                        "Forget Password ?",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 18,
                          color: ColorGlobal.whiteColor.withOpacity(0.9),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.transparent,
                      margin: EdgeInsets.only(
                        top: 40,
                        right: 8,
                        left: 8,
                        bottom: 20,
                      ),
                      child: AuthButton(),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[],
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
        color: ColorGlobal.whiteColor,
        height: 70,
        margin: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AnimatedContainer(
                  width: widthIcon,
                  duration: Duration(seconds: 1),
                  curve: Curves.linear,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[],
                  ),
                ),
                InkWell(
                  onTap: () {
                    getDisposeController();
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        duration: Duration(milliseconds: 800),
                        child: SignUpPage(),
                      ),
                    ).then((value) {
                      Future.delayed(Duration(milliseconds: 300), () {
                        setState(() {
                          width = 190;
                          widthIcon = 200;
                        });
                      });
                    });
                    setState(() {
                      width = 400.0;
                      widthIcon = 0;
                    });
                  },
                  child: AnimatedContainer(
                    height: 65.0,
                    width: width,
                    duration: Duration(milliseconds: 1000),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: ColorGlobal.whiteColor,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "Not Yet Register ?",
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
                                  "Sign Up",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 1,
                                    color:
                                        ColorGlobal.whiteColor.withOpacity(0.9),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    curve: Curves.linear,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                      color: ColorGlobal.colorPrimaryDark,
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
