import 'package:flutter/material.dart';

import 'drawer_page.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/homePage';

  @override
  _HomePageState createState() => _HomePageState();
}

const color = const Color(0xFFB59CBE8);

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Centauros Bank"),
        ),
        drawer: NavigationDrawer(),
        body: Container(
            child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(58.0),
              child: Card(
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      color: color,
                      child: Column(
                        children: [
                          Text("Saldo"),
                          Text("Todo monto"),
                          Text("Rendimiento"),
                          Text("0,05% E.A help"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Column(
                          children: [
                            Text("Conoce detalles de tasas y tarifas"),
                            Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 30.0,
                                ),
                                Expanded(
                                                                  child: Text(
                                      "Los intereses se liquidarán y abonarán diariamente. El abono se verá reflejado cuando realices un retiro o \n consignación a la cuenta o al finalizar el mes (si durante el mismo no hiciste ningún movimiento)."),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 30.0,
                                ),
                                Expanded(
                                                                  child: Text(
                                      "La retención en la fuente sobre los intereses generados en la cuenta es del 7%."),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: Colors.green,
                                  size: 30.0,
                                ),
                                Expanded(
                                  child: Text(
                                      "Si lo solicitas, marcaremos tu cuenta de ahorro como exenta de gravamen de movimiento financiero\n (Impuesto Gobierno 4x1000), siempre y cuando no tengas otra cuenta marcada en el sistema financiero. Conoce en el siguiente enlace el gravamen a los movimientos financieros. p"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
