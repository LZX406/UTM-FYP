// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:cupertino_progress_bar/cupertino_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/Uri.dart';
import 'package:myapp/UserTaskDetailPage/user-edit-task-detail-page.dart';
import 'package:myapp/models/p_task.dart';
import 'package:myapp/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:myapp/models/user.dart';

class UserTaskDetailPage extends StatefulWidget {
  final page;
  final switchpage;
  final User_Account? UserAccount;
  final Task_record? Task;
  const UserTaskDetailPage(
      {Key? key, this.UserAccount, this.Task, this.switchpage, this.page})
      : super(key: key);
  @override
  State<UserTaskDetailPage> createState() => UserTaskDetail();
}

class UserTaskDetail extends State<UserTaskDetailPage> {
  bool editmode = false;
  Uri? httpsUri;

  double progressvalue(String value) {
    double values = double.parse(value) / 100;
    return values;
  }

  void switchmode(bool value) {
    if (editmode == false) {
      setState(() {
        editmode = true;
      });
    } else {
      setState(() {
        editmode = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    httpsUri = setUri(widget.Task!.link);
    if (editmode == false) {
      return SizedBox(
        width: double.infinity,
        height: 800 * fem,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Positioned(
                // hdwallpaperhomerosimpsonshomer (107:19)
                left: 0 * fem,
                top: 0 * fem,
                child: Align(
                  child: SizedBox(
                    width: 360 * fem,
                    height: 799 * fem,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 81 * fem,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30 * fem,
                        height: 25 * fem,
                      ),
                      Center(
                        child: Align(
                          child: SizedBox(
                            width: 280 * fem,
                            height: 25 * fem,
                            child: Text(
                              "My task",
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
                      SizedBox(
                        width: 30 * fem,
                        height: 25 * fem,
                        child: Switch(
                          onChanged: switchmode,
                          value: editmode,
                          activeColor: Colors.blue,
                          activeTrackColor: Colors.blue[100],
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  Align(
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
                      height: 40 * fem,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[900],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.Task!.task_nam,
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 16 * ffem,
                              height: 1.2125 * ffem / fem,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
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
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[900],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          widget.Task!.info,
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 14 * ffem,
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
                          color: Colors.blueGrey[900],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Material(
                          color: const Color(0x00000000),
                          child: InkWell(
                            onTap: () {
                              if (httpsUri != Uri.https('')) {
                                launchUrl(httpsUri!);
                              }
                            },
                            child: Text(
                              widget.Task?.link ?? '',
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 12 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2125 * ffem / fem,
                                decoration: TextDecoration.underline,
                                color: const Color(0xffffffff),
                                decorationColor: Colors.white,
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
                      const SizedBox(
                        width: 15,
                      ),
                      Align(
                        child: SizedBox(
                          width: 173 * fem,
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
                      const SizedBox(
                        width: 15,
                      ),
                      Align(
                        child: SizedBox(
                          width: 155 * fem,
                          height: 35 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[900],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 120,
                                  height: 35,
                                  child: Center(
                                    child: Text(
                                      DateFormat('yyyy-MM-dd').format(
                                          widget.Task!.startdate ??
                                              DateTime.now()),
                                      style: SafeGoogleFont(
                                        'Inter',
                                        fontSize: 12 * ffem,
                                        decoration: TextDecoration.none,
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                  height: 20,
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
                      const SizedBox(width: 20),
                      Align(
                        child: SizedBox(
                          width: 155 * fem,
                          height: 35 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blueGrey[900],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 120,
                                  height: 35,
                                  child: Center(
                                    child: Text(
                                      DateFormat('yyyy-MM-dd').format(
                                          widget.Task!.enddate ??
                                              DateTime.now()),
                                      style: SafeGoogleFont(
                                        'Inter',
                                        fontSize: 12 * ffem,
                                        decoration: TextDecoration.none,
                                        color: const Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                  height: 20,
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
                  Align(
                    alignment: const Alignment(-0.85, 0),
                    child: SizedBox(
                      width: 155 * fem,
                      height: 15 * fem,
                      child: Text(
                        'Estimate end date',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 12 * ffem,
                          decoration: TextDecoration.none,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(-0.85, 0),
                    child: SizedBox(
                      width: 155 * fem,
                      height: 35 * fem,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[900],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 120,
                              height: 35,
                              child: Center(
                                child: Text(
                                  DateFormat('yyyy-MM-dd').format(
                                      widget.Task!.estidate ?? DateTime.now()),
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
                            SizedBox(
                              width: 30,
                              height: 20,
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
                  const SizedBox(height: 29),
                  Row(
                    children: [
                      const SizedBox(width: 15),
                      SizedBox(
                        width: 165 * fem,
                        height: 15 * fem,
                        child: Text(
                          'Progress',
                          textAlign: TextAlign.left,
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 12 * ffem,
                            decoration: TextDecoration.none,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                      const SizedBox(width: 120),
                      SizedBox(
                        width: 35 * fem,
                        height: 15 * fem,
                        child: Text(
                          '${widget.Task!.progress.toString()} %',
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 12 * ffem,
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
                    child: CupertinoProgressBar(
                      value: progressvalue(widget.Task!.progress.toString()),
                      trackColor: Colors.white,
                      valueColor: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                      onPressed: () {
                        widget.switchpage(widget.page);
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 360 * fem,
                        height: 57.22 * fem,
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffff0000)),
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
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return UserEditTaskDetailPage(
        page: widget.page,
        switchpage: widget.switchpage,
        editmode: editmode,
        switchmode: switchmode,
        UserAccount: widget.UserAccount,
        Task: widget.Task,
      );
    }
  }
}
