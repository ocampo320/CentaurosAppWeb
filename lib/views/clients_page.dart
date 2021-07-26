import 'package:centauros_app/blocs/user_bloc.dart';
import 'package:centauros_app/di/injector.dart';
import 'package:centauros_app/views/base_state.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:models/user.dart';
import 'drawer_page.dart';

class ClientPage extends StatefulWidget {
  static const String routeName = '/clientPage';

  const ClientPage({
    Key? key,
  }) : super(key: key);

  @override
  _ClientPageState createState() => _ClientPageState();
}

class _ClientPageState extends BaseState<ClientPage, UserBloc> {
  @override
  void initState() {
    super.initState();
    setState(() {
       bloc!.getUser();
    });
   
  }

  List<Map<String, dynamic>> employes = [
    {"Name": "deivi", "Age": 25, "NumberPhone": "12345", "Active": true},
    {"Name": "carlos", "Age": 35, "NumberPhone": "147852", "Active": false},
    {"Name": "juan", "Age": 26, "NumberPhone": "25896", "Active": true},
    {"Name": "santigo", "Age": 28, "NumberPhone": "741258", "Active": false},
    {"Name": "pedro", "Age": 31, "NumberPhone": "147963", "Active": true},
    {"Name": "maria", "Age": 33, "NumberPhone": "789654", "Active": false},
  ];
  var trasform;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Clients",
          style: TextStyle(fontSize: 25),
        ),
      ),
      drawer: NavigationDrawer(),
      body: Container(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'Add client',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(68.0),
              child:  StreamBuilder<List<User>>(
                stream: bloc!.profile,
                builder: (context, snapshot) {
                   return (snapshot.data == null)
                                  ? Center(
                                      child: Center(
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                    )
                  : ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10, left: 70, right: 70),
                        child: StreamBuilder<List<User>>(
                            stream: bloc!.profile,
                            builder: (context, snapshot) {
                              return (snapshot.data == null)
                                  ? Center(
                                      child: Center(
                                        child: Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                    )
                                  : ExpansionTileCard(
                                      baseColor: Colors.amberAccent,
                                      borderRadius: BorderRadius.circular(40),
                                      shadowColor: Colors.red,
                                      animateTrailing: true,
                                      title: Column(
                                        children: [
                                          ListTile(
                                            leading: Icon(
                                              Icons.people_alt,
                                              size: 80.0,
                                              color: Colors.redAccent,
                                            ),
                                            title: Text(
                                              'Personal information: ',
                                              style: TextStyle(fontSize: 25),
                                            ),
                                            subtitle: Column(
                                              
                                              children: [
                                             
                                                Text(
                                                  'Nombre: ${snapshot.data![index].nameClient} ${snapshot.data![index].lastNameClient}',
                                                  style: TextStyle(fontSize: 25),
                                                ),
                                                Text(
                                                  'Edad: ${snapshot.data![index].birthdayDate}',
                                                  style: TextStyle(fontSize: 25),
                                                ),
                                                Text(
                                                  'Numero de telefono: ${snapshot.data![index].phoneNumberClient}',
                                                  style: TextStyle(fontSize: 25),
                                                ),
                                                Text(
                                                  'Active: ${employes[index]["Active"]}',
                                                  style: TextStyle(fontSize: 25),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      children: [
                                          Divider(
                                            thickness: 1.0,
                                            height: 1.0,
                                          ),
                                          Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                    horizontal: 16.0,
                                                    vertical: 8.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10, left: 10),
                                            child: ButtonBar(
                                              alignment:
                                                  MainAxisAlignment.spaceBetween,
                                              buttonHeight: 52.0,
                                              buttonMinWidth: 90.0,
                                              children: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    // showList();
                                                  },
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      TextButton(
                                                        onPressed: () {
                                                          //widget.onPressBtnopen();

                                                          //print('Este es el index ${widget.index}');
                                                          // ignore: unnecessary_statements
                                                        },
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: <Widget>[
                                                            Row(
                                                              children: [
                                                                Icon(Icons
                                                                    .arrow_downward),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .symmetric(
                                                                          vertical:
                                                                              2.0),
                                                                ),
                                                                Text(
                                                                  'Open',
                                                                  style: TextStyle(
                                                                      fontSize: 25),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    //  widget.onPressBtnDelete();
                                                  },
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Row(
                                                        children: [
                                                          Icon(Icons.delete),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    vertical: 2.0),
                                                          ),
                                                          Text(
                                                            'Eliminar',
                                                            style: TextStyle(
                                                                fontSize: 25),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ]);
                            }),
                      );
                    },
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  UserBloc getBlocInstance() {
    return UserBloc(
      Injector().providePurchaseOrderUseCase(),
    );
  }
}
