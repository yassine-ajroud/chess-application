import 'package:flutter/material.dart';

class ClockController with ChangeNotifier{
  bool moveCounter=false;
  bool increment = false;
  String player1='';
  String player2='';


  void moveCounterToggle(bool value){
    moveCounter = value;
    notifyListeners();
  }
void incrementToggle(bool value){
    increment = value;
    notifyListeners();
  }
  void setPlayer1(name){
    player1 = name;
    notifyListeners();
  }
 void setPlayer2(name){
    player2 = name;
    notifyListeners();
  }
}