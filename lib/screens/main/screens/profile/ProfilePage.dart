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
        backgroundColor: Color.fromRGBO(237, 205, 248, 100),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
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
              icon: Icon(Icons.person),
            ),
            ProfileMenu(
              text: "Notificações",
              press: () => {},
              icon: Icon(Icons.notifications),
            ),
            ProfileMenu(
              text: "Sair",
              press: () => {print("PopUntil"), Navigator.pop(context)},
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildProfileMenu(String text, String icon, VoidCallback press) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: FlatButton(
      padding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Color(0xFFF5F6F9),
      onPressed: press,
      child: Row(
        children: [
          Image.asset("assets/mariamadalena.png"),
          SizedBox(width: 20),
          Expanded(child: Text(text)),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    ),
  );
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
