import 'package:faxina_ja_app/models/LoginToken.dart';
import 'package:flutter/material.dart';

import 'screens/HistoricPage.dart';
import 'screens/order/OrderPage.dart';
import 'screens/profile/ProfilePage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.token}) : super(key: key);
  final LoginToken token;
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;


  final PageStorageBucket bucket = PageStorageBucket();
  late Widget currentScreen;

@override
  void initState() {
    currentScreen = HistoricPage(token: widget.token,);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: Container(
        height: 70.0,
        width: 70.0,
        child: FloatingActionButton(
          child: Icon(
            Icons.cleaning_services,
            size: 30,
            color: Colors.white,
          ),
          backgroundColor: Color.fromRGBO(97, 46, 150, 1),
          elevation: 20,
          isExtended: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: BorderSide(color: Colors.black, width: 2)),
          onPressed: () {
            setState(() {
              currentScreen = OrderPage(token: widget.token,);
              currentTab = 2;
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(55, 10, 91, 30),
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          color: Colors.transparent,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = HistoricPage(token: widget.token,);
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.history,
                          color: Colors.white,
                        ),
                        Text(
                          "Meus Pedidos",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = ProfilePage(token: widget.token,);
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        Text(
                          "Perfil",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }


}
