import 'package:isitcom_chess_club/modules/clock/domain/entities/clock.dart';
import 'package:isitcom_chess_club/core/error/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:isitcom_chess_club/modules/clock/domain/repository/clock_repository.dart';

class ClockRepositoryImp implements ClockRepository{
  @override
  Either<Failure, Clock> createClock({required String player1,required String player2,required int time,required int inc,required bool moveCounter,required bool increment}) {
    try{
      return right(Clock(player1: player1, player2: player2, time: time, inc: inc, movecounter: moveCounter, increment: increment));
    }catch(e){
      return left(ClockCreationFailure());
    }
  }
}