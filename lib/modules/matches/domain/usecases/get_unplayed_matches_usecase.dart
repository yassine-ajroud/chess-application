import 'package:dartz/dartz.dart';
import 'package:isitcom_chess_club/modules/matches/domain/entities/match.dart';
import 'package:isitcom_chess_club/modules/matches/domain/repositories/match_repository.dart';

import '../../../../core/error/failures/failures.dart';

class GetUnPlayedMatchesUseCase{
  final MatchRepository repository;

  GetUnPlayedMatchesUseCase({required this.repository});

  Future<Either<Failure,List<Match>>> call()async=>await repository.getUnplayedMatches();
  
}