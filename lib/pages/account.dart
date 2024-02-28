import 'package:flutter/material.dart';

Widget login() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(children: [
          Text("Mail"),
          TextField(
            controller: TextEditingController(),
            onSubmitted: (s) => {
              
            },
          ),
        ],),
      ],
    ),
  );
}