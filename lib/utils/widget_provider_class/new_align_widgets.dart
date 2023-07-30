import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rive/rive.dart';

import '../../resourses/new_provider.dart';
import '../widgets/icon_btn.dart';
import '../widgets/skills_card.dart';
import '../widgets/tool_tip.dart';

class BgDecoration {
  ///This is the rive animation video assets path
  RiveAnimation rivImg() {
    return const RiveAnimation.asset("assets/anim/b.riv", fit: BoxFit.fill);
  }

  ///This is the opacity to the rive effect
  BackdropFilter bgOpacity() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
      child: Container(
        color: Colors.white.withOpacity(.4),
      ),
    );
  }
}

class AlignWidget {
  ///This is my profile image
  Container profileImg(double heightSize, double widthSize) {
    return Container(
      height: heightSize,
      width: widthSize,
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.values[2],
              image: const AssetImage(
                "assets/images/prof_pic.jpg",
              )),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              color: Colors.black,
              blurStyle: BlurStyle.normal,
              blurRadius: 3,
              spreadRadius: 0,
            )
          ]),
    );
  }

  Column profileDescription(
      double titleSize, double descrSize, snapshot, heightSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 25,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
              text: "Hi it's, Akshay Chavan\n",
              style: TextStyle(
                  fontSize: titleSize,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
            TextSpan(
              text: "As a Computer Science student\n"
                  "I want to become a skilled developer with various programming skills.",
              style: TextStyle(
                  fontSize: descrSize + 2,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            )
          ]),
        ),
        const SizedBox(
          height: 25,
        ),
        Text("Connect with",
            style: TextStyle(
              fontSize: descrSize,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            )),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HoverIconButton(
              press: () =>
                  Launch().launchurl('linkedin.com', '/in/chavan-akshay5080'),
              icon: const FaIcon(FontAwesomeIcons.linkedin,
                  size: 40, color: Colors.blue),
            ),
            const SizedBox(
              width: 50,
            ),
            HoverIconButton(
              press: () => Launch().launchurl('github.com', '/ChavanAV'),
              icon: const FaIcon(FontAwesomeIcons.github,
                  size: 40, color: Colors.black),
            ),
            const SizedBox(
              width: 50,
            ),
            HoverIconButton(
              press: () => Launch()
                  .launchurl('facebook.com', '/profile.php?id=100041791265250'),
              icon: const FaIcon(FontAwesomeIcons.facebook,
                  size: 40, color: Colors.blue),
            )
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          "Skills",
          style: TextStyle(
            fontSize: descrSize,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        SizedBox(
          height: heightSize * 0.12,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ToolTip(
                    msg: snapshot.data!.docs[index]['Skills'].toString(),
                    child: SkillsCard(
                      img: snapshot.data!.docs[index]['SkillImage'].toString(),
                      skillName:
                          snapshot.data!.docs[index]['SkillName'].toString(),
                    )),
              );
            },
          ),
        )
      ],
    );
  }
}
