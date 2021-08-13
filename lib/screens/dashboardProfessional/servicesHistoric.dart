import 'package:flutter/material.dart';

import './professionalProfile/professionalProfile.dart';

class ServicesHistoricPage extends StatefulWidget {
  const ServicesHistoricPage({Key? key}) : super(key: key);

  @override
  _ServicesHistoricPageState createState() => _ServicesHistoricPageState();
}

class _ServicesHistoricPageState extends State<ServicesHistoricPage> {
  int currentTab = 0;
  final List<Widget> screens = [
    ServicesHistoricPage(),
    ProfessionalProfilePage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = ServicesHistoricPage();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        centerTitle: true,
        backgroundColor: Color.fromRGBO(55, 10, 91, 01),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "FaxinaJá",
              style: TextStyle(
                  fontSize: 28, color: Colors.white, fontFamily: 'Lalezar'),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color.fromRGBO(237, 205, 248, 100),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
            child: Container(
                width: size.width,
                height: size.height * 0.7,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(55, 10, 91, 30),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: ListView(
                    children: [
                      Padding(padding: const EdgeInsets.only(top: 10)),
                      Text(
                        "Histórico de Serviços ",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Lalezar",
                            fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                      buildListTile(
                        image: AssetImage("assets/mariamadalena.png"),
                      ),
                      buildListTile(
                        image: AssetImage("assets/mariamadalena.png"),
                      ),
                      buildListTile(
                        image: AssetImage("assets/mariamadalena.png"),
                      ),
                      buildListTile(
                        image: AssetImage("assets/mariamadalena.png"),
                      ),
                      buildListTile(
                        image: AssetImage("assets/mariamadalena.png"),
                      ),
                      buildListTile(
                        image: AssetImage("assets/mariamadalena.png"),
                      ),
                    ],
                  ),
                )
                // ],
                // ),
                ),
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 70.0,
        width: 70.0,
        child: FloatingActionButton(
          child: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
          backgroundColor: Color.fromRGBO(55, 10, 91, 1),
          elevation: 20,
          isExtended: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: BorderSide(color: Colors.white, width: 1)),
          onPressed: () {
            setState(() {});
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(55, 10, 91, 01),
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          color: Colors.transparent,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: 150,
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfessionalProfilePage()),
                        );
                        currentScreen = ProfessionalProfilePage();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    minWidth: 150,
                    onPressed: () {
                      setState(() {
                        currentScreen = ServicesHistoricPage();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.history,
                          color: Colors.white,
                        ),
                        Text(
                          "Meus Serviços",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildListTile({required ImageProvider image}) {
  return Container(
    margin: EdgeInsets.all(7),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Color.fromRGBO(252, 255, 240, 1),
    ),
    child: ListTile(
      //dense: true,
      isThreeLine: true,
      selectedTileColor: Colors.white,

      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Limpeza Residencial",
                style: TextStyle(
                  fontFamily: 'Lalezar',
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Cliente: ",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "Ana Claudia",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Endereço: ",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "Rua Fagundes Teixeira, 26",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Serviço: ",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "Limpeza área interna da residência",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Valor recebido: ",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "R\$ 150,00",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Data da realização: ",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "02/02/2021",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Data do pagamento: ",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  "12/02/2021",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
