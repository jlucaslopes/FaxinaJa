import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login/loginPage.dart';

class CadastroProfessionalStepThree extends StatefulWidget {
  const CadastroProfessionalStepThree({Key? key}) : super(key: key);

  @override
  _CadastroProfessionalStepThree createState() =>
      _CadastroProfessionalStepThree();
}

class _CadastroProfessionalStepThree
    extends State<CadastroProfessionalStepThree> {
  final _form = GlobalKey<FormState>();
  String _senha = "";
  String _confirmacao = "";

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
                    "Cadastre sua ",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Lalezar",
                        fontSize: 20),
                  ),
                  Text(
                    "Senha",
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
              constraints: BoxConstraints(minHeight: 460),
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
          inputSenhaTextField(),
          inputConfirmField(),
          textEspecifications(),
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
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }
                  },
                  child: Text(
                    "Enviar Cadastro",
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

  Widget inputSenhaTextField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 3),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Senha:",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
          child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              onSaved: (value) {
                _senha = value!;
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
                _senha = value!;
                if (value.isEmpty) {
                  return "Senha inválida";
                }
              }),
        ),
      ],
    );
  }

  Widget inputConfirmField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 3),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Confirmacao de senha:",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
          child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              obscureText: true,
              onSaved: (value) {
                _confirmacao = value!;
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
                _confirmacao = value!;
                if (_confirmacao.isEmpty || _confirmacao != _senha) {
                  return "Senha incompativel ou vazia";
                }
              }),
        ),
      ],
    );
  }

  Widget textEspecifications() {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 25, bottom: 10),
          child: Text(
            "Assim q sua solicitação de cadastro for enviada, \n passara por uma autenticação que vai validar os \n dados informados, você será notificado \n assim que a avaliação for concluída !",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Roboto",
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
