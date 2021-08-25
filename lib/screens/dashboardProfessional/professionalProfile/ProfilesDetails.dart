import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './components/ProfilePic.dart';

class ProfilesDetails extends StatefulWidget {
  const ProfilesDetails({Key? key}) : super(key: key);

  @override
  _ProfilesDetailsState createState() => _ProfilesDetailsState();
}

class _ProfilesDetailsState extends State<ProfilesDetails> {
  bool isObscurePassword = true;

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
        height: MediaQuery.of(context).size.height,
        color: Color.fromRGBO(237, 205, 248, 100),
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfilePic(),
              SizedBox(
                height: 30,
              ),
              buildTextField("Nome:", "Maria Madalena", false),
              buildTextField("Profissão:", "Faxineira", false),
              buildTextField(
                  "Telefone Comercial/Celular:", "+55(011) 92834-1827", false),
              buildTextField("Endereço:", "Rua Augusto Roberto, 291", false),
              buildTextField("Bairro:", "Jardim Doce", false),
              buildTextField("Cidade:", "São Paulo", false),
              buildTextField("Estado:", "SP", false),
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
                    onPressed: () {},
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
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeHolder, bool isPasswordTextField) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscurePassword = !isObscurePassword;
                    });
                  },
                  icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeHolder,
          hintStyle: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
    );
  }
}