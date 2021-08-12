import 'package:flutter/material.dart';

class ServicesHistoricPage extends StatefulWidget {
  const ServicesHistoricPage({Key? key}) : super(key: key);

  @override
  _ServicesHistoricPageState createState() => _ServicesHistoricPageState();
}

class _ServicesHistoricPageState extends State<ServicesHistoricPage> {
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
              "FaxinaJa",
              style: TextStyle(
                  fontSize: 23, color: Colors.white, fontFamily: 'Lalezar'),
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
                  color: Color.fromRGBO(97, 46, 109, 15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  margin: EdgeInsets.all(3),
                  child: ListView(
                    children: [
                      Padding(padding: const EdgeInsets.only(top: 20)),
                      Text(
                        "Historico de Servicos ",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Lalezar",
                            fontSize: 20),
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
    );
  }
}

Widget buildListTile({required ImageProvider image}) {
  final double avatarSize = 50;
  return Container(
    margin: EdgeInsets.all(7),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.white,
    ),
    child: ListTile(
      //dense: true,
      isThreeLine: true,
      selectedTileColor: Colors.white,
      leading: Container(
        width: avatarSize,
        height: avatarSize,
        child: CircleAvatar(
          minRadius: 12,
          maxRadius: 40,
          backgroundImage: image,
        ),
      ),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Maria Madalena",
                style: TextStyle(
                  fontFamily: 'Lalezar',
                  fontSize: 20,
                ),
              ),
              Row(children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(
                  "4,8",
                  style: TextStyle(
                    fontFamily: 'Lalezar',
                    fontSize: 18,
                  ),
                ),
              ]),
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
                    "Valor: ",
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
          ],
        ),
      ),
    ),
  );
}
