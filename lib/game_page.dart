import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tic_tac_toe/game_over.dart';

class GamePage extends StatefulWidget {
  GamePage({super.key});
  int player = 1;
  int player1Score = 0;
  int player2Score = 0;
  int turn = 0;
  String sign11 = '';
  String sign12 = '';
  String sign13 = '';
  String sign21 = '';
  String sign22 = '';
  String sign23 = '';
  String sign31 = '';
  String sign32 = '';
  String sign33 = '';

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  void resetGame() {
    setState(() {
      widget.player = 1;
      widget.turn = 0;
      widget.sign11 = '';
      widget.sign12 = '';
      widget.sign13 = '';
      widget.sign21 = '';
      widget.sign22 = '';
      widget.sign23 = '';
      widget.sign31 = '';
      widget.sign32 = '';
      widget.sign33 = '';
    });
  }

  void evaluate() {
    int player = 0;
    if ((widget.sign11 == widget.sign12 &&
            widget.sign12 == widget.sign13 &&
            widget.sign12 != "") ||
        (widget.sign21 == widget.sign22 &&
            widget.sign22 == widget.sign23 &&
            widget.sign22 != "") ||
        (widget.sign31 == widget.sign32 &&
            widget.sign32 == widget.sign33 &&
            widget.sign32 != "") ||
        (widget.sign11 == widget.sign21 &&
            widget.sign21 == widget.sign31 &&
            widget.sign21 != "") ||
        (widget.sign12 == widget.sign22 &&
            widget.sign22 == widget.sign32 &&
            widget.sign22 != "") ||
        (widget.sign13 == widget.sign23 &&
            widget.sign23 == widget.sign33 &&
            widget.sign23 != "") ||
        (widget.sign11 == widget.sign22 &&
            widget.sign22 == widget.sign33 &&
            widget.sign22 != "") ||
        (widget.sign13 == widget.sign22 &&
            widget.sign22 == widget.sign31 &&
            widget.sign22 != "")) {
      if (widget.player == 1) {
        widget.player2Score++;
        player = 2;
        // showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return GameOver(player: player);
        //     });
        Fluttertoast.showToast(
            msg: "Player 2 wins!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM_LEFT,
            timeInSecForIosWeb: 2,
            textColor: Colors.black,
            backgroundColor: const Color(0xFF7F5AF0),
            webBgColor: "rgb(105,240,174)",
            webShowClose: true,
            fontSize: 16.0);

        resetGame();
      } else {
        widget.player1Score++;
        player = 1;
        // showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return GameOver(player: player);
        //     });
        Fluttertoast.showToast(
            msg: "Player 1 wins!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM_LEFT,
            timeInSecForIosWeb: 2,
            textColor: Colors.black,
            backgroundColor: const Color(0xFF7F5AF0),
            webBgColor: "rgb(105,240,174)",
            webShowClose: true,
            fontSize: 16.0);

        resetGame();
      }
    } else {
      if (widget.turn == 9) {
        // showDialog(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return GameOver(player: player);
        //     });
        Fluttertoast.showToast(
            msg: "It's a Draw!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM_LEFT,
            timeInSecForIosWeb: 2,
            textColor: Colors.black,
            backgroundColor: const Color(0xFF7F5AF0),
            webBgColor: "rgb(105,240,174)",
            webShowClose: true,
            fontSize: 16.0);
        resetGame();
      }
    }
  }

