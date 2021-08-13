import 'package:faxina_ja_app/screens/main/screens/profile/components/ProfileMenu.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        backgroundColor: Color.fromRGBO(55, 10, 91, 01),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromRGBO(237, 205, 248, 100),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              buildProfilePic(),
              SizedBox(height: 20),
              ProfileMenu(
                text: "Meu Perfil",
                press: () => {
                  print("MyProfile"),
                  Navigator.pushNamed(context, "MyProfile")
                },
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              ProfileMenu(
                text: "Notificações",
                press: () => {},
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
              ),
              ProfileMenu(
                text: "Sair",
                press: () => {print("PopUntil"), Navigator.pop(context)},
                icon: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildProfilePic() {
  return SizedBox(
    height: 115,
    width: 115,
    child: Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/mariamadalena.png"),
          radius: 50,
        ),
        Positioned(
          right: -16,
          bottom: 0,
          child: SizedBox(
            height: 46,
            width: 46,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(color: Colors.white),
              ),
              color: Color(0xFFF5F6F9),
              onPressed: () {},
              child: Icon(Icons.camera_alt_rounded),
            ),
          ),
        )
      ],
    ),
  );
}
