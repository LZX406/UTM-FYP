// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:myapp/GroupListPage/group-list-page.dart';
import 'package:myapp/ProfilePage/profile-page.dart';
import 'package:myapp/UserTaskListPage/user-task-list-page.dart';

class MainTab extends StatefulWidget {
  const MainTab({Key? key}) : super(key: key);
  @override
  State<MainTab> createState() => MainTabPage();
}

class MainTabPage extends State<MainTab> {
  int page = 1;
  @override
  void initState() {
    super.initState();
    // Get the order
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return SizedBox(
      width: double.infinity,
      child: SizedBox(
        // grouptasklistpageXSY (107:18)
        width: double.infinity,
        height: 800 * fem,
        child: Stack(
          children: [
            Positioned(
              // hdwallpaperhomerosimpsonshomer (107:19)
              left: 0 * fem,
              top: 0 * fem,
              child: Align(
                child: SizedBox(
                  width: 360 * fem,
                  height: 799 * fem,
                  child: Image.asset(
                    'assets/page-1/images/hd-wallpaper-homero-simpsons-homer-simpsons-phone-sad-the-simpsons-thumbnail-1-xfr.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              // group6evt (116:4)
              left: 67 * fem,
              top: 0 * fem,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    page = 2;
                  });
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  padding:
                      EdgeInsets.fromLTRB(55 * fem, 8 * fem, 57 * fem, 6 * fem),
                  width: 145 * fem,
                  height: 58 * fem,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff000000)),
                    color: const Color(0xffd9d9d9),
                  ),
                  child: Center(
                    // download11KXE (116:6)
                    child: SizedBox(
                      width: 33 * fem,
                      height: 44 * fem,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6 * fem),
                        child: const Icon(Icons.task,
                            color: Colors.black, size: 40),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // group7dnp (116:7)
              left: 0 * fem,
              top: 0 * fem,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    page = 1;
                  });
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                    padding: EdgeInsets.fromLTRB(
                        50 * fem, 19 * fem, 20 * fem, 29 * fem),
                    width: 67 * fem,
                    height: 58 * fem,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff000000)),
                      color: const Color.fromARGB(255, 57, 61, 61),
                    ),
                    child: null),
              ),
            ),
            Positioned(
              // line3c8x (116:11)
              left: 20 * fem,
              top: 18 * fem,
              child: Align(
                child: SizedBox(
                  width: 27 * fem,
                  height: 2 * fem,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // line3c8x (116:11)
              left: 20 * fem,
              top: 28 * fem,
              child: Align(
                child: SizedBox(
                  width: 27 * fem,
                  height: 2 * fem,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // line3c8x (116:11)
              left: 20 * fem,
              top: 38 * fem,
              child: Align(
                child: SizedBox(
                  width: 27 * fem,
                  height: 2 * fem,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // group5K3N (116:12)
              left: 212 * fem,
              top: 0 * fem,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    page = 3;
                  });
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  padding:
                      EdgeInsets.fromLTRB(45 * fem, 4 * fem, 46 * fem, 2 * fem),
                  width: 148 * fem,
                  height: 58 * fem,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff000000)),
                    color: const Color(0xffffffff),
                  ),
                  child: Center(
                    // downloadremovebgpreview1NXS (116:14)
                    child: SizedBox(
                      width: 57 * fem,
                      height: 52 * fem,
                      child: const Icon(Icons.group,
                          color: Colors.black, size: 50),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle14h3W (107:32)
              left: 0 * fem,
              top: 109 * fem,
              child: Align(
                child: SizedBox(
                  width: 360 * fem,
                  height: 122 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff000000)),
                    ),
                  ),
                ),
              ),
            ),
            FutureBuilder(builder: (context, snapshot) {
              if (page == 1) {
                return const ProfilePage();
              }
              if (page == 2) {
                return const UserTaskListPage();
              }
              if (page == 3) {
                return const GroupListPage();
              }
              return const ProfilePage();
            })
          ],
        ),
      ),
    );
  }
}
