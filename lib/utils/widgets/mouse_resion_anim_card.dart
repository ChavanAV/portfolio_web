import 'package:flutter/material.dart';

class MouseRegionAnimCard extends StatefulWidget {
  final Map<String, dynamic> snapshot;
  const MouseRegionAnimCard({Key? key, required this.snapshot})
      : super(key: key);

  @override
  State<MouseRegionAnimCard> createState() => _MouseRegionAnimCardState();
}

class _MouseRegionAnimCardState extends State<MouseRegionAnimCard> {
  BorderRadius? radius;
  Color? color;
  double? height;
  double? width;
  bool? animate;
  bool? textAppear;

  void chang(bool a) {
    setState(() {
      if (a) {
        height = 450;
        width = 800;
        color = Colors.cyan;
        radius = BorderRadius.circular(40);
        Future.delayed(const Duration(milliseconds: 300), () {
          setState(() {
            textAppear = true;
          });
        });
      } else {
        height = 370;
        width = 370;
        color = Colors.deepOrange;
        radius = BorderRadius.circular(300);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    animate = false;
    textAppear = false;
    chang(animate!);
  }

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          animate = true;
          chang(animate!);
        });
      },
      onExit: (event) {
        setState(() {
          textAppear = false;
          animate = false;
          chang(animate!);
        });
      },
      child: Container(
        height: 700,
        width: 800,
        margin: EdgeInsets.symmetric(horizontal: (widthSize > 800) ? 0 : 10),
        child: Stack(
          children: [
            Align(
              alignment: const Alignment(0, 0),
              child: AnimatedContainer(
                height: height!,
                width: width!,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                duration: const Duration(milliseconds: 275),
                decoration: BoxDecoration(
                    borderRadius: radius!,
                    gradient: const LinearGradient(colors: [
                      Color(0xFFffecd2),
                      Color(0xFFfcb69f),
                    ]),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 0),
                        color: Colors.black45,
                        blurStyle: BlurStyle.outer,
                        blurRadius: 5,
                        spreadRadius: 0,
                      ),
                    ]),
                child: AnimatedOpacity(
                  opacity: textAppear! ? 1 : 0,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.bounceOut,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                            // text: "Instagram Clone\n\n",
                            text:
                                "${widget.snapshot['ProjectName'].toString()}\n\n",
                            style: const TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          TextSpan(
                            text: widget.snapshot['Description'].toString(),
                            style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          )
                        ]),
                      )

