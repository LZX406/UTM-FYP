// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/GroupDetailPage/group-normal-member-detail-page.dart';
import 'package:myapp/utils.dart';

class GroupDetailPage extends StatefulWidget {
  const GroupDetailPage({Key? key}) : super(key: key);
  @override
  State<GroupDetailPage> createState() => GroupDetail();
}

class GroupDetail extends State<GroupDetailPage> {
  List<String> positionlist = ["Member"];
  List<String> namelist = ["JASON"];
  final memberposition = 3;
  // ignore: non_constant_identifier_names
  final GroupNameController = TextEditingController();
  // ignore: non_constant_identifier_names
  final GroupInfoController = TextEditingController();
  // ignore: non_constant_identifier_names
  final GroupMemberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    GroupNameController.text = "Alpha Group";
    GroupInfoController.text = "Group for alpha project";
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
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
            FutureBuilder(builder: (context, snapshot) {
              if (!snapshot.hasData) {
                if (memberposition != 3) {
                  return SingleChildScrollView(
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
                                'NEW GROUP ',
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
                                border:
                                    Border.all(color: const Color(0xffffffff)),
                              ),
                              child: Material(
                                color: const Color(0x00000000),
                                child: TextField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(60),
                                  ],
                                  maxLines: 1,
                                  controller: GroupNameController,
                                  style: const TextStyle(color: Colors.white),
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: const InputDecoration(
                                    filled: true,
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
                        const SizedBox(height: 30),
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
                                border:
                                    Border.all(color: const Color(0xffffffff)),
                              ),
                              child: Material(
                                color: const Color(0x00000000),
                                child: TextField(
                                  maxLines: null,
                                  controller: GroupInfoController,
                                  style: const TextStyle(color: Colors.white),
                                  textAlignVertical: TextAlignVertical.top,
                                  decoration: const InputDecoration(
                                    filled: true,
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
                              height: 230 * fem,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color(0xffffffff)),
                                ),
                                child: ListView.separated(
                                  padding: EdgeInsets.zero,
                                  itemCount: namelist.length,
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
                                                      namelist.elementAt(index),
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
                                              Align(
                                                  alignment: Alignment.center,
                                                  child: SizedBox(
                                                    width: 168 * fem,
                                                    height: 30 * fem,
                                                    child: Container(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xffffffff)),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 120 * fem,
                                                            height: 25 * fem,
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                positionlist[
                                                                    index],
                                                                style:
                                                                    SafeGoogleFont(
                                                                  'Inter',
                                                                  fontSize:
                                                                      12 * ffem,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  height:
                                                                      1.2125 *
                                                                          ffem /
                                                                          fem,
                                                                  color: const Color(
                                                                      0xffffffff),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 38 * fem,
                                                            height: 45 * fem,
                                                            child: TextButton(
                                                              onPressed: () {
                                                                if (positionlist[
                                                                        index] ==
                                                                    "Member") {
                                                                  setState(() {
                                                                    positionlist[
                                                                            index] =
                                                                        "Manager";
                                                                  });
                                                                } else {
                                                                  setState(() {
                                                                    positionlist[
                                                                            index] =
                                                                        "Member";
                                                                  });
                                                                }
                                                              },
                                                              child: const Icon(
                                                                Icons
                                                                    .keyboard_arrow_right_outlined,
                                                                color: Colors
                                                                    .white,
                                                                size: 20,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
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
                            TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        backgroundColor: Colors.black,
                                        insetPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 40),
                                        child: SizedBox(
                                          width: 200,
                                          height: 120,
                                          child: Column(
                                            children: [
                                              Text(
                                                'Member Username',
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
                                              SizedBox(
                                                width: 180,
                                                height: 30,
                                                child: Container(
                                                  alignment: Alignment.topLeft,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color(
                                                            0xffffffff)),
                                                  ),
                                                  child: Material(
                                                    color:
                                                        const Color(0x00000000),
                                                    child: TextField(
                                                      inputFormatters: [
                                                        LengthLimitingTextInputFormatter(
                                                            60),
                                                      ],
                                                      maxLines: 1,
                                                      controller:
                                                          GroupMemberController,
                                                      style: const TextStyle(
                                                          color: Colors.white),
                                                      textAlignVertical:
                                                          TextAlignVertical
                                                              .center,
                                                      decoration:
                                                          const InputDecoration(
                                                        filled: true,
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        contentPadding:
                                                            EdgeInsets.zero,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  const SizedBox(width: 60),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: SizedBox(
                                                      width: 60 * fem,
                                                      height: 30 * fem,
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: const Color(
                                                                  0xffffffff)),
                                                          color: const Color(
                                                              0x7fffffff),
                                                        ),
                                                        child: Text(
                                                          'ADD',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: SafeGoogleFont(
                                                            'Inter',
                                                            fontSize: 12 * ffem,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1.2125 *
                                                                ffem /
                                                                fem,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            color: const Color(
                                                                0xffffffff),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      GroupMemberController
                                                          .clear();
                                                      Navigator.pop(context);
                                                    },
                                                    child: SizedBox(
                                                      width: 60 * fem,
                                                      height: 30 * fem,
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                              color: const Color(
                                                                  0xffffffff)),
                                                          color: const Color(
                                                              0x7fffffff),
                                                        ),
                                                        child: Text(
                                                          'CANCEL',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: SafeGoogleFont(
                                                            'Inter',
                                                            fontSize: 12 * ffem,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1.2125 *
                                                                ffem /
                                                                fem,
                                                            decoration:
                                                                TextDecoration
                                                                    .none,
                                                            color: const Color(
                                                                0xffffffff),
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
                                    }).whenComplete(
                                  () {
                                    if (GroupMemberController.text.isNotEmpty) {
                                      setState(() {
                                        namelist
                                            .add(GroupMemberController.text);
                                        positionlist.add("Member");
                                      });
                                    }
                                  },
                                );
                              },
                              child: SizedBox(
                                width: 330 * fem,
                                height: 30 * fem,
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xffffffff)),
                                    color: const Color(0x7fffffff),
                                  ),
                                  child: Text(
                                    'ADD MEMBER',
                                    textAlign: TextAlign.center,
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
                          ],
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        if (memberposition == 1)
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 360 * fem,
                              height: 38 * fem,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffff0000)),
                              ),
                              child: Center(
                                child: Text(
                                  'Delete group',
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
                        if (memberposition == 2)
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 360 * fem,
                              height: 38 * fem,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xffff0000)),
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
                          height: 3,
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
                                                  const Text(
                                                    "Save successfull",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
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
                      ],
                    ),
                  );
                }
                if (memberposition == 3) {
                  return const GroupMemberDetailPage();
                }
              }
              return const GroupMemberDetailPage();
            })
          ],
        ),
      ),
    );
  }
}
