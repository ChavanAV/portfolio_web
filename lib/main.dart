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
          apiKey: "AIzaSyAZqKq9rVoRhajtOthgdx6wRl_Gcdhb3bk",
          projectId: "chavan-akshay",
          messagingSenderId: "238422978254",
          appId: "1:238422978254:web:d9d369a75e6323799bea9f"));
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
        title: "Akshay Chavan",
        home: const ResponsiveLayout(
          webScreenLayout: WebScreen(),
          tabScreenLayout: TabScreenLayout(),
          mobileScreenLayout: MobileScreen(),
        ),
      ),
    );
  }
}
