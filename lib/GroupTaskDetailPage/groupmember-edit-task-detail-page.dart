// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:cupertino_progress_bar/cupertino_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/Services/group_member_service.dart';
import 'package:myapp/Services/group_task_progress_service.dart';
import 'package:myapp/models/g_task.dart';
import 'package:myapp/models/g_task_progress.dart';
import 'package:myapp/models/group.dart';
import 'package:myapp/models/group_leader_record.dart';
import 'package:myapp/models/group_member_record.dart';
import 'package:myapp/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:myapp/models/user.dart';

class GroupMemberEditTaskDetailPage extends StatefulWidget {
  final grouppage;
  final switchpage;
  final editmode;
  final switchmode;
  final Group? group;
  final Group_leader_record? group_leader;
  final User_Account? UserAccount;
  final Group_Task_record? grouptask;
  final Group_task_progress? progress;
  const GroupMemberEditTaskDetailPage(
      {Key? key,
      this.UserAccount,
      this.group,
      this.grouptask,
      this.switchmode,
      this.progress,
      this.editmode,
      this.group_leader,
      this.switchpage,
      this.grouppage})
      : super(key: key);
  @override
  State<GroupMemberEditTaskDetailPage> createState() => UserEditTaskDetail();
}

class UserEditTaskDetail extends State<GroupMemberEditTaskDetailPage> {
  final ProgressController = TextEditingController();

  String? taskid;
  late bool activestate;
  String? message;
  Group_member? member;
  List<Group_task_progress?> progresslist = [];
  List<User_Account?> userlist = [];
  Uri httpsUri = Uri.https('www.google.com');

  Future<void> getdata() async {
    member = await Group_member_service().GetSingleGroupMember(
        groupid: widget.group!.group_id, userid: widget.UserAccount!.uid);
    progresslist = await Group_task_progress_service()
        .GetGroupProgress(group_task_id: widget.grouptask!.task_id);
    userlist = await Group_member_service()
        .GetGroupMemberList(progresslist: progresslist);
  }

  Future<void> update(
    int value,
    Group_task_progress progress,
    bool state,
  ) async {
    Group_task_progress? newprogress =
        Group_task_progress(progress: value, task_involved: state);

    message = await Group_task_progress_service().UpdateGroupTaskProgress(
        group_leader: widget.group_leader!,
        grouptask: widget.grouptask!,
        progress: progress,
        newprogress: newprogress);
  }

  Future<void> updatestate(Group_task_progress progress) async {
    Group_task_progress_service().updatestate(
      grouptask: widget.grouptask!,
      progress: progress,
    );
  }

  String Totalprogress(List<Group_task_progress?> progresslist) {
    double progress = 0;
    for (var element in progresslist) {
      progress += element!.progress;
    }
    return (progress ~/ progresslist.length).toInt().toString();
  }

  @override
  initState() {
    super.initState();
    ProgressController.text = widget.progress?.progress.toString() ?? '0';
    activestate = widget.progress!.task_involved;
    taskid = widget.grouptask!.task_id;
  }

