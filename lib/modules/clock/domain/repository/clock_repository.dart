import 'package:dartz/dartz.dart';
import 'package:isitcom_chess_club/core/error/failures/failures.dart';
import 'package:isitcom_chess_club/modules/clock/domain/entities/clock.dart';

abstract class ClockRepository{
  Either<Failure,Clock> createClock({required String player1,required String player2,required int time,required int inc,required bool moveCounter,required bool increment});
}