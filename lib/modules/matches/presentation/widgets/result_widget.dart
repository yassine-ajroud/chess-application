import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isitcom_chess_club/core/constant/colors.dart';
import 'package:isitcom_chess_club/core/constant/size.dart';
import 'package:isitcom_chess_club/core/constant/text_styles.dart';
import 'package:isitcom_chess_club/modules/matches/domain/entities/demo_user.dart';
import 'package:isitcom_chess_club/modules/matches/domain/entities/match.dart';

class ResultItem extends StatefulWidget {
  final DemoUser player1;
  final DemoUser player2;
  final DateTime date;
  final Match match;

  const ResultItem({super.key, required this.player1, required this.player2, required this.date, required this.match});



  @override
  State<ResultItem> createState() => _ResultItemState();
}

class _ResultItemState extends State<ResultItem> {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("${widget.player1.firstName} ${widget.player1.secondName}",style:widget.match.winner==widget.player1.userId ? ConstTextStyles.purpleTextStyle1: ConstTextStyles.blackTextStyle1),
              const SizedBox(height: 3),
              const Text('VS',style: ConstTextStyles.purpleTextStyle3,),
              const SizedBox(height: 3),
              Text("${widget.player2.firstName} ${widget.player2.secondName}",style: widget.match.winner==widget.player2.userId ? ConstTextStyles.purpleTextStyle1: ConstTextStyles.blackTextStyle1)
            ],),
             Text(formatter.format(widget.date).toString(),style: ConstTextStyles.purpleTextStyle2,)]
          ),
        ),
        
      ),
    );
    
  }
}