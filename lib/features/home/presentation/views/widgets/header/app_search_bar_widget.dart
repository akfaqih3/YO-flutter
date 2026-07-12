import 'package:flutter/material.dart';

class AppSearchBarWidget extends StatelessWidget {
  const AppSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        strutStyle: StrutStyle(
          forceStrutHeight: true,
          height: 1.0,
          leading: 1.0,
          fontSize: 16,
        ),
        style: TextStyle(color: Colors.white, fontSize: 16),
        decoration: InputDecoration(
          hintText: "Search",
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(Icons.search, color: Colors.white),
        ),
        showCursor: true,
      ),
    );
  }
}
