import 'package:flutter/material.dart';
import 'package:isitcom_chess_club/core/constant/text_styles.dart';
import 'package:isitcom_chess_club/modules/matches/domain/entities/demo_user.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/size.dart';

class RankWidget extends StatelessWidget {
  final DemoUser user;

  const RankWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Container(
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
               ClipRRect(borderRadius:const BorderRadius.only(topLeft:Radius.circular(15),bottomLeft: Radius.circular(15)) , child: SizedBox(width: ConstSize.imgwidth(context)*1.2,height: ConstSize.cardHeight(context), child: Image.network(user.imgUrl,fit: BoxFit.cover,))),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                Text('${user.firstName} ${user.secondName}',style: ConstTextStyles.blackTextStyle1,),
               const SizedBox(height: 5,),
                Text('rate: ${user.rate}%',style: ConstTextStyles.blackTextStyle2,),
                               const SizedBox(height: 5,),

                Text('rank: ${user.rank}'),
          
              ]),
            ),
          ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text(user.pts.toString(),style: ConstTextStyles.blueTextStyle1),
                        ),

       ]
        ),
        
      ),
    );
    
  }
}