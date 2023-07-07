import 'package:isitcom_chess_club/core/error/exceptions/exceptions.dart';
import 'package:isitcom_chess_club/core/error/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:isitcom_chess_club/modules/matches/data/datasources/remote_datasource/match_remote_datasource.dart';
import 'package:isitcom_chess_club/modules/matches/data/models/match_model.dart';
import 'package:isitcom_chess_club/modules/matches/domain/entities/match.dart';
import 'package:isitcom_chess_club/modules/matches/domain/repositories/match_repository.dart';

class MatchRepositoryImpl implements MatchRepository{
  final MatchRemoteDataSource  matchRemoteDataSource;


  MatchRepositoryImpl({required this.matchRemoteDataSource});
  
  @override
  Future<Either<Failure, List<Match>>> getPlayedMatches() async{


    try{
      final List<MatchModel> l=await matchRemoteDataSource.getPlayedMatches();
      final List<Match> res=l.map((e) => Match(matchId: e.matchId, player1: e.player1, player2: e.player2, time: e.time, tableNumber: e.tableNumber, winner: e.winner, completed: e.completed)).toList();
      return Right(res);
    }on ServerException{
      return Left(ServerFailure());
    }
  }
  
  @override
  Future<Either<Failure, List<Match>>> getUnplayedMatches() async{
     try{
      final List<MatchModel> l=await matchRemoteDataSource.getUnplayedMatches();
      final List<Match> res=l.map((e) => Match(matchId: e.matchId, player1: e.player1, player2: e.player2, time: e.time, tableNumber: e.tableNumber, winner: e.winner, completed: e.completed)).toList();
      return Right(res);
    }on ServerException{
      return Left(ServerFailure());
    }
  }
  

}