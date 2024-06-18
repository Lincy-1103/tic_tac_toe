import 'package:flutter/material.dart';

class GameOver extends StatelessWidget {
 final int player;

 GameOver({Key? key, required this.player}) : super(key: key);

 @override
 Widget build(BuildContext context) {
    return Center(
          child: AlertDialog(
            alignment: Alignment.bottomCenter,
            content: Column(
              mainAxisSize: MainAxisSize.min, // This makes the dialog height adjust to its content
              children: <Widget>[
                Text('Game Over',style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 10), // Add some space between the title and the content
                Text((player!=0)?'Player $player wins!':"It's a Draw!"),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                 Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          ),
        );

 }
}