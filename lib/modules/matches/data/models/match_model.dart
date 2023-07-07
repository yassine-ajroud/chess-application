import 'package:isitcom_chess_club/modules/matches/domain/entities/match.dart';

class MatchModel extends Match {
  const MatchModel(
      {required super.matchId,
      required super.player1,
      required super.player2,
      required super.time,
      required super.tableNumber,
      required super.winner,
      required super.completed});

  factory MatchModel.fromjson(Map<String, dynamic> json) => MatchModel(
      matchId: int.parse(json['fields']['matchid']['integerValue']),
      player1: json['fields']['player1']['stringValue'],
      player2: json['fields']['player2']['stringValue'],
      time:json['fields']['date']['stringValue'],
      tableNumber: int.parse(json['fields']['tableNumber']['integerValue']),
      winner: json['fields']['winner']['stringValue'],
      completed: json['fields']['completed']['booleanValue']);
}
