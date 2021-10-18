import 'package:faxina_ja_app/models/AuthObject.dart';
import 'package:faxina_ja_app/models/LoginToken.dart';
import 'package:faxina_ja_app/screens/login/forgetPass.dart';
import 'package:faxina_ja_app/screens/main/MainScreen.dart';
import 'package:faxina_ja_app/services/authService.dart';
import 'package:flutter/material.dart';

import 'choseprofiles.dart';
import '../dashboardProfessional/servicesHistoric.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>();
  final authService = new AuthService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  bool senhaIncorreta = false;

  AuthObject authObject = new AuthObject("", "");

  void validate() {
    if (!_form.currentState!.validate()) {
      print("Invalido");
    }
  }

  String? validatePass(value) {
    if (value.isEmpty) {
      return "Campo obrigatório";
    } else {
      authObject.password = value.toString();
      return null;
    }
  }

  String? validateUser(value) {
    if ("" == value) {
      return "Campo obrigatório";
    } else {
      authObject.email = value.toString();

      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFE8BEF6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            getLogo(),
            getLoginSquare(),
          ],
        ),
      ),
    );
  }

  Widget getLogo() {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 70),
          child: Container(
            width: size.width - 60,
            height: size.height * 0.4,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/back-logo.png"),
                  fit: BoxFit.none,
                ),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 150, right: 30, top: 130),
            child: Container(
              width: size.width - 60,
              height: size.height * 0.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/cleaner-homepage.png"),
                      fit: BoxFit.none),
                  borderRadius: BorderRadius.circular(20)),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 35),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Olá, bem vindo(a)",
                  style: TextStyle(
                      fontFamily: "Lexend-Deca",
                      color: Color.fromRGBO(74, 30, 89, 1),
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("ao FaxinaJá",
                          style: TextStyle(
                              fontFamily: "Lalezar",
                              color: Colors.white,
                              fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getLoginSquare() {
    var size = MediaQuery.of(context).size;
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
        child: Container(
          width: size.width - 60,
          height: size.height * 0.4,
          decoration: BoxDecoration(
            color: Color.fromRGBO(227, 168, 255, 100),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      getForm(),
    ]);
  }

  Widget getForm() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
      child: Form(
        key: _form,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Login",
              style: TextStyle(
                  color: Color.fromRGBO(109, 46, 139, 100),
                  fontSize: 25,
                  fontFamily: 'Lalezar'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  hintText: "Usuário",
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0))),
                  prefixIcon: Icon(Icons.person)),
              validator: validateUser,
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _senhaController,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.vpn_key),
                fillColor: Colors.white,
                contentPadding:
                    new EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                filled: true,
                hintText: 'Senha',
                border: OutlineInputBorder(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(20.0))),
              ),
              validator: validatePass,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Senha Incorreta',
                      style: TextStyle(
                        color: senhaIncorreta ? Colors.red : Colors.transparent,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgetPassPage()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Esqueceu sua senha?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size.fromWidth(100)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Colors.transparent),
                )),
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromRGBO(167, 34, 162, 100)),
              ),
              onPressed: () async {
                print(_emailController.text);
                print(_senhaController.text);
                if (_form.currentState!.validate()) {
                  var responseLogin = await authService.login(
                      _emailController.text, _senhaController.text);
                  if (responseLogin.token.isNotEmpty) {
                    if("cliente"==responseLogin.userType){
                      Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>
                              MainScreen(token: responseLogin.token)),
                    );} else{
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>
                              ServicesHistoricPage(token: responseLogin.token)),);
                    }
                  } else {
                    senhaIncorreta = !senhaIncorreta;
                  }
                }
              },
              child: Text(
                "Login",
                style: TextStyle(
                    fontFamily: "Lalezar", color: Colors.white, fontSize: 18),
              ),
            ),
            Row(
              children: [
                InkWell(
                  child: Text("Registre-se "),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChoseProfileScreen()),
                    );
                  },
                ),
                Text(
                  "ou use as opções:",
                  style: TextStyle(color: Colors.white),
                ),
                IconButton(
                  iconSize: 25,
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.blueAccent,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  iconSize: 25,
                  icon: Icon(
                    Icons.facebook,
                    color: Colors.blueAccent,
                  ),
                  onPressed: () {
                   // Navigator.push(
                   //   context,
                   //   MaterialPageRoute(
                   //       builder: (context) => ServicesHistoricPage()),
                   // );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
