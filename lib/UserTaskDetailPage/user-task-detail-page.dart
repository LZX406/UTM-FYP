// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class UserTaskDetailPage extends StatefulWidget {
  const UserTaskDetailPage({Key? key}) : super(key: key);
  @override
  State<UserTaskDetailPage> createState() => UserTaskDetail();
}

class UserTaskDetail extends State<UserTaskDetailPage> {
  final EndController = TextEditingController();
  final StartController = TextEditingController();
  final httpsUri = Uri.https('www.google.com');
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: SizedBox(
        // usertaskdetailpage6sa (108:144)
        width: double.infinity,
        height: double.infinity,
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
              // completeprojectdesignSkQ (108:158)
              left: 0 * fem,
              top: 71 * fem,
              child: Column(
                children: [
                  Center(
                    child: Align(
                      child: SizedBox(
                        width: 360 * fem,
                        height: 25 * fem,
                        child: Text(
                          'COMPLETE PROJECT DESIGN ',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 20 * ffem,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            height: 1.2125 * ffem / fem,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 330 * fem,
                      height: 15 * fem,
                      child: Text(
                        'TASK NAME',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 12 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2125 * ffem / fem,
                          decoration: TextDecoration.none,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    child: SizedBox(
                      width: 330 * fem,
                      height: 20 * fem,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffffffff)),
                        ),
                        child: Text(
                          'COMPLETE PROJECT DESIGN',
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.none,
                            height: 1.2125 * ffem / fem,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Align(
                    child: SizedBox(
                      width: 330 * fem,
                      height: 15 * fem,
                      child: Text(
                        'Task info',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 12 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2125 * ffem / fem,
                          decoration: TextDecoration.none,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    child: SizedBox(
                      width: 330 * fem,
                      height: 120 * fem,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffffffff)),
                        ),
                        child: Text(
                          'Project Link:',
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2125 * ffem / fem,
                            decoration: TextDecoration.none,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Align(
                    child: SizedBox(
                      width: 330 * fem,
                      height: 15 * fem,
                      child: Text(
                        'Important link',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 12 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2125 * ffem / fem,
                          decoration: TextDecoration.none,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    child: SizedBox(
                      width: 330 * fem,
                      height: 30 * fem,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffffffff)),
                        ),
                        child: Material(
                          color: const Color(0x00000000),
                          child: InkWell(
                            onTap: () => launchUrl(httpsUri),
                            child: Text(
                              'http::/www.project.com',
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 12 * ffem,
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
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Align(
                        child: SizedBox(
                          width: 165 * fem,
                          height: 15 * fem,
                          child: Text(
                            'Start date',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * ffem / fem,
                              decoration: TextDecoration.none,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        child: SizedBox(
                          width: 165 * fem,
                          height: 15 * fem,
                          child: Text(
                            'End date',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.2125 * ffem / fem,
                              decoration: TextDecoration.none,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Align(
                        child: SizedBox(
                          width: 155 * fem,
                          height: 35 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffffffff)),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 125,
                                  height: 35,
                                  child: Text(
                                    '20/5/2023',
                                    style: SafeGoogleFont(
                                      'Inter',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2125 * ffem / fem,
                                      decoration: TextDecoration.none,
                                      color: const Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                  height: 40,
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    child: TextButton(
                                        onPressed: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime
                                                      .now(), //get today's date
                                                  firstDate: DateTime(
                                                      2000), //DateTime.now() - not to allow to choose before today.
                                                  lastDate: DateTime(2101));

                                          if (pickedDate != null) {
                                            //get the picked date in the format => 2022-07-04 00:00:00.000
                                            String formattedDate =
                                                DateFormat('yyyy-MM-dd').format(
                                                    pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                            //formatted date output using intl package =>  2022-07-04
                                            //You can format date as per your need

                                            setState(() {
                                              StartController.text =
                                                  formattedDate; //set foratted date to TextField value.
                                            });
                                          } else {}
                                        },
                                        child: const Icon(Icons.calendar_month,
                                            color: Colors.white, size: 25)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Align(
                        child: SizedBox(
                          width: 165 * fem,
                          height: 35 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffffffff)),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 125,
                                  height: 35,
                                  child: Text(
                                    '25/5/2023',
                                    style: SafeGoogleFont(
                                      'Inter',
                                      fontSize: 12 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.2125 * ffem / fem,
                                      decoration: TextDecoration.none,
                                      color: const Color(0xffffffff),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                  height: 40,
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    child: TextButton(
                                        onPressed: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime
                                                      .now(), //get today's date
                                                  firstDate: DateTime(
                                                      2000), //DateTime.now() - not to allow to choose before today.
                                                  lastDate: DateTime(2101));

                                          if (pickedDate != null) {
                                            //get the picked date in the format => 2022-07-04 00:00:00.000
                                            String formattedDate =
                                                DateFormat('yyyy-MM-dd').format(
                                                    pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                                            //formatted date output using intl package =>  2022-07-04
                                            //You can format date as per your need

                                            setState(() {
                                              EndController.text =
                                                  formattedDate; //set foratted date to TextField value.
                                            });
                                          } else {}
                                        },
                                        child: const Icon(Icons.calendar_month,
                                            color: Colors.white, size: 25)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      SizedBox(
                        width: 165 * fem,
                        height: 15 * fem,
                        child: Text(
                          'Progress',
                          textAlign: TextAlign.left,
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2125 * ffem / fem,
                            decoration: TextDecoration.none,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                      const SizedBox(width: 80),
                      SizedBox(
                        width: 85 * fem,
                        height: 15 * fem,
                        child: Text(
                          ' 70%',
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2125 * ffem / fem,
                            decoration: TextDecoration.none,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 330 * fem,
                    height: 20 * fem,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25 * fem),
                        border: Border.all(color: const Color(0xffffffff)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 90),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => Dialog(
                                      backgroundColor: Colors.black,
                                      insetPadding: const EdgeInsets.symmetric(
                                          horizontal: 40, vertical: 40),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 25, vertical: 30),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const SizedBox(height: 14),
                                            const Text(
                                              "Save successfull",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(height: 40),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              },
                                              child: const Text(
                                                "OK",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ));
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            width: 180 * fem,
                            height: 57.22 * fem,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xff00ff19)),
                            ),
                            child: Center(
                              child: Text(
                                'Save',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 15 * ffem,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                  height: 1.2125 * ffem / fem,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Container(
                            width: 180 * fem,
                            height: 57.22 * fem,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: const Color(0xffff0000)),
                            ),
                            child: Center(
                              child: Text(
                                'Back',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 15 * ffem,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                  height: 1.2125 * ffem / fem,
                                  color: const Color(0xffffffff),
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
          ],
        ),
      ),
    );
  }
}
