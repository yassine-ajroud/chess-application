import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isitcom_chess_club/modules/matches/domain/entities/demo_user.dart';
import 'package:isitcom_chess_club/modules/matches/domain/entities/match.dart';
import 'package:isitcom_chess_club/modules/matches/presentation/widgets/match_player_info.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/size.dart';
import '../../../../core/constant/text_styles.dart';

class MatchWidget extends StatelessWidget {
  final Match match;
  final DemoUser player1;
  final DemoUser player2;

  const MatchWidget({super.key, required this.match, required this.player1, required this.player2});




  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');
    final DateFormat timeFormatter = DateFormat('HH:mm');

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
                Row(children: [const Icon(Icons.calendar_month,color: ConstColors.purpleTextColor,),Text(dateFormatter.format(DateTime.parse(match.time)),style: ConstTextStyles.purpleTextStyle4,)],),
              //  Text("Table Number 1",style: ConstTextStyles.purpleTextStyle4,),
                Row(children: [const Icon(Icons.access_time,color: ConstColors.purpleTextColor,),Text(timeFormatter.format(DateTime.parse(match.time)),style: ConstTextStyles.purpleTextStyle4,)],),
              ],
            ),
          ),

          Container(
            width: ConstSize.maxWidth(context),
            height: ConstSize.cardHeight(context),
            decoration: BoxDecoration(
              color: ConstColors.cardColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(color: Colors.grey.shade400,offset:const Offset(0,4),blurRadius: 4,spreadRadius: 0)]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                ClipRRect(borderRadius:const BorderRadius.only(topLeft:Radius.circular(15),bottomLeft: Radius.circular(15)) , child: SizedBox(width: ConstSize.imgwidth(context),height: ConstSize.cardHeight(context), child: Image.network(player1.imgUrl,fit: BoxFit.cover,))),
                MatchPlayerInfo(player: player1,),
                Container(height: ConstSize.cardHeight(context)*0.7,width: 1,color: ConstColors.blueTextColor,),
                MatchPlayerInfo(player: player2,),
                ClipRRect(borderRadius:const BorderRadius.only(topRight:Radius.circular(15),bottomRight: Radius.circular(15)) , child: SizedBox(width: ConstSize.imgwidth(context),height: ConstSize.cardHeight(context), child: Image.network(player2.imgUrl,fit: BoxFit.cover,))),

              ]
            ),
            
          ),
        ],
      ),
    );
    
  }
}