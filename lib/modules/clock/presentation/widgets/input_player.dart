import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:isitcom_chess_club/modules/clock/presentation/controllers/clockController.dart';
import 'package:provider/provider.dart';

import '../../../../core/constant/colors.dart';
import '../../../../core/constant/size.dart';
import '../../../../core/constant/text_styles.dart';

class InputPlayerClock extends StatelessWidget {
  final String title,hint;


  const InputPlayerClock({Key? key,required this.hint,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('$title: ', style: ConstTextStyles.purpleTextStyle2),
        const SizedBox(width: 10,),
        SizedBox(
          width: ConstSize.maxWidth(context) / 2,
          child: TextField(
            onChanged: (value){
              title =='Player 1' ? Provider.of<ClockController>(context,listen: false).setPlayer1(value):
              Provider.of<ClockController>(context,listen: false).setPlayer2(value);
            //  print('p1: ${ Provider.of<ClockController>(context).player1}');
              //print('\np2: ${ Provider.of<ClockController>(context).player2}');

              },
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: ConstColors.purpleTextColor, width: 1.0),
                  borderRadius: BorderRadius.circular(15)),
              enabledBorder: OutlineInputBorder(
                  borderSide:const BorderSide(
                      color: ConstColors.purpleTextColor, width: 1.0),
                  borderRadius: BorderRadius.circular(15)),
              hintStyle: ConstTextStyles.hintTextStyle,
              hintText: hint,
            ),
          ),
        )
      ],
    );
  }
}
