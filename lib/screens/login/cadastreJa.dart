import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadastreJaScreen extends StatefulWidget {
  const CadastreJaScreen({Key? key}) : super(key: key);

  @override
  _CadastreJaScreenState createState() => _CadastreJaScreenState();
}

class _CadastreJaScreenState extends State<CadastreJaScreen> {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(55, 10, 91, 100),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 70, bottom: 80),
            child: Text(
              "Cadatre-se já FaxinaJa",
              style: TextStyle(color: Colors.white),
            ),
          ),
          getSquare(),
        ],
      ),
    );
  }

  Widget getSquare() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Stack(children: [
        Container(
          width: size.width - 60,
          height: size.height * 0.7,
          decoration: BoxDecoration(
            color: Color.fromRGBO(140, 96, 129, 100),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        getForm()
      ]),
    );
  }

  Widget getForm() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 105, right: 105, top: 30),
          child: Text(
            "Insira seus dados",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Form(key: _form, child: Container())
      ],
    );
  }
}
