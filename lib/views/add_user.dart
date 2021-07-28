import 'dart:async';

import 'package:centauros_app/blocs/user_bloc.dart';
import 'package:centauros_app/di/injector.dart';

import 'package:centauros_app/views/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

import 'base_state.dart';

class AddUser extends StatefulWidget {
  AddUser({Key? key}) : super(key: key);

  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends BaseState<AddUser, UserBloc> {
  List<String> typeDocument = [
    '',
    'CC',
    'CE',
    'PP',
  ];

  DateTime selectedDate = DateTime.now();
  String dropdownValue = '';
  int indexList = 0;

  late TextEditingController identificationClient = new TextEditingController();
  late TextEditingController typeIdentification = new TextEditingController();
  late TextEditingController nameClient = new TextEditingController();
  late TextEditingController lastNameClient = new TextEditingController();
  late TextEditingController birthdayDate = new TextEditingController();
  late TextEditingController addressClient = new TextEditingController();
  late TextEditingController phoneNumberClient = new TextEditingController();
  late TextEditingController profession = new TextEditingController();
  late TextEditingController salary = new TextEditingController();
  late TextEditingController expenses = new TextEditingController();
  late TextEditingController typeContract = new TextEditingController();
  late TextEditingController email = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
            child: Column(children: [
      TextFormFielWidget(
        controller: identificationClient,
        error: "",
        icon: Icons.perm_identity,
        labelText: 'Cedula *',
        onChanged: (value) {
          setState(() {
            bloc!.userSingleton!.identificationClient = value;
          });
        },
      ),
      Card(
          child: Row(
        children: [
          Text("Tipo de documento"),
          Padding(
            padding: const EdgeInsets.only(left: 38.0),
            child: DropdownButton<String>(
              value: dropdownValue,
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                  bloc!.userSingleton!.typeIdentification = newValue;
                });
              },
              items: typeDocument.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          )
        ],
      )),
      TextFormFielWidget(
        controller: nameClient,
        error: "",
        icon: Icons.perm_identity,
        labelText: 'Nombre *',
        onChanged: (value) {
          setState(() {
            bloc!.userSingleton!.nameClient = value;
          });
        },
      ),
      TextFormFielWidget(
        controller: lastNameClient,
        error: "",
        icon: Icons.perm_identity,
        labelText: 'Apellido *',
        onChanged: (value) {
          setState(() {
            bloc!.userSingleton!.lastNameClient = value;
          });
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Fecha de nacimeinto *"),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.vertical(),
            ),
            child: Text(
              "${selectedDate.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
              icon: const Icon(Icons.date_range),
              onPressed: () => _selectDate(context)),
          SizedBox(
            height: 5,
          ),
        ],
      ),
      TextFormFielWidget(
        controller: addressClient,
        error: "",
        icon: Icons.near_me_sharp,
        labelText: 'Direccion *',
        onChanged: (value) {
          setState(() {
            bloc!.userSingleton!.addressClient = value;
          });
        },
      ),
      TextFormFielWidget(
        controller: phoneNumberClient,
        error: "",
        icon: Icons.phone,
        labelText: 'Telefono *',
        onChanged: (value) {
          setState(() {
            bloc!.userSingleton!.phoneNumberClient = value;
          });
        },
      ),
      TextFormFielWidget(
        controller: email,
        error: "",
        icon: Icons.email,
        labelText: 'Email *',
        onChanged: (value) {
          setState(() {
            bloc!.userSingleton!.email = value;
          });
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text("Fecha de ingreso *"),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.vertical(),
            ),
            child: Text(
              "${selectedDate.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          IconButton(
              icon: const Icon(Icons.date_range),
              onPressed: () => _selectDate(context)),
          SizedBox(
            height: 5,
          ),
        ],
      ),
       TextFormFielWidget(
        controller: profession,
        error: "",
        icon: Icons.list_alt,
        labelText: 'Profesion *',
        onChanged: (value) {
          setState(() {
            bloc!.userSingleton!.profession = value;
          });
        },
      ),
      TextFormFielWidget(
        controller: expenses,
        error: "",
        icon: Icons.list_alt,
        labelText: 'Antiguedad en la empresa*',
        onChanged: (value) {
          setState(() {
            bloc!.userSingleton!.expenses = double.parse(value);
          });
        },
      ),
      TextFormFielWidget(
        controller: typeContract,
        error: "",
        icon: Icons.list_alt,
        labelText: 'Tipo de contrado *',
        onChanged: (value) {
          setState(() {
            bloc!.userSingleton!.typeContract = value;
          });
        },
      ),
      TextFormFielWidget(
        controller: salary,
        error: "",
        icon: Icons.money,
        labelText: 'Salario *',
        onChanged: (value) {
          setState(() {
            bloc!.userSingleton!.salary = int.parse(value);
          });
        },
      ),
    ])));
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  UserBloc getBlocInstance() {
    return UserBloc(
      Injector().providePurchaseOrderUseCase(),
    );
  }
}
