import 'package:faxina_ja_app/models/LoginToken.dart';
import 'package:faxina_ja_app/models/UserInfo.dart';
import 'package:faxina_ja_app/services/ProfileService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/ProfilePic.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key,  required this.token}) : super(key: key);

  final String token;
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isObscurePassword = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Meu Perfil",
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
          child: FutureBuilder<UserInfo>(
            future: new ProfileService().findUser(widget.token),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return buildScreen(snapshot.data, context);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )

              //buildScreen()
        ),
      ),
    );
  }

  Widget buildScreen(UserInfo? userInfo, BuildContext context){
  return Column(
    children: [
      ProfilePic(),
      SizedBox(
        height: 30,
      ),
      buildTextField("Nome Completo",userInfo!.name , false),
      buildTextField("Senha", userInfo.password, true),
      buildTextField("Email", userInfo.email, false),
      buildTextField("Documento", userInfo.document, false),
      //buildTextField("Data Nascimento", "__/__/__", false),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "CANCELAR",
              style: TextStyle(
                  fontSize: 13, letterSpacing: 2, color: Colors.black),
            ),
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
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

}
