import 'package:flutter/material.dart';

import 'screens/HistoricPage.dart';
import 'screens/OrderPage.dart';
import 'screens/profile/ProfilePage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;
  final List<Widget> screens = [
    HistoricPage(),
    OrderPage(),
    ProfilePage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HistoricPage();

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
                currentScreen = OrderPage();
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
                          currentScreen = HistoricPage();
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
                //         Row(
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: [
                //             MaterialButton(
                //               minWidth: 40,
                //               onPressed: () {
                //                 setState(() {
                //                   currentScreen = OrderPage();
                //                   currentTab = 2;
                //                 });
                //               },
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Icon(
                //                     Icons.cleaning_services,
                //                     color: currentTab == 2 ? Colors.blue : Colors.grey,
                //                   ),
                //                   Text(
                //                     "Fáxina Ja",
                //                     style: TextStyle(
                //                       color:
                //                           currentTab == 2 ? Colors.blue : Colors.grey,
                //                     ),
                //                   )
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = ProfilePage();
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
        ));
  }
}
