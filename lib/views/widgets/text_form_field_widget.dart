import 'package:flutter/material.dart';


class TextFormFielWidget extends StatelessWidget {
  @required
  final String? error;
  @required
  final String? labelText;
  @required
  final TextEditingController? controller;
  @required
  final ValueChanged<String>? onChanged;
  @required
  final IconData? icon;
  @required
  final Widget? suffix;

  const TextFormFielWidget(
      {Key? key,
      this.error,
      this.labelText,
      this.controller,
      this.onChanged,
      this.icon, this.suffix});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            controller: controller,
            decoration: InputDecoration(
            suffix: suffix,
              labelText: labelText,
              prefixIcon: Icon(icon),
            ),
            onChanged: onChanged,
          ),
          Row(
            children: [
              Text(error!,
                  style: TextStyle(color: Colors.redAccent, fontSize: 15)),
            ],
          ),
        ],
      ),
    );
  }
}
