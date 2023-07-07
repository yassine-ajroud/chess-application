import 'package:flutter/material.dart';
import 'package:isitcom_chess_club/core/constant/text_styles.dart';
import 'package:isitcom_chess_club/modules/matches/domain/entities/demo_user.dart';

class MatchPlayerInfo extends StatelessWidget {
 final DemoUser player;

  const MatchPlayerInfo({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 95, child: Text(player.firstName,textAlign: TextAlign.center,overflow: TextOverflow.clip,style: ConstTextStyles.blackTextStyle2,)),
      const  SizedBox(height: 5,),
        Text("rank: ${player.rank}",style: ConstTextStyles.blackDetailTextStyle1,),
      const SizedBox(height: 2,),

        Text("elo: ${player.pts}",style: ConstTextStyles.blackDetailTextStyle1,)
      ],
    );
    
  }
}