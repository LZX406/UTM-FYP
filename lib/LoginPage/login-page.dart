// ignore_for_file: file_names, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Dialog.dart';
import 'package:myapp/RegisterPage/register-page.dart';
import 'package:myapp/ResetPasswordPage/resetpassword-page.dart';
import 'package:myapp/Services/Auth.dart';
import 'package:myapp/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => Login();
}

class Login extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;
  bool resetPassword = false;
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  bool passwordInvisible = true;

  bool? validatenull() {
    if (EmailController.text.isEmpty || !EmailController.text.contains("@")) {
      showdialog(context, 'Enter a valid email.');
      return false;
    } else if (PasswordController.text.isEmpty) {
      showdialog(context, 'Password must be filled.');
      return false;
    } else {
      return true;
    }
  }

  Switchpage() {
    if (isLogin) {
      setState(() {
        isLogin = false;
      });
    } else {
      setState(() {
        isLogin = true;
      });
    }
  }

  Resetpasswordpage() {
    if (resetPassword) {
      setState(() {
        resetPassword = false;
      });
    } else {
      setState(() {
        resetPassword = true;
      });
    }
  }

  void visiblepassword() {
    setState(() {
      if (passwordInvisible) {
        passwordInvisible = false;
      } else {
        passwordInvisible = true;
      }
    });
  }

  Future<void> signin() async {
    try {
      await Auth()
          .sign(email: EmailController.text, password: PasswordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = 'Incorrect email or password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    if (isLogin && !resetPassword) {
      return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SizedBox(
            width: double.infinity,
            height: 800 * fem,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                // registerpagesHi (101:5)
                padding: EdgeInsets.fromLTRB(
                    40 * fem, 150 * fem, 44 * fem, 200 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/page-1/images/pexels-monstera-63733052-1-2-bg.png',
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x3f000000),
                      offset: Offset(0 * fem, 4 * fem),
                      blurRadius: 2 * fem,
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      // autogroup6ixrpVn (HUB9hLXJPnriZZ7Zcu6iXr)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 8 * fem),

                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff000000)),
                      ),
                      child: SizedBox(
                        height: 36,
                        child: TextField(
                          controller: EmailController,
                          textAlignVertical: TextAlignVertical.center,
                          decoration: const InputDecoration(
                            filled: true,
                            prefixIcon: Icon(Icons.email, color: Colors.black),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.zero,
                            hintText: 'Email',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // autogroup8brsgAc (HUB9vAVG6Tbqw8gonh8BRS)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 15 * fem),
                      width: double.infinity,
                      height: 36,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff000000)),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 260,
                            child: TextField(
                              controller: PasswordController,
                              obscureText: passwordInvisible,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: const InputDecoration(
                                filled: true,
                                prefixIcon:
                                    Icon(Icons.key, color: Colors.black),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.zero,
                                hintText: 'Password',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 38,
                            height: 36,
                            child: TextButton(
                              onPressed: () {
                                visiblepassword();
                              },
                              child: const Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 36,
                      child: Text(
                        errorMessage == '' ? '' : '$errorMessage',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2125 * ffem / fem,
                          color: const Color.fromARGB(255, 255, 0, 0),
                        ),
                      ),
                    ),
                    Container(
                      // autogrouprzdnsXv (HUBADez7gpoCXqCKexRzdn)
                      margin: EdgeInsets.fromLTRB(
                          70 * fem, 0 * fem, 71 * fem, 47 * fem),
                      width: double.infinity,
                      height: 47 * fem,

                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff000000)),
                        color: const Color(0xffdde0e6),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          if (validatenull() == true) {
                            await signin();
                          }
                        },
                        child: Text(
                          'Login',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 20 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2125 * ffem / fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      // alreadyhaveaccountvm6 (102:27)
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            16 * fem, 0 * fem, 0 * fem, 0 * fem),
                        child: Text(
                          'Create new account?',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2125 * ffem / fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      // signinhereRxk (102:28)
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            11 * fem, 0 * fem, 0 * fem, 0 * fem),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isLogin = false;
                            });
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            'Sign up here',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * ffem / fem,
                              decoration: TextDecoration.underline,
                              color: const Color(0xff1e25de),
                              decorationColor: const Color(0xff1e25de),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      // alreadyhaveaccountvm6 (102:27)
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            16 * fem, 14 * fem, 0 * fem, 0 * fem),
                        child: Text(
                          'Forget password?',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2125 * ffem / fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      // signinhereRxk (102:28)
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                            11 * fem, 0 * fem, 0 * fem, 0 * fem),
                        child: TextButton(
                          onPressed: () {
                            Resetpasswordpage();
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            'Reset password here',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * ffem / fem,
                              decoration: TextDecoration.underline,
                              color: const Color(0xff1e25de),
                              decorationColor: const Color(0xff1e25de),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ));
    } else if (isLogin && resetPassword) {
      return ResetPasswordPage(Resetpasswordpage: Resetpasswordpage);
    } else {
      return RegisterPage(switchpage: Switchpage);
    }
  }
}
