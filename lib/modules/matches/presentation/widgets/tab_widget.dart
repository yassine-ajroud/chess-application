import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:isitcom_chess_club/core/constant/colors.dart';

class TabItem extends StatelessWidget {
  final String text;

  const TabItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Tab(
                   child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: ConstColors.blueTextColor, width: 1)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(text,
                    ),
                    ))
                );
  }
}