  double? progressvalue(String? value) {
    double values = double.parse(value ?? '0') / 100;
    return values;
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.black;
    }
    return Colors.white;
  }

  String getname(Group_task_progress progress) {
    String name = '';
    for (var user in userlist) {
      if (user!.uid == progress.user_id) {
        name = user.username;
      }
    }
    return name;
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
                    height: 800 * fem,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 100 * fem,
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
                              width: 240 * fem,
                              height: 25 * fem,
                              child: Text(
                                widget.group!.group_name,
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
                        const SizedBox(
                          width: 40,
                          child:
                              Icon(Icons.edit, color: Colors.white, size: 20),
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
                        child: Container(
                          decoration: BoxDecoration(
                                  color: Colors.blueGrey[900],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                          child: Text(
                            widget.grouptask!.task_nam,
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
                    const SizedBox(height: 10),
                    Align(
                      child: SizedBox(
                        width: 330 * fem,
                        height: 15 * fem,
                        child: Text(
                          'grouptask info',
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
                        child: Container(
                          decoration: BoxDecoration(
                                  color: Colors.blueGrey[900],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                          child: Text(
                            widget.grouptask!.info,
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
                                  color: Colors.blueGrey[900],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                          child: Material(
                            color: const Color(0x00000000),
                            child: InkWell(
                              onTap: () => launchUrl(httpsUri),
                              child: Text(
                                widget.grouptask!.link,
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
                                  color: Colors.blueGrey[900],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 123,
                                    height: 35,
                                    child: Center(
                                      child: Text(
                                        DateFormat('yyyy-MM-dd').format(
                                            widget.grouptask!.startdate!),
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
                                          color: Colors.white, size: 25),
                                    ),
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
                                    width: 123,
                                    height: 35,
                                    child: Center(
                                      child: Text(
                                        DateFormat('yyyy-MM-dd')
                                            .format(widget.grouptask!.enddate!),
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
                    const SizedBox(height: 20),
                    FutureBuilder(
                        future: getdata(),
                        builder: (context, snapshot) {
                          if (member?.member_type == 1) {
                            return Column(children: [
                              Row(
                                children: [
                                  const SizedBox(width: 15),
                                  SizedBox(
                                    width: 240 * fem,
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
                                  SizedBox(
                                    width: 45 * fem,
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
                                  SizedBox(
                                    width: 60,
                                    child: Checkbox(
                                      checkColor: Colors.black,
                                      fillColor:
                                          MaterialStateProperty.resolveWith(
                                              getColor),
                                      value: activestate,
                                      onChanged: (bool? value) async {
                                        await updatestate(widget.progress!)
                                            .then((values) {
                                          setState(() {
                                            widget.switchmode(true);
                                            activestate = value!;
                                          });
                                        });
                                      },
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              if (activestate == true)
                                SizedBox(
                                  width: 330 * fem,
                                  height: 20 * fem,
                                  child: CupertinoSlider(
                                    value: progressvalue(
                                            ProgressController.text) ??
                                        0,
                                    onChanged: (value) => setState(() =>
                                        ProgressController.text =
                                            (value * 100).toInt().toString()),
                                  ),
                                ),
                              if (activestate == false)
                                const SizedBox(
                                  height: 22,
                                ),
                              const SizedBox(height: 95),
                            ]);
                          }
                          if (member?.member_type == 2) {
                            return Column(
                              children: [
                                for (int a = 0; a < progresslist.length; a++)
                                  Align(
                                    alignment: const Alignment(-0.10, 0),
                                    child: SizedBox(
                                      width: 330 * fem,
                                      height: 80 * fem,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 145 * fem,
                                                height: 15 * fem,
                                                child: Text(
                                                  getname(progresslist[a]!),
                                                  textAlign: TextAlign.left,
                                                  style: SafeGoogleFont(
                                                    'Inter',
                                                    fontSize: 12 * ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.2125 * ffem / fem,
                                                    decoration:
                                                        TextDecoration.none,
                                                    color:
                                                        const Color(0xffffffff),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 80),
                                              if (progresslist[a]!
                                                          .task_involved ==
                                                      true &&
                                                  progresslist[a]!.user_id ==
                                                      widget.UserAccount!.uid)
                                                SizedBox(
                                                  width: 45 * fem,
                                                  height: 15 * fem,
                                                  child: Text(
                                                    '${ProgressController.text} %',
                                                    style: SafeGoogleFont(
                                                      'Inter',
                                                      fontSize: 12 * ffem,
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: const Color(
                                                          0xffffffff),
                                                    ),
                                                  ),
                                                ),
                                              if (progresslist[a]!
                                                          .task_involved ==
                                                      true &&
                                                  progresslist[a]!.user_id !=
                                                      widget.UserAccount!.uid)
                                                SizedBox(
                                                  width: 45 * fem,
                                                  height: 15 * fem,
                                                  child: Text(
                                                    "${progresslist[a]!.progress} %",
                                                    style: SafeGoogleFont(
                                                      'Inter',
                                                      fontSize: 12 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height:
                                                          1.2125 * ffem / fem,
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: const Color(
                                                          0xffffffff),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              if (progresslist[a]!
                                                      .task_involved ==
                                                  false)
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: SizedBox(
                                                    width: 250 * fem,
                                                    height: 15 * fem,
                                                    child: Text(
                                                      '* No involved',
                                                      textAlign: TextAlign.left,
                                                      style: SafeGoogleFont(
                                                          'Inter',
                                                          fontSize: 12 * ffem,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.2125 *
                                                              ffem /
                                                              fem,
                                                          color: const Color(
                                                              0xffffffff),
                                                          decoration:
                                                              TextDecoration
                                                                  .none),
                                                    ),
                                                  ),
                                                ),
                                              if (progresslist[a]!
                                                          .task_involved ==
                                                      true &&
                                                  progresslist[a]!.user_id ==
                                                      widget.UserAccount!.uid)
                                                SizedBox(
                                                  width: 250 * fem,
                                                  height: 20 * fem,
                                                  child: CupertinoSlider(
                                                    value: progressvalue(
                                                            ProgressController
                                                                .text) ??
                                                        0,
                                                    onChanged: (value) =>
                                                        setState(() =>
                                                            ProgressController
                                                                .text = (value *
                                                                    100)
                                                                .toInt()
                                                                .toString()),
                                                  ),
                                                ),
                                              if (progresslist[a]!
                                                          .task_involved ==
                                                      true &&
                                                  progresslist[a]!.user_id !=
                                                      widget.UserAccount!.uid)
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: SizedBox(
                                                    width: 250 * fem,
                                                    height: 20 * fem,
                                                    child: CupertinoProgressBar(
                                                      value: progressvalue(
                                                          progresslist[a]!
                                                              .progress
                                                              .toString())!,
                                                      trackColor: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              Container(
                                                alignment: Alignment.center,
                                                width: 80,
                                                child: Checkbox(
                                                  checkColor: Colors.black,
                                                  fillColor:
                                                      MaterialStateProperty
                                                          .resolveWith(
                                                              getColor),
                                                  value: progresslist[a]!
                                                      .task_involved,
                                                  onChanged:
                                                      (bool? value) async {
                                                    await updatestate(
                                                            progresslist[a]!)
                                                        .then((values) {
                                                      setState(() {
                                                        widget.switchmode(true);
                                                        getdata();
                                                      });
                                                    });
                                                  },
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                if (progresslist.isEmpty)
                                  const SizedBox(
                                    height: 95,
                                  ),
                                if (progresslist.length == 1)
                                  const SizedBox(
                                    height: 45,
                                  ),
                              ],
                            );
                          }
                          return const SizedBox(height: 185);
                        }),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () async {
                              await update(int.parse(ProgressController.text),
                                  widget.progress!, activestate);

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
                                                message ?? '',
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
                                                    widget.switchmode(true);
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
                              widget.switchpage(widget.grouppage);
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
