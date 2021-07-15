import 'package:flutter/material.dart';

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
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20)),
            )),
        Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
            child: Container(
              width: size.width - 60,
              height: size.height * 0.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/cleaner-homepage.png"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20)),
            )),
        Column(
          children: [
            Text("Olá, bem vindo(a)"),
            Text("ao FaxinaJá"),
          ],
        ),
      ],
    );
  }

  Widget getLoginSquare() {
    var size = MediaQuery.of(context).size;
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
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
                //USAR FONTE LALEZAR
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
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
                hintText: 'Senha',
                border: OutlineInputBorder(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(20.0))),
              ),
              validator: validatePass,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: validate,
              child: Text("Login"),
            ),
            Row(
              children: [
                InkWell(
                  child: Text("Registre-se "),
                  onTap: () {
                    print("Registre-se");
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
