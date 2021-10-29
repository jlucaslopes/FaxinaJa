import 'package:faxina_ja_app/models/OrderResponse.dart';
import 'package:faxina_ja_app/services/OrderService.dart';
import 'package:flutter/material.dart';

class SearchDemandPage extends StatefulWidget {
  const SearchDemandPage({Key? key, required this.token}) : super(key: key);
  final String token;
  @override
  _SearchDemandPageState createState() => _SearchDemandPageState();
}

class _SearchDemandPageState extends State<SearchDemandPage> {


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    print("building entire screen");
    return Scaffold(
      appBar: AppBar(
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
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height,
            color: Color.fromRGBO(237, 205, 248, 100),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
                width: size.width,
                height: size.height * 0.95,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(55, 10, 91, 30),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: FutureBuilder<List<OrderResponse>>(
                    future: OrderService().findOpenOrders(widget.token),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        print(snapshot.data.toString());
                        if (snapshot.hasError) {
                          print(snapshot.error);
                          return Text("Nao foi possivel trazer os resultados");
                        }
                        print("building ListView");
                        return listView(snapshot.data!);
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                )
              // ],
              // ),
            ),
          ),
        ],
      ),);
  }


  Widget listView(List<OrderResponse> orders) {
    return ListView.builder(
        itemCount: orders.length,
        itemBuilder: (BuildContext ctx, int index) {
          return buildListTile(orders[index]);
        });
  }

  Widget buildListTile(OrderResponse order) {
    DateTime serviceDate = DateTime.parse(order.serviceDate);
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
        trailing: Container(
          child: IconButton(icon: Icon(Icons.person_add_rounded, size: 35,),
            onPressed: () {
              setState(() {
                OrderService().assignDemandToProfessional(
                    widget.token, order.id);
              });
            },),
        ),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  enumToString(order.serviceType),
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
                      "Endereço: ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    order.address.street + ", " +
                        order.address.number.toString(),
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
                      "Valor a ser pago: ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text("R\$ " + order.serviceValue.toDouble().toString(),
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
                      "Data agendada: ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(serviceDate.day.toString()+"/"
                      +serviceDate.month.toString(),
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

  String enumToString(String serviceType) {
    switch (serviceType) {
      case "limpezaGeral":
        return "Faxina completa";
      case "limpezaSimples":
        return "Faxina parcial";
      case "limpezaPequena":
        return "Faxina pequena";
      case "areaExterna":
        return "Apenas Area Externa";
      default:
        return serviceType;
    }
  }
}