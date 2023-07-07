import 'package:dartz/dartz.dart';
import 'package:isitcom_chess_club/modules/matches/domain/entities/demo_user.dart';

import '../../../../core/error/failures/failures.dart';

abstract class DemoUserRepository{
  Future<Either<Failure,List<DemoUser>>> getAllDemoUsers();
}