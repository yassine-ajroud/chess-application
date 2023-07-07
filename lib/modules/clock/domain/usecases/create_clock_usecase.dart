import 'package:dartz/dartz.dart';
import 'package:isitcom_chess_club/modules/clock/domain/repository/clock_repository.dart';

import '../../../../core/error/failures/failures.dart';
import '../entities/clock.dart';

class CreateClockUsecase{
  final ClockRepository repository;

  CreateClockUsecase(this.repository);
    Either<Failure,Clock> call({required String player1,required String player2,required int time,required int inc,required bool moveCounter,required bool increment}){
      return repository.createClock(player1: player1,player2: player2,time: time,inc: inc,moveCounter: moveCounter,increment: increment);
    }


}