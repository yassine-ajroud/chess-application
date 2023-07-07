import 'package:dartz/dartz.dart';
import 'package:isitcom_chess_club/modules/matches/domain/entities/match.dart';

import '../../../../core/error/failures/failures.dart';

abstract class MatchRepository{
  Future<Either<Failure,List<Match>>>getPlayedMatches();
  Future<Either<Failure,List<Match>>>getUnplayedMatches();
}