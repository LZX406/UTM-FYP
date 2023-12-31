// ignore_for_file: file_names, camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class tab extends StatelessWidget {
  final refreshpage;
  final Icon icon;
  const tab({super.key, this.refreshpage, required this.icon});
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Stack(
      children: [
        Positioned(
          // group6evt (116:4)
          left: 67 * fem,
          top: 0 * fem,
          child: TextButton(
            onPressed: () {
              refreshpage(2);
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            child: Container(
              padding:
                  EdgeInsets.fromLTRB(55 * fem, 8 * fem, 57 * fem, 0 * fem),
              width: 145 * fem,
              height: 100 * fem,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff000000)),
                color: const Color(0xffd9d9d9),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                // download11KXE (116:6)
                child: SizedBox(
                  width: 33 * fem,
                  height: 44 * fem,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6 * fem),
                    child: icon,
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
              refreshpage(1);
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 0 * fem),
              width: 67 * fem,
              height: 100 * fem,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff000000)),
                color: const Color.fromARGB(255, 57, 61, 61),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 57 * fem,
                  height: 45 * fem,
                  child:
                      const Icon(Icons.person, color: Colors.white, size: 50),
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
              refreshpage(3);
            },
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            child: Container(
              padding:
                  EdgeInsets.fromLTRB(45 * fem, 10 * fem, 46 * fem, 0 * fem),
              width: 148 * fem,
              height: 100 * fem,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff000000)),
                color: const Color(0xffffffff),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                // downloadremovebgpreview1NXS (116:14)
                child: SizedBox(
                  width: 57 * fem,
                  height: 45 * fem,
                  child: const Icon(Icons.group, color: Colors.black, size: 50),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
