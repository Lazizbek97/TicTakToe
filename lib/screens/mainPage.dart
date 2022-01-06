import 'package:flutter/material.dart';
import 'calculations.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  bool yourTurn = false;
  int numOfTry = 0;
  bool isGameEnd = false;
  List pressed = [];
  List gif = [
    'https://i.pinimg.com/originals/f5/05/24/f50524ee5f161f437400aaf215c9e12f.jpg',
    'https://i.pinimg.com/originals/f5/05/24/f50524ee5f161f437400aaf215c9e12f.jpg',
    'https://i.pinimg.com/originals/f5/05/24/f50524ee5f161f437400aaf215c9e12f.jpg',
    'https://i.pinimg.com/originals/f5/05/24/f50524ee5f161f437400aaf215c9e12f.jpg',
    'https://i.pinimg.com/originals/f5/05/24/f50524ee5f161f437400aaf215c9e12f.jpg',
    'https://i.pinimg.com/originals/f5/05/24/f50524ee5f161f437400aaf215c9e12f.jpg',
    'https://i.pinimg.com/originals/f5/05/24/f50524ee5f161f437400aaf215c9e12f.jpg',
    'https://i.pinimg.com/originals/f5/05/24/f50524ee5f161f437400aaf215c9e12f.jpg',
    'https://i.pinimg.com/originals/f5/05/24/f50524ee5f161f437400aaf215c9e12f.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      body: Container(
        margin: const EdgeInsets.only(top: 60),
        // height: MediaQuery.of(context).size.height * 0.7,
        // width: MediaQuery.of(context).size.height * 0.7,
        child: GridView.builder(
          itemCount: 9,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // ? write your answer
                if (yourTurn) {
                  // ? check if once pressed button
                  doesPressed(index, 'O');
                  // ? is all attemts used
                  if (numOfTry == 9) {
                    isGameEnd = true;
                  }
                  // ? did anyone win

                  if (Calculation.findWinner('O', index, isGameEnd) != 'N') {
                    awesomDialog(Calculation.findWinner('O', index, isGameEnd));
                  }

                  yourTurn = false;
                  setState(() {});
                } else {
                  // ? check if once pressed button
                  doesPressed(index, 'X');
                  // ? is all attemts used

                  if (numOfTry == 9) {
                    isGameEnd = true;
                  }
                  // ? did anyone win

                  if (Calculation.findWinner('X', index, isGameEnd) != 'N') {
                    awesomDialog(Calculation.findWinner('X', index, isGameEnd));
                  }

                  yourTurn = true;
                  setState(() {});
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.green.shade400,
                    border: Border.all(width: 2, color: Colors.black)),
                height: MediaQuery.of(context).size.width * 0.33,
                width: MediaQuery.of(context).size.width * 0.33,
                child: Image.network(
                  "${gif[index]}", //
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  doesPressed(int index, String checker) {
    if (pressed.contains(index)) {
      null;
    } else {
      pressed.add(index);
      numOfTry += 1;
      if (checker == 'X') {
        gif[index] = Calculation.x;
      } else {
        gif[index] = Calculation.o;
      }
    }
  }

  awesomDialog(String text) => AwesomeDialog(
        context: context,
        dialogType: DialogType.INFO,
        animType: AnimType.BOTTOMSLIDE,
        title: '$text',
        desc: 'Thank you for your attemts',
        btnOkOnPress: () {
          gif = [
            'https://i.pinimg.com/originals/f5/05/24/f50524ee5f161f437400aaf215c9e12f.jpg',
            'https://i.pinimg.com/originals/f5/05/24/f50524ee5f161f437400aaf215c9e12f.jpg',
            'https://i.pinimg.com/originals/f5/05/24/f50524ee5f161f437400aaf215c9e12f.jpg',
            'https://i.pinimg.com/originals/f5/05/24/f50524ee5f161f437400aaf215c9e12f.jpg',
            'https://i.pinimg.com/originals/f5/05/24/f50524ee5f161f437400aaf215c9e12f.jpg',
            'https://i.pinimg.com/originals/f5/05/24/f50524ee5f161f437400aaf215c9e12f.jpg',
            'https://i.pinimg.com/originals/f5/05/24/f50524ee5f161f437400aaf215c9e12f.jpg',
            'https://i.pinimg.com/originals/f5/05/24/f50524ee5f161f437400aaf215c9e12f.jpg',
            'https://i.pinimg.com/originals/f5/05/24/f50524ee5f161f437400aaf215c9e12f.jpg',
          ];
          Calculation.matrix = [
            ['', '', ''],
            ['', '', ''],
            ['', '', ''],
          ];
          numOfTry = 0;
          pressed.clear();
          isGameEnd = false;
          setState(() {});
        },
      )..show();
}
