import 'package:equatable/equatable.dart';

class Match extends Equatable{

  final int matchId;
  final String player1;
  final String player2;
  final String time;
  final int tableNumber;
  final String winner;
  final bool completed;

  const Match(
    {
      required this.matchId,
      required this.player1, 
      required this.player2,
      required this.time,
      required this.tableNumber,
      required this.winner,
      required this.completed});
      
        @override
        // TODO: implement props
        List<Object?> get props => [matchId,player1,player2,time,tableNumber,winner,completed];
  


}