import 'dart:ui';

import 'package:faxina_ja_app/models/User.dart';
import 'package:faxina_ja_app/services/UserService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';


class CadastroProfessionalStepTwo extends StatefulWidget {
  String email;
  String phone;
  String name ;
  String document ;

  CadastroProfessionalStepTwo({
  required this.email,
  required this.phone,
  required this.name ,
  required this.document });

  @override
  _CadastroProfessionalStepTwo createState() => _CadastroProfessionalStepTwo(email,phone,name,document);
}

class _CadastroProfessionalStepTwo extends State<CadastroProfessionalStepTwo> {
  final _form = GlobalKey<FormState>();
  String _senha = "";
  String _confirmacao = "";

  String email;
  String phone;
  String name ;
  String document;

  _CadastroProfessionalStepTwo(this.email,this.phone,this.name,this.document);

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
                  onPressed: () async {
                    if (_form.currentState!.validate()) {

                        Placemark currentPosition = await getCurrentPosition();
                        User user = new User(name: name,
                            document: document,
                            email: email,
                            password: _senha,
                            userType: "p",
                            address: new Address(street: currentPosition.street.toString(),
                                number: int.parse(currentPosition.name.toString()),
                                city: currentPosition.subAdministrativeArea.toString(),
                                state: currentPosition.administrativeArea.toString(),
                                country: currentPosition.country.toString(),
                                zipCode: currentPosition.postalCode.toString(),
                                region: ""));
                        UserService().saveUser(user);
                        Navigator.of(context).popUntil((route) => route.isFirst);

                    }
                  },
                  child: Text(
                    "Finalizar",
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

  getCurrentPosition() async{
    Position position = await Geolocator.getCurrentPosition();
    List<Placemark> locais =   await placemarkFromCoordinates(position.latitude, position.longitude);
    return locais.first;
  }
}