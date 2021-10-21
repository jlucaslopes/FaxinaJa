import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:faxina_ja_app/screens/login/cadastroProfissional/stepTwoProfessional.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CadastroProfessionalStepOne extends StatefulWidget {
  const CadastroProfessionalStepOne({Key? key}) : super(key: key);

  @override
  _CadastroProfessionalStepOne createState() => _CadastroProfessionalStepOne();
}

class _CadastroProfessionalStepOne extends State<CadastroProfessionalStepOne> {
  final _form = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _documentController = TextEditingController();

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
                    "Cadastre-se no ",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Lalezar",
                        fontSize: 20),
                  ),
                  Text(
                    "FaxinaJa",
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
              constraints: BoxConstraints(minHeight: 575),
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
          inputEmailTextField(),
          inputPhoneField(),
          inputNameField(),
          inputDocumentField(),
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
                                CadastroProfessionalStepTwo(document: _documentController.text,
                                email: _emailController.text,name: _nameController.text,phone: _phoneController.text)),
                      );
                    }
                  },
                  child: Text(
                    "Continuar Cadastro",
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

  Widget inputEmailTextField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 3),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "E-mail:",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
          child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
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
                if (!EmailValidator.validate(value!)) {
                  return "E-mail inválido";
                }
              }),
        ),
      ],
    );
  }

  Widget inputPhoneField() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 3),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Telefone:",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
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
            controller: _phoneController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Campo Obrigatorio";
              }
            }),
      ),
    ]);
  }

  Widget inputNameField() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 3),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Nome Completo:",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
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
            controller: _nameController,
            validator: (value) {
              if (value!.isEmpty) {

                return "Campo Obrigatório";
              }
            }),
      ),
    ]);
  }

  Widget inputDocumentField() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 1),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            "Documento CPF/CNPJ:",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
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
            controller: _documentController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Campo Obrigatório";
              }
            }),
      ),
    ]);
  }
}
