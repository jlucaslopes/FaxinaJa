import 'dart:ui';

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
          height: size.height * 0.6,
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
    return Form(
      key: _form,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 105, right: 105, top: 30, bottom: 40),
            child: Text(
              "Insira seus dados",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          inputTextField(null, null, "E-mail"),
          inputTextField(null, null, "Confirme sua Senha"),
          inputTextField(null, null, "Senha"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(40),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(255, 0, 0, 100)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Voltar",
                    style:
                        TextStyle(fontFamily: "Lalezar", color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(255, 0, 0, 0)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Enviar",
                    style:
                        TextStyle(fontFamily: "Lalezar", color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget inputTextField(bool? isPassword, TextInputType? inputType, String name) {
  return Padding(
    padding: const EdgeInsets.only(left: 30, right: 30, bottom: 25),
    child: TextFormField(
      keyboardType: inputType == null ? TextInputType.name : inputType,
      obscureText: isPassword == null ? false : isPassword,
      decoration: InputDecoration(
        hintText: name,
        labelStyle: TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
        fillColor: Colors.white,
        filled: true,
        contentPadding:
            new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      ),
      validator: (value) {
        if ("" == value) {
          return "Required";
        } else {
          return null;
        }
      },
    ),
  );
}
