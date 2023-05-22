// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:cupertino_progress_bar/cupertino_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myapp/Dialog.dart';
import 'package:myapp/GroupTaskDetailPage/group-edit-task-detail-page.dart';
import 'package:myapp/GroupTaskDetailPage/groupmember-edit-task-detail-page.dart';
import 'package:myapp/Services/group_member_service.dart';
import 'package:myapp/Services/group_task_progress_service.dart';
import 'package:myapp/Services/group_task_service.dart';
import 'package:myapp/models/g_task.dart';
import 'package:myapp/models/g_task_progress.dart';
import 'package:myapp/models/group.dart';
import 'package:myapp/models/group_leader_record.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class GroupTaskDetailPage extends StatefulWidget {
  final grouppage;
  final switchpage;
  final Group_leader? group_leader;
  final Group? group;
  final User_Account? UserAccount;
  final Group_Task_record? grouptask;
  const GroupTaskDetailPage(
      {Key? key,
      this.UserAccount,
      this.group,
      this.grouppage,
      this.grouptask,
      this.switchpage,
      this.group_leader})
      : super(key: key);
  @override
  State<GroupTaskDetailPage> createState() => GroupTaskDetail();
}

class GroupTaskDetail extends State<GroupTaskDetailPage> {
  int positionmember = 1;
  Group? group;
  Group_Task_record? task;
  final httpsUri = Uri.https('www.google.com');
  bool editmode = false;
  List<Group_task_progress?> progresslist = [];
  List<User_Account?> userlist = [];
  Future<void> getallprogress() async {
    task = await Group_task_service()
        .GetSingleGroupTask(taskid: widget.grouptask!.task_id);
    progresslist = await Group_task_progress_service()
        .GetGroupProgress(group_task_id: widget.grouptask!.task_id);
    userlist = await Group_member_service()
        .GetGroupMemberList(progresslist: progresslist);
  }

