import 'package:isitcom_chess_club/modules/matches/domain/entities/demo_user.dart';

class DemoUserModel extends DemoUser{
 const DemoUserModel({required super.imgUrl ,required super.userId, required super.firstName, required super.secondName, required super.rank, required super.pts, required super.rate});
 
 
  factory DemoUserModel.fromjson(Map<String,dynamic> json)=>DemoUserModel(
   userId: json["fields"]["userId"]["stringValue"],
    imgUrl:json["fields"]["imgUrl"]["stringValue"],
    firstName:json["fields"]["firstname"]["stringValue"],
    secondName:json["fields"]["secondname"]["stringValue"],
    rank:int.parse(json["fields"]["rank"]["integerValue"]),
    pts: int.parse(json["fields"]["elo"]["integerValue"]),
    rate:json["fields"]["rate"]["doubleValue"]  
  );
  
}