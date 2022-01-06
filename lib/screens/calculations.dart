import 'package:flutter/material.dart';

class Calculation {
  static String x =
      'https://media0.giphy.com/media/RX0SZtMzNQkxy/giphy.gif?cid=ecf05e47qaw6h2n2jpkmczfmcmi9qgdozfc18wdh3b3te2hp&rid=giphy.gif&ct=g';
  static String o =
      'https://media0.giphy.com/media/l0ExuTvQUYoEtzPTG/giphy.gif?cid=ecf05e476kahhj3h2opte00h1c0acovlj9xn4hutfty44daw&rid=giphy.gif&ct=g';
  static List matrix = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ];
  static String r1 = '';
  static String r2 = '';
  static String r3 = '';
  static String c1 = '';
  static String c2 = '';
  static String c3 = '';
  static String d1 = '';
  static String d2 = '';

  static checkReplys(bool isEnd) {
    r1 = '';
    r2 = '';
    r3 = '';
    c1 = '';
    c2 = '';
    c3 = '';
    d1 = '';
    d2 = '';
    for (var i = 0; i < matrix.length; i++) {
      d1 += matrix[i][i];
      d2 += matrix[i][matrix.length - 1 - i];
      c1 += matrix[i][0];
      c2 += matrix[i][1];
      c3 += matrix[i][2];

      for (var j = 0; j < matrix.length; j++) {
        if (i == 0) {
          r1 += matrix[0][j];
        } else if (i == 1) {
          r2 += matrix[1][j];
        } else if (i == 2) {
          r3 += matrix[2][j];
        }
      }
    }

    if (d1 == 'OOO' ||
        d2 == 'OOO' ||
        r1 == 'OOO' ||
        r2 == 'OOO' ||
        r3 == 'OOO' ||
        c1 == 'OOO' ||
        c2 == 'OOO' ||
        c3 == 'OOO') {
      return "O won";
    } else if (d1 == 'XXX' ||
        d2 == 'XXX' ||
        r1 == 'XXX' ||
        r2 == 'XXX' ||
        r3 == 'XXX' ||
        c1 == 'XXX' ||
        c2 == 'XXX' ||
        c3 == 'XXX') {
      return "X won";
    } else {
      if (isEnd) {
        return "Drow";
      } else {
        return "N";
      }
    }
  }

  static findWinner(String reply, int index, bool isEnd) {
    switch (index) {
      case 0:
        Calculation.matrix[0][0] = reply;

        break;
      case 1:
        Calculation.matrix[0][1] = reply;

        break;
      case 2:
        Calculation.matrix[0][2] = reply;

        break;
      case 3:
        Calculation.matrix[1][0] = reply;

        break;
      case 4:
        Calculation.matrix[1][1] = reply;

        break;
      case 5:
        Calculation.matrix[1][2] = reply;

        break;

      case 6:
        Calculation.matrix[2][0] = reply;

        break;
      case 7:
        Calculation.matrix[2][1] = reply;

        break;
      case 8:
        Calculation.matrix[2][2] = reply;

        break;

      default:
    }
    debugPrint("$matrix");

    if (isEnd) {
      return checkReplys(isEnd);
    } else {
      if (checkReplys(isEnd) == "X won" || checkReplys(isEnd) == "O won") {
        return checkReplys(isEnd);
      } else {
        return 'N';
      }
    }
  }
}
