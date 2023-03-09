// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:myapp/GroupCreateTaskPage/group-create-task-page.dart';
import 'package:myapp/GroupCurrentTaskListPage/group-current-task-list-page.dart';
import 'package:myapp/GroupDetailPage/group-leader-detail-page.dart';
import 'package:myapp/GroupPastTaskListPage/group-past-task-list-page.dart';
import 'package:myapp/GroupTaskDetailPage/group-task-progress-detail-page.dart';
import 'package:myapp/utils.dart';

class GroupTaskListPage extends StatefulWidget {
  const GroupTaskListPage({Key? key}) : super(key: key);
  @override
  State<GroupTaskListPage> createState() => GroupTaskList();
}

BoxDecoration border1(int grouppage) {
  if (grouppage == 1) {
    return BoxDecoration(border: Border.all(color: Colors.white, width: 2));
  }
  return const BoxDecoration(border: null);
}

BoxDecoration border2(int grouppage) {
  if (grouppage == 2) {
    return BoxDecoration(border: Border.all(color: Colors.white, width: 2));
  }
  return const BoxDecoration(border: null);
}

class GroupTaskList extends State<GroupTaskListPage> {
  int grouppage = 1;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return SizedBox(
      width: double.infinity,
      child: Container(
        // grouptasklistpageXSY (107:18)
        width: double.infinity,
        height: 800 * fem,
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
        ),
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
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff000000)),
                  ),
                  width: 360 * fem,
                  height: 60 * fem,
                  child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: SizedBox(
                          width: 50 * fem,
                          height: 60 * fem,
                          child: const Align(
                            alignment: Alignment.topCenter,
                            widthFactor: 2,
                            child: Icon(Icons.arrow_back,
                                size: 40, color: Colors.white),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 220 * fem,
                          height: 60 * fem,
                          child: Text(
                            'Alpha group',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 30 * ffem,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.none,
                              height: 1.2125 * ffem / fem,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GroupDetailPage()));
                        },
                        child: SizedBox(
                          width: 50 * fem,
                          height: 60 * fem,
                          child: const Align(
                            alignment: Alignment.topCenter,
                            widthFactor: 2,
                            child: Icon(Icons.settings,
                                size: 40, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FutureBuilder(builder: (context, snapshot) {
                  if (grouppage == 1) {
                    return const GroupCurrentTaskListPage();
                  }
                  if (grouppage == 2) {
                    return const GroupPastTaskListPage();
                  }
                  return const GroupCurrentTaskListPage();
                }),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Container(
                        width: 180 * fem,
                        height: 56 * fem,
                        decoration: border1(grouppage),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {
                            setState(() {
                              grouppage = 1;
                            });
                          },
                          child: Center(
                            child: Text(
                              'Current Task',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Inter',
                                fontSize: 15 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.2125 * ffem / fem,
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 180 * fem,
                        height: 56 * fem,
                        child: Container(
                          width: 180 * fem,
                          height: 56 * fem,
                          decoration: border2(grouppage),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {
                              setState(() {
                                grouppage = 2;
                              });
                            },
                            child: Center(
                              child: Text(
                                'Past Task',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Inter',
                                  fontSize: 15 * ffem,
                                  fontWeight: FontWeight.w400,
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
                ),
              ],
            ),
            if (grouppage == 1)
              Positioned(
                // rectangle20QCp (107:33)
                left: 230 * fem,
                top: 609 * fem,
                child: FloatingActionButton.extended(
                    backgroundColor: Colors.black,
                    hoverColor: Colors.grey,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GroupCreateTaskPage()),
                      );
                    },
                    icon: const Icon(Icons.add_task),
                    label: const Text('Add task')),
              ),
          ],
        ),
      ),
    );
  }
}
