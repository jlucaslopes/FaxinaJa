import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cadastreJa.dart';
import '../registerProfessional/stepOneProfessional.dart';

class ChoseProfileScreen extends StatefulWidget {
  const ChoseProfileScreen({Key? key}) : super(key: key);

  @override
  _ChoseProfileScreen createState() => _ChoseProfileScreen();
}

class _ChoseProfileScreen extends State<ChoseProfileScreen> {
  final _form = GlobalKey<FormState>();
  final _formUser = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(55, 10, 91, 100),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 50, right: 50, top: 70, bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Selecione aqui o seu \n tipo de cadastro',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Lalezar",
                        fontSize: 30),
                  ),
                ],
              ),
            ),
            getSquare(),
            getSquareProfessional(),
          ],
        ),
      ),
    );
  }

  Widget getSquare() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
      child: Stack(children: [
        SingleChildScrollView(
          child: Container(
            width: size.width - 60,
            height: size.height * 0.25,
            decoration: BoxDecoration(
              color: Color.fromRGBO(73, 42, 139, 100),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        getUserForm(),
      ]),
    );
  }

  Widget getUserForm() {
    return Form(
      key: _formUser,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 25, bottom: 10),
            child: Text(
              "Nós temos aqui este tipo de cadastro que é destinado para usuarios que precisam dos nossos serviços",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Roboto",
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size.fromWidth(200)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.transparent),
                    )),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(62, 8, 95, 100)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CadastreJaScreen()),
                    );
                  },
                  child: Text(
                    "Usuario",
                    style: TextStyle(
                        fontFamily: "Lalezar",
                        color: Colors.white,
                        fontSize: 24),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget getSquareProfessional() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Stack(children: [
        SingleChildScrollView(
          child: Container(
            width: size.width - 60,
            height: size.height * 0.25,
            decoration: BoxDecoration(
              color: Color.fromRGBO(73, 42, 139, 100),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        getProfessionalForm()
      ]),
    );
  }

  Widget getProfessionalForm() {
    return Form(
      key: _form,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 25, bottom: 10),
            child: Text(
              "E também temos o fluxo de cadastro para profissionais dispostos a trabalhar utilizando a  nossa plataforma",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Roboto",
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(Size.fromWidth(200)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: Colors.transparent))),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(62, 8, 95, 100)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CadastroProfessionalStepOne()),
                    );
                  },
                  child: Text(
                    "Profissional",
                    style: TextStyle(
                        fontFamily: "Lalezar",
                        color: Colors.white,
                        fontSize: 24),
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
