import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  String text = "";
  IconData icon; // Add this
  InfoCard(this.text, this.icon); // Edit this

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: const Color.fromARGB(255, 255, 255, 255), //<-- SEE HERE
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 4,
        child: Container(
            color: Colors.black,
            height: 80,
            width: 80,
            padding: EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                Icon(icon,
                    color: Colors.white, // edit this
                    size: 35),
                const SizedBox(height: 5),
                Text(
                  text,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            )));
  }
}