                      // (widget.index == 1)
                      //     ? RichText(
                      //         textAlign: TextAlign.center,
                      //         text: TextSpan(children: [
                      //           TextSpan(
                      //             // text: "Instagram Clone\n\n",
                      //             text:
                      //                 "${widget.snapshot['ProjectName'].toString()}\n\n",
                      //             style: const TextStyle(
                      //                 fontSize: 22,
                      //                 color: Colors.black,
                      //                 fontWeight: FontWeight.w600),
                      //           ),
                      //           TextSpan(
                      //             text:
                      //                 widget.snapshot['Description'].toString(),
                      //             // text:
                      //             //     "This is full stack social media application,\n"
                      //             //     "that closely resemble to\n"
                      //             //         "popular application instagram.\n"
                      //             //     "This platform would allow user\n"
                      //             //         "to create profile,post photos,\n"
                      //             //         "follow/unfollow other user, like other's posts,\n"
                      //             //     "searching users.\n"
                      //             //     "This application is developed using\n"
                      //             //         "cross platform Flutter,\n"
                      //             //     "and uses Firebase services like Firebase Auth,\n"
                      //             //     "Firestore Database,Firebase Storage.\n",
                      //             style: const TextStyle(
                      //                 fontSize: 18,
                      //                 color: Colors.black,
                      //                 fontWeight: FontWeight.w500),
                      //           )
                      //         ]),
                      //       )
                      //     : (widget.index == 2)
                      //         ? RichText(
                      //             textAlign: TextAlign.center,
                      //             text: const TextSpan(children: [
                      //               TextSpan(
                      //                 text: "ChatGpt Application\n\n",
                      //                 style: TextStyle(
                      //                     fontSize: 22,
                      //                     color: Colors.black,
                      //                     fontWeight: FontWeight.w600),
                      //               ),
                      //               TextSpan(
                      //                 text:
                      //                     "This is AI based chat bot application,\n"
                      //                     "in which user can hit any query,\n"
                      //                     "to achieve appropriate answer.\n"
                      //                     "This application uses OpenAI's API,\n"
                      //                     "to fetch the answer.\n",
                      //                 style: TextStyle(
                      //                     fontSize: 18,
                      //                     color: Colors.black,
                      //                     fontWeight: FontWeight.w500),
                      //               )
                      //             ]),
                      //           )
                      //         : (widget.index == 3)
                      //             ? RichText(
                      //                 textAlign: TextAlign.center,
                      //                 text: const TextSpan(children: [
                      //                   TextSpan(
                      //                     text: "Note Application\n\n",
                      //                     style: TextStyle(
                      //                         fontSize: 22,
                      //                         color: Colors.black,
                      //                         fontWeight: FontWeight.w600),
                      //                   ),
                      //                   TextSpan(
                      //                     text: "Keeping note is become\n"
                      //                         "part of our life.\n"
                      //                         "This application can be used\n"
                      //                         " to keep day to day notes.\n"
                      //                         "Application allow user to\n"
                      //                         "add notes, upload photos.\n"
                      //                         "which will be stored\n"
                      //                         "on Firebase database."
                      //                         "It provides email and\n"
                      //                         "phone authentication facilities,\n",
                      //                     style: TextStyle(
                      //                         fontSize: 18,
                      //                         color: Colors.black,
                      //                         fontWeight: FontWeight.w500),
                      //                   )
                      //                 ]),
                      //               )
                      //             : (widget.index == 4)
                      //                 ? RichText(
                      //                     textAlign: TextAlign.center,
                      //                     text: const TextSpan(children: [
                      //                       TextSpan(
                      //                         text: "Offline Chat\n\n",
                      //                         style: TextStyle(
                      //                             fontSize: 22,
                      //                             color: Colors.black,
                      //                             fontWeight: FontWeight.w600),
                      //                       ),
                      //                       TextSpan(
                      //                         text:
                      //                             "This is Offline chatting application,\n"
                      //                             "that allow user to create profile,\n"
                      //                             "group chatting, and sending photos.\n"
                      //                             "User credentials are stored in shared preferences,\n"
                      //                             "Photos are fetched using Third party API.\n",
                      //                         style: TextStyle(
                      //                             fontSize: 18,
                      //                             color: Colors.black,
                      //                             fontWeight: FontWeight.w500),
                      //                       )
                      //                     ]),
                      //                   )
                      //                 : (widget.index == 5)
                      //                     ? RichText(
                      //                         textAlign: TextAlign.center,
                      //                         text: const TextSpan(children: [
                      //                           TextSpan(
                      //                             text: "Tic-Toc-Toe\n\n",
                      //                             style: TextStyle(
                      //                                 fontSize: 22,
                      //                                 color: Colors.black,
                      //                                 fontWeight:
                      //                                     FontWeight.w600),
                      //                           ),
                      //                           TextSpan(
                      //                             text: "Gaming application,\n"
                      //                                 "Application allow user\n"
                      //                                 "to play alternatively, if the three sequential\n"
                      //                                 "positions will match, then that particular\n"
                      //                                 "user will be win the match\n"
                      //                                 "While playing one can reset the match,\n"
                      //                                 "and also start from onwards.\n",
                      //                             style: TextStyle(
                      //                                 fontSize: 18,
                      //                                 color: Colors.black,
                      //                                 fontWeight:
                      //                                     FontWeight.w500),
                      //                           )
                      //                         ]),
                      //                       )
                      //                     : RichText(
                      //                         textAlign: TextAlign.center,
                      //                         text: const TextSpan(children: [
                      //                           TextSpan(
                      //                             text: "Luck Game\n\n",
                      //                             style: TextStyle(
                      //                                 fontSize: 22,
                      //                                 color: Colors.black,
                      //                                 fontWeight:
                      //                                     FontWeight.w600),
                      //                           ),
                      //                           TextSpan(
                      //                             text:
                      //                                 "It is gaming application,\n"
                      //                                 "affiliated with numbers.\n"
                      //                                 "In this game user have to enter\n"
                      //                                 "the number in the given range.\n"
                      //                                 "If the number is matched with\n"
                      //                                 "randomly generated number by the computer\n"
                      //                                 "then the score is increases.\n"
                      //                                 "And if it does not match then score is reduced\n"
                      //                                 "After getting desirable score player get wins.\n",
                      //                             style: TextStyle(
                      //                                 fontSize: 18,
                      //                                 color: Colors.black,
                      //                                 fontWeight:
                      //                                     FontWeight.w500),
                      //                           )
                      //                         ]),
                      //                       ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
                alignment: const Alignment(0, 0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 270),
                  padding: EdgeInsets.only(left: animate! ? 400 : 0),
                  height: height! + 100,
                  child: (widthSize > 800)
                      ? projImg(widget.snapshot['AnimatedImage'].toString())
                      : GestureDetector(
                          onTapUp: (details) {
                            setState(() {
                              textAppear = false;
                              animate = false;
                              chang(animate!);
                            });
                          },
                          onTapDown: (details) {
                            setState(() {
                              animate = true;
                              chang(animate!);
                            });
                          },
                          child: projImg(
                              widget.snapshot['AnimatedImage'].toString()),
                        ),
                ))
          ],
        ),
      ),
    );
  }

  Image projImg(img) {
    return Image(
      image: NetworkImage(img),
      // image: (widget.index == 1)
      //     ? const AssetImage("assets/images/separate_proj/insta.jpg")
      //     : (widget.index == 2)
      //         ? const AssetImage("assets/images/separate_proj/chatgpt.jpg")
      //         : (widget.index == 3)
      //             ? const AssetImage("assets/images/separate_proj/note.jpg")
      //             : (widget.index == 4)
      //                 ? const AssetImage("assets/images/separate_proj/chat.jpg")
      //                 : (widget.index == 5)
      //                     ? const AssetImage(
      //                         "assets/images/separate_proj/tic toc.jpg")
      //                     : const AssetImage(
      //                         "assets/images/separate_proj/luck.jpg"),
    );
  }
}
