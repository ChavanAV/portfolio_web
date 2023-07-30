import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_web/layout_screen/mobile_screen.dart';
import 'package:portfolio_web/layout_screen/responsiv_layout.dart';
import 'package:portfolio_web/layout_screen/tab_screen.dart';
import 'package:portfolio_web/resourses/getx_provider.dart';
import 'package:portfolio_web/resourses/new_provider.dart';
import 'package:provider/provider.dart';

import 'layout_screen/web_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyAkIH2UISQ2uI5mCQqbYQ9VUg0VmtL56Rc",
    projectId: "portfolio-web-40fb9",
    messagingSenderId: "569927544873",
    appId: "1:569927544873:web:a32261a88efb0007ab2c38",
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final MyController myController = Get.put(MyController());
  final educationInfoStream =
      FirebaseFirestore.instance.collection("Education");
  final experienceInfoStream =
      FirebaseFirestore.instance.collection("Experience");
  final skillInfoStream = FirebaseFirestore.instance.collection("Skills");
  final projectInfoStream = FirebaseFirestore.instance.collection("Projects");
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await myController.educationInfo(
      educationInfoStream.get(),
    );
    await myController.experienceInfo(
      experienceInfoStream.get(),
    );
    await myController.skillInfo(
      skillInfoStream.get(),
    );
    await myController.projectInfo(
      projectInfoStream.get(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IndexProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white10),
        home: const ResponsivLayout(
          webScreenLayout: WebScreen(),
          tabScreenLayout: TabScreenLayout(),
          mobileScreenLayout: MobileScreen(),
        ),
      ),
    );
  }
}
