// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:cupertino_progress_bar/cupertino_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:myapp/Dialog.dart';
import 'package:myapp/Services/group_member_service.dart';
import 'package:myapp/Services/group_task_progress_service.dart';
import 'package:myapp/Services/group_task_service.dart';
import 'package:myapp/Services/notification_service.dart';
import 'package:myapp/Uri.dart';
import 'package:myapp/models/g_task.dart';
import 'package:myapp/models/g_task_progress.dart';
import 'package:myapp/models/group.dart';
import 'package:myapp/models/group_leader_record.dart';
import 'package:myapp/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:myapp/models/user.dart';

class GroupEditTaskDetailPage extends StatefulWidget {
  final grouppage;
  final switchpage;
  final editmode;
  final switchmode;
  final Group? group;
  final User_Account? UserAccount;
  final Group_Task_record? grouptask;
  final Group_leader_record? group_leader;
  List<User_Account?> userlist = [];
  GroupEditTaskDetailPage(
      {Key? key,
      this.UserAccount,
      this.group,
      this.grouptask,
      this.switchmode,
      this.editmode,
      this.switchpage,
      required this.userlist,
      this.grouppage,
      this.group_leader})
      : super(key: key);
  @override
  State<GroupEditTaskDetailPage> createState() => UserEditTaskDetail();
}

