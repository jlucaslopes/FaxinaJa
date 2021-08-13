import 'package:flutter/material.dart';

class ExtraWidget extends StatelessWidget {
    const ExtraWidget(
      {required String img,
      required String name,
      required bool isSelected,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
   
      return Column(
        children: [
          FloatingActionButton(
            onPressed: () {
              print("Geladeira pressionada");
              isSelected = !isSelected;
              print(isSelected);
            },
            backgroundColor: Colors.transparent,
            child: Stack(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xff5c4db1)),
                  child: Container(
                    margin: EdgeInsets.all(17),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/$img.png"),
                            fit: BoxFit.contain)),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: (isSelected == true)
                      ? Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Center(
                            child: Icon(
                              Icons.check_circle,
                              color: Color(0xffdc4f89),
                            ),
                          ),
                        )
                      : Container(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      );
    }
  }
}