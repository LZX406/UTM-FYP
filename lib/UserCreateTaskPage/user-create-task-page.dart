// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/Dialog.dart';
import 'package:myapp/Services/p_task_service.dart';
import 'package:myapp/utils.dart';
import 'package:intl/intl.dart';
import 'package:myapp/models/user.dart';

class UserCreateTaskPage extends StatefulWidget {
  final switchpage;
  final User_Account? UserAccount;
  const UserCreateTaskPage({Key? key, this.UserAccount, this.switchpage})
      : super(key: key);
  @override
  State<UserCreateTaskPage> createState() => UserCreateTask();
}

class UserCreateTask extends State<UserCreateTaskPage> {
  final TaskNameController = TextEditingController();
  final TaskInfoController = TextEditingController();
  final LinkController = TextEditingController();
  final StartController = TextEditingController();
  final EndController = TextEditingController();
  String? userid;
  DateTime? StartDate;
  DateTime? EndDate;
  DateTime? EstimeDate;

  @override
  initState() {
    super.initState();
    userid = widget.UserAccount!.uid;
  }

  bool? validatenull() {
    if (TaskNameController.text.isEmpty) {
      showdialog(context, 'Task name must be filled.');
      return false;
    } else if (TaskInfoController.text.isEmpty) {
      showdialog(context, 'Task info must be filled.');
      return false;
    } else if (StartController.text.isEmpty) {
      showdialog(context, 'Start date must be filled.');
      return false;
    } else if (EndController.text.isEmpty) {
      showdialog(context, 'End date must be filled.');
      return false;
    } else if (StartDate!.isAfter(EndDate!)) {
      showdialog(context, 'Start date must before End date.');
      return false;
    } else {
      return true;
    }
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
        child: Container(
          // usercreatetaskpageNsS (107:445)
          width: double.infinity,
          height: 800.22 * fem,
          decoration: const BoxDecoration(
            color: Color(0xffffffff),
          ),
          child: Stack(
            children: [
              Positioned(
                // hdwallpaperhomerosimpsonshomer (107:446)
                left: 0 * fem,
                top: 0 * fem,
                child: Align(
                  child: SizedBox(
                    width: 360 * fem,
                    height: 799 * fem,
                    child: Image.asset(
                      'assets/page-1/images/hd-wallpaper-homero-simpsons-homer-simpsons-phone-sad-the-simpsons-thumbnail-1-5Gk.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Center(
                      child: Align(
                        child: SizedBox(
                          width: 360 * fem,
                          height: 25 * fem,
                          child: Text(
                            'USER NEW TASK ',
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
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
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
                      ],
                    ),
                    Align(
                      child: SizedBox(
                        width: 330 * fem,
                        height: 20 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: const Color(0xffffffff)),
                          ),
                          child: Material(
                            color: const Color(0x00000000),
                            child: TextField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(60),
                              ],
                              maxLines: 1,
                              controller: TaskNameController,
                              style: const TextStyle(color: Colors.white),
                              textAlignVertical: TextAlignVertical.top,
                              decoration: const InputDecoration(
                                filled: true,
                                hintText: 'Task Name',
                                hintStyle: TextStyle(color: Colors.white54),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.zero,
                              ),
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
                      child: Container(
                        width: 330 * fem,
                        height: 120 * fem,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: const Color(0xffffffff)),
                        ),
                        child: Material(
                          color: const Color(0x00000000),
                          child: TextField(
                            maxLines: null,
                            controller: TaskInfoController,
                            style: const TextStyle(color: Colors.white),
                            textAlignVertical: TextAlignVertical.top,
                            decoration: const InputDecoration(
                              filled: true,
                              hintText: 'Task Info',
                              hintStyle: TextStyle(color: Colors.white54),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 30),
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
                        height: 60 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: const Color(0xffffffff)),
                          ),
                          child: Material(
                            color: const Color(0x00000000),
                            child: TextField(
                              maxLines: null,
                              controller: LinkController,
                              style: const TextStyle(color: Colors.white),
                              textAlignVertical: TextAlignVertical.top,
                              decoration: const InputDecoration(
                                filled: true,
                                hintText: 'Link',
                                hintStyle: TextStyle(color: Colors.white54),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding:
                                    EdgeInsets.fromLTRB(0, 0, 0, 30),
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
                            width: 165 * fem,
                            height: 35 * fem,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: const Color(0xffffffff)),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 120,
                                    height: 35,
                                    child: Material(
                                      color: const Color(0x00000000),
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          StartController.text,
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 14 * ffem,
                                            decoration: TextDecoration.none,
                                            color: const Color(0xffffffff),
                                          ),
                                        ),
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
                                            StartDate = await showDatePicker(
                                                context: context,
                                                initialDate: DateTime
                                                    .now(), //get today's date
                                                firstDate: DateTime(
                                                    2000), //DateTime.now() - not to allow to choose before today.
                                                lastDate: DateTime(2101));

                                            if (StartDate != null) {
                                              //get the picked date in the format => 2022-07-04 00:00:00.000
                                              String formattedDate = DateFormat(
                                                      'yyyy-MM-dd')
                                                  .format(
                                                      StartDate!); // format date in required form here we use yyyy-MM-dd that means time is removed
                                              //formatted date output using intl package =>  2022-07-04
                                              //You can format date as per your need

                                              setState(() {
                                                StartController.text =
                                                    formattedDate; //set foratted date to TextField value.
                                              });
                                            } else {}
                                          },
                                          child: const Icon(
                                              Icons.calendar_month,
                                              color: Colors.white,
                                              size: 25)),
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
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: const Color(0xffffffff)),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 120,
                                    height: 35,
                                    child: Material(
                                      color: const Color(0x00000000),
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          EndController.text,
                                          style: SafeGoogleFont(
                                            'Inter',
                                            fontSize: 14 * ffem,
                                            decoration: TextDecoration.none,
                                            color: const Color(0xffffffff),
                                          ),
                                        ),
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
                                            EndDate = await showDatePicker(
                                                context: context,
                                                initialDate: DateTime
                                                    .now(), //get today's date
                                                firstDate: DateTime(
                                                    2000), //DateTime.now() - not to allow to choose before today.
                                                lastDate: DateTime(2101));

                                            if (EndDate != null) {
                                              //get the picked date in the format => 2022-07-04 00:00:00.000
                                              String formattedDate = DateFormat(
                                                      'yyyy-MM-dd')
                                                  .format(
                                                      EndDate!); // format date in required form here we use yyyy-MM-dd that means time is removed
                                              //formatted date output using intl package =>  2022-07-04
                                              //You can format date as per your need

                                              setState(() {
                                                EndController.text =
                                                    formattedDate; //set foratted date to TextField value.
                                              });
                                            } else {}
                                          },
                                          child: const Icon(
                                              Icons.calendar_month,
                                              color: Colors.white,
                                              size: 25)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 125 * fem,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              if (validatenull() == true) {
                                String message = "Create unsuccessful";
                                Timestamp StartTimeStamp =
                                    Timestamp.fromDate(StartDate!);
                                Timestamp EndTimeStamp =
                                    Timestamp.fromDate(EndDate!);
                                Timestamp EstimateTimeStamp =
                                    Timestamp.fromDate(EndDate!);
                                if (userid != '') {
                                  User_tasK_service().CreateUserTask(
                                      enddate: EndTimeStamp,
                                      estidate: EstimateTimeStamp,
                                      info: TaskInfoController.text,
                                      link: LinkController.text,
                                      progress: 0,
                                      startdate: StartTimeStamp,
                                      task_nam: TaskNameController.text,
                                      userid: userid);
                                  message = "Create successfull";
                                }

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
                                                Text(
                                                  message,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                const SizedBox(height: 40),
                                                TextButton(
                                                  onPressed: () {
                                                    widget.switchpage(1);
                                                    Navigator.pop(context);
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    "OK",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ));
                              }
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
                                  'Create',
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
      ),
    );
  }
}
