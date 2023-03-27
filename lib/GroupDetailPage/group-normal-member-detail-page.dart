// ignore_for_file: file_names, must_be_immutable, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:myapp/Services/group_member_service.dart';
import 'package:myapp/models/group.dart';
import 'package:myapp/models/group_member_record.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/utils.dart';

class GroupMemberDetailPage extends StatefulWidget {
  final grouppage;
  List<Group_member?> memberlist = [];
  final switchpage;
  final Group? group;
  final User_Account? UserAccount;
  final refresh;
  final memberposition;
  GroupMemberDetailPage(
      {Key? key,
      this.memberposition,
      this.UserAccount,
      required this.memberlist,
      this.group,
      this.refresh,
      this.grouppage,
      this.switchpage})
      : super(key: key);
  @override
  State<GroupMemberDetailPage> createState() => GroupMemberDetail();
}

class GroupMemberDetail extends State<GroupMemberDetailPage> {
  Future<void> leavegroup() async {
    Group_member_service()
        .RemoveMember(group: widget.group!, userid: widget.UserAccount!.uid);
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: Container(
        // groupleaderdetailpageXua (108:376)
        width: double.infinity,
        height: 800.22 * fem,
        decoration: const BoxDecoration(
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              // hdwallpaperhomerosimpsonshomer (108:377)
              left: 0 * fem,
              top: 0 * fem,
              child: Align(
                child: SizedBox(
                  width: 360 * fem,
                  height: 799 * fem,
                  child: Image.asset(
                    'assets/page-1/images/hd-wallpaper-homero-simpsons-homer-simpsons-phone-sad-the-simpsons-thumbnail-1-bPE.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
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
                          widget.group?.group_name ?? '',
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
                            'GROUP NAME',
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
                          border: Border.all(color: const Color(0xffffffff)),
                        ),
                        child: Material(
                          color: const Color(0x00000000),
                          child: Text(
                            widget.group?.group_name ?? '',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    child: SizedBox(
                      width: 330 * fem,
                      height: 15 * fem,
                      child: Text(
                        'Group info',
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
                          border: Border.all(color: const Color(0xffffffff)),
                        ),
                        child: Material(
                          color: const Color(0x00000000),
                          child: Text(
                            widget.group?.info ?? '',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    child: SizedBox(
                      width: 330 * fem,
                      height: 15 * fem,
                      child: Text(
                        'GROUP MEMBER',
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
                  Column(
                    children: [
                      SizedBox(
                        width: 330 * fem,
                        height: 280 * fem,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffffffff)),
                          ),
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            itemCount: widget.memberlist.length,
                            itemBuilder: (context, index) {
                              return Align(
                                child: SizedBox(
                                  width: 360 * fem,
                                  height: 60 * fem,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xffffffff)),
                                    ),
                                    child: Row(
                                      children: [
                                        Align(
                                          child: SizedBox(
                                            width: 140 * fem,
                                            height: 30 * fem,
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                widget.memberlist[index]!
                                                    .member_username,
                                                style: SafeGoogleFont(
                                                  'Inter',
                                                  fontSize: 12 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  decoration:
                                                      TextDecoration.none,
                                                  height: 1.2125 * ffem / fem,
                                                  color:
                                                      const Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              width: 168 * fem,
                                              height: 30 * fem,
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xffffffff)),
                                                ),
                                                child: SizedBox(
                                                  width: 168 * fem,
                                                  height: 25 * fem,
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      widget.memberposition(
                                                          widget
                                                              .memberlist[
                                                                  index]!
                                                              .member_type),
                                                      style: SafeGoogleFont(
                                                        'Inter',
                                                        fontSize: 12 * ffem,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        decoration:
                                                            TextDecoration.none,
                                                        height:
                                                            1.2125 * ffem / fem,
                                                        color: const Color(
                                                            0xffffffff),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const Divider(
                                height: 0,
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () async {
                      await leavegroup().then((value) {
                        widget.refresh();
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      width: 360 * fem,
                      height: 38 * fem,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xffff0000)),
                      ),
                      child: Center(
                        child: Text(
                          'Leave group',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'Inter',
                            fontSize: 15 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.2125 * ffem / fem,
                            decoration: TextDecoration.none,
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
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
            ),
          ],
        ),
      ),
    );
  }
}