class UserEditTaskDetail extends State<GroupEditTaskDetailPage> {
  final TaskNameController = TextEditingController();
  final TaskInfoController = TextEditingController();
  final TaskLinkController = TextEditingController();
  final EndController = TextEditingController();
  final StartController = TextEditingController();
  final EstiController = TextEditingController();
  final ProgressController = TextEditingController();
  String? taskid;
  late bool activestate;
  bool deletetask = false;
  String? message;
  List<Group_task_progress?> progresslist = [];
  List<User_Account?> userlist = [];
  Uri? httpsUri;

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
    } else if (DateTime.parse(StartController.text)
        .isAfter(DateTime.parse(EndController.text))) {
      showdialog(context, 'Start date must before End date.');
      return false;
    } else {
      return true;
    }
  }

  Future<void> getdata() async {
    progresslist = await Group_task_progress_service()
        .GetGroupProgress(group_task_id: widget.grouptask!.task_id);
    userlist = await Group_member_service()
        .GetGroupMemberList(progresslist: progresslist);
  }

  Future<void> updatestate(Group_task_progress progress) async {
    Group_task_progress_service().updatestate(
      grouptask: widget.grouptask!,
      progress: progress,
    );
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

  Future<void> update(
      User_Account user, List<User_Account?> user_list, Group? group) async {
    Group_Task_record newTask = Group_Task_record.create(
        task_nam: TaskNameController.text,
        task_id: widget.grouptask!.task_id,
        userid: widget.UserAccount!.uid,
        enddate: DateTime.parse(EndController.text),
        estidate: DateTime.parse(EstiController.text),
        link: TaskLinkController.text,
        info: TaskInfoController.text,
        group_id: widget.group!.group_id,
        progress: int.parse(ProgressController.text),
        startdate: DateTime.parse(StartController.text),
        activestate: activestate);

    message = Group_task_service().UpdateGroupTask(Task: newTask);
    Notification_service().Update_group_task_detail_Notification(
        User: user,
        group: group!,
        user_list: user_list,
        group_task: widget.grouptask!);
    Group_task_progress_service().EstimateEndDate(
        grouptask: newTask, group_leader: widget.group_leader!);
  }

  Future<void> delete() async {
    message = await Group_task_service()
        .DeleteGroupTask(task_id: widget.grouptask!.task_id);
  }

  @override
  initState() {
    super.initState();
    TaskNameController.text = widget.grouptask!.task_nam;
    TaskInfoController.text = widget.grouptask!.info;
    TaskLinkController.text = widget.grouptask!.link;
    StartController.text =
        DateFormat('yyyy-MM-dd').format(widget.grouptask!.startdate!);
    EndController.text =
        DateFormat('yyyy-MM-dd').format(widget.grouptask!.enddate!);
    EstiController.text =
        DateFormat('yyyy-MM-dd').format(widget.grouptask!.estidate!);
    ProgressController.text = widget.grouptask!.progress.toString();
    activestate = widget.grouptask!.activestate;
    httpsUri = setUri(TaskLinkController.text);
    taskid = widget.grouptask!.task_id;
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SizedBox(
        width: double.infinity,
        height: 800 * fem,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: GestureDetector(
            onPanUpdate: (DragUpdateDetails details) {
              if (details.delta.dx > 15) {
                //right scroll
                //increment counter
                widget.switchmode(false);
              } else if (details.delta.dx < -15) {
                //left scroll
                //decrement counter
                widget.switchmode(true);
              }
            },
            child: Stack(
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
                        child: Container(
                          width: 330 * fem,
                          height: 50 * fem,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[900],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(30),
                            ],
                            maxLines: 1,
                            controller: TaskNameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 30),
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
                        child: Container(
                          width: 330 * fem,
                          height: 120 * fem,
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey[900],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            minLines: 1,
                            maxLines: 5,
                            controller: TaskInfoController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                        child: Container(
                          width: 330 * fem,
                          height: 30 * fem,
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
                              child: TextField(
                                controller: TaskLinkController,
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 14 * ffem,
                                  decoration: TextDecoration.none,
                                  color: const Color(0xff1e25de),
                                  decorationColor: const Color(0xff1e25de),
                                ),
                                decoration: const InputDecoration(
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
                            child: Container(
                              width: 155 * fem,
                              height: 35 * fem,
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
                                                            .format(widget
                                                                .grouptask!
                                                                .startdate!)), //get today's date
                                                    firstDate: DateTime(
                                                        2000), //DateTime.now() - not to allow to choose before today.
                                                    lastDate: DateTime(2101));

                                            if (pickedDate != null) {
                                              //get the picked date in the format => 2022-07-04 00:00:00.000
                                              String formattedDate = DateFormat(
                                                      'yyyy-MM-dd')
                                                  .format(
                                                      pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
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
                          const SizedBox(width: 20),
                          Align(
                            child: Container(
                              width: 155 * fem,
                              height: 35 * fem,
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
                                                            .format(widget
                                                                .grouptask!
                                                                .enddate!)), //get today's date
                                                    firstDate: DateTime.parse(
                                                        DateFormat('yyyy-MM-dd')
                                                            .format(widget
                                                                .grouptask!
                                                                .startdate!)), //DateTime.now() - not to allow to choose before today.
                                                    lastDate: DateTime(2101));

                                            if (pickedDate != null) {
                                              //get the picked date in the format => 2022-07-04 00:00:00.000
                                              String formattedDate = DateFormat(
                                                      'yyyy-MM-dd')
                                                  .format(
                                                      pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
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
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
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
                                              widget.grouptask?.estidate! ??
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          if (widget.grouptask?.estidate != null)
                            Align(
                              alignment: const Alignment(-0.85, 0),
                              child: SizedBox(
                                width: 155 * fem,
                                height: 35 * fem,
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      EndController.text =
                                          DateFormat('yyyy-MM-dd').format(
                                              widget.grouptask!.estidate!);
                                    });
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Adjust End date',
                                        textAlign: TextAlign.center,
                                        style: SafeGoogleFont(
                                          'Inter',
                                          fontSize: 15 * ffem,
                                          fontWeight: FontWeight.w400,
                                          decoration: TextDecoration.none,
                                          height: 1.2125 * ffem / fem,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const SizedBox(width: 15),
                          SizedBox(
                            width: 240 * fem,
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
                              '${ProgressController.text} %',
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
                      const SizedBox(height: 30),
                      FutureBuilder(
                          future: getdata(),
                          builder: (context, snapshot) {
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
                                                  true)
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
                                                  true)
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
                                                              .toString()),
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
                          }),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                if (validatenull() == true) {
                                  update(widget.UserAccount!, widget.userlist,
                                      widget.group);
                                  showDialog(
                                      context: context,
                                      builder: (context) => Dialog(
                                            backgroundColor: Colors.black,
                                            insetPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 40,
                                                    vertical: 40),
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25,
                                                      vertical: 30),
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
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 40),
                                                  TextButton(
                                                    onPressed: () {
                                                      if (message ==
                                                          "Update successful") {
                                                        widget.switchpage(
                                                            widget.grouppage);
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
                                  border: Border.all(
                                      color: const Color(0xff00ff19)),
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
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          deletetask = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    confirmationdialog(
                                      statement: deletetask,
                                    )
                                  ],
                                );
                              });
                          if (deletetask) {
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
                                                    "Delete successful") {
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
                          }
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
        ),
      ),
    );
  }
}
