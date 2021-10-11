import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrestadorServiceHistoric extends StatefulWidget {
  const PrestadorServiceHistoric({ Key? key,required this.token}) : super(key: key);

  final String token;
  @override
  _PrestadorServiceHistoricState createState() => _PrestadorServiceHistoricState();
}

class _PrestadorServiceHistoricState extends State<PrestadorServiceHistoric> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar:AppBar(
      centerTitle: true,
      backgroundColor: Color.fromRGBO(55, 10, 91, 01),
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Veja os serviços ",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontFamily: 'Lalezar'),
          ),
          Text(
            "disponíveis",
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
                    buildListTile(),
                    buildListTile(),
                    buildListTile(),
                    buildListTile(),
                    buildListTile(),
                  ],
                ),
              )
            // ],
            // ),
          ),
        ),
      ],
    ),);
  }




  Widget buildListTile() {
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

}
