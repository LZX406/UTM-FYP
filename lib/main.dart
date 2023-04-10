import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:myapp/LoginPage/login-page.dart';
import 'package:myapp/MainTabPage/MainTab.dart';
import 'package:myapp/Services/Auth.dart';
import 'package:myapp/utils.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:myapp/page-1/group-list-page.dart';
// import 'package:myapp/page-1/admin-page.dart';
// import 'package:myapp/page-1/user-task-list-page.dart';
// import 'package:myapp/page-1/profile-page.dart';
// import 'package:myapp/page-1/user-create-task-page.dart';
// import 'package:myapp/page-1/group-create-task-page.dart';
// import 'package:myapp/page-1/create-new-group-page.dart';
// import 'package:myapp/page-1/user-task-detail-page.dart';
// import 'package:myapp/page-1/user-new-task-list-page.dart';
// import 'package:myapp/page-1/user-past-task-list-page.dart';
// import 'package:myapp/page-1/group-task-list-page.dart';
// import 'package:myapp/page-1/group-new-task-list-page.dart';
// import 'package:myapp/page-1/group-new-task-list-page-2.dart';
// import 'package:myapp/page-1/login-page.dart';
// import 'package:myapp/page-1/project-link-http-wwwprojectcom.dart';
// import 'package:myapp/page-1/project-link-http-wwwprojectcom-3qr.dart';
// import 'package:myapp/page-1/group-leader-detail-page.dart';
// import 'package:myapp/page-1/group-high-member-detail-page.dart';
// import 'package:myapp/page-1/group-normal-member-detail-page.dart';
// import 'package:myapp/page-1/group-task-progress-reply-page.dart';
// import 'package:myapp/page-1/group-task-progress-detail-page.dart';
// import 'package:myapp/page-1/group-task-progress-detail-page-fmJ.dart';
// import 'package:myapp/page-1/group-task-progress-detail-page-k5n.dart';
// import 'package:myapp/page-1/group-task-progress-reply-page-jQk.dart';
// import 'package:myapp/page-1/project-link-http-wwwproject1com.dart';
// import 'package:myapp/page-1/project-link-http-wwwproject1com-d5J.dart';
// import 'package:myapp/page-1/estimate-end-date-25-5-2023.dart';
// import 'package:myapp/page-1/adjust-to-estimate-date.dart';
// import 'package:myapp/page-1/rectangle-58.dart';
// import 'package:myapp/page-1/group-leader.dart';
// import 'package:myapp/page-1/rectangle-45.dart';
// import 'package:myapp/page-1/mailgmailcom.dart';
// import 'package:myapp/page-1/desktop-1.dart';
// import 'package:myapp/page-1/desktop-2.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

// Ideal time to initialize
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: StreamBuilder(
            stream: Auth().authStateChanges,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const MainTab();
              } else {
                return const LoginPage();
              }
            },
          ),
        ),
      ),
    );
  }
}
