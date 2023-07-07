
import 'package:get_it/get_it.dart';
import 'package:isitcom_chess_club/core/controller/drawer_controller.dart';
import 'package:isitcom_chess_club/modules/matches/data/datasources/remote_datasource/demo_user_remote_datasource.dart';
import 'package:isitcom_chess_club/modules/matches/data/datasources/remote_datasource/match_remote_datasource.dart';
import 'package:isitcom_chess_club/modules/matches/data/repositories/demo_user_repository_imp.dart';
import 'package:isitcom_chess_club/modules/matches/data/repositories/match_repository_imp.dart';
import 'package:isitcom_chess_club/modules/matches/domain/repositories/demo_user_rpository.dart';
import 'package:isitcom_chess_club/modules/matches/domain/repositories/match_repository.dart';

GetIt sl=GetIt.instance;

class Di{
 static void init(){
    //repository
    sl.registerLazySingleton<MatchRepository>(() => MatchRepositoryImpl(matchRemoteDataSource: sl()));
    sl.registerLazySingleton<DemoUserRepository>(() => DemoUserRepositoryImpl(demoUserDataSource:sl(),));
    
    //core

    //datasource
    sl.registerLazySingleton<MatchRemoteDataSource>(() => MatchRemoteDataSourceImp());
    sl.registerLazySingleton<DemoUserDataSource>(() => DemoUserDataSourceImpl());

  }
}