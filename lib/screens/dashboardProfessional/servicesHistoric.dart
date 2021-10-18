import 'package:faxina_ja_app/models/LoginToken.dart';
import 'package:faxina_ja_app/screens/dashboardProfessional/historic/PrestadorServiceHistoric.dart';
import 'package:faxina_ja_app/screens/dashboardProfessional/searchDemand/searchDemand.dart';
import 'package:flutter/material.dart';

import './professionalProfile/professionalProfile.dart';

class ServicesHistoricPage extends StatefulWidget {
  const ServicesHistoricPage({Key? key, required this.token}) : super(key: key);
  final String token;
  @override
  _ServicesHistoricPageState createState() => _ServicesHistoricPageState();
}

class _ServicesHistoricPageState extends State<ServicesHistoricPage> {
  int currentTab = 0;


  final PageStorageBucket bucket = PageStorageBucket();
  late Widget currentScreen ;

  @override
  void initState() {
    currentScreen = PrestadorServiceHistoric(token: widget.token,);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),//buildServiceHistoric(context),
      floatingActionButton: Container(
        height: 70.0,
        width: 70.0,
        child: FloatingActionButton(
          child: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
          backgroundColor: Color.fromRGBO(97, 46, 150, 1),
          elevation: 20,
          isExtended: true,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: BorderSide(color: Colors.white, width: 2)),
          onPressed: () {
            setState(() {
              currentScreen = SearchDemandPage(token: widget.token,);
              currentTab = 2;
            });
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              MaterialButton(
                minWidth: 150,
                onPressed: () {
                  setState(() {
                    currentScreen = PrestadorServiceHistoric(token: widget.token,);
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
              MaterialButton(
                minWidth: 150,
                onPressed: () {
                  setState(() {
                    print("Perfil selecionado");
                    currentScreen = ProfessionalProfilePage(token: widget.token,);
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
        ),
      ),
    );
  }
}
