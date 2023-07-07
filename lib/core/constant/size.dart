import 'package:flutter/material.dart';

class ConstSize{
    static double maxheight(BuildContext context)=>MediaQuery.of(context).size.height * 0.9;

  static double maxWidth(BuildContext context)=>MediaQuery.of(context).size.width * 0.9;
  static double imgwidth(BuildContext context)=>MediaQuery.of(context).size.width * 0.2;

  static double cardHeight(BuildContext context)=>MediaQuery.of(context).size.height * 0.15;
    static double horizontalPadding=15.0;
    static double verticalalPadding=10.0;



}