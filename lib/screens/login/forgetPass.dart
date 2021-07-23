import 'package:flutter/material.dart';

class ForgetPassPage extends StatefulWidget {
  const ForgetPassPage({Key? key}) : super(key: key);

  @override
  _ForgetPassPageState createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final _form = GlobalKey<FormState>();

    Widget getForm() {
      return Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
        child: Form(
          key: _form,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 10, bottom: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "E-mail para recuperação :",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding:
                      new EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(55, 10, 91, 100)),
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
              )
            ],
          ),
        ),
      );
    }

    Widget sendEmailBox() {
      return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
            child: Container(
              width: size.width - 60,
              height: size.height * 0.23,
              decoration: BoxDecoration(
                color: Color.fromRGBO(140, 96, 129, 100),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          getForm()
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          color: Color.fromRGBO(55, 10, 91, 100),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  width: size.width - 60,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/forgetPass.png"),
                          fit: BoxFit.none),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Text(
                      "Que pena, voce se esqueceu da sua senha?",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 40, left: 40),
                      child: Text(
                        "Sem problemas, nos informe o seu e-mail para recuperá-la!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              sendEmailBox(),
            ],
          ),
        ),
      ),
    );
  }
}
