import 'package:flutter/material.dart';

import 'ExtraWidget.dart';

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

  List formaPagamento = ["Cartão 1", "Dinheiro", "Pix", "Mais um"];

  DateTime _dateTime = DateTime.now();

  bool geladeira = false;
  bool compras = false;
  bool cortinas = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    String tipoServicoEscolhido = tipoServico[0];
    String formaPagamentoEscolhido = formaPagamento[0];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(55, 10, 91, 01),
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
                padding: const EdgeInsets.only(top: 40, bottom: 20),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 50, bottom: 20),
                      child: Column(
                        children: [
                          Align(
                            child: Text(
                              "Tipo do serviço :",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          Align(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 0, right: 50, top: 10),
                              child: Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1, color: Colors.purple),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: DropdownButtonHideUnderline(
                                        child: ButtonTheme(
                                          alignedDropdown: true,
                                          child: DropdownButton(
                                            hint: Text("Tipo de serviço"),
                                            dropdownColor: Colors.white,
                                            icon: Icon(Icons.arrow_drop_down),
                                            value: tipoServico[0],
                                            onChanged: (newValue) {
                                              setState(() {
                                                tipoServicoEscolhido =
                                                    newValue.toString();
                                              });
                                            },
                                            items: tipoServico.map((valueItem) {
                                              return DropdownMenuItem(
                                                value: valueItem,
                                                child: Text(valueItem),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: Column(
                        children: [
                          Align(
                            child: Text(
                              "Forma de pagamento :",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          Align(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 0, right: 50, top: 10),
                              child: Container(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        width: 1, color: Colors.purple),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: DropdownButtonHideUnderline(
                                        child: ButtonTheme(
                                          alignedDropdown: true,
                                          child: DropdownButton(
                                            hint: Text("Forma de pagamento"),
                                            dropdownColor: Colors.white,
                                            icon: Icon(Icons.arrow_drop_down),
                                            value: formaPagamento[0],
                                            onChanged: (newValue) {
                                              setState(() {
                                                formaPagamentoEscolhido =
                                                    newValue.toString();
                                              });
                                            },
                                            items:
                                                formaPagamento.map((valueItem) {
                                              return DropdownMenuItem(
                                                value: valueItem,
                                                child: Text(valueItem),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25, bottom: 20),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          fixedSize:
                              MaterialStateProperty.all(Size.fromWidth(200)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: Colors.transparent),
                          )),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(167, 34, 162, 100)),
                        ),
                        onPressed: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2022),
                          ).then((date) => {
                                setState(() {
                                  _dateTime = date!;
                                })
                              });
                        },
                        child: Text(
                          "Agende uma data",
                          style: TextStyle(
                              fontFamily: "Lalezar",
                              color: Colors.white,
                              fontSize: 18),
                        ),
                      ),
                    ),
                    Text(
                      'Serviços extras',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ExtraWidget(
                            img: "fridge",
                            name: "Geladeira",
                            isSelected: geladeira),
                        ExtraWidget(
                            img: "organise",
                            name: "Compras",
                            isSelected: compras),
                        ExtraWidget(
                            img: "blind",
                            name: "Cortinas",
                            isSelected: cortinas),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 25, bottom: 20),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          fixedSize:
                              MaterialStateProperty.all(Size.fromWidth(200)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: Colors.transparent),
                          )),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(167, 34, 162, 100)),
                        ),
                        onPressed: () {
                          //Enviar o pedido
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Realizar o pedido",
                          style: TextStyle(
                              fontFamily: "Lalezar",
                              color: Colors.white,
                              fontSize: 18),
                        ),
                      ),
                    )
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