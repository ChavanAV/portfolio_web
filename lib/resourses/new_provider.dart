import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../screens/skill_screen.dart';
import '../screens/web_cretifications_screen.dart';
import '../screens/web_edu_screen.dart';
import '../screens/web_experience_screen.dart';
import '../screens/web_profile_screen.dart';
import '../screens/web_projects_screen.dart';

class IndexProvider extends ChangeNotifier {
  int currentIndex = 0;
  List<Widget> pages = [
    WProfileScreen(),
    SkillScreen(),
    const WProjectsScreen(),
    WExperienceScreen(),
    const WCertificationScreen(),
    WebEducationScreen(),
  ];
  void grantIndex(index) {
    currentIndex = index;
    notifyListeners();
  }
}

class Launch {
  Future<void> openDocument(myUrl) async {
    if (!await launchUrlString(
      myUrl,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Url Not Found.';
    }
  }

  void launchWhatsApp(String phoneNumber) async {
    final url = "https://wa.me/$phoneNumber";
    if (!await launchUrlString(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Url Not Found.';
    }
  }

  void launchEmail(String eMail) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: eMail,
    );

    if (!await launchUrlString(
      emailLaunchUri.toString(),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Url Not Found.';
    }
  }
}
