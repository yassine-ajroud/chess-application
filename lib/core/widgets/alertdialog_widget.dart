import 'package:flutter/material.dart';
import 'package:isitcom_chess_club/core/constant/text_styles.dart';

class AlertDialogWidget extends StatelessWidget {

  const AlertDialogWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('error occurs',style: ConstTextStyles.purpleTextStyle1bold,),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Please check your internet connection or try again later.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('ok',style: ConstTextStyles.purpleTextStyle1,),
            onPressed: () {
Navigator.of(context).pop();
            },
          ),
        ],
      );
  }
}