import 'package:equatable/equatable.dart';

class Clock extends Equatable{
  final String player1,player2;
  final int time,inc;
  final bool movecounter,increment;

  const Clock({required this.player1,required this.player2,required this.time,required this.inc,required this.movecounter,required this.increment});
  
  @override
  List<Object?> get props =>[player1,player2,time,inc,movecounter,increment];

}