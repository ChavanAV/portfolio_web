import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_web/resourses/getx_provider.dart';
import 'package:portfolio_web/resourses/new_provider.dart';
import 'package:provider/provider.dart';

import 'layout_screen/mobile_screen.dart';
import 'layout_screen/responsiv_layout.dart';
import 'layout_screen/tab_screen.dart';
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

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() {
    myController.educationInfo();
    myController.experienceInfo();
    myController.skillInfo();
    myController.projectInfo();
    myController.certificationInfo();
    myController.profileInfo();
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
