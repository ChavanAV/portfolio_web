import 'package:flutter/material.dart';

import '../utils/v/video_player.dart';
import '../utils/widgets/project_glance_img.dart';

class ProjectDetailScreen extends StatefulWidget {
  final Map<String, dynamic> snapshot;
  const ProjectDetailScreen({super.key, required this.snapshot});

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0XFFEEEDED),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IconButton(
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //     icon: const Icon(
              //       Icons.close,
              //       size: 30,
              //     )),
              // const SizedBox(
              //   height: 10,
              // ),
              SizedBox(
                height: 590,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 7,
                      child: Container(
                        margin: const EdgeInsets.only(right: 20.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: MyVideoPlayer(
                          documentUrl: widget.snapshot['vidUrl'].toString(),
                        ),
                      ),
                    ),
                    (size.width > 1100)
                        ? Flexible(
                            flex: 3,
                            child: SingleChildScrollView(
                                child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                      widget.snapshot['ProjectName'].toString(),
                                      style: const TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.w700)),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  widget.snapshot['Description'].toString(),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )),
                          )
                        : Container(),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              (size.width < 1100)
                  ? Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(widget.snapshot['ProjectName'].toString(),
                              style: const TextStyle(
                                  fontSize: 26, fontWeight: FontWeight.w700)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          widget.snapshot['Description'].toString(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  : Container(),
              const SizedBox(
                height: 30,
              ),
              const Text("Application Glance",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700)),
              const SizedBox(
                height: 30,
              ),
              GridView.builder(
                shrinkWrap: true,
                itemCount: widget.snapshot['ImgUrl'].length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (size.width > 1100) ? 4 : 2,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  childAspectRatio: 10 / 20,
                ),
                itemBuilder: (context, index) {
                  final List<dynamic> imgUrlArray = widget.snapshot['ImgUrl'];
                  final String imgUrl = imgUrlArray[index];
                  return ProjectGlance(
                    imgPath: imgUrl,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
