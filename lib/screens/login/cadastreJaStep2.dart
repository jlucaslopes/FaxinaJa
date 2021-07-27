import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CadastreJaStep2 extends StatefulWidget {
  String email;
  String pass;

  CadastreJaStep2({
    required this.email,
    required this.pass,
  });

  @override
  _CadastreJaStep2State createState() => _CadastreJaStep2State(email, pass);
}

class _CadastreJaStep2State extends State<CadastreJaStep2> {
  final _form = GlobalKey<FormState>();

  String _email;
  String _pass;
  _CadastreJaStep2State(this._email, this._pass);

  String _nomeCompleto = "";
  String _telefone = "";
  late String _cpf;

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
                    "Cadatre-se já ",
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
            getSquare(),
          ],
        ),
      ),
    );
  }

  Widget getSquare() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Stack(children: [
        SingleChildScrollView(
          child: LimitedBox(
            maxWidth: size.width - 60,
            maxHeight: size.height * 0.65,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(140, 96, 129, 100),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
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
            padding:
                const EdgeInsets.only(left: 50, right: 50, top: 30, bottom: 40),
            child: Text(
              "Insira seus dados",
              style: TextStyle(
                fontFamily: "Lalezar",
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          inputNameTextField(),
          inputTelTextField(),
          inputCPFTextField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
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
                padding: const EdgeInsets.all(30),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(21, 9, 9, 53)),
                  ),
                  onPressed: () {
                    //   if (_form.currentState!.validate()) {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) =>
                    //                 CadastreJaStep3(_email, _pass)));
                    //   } else {
                    //     print("Inválido");
                    //   }
                  },
                  child: Text(
                    "Próximo",
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

  Widget inputNameTextField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 3),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Nome Completo",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
          child: TextFormField(
              keyboardType: TextInputType.name,
              obscureText: true,
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
                // _confirmPass = value!;
                // if (value.isEmpty) {
                //   _confirmPass = "";
                //   return "Campo Obrigatório";
                // }
                // if (value != _pass) {
                //   _confirmPass = "";
                //   return "Senhas nao coincidem";
                // }
                // _confirmPass = value;
              }),
        ),
      ],
    );
  }

  Widget inputTelTextField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 3),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Telefone: ",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
          child: TextFormField(
              keyboardType: TextInputType.name,
              obscureText: true,
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
                // _confirmPass = value!;
                // if (value.isEmpty) {
                //   _confirmPass = "";
                //   return "Campo Obrigatório";
                // }
                // if (value != _pass) {
                //   _confirmPass = "";
                //   return "Senhas nao coincidem";
                // }
                // _confirmPass = value;
              }),
        ),
      ],
    );
  }

  Widget inputCPFTextField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 3),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "Documento CPF: ",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
          child: TextFormField(
              keyboardType: TextInputType.name,
              obscureText: true,
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
                _cpf = value!;
                if (!CPFIsValid(value)) {
                  _cpf = "";
                  return "CPF Inválido";
                }
              }),
        ),
      ],
    );
  }
}

bool CPFIsValid(String cpf) {
  if (cpf == null) return false;

// Obter somente os números do CPF
  var numeros = cpf.replaceAll(RegExp(r'[^0-9]'), '');

// Testar se o CPF possui 11 dígitos
  if (numeros.length != 11) return false;

// Testar se todos os dígitos do CPF são iguais
  if (RegExp(r'^(\d)\1*$').hasMatch(numeros)) return false;

// Dividir dígitos
  List<int> digitos =
      numeros.split('').map((String d) => int.parse(d)).toList();

// Calcular o primeiro dígito verificador
  var calc_dv1 = 0;
  for (var i in Iterable<int>.generate(9, (i) => 10 - i)) {
    calc_dv1 += digitos[10 - i] * i;
  }
  calc_dv1 %= 11;
  var dv1 = calc_dv1 < 2 ? 0 : 11 - calc_dv1;

// Testar o primeiro dígito verificado
  if (digitos[9] != dv1) return false;

// Calcular o segundo dígito verificador
  var calc_dv2 = 0;
  for (var i in Iterable<int>.generate(10, (i) => 11 - i)) {
    calc_dv2 += digitos[11 - i] * i;
  }
  calc_dv2 %= 11;
  var dv2 = calc_dv2 < 2 ? 0 : 11 - calc_dv2;

// Testar o segundo dígito verificador
  if (digitos[10] != dv2) return false;

  return true;
}
