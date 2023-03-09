import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // grouptaskprogressreplypage19i (108:721)
        width: double.infinity,
        height: 800.22*fem,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              // hdwallpaperhomerosimpsonshomer (108:722)
              left: 0*fem,
              top: 0*fem,
              child: Align(
                child: SizedBox(
                  width: 360*fem,
                  height: 799*fem,
                  child: Image.asset(
                    'assets/page-1/images/hd-wallpaper-homero-simpsons-homer-simpsons-phone-sad-the-simpsons-thumbnail-1-iwS.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              // group6yEx (108:723)
              left: 67*fem,
              top: 0*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(55*fem, 8*fem, 57*fem, 6*fem),
                width: 145*fem,
                height: 58*fem,
                decoration: BoxDecoration (
                  border: Border.all(color: Color(0xff000000)),
                  color: Color(0xffffffff),
                ),
                child: Center(
                  // download11rZe (108:725)
                  child: SizedBox(
                    width: 33*fem,
                    height: 44*fem,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6*fem),
                      child: Image.asset(
                        'assets/page-1/images/download-1-1-PVi.png',
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // group7aVe (108:726)
              left: 0*fem,
              top: 0*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(20*fem, 19*fem, 20*fem, 29*fem),
                width: 67*fem,
                height: 58*fem,
                decoration: BoxDecoration (
                  border: Border.all(color: Color(0xff000000)),
                  color: Color(0xff8ee7ec),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // line1fX6 (108:728)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 8*fem),
                      width: double.infinity,
                      height: 1*fem,
                      decoration: BoxDecoration (
                        color: Color(0xff000000),
                      ),
                    ),
                    Container(
                      // line21L4 (108:729)
                      width: double.infinity,
                      height: 1*fem,
                      decoration: BoxDecoration (
                        color: Color(0xff000000),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // line3NAc (108:730)
              left: 20*fem,
              top: 38*fem,
              child: Align(
                child: SizedBox(
                  width: 27*fem,
                  height: 1*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // group5GFz (108:731)
              left: 212*fem,
              top: 0*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(45*fem, 4*fem, 46*fem, 2*fem),
                width: 148*fem,
                height: 58*fem,
                decoration: BoxDecoration (
                  border: Border.all(color: Color(0xff000000)),
                  color: Color(0xffd9d9d9),
                ),
                child: Center(
                  // downloadremovebgpreview1kgx (108:733)
                  child: SizedBox(
                    width: 57*fem,
                    height: 52*fem,
                    child: Image.asset(
                      'assets/page-1/images/download-removebg-preview-1-JmN.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // completeprojectdesign5jE (108:735)
              left: 37.5*fem,
              top: 71*fem,
              child: Center(
                child: Align(
                  child: SizedBox(
                    width: 285*fem,
                    height: 25*fem,
                    child: Text(
                      'COMPLETE PROJECT DESIGN',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Inter',
                        fontSize: 20*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2125*ffem/fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // startdateZuJ (108:736)
              left: 16*fem,
              top: 447*fem,
              child: Align(
                child: SizedBox(
                  width: 57*fem,
                  height: 15*fem,
                  child: Text(
                    'Start date',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 12*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125*ffem/fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // enddateTjn (108:737)
              left: 203*fem,
              top: 447*fem,
              child: Align(
                child: SizedBox(
                  width: 51*fem,
                  height: 15*fem,
                  child: Text(
                    'End date',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 12*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125*ffem/fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // tasknameMKN (108:738)
              left: 16*fem,
              top: 124.5*fem,
              child: Align(
                child: SizedBox(
                  width: 69*fem,
                  height: 15*fem,
                  child: Text(
                    'TASK NAME',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 12*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125*ffem/fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // group3T7W (108:739)
              left: 0*fem,
              top: 743*fem,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom (
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: 180*fem,
                  height: 57.22*fem,
                  decoration: BoxDecoration (
                    border: Border.all(color: Color(0xff00ff19)),
                  ),
                  child: Center(
                    child: Center(
                      child: Text(
                        'Save',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont (
                          'Inter',
                          fontSize: 15*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2125*ffem/fem,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // group8hnY (108:742)
              left: 180*fem,
              top: 742*fem,
              child: Container(
                width: 180*fem,
                height: 57.22*fem,
                decoration: BoxDecoration (
                  border: Border.all(color: Color(0xffff0000)),
                ),
                child: Center(
                  child: Center(
                    child: Text(
                      'Return',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Inter',
                        fontSize: 15*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2125*ffem/fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle32nJC (108:745)
              left: 16*fem,
              top: 145*fem,
              child: Align(
                child: SizedBox(
                  width: 324*fem,
                  height: 25*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      border: Border.all(color: Color(0xffffffff)),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // taskinfoVyJ (108:746)
              left: 16*fem,
              top: 200.5*fem,
              child: Align(
                child: SizedBox(
                  width: 51*fem,
                  height: 15*fem,
                  child: Text(
                    'Task info',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 12*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125*ffem/fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle33Ccp (108:747)
              left: 16*fem,
              top: 223*fem,
              child: Align(
                child: SizedBox(
                  width: 324*fem,
                  height: 120*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      border: Border.all(color: Color(0xffffffff)),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // importantlink7Ut (108:748)
              left: 16*fem,
              top: 366.5*fem,
              child: Align(
                child: SizedBox(
                  width: 79*fem,
                  height: 15*fem,
                  child: Text(
                    'Important link',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 12*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125*ffem/fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle35DH2 (108:749)
              left: 16*fem,
              top: 389*fem,
              child: Align(
                child: SizedBox(
                  width: 324*fem,
                  height: 35*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      border: Border.all(color: Color(0xffffffff)),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle369Ag (108:750)
              left: 16*fem,
              top: 465*fem,
              child: Align(
                child: SizedBox(
                  width: 142*fem,
                  height: 35*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      border: Border.all(color: Color(0xffffffff)),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle374oS (108:751)
              left: 203*fem,
              top: 465*fem,
              child: Align(
                child: SizedBox(
                  width: 137*fem,
                  height: 35*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      border: Border.all(color: Color(0xffffffff)),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // completeprojectdesignzh6 (108:754)
              left: 16*fem,
              top: 150*fem,
              child: Align(
                child: SizedBox(
                  width: 170*fem,
                  height: 15*fem,
                  child: Text(
                    'COMPLETE PROJECT DESIGN',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 12*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125*ffem/fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // httpwwwprojectcomUsA (108:755)
              left: 16*fem,
              top: 399*fem,
              child: Align(
                child: SizedBox(
                  width: 133*fem,
                  height: 15*fem,
                  child: Text(
                    'http::/www.project.com',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 12*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125*ffem/fem,
                      decoration: TextDecoration.underline,
                      color: Color(0xff1e25de),
                      decorationColor: Color(0xff1e25de),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // projectlinkyJ8 (108:756)
              left: 16*fem,
              top: 223*fem,
              child: Align(
                child: SizedBox(
                  width: 70*fem,
                  height: 15*fem,
                  child: Text(
                    'Project Link:',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 12*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125*ffem/fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // fAx (108:757)
              left: 17*fem,
              top: 474.5*fem,
              child: Align(
                child: SizedBox(
                  width: 61*fem,
                  height: 15*fem,
                  child: Text(
                    '20/5/2023',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 12*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125*ffem/fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // NLG (108:758)
              left: 203*fem,
              top: 474.5*fem,
              child: Align(
                child: SizedBox(
                  width: 61*fem,
                  height: 15*fem,
                  child: Text(
                    '25/5/2023',
                    style: SafeGoogleFont (
                      'Inter',
                      fontSize: 12*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.2125*ffem/fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // noinvolvedTsW (108:760)
              left: 38.5*fem,
              top: 521*fem,
              child: Center(
                child: Align(
                  child: SizedBox(
                    width: 67*fem,
                    height: 15*fem,
                    child: Text(
                      'No involved',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont (
                        'Inter',
                        fontSize: 12*ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2125*ffem/fem,
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle578ye (108:765)
              left: 17*fem,
              top: 522*fem,
              child: Align(
                child: SizedBox(
                  width: 15*fem,
                  height: 14*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      border: Border.all(color: Color(0xffffffff)),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // line7KYL (108:766)
              left: 23*fem,
              top: 523*fem,
              child: Align(
                child: SizedBox(
                  width: 8*fem,
                  height: 1*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // line8SN4 (108:767)
              left: 19*fem,
              top: 532*fem,
              child: Align(
                child: SizedBox(
                  width: 4*fem,
                  height: 1*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      color: Color(0xffffffff),
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