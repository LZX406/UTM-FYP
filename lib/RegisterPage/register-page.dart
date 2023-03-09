// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:myapp/LoginPage/login-page.dart';
import 'package:myapp/utils.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: Container(
        // registerpagesHi (101:5)
        padding: EdgeInsets.fromLTRB(40 * fem, 150 * fem, 44 * fem, 200 * fem),
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
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 8 * fem),

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
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 35 * fem),
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
              // autogroupwu6yzKi (HUBA3pwACgCeX7epikWu6Y)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 50 * fem),
              height: 36,
              width: double.infinity,
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
                  hintText: 'Confirm Password',
                ),
              ),
            ),
            Container(
              // autogrouprzdnsXv (HUBADez7gpoCXqCKexRzdn)
              margin:
                  EdgeInsets.fromLTRB(70 * fem, 0 * fem, 71 * fem, 47 * fem),
              width: double.infinity,
              height: 47 * fem,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff000000)),
                color: const Color(0xffdde0e6),
              ),
              child: Center(
                child: Center(
                    child: TextButton(
                  onPressed: () {},
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
                margin:
                    EdgeInsets.fromLTRB(16 * fem, 0 * fem, 0 * fem, 14 * fem),
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
                margin:
                    EdgeInsets.fromLTRB(11 * fem, 0 * fem, 0 * fem, 0 * fem),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
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
    );
  }
}
