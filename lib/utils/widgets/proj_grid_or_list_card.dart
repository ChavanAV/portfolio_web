import 'package:flutter/material.dart';

import '../../screens/project_detail_screen.dart';
import '../decoratio.dart';
import '../hover_effect/card.dart';

class ShowProjInfoCard extends StatefulWidget {
  final int index;
  final Map<String, dynamic> snapshot;
  const ShowProjInfoCard(
      {Key? key, required this.index, required this.snapshot})
      : super(key: key);

  @override
  State<ShowProjInfoCard> createState() => _ShowProjInfoCardState();
}

class _ShowProjInfoCardState extends State<ShowProjInfoCard> {
  late ImageProvider imageProvider;
  bool isImageLoaded = false;

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  void loadImage() {
    imageProvider = NetworkImage(widget.snapshot['ShowCaseImage']);
    ImageStream stream = imageProvider.resolve(ImageConfiguration.empty);
    stream.addListener(ImageStreamListener((_, __) {
      if (mounted) {
        setState(() {
          isImageLoaded = true;
        });
      }
    }, onError: (_, __) {
      if (mounted) {
        setState(() {
          isImageLoaded = false;
        });
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
    return HoverEffect(
        margin: (widthSize > 1100) ? 25 : 10,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(fit: BoxFit.fitHeight, image: imageProvider),
            gradient: const LinearGradient(colors: [
              Colors.green,
              Colors.lightGreenAccent,
              Colors.deepOrangeAccent,
              Colors.blueGrey,
              Colors.deepPurple
            ]),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 0),
                color: Colors.black45,
                blurStyle: BlurStyle.normal,
                blurRadius: 5,
                spreadRadius: 0,
              )
            ],
          ),
          child: Row(
            children: [
              Container(
                  height: (widthSize < 1100) ? heightSize * 0.5 : heightSize,
                  width:
                      (widthSize > 1100) ? widthSize * 0.13 : widthSize * 0.4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  margin:
                      EdgeInsets.all(MediaQuery.of(context).size.width * 0.001),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(widget.snapshot['ProjectName'].toString(),
                            style: appnamestyle),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProjectDetailScreen(
                                      snapshot: widget.snapshot,
                                    ),
                                  ));
                            },
                            style: const ButtonStyle(
                              shape: MaterialStatePropertyAll(StadiumBorder(
                                  side: BorderSide(
                                      color: Color.fromRGBO(3, 91, 97, 1)))),
                              backgroundColor: MaterialStatePropertyAll(
                                Colors.transparent,
                              ),
                              elevation: MaterialStatePropertyAll(0),
                            ),
                            child: const Text(
                              "View Details",
                              style: TextStyle(
                                  color: Color.fromRGBO(3, 91, 97, 1)),
                            )),
                      ],
                    ),
                  )),
              Expanded(child: Container())
            ],
          ),
        ));
  }
}