  void switchmode(bool value) {
    setState(() {
      editmode = value;
    });
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

  double? progressvalue(String? value) {
    double values = double.parse(value ?? '1') / 100;
    return values;
  }

  bool checkuserinvolve() {
    for (var user in userlist) {
      if (user!.uid == widget.UserAccount!.uid) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    if (editmode == false) {
      return SizedBox(
        width: double.infinity,
        height: 800,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: GestureDetector(
            onPanUpdate: (DragUpdateDetails details) {
              if (details.delta.dx > 15) {
                //right scroll
                //increment counter
                switchmode(false);
              } else if (details.delta.dx < -15) {
                //left scroll
                //decrement counter
                switchmode(true);
              }
            },
            child: Stack(
              children: [
                Positioned(
                  // hdwallpaperhomerosimpsonshomer (108:814)
                  left: 0 * fem,
                  top: 0 * fem,
                  child: Align(
                    child: SizedBox(
                      width: 360 * fem,
                      height: 800 * fem,
                      child: Image.asset(
                        'assets/page-1/images/hd-wallpaper-homero-simpsons-homer-simpsons-phone-sad-the-simpsons-thumbnail-1-dck.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                FutureBuilder(
                  future: getallprogress(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Column(
                        children: [
                          Container(
                              child: LoadingAnimationWidget.hexagonDots(
                                  color: Colors.white, size: 200)),
                          const dialog2(
                            message: 'Loading, please wait',
                          )
                        ],
                      );
                    }
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50 * fem,
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
                              if (widget.UserAccount!.uid ==
                                      widget.group_leader!.leader_id ||
                                  checkuserinvolve() == true)
                                const SizedBox(
                                  width: 40,
                                  child: Icon(Icons.edit,
                                      color: Colors.white, size: 20),
                                ),
                              if (widget.UserAccount!.uid ==
                                      widget.group_leader!.leader_id ||
                                  checkuserinvolve() == true)
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
                                  border: Border.all(
                                      color: const Color(0xffffffff)),
                                ),
                                child: Text(
                                  task?.task_nam ?? '',
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
                                  border: Border.all(
                                      color: const Color(0xffffffff)),
                                ),
                                child: Text(
                                  task?.info ?? '',
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
                                  border: Border.all(
                                      color: const Color(0xffffffff)),
                                ),
                                child: Material(
                                  color: const Color(0x00000000),
                                  child: InkWell(
                                    onTap: () => launchUrl(httpsUri),
                                    child: Text(
                                      task?.link ?? '',
                                      style: SafeGoogleFont(
                                        'Inter',
                                        fontSize: 12 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.2125 * ffem / fem,
                                        decoration: TextDecoration.underline,
                                        color: const Color(0xff1e25de),
                                        decorationColor:
                                            const Color(0xff1e25de),
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
                              const SizedBox(width: 15),
                              Align(
                                child: SizedBox(
                                  width: 155 * fem,
                                  height: 35 * fem,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xffffffff)),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 120,
                                          height: 35,
                                          child: Center(
                                            child: Text(
                                              DateFormat('yyyy-MM-dd').format(
                                                  task?.startdate! ??
                                                      DateTime.now()),
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
                                            child: const Icon(
                                                Icons.calendar_month,
                                                color: Colors.white,
                                                size: 25),
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
                                      border: Border.all(
                                          color: const Color(0xffffffff)),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 120,
                                          height: 35,
                                          child: Center(
                                            child: Text(
                                              DateFormat('yyyy-MM-dd').format(
                                                  task?.enddate! ??
                                                      DateTime.now()),
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
                                              child: const Icon(
                                                  Icons.calendar_month,
                                                  color: Colors.white,
                                                  size: 25)),
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
                                  border: Border.all(
                                      color: const Color(0xffffffff)),
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      height: 35,
                                      child: Center(
                                        child: Text(
                                          DateFormat('yyyy-MM-dd').format(
                                              task?.estidate! ??
                                                  DateTime.now()),
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
                                          child: const Icon(
                                              Icons.calendar_month,
                                              color: Colors.white,
                                              size: 25)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                width: 225 * fem,
                                height: 15 * fem,
                                child: Text(
                                  'Total Progress',
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
                                width: 45 * fem,
                                height: 15 * fem,
                                child: Text(
                                  "${task?.progress ?? ''} %",
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
                          SizedBox(
                            height: 10 * fem,
                          ),
                          SizedBox(
                            width: 330 * fem,
                            height: 20 * fem,
                            child: CupertinoProgressBar(
                              value:
                                  progressvalue(task?.progress.toString()) ?? 0,
                              trackColor: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 10 * fem,
                          ),
                          for (int a = 0; a < progresslist.length; a++)
                            Align(
                              alignment: const Alignment(-0.10, 0),
                              child: SizedBox(
                                width: 330 * fem,
                                height: 50 * fem,
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
                                              decoration: TextDecoration.none,
                                              color: const Color(0xffffffff),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 80),
                                        if (progresslist[a]!.task_involved ==
                                            true)
                                          SizedBox(
                                            width: 45 * fem,
                                            height: 15 * fem,
                                            child: Text(
                                              "${progresslist[a]!.progress} %",
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
                                    if (progresslist[a]!.task_involved == false)
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: SizedBox(
                                          width: 250 * fem,
                                          height: 15 * fem,
                                          child: Text(
                                            '* No involved',
                                            textAlign: TextAlign.left,
                                            style: SafeGoogleFont('Inter',
                                                fontSize: 12 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.2125 * ffem / fem,
                                                color: const Color(0xffffffff),
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                        ),
                                      ),
                                    if (progresslist[a]!.task_involved == true)
                                      Align(
                                        alignment: Alignment.centerLeft,
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
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: TextButton(
                              onPressed: () {
                                widget.switchpage(widget.grouppage);
                                Navigator.pop(context);
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Container(
                                width: 360 * fem,
                                height: 57.22 * fem,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffff0000)),
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
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    } else if (editmode == true &&
        widget.group_leader?.leader_id == widget.UserAccount!.uid) {
      return GroupEditTaskDetailPage(
        userlist: userlist,
        group: widget.group,
        grouptask: task,
        grouppage: widget.grouppage,
        switchmode: switchmode,
        switchpage: widget.switchpage,
        UserAccount: widget.UserAccount,
        editmode: editmode,
      );
    } else {
      Group_task_progress? progress;
      for (int a = 0; a < progresslist.length; a++) {
        if (widget.UserAccount!.uid == progresslist[a]!.user_id) {
          progress = progresslist[a];
        }
      }
      return GroupMemberEditTaskDetailPage(
        group_leader: widget.group_leader,
        progress: progress,
        group: widget.group,
        grouptask: task,
        grouppage: widget.grouppage,
        switchmode: switchmode,
        switchpage: widget.switchpage,
        UserAccount: widget.UserAccount,
        editmode: editmode,
      );
    }
  }
}
