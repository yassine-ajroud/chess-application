import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:isitcom_chess_club/core/constant/api_const.dart';
import 'package:isitcom_chess_club/core/error/exceptions/exceptions.dart';
import 'package:isitcom_chess_club/modules/matches/data/models/match_model.dart';

abstract class MatchRemoteDataSource{
  Future<List<MatchModel>> getPlayedMatches();
  Future<List<MatchModel>> getUnplayedMatches();

}

class MatchRemoteDataSourceImp implements MatchRemoteDataSource{
  @override
  Future<List<MatchModel>> getPlayedMatches() async{
    try{
      final response = await http.get(Uri.parse(ApiConst.allMatches));
      final r  = jsonDecode(response.body);
      return List<MatchModel>.from((r['documents'] as List).map((e) => MatchModel.fromjson(e)).where((element) => element.completed));
    
    }catch(e){
    throw ServerException();
    }
  }

  @override
  Future<List<MatchModel>> getUnplayedMatches() async{
     try{
      final response = await http.get(Uri.parse(ApiConst.allMatches));
      final r  = jsonDecode(response.body);
      return List<MatchModel>.from((r['documents'] as List).map((e) => MatchModel.fromjson(e)).where((element) => !element.completed));
    }catch(e){
      throw ServerException();
    }
  }
}