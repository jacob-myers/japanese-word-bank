import 'package:flutter/material.dart';
import 'package:japanese_word_bank/themes.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(

                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: JWBColors.txtEntryBG
                ),
                padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                child: TextField(
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  maxLines: 1,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: JWBColors.txtEntryUnfocused, width: 2),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: JWBColors.txtEntryFocused, width: 2),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: JWBColors.txtEntryFocused, width: 2),
                    ),
                    hintStyle: TextStyle(
                      color: JWBColors.txtEntryUnfocused
                    ),
                    hintText: "English or Romaji..."
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}