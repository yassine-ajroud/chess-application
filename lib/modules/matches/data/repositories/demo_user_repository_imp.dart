import 'package:isitcom_chess_club/modules/matches/data/datasources/remote_datasource/demo_user_remote_datasource.dart';
import 'package:isitcom_chess_club/modules/matches/data/models/demo_user_model.dart';
import 'package:isitcom_chess_club/modules/matches/domain/entities/demo_user.dart';
import 'package:isitcom_chess_club/core/error/failures/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:isitcom_chess_club/modules/matches/domain/repositories/demo_user_rpository.dart';

import '../../../../core/error/exceptions/exceptions.dart';

class DemoUserRepositoryImpl implements DemoUserRepository{
  final DemoUserDataSource demoUserDataSource;

  DemoUserRepositoryImpl({required this.demoUserDataSource});

  @override
  Future<Either<Failure, List<DemoUser>>> getAllDemoUsers() async{
    try{
      final List<DemoUserModel> l=await demoUserDataSource.getAllDemoUsers();
      final List<DemoUser> res=l.map((e) => DemoUser(imgUrl: e.imgUrl, userId: e.userId, firstName: e.firstName, secondName: e.secondName, rank: e.rank, pts: e.pts, rate: e.rate)).toList();
      return Right(res);
    }on ServerException{
      return Left(ServerFailure());
    }
        
  }

 
}