import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List tipoServico = [
    "Faxina completa",
    "Faxina parcial",
    "Faxina pequena",
    "Apenas Area Externa"
  ];

  late String valueChoose = "Faxina completa";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Widget dropDownButton(List items, String valorEscolhido) {
      return DropdownButton(
        hint: Text("Tipo de serviço"),
        dropdownColor: Colors.grey,
        icon: Icon(Icons.arrow_drop_down),
        value: valueChoose,
        onChanged: (newValue) {
          setState(() {
            valueChoose = newValue.toString();
          });
        },
        items: items.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        }).toList(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(55, 10, 91, 100),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Faça o seu",
              style: TextStyle(
                  fontSize: 20, color: Colors.white, fontFamily: 'Lalezar'),
            ),
            Text(
              "Pedido",
              style: TextStyle(
                  fontSize: 23, color: Colors.white, fontFamily: 'Lalezar'),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          color: Color.fromRGBO(237, 205, 248, 25),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Solicite um novo ",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontFamily: 'Lalezar'),
                    ),
                    Text(
                      "Serviço",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontFamily: 'Lalezar'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  children: [
                    Text(
                      "Tipo do serviço :",
                      style: TextStyle(color: Colors.black, ),
                    ),
                    dropDownButton(tipoServico, "Faxina completa"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
