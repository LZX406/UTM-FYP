// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/PERT_analysis/pert.dart';
import 'package:myapp/Services/p_task_service.dart';
import 'package:myapp/models/p_task.dart';
import 'package:myapp/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:myapp/models/user.dart';

class UserEditTaskDetailPage extends StatefulWidget {
  final page;
  final switchpage;
  final editmode;
  final switchmode;
  final User_Account? UserAccount;
  final Task_record? Task;
  const UserEditTaskDetailPage(
      {Key? key,
      this.UserAccount,
      this.Task,
      this.switchmode,
      this.editmode,
      this.switchpage,
      this.page})
      : super(key: key);
  @override
  State<UserEditTaskDetailPage> createState() => UserEditTaskDetail();
}

class UserEditTaskDetail extends State<UserEditTaskDetailPage> {
  final TaskNameController = TextEditingController();
  final TaskInfoController = TextEditingController();
  final TaskLinkController = TextEditingController();
  final EndController = TextEditingController();
  final StartController = TextEditingController();
  final EstiController = TextEditingController();
  final ProgressController = TextEditingController();
  String? taskid;
  late bool activestate;
  String? message;
  Uri httpsUri = Uri.https('www.google.com');

  Future<void> update() async {
    DateTime esti = estimate(widget.Task!.startdate!, widget.Task!.enddate!,
        num.parse(ProgressController.text));
    Task_record newTask = Task_record.create(
        task_nam: TaskNameController.text,
        task_id: widget.Task!.task_id,
        userid: widget.UserAccount!.uid,
        enddate: DateTime.parse(EndController.text),
        estidate: esti,
        link: TaskLinkController.text,
        info: TaskInfoController.text,
        progress: int.parse(ProgressController.text),
        startdate: DateTime.parse(StartController.text),
        activestate: activestate);

    message = User_tasK_service().UpdateUserTask(Task: newTask);
  }

  Future<void> delete() async {
    message = User_tasK_service().DeleteUserTask(task_id: taskid);
  }

  String? validatenull(String value) {
    if (value.isEmpty) {
      return "This field cannot be empty";
    }
    return null;
  }

  @override
  initState() {
    super.initState();
    TaskNameController.text = widget.Task!.task_nam;
    TaskInfoController.text = widget.Task!.info;
    TaskLinkController.text = widget.Task!.link;
    StartController.text =
        DateFormat('yyyy-MM-dd').format(widget.Task!.startdate!);
    EndController.text = DateFormat('yyyy-MM-dd').format(widget.Task!.enddate!);
    EstiController.text =
        DateFormat('yyyy-MM-dd').format(widget.Task!.estidate!);
    ProgressController.text = widget.Task!.progress.toString();
    activestate = widget.Task!.activestate;
    httpsUri = Uri.https(TaskLinkController.text);
    taskid = widget.Task!.task_id;
  }

  double progressvalue(String value) {
    double values = double.parse(value) / 100;
    return values;
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

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
                  child: Image.asset(
                    'assets/page-1/images/hd-wallpaper-homero-simpsons-homer-simpsons-phone-sad-the-simpsons-thumbnail-1-xfr.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 71 * fem,
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
                            width: 300 * fem,
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
                          onChanged: widget.switchmode,
                          value: widget.editmode,
                          activeColor: Colors.blue,
                          activeTrackColor: Colors.blue[100],
                          inactiveThumbColor: Colors.redAccent,
                          inactiveTrackColor: Colors.orange,
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
                      height: 50 * fem,
                      child: TextField(
                        controller: TaskNameController,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.white)),
                          errorText: validatenull(TaskNameController.text),
                          contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        ),
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 16 * ffem,
                          decoration: TextDecoration.none,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    child: SizedBox(
                      width: 330 * fem,
                      height: 15 * fem,
                      child: Text(
                        'Task info',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 12 * ffem,
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
                      child: TextField(
                        minLines: 1,
                        maxLines: 5,
                        controller: TaskInfoController,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.white)),
                          errorText: validatenull(TaskInfoController.text),
                          contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        ),
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 14 * ffem,
                          decoration: TextDecoration.none,
                          color: const Color(0xffffffff),
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
                      child: Material(
                        color: const Color(0x00000000),
                        child: InkWell(
                          onTap: () => launchUrl(httpsUri),
                          child: TextField(
                            controller: TaskLinkController,
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 14 * ffem,
                              decoration: TextDecoration.none,
                              color: const Color(0xff1e25de),
                              decorationColor: const Color(0xff1e25de),
                            ),
                            decoration: InputDecoration(
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.white)),
                              errorText: validatenull(TaskLinkController.text),
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
                          width: 165 * fem,
                          height: 15 * fem,
                          child: Text(
                            'Start date',
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
                        child: SizedBox(
                          width: 165 * fem,
                          height: 15 * fem,
                          child: Text(
                            'End date',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 12 * ffem,
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
                              border:
                                  Border.all(color: const Color(0xffffffff)),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 125,
                                  height: 35,
                                  child: Center(
                                    child: Text(
                                      StartController.text,
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
                                  height: 40,
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    child: TextButton(
                                        onPressed: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.parse(
                                                      DateFormat('yyyy-MM-dd')
                                                          .format(widget.Task!
                                                              .startdate!)), //get today's date
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
                                  child: Center(
                                    child: Text(
                                      EndController.text,
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
                                  height: 40,
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    child: TextButton(
                                        onPressed: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.parse(
                                                      DateFormat('yyyy-MM-dd')
                                                          .format(widget.Task!
                                                              .enddate!)), //get today's date
                                                  firstDate: DateTime.parse(
                                                      DateFormat('yyyy-MM-dd')
                                                          .format(widget.Task!
                                                              .startdate!)), //DateTime.now() - not to allow to choose before today.
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
                      const SizedBox(width: 60),
                      SizedBox(
                        width: 35 * fem,
                        height: 15 * fem,
                        child: Text(
                          '${ProgressController.text} %',
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 12 * ffem,
                            decoration: TextDecoration.none,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                      Container(
                        width: 75 * fem,
                        height: 30 * fem,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 255, 255, 255)),
                        ),
                        child: TextButton(
                          onPressed: null,
                          child: Center(
                            child: Text(
                              'Change',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 12 * ffem,
                                height: 1.2125 * ffem / fem,
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 330 * fem,
                    height: 20 * fem,
                    child: CupertinoSlider(
                      value: progressvalue(ProgressController.text),
                      onChanged: (value) => setState(() => ProgressController
                          .text = (value * 100).toInt().toString()),
                    ),
                  ),
                  const SizedBox(height: 90),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            update();
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
                                            Text(
                                              message!,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(height: 40),
                                            TextButton(
                                              onPressed: () {
                                                if (message ==
                                                    "Update successful") {
                                                  widget
                                                      .switchpage(widget.page);
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                } else {
                                                  Navigator.pop(context);
                                                }
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
                            widget.switchpage(widget.page);
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
                  TextButton(
                    onPressed: () {
                      delete();
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const SizedBox(height: 14),
                                      Text(
                                        message!,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      const SizedBox(height: 40),
                                      TextButton(
                                        onPressed: () {
                                          if (message == "Delete successful") {
                                            widget.switchpage(1);
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          } else {
                                            Navigator.pop(context);
                                          }
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
                      width: 360 * fem,
                      height: 57.22 * fem,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red[800]!),
                          color: Colors.red[800]),
                      child: Center(
                        child: Text(
                          'Delete',
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
    );
  }
}
