// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:myapp/CreateNewGroupPage/create-new-group-page.dart';
import 'package:myapp/Dialog.dart';
import 'package:myapp/GroupTaskListPage/group-task-list-page.dart';
import 'package:myapp/Services/group_service.dart';
import 'package:myapp/Services/group_task_service.dart';
import 'package:myapp/models/g_task.dart';
import 'package:myapp/models/group.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/utils.dart';

class GroupListPage extends StatefulWidget {
  final User_Account? UserAccount;
  const GroupListPage({Key? key, this.UserAccount}) : super(key: key);
  @override
  State<GroupListPage> createState() => GroupList();
}

class GroupList extends State<GroupListPage> {
  List<Group?> grouplist = [];
  List<int> activelist = [];
  @override
  void initState() {
    super.initState();
    // Get the order
  }

  Future<void> refresh() async {
    setState(() {
      activelist = [];
    });
  }

  Future<void> getallgroup() async {
    grouplist = await Group_service().GetGroup(userid: widget.UserAccount!.uid);

    List<Group_Task_record?>? Activetasklist = [];
    for (var group in grouplist) {
      Activetasklist =
          await Group_task_service().Getcurrenttask(groupid: group!.group_id);
      if (Activetasklist.isNotEmpty) {
        activelist.add(Activetasklist.length);
      } else {
        activelist.add(0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: SizedBox(
        // grouplistpagetBS (101:11)
        width: double.infinity,
        height: 800 * fem,
        child: Stack(
          children: [
            Positioned(
              // group1512 (107:8)
              left: 244 * fem,
              top: 657 * fem,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateNewGroupPage(
                              refresh: refresh,
                              UserAccount: widget.UserAccount,
                            )),
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Container(
                  width: 116 * fem,
                  height: 40 * fem,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[900],
                    borderRadius: BorderRadius.circular(25 * fem),
                  ),
                  child: Center(
                    child: Center(
                      child: Text(
                        'Create new group',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 13 * ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2125 * ffem / fem,
                          color: const Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0 * fem,
              top: 159 * fem,
              child: Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 360 * fem,
                  height: 500 * fem,
                  child: Container(
                      alignment: Alignment.topLeft,
                      child: FutureBuilder(
                          future: getallgroup(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
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
                            } else {
                              if (grouplist.isEmpty) {
                                return const dialog2(
                                  message: 'No group joined.',
                                );
                              }
                              return ListView.separated(
                                padding: const EdgeInsets.all(0.0),
                                itemCount: grouplist.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 5, 2),
                                    child: Container(
                                      width: 360 * fem,
                                      height: 81 * fem,
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey[900],
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    GroupTaskListPage(
                                                        refresh: refresh,
                                                        getallgroup:
                                                            getallgroup,
                                                        UserAccount:
                                                            widget.UserAccount,
                                                        group:
                                                            grouplist[index])),
                                          );
                                        },
                                        style: TextButton.styleFrom(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 10, 0, 0),
                                        ),
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: SizedBox(
                                                width: 350 * fem,
                                                height: 25 * fem,
                                                child: Text(
                                                  grouplist[index]!.group_name,
                                                  style: SafeGoogleFont(
                                                    'Inter',
                                                    fontSize: 20 * ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.2125 * ffem / fem,
                                                    color:
                                                        const Color(0xffffffff),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: SizedBox(
                                                width: 300 * fem,
                                                height: 15 * fem,
                                                child: Text(
                                                  'Owner:    ${grouplist[index]!.group_leader!.leader!.username}',
                                                  style: SafeGoogleFont(
                                                    'Inter',
                                                    fontSize: 12 * ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.2125 * ffem / fem,
                                                    color:
                                                        const Color(0xffffffff),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: SizedBox(
                                                width: 300 * fem,
                                                height: 15 * fem,
                                                child: Text(
                                                  'Active task:    ${activelist[index]}',
                                                  style: SafeGoogleFont(
                                                    'Inter',
                                                    fontSize: 12 * ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.2125 * ffem / fem,
                                                    color:
                                                        const Color(0xffffffff),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return const Divider(
                                    height: 2,
                                  );
                                },
                              );
                            }
                          })),
                ),
              ),
            ),
            Positioned(
              // mygroup6Jk (106:59)
              left: 0 * fem,
              top: 108 * fem,
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 360 * fem,
                  height: 51 * fem,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Group',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 20 * ffem,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        height: 1.2125 * ffem / fem,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
