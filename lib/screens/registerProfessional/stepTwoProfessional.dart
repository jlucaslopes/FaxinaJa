import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../registerProfessional/stepThreeProfessional.dart';

class CadastroProfessionalStepTwo extends StatefulWidget {
  const CadastroProfessionalStepTwo({Key? key}) : super(key: key);

  @override
  _CadastroProfessionalStepTwo createState() => _CadastroProfessionalStepTwo();
}

class _CadastroProfessionalStepTwo extends State<CadastroProfessionalStepTwo> {
  final _form = GlobalKey<FormState>();
  String _cep = "";
  String _estado = "";
  String _cidade = "";
  String _rua = "";
  String _number = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(55, 10, 91, 100),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 50, bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Cadastre seu ",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Lalezar",
                        fontSize: 20),
                  ),
                  Text(
                    "Endereço",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Lalezar",
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            getSquare()
          ],
        ),
      ),
    );
  }

  Widget getSquare() {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Container(
        child: Stack(fit: StackFit.loose, children: <Widget>[
          Container(
            child: Container(
              constraints: BoxConstraints(minHeight: 610),
              decoration: BoxDecoration(
                color: Color.fromRGBO(93, 47, 108, 100),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          getForm()
        ]),
      ),
    );
  }

  Widget getForm() {
    return Form(
      key: _form,
      child: Column(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 30, bottom: 10),
            child: Text(
              "Insira seus dados",
              style: TextStyle(
                fontFamily: "Lalezar",
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          inputCepTextField(),
          inputEstadoField(),
          inputCidadeField(),
          inputRuaField(),
          inputNumeroField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size.fromWidth(200)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: Colors.transparent))),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(45, 19, 57, 100)),
                  ),
                  onPressed: () {
                    if (_form.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CadastroProfessionalStepThree()),
                      );
                    }
                  },
                  child: Text(
                    "Proximo Passo",
                    style: TextStyle(
                        fontFamily: "Lalezar",
                        color: Colors.white,
                        fontSize: 18),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget inputCepTextField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 3),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Cep:",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
          child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              onSaved: (value) {
                _cep = value!;
              },
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(10.0))),
              ),
              validator: (value) {
                _cep = value!;
                if (value.isEmpty) {
                  return "E-mail inválido";
                }
              }),
        ),
      ],
    );
  }

  Widget inputEstadoField() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 3),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Estado:",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
        child: TextFormField(
          keyboardType: TextInputType.name,
          obscureText: false,
          enabled: false,
          decoration: InputDecoration(
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            fillColor: Color.fromRGBO(106, 75, 117, 100),
            filled: true,
            contentPadding:
                new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          ),
        ),
      ),
    ]);
  }

  Widget inputCidadeField() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 3),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Cidade:",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
        child: TextFormField(
          keyboardType: TextInputType.name,
          obscureText: false,
          enabled: false,
          decoration: InputDecoration(
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            fillColor: Color.fromRGBO(106, 75, 117, 100),
            filled: true,
            contentPadding:
                new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          ),
        ),
      ),
    ]);
  }

  Widget inputRuaField() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 5),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Rua:",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
        child: TextFormField(
          keyboardType: TextInputType.name,
          obscureText: false,
          enabled: false,
          decoration: InputDecoration(
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            fillColor: Color.fromRGBO(106, 75, 117, 100),
            filled: true,
            contentPadding:
                new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          ),
        ),
      ),
    ]);
  }

  Widget inputNumeroField() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 1),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Numero:",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 1),
        child: TextFormField(
            keyboardType: TextInputType.name,
            obscureText: false,
            decoration: InputDecoration(
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
              _number = value!;
              if (value.isEmpty) {
                _number = "";
                return "Campo Obrigatório";
              }
            }),
      ),
    ]);
  }
}
