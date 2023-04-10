// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:myapp/AdminViewGroupListPage/group-list-page.dart';
import 'package:myapp/AdminViewUserListPage/user-list-page.dart';
import 'package:myapp/Dialog.dart';
import 'package:myapp/GroupListPage/group-list-page.dart';
import 'package:myapp/MainTabPage/Tabclass.dart';
import 'package:myapp/ProfilePage/profile-page.dart';
import 'package:myapp/Services/Account_service.dart';
import 'package:myapp/Services/Auth.dart';
import 'package:myapp/UserTaskListPage/user-task-list-page.dart';
import 'package:myapp/models/user.dart';

class MainTab extends StatefulWidget {
  final page;

  const MainTab({Key? key, this.page}) : super(key: key);

  @override
  State<MainTab> createState() => MainTabPage();
}

class MainTabPage extends State<MainTab> {
  int page = 1;
  User_Account? user;
  late FirebaseMessaging messaging;
  Icon icon = const Icon(Icons.task, color: Colors.black, size: 40);
  @override
  void initState() {
    super.initState();
    // Get the order
    if (widget.page != null) {
      page = widget.page;
    }
    messaging = FirebaseMessaging.instance;
  }

  void refreshpage(int a) {
    setState(() {
      page = a;
    });
  }

  void display(User_Account? user) {
    if (user?.username == "Admin") {
      setState(() {
        icon = const Icon(Icons.person, color: Colors.black, size: 40);
      });
    }
  }

  Future<void> getUser() async {
    Future<User_Account?> futureuser = Accountservice().GetUser();
    user = await futureuser;
    if (user!.ban == true) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const dialog(
              message: "Your account has been banned",
            );
          }).whenComplete(() {
        Auth().signOut();
      });
    }
    display(user);
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return SizedBox(
      width: double.infinity,
      child: SizedBox(
        // grouptasklistpageXSY (107:18)
        width: double.infinity,
        height: 760 * fem,
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
              tab(refreshpage: refreshpage, icon: icon),
              FutureBuilder(
                  future: getUser(),
                  builder: (context, snapshot) {
                    if (page == 1) {
                      return ProfilePage(
                        UserAccount: user,
                      );
                    } else if (page == 2) {
                      if (user?.username == "Admin") {
                        return UserListPage(
                          UserAccount: user,
                        );
                      } else {
                        return UserTaskListPage(
                          refreshpage: refreshpage,
                          UserAccount: user,
                          icon: icon,
                        );
                      }
                    } else {
                      if (user!.username == "Admin") {
                        return AllGroupListPage(
                          UserAccount: user,
                        );
                      } else {
                        return GroupListPage(
                          UserAccount: user,
                        );
                      }
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
