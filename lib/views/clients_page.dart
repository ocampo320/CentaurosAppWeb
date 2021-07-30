import 'package:centauros_app/blocs/user_bloc.dart';
import 'package:centauros_app/di/injector.dart';
import 'package:centauros_app/views/base_state.dart';
import 'package:centauros_app/views/widgets/shimmer_widget.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:models/user.dart';
import 'add_user.dart';
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
    _controller = ScrollController();
    _controller!.addListener(_scrollListener);
    setState(() {
      // bloc!.getUser();
      loadData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  _scrollListener() {
    setState(() {
      bloc!.getUser().then((value) {});
      loadData();
    });
  }

  Future loadData() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 2));
    CircularProgressIndicator();
    bloc!.getUser();
    setState(() {
      isLoading = false;
    });
  }

  bool isLoading = false;
  var trasform;
  ScrollController? _controller;

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
                onPressed: () {
                  _showMyDialog();
                },
                child: const Text(
                  'Add client',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(68.0),
              child: StreamBuilder<List<User>>(
                  stream: bloc!.listUserData,
                  builder: (context, snapshot) {
                    return (snapshot.data == null)
                        ? Center(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10, left: 70, right: 70),
                                child: StreamBuilder<List<User>>(
                                    stream: bloc!.listUserData,
                                    builder: (context, snapshot) {
                                      return (snapshot.data == null)
                                          ? Center(
                                              child: ListTile(
                                                leading: CustomWidget.circular(
                                                    height: 64, width: 64),
                                                title: Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child:
                                                      CustomWidget.rectangular(
                                                    height: 16,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                  ),
                                                ),
                                                subtitle:
                                                    CustomWidget.rectangular(
                                                        height: 14),
                                              ),
                                            )
                                          : ExpansionTileCard(
                                              baseColor: Colors.amberAccent,
                                              borderRadius:
                                                  BorderRadius.circular(40),
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
                                                      style: TextStyle(
                                                          fontSize: 25),
                                                    ),
                                                    subtitle: Column(
                                                      children: [
                                                        Text(
                                                          'Nombre: ${snapshot.data![index].nameClient} ${snapshot.data![index].lastNameClient}',
                                                          style: TextStyle(
                                                              fontSize: 25),
                                                        ),
                                                        Text(
                                                          'Edad: ${snapshot.data![index].birthdayDate}',
                                                          style: TextStyle(
                                                              fontSize: 25),
                                                        ),
                                                        Text(
                                                          'Numero de telefono: ${snapshot.data![index].phoneNumberClient}',
                                                          style: TextStyle(
                                                              fontSize: 25),
                                                        ),
                                                        Text(
                                                          'Correo electronico: ${snapshot.data![index].email}',
                                                          style: TextStyle(
                                                              fontSize: 25),
                                                        ),
                                                        Text(
                                                          'Direccion de residencia: ${snapshot.data![index].addressClient}',
                                                          style: TextStyle(
                                                              fontSize: 25),
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
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            horizontal: 16.0,
                                                            vertical: 8.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  ButtonBar(
                                                    alignment: MainAxisAlignment
                                                        .spaceBetween,
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
                                                                bloc!
                                                                    .getUserByCc(snapshot
                                                                        .data![
                                                                            index]
                                                                        .identificationClient
                                                                        .toString())
                                                                    .then(
                                                                        (value) {
                                                                  _showMyDialogDataUser(
                                                                      value
                                                                          .data!);
                                                                });
                                                              },
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: <
                                                                    Widget>[
                                                                  Row(
                                                                    children: [
                                                                      Icon(Icons
                                                                          .arrow_downward),
                                                                      Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(vertical: 2.0),
                                                                      ),
                                                                      Text(
                                                                        'Ver',
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                25),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      StreamBuilder<List<User>>(
                                                          stream: bloc!
                                                              .listUserData,
                                                          builder: (context,
                                                              snapshot) {
                                                            return (snapshot
                                                                        .data ==
                                                                    null)
                                                                ? Center(
                                                                    child:
                                                                        CircularProgressIndicator(),
                                                                  )
                                                                : TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      _showialogDelete(snapshot
                                                                          .data![
                                                                              index]
                                                                          .identificationClient!);
                                                                    },
                                                                    child:
                                                                        Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: <
                                                                          Widget>[
                                                                        Row(
                                                                          children: [
                                                                            Icon(Icons.delete),
                                                                            Padding(
                                                                              padding: const EdgeInsets.symmetric(vertical: 2.0),
                                                                            ),
                                                                            Text(
                                                                              'Eliminar',
                                                                              style: TextStyle(fontSize: 25),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                          }),
                                                    ],
                                                  )
                                                ]);
                                    }),
                              );
                            },
                          );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(10),
          title: Text('Agregar cliente'),
          content: SingleChildScrollView(
            child: Container(
              width: 500,
              // height: 200,
              child: ListBody(
                children: <Widget>[
                  Form(
                      child: Column(
                    children: [AddUser()],
                  ))
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text('Agregar'),
                  onPressed: () {
                    setState(() async {
                      bloc!.mapToUser(bloc!.userSingleton);
                      await loadData();
                      Navigator.of(context).pop();
                    });
                  },
                ),
                TextButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<void> _showMyDialogDataUser(
    User user,
  ) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.all(10),
            title: Text(
                'Informacion de ${user.nameClient} ${user.lastNameClient}'),
            content: SingleChildScrollView(
              child: Container(
                width: 500,
                child: Center(
                  child: Stack(
                    children: [
                      StreamBuilder<User>(
                          stream: bloc!.userData,
                          builder: (context, snapshot) {
                            return (snapshot.data == null)
                                ? Card(
                                    child: Center(
                                      child: Container(
                                        child: buildMovieShimmer(),
                                      ),
                                    ),
                                  )
                                : Card(
                                    borderOnForeground: true,
                                    margin:
                                        EdgeInsets.only(top: 20.0, bottom: 0.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    color: Colors.cyan[50],
                                    child: FlipCard(
                                      direction: FlipDirection.HORIZONTAL,
                                      speed: 1000,
                                      onFlipDone: (status) {
                                        print(status);
                                      },
                                      front: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                        ),
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.start,
                                          children: <Widget>[
                                            ListTile(
                                              hoverColor:
                                                  Color.fromARGB(1, 1, 1, 1),
                                              dense: false,
                                              subtitle: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                      "Numero de docuemnto : ${user.identificationClient}"),
                                                  Text(
                                                      "Tipo de documento : ${user.typeIdentification}"),
                                                  Text(
                                                      "Antigedad en en la empresa: ${user.expenses} años"),
                                                  Text(
                                                      "Salario actual: ${user.salary} pesos"),
                                                  Text(
                                                      "Tipo de contrato: ${user.typeContract}"),
                                                ],
                                              ),
                                              leading: CircleAvatar(
                                                child:
                                                    Icon(Icons.device_unknown),
                                              ),
                                            ),
                                            Text('Mas informacion...',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1),
                                          ],
                                        ),
                                      ),
                                      back: Container(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            ListTile(
                                              hoverColor:
                                                  Color.fromARGB(1, 1, 1, 1),
                                              dense: false,
                                              subtitle: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text("Nombre de equipo: ")
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              leading: CircleAvatar(
                                                child:
                                                    Icon(Icons.device_unknown),
                                              ),
                                            ),
                                            Text('Mas informacion...',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                          }),
                    ],
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text('Salir'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          );
        });
  }

  Widget buildMovieShimmer() => Container(
        child: ListTile(
          leading: CustomWidget.circular(height: 64, width: 64),
          title: Align(
            alignment: Alignment.centerLeft,
            child: CustomWidget.rectangular(
              height: 16,
              width: MediaQuery.of(context).size.width * 0.3,
            ),
          ),
          subtitle: CustomWidget.rectangular(height: 14),
        ),
      );

  Future<void> _showialogDelete(String id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(10),
          title: Container(
              width: 500,
              // height: 200,
              child: Icon(
                Icons.error_outline,
                size: 70,
              )),
          content: SingleChildScrollView(
            child: Center(
                child: Text('Esta segur@ que desea eliminar el cliente!!!')),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text('Aceptar'),
                  onPressed: () {
                    setState(() async {
                      bloc!.deleteUser(id);
                      await loadData();
                      Navigator.of(context).pop();
                    });
                  },
                ),
                TextButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  UserBloc getBlocInstance() {
    return UserBloc(
      Injector().providePurchaseOrderUseCase(),
    );
  }
}
