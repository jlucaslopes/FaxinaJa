import 'package:flutter/material.dart';

class ExtraWidget extends StatefulWidget {
  ExtraWidget(
      {required this.img,
      required this.name,
      required this.isSelected,
      Key? key})
      : super(key: key);

  var isSelected;

  get _isSelected => isSelected;

  set _isSelected(_isSelected) {
    isSelected = _isSelected;
  }

  var name;
  var img;

  @override
  _ExtraWidgetState createState() => _ExtraWidgetState();
}

class _ExtraWidgetState extends State<ExtraWidget> {
  @override
  Widget build(BuildContext context) {
    var img = widget.img;
    return Column(
      children: [
        FloatingActionButton(
          onPressed: () {
            setState(() {
              widget.isSelected = !(widget.isSelected);
            });
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
                child: (widget.isSelected == true)
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
          widget.name,
          style: TextStyle(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
