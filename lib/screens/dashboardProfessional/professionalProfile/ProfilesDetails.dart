import 'package:faxina_ja_app/models/User.dart';
import 'package:faxina_ja_app/models/UserInfo.dart';
import 'package:faxina_ja_app/services/ProfileService.dart';
import 'package:faxina_ja_app/services/UserService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './components/ProfilePic.dart';

class ProfilesDetails extends StatefulWidget {
  const ProfilesDetails({Key? key, required this.token}) : super(key: key);
  final String token;
  @override
  _ProfilesDetailsState createState() => _ProfilesDetailsState();
}

class _ProfilesDetailsState extends State<ProfilesDetails> {
  bool isObscurePassword = true;

  TextEditingController nomeCompletoController       = TextEditingController();
  TextEditingController emailController              = TextEditingController();
  TextEditingController documentoController          = TextEditingController();
  TextEditingController enderecoController           = TextEditingController();
  TextEditingController enderecoNumeroController     = TextEditingController();
  TextEditingController cidadeController             = TextEditingController();
  TextEditingController estadoController             = TextEditingController();
  TextEditingController CEPController                = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Perfil do Profissional",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromRGBO(55, 10, 91, 01),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        //height: MediaQuery.of(context).size.height,
        color: Color.fromRGBO(237, 205, 248, 100),
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: FutureBuilder<UserInfo>(
          future: ProfileService().findUser(widget.token),
          builder: (context,snapshot){
            if (snapshot.connectionState == ConnectionState.done) {
              nomeCompletoController.text = snapshot.data!.name;
              emailController.text = snapshot.data!.email;
              documentoController.text = snapshot.data!.document;
              enderecoController.text = snapshot.data!.address.street;
              enderecoNumeroController.text = snapshot.data!.address.number.toString();
              cidadeController.text = snapshot.data!.address.city;
              estadoController.text = snapshot.data!.address.state;
              CEPController.text = snapshot.data!.address.zipCode;
              return buildSingle(snapshot.data!);
            }
            else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildSingle(UserInfo userInfo){
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(
            height: 30,
          ),
          buildTextField("Nome Completo",userInfo.name , nomeCompletoController),
          buildTextField("Email",        userInfo.email, emailController),
          buildTextField("Documento",    userInfo.document, documentoController),
          buildTextField("Endereço",     userInfo.address.street, enderecoController),
          buildTextField("Numero",      userInfo.address.number.toString(), enderecoNumeroController),
          buildTextField("Cidade",       userInfo.address.city, cidadeController),
          buildTextField("Estado",       userInfo.address.state, estadoController),
          buildTextField("CEP",          userInfo.address.zipCode, CEPController),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("CANCELAR",
                    style: TextStyle(
                        fontSize: 13,
                        letterSpacing: 2,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(59, 12, 79, 100),
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              ElevatedButton(
                onPressed: () {
                  User user = User(name: nomeCompletoController.text,
                      document: documentoController.text,
                      email: emailController.text,
                      password: "",
                      userType: "p",
                      address: new Address(street: enderecoController.text,
                          number: int.parse(enderecoNumeroController.text),
                          city: cidadeController.text,
                          state: estadoController.text,
                          zipCode: CEPController.text,
                          region: "",
                          country: ''));
                  UserService().updateUser(widget.token, user);
                  Navigator.pop(context);
                },
                child: Text(
                  "SALVAR",
                  style: TextStyle(
                      fontSize: 13, letterSpacing: 2, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(59, 12, 79, 10),
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeHolder, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeHolder,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
