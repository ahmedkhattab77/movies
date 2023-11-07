import 'package:flutter/material.dart';

class BrowseWidget extends StatelessWidget {
  BrowseWidget({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          'assets/images/$title.jpg',
        ),
      )),
      height: 40,
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}
