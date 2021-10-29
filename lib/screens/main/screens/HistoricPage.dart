import 'package:faxina_ja_app/models/LoginToken.dart';
import 'package:faxina_ja_app/models/OrderResponse.dart';
import 'package:faxina_ja_app/services/OrderService.dart';
import 'package:flutter/material.dart';

class HistoricPage extends StatefulWidget {
  const HistoricPage({Key? key, required this.token}) : super(key: key);
  final String token;
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
        backgroundColor: Color.fromRGBO(55, 10, 91, 01),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Veja os seus ",
              style: TextStyle(
                  fontSize: 20, color: Colors.white, fontFamily: 'Lalezar'),
            ),
            Text(
              "Pedidos",
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
            padding: const EdgeInsets.all(8),
            child: Container(
                width: size.width,
                height: size.height * 0.9,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(97, 46, 109, 15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(

                  child:FutureBuilder<List<OrderResponse>>(
                  future: OrderService().findMyOpenedDemands(widget.token),
                  builder: (context,snapshot){
                    if (snapshot.connectionState == ConnectionState.done) {
                      return buildListView(snapshot.data!);
                    }
                      else {
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
      ),
    );
  }

  Widget buildListView(List<OrderResponse> orders) {
    return ListView.builder(
        itemCount: orders.length ,
        itemBuilder: (BuildContext ctx, int index) {
          return buildListTilee(orders[index]);
        }
    );

  }

  Widget buildListTilee(OrderResponse orders) {
    DateTime serviceDate = DateTime.parse(orders.serviceDate);
    final double avatarSize = 50;
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: ListTile(
        //dense: true,
        isThreeLine: true,
        selectedTileColor: Colors.white,
        trailing: Container(
          child: orders.status.toUpperCase() == "AGENDADO" ?
          Column(
            children: [
              IconButton(icon: Icon(Icons.check, size: 40, color: Colors.lightGreen,),
                onPressed: () {
                  setState(() {
                    OrderService().finishDemand(widget.token, orders.id);
                  });
                  print("concluir" + orders.id);
                },),
            ],
          ) : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( orders.status.toUpperCase(),
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ), ),
            ],
          ),
        ),
        leading: Container(
          width: avatarSize,
          height: avatarSize,
          child: CircleAvatar(
            minRadius: 12,
            maxRadius: 40,
            backgroundImage: AssetImage("assets/mariamadalena.png"),
          ),
        ),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  orders.status.toUpperCase() == "ABERTO" ?  "Aguarde profissional...": orders.status.toUpperCase()  ,
                  style: TextStyle(
                    fontFamily: 'Lalezar',
                    fontSize: 18,
                  ),
                ),
                //     orders[index].status == "FINALIZADO" ?
                //     Row(children: [
                //       Icon(
                //         Icons.star,
                //         color: Colors.amber,
                //       ),
                //       Text(
                //         "4,8",
                //         style: TextStyle(
                //           fontFamily: 'Lalezar',
                //           fontSize: 18,
                //         ),
                //       ),
                //     ]):
                //     Text(
                //       orders[index].status.toUpperCase(),
                //       style: TextStyle(
                //         fontFamily: 'Lalezar',
                //         fontSize: 18,
                //       ),
                //     ),
              ],
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(bottom: 12),
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
                    enumToString(orders.serviceType) ,
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
                    "R\$ " + orders.serviceValue.toString() +",00",
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
            ],
          ),
        ),
      ),
    );
  }
  String enumToString(String serviceType) {

    switch (serviceType){
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



