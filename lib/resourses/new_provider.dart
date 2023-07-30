import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../screens/web_cretifications_screen.dart';
import '../screens/web_edu_screen.dart';
import '../screens/web_experience_screen.dart';
import '../screens/web_home_screen.dart';
import '../screens/web_projects_screen.dart';
import '../screens/web_resume_screen.dart';

class IndexProvider extends ChangeNotifier {
  int currentIndex = 0;
  List<Widget> pages = [
    WHomeScreen(),
    WebEducationScreen(),
    const WProjectsScreen(),
    WExperienceScreen(),
    const WCertificationScreen(),
    const WResumeScreen(),
  ];
  void grantIndex(index) {
    currentIndex = index;
    notifyListeners();
  }
}

class Launch {
  Future<void> launchurl(String nuri, String path) async {
    var uri = Uri.https(
      nuri,
      path,
    );
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "$uri Not Found";
    }
  }
}
