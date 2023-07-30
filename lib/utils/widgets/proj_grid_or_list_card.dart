import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../decoratio.dart';
import '../hover_effect/card.dart';

class ShowProjInfoCard extends StatelessWidget {
  final int index;
  final ItemScrollController itemScrollController;
  final Map<String, dynamic> snapshot;
  const ShowProjInfoCard(
      {Key? key,
      required this.index,
      required this.itemScrollController,
      required this.snapshot})
      : super(key: key);

  jumpTo(int index) {
    itemScrollController.scrollTo(
        index: index + 1,
        alignment: BorderSide.strokeAlignCenter,
        duration: const Duration(milliseconds: 500));
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
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: NetworkImage(snapshot['ShowCaseImage'])),
            gradient: gradient(index),
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
                  height:
                      (widthSize > 1300) ? heightSize * 0.5 : heightSize * 0.5,
                  width:
                      (widthSize > 1100) ? widthSize * 0.18 : widthSize * 0.4,
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
                        Text(snapshot['ProjectName'].toString(),
                            style: appnamestyle),
                        const SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            onPressed: () => jumpTo(index),
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