  newGame() {
    resetGame();
    int winner = (widget.player1Score > widget.player2Score) ? 1 : 2;
    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return GameOver(player: winner);
    //     });
    if ((widget.player1Score == widget.player2Score)) {
       Fluttertoast.showToast(
          msg: "It's a Draw!!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM_LEFT,
          timeInSecForIosWeb: 5,
          textColor: Colors.black,
            backgroundColor: const Color(0xFF7F5AF0),
          webBgColor: "rgb(105,240,174)",
          webShowClose: true,
          fontSize: 25.0);
    } else {
      Fluttertoast.showToast(
          msg: "Player $winner won the game!!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM_LEFT,
          timeInSecForIosWeb: 5,
          textColor: Colors.black,
            backgroundColor: const Color(0xFF7F5AF0),
          webBgColor: "rgb(105,240,174)",
          webShowClose: true,
          fontSize: 25.0);
    }
    widget.player1Score = 0;
    widget.player2Score = 0;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double padding;
    double tpadding;
    double squareSize; // Assuming a 3x3 grid
    double xoSize;
    // Calculate padding based on screen size
    if (screenWidth < screenHeight) {
      padding = screenWidth * 0.3;
      tpadding = screenHeight * 0.2;
      squareSize = screenWidth / 5; // Assuming a 3x3 grid
      xoSize = screenWidth * 0.1;
    } else {
      padding = screenHeight * 0.3;
      tpadding = screenWidth * 0.2;
      squareSize = screenWidth / 15; // Assuming a 3x3 grid
      xoSize = screenWidth * 0.05;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Tic-Tac-Toe",
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/background.jpg'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/x image.png'), // Replace with your image asset
                            radius: 30, // Adjust the size of the avatar
                          ),
                          Text(
                            'Player 1 ', // Your text goes here
                            style: TextStyle(
                                fontSize: 20,
                                color:
                                    Colors.white), // Style your text as needed
                          ),
                          Text(
                            widget.player1Score
                                .toString(), // Your text goes here
                            style: TextStyle(
                                fontSize: 20,
                                color:
                                    Colors.white), // Style your text as needed
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                                'assets/o image.png'), // Replace with your image asset
                            radius: 30, // Adjust the size of the avatar
                          ),
                          Text(
                            'Player 2 ', // Your text goes here
                            style: TextStyle(
                                fontSize: 20,
                                color:
                                    Colors.white), // Style your text as needed
                          ),
                          Text(
                            widget.player2Score
                                .toString(), // Your text goes here
                            style: TextStyle(
                                fontSize: 20,
                                color:
                                    Colors.white), // Style your text as needed
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (widget.sign11 == '') {
                            widget.turn++;
                            if (widget.player == 1) {
                              widget.sign11 = 'X';
                              setState(() {
                                widget.player = 2;
                              });
                            } else {
                              widget.sign11 = 'O';
                              setState(() {
                                widget.player = 1;
                              });
                            }
                            if (widget.turn >= 5) {
                              evaluate();
                            }
                          }
                        },
                        child: Card(
                          child: Container(
                            width: squareSize, // Set the width of the square
                            height: squareSize, // Set the height of the square
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                      1), // Shadow color with opacity
                                  spreadRadius: 1, // Spread radius
                                  blurRadius: 1, // Blur radius
                                  offset: Offset(
                                      0, 3), // Changes position of shadow
                                ),
                              ], // Set the color of the square
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Colors.black,
                                  width: 1.0), // Optional: Add a border
                            ),
                            child: Center(
                              child: Text(
                                widget.sign11, // Display the alphabet here
                                style: TextStyle(
                                  fontSize:
                                      xoSize, // Adjust the font size as needed
                                  color: widget.sign11 == 'X'
                                      ? Colors.green
                                      : Colors.red, // Set the color of the text
                                  fontWeight:
                                      FontWeight.bold, // Make the text bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (widget.sign12 == '') {
                            widget.turn++;
                            if (widget.player == 1) {
                              widget.sign12 = 'X';
                              setState(() {
                                widget.player = 2;
                              });
                            } else {
                              widget.sign12 = 'O';
                              setState(() {
                                widget.player = 1;
                              });
                            }
                            if (widget.turn >= 5) {
                              evaluate();
                            }
                          }
                        },
                        child: Card(
                          child: Container(
                            width: squareSize, // Set the width of the square
                            height: squareSize, // Set the height of the square
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                      1), // Shadow color with opacity
                                  spreadRadius: 1, // Spread radius
                                  blurRadius: 1, // Blur radius
                                  offset: Offset(
                                      0, 3), // Changes position of shadow
                                ),
                              ], // Set the color of the square
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Colors.black,
                                  width: 1.0), // Optional: Add a border
                            ),
                            child: Center(
                              child: Text(
                                widget.sign12, // Display the alphabet here
                                style: TextStyle(
                                  fontSize:
                                      xoSize, // Adjust the font size as needed
                                  color: widget.sign12 == 'X'
                                      ? Colors.green
                                      : Colors.red, // Set the color of the text
                                  fontWeight:
                                      FontWeight.bold, // Make the text bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            if (widget.sign13 == '') {
                              widget.turn++;
                              if (widget.player == 1) {
                                widget.sign13 = 'X';
                                setState(() {
                                  widget.player = 2;
                                });
                              } else {
                                widget.sign13 = 'O';
                                setState(() {
                                  widget.player = 1;
                                });
                              }
                              if (widget.turn >= 5) {
                                evaluate();
                              }
                            }
                          },
                          child: Card(
                            child: Container(
                              width: squareSize, // Set the width of the square
                              height:
                                  squareSize, // Set the height of the square
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(
                                        1), // Shadow color with opacity
                                    spreadRadius: 1, // Spread radius
                                    blurRadius: 1, // Blur radius
                                    offset: Offset(
                                        0, 3), // Changes position of shadow
                                  ),
                                ], // Set the color of the square
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    color: Colors.black,
                                    width: 1.0), // Optional: Add a border
                              ),
                              child: Center(
                                child: Text(
                                  widget.sign13, // Display the alphabet here
                                  style: TextStyle(
                                    fontSize:
                                        xoSize, // Adjust the font size as needed
                                    color: widget.sign13 == 'X'
                                        ? Colors.green
                                        : Colors
                                            .red, // Set the color of the text
                                    fontWeight:
                                        FontWeight.bold, // Make the text bold
                                  ),
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            if (widget.sign21 == '') {
                              widget.turn++;
                              if (widget.player == 1) {
                                widget.sign21 = 'X';
                                setState(() {
                                  widget.player = 2;
                                });
                              } else {
                                widget.sign21 = 'O';
                                setState(() {
                                  widget.player = 1;
                                });
                              }
                              if (widget.turn >= 5) {
                                evaluate();
                              }
                            }
                          },
                          child: Card(
                            child: Container(
                              width: squareSize, // Set the width of the square
                              height:
                                  squareSize, // Set the height of the square
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(
                                        1), // Shadow color with opacity
                                    spreadRadius: 1, // Spread radius
                                    blurRadius: 1, // Blur radius
                                    offset: Offset(
                                        0, 3), // Changes position of shadow
                                  ),
                                ], // Set the color of the square
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    color: Colors.black,
                                    width: 1.0), // Optional: Add a border
                              ),
                              child: Center(
                                child: Text(
                                  widget.sign21, // Display the alphabet here
                                  style: TextStyle(
                                    fontSize:
                                        xoSize, // Adjust the font size as needed
                                    color: widget.sign21 == 'X'
                                        ? Colors.green
                                        : Colors
                                            .red, // Set the color of the text
                                    fontWeight:
                                        FontWeight.bold, // Make the text bold
                                  ),
                                ),
                              ),
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            if (widget.sign22 == '') {
                              widget.turn++;
                              if (widget.player == 1) {
                                widget.sign22 = 'X';
                                setState(() {
                                  widget.player = 2;
                                });
                              } else {
                                widget.sign22 = 'O';
                                setState(() {
                                  widget.player = 1;
                                });
                              }
                              if (widget.turn >= 5) {
                                evaluate();
                              }
                            }
                          },
                          child: Card(
                            child: Container(
                              width: squareSize, // Set the width of the square
                              height:
                                  squareSize, // Set the height of the square
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(
                                        1), // Shadow color with opacity
                                    spreadRadius: 1, // Spread radius
                                    blurRadius: 1, // Blur radius
                                    offset: Offset(
                                        0, 3), // Changes position of shadow
                                  ),
                                ], // Set the color of the square
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    color: Colors.black,
                                    width: 1.0), // Optional: Add a border
                              ),
                              child: Center(
                                child: Text(
                                  widget.sign22, // Display the alphabet here
                                  style: TextStyle(
                                    fontSize:
                                        xoSize, // Adjust the font size as needed
                                    color: widget.sign22 == 'X'
                                        ? Colors.green
                                        : Colors
                                            .red, // Set the color of the text
                                    fontWeight:
                                        FontWeight.bold, // Make the text bold
                                  ),
                                ),
                              ),
                            ),
                          )),
                      GestureDetector(
                          onTap: () {
                            if (widget.sign23 == '') {
                              widget.turn++;
                              if (widget.player == 1) {
                                widget.sign23 = 'X';
                                setState(() {
                                  widget.player = 2;
                                });
                              } else {
                                widget.sign23 = 'O';
                                setState(() {
                                  widget.player = 1;
                                });
                              }
                              if (widget.turn >= 5) {
                                evaluate();
                              }
                            }
                          },
                          child: Card(
                            child: Container(
                              width: squareSize, // Set the width of the square
                              height:
                                  squareSize, // Set the height of the square
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(
                                        1), // Shadow color with opacity
                                    spreadRadius: 1, // Spread radius
                                    blurRadius: 1, // Blur radius
                                    offset: Offset(
                                        0, 3), // Changes position of shadow
                                  ),
                                ], // Set the color of the square
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    color: Colors.black,
                                    width: 1.0), // Optional: Add a border
                              ),
                              child: Center(
                                child: Text(
                                  widget.sign23, // Display the alphabet here
                                  style: TextStyle(
                                    fontSize:
                                        xoSize, // Adjust the font size as needed
                                    color: widget.sign23 == 'X'
                                        ? Colors.green
                                        : Colors
                                            .red, // Set the color of the text
                                    fontWeight:
                                        FontWeight.bold, // Make the text bold
                                  ),
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            if (widget.sign31 == '') {
                              widget.turn++;
                              if (widget.player == 1) {
                                widget.sign31 = 'X';
                                setState(() {
                                  widget.player = 2;
                                });
                              } else {
                                widget.sign31 = 'O';
                                setState(() {
                                  widget.player = 1;
                                });
                              }
                              if (widget.turn >= 5) {
                                evaluate();
                              }
                            }
                          },
                          child: Card(
                            child: Container(
                              width: squareSize, // Set the width of the square
                              height:
                                  squareSize, // Set the height of the square
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(
                                        1), // Shadow color with opacity
                                    spreadRadius: 1, // Spread radius
                                    blurRadius: 1, // Blur radius
                                    offset: Offset(
                                        0, 3), // Changes position of shadow
                                  ),
                                ], // Set the color of the square
                                border: Border.all(
                                    style: BorderStyle.solid,
                                    color: Colors.black,
                                    width: 1.0), // Optional: Add a border
                              ),
                              child: Center(
                                child: Text(
                                  widget.sign31, // Display the alphabet here
                                  style: TextStyle(
                                    fontSize:
                                        xoSize, // Adjust the font size as needed
                                    color: widget.sign31 == 'X'
                                        ? Colors.green
                                        : Colors
                                            .red, // Set the color of the text
                                    fontWeight:
                                        FontWeight.bold, // Make the text bold
                                  ),
                                ),
                              ),
                            ),
                          )),
                      GestureDetector(
                        onTap: () {
                          if (widget.sign32 == '') {
                            widget.turn++;
                            if (widget.player == 1) {
                              widget.sign32 = 'X';
                              setState(() {
                                widget.player = 2;
                              });
                            } else {
                              widget.sign32 = 'O';
                              setState(() {
                                widget.player = 1;
                              });
                            }
                            if (widget.turn >= 5) {
                              evaluate();
                            }
                          }
                        },
                        child: Card(
                          child: Container(
                            width: squareSize, // Set the width of the square
                            height: squareSize, // Set the height of the square
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                      1), // Shadow color with opacity
                                  spreadRadius: 1, // Spread radius
                                  blurRadius: 1, // Blur radius
                                  offset: Offset(
                                      0, 3), // Changes position of shadow
                                ),
                              ], // Set the color of the square
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Colors.black,
                                  width: 1.0), // Optional: Add a border
                            ),
                            child: Center(
                              child: Text(
                                widget.sign32, // Display the alphabet here
                                style: TextStyle(
                                  fontSize:
                                      xoSize, // Adjust the font size as needed
                                  color: widget.sign32 == 'X'
                                      ? Colors.green
                                      : Colors.red, // Set the color of the text
                                  fontWeight:
                                      FontWeight.bold, // Make the text bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (widget.sign33 == '') {
                            widget.turn++;
                            if (widget.player == 1) {
                              widget.sign33 = 'X';
                              setState(() {
                                widget.player = 2;
                              });
                            } else {
                              widget.sign33 = 'O';
                              setState(() {
                                widget.player = 1;
                              });
                            }
                            if (widget.turn >= 5) {
                              evaluate();
                            }
                          }
                        },
                        child: Card(
                          child: Container(
                            width: squareSize, // Set the width of the square
                            height: squareSize, // Set the height of the square
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(
                                      1), // Shadow color with opacity
                                  spreadRadius: 1, // Spread radius
                                  blurRadius: 1, // Blur radius
                                  offset: Offset(
                                      0, 3), // Changes position of shadow
                                ),
                              ], // Set the color of the square
                              border: Border.all(
                                  style: BorderStyle.solid,
                                  color: Colors.black,
                                  width: 1.0), // Optional: Add a border
                            ),
                            child: Center(
                              child: Text(
                                widget.sign33, // Display the alphabet here
                                style: TextStyle(
                                  fontSize:
                                      xoSize, // Adjust the font size as needed
                                  color: widget.sign33 == 'X'
                                      ? Colors.green
                                      : Colors.red, // Set the color of the text
                                  fontWeight:
                                      FontWeight.bold, // Make the text bold
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  child: Text("New Game"), onPressed: () => newGame())
            ],
          ),
        ],
      ),
    );
  }
}
