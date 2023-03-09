// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:myapp/MainTabPage/MainTab.dart';
import 'package:myapp/main.dart';
import 'package:myapp/utils.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
        width: double.infinity,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            // registerpagesHi (101:5)
            padding:
                EdgeInsets.fromLTRB(40 * fem, 150 * fem, 44 * fem, 200 * fem),
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
                Container(
                  // autogroup6ixrpVn (HUB9hLXJPnriZZ7Zcu6iXr)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 8 * fem),

                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff000000)),
                  ),
                  child: const SizedBox(
                    height: 36,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
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
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 35 * fem),
                  width: double.infinity,
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff000000)),
                  ),
                  child: const TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainTab()),
                      );
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
                        16 * fem, 0 * fem, 0 * fem, 14 * fem),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                        );
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
              ],
            ),
          ),
        ));
  }
}
