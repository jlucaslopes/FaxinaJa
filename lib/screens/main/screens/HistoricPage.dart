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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color.fromRGBO(237, 205, 248, 100),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 60),
              child: Container(
                width: size.width - 30,
                height: size.height * 0.80,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(97, 46, 109, 100),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Veja o seu ",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'Lalezar'),
                          ),
                          Text(
                            "Histórico",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontFamily: 'Lalezar'),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: ListView(
                        children: [
                          ListTile(
                            title: Text("Teste"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
