import 'package:dartz/dartz.dart';
import 'package:isitcom_chess_club/modules/matches/domain/entities/demo_user.dart';
import 'package:isitcom_chess_club/modules/matches/domain/repositories/demo_user_rpository.dart';

import '../../../../core/error/failures/failures.dart';

class GetAllDemoUsers{
  final DemoUserRepository repository;

  GetAllDemoUsers({required this.repository});

  Future<Either<Failure, List<DemoUser>>> call()async=>await repository.getAllDemoUsers();
  
}