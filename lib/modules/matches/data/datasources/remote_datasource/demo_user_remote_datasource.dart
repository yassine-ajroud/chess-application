import 'dart:convert';

import 'package:isitcom_chess_club/modules/matches/data/models/demo_user_model.dart';
import 'package:http/http.dart' as http;

import '../../../../../core/constant/api_const.dart';
import '../../../../../core/error/exceptions/exceptions.dart';


abstract class DemoUserDataSource{
  Future<List<DemoUserModel>> getAllDemoUsers();
}

class DemoUserDataSourceImpl implements DemoUserDataSource{
  @override
  Future<List<DemoUserModel>> getAllDemoUsers() async{
    try{
      final response = await http.get(Uri.parse(ApiConst.allusers));
      final json = jsonDecode(response.body);
      final ls =List<DemoUserModel>.from((json["documents"] as List).map((e) => DemoUserModel.fromjson(e)));
    return ls;
    }catch(e){
    throw ServerException();
    }
  }

}