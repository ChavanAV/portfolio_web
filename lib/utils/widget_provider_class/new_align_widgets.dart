import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rive/rive.dart';

import '../../resourses/new_provider.dart';
import '../widgets/icon_btn.dart';

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
  Column profileImg(double heightSize, double widthSize,
      Map<String, dynamic> data, Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: (size.width > 1100) ? 100 : 0,
        ),
        Container(
          height: heightSize,
          width: widthSize,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.values[2],
                  image: NetworkImage(
                    data['MyImageUrl'].toString(),
                  )),
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.black)),
        ),
        SizedBox(
          height: (size.width > 1100) ? 100 : 50,
        ),
        ElevatedButton(
            style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll(Size.fromWidth(250)),
                backgroundColor: MaterialStatePropertyAll(Colors.redAccent),
                overlayColor: MaterialStatePropertyAll(Colors.orange),
                shape: MaterialStatePropertyAll(
                    StadiumBorder(side: BorderSide(color: Colors.grey)))),
            onPressed: () {
              Launch().openDocument(data['ResumeUrl'].toString());
            },
            child: const Text("View Resume")),
      ],
    );
  }

  Column profileDescription(double titleSize, double descrSize, heightSize,
      Map<String, dynamic> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "${data['MyName'].toString()}\n",
          style: TextStyle(
              fontSize: titleSize,
              color: Colors.black,
              fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            data['ProfileDescription'].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: descrSize + 2,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 125,
            ),
            const Text("Connect with",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                )),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HoverIconButton(
                  press: () =>
                      Launch().launchEmail('akshaychavan5080@gmail.com'),
                  icon: const FaIcon(FontAwesomeIcons.envelope,
                      size: 40, color: Colors.red),
                ),
                HoverIconButton(
                  press: () => Launch().launchWhatsApp('8805855080'),
                  icon: const FaIcon(FontAwesomeIcons.whatsapp,
                      size: 40, color: Color(0XFF019267)),
                ),
                HoverIconButton(
                  press: () => Launch().openDocument(
                      'https://www.linkedin.com/in/chavan-akshay5080/'),
                  icon: const FaIcon(FontAwesomeIcons.linkedin,
                      size: 40, color: Colors.blue),
                ),
                HoverIconButton(
                  press: () =>
                      Launch().openDocument('https://github.com/ChavanAV'),
                  icon: const FaIcon(FontAwesomeIcons.github,
                      size: 40, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
