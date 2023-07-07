import 'package:equatable/equatable.dart';

class DemoUser extends Equatable{
  final String userId;
  final String imgUrl;
  final String firstName;
  final String secondName;
  final int rank;
  final int pts;
  final double rate;

  const DemoUser({required this.imgUrl, required this.userId, required this.firstName,required this.secondName,required this.rank,required this.pts,required this.rate});
  
  @override
  List<Object?> get props => [firstName,secondName,rank,pts,rate,userId,imgUrl];
  

}