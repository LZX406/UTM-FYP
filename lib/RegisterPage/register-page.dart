// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names, use_build_context_synchronously

import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Dialog.dart';
import 'package:myapp/Services/Auth.dart';
import 'package:myapp/Services/Account_service.dart';
import 'package:myapp/utils.dart';

class RegisterPage extends StatefulWidget {
  final switchpage;
  const RegisterPage({super.key, this.switchpage});
  @override
  State<RegisterPage> createState() => Register();
}

class Register extends State<RegisterPage> {
  String? errorMessage = '';
  bool Created = true;
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  final PasswordController2 = TextEditingController();
  final UsernameController = TextEditingController();
  TextEditingController otp = TextEditingController();
  EmailOTP myauth = EmailOTP();
  bool passwordInvisible = true;

  Future<void> create() async {
    try {
      await Auth().create(
          email: EmailController.text, password: PasswordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
        Created = false;
      });
    }
  }

  Future<bool> checkemailexist() async {
    bool? exist;
    exist = await Accountservice().Checkemailexist(EmailController.text);
    return exist!;
  }

  Future<bool> checkuserexist() async {
    bool? exist;
    exist = await Accountservice().Checkuserexist(UsernameController.text);
    return exist!;
  }

  String validatecontroller() {
    if (EmailController.text.isEmpty || !EmailController.text.contains('@')) {
      return "Enter a valid email";
    }
    if (UsernameController.text.isEmpty) {
      return "Username is required";
    }
    if (PasswordController.text.isEmpty) {
      return "Password is required";
    }
    if (PasswordController.text != PasswordController2.text) {
      return "Incorrect Confirm Password";
    }
    return "Validate complete";
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

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
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
            padding:
                EdgeInsets.fromLTRB(40 * fem, 200 * fem, 44 * fem, 0 * fem),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
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
                Container(
                  // autogroup6ixrpVn (HUB9hLXJPnriZZ7Zcu6iXr)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 8 * fem),

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
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 10 * fem),
                  width: double.infinity,
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff000000)),
                  ),
                  child: TextField(
                    controller: UsernameController,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: const InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.people, color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Username',
                    ),
                  ),
                ),
                Container(
                  // autogroup8brsgAc (HUB9vAVG6Tbqw8gonh8BRS)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 10 * fem),
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
                            prefixIcon: Icon(Icons.key, color: Colors.black),
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
                Container(
                  // autogroupwu6yzKi (HUBA3pwACgCeX7epikWu6Y)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 30 * fem),
                  height: 36,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff000000)),
                  ),
                  child: TextField(
                    controller: PasswordController2,
                    obscureText: passwordInvisible,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: const InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.key, color: Colors.black),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Confirm Password',
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
                  child: Center(
                    child: Center(
                        child: TextButton(
                      onPressed: () async {
                        errorMessage = validatecontroller();
                        if (errorMessage == "Validate complete") {
                          if (await checkemailexist() == true) {
                            showdialog(context, 'Email already exist.');
                          } else if (await checkuserexist() == true) {
                            showdialog(context, 'Username already exist.');
                          } else {
                            myauth.setConfig(
                                appEmail: "me@rohitchouhan.com",
                                appName: "Email OTP",
                                userEmail: EmailController.text,
                                otpLength: 6,
                                otpType: OTPType.digitsOnly);
                            if (await myauth.sendOTP() == true) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("OTP has been sent"),
                              ));
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Card(
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                                controller: otp,
                                                decoration:
                                                    const InputDecoration(
                                                        hintText: "Enter OTP")),
                                          ),
                                          ElevatedButton(
                                              onPressed: () async {
                                                if (await myauth.verifyOTP(
                                                        otp: otp.text) ==
                                                    true) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                          const SnackBar(
                                                    content:
                                                        Text("OTP is verified"),
                                                  ));
                                                  Navigator.pop(context);
                                                  await create();
                                                  if (Created == true) {
                                                    setState(() {});
                                                    Accountservice().CreateUser(
                                                        username:
                                                            UsernameController
                                                                .text,
                                                        email: EmailController
                                                            .text,
                                                        password:
                                                            PasswordController
                                                                .text);
                                                  }
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                          const SnackBar(
                                                    content:
                                                        Text("Invalid OTP"),
                                                  ));
                                                }
                                              },
                                              child: const Text("Verify")),
                                        ],
                                      ),
                                    );
                                  });
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Oops, OTP send failed"),
                              ));
                            }
                          }
                        }
                      },
                      child: Text(
                        'Register',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 20 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2125 * ffem / fem,
                          color: const Color(0xff000000),
                        ),
                      ),
                    )),
                  ),
                ),
                Center(
                  // alreadyhaveaccountvm6 (102:27)
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                        16 * fem, 0 * fem, 0 * fem, 14 * fem),
                    child: Text(
                      'Already have account?',
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
                        widget.switchpage();
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        'Sign in here',
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
      ),
    );
  }
}
