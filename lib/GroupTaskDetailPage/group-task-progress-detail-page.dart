// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/GroupTaskReplyPage/group-task-progress-reply-page.dart';
import 'package:myapp/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class GroupTaskDetailPage extends StatefulWidget {
  const GroupTaskDetailPage({Key? key}) : super(key: key);
  @override
  State<GroupTaskDetailPage> createState() => GroupTaskDetail();
}

class GroupTaskDetail extends State<GroupTaskDetailPage> {
  int positionmember = 3;
  // ignore: non_constant_identifier_names
  final EndController = TextEditingController();
  // ignore: non_constant_identifier_names
  final StartController = TextEditingController();
  final httpsUri = Uri.https('www.google.com');
  List<String> groupnamelist = ["Cerid", "Jason", "Ben", "Zen", "Mike", "John"];
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: Container(
        // grouptaskprogressdetailpagejKN (108:813)
        width: double.infinity,
        height: 800.22 * fem,
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              // hdwallpaperhomerosimpsonshomer (108:814)
              left: 0 * fem,
              top: 0 * fem,
              child: Align(
                child: SizedBox(
                  width: 360 * fem,
                  height: 799 * fem,
                  child: Image.asset(
                    'assets/page-1/images/hd-wallpaper-homero-simpsons-homer-simpsons-phone-sad-the-simpsons-thumbnail-1-dck.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            if (positionmember != 3)
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Align(
                        child: SizedBox(
                          width: 360 * fem,
                          height: 25 * fem,
                          child: Text(
                            'GROUP TASK ',
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
                        const SizedBox(width: 15),
                        Align(
                          alignment: Alignment.center,
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
                        const SizedBox(width: 15),
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
                                      StartController.text,
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
                                      child: const Icon(Icons.calendar_month,
                                          color: Colors.white, size: 25),
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
                                      EndController.text,
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
                                        child: const Icon(Icons.calendar_month,
                                            color: Colors.white, size: 25)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: 165 * fem,
                          height: 15 * fem,
                          child: Text(
                            'Total Progress',
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
                    SizedBox(
                      height: 10 * fem,
                    ),
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
                    SizedBox(
                      height: 10 * fem,
                    ),
                    for (var name in groupnamelist)
                      SizedBox(
                        width: 330 * fem,
                        height: 50 * fem,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 155 * fem,
                                  height: 15 * fem,
                                  child: Text(
                                    name,
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
                            const SizedBox(
                              height: 10,
                            ),
                            if (name == "Ben")
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  width: 230 * fem,
                                  height: 15 * fem,
                                  child: Text(
                                    '* No involved',
                                    textAlign: TextAlign.left,
                                    style: SafeGoogleFont('Inter',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2125 * ffem / fem,
                                        color: const Color(0xffffffff),
                                        decoration: TextDecoration.none),
                                  ),
                                ),
                              ),
                            if (name != "Ben")
                              Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  width: 230 * fem,
                                  height: 15 * fem,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(25 * fem),
                                      border: Border.all(
                                          color: const Color(0xffffffff)),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    if (groupnamelist.length == 1)
                      const SizedBox(
                        height: 85,
                      ),
                    if (groupnamelist.length == 2)
                      const SizedBox(
                        height: 30,
                      ),
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
                                        insetPadding:
                                            const EdgeInsets.symmetric(
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
            if (positionmember == 3) GroupTaskReplyPage(),
          ],
        ),
      ),
    );
  }
}
