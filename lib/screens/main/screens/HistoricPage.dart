import 'package:flutter/material.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({Key? key}) : super(key: key);

  @override
  _HistoricPageState createState() => _HistoricPageState();
}

class _HistoricPageState extends State<HistoricPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(237, 205, 248, 100),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Veja o seu ",
              style: TextStyle(
                  fontSize: 20, color: Colors.white, fontFamily: 'Lalezar'),
            ),
            Text(
              "Histórico",
              style: TextStyle(
                  fontSize: 23, color: Colors.white, fontFamily: 'Lalezar'),
            )
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
            padding: const EdgeInsets.all(30),
            child: Container(
                width: size.width - 30,
                height: size.height * 0.70,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(97, 46, 109, 100),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  child: ListView(
                    children: [
                      ListTile(
                        //dense: true,
                        tileColor: Color.fromRGBO(253, 242, 232, 100),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
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
                                  Icon(Icons.star),
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
                            Align(
                              child: Text(
                                "Faxineira",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                              ),
                              alignment: Alignment.topLeft,
                            )
                          ],
                        ),
                        subtitle: Column(),
                        isThreeLine: true,
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
