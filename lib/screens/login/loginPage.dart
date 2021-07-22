import 'package:flutter/material.dart';

import 'cadastreJa.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _form = GlobalKey<FormState>();

  void validate() {
    if (!_form.currentState!.validate()) {
      print("Invalido");
    }
  }

  String? validatePass(value) {
    if (value.isEmpty) {
      return "Campo teste";
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
            child: Container(
              width: size.width - 60,
              height: size.height * 0.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/back-logo.png"),
                      fit: BoxFit.none),
                  borderRadius: BorderRadius.circular(20)),
            )),
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
          padding: const EdgeInsets.only(left: 30, right: 30, top: 80),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              Row(
                children: [
                  Text(
                    "Olá, bem vindo(a)",
                    style: TextStyle(fontFamily: "Lalezar-Regular"),
                  ),
                ],
              ),
              Text("ao FaxinaJá",
                  style: TextStyle(fontFamily: "Lalezar-Regular")),
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
                  fontFamily: "Lalezar-Regular"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
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
              onChanged: (text) {
                print(text);
              },
              validator: (value) {
                if ("" == value) {
                  return "Required";
                } else {
                  return null;
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
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
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CadastreJaScreen()),
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
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Login",
                style: TextStyle(fontFamily: "Lalezar", color: Colors.white),
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
                          builder: (context) => CadastreJaScreen()),
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
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